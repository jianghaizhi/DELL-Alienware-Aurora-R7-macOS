/*
 * INTEL CONFIDENTIAL
 * Copyright 2011 - 2013 Intel Corporation All Rights Reserved.
 *
 * The source code contained or described herein and all documents related
 * to the source code ("Material") are owned by Intel Corporation or its
 * suppliers or licensors. Title to the Material remains with Intel Corporation
 * or its suppliers and licensors. The Material may contain trade secrets and
 * proprietary and confidential information of Intel Corporation and its
 * suppliers and licensors, and is protected by worldwide copyright and trade
 * secret laws and treaty provisions. No part of the Material may be used,
 * copied, reproduced, modified, published, uploaded, posted, transmitted,
 * distributed, or disclosed in any way without Intel's prior express written
 * permission.
 *
 * No license under any patent, copyright, trade secret or other intellectual
 * property right is granted to or conferred upon you by disclosure or delivery
 * of the Materials, either expressly, by implication, inducement, estoppel or
 * otherwise. Any license under such intellectual property rights must be
 * express and approved by Intel in writing.
 *
 * Unless otherwise agreed by Intel in writing, you may not remove or alter
 * this notice or any other notice embedded in Materials by Intel or Intel's
 * suppliers or licensors in any way.
 */
 
#ifndef _EnergyLib
#define _EnergyLib

#ifdef __cplusplus
extern "C" {
#endif

// macOS specific -- begin
#include <stdint.h>
#include <stdbool.h>

#define MSR_FUNC_FREQ  0
#define MSR_FUNC_POWER 1
#define MSR_FUNC_TEMP  2
#define MSR_FUNC_LIMIT 3

void SetPollingPeriod(double seconds);
// macOS specific -- end

// Initialize the library and the library calculates processor topology
// It reads the MSRs from msrConfig.txt where the executable is.
bool IntelEnergyLibInitialize();
void IntelEnergyLibShutdown();
bool ReservedFunc0(void *a, void *b, void *c);
bool GetNumNodes(int *nNodes);
bool GetNumMsrs(int *nMsr);
bool GetMsrName(int iMsr, char *szName);
bool GetMsrFunc(int iMsr, int *pFuncID);

// Generic function to read and write to MSR
//		iNode is the package number 0, 1, 2, ... etc.
//		and the library converts it to proper processor id.

// IA Frequency and TDP comes from an individual MSR and
// can be calculated immediately.
bool GetIAFrequency(int iNode, int *freqInMHz);
bool GetGTFrequency(int *freq);
bool GetGpuMaxFrequency(int *freq);
bool GetTDP(int iNode, double *TDP);

// Temperature Information
bool GetMaxTemperature(int iNode, int *degreeC);
bool GetThresholds(int iNode, int *degree1C, int *degree2C);
bool GetTemperature(int iNode, int *degreeC);

// Power data needs 2 energy samples.
// All the power data is calculated from 2 consecutive ReadSample() call.
// Read Sample reads a set of MSRs as defined in msrConfig.txt
bool ReadSample();
bool GetSysTime(void *pSysTime);
bool GetTimeInterval(double *pOffset);
bool GetBaseFrequency(int iNode, double *pBaseFrequency);

// GetPowerData calculates all the data converted from MSRs.
// If iMSR is an energy MSR, it calculates 3 values
//		- power in Watt
//		- energy in Joules
//		- energy in mWh
// Otherwise, it returns 1 value.
bool GetPowerData(int iNode, int iMSR, double *pResult, int *nResult);

// Start logging
// Call ReadSample as many as you want between StartLog and StopLog
// in order to get more than start and stop samples.
bool StartLog(char *szFileName);

// Stop logging and dump the log to the file.
bool StopLog();

//Returns true if GT is available, else returns false
bool IsGTAvailable();

// Returns true if we have platform energy MSRs available
bool IsPlatformEnergyAvailable();

// Returns true if we have platform energy MSRs available
bool IsDramEnergyAvailable();

// returns the GPU utilization if it exists
bool GetGPUUtilization(float *util);

// Calculate and retrieve CPU utilization
bool GetCpuUtilization(int iNode, int *util);

#ifdef __cplusplus
}
#endif 

#endif
