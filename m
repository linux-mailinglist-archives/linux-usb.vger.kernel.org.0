Return-Path: <linux-usb+bounces-22225-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE116A732EF
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 14:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4FEE189E00F
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 13:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E522163BB;
	Thu, 27 Mar 2025 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="PFtKJR3G"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound-ip8b.ess.barracuda.com (outbound-ip8b.ess.barracuda.com [209.222.82.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54EC215F4B
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 13:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080509; cv=fail; b=DgLdw71WOk4l8+mhItuWU2yXQdfREhx3WzJWuE9hGnPJS8DUgiVQSGJ1VddfTfsPdADJQh0YmZgCFaSrFvIRjsU9gB/+8tcgLiH4kuFe2kFWmAhpBJ1MeKMbHHj58zO5q1i1mBxHGFzqIEtf7Z3JvwHUKP9Z8wy0urPitCORvxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080509; c=relaxed/simple;
	bh=C0Ea7VbrBLndXIBHbMF+riOuUENlc2nKC6C0OY3+ONo=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L5rpBMkKgNqLbay2iUDQq7ztbxrnxKheDE5eE68LNrudpizUy5Mejrjo6FCwegqam5tZ39e9PmBLVE0RkceutPvvyKH+EPdWrjq9huoPMAgXyhTES12j9d7IP30AaPbbO59xChwa+5iXXYJnSY78vXcVu1q/SYk8Qx35lDBLNnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=PFtKJR3G; arc=fail smtp.client-ip=209.222.82.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40]) by mx-outbound23-46.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 27 Mar 2025 13:01:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9OnzQ+pLW5qscxWjLEWzR9FGaY0YwQDGTEYuyXVpB/H2wPbu4V/FkznSy4zhms+ZAitXRMYFgVZ7nhaCk0m3ZDnk+jDnEnex1OpFDjxoMXhX79drpsbRFVKkkCr8RIyifrDkFS30ZdpjXUTQeAqFE38+uuW8Ozg0ByTrs4b4jSyqKp2w3T+/N+5hm+7vGNXjqyvCerrAe7sjaCuOD2p+abrFIf3W4IoG4jBOdWP8jFMvtVsKNjY0PnL5HLdV0e3KgLvjNYKGZb0BLY36lKcy//eGG0f1UyF7sI85rm28lh1UDLRoUDWZESy/QxgA03nHm9JEIb6G47yyAdHike5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/bo7PRJx6+OND7b4unDCtUTb6I1qdXUB1BgSpZcvxw=;
 b=lu6A4YcCszSdVASm592GRML4rFqCk/3i7R3gHpmWZy4mGNG4GhV+A2RvO1D8pgWIlp+t0x29iWRMAPa1lQ9JNn15p0IOWITW8sPIf9BKcsxVG+rM83Gm4zswc5vGW0+cOHrbpVODfC1oQyG2TD4ntPk7pNggVhD0ZLaMECKHGkkURu18CjE+qH3wJ4B7gISkNmmntyo9rGTRrGGYByHj7+RDG4lvO6Puci0G/s/2EnwrRBP7pXrCUUTZyraxClhOIkV/hr/3kIbvH3NIvYNggo12bz+LckhK4zc0owdYGrZmvLsq4RbuhWz70/6mKD5tNpKxyh+I/DnRFzMlqKoYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/bo7PRJx6+OND7b4unDCtUTb6I1qdXUB1BgSpZcvxw=;
 b=PFtKJR3G8kTbbGV61UsHbQO4Mc8SUpAo/RSq+hjupV7pUbtCQwf75U+a4ytE1cyjmEqOR60XskJeKmtH53qr9cvESkjk3DeH5LrT755g/qavkU1Zqdp8iWEZ3wgj3+b/OnN30KoxY6WYOHfrdJOM2K0fEUImI2GEHwkxOerQWpJSbH457AVR3j2EIMgViOEUEsxoinqZId6UDxgmZh4ng2czOQzdw7W39DlAZt4ZOiEkwPC7J+bZ2ETx4mw5wm6djHzvOW27rNRRoT59rN8oNf5IughVO/JjTn3WxTMUQsqgxIFvxLG9UEUa2rdoHosTENvIj3+TL0WwncT7RbDOVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15)
 by MN2PR10MB4254.namprd10.prod.outlook.com (2603:10b6:208:199::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 13:01:34 +0000
Received: from CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448]) by CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 13:01:33 +0000
Message-ID: <ade69712-836c-4cd9-ba79-79b2d97fba83@digi.com>
Date: Thu, 27 Mar 2025 14:01:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Handling incoming ZLP in cdc-wdm
From: Robert Hodaszi <robert.hodaszi@digi.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <bd07dc48-d6f5-4a95-9dc4-c738640349d1@digi.com>
Content-Language: en-US
In-Reply-To: <bd07dc48-d6f5-4a95-9dc4-c738640349d1@digi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::8) To CO1PR10MB4561.namprd10.prod.outlook.com
 (2603:10b6:303:9d::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4561:EE_|MN2PR10MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: eeab6b59-21b0-4ff6-de2e-08dd6d2f7fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S01pQnB5aDF2ODhsUkN0bVl6Y2pjWkNIc0lwZU1jN3VncnFVaWhqT3FvQlkw?=
 =?utf-8?B?emNiVzlJY2lBTUFwN0N6KzBieUhIVVo2dHFCSU84OXloN015eFRyQTlEemdn?=
 =?utf-8?B?TEVZMEE2Y3hrbVhDTU9LSU55dVI1ZTJzNFMyZi9HbVJzekJBNVhyc1lZRzg0?=
 =?utf-8?B?dm8wbHZuRERURjBNVkpBTFdLWjdBaEdGOXFiM05MSkdsdldZRTJEbUhqN3ZQ?=
 =?utf-8?B?c3RpcGtmajh0YXhJVHJXQ0FsL3FZenVNYkloYm1NWjBDLys1TW9kWnJOdGk5?=
 =?utf-8?B?WmRGL1hPOWQ5aXVhODB4VDFLbTg3Vmd2dzBaOFprak41QWpCbXUyM2hnVEs0?=
 =?utf-8?B?WlcwOWZwRlJ6eVJ2RGNyZ0RDN1dBb2ZkWk5sWVF4R1cyRWNnbGZqRUtBS3lW?=
 =?utf-8?B?VFBEWnJJYUdKdFZaMkt4S1E5K1pwM0ZMUlQrL3lRVDNVQ2Iya2ZMMjZVdXNt?=
 =?utf-8?B?aHROVmRHQWtrTjVuTUdxTWJDdGVDOHZUZmE1SDBIS0VDd1pnbGFCUVpHV0RE?=
 =?utf-8?B?bUc4Njc0Q0c3dTRmWUFGcEdiSzF1c2RXazRxZ2piYitKRitRRWdYZnFMU1Qz?=
 =?utf-8?B?Y29JSVRWcXIvUFR5VytTMFdjbkIyY1VlamYwL1lOYkdhUGVJUjZOSG1pL3dU?=
 =?utf-8?B?emY1K1lCN0RzK1Bsczg3QjRRMDlrbDhiR1BIbVBPbHFNNjlXelJDSDYwTFdW?=
 =?utf-8?B?RmJoODI5cTFmanFuY1d3TVlUZFpIWTBLWHRFWmFsV05yb2JhQjhOOGk2U1VU?=
 =?utf-8?B?akN6Y1RCdm56ZG5VNngrb3FBYzlBMWZ5ZGR2T2VlS2s5WlJYOGdjbnNvNW0x?=
 =?utf-8?B?SlpnZWlieWtFRjlsNXc4ZWQyckpraDhjNW9lV09acUxISHpxK2lwWUlESlZW?=
 =?utf-8?B?SmZaS1VCTDVBWGRYRzdTYitKRGVXVXViQzBmdGdtMnkxWU9rQ2MvcEpnNUk2?=
 =?utf-8?B?Z2ZSZThyYlp0NFZZWUNURzh1TlgvalVpR1ZOVTZWSXdYTytnR2txZVl5Tlh4?=
 =?utf-8?B?dXNuY29PaS9EM2JpUDZKNTBMcDN1Z0hYS1NwR2hwaEtHaGR5QmJEQzc2V0sz?=
 =?utf-8?B?NUF0OXpPa3lxM2dPN0NueW9PUGcySUNYT1UrRmRUNm0reStSZFNacERxRmVQ?=
 =?utf-8?B?V0syRjBGdXIwZm0yakJTRFRFZk95ZFQranBhTTRROUt0SzFZcEdTNlpwYTJs?=
 =?utf-8?B?M2tZdXdwZ3pkVGlsWEk4UG03dDV1Mk0yWlA2ZDFHSnkyaEJzUTlwc0EwZTRS?=
 =?utf-8?B?ZG1JTGx5K0svUitsbzAwVy9IWk1NWkhmelF2U1ZpVkZadlFKU3RKM2sybFNG?=
 =?utf-8?B?cTBFbEJLRUh6bENqRmxRdFBhcDBoUXZmMjE3NzY2a1VEMmhzY1cxOXU4MlNR?=
 =?utf-8?B?TytPNFpzRmdpOTFCeG9XZkd0TXBRRHMzcVRlNnRaL1d6SUxqbXhZVHZ0aFl2?=
 =?utf-8?B?S2RYQXdXM2syMDJDWnF5U3JTY3ZGL256WGEzNlFMWVFIMmFYVFJ3cDZXRVRv?=
 =?utf-8?B?YnFNOW9lK3BlaHd6WmY2R05RQ20vZFlCOHRBRnREcVp4a2xXSGdLVTErSjRL?=
 =?utf-8?B?dnZwc2YrT0NvM1djbzBJQk5ZTnJjelV4Z2pmbzl6RHJPNklnV1FnTFRta2hi?=
 =?utf-8?B?bmQvNk9ObDdiRUQwQ05sbGVPQVpSQlBGMW9EaFR3OWcxTnhnZ1JXL0h1NmdM?=
 =?utf-8?B?MVpCSmtBaVpIZGlFZDhaU1hTTy9XSS80TTBZSHpiYmprMHJ4UGYzU2k2c01h?=
 =?utf-8?B?ZUk2cC9Wd3FEV1NjVGFhNGVxMUZ1OWhTcDlrMnM2VUsySndMRDhwS08wblUv?=
 =?utf-8?B?dnAyNzhFbjMzcXRsK05YNkNubXo2bml5UjhFNTVZclM1Z3NNNVN4YXB3L1Zv?=
 =?utf-8?Q?/y1E5v1JYbmsN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4561.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUVjK1BpNGpQZkhIcmUyZHJGQnovcHR5SUJ6ZnVwSm9yVXJtRmNhb1AvcEQw?=
 =?utf-8?B?QlFweHd5ZzdWcS9VQU5DYU1Xei9VaG1JRkI1R0hXN0lCR0toVVBoVm9uZlNk?=
 =?utf-8?B?T1RrZ2t4dXEzV1FkeDc1dVl5TDFzYllCbTdCL281TktIVkRwS3NGOXc2TEw3?=
 =?utf-8?B?dDEzaEl2TlRveWRaNEpjS1R4L2N6ZVJTS0UydnhUcUE3VEp2OVJkbjY3QmdY?=
 =?utf-8?B?WEJHYkZvakJrTkwxVE8ya0x6VDVHV1ViUEY0VXZEcHA3MzlkUlkvMUoyUGRT?=
 =?utf-8?B?TWdYSnhSeXBsSVNKVTlnNytkbWxxZHY4QlM5WmtHRTFPWGRGUlhpb3lBSTIy?=
 =?utf-8?B?ZURlK2Q0Qk8wWU1lREx5TjRTZW03N0x5TVhHWFhlSDVwc0RRNUIxdUx1cnAw?=
 =?utf-8?B?eTdlSndzRVBqS05ZVVQxL3NlMUFFZ0tkcytYT244NmdyR1I1aVdxQWQvNzBW?=
 =?utf-8?B?dlpEL2lCQnNpSkw1R1U1UTJSNU5SVEt0Wklrd3REemphSHl1bUMycVVPbVZp?=
 =?utf-8?B?K3BDam5uMDZEZW5ONllmMngxSVJ3S3FXbDZYVVU4R05mMW4vUFEyZnpVNGNu?=
 =?utf-8?B?MFZUTnZnbWdTV1kvaVJ5Yk5zQ3JWZzAxT0Vac09iZ2hOMHoyeGFZMDRpaHNR?=
 =?utf-8?B?d0s1ZGw3dnRsblcvZVpPTUdKUW9pKzcvZ0pram11dUVOY1hxVGlhUHZlRnRy?=
 =?utf-8?B?VGl2L2dGZ2VxTmtnbW1yaVBQbHdQRUl2RjFYdzJjSnNpdU9wUlhtbk5VZndI?=
 =?utf-8?B?TkRtQWNGT3dKQ2Q2RlNUbmFRV1Q5Ym1tUldOdWNwYkdpNlhYN1BZdkdIZ3hP?=
 =?utf-8?B?K3RqVVB5eFkzM2cyMUVQQ2NJV2xtL1lVRXMwSWhsdmVkRFhQNVZhdTJiZkFM?=
 =?utf-8?B?T0FURGRGYmpFYzZJVE5ZbjUyaGkvWFJKYUZnRmduVG84anNnK2QyUTNmK0ps?=
 =?utf-8?B?TFFuSWdRVThjTkxCRlNPQU5GL1MrTmhjQ2IvdHVwU003cEsxNnprb2dkanIz?=
 =?utf-8?B?dmJYTUVXd3c4RUFhYUxrSFFva3d5dDBXYmduZng3ZTVqZEdZN1ZNRjZUdUlB?=
 =?utf-8?B?R1l3NVZ0aWRYekVMOW9VVHJzS2tMRTBEamhSRWM0MWdwT3BSSUNQUVMvcFl3?=
 =?utf-8?B?T1lqUytaWTNYRGFlTGFJZXpKS3dJdGRVYVZMOUpmampwekV3SWZ2UEtJQUNX?=
 =?utf-8?B?dEFiWllzVVAzT0FhSjI1bEVZOEM2OGxmNDFUMXZlY3k2a3RZWDFET2F1bFFE?=
 =?utf-8?B?U0I4RUJlME5PZS93ZkR6aEpnWnF0UURkbHl5YzNNSjdlbSs1OWZVOFM2OVp2?=
 =?utf-8?B?cGUyLzhkckN4N2lmMUR5b3k1MkxyS2NzaDRhZUI0dkZwOXMzL1ZVZUR1TFlH?=
 =?utf-8?B?YUwyYUdlT1NhWjlkdDlUZTRObEhWWVNlZHlrT0t4emphb2hDdzVHRU94V1Zm?=
 =?utf-8?B?Wks3czFpU25FdVZoZG5kbGtBQ0lGOVhTT3RqSStWRVV5Tnd5b2wvbm1yWEJD?=
 =?utf-8?B?U0xCZ0lBeXpCV2FOUldEVmh6VEEvTmlCcUEyeU85dFppZnpDWHNQMFFEeDlq?=
 =?utf-8?B?UGdvRzQwbWwrQUVTRng0bG1STjY0a2QrZWJTTnBwZUFOdWtkTXhZTHl3TGN1?=
 =?utf-8?B?Q2trdEYzK0thWGwyODVUeXkyR3VyekVKOVByMFJQMXNpb1Vyb0JtTlI3YVBU?=
 =?utf-8?B?Z3hxdkxiRUd0QS9BOG5heUt2c0s0K0Jmd0ZnSzQrV0NSNlQxT0VyS3BBd1V5?=
 =?utf-8?B?eWlJMlY1VHB1ODYxMkQvV3A3S2hDd0NkWU5Bb2VnZEduVFhhRmNYRlk4dHdO?=
 =?utf-8?B?b1FBNEZZRkowVVF2bFMvKy9wbVd6aFN6cnAxL3pYZ1J1YTJVMTB2d1JLTVFT?=
 =?utf-8?B?MnBoTmcwQUNTd0xSa3RzK2xjVTZMbDlENHR0Rzh0K0JndE5MUVNlaTRaYmR0?=
 =?utf-8?B?YmQzcVdSOHhlRU01bitPYXowcGY0QWM5YzIwL3cwRkUyU3FEdzE1cXpxSnFO?=
 =?utf-8?B?Mkp0K3drajlpSWZJRm1xb3pnc2VHc3NQNUFCdGlqYTRqb3JWWFViYkJ5b3pW?=
 =?utf-8?B?clFPbEJWa1lMTU1UMWVhZ3JjaGh2clptWXhXN3M5QzlndXFjVWs4SDE0dmho?=
 =?utf-8?Q?c5dPgdsr/OIMVpzzed5BcLVnY?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeab6b59-21b0-4ff6-de2e-08dd6d2f7fbc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4561.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 13:01:33.4785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FuHLEqpSVq/6WzCqwAId9rn0/TvcFFjLHB98YRVWbfDtfS3U668Mgkw6ExauB73+rZWFoxCmGxHqF/YlqaY5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4254
X-BESS-ID: 1743080496-105934-7627-98-1
X-BESS-VER: 2019.1_20250319.1753
X-BESS-Apparent-Source-IP: 104.47.66.40
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVqaGhiZAVgZQ0NzcIi01NdXcOM
	XSOC3ZxNQ4KdnU1CI52SzJ3DLZNNVQqTYWAL7IeVNBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.263456 [from 
	cloudscan22-246.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

On Wednesday, 26.03.2025 at 17:03 +0100, Hodaszi, Robert <robert.hodaszi@digi.com> wrote:
> Hi,
>
> (Sorry for the long mail, but want to describe exactly what is happening!)
>
> I'm having a weird error with a certain modem (Telit LE910C4) + ModemManager. In some circumstances (e.g. SIM switching while there are some other ongoing transactions already from ModemManager, or stopping ModemManager in the wrong moment (again, ongoing transactions)), I can make the qmi-proxy stuck, and can only SIGKILL it.
>
> qmi-proxy gets stuck in g_unix_input_stream_read() in glib.
>
> ModemManager tries to read an incoming message (/dev/cdc-wdm0), so it calls g_pollable_input_stream_default_read_nonblocking() (glib), which first checks if the stream is readable with g_poll(), and if there is, it reads the data in g_unix_input_stream_read() (glib).
>
> What g_unix_input_stream_read() does: it polls first (uninterruptible (EINTR) loop, this is where it gets stuck finally), then reads the data. If the read function returns with EINTR or EAGAIN, another loop starts, and goes back to poll().
>
> When the issue happens, the modem sends us a lot of zero-length packets. I see a 10+ INTERRUPT_IN URBs, without CONTROL_IN URB, because qmi-proxy is busy with close the connection (sending CONTROL_OUT URBs, and doing other things). In the INTERRUPT_IN URB's last 4 byte (cdc-wdm driver doesn't handle that), I can see the exact same number. I guess, this is the frame ID, as usually that gets incremented. So I think, modem tries to inform us about a pending message over-and-over. That's incrementing the desc->resp_count counter in the cdc-wdm driver.
>
> Finally qmi-proxy gets to the point to try to read in data (and call the aforementioned g_unix_input_stream_read()). But the modem is only sending back ZLPs, I suppose, because it informed us multiple times about the same pending packet, and it doesn't have anything more to send us (and it makes sense to send ZLP in this case).
>
> The problem is, wdm_poll() always return with EPOLLIN even when wdm_in_callback() receives a ZLP, as it sets WDM_READ. So it makes sense for glib to think, there's a pending packet. In wdm_read(), if the packet's length is 0 (desc->length = 0) and WDM_READ is set, we reach
>
>     if (!desc->length)
>
> line, where it puts out another URB (as the resp_count is not 0), clear WDM_READ and go back to "retry". The second time we test WDM_READ, it is obviously not set yet, and as we are reading non-blocking, the function returns with EAGAIN.
>
> And that is the issue here, as glib in this case thinks (with reason), that OK, it has to try to read the packet again, so it goes back to poll.
>
> Then another ZLP succeed, wdm_poll() returns with EPOLLIN, glib calls wdm_read(), which return EAGAIN, etc.
>
> Finally modem runs out from ZLPs as well, and has nothing to send us, so we just wait in wdm_poll(), and we cannot even interrupt this loop, as this is a non-blocking call, and EINTR is disabled.
>
> -----------------------------------
>
> I think, that should be fixed in cdc-wdm. So I'm wondering, what is the right approach here? Should we just return with success with a 0-length packet from wdm_read()? Consider ZLP as an error in wdm_in_callback, and schedule service_outs_intr work, like if desc->rerr is set? Other?
>
>
> Thanks,
> Robert Hodaszi
>
Following on this: returning 0 bytes for read would kill libqmi, as that handles that as an error as well ("connection broken").

So what about this patch?

    diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
    index 86ee39db013f..37873acd18f4 100644
    --- a/drivers/usb/class/cdc-wdm.c
    +++ b/drivers/usb/class/cdc-wdm.c
    @@ -214,6 +214,11 @@ static void wdm_in_callback(struct urb *urb)
            if (desc->rerr == 0 && status != -EPIPE)
                    desc->rerr = status;
     
    +       if (length == 0) {
    +               dev_dbg(&desc->intf->dev, "received ZLP\n");
    +               goto skip_error;
    +       }
    +
            if (length + desc->length > desc->wMaxCommand) {
                    /* The buffer would overflow */
                    set_bit(WDM_OVERFLOW, &desc->flags);
    @@ -227,10 +232,10 @@ static void wdm_in_callback(struct urb *urb)
            }
     skip_error:
     
    -       if (desc->rerr) {
    +       if (desc->rerr || length == 0) {
                    /*
    -                * Since there was an error, userspace may decide to not read
    -                * any data after poll'ing.
    +                * If there was a ZLP or an error, userspace may decide to not
    +                * read any data after poll'ing.
                     * We should respond to further attempts from the device to send
                     * data, so that we can get unstuck.
                     */

Best regards,
Robert Hodaszi


