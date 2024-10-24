Return-Path: <linux-usb+bounces-16639-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ED29AE6E1
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 15:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D1991C23AF0
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 13:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3BB1DD879;
	Thu, 24 Oct 2024 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cnruqHY8"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229491CACDE
	for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729777179; cv=fail; b=s2+cfbUy1OYo4eCL84fMMdpBRQKiqsuyTvLBfd2C5RcnxV77y6gOihwYAXrGlzM+FaC0EeFe3lVg+GJ5Q83vObhgJcCr61UBX1DPURjq1q8nBT7qfVUjlrL8SQ2rnk+6rbiPZCMoOK0DsT1pCEEuguUiUAY/kX2Jk78FkrHJGb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729777179; c=relaxed/simple;
	bh=C56oYrKnggW5IwbUZeBHBRAkMVc9Bo44i9EvrAxWLiU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SKY0aD3YS40QdCFvNZ/tQ7Q0y+AlwCsL+IiQbFiqZdYx8+3YoGzIfBCBKzE62IejmUQUr7rS8I0GzBFA0u1eHcaXhJLY0Zry97Fc8ZkaXxOX55qyNXL9ABRn1g2q1L4/dSLJAgweZNm1itzf5qOpd6fU7Bitxjhj7ClBJQQKha0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cnruqHY8; arc=fail smtp.client-ip=40.107.101.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6YiR8fVuoMNUNREtKMNv2qalP9oyK1Ds+nLPNeKBiq0++o6mXggVPxzsQlgz7lnaCtbQwBiZXgQ9lecShkqiWQZ2gLNPYVo6+t8xf0aGbDH6C99Kc6FZQJdjfoqwoNALnEBU8TwWsQ+VyJDI/8cExsxWI3XrHv4ZQk8Hn99kjzpAWC6ysfMERJm/QePH3hFY7dVjLmlZCuszOytXbEQkMC4wkQUWgaKqDDtt6a08fGpLO1WfyFASv92sj5f/rLgGELHsystZZRXp4OjlOR1kjWZUvJjHbcZhTqjJD1YZsdv7y5BfqhZmc4OxgOTVMLd6hmFzjWXNproNGUJHmSNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rO3TT1zbHLuq9ziA0LpKcG1kqoO6aSxBNIIJ7wKUQ+M=;
 b=m9TujSWSGlOro8BLmkujI4OMbeGwTVlbVpg57KKuhmtlKI52HAXgnHu9yjqO9HcYVMNxSaS6KPEMX3zB12aEyGFM9slw4ZfZJBvdEhMhx8eLmwZYORUCcOXKFGX14TOOpxSiJSM5+9SF3vWctODAjvzut/L+l1elz4tABmcD5ZMpxo9LuxUC9VVSyFZv7HmiQTDhlBTdqfNDL3VbTh3836MJrwBxp+HXPM5MgC4J/KfBCsoL2q99GJ4z3SNwixEbx/OJzFWwn8KmMjkuBeLNChn8vR5z1wdrCvgq5abczw3+DLByNNcog/ZiYJ5+yRrV+wWPIWUmd4XtnnBzJXM5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rO3TT1zbHLuq9ziA0LpKcG1kqoO6aSxBNIIJ7wKUQ+M=;
 b=cnruqHY8hM+Jfb5HRjjjxndB/i/hAVLHEGz9miXr6UnpCq2QhfDNmjGM6eqSFNZ+vP3zb/aFFy0JkcUQsj5YQ2MGLj3RNEO3UUlYmuXedRan7Kvb3ynMQRQaoxgZt6ivgspe5vJw3knMZjnQVuSPj7yldjaBwjOiUoHCmJyLIy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by CY5PR12MB9056.namprd12.prod.outlook.com (2603:10b6:930:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 13:39:33 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 13:39:33 +0000
Message-ID: <bd6e7234-5fcb-5e36-e159-a0bf298cb047@amd.com>
Date: Thu, 24 Oct 2024 19:09:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] xhci: Use pm_runtime_get to prevent RPM on unsupported
 systems
To: Johan Hovold <johan@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org
References: <20241024112117.723413-1-Basavaraj.Natikar@amd.com>
 <ZxpGY_RgP3M7VTv-@hovoldconsulting.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <ZxpGY_RgP3M7VTv-@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0228.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::16) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|CY5PR12MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe95052-a40c-4bc5-0d03-08dcf4314b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anVFTUZpdVYvdldtSE5LUjJHWTE3dmNWdVIzOG5WZHdwTlZNdWU2ZE8rTStD?=
 =?utf-8?B?dFZuUGRVUXV3cFdoMnhBOVNZT3pTSGl0QXNQZDB0amEvOEd0ZmlnZ1k0RW51?=
 =?utf-8?B?eURma2d4UE1oZmlITHFnaUNCV1lTdEdadXpsb2lNTWMyajRzeWxRWUpmdEll?=
 =?utf-8?B?U01SWHRCV1V3MHY1OU1ET04wTGFOVGVPdnVuNUFuTVZONDJaeERPSGs1UXZS?=
 =?utf-8?B?ekdQMm4vdEp6SDJyTWNmaFlCOEllRW9Udm9GYkxYTzFDNVVkVjlxS1o4VUV1?=
 =?utf-8?B?MGlpc2VtcWRZVjVpMTBGWldXQzZBSUx5MEJLQkl5Um1FUjk5SEtJa2dMTkxZ?=
 =?utf-8?B?NnZJM0p3MW5lYUtWQndGK1JuUjZZaVJIZEJPamMxZXFYM1JmU25QTXRxZnZi?=
 =?utf-8?B?bXhhNU1qZEd5QzFCVklVenRvNTh5MXhiMVZMOGFFSTRrQXRUa00reitqRVlU?=
 =?utf-8?B?S3J5ckdMLzJjbDNwT0FJL2J2WGtKZE15VExqSlFpVHFCQ0RpQ3ZDNjIrRDJ4?=
 =?utf-8?B?RzFvbFk2V0gyRERHVC9Vbk11Ym1vOUJjbjFVZmdxSmdSNjNqaDl3dGFBbjBF?=
 =?utf-8?B?aE8zZklCcis4QVhUaWdac0VjTmJzM2llUzRZRnZIMHRTMUU3T0lRZXZ5ZU53?=
 =?utf-8?B?NlpSaGxtSXpUUXZQellqMFR6cEd3V3F4ZnU2Ym9pTU9GODBLZzN5U2UvbFRj?=
 =?utf-8?B?ZlZmYVJkZlI2STNjTHV5Rnp6NkU1Tng5MGVqYUdxNG5vWWhpS2I1UTZVd0lj?=
 =?utf-8?B?WXp0TzVHSkRkSmlzOTRiMkljZVk0OUgzQWJLc1REWUViQTlVMDFMMHE4Z1hu?=
 =?utf-8?B?aFo3cXZyTjU5a1RRMVY2dk9nVkIzWE41MHlMR2t0WEJnQ0k5a3p0bGY4aUpo?=
 =?utf-8?B?TWNHekRQYWtRZ01OTnlFNFdkKzI5dHkxTEIzNUZEck9KVjZxT0RjS3FiVFdC?=
 =?utf-8?B?bmhONFFTYnRRRTF0cHhHME1zRHRvbHpSWjRLbnlQeVpqc2JyU0ZLRGx5cVNz?=
 =?utf-8?B?Sy9xV0dSRkI2MHFRMjR6MXpEWTJOWkJVc0thMUpNektzMHlzYWRuYjRWUGZt?=
 =?utf-8?B?dFFBZ2I3ak5tNGxFOEd3WnB2Y2dUbjAxSjR3YU5aeG02NU43VU93MjJTTC9X?=
 =?utf-8?B?SWhJcG43VUFBRE5BT2xYN2hkRlVXaFNxK2JXNTNLaXl5aHFwOGkwM2k5N0o4?=
 =?utf-8?B?S2NDSjZMWjlJU2ZJcy83cU5pMldmNUlvRVlwWFpqdGMrSFA2aGRpZDA5NHB4?=
 =?utf-8?B?dXVqVDFoeGZDTDFicTBPSGpnNlVRVzRsQ1hLQnBsdGszTFJpc29EaFh5dlRY?=
 =?utf-8?B?d2FTVW5RcWlhK0krcUFxaHY3S2ZwSVJ4UXdCbHFrZVd1ajNjTDh2dS9rdG8y?=
 =?utf-8?B?N0hIWHFpbmNxd24zTzFVMnc1a1YxWWduNEx5VEtiN2RTR1ExMWFUbmowMS9s?=
 =?utf-8?B?N1dWRFFNKzRIcVhBazR5R0t1a29POVI5Um5ZQnJtZTNBcjVuZUt2N2JCSnZn?=
 =?utf-8?B?a3pzV3hTYk5Fb01ISFl5N1JEMnlTZ1VUZWJOMFJuWkNFejBtcTRocU5acmVC?=
 =?utf-8?B?cnd2L1crWEtXczNvM0Nxd2JWZW8xTEkrYjd0a0tyOWJXaWVlQmJhMmZRR3N6?=
 =?utf-8?B?cm1QbXRhWVMwUCt1bFBWN0xxK2w3L3JyT2gwM2NLUWxzREJkc1hPOUR4eUI4?=
 =?utf-8?B?ckN2MDlNazFtdnR2a2hmelhUZjNFbVRwQ3BCeXBOdzJkNE52S21TcXhXdW9L?=
 =?utf-8?Q?4tMhqugWv2FQK0kUFQWLUn2eLsAwvdnP7wtrpK1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDFFV1hLMDNuam0zZGFWY3lEdkFHMlhNZDljdXpMVHFLZXhBelVKSytYU1BS?=
 =?utf-8?B?UFFDLzM5cVp6ZWdBNzVmaDRRbkNOQkpHVWNQUHVzVWo3WUdIb3k2TUs3cndS?=
 =?utf-8?B?Y1MvUy9nd25FRG1xc3QzUjNPWTVKdWs0bWpPYUdmWmg4dHovemdDdmViaXZY?=
 =?utf-8?B?OC90K2wxT2M3Z29uMGFaNTRGbzFLckU5OHFEekt4cEM0OFBEU0RINlFLWGd0?=
 =?utf-8?B?V0F3ajBtdU42dmhrK0tlQ3duSnRKSU5KVUJJZlU5Y2ZzMEFUcjRvZ3NIK2RW?=
 =?utf-8?B?TWxtaDB5dVJDQzZSSFIrTG00OEdVUWZwV2VCeFBMVnFVaUpITVNVdXZ0Qm1I?=
 =?utf-8?B?eVJhMWpSZy9idzZZTVB3dG92VlFWQVc5Y3JYSDh2UWJoWVB0M1dDYXB5aEVx?=
 =?utf-8?B?eGFhMVowWU5Ha0s4YzdlbTlVRkNPTElWVjhlSWpDV3NRUG1YckV4RTFzZnM2?=
 =?utf-8?B?UFducm0zN2hNOW1GQkRRTXorUExUR3d1dC9qZGRkZWNXSU5vdjE5cjRkWFFQ?=
 =?utf-8?B?TW5OankyRlB2b0dycnJRQmZnVHMvM2FsNXBpMkpwWkx4bUVNUGFQQWxkZUNl?=
 =?utf-8?B?NnRIajllR1pFZStIdDdaT0M3M0cvYjQxNDlmdEZnRzE3NjRuL1NGaW40eHJZ?=
 =?utf-8?B?VEQvMFpOSWxRYjJLM3p1SmxRMmxzbm1JdVh1MFh4a0RmdG1jUk5ucTYzYkFS?=
 =?utf-8?B?VTEwcmJ5VUFrditXUFoxRTRZWDBZR3pCbnpaQThGMXFzWUdQWWlaSFFRUlJH?=
 =?utf-8?B?MlZuYVppSmpCSDltN0lSV202UUNMY0ZEWnVITWR1VzgwYUo5S0dQV1FYYmg1?=
 =?utf-8?B?NDBhdEVCTCtveFpTZkZiTTFHcVpvZnVhNGZFVkhPVFRKRjhHazVacjlTWnpv?=
 =?utf-8?B?SlkycTZNeE1DQUN3UnROQXVqYjk4a0ppL1Z1RW8xSFRGQmc3QTBZa2NGcjUr?=
 =?utf-8?B?aG1CNVBwV1I3Y3lXT0R3TFd6REorWVRkVWdOSXBLMEFvN0xEMXhwUUpHWlJn?=
 =?utf-8?B?MHlnUFp6NERaT2loOFpMSVdWSjhtQyt3RG1EWlh0Nm8zU2F1NXdjMmhmQlQw?=
 =?utf-8?B?aDlEeGFVb1pCNSs3dGhiLzh5R2ZnUmJKblhiQm9WQ3U1VkJ1dUUrK1BxYWtT?=
 =?utf-8?B?ZUNtYmVsVkQzaHVwZ1JCdFI4dzVpRytGUCtUWitYcGZvU3RYMUY0OHpLUkNC?=
 =?utf-8?B?clNmUjF6cGswNUtZYm5BU1NUU0hpMS95U0Z3ZTJOUkFoOWlrMmdBWHdXKzgy?=
 =?utf-8?B?dy9tc1ZDQVRGeCtLRVJjTlZVRTVURTJUZFg2MXJ4dFRSQWZVV1NIaFRsT1Rn?=
 =?utf-8?B?WnAyTHM0MFlXdFkvOGdlb1lGblZqTDVoTzNpTEkrMTZwMEkzb2pTM2Z6Uysx?=
 =?utf-8?B?YVZBcVBsak5OUTYrSk5IZUM0Q1NMa0tQeVg1dUltdDJoT29jcjNONjllNXJQ?=
 =?utf-8?B?NU1PQVlpcDVNTkFPaFpxaEFOM1c0cE0wWDRUbm5YMlR1UlZzNTlXZDBuZVho?=
 =?utf-8?B?emxJd2pWUklwRmtDVnFRRlNJMHVsSERZbFdaNVRtM2wvU2ZnQjMycjdNekZC?=
 =?utf-8?B?SXRUbjkvV2NESmdZTmhoSzlLT0MvMWxhMG9LSCtYdXovM1dSbHVYaklOV0lK?=
 =?utf-8?B?VVhZTGQ0bk52U2FleFRwZ0RYbjFzSy8vWXJYVm56c0lJN2RpZmhGVE41K3V5?=
 =?utf-8?B?aXIvTUQvV0g2VGhSdVVjKy9rSFErTmFtQ1BIVTBWTWdsTFFPMldmU0Q5WDB0?=
 =?utf-8?B?TFpTKzZIMTM2Q0s2NVVmc2pUL3FKdVRkMEw5NmhxUUl6L1JXY0tBaWdpSkxh?=
 =?utf-8?B?UU0zdjV6dTRzaklUMzlkQ0luUHNSUUs4VTFIZ0x5TDhWYkM2Q2ZTbmtkTVkx?=
 =?utf-8?B?eFBPZ1RZQS9SdjNXN3VhQnluV2RSQVd5RlRJMlE5WksrdE1Pa2N2Mi9YUGdi?=
 =?utf-8?B?U3A3MnhIUG1lOVhvK1R2dGIyc2tLRmpZbVREYkwyOTAwNmZYSy95VDlMWFRr?=
 =?utf-8?B?em1jMU9BcUpQNFlwdGl4elZsSGgrTVQyclVBaHNSMGdsMkRuaU5uejNGaE1Z?=
 =?utf-8?B?alR0dE1pVURWMzB2MkI3MzhpYS9lcUh1T0wvL2Rub05NbTFNMmxvRXpmdzU1?=
 =?utf-8?Q?7UbSo4l4cO7nwcnwdz3wv0/Zc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe95052-a40c-4bc5-0d03-08dcf4314b3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 13:39:33.6203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vu26exlhaU5N6k0qHNhZtVzJHkyEViSkeVdoUNUdyiJFfo7/YUkh1S6yuqCMuaZ+eX1xFag1rzZO5kkn936Pbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9056


On 10/24/2024 6:36 PM, Johan Hovold wrote:
> On Thu, Oct 24, 2024 at 04:51:17PM +0530, Basavaraj Natikar wrote:
>> Use pm_runtime_put in the remove function and pm_runtime_get to disable
>> RPM on platforms that don't support runtime D3, as re-enabling it through
>> sysfs auto power control may cause the controller to malfunction. This
>> can lead to issues such as hotplug devices not being detected due to
>> failed interrupt generation.
>>
>> Fixes: a5d6264b638e ("xhci: Enable RPM on controllers that support low-power states")
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
> This is a new version of this patch:
>
> 	https://lore.kernel.org/all/20240925161520.2736895-1-Basavaraj.Natikar@amd.com/
>
> so please resend a v3 with a changelog here.
>
> Also remember to CC people reviewing your patches when resubmitting.

Sure Johan, I sent changes in v3.


Thanks,
--
Basavaraj

>
> Johan


