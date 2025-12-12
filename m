Return-Path: <linux-usb+bounces-31405-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 018F2CB8FB6
	for <lists+linux-usb@lfdr.de>; Fri, 12 Dec 2025 15:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2BF0306EEFD
	for <lists+linux-usb@lfdr.de>; Fri, 12 Dec 2025 14:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCA72E0922;
	Fri, 12 Dec 2025 14:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0YZ3RyVb"
X-Original-To: linux-usb@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE35279903;
	Fri, 12 Dec 2025 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765550446; cv=fail; b=Lfhc8hZMNxGUD5ruVs50jG5Y9KOBF5xB4a4yBJgO+Q6On0F0cbvCRrUGhTRzc5QFzVgDYUA5I5A2NzZmLly/4suZdi5QXLxg+hA9pAUfBPyap4Sebs4kLFyowCz8JHrSn48/ki83HOha5Lcndn7rP98AoXRk9Yvrv/qYCJlS0AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765550446; c=relaxed/simple;
	bh=s3vOSzwTltFouj89x74CZ+TNmP/TPmhebAwsld7kZUM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pneDsqU6Dtw1BxvH4dNaVIUtYgffRze2tpwSj1BjAN93wl8mlIY0EdZcY0HwMNPUfXG0HPJXV6nE01eGMtzq0PWMIFWgLyoqYyI5JMEDaCSxbpV11Yu4yLUrckO/vW7n6qcoCMXFxpivK4ukP9X82AIOPlvLWoClwjIIZwf0DaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0YZ3RyVb; arc=fail smtp.client-ip=52.101.62.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9d3J285eD3PkFpSGe01KrsCyowtBhVBbNNEMUbi/Y4c0r5jRzMMCUR3SvkxpaYyI4qDgiaCjV3+LhzHD/0Z7oLKm1qYh+mJLqYXmkLBbn04SG2AiOIZj+YYJbpb3qpg5WpPV27iRSBiEiA5Zq2Lp2dMHQMG7stsZ9a+7gH0CXbzXt38dXHkv9/jyA/cvI5+ukFgj1sqW1CrFvu1/QulxlHpeoyM3rXhy+rKO6y1iuthJ286XZRRURhb62wiEHbiHgNFE7UkbxP4dW+IMjKFoxtYDQIbCEX5t5Iw4TzUJF/pE87pRMaNrCt+JYXdHVpr9pqpyHOGyTaCnV7yUxrPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVkMA3uWspqGS6N/Fw1OMQIm6bYdLGoAgoHzZAyQhSM=;
 b=R84yPRaWZZ+xKWuDTrYBGB8wjx6Sc+HXWMrU2LQZWgShXBbCbcprw8z6WMB0YfnV4isH2D3uKMssffLm4Fs5uYw/tifeVUQ8i0zYWToufMlKhp8jnbdox9xWWvPTJHNlBQTPPdwM058wFenojvoS3wLyqHLYqV/g23Jm3YVi4NAkD/2AwkIuNXJQ662j/u6r8h4MVyN/NRqGZgbq/IV+01dZshvAqnDF1TLpGxK9grFWQIkE/d58TNwJ4Hhp0krTcticknygTNGuo6g/gZfAYG2HYN/I1bgGOIkwpsk80Y7yANHbIr99otyZmYmY1BrYp+UWBp00rS19J7VWW6sLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVkMA3uWspqGS6N/Fw1OMQIm6bYdLGoAgoHzZAyQhSM=;
 b=0YZ3RyVbF4wOtQ/Eq8DbFYgsjTEg7tVCvInyyZ0fky9lptSRaOcbsFR38xuyJV73slT4mKnGBQ/BlCqDf6R8RjaOgMlHd3E+vgsg53lHCC1FAkq5iv0CBdpbCQlE/qoY3h75jk1YqMTYqGVEthEzmV0HPSK3WIBYEPEvoNrkncM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 14:40:41 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 14:40:41 +0000
Message-ID: <484ff606-ec10-477c-acfe-d4d781e2873d@amd.com>
Date: Fri, 12 Dec 2025 08:40:34 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sanath.S@amd.com,
 "Lin, Wayne" <Wayne.Lin@amd.com>
References: <20251209054141.1975982-1-acelan.kao@canonical.com>
 <20251209070633.GA2275908@black.igk.intel.com>
 <pjn5d7oz433z4jph6whdalhowf652xknnk2fh5q7elffgb5ogo@7dtpvywxc6nw>
 <20251210074133.GE2275908@black.igk.intel.com>
 <4634177b-8ed1-4d65-9f3c-754d8c1eb828@amd.com>
 <coxrm5gishdztghznuvzafg2pbdk4qk3ttbkbq7t5whsfv2lk5@3gqepcs6h4uc>
 <20251212123941.GK2275908@black.igk.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251212123941.GK2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0092.namprd04.prod.outlook.com
 (2603:10b6:806:122::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: ee762a68-f048-46a8-3dc4-08de398c6c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWFybE1wN2ZwSUZ4clorczZjME4wc2lCNmxGRHdLc1d6dkxtSTN3WlZvZXhu?=
 =?utf-8?B?Z2wyQ3MycEdjdmJNTVVmLzU1UXZEVlZ1YU5Fa1A5RVNOTmxSZjdoMVFEK3pZ?=
 =?utf-8?B?QUQremsyR1hMaEpERVdCTkVPbFlaRm1nZndiRmdrcGcyMGY5aDUxK3VDVC9Q?=
 =?utf-8?B?SDJBVERYSFBvM3RtT1AzRi9RREtIM3QvZDRzVVdnYzVrMXNBWmQzMnlkOUI4?=
 =?utf-8?B?T2N0Yk9MdTlRVzMwTTlXcEhyYkJKQXprNlJ2SWVDZWpBYUZDKzZxdFZnMERq?=
 =?utf-8?B?YWx2c0R2SmNkck8vdjYvQ1dQUW1vdnZodUFGUnVTWkloVzFzSnVzQjVia3Bo?=
 =?utf-8?B?M09veE91K3JaM1NDcUtGVU9CZUllYkFjQXNvcjJZQWRqYmo3NVNyVTZwSTU5?=
 =?utf-8?B?U1FlRlRhck5nL3ZPK1dxaVl6SDErUFpDQTZ1elR1ckdkczR3VW1taTI4ZmJE?=
 =?utf-8?B?U2I1M1U5azF4cUNPZFVVNjI2ZGpqNEF2M1JkTGhkQ0oweHZLOW1KcWRYcFMv?=
 =?utf-8?B?cERQQUZFanM4R2NWUE1FNHZuSkF0L2tlOG4wcXFDU1haVGdHR3hEcEorR2N6?=
 =?utf-8?B?TWx1eWJNcnVRVVAzM1o0WGVqRkg4K005YlpBeXQ4NkFCb01wamNKa1JzRm1G?=
 =?utf-8?B?ZmVnSWpTQ2gzdUVINENndVNtNUZPNjBDQ2laYVZSVmF0Q1l4SXFhRkFJSEpU?=
 =?utf-8?B?RFZ5MTlwcC90MzF4WTRhSk1oR1p3M1N5R0ZSNDlCbDQzbTlyeTJGVkpLOExy?=
 =?utf-8?B?TnhTdVlqcTVmbXZGcnFnaDQ2ZXhGOWM0dUU1MlJoWFpJTGJGaTlEUjd3c3JY?=
 =?utf-8?B?WmQ1VHk4SjdYYXo5WDZQckZsdnRJYXF6Q1RNa091ejdJSWJySzQvejNVTmZ0?=
 =?utf-8?B?dHRMVW1xbnlFeDYyTzlJTDhTSTRackpkWVFMa1RsOWxpcjcwZnF3UzBCdDdz?=
 =?utf-8?B?MVlsWlAxK2FzaW5vVjY0TzV6OFN6N0V6UnoxUVVTeHdidmZORiszeGlvMFJ6?=
 =?utf-8?B?NnpuM2Z4S3ViQWVCWnM0RlVwZEdEOGs0ZnFyb1J2aCtrMFBzU09Kb2FFOVdu?=
 =?utf-8?B?QkNNUnJscDkxRXo0RWdYczcwVlB3ZEVubmo1Z3h0cmM1RVRuSEg5S1BGaE9t?=
 =?utf-8?B?TnlRM0lNV2ZEaGRzUEZEMmRoVjllOEI5ODBENTRIRlBFRjk3ejExTmtYNG85?=
 =?utf-8?B?VDJxc0lRNmdheHp6cy8rTXZ4cnVoNUdaL01GWmdhN2l3bCt3RXdZT2FCV1RN?=
 =?utf-8?B?RUhyblQ1RHNtdlAzUFlrRWs0OEE0SjRqRE9JRTBUWmIwNlptT2l3RmV6U3dJ?=
 =?utf-8?B?Mkt5Mk5CY3lVbEU3WEVKdFZTZUVyV2JER1pNZW1MVWdrT1E2NGFUTTg1aE9a?=
 =?utf-8?B?dVlVcHJkUU5MRHlTTmY3TjYxcTVMcFFOamhCb1pBeno2ZUd3V1FlVldLbUZ3?=
 =?utf-8?B?RC9Pc09SWkdMR3RSVkdrUGxqNXBtODJGRkxaeTFkUWhjZVRqaC96amZrMUhH?=
 =?utf-8?B?aFdRSWwySVJyWElpVmpwZG9ETmw3ZmlRbTJDWnRzWGk2Q3dING05cVptbGJn?=
 =?utf-8?B?T3RNY1hneEpYNGdQaFRJckxOeTNkQ1ZZRW14a005RmJ6MTVKRk1nN0FlK1or?=
 =?utf-8?B?M3h2RVRzazFiUytVMUpnbGRCSWdKejBtSTFtZHZ0TnJ2WTNTZWxkNWd4QWY5?=
 =?utf-8?B?cmZvVTE2STRXNnZZc0NxY09mNjVvazdXWEJDUEdXelRmY0JDUHZXVUZlRWVJ?=
 =?utf-8?B?djkrN00yZmcwRzFrWGpBWG5OSmRFM1o4SEZqaTZQa0k5Rk90eFREeG03UHFK?=
 =?utf-8?B?WlVmS0EwYzBmYTZUaldVN2JENHJxc3JWZmdzM0JhMEpZQlM5MEdJVmE3eDIr?=
 =?utf-8?B?TnlRUzZvZWc2V3l5UEdjbmcxaGd6c1NJeDVRM0ZXeXRLelU4UkNMYkZZdnRP?=
 =?utf-8?Q?pn244JI12SSlSyAjsRsmgbANCAUJG7d7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE81bk1mc0cwRGU2Q0U3TU9xYXo5MHN4S01wU3pwM1phaXJkWDVCc2YxNFhh?=
 =?utf-8?B?TTYwUGR5VFNNcHJzVDBZSVhDMkVTNktrZlBCNytTeTZWbStGYjFrSnFzenZo?=
 =?utf-8?B?QjNsZlNmYlZUbmlUS1JBUnFCQTFuN2Vlc2xvMktZdkxadGNGKzVmTDBUNjVn?=
 =?utf-8?B?dzVTV3ZUa0MrZGVYckpZdTJUcEI2SStHMVZDT1lBRVRTQXdmZHM1SlQrNzdF?=
 =?utf-8?B?K0hEYVNROU02L2JxZFJVOTNHblFHRldudWFvZEwrQkYvbElLOXJmdjQ2WVlP?=
 =?utf-8?B?VlBwRS8vcFZOcSt6S3BxeVdrTFUrSU12TTc3Ull2MUVDUm5JMW1WRnRkTFZI?=
 =?utf-8?B?Y1RZeGlMMWlXZ2dDQnpiUVVtMjZ3T0huTXJUdWUzbmgrZUo4ZU9kYTczTy9F?=
 =?utf-8?B?MlVRcHNHTjVyeUxybEJ1VlI2ZVRRUWo3R1N3SDIvYXYxcm81UjZjaTNUbXA4?=
 =?utf-8?B?c0VhL2RtL3M3ZXhlM1RwRTJqVitqSU4vSUNCbWFnQlUwRXJROVgyaUJjUkRJ?=
 =?utf-8?B?czdJV2JlejIzZ3prc3JLMFBnTE51Qkh1OWdqb0VOTEpEa01SK3dzZDYrUk9P?=
 =?utf-8?B?cW45blNnVnB6aW9Zd0YydEJ1OUE1Z1lwb1J1M1BVWXBPcVVkSGxsTkI1aSsr?=
 =?utf-8?B?VTBqS0hyUzNPelRNWHFtWGovWE1OU21HZEFWNkFORWhCelRyajZxT1FZa29C?=
 =?utf-8?B?N1cwK1lySFhPSm1SMnh5QUpRL0lPMkZvdHNMNjQ5ZWI3bU4rSnMxVUg3eUta?=
 =?utf-8?B?NUZ1RWxsd3J4Rm12dDZQY3o2TnFXOWQ1TVV6aGdWNm1MR1Z6NlQrZ3AvRHZY?=
 =?utf-8?B?cm1OLzRtUkVYZS92bXFVSml0ZENDeHdJbVgzeUR4TkZiemFKY2pBdTJmV0xk?=
 =?utf-8?B?WEJUUUJoNm9HdFFpb2JBU3IzcVdlelpOUTFkOWwzQnNUcEpVeDVaWjJRWFJQ?=
 =?utf-8?B?ZDJjZDJHMVdxemVaNDlZQXZ5dHl1NEh2VTd6L3ZsUXN4SkdWOWZYR2IxdGlx?=
 =?utf-8?B?Q0lOenVrUHNHOVNIbCtyTXJaWVFMMDd4N3BSWkJ4dDNYMjlQV0ZjS0U3cXNo?=
 =?utf-8?B?cnNCMFFaYktQUUlSS3dvREthY1F6NU93ZE1ldGFXNndiMktEaHF0TEN1M2ZN?=
 =?utf-8?B?ZE5nS2htOC85SUo1Z3FDbnRuMWRJbm5SUHhPUWMrVzhMSnViTklVRlBsN1lN?=
 =?utf-8?B?UStjREQvMmdpSVBhdWMxSTZTL3lSL1UyRGdBcDduMEwyRW5pN0plT3Z4NWRp?=
 =?utf-8?B?UDViMTdLS2NBZVpmL1BhUWNPbUt1RVlIVXY2Qmk1cEh6NkI5NW94UG9pUS9M?=
 =?utf-8?B?SjFpcGhIeFJHc3BqZW52ckR3VEJXZGlMcHdpSkhOdjR4bCtReVFVVUZhNzAw?=
 =?utf-8?B?SEs0UThCM2YrT2pIVXFHMVBIYjNoSVh0TlFSQWVNKzNOS1A5Y28reTVYajRp?=
 =?utf-8?B?alY5UG80bytQSkRJNkpCUytQOXhoY29SdXFuUmowRGlqMTFkb3duVG1sMGJ0?=
 =?utf-8?B?NGwxVndYQ2gyejhMNnV5K0JkYWlucExYcEhoQkRGeXVjNWxCWStvR0VHRUZQ?=
 =?utf-8?B?QVpkdnZGVzYrcEtFOExJSUJzNmlNZmNHNUpYT0JPaldMZmpiMlBvM0lrU081?=
 =?utf-8?B?Njd4MzFuK1NHYlZiRDVURXVFRGpJWmJzbXJ1UUY1WEhOa1ZOV3FlNXVDa1lU?=
 =?utf-8?B?aG40b2VtWUtLL2NnZzB1YWhaaVpJMjI2ckRjNmw2Z09RNTZrSVQ4SzZ5Z2Np?=
 =?utf-8?B?ZStlQ3I1THJLNTNpTzdHVzluY2hlZk54Q0NtQStNb2loTDhuWms2ZFA0aStR?=
 =?utf-8?B?a3NxOWhsWmkxczhsSnBCS0NlUEtkcjAzdHQyTFVOeFV6dk1YT2JlSVVUSFZX?=
 =?utf-8?B?dC9FbmNFQ0tlRm1qNmRZdXZnemtQUG5Mdlo5TWYxQ3FGa2pQR0Q3N3c4K1FW?=
 =?utf-8?B?aEtaWW00MEtpNThMM3Era09UYktiamhMbk5oV0RsbDVJdGkvUVpVUjd2R1hu?=
 =?utf-8?B?eEhzc1RmUjY5ZmJhcDd6Ym1nbUt3SE9SVkRyVXZpR1VIMTFIdTQ1ZFc0cHB0?=
 =?utf-8?B?OER3bnhqMDU0WGJPYXBzVEhNNW05dmZVbG93cDBQeExsSmdKTngxT2JCMGpS?=
 =?utf-8?Q?6yAzFT413yoGTo6goyN3bflqC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee762a68-f048-46a8-3dc4-08de398c6c8a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 14:40:41.4722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNBcrP1V3DOakrQvdkU5XugClO6Mkcr4+7kicYeyzErooyS5YoVYIm8kr497IZedIEVUvW4Bvgu/S7bORsQgCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6668

On 12/12/25 6:39 AM, Mika Westerberg wrote:
> Hi,
> 
> On Fri, Dec 12, 2025 at 12:10:24PM +0800, Chia-Lin Kao (AceLan) wrote:
>> Hi Mika,
>>
>> On Wed, Dec 10, 2025 at 03:42:21PM -0600, Mario Limonciello wrote:
>>> +Wayne
>>>
>>> Here is the full thread since you're being added in late.
>>>
>>> https://lore.kernel.org/linux-usb/20251209054141.1975982-1-acelan.kao@canonical.com/
>>>
>>> On 12/10/25 1:41 AM, Mika Westerberg wrote:
>>>> Hi,
>>>>
>>>> On Wed, Dec 10, 2025 at 11:15:25AM +0800, Chia-Lin Kao (AceLan) wrote:
>>>>>> We should understand the issue better. This is Intel Goshen Ridge based
>>>>>> monitor which I'm pretty sure does not require additional quirks, at least
>>>>>> I have not heard any issues like this. I suspect this is combination of the
>>>>>> AMD and Intel hardware that is causing the issue.
>>>>> Actually, we encountered the same issue on Intel machine, too.
>>>>> Here is the log captured by my ex-colleague, and at that time he used
>>>>> 6.16-rc4 drmtip kernel and should have reported this issue somewhere.
>>>>> https://paste.ubuntu.com/p/bJkBTdYMp6/
>>>>>
>>>>> The log combines with drm debug log, and becomes too large to be
>>>>> pasted on the pastebin, so I removed some unrelated lines between 44s
>>>>> ~ 335s.
>>>>
>>>> Okay I see similar unplug there:
>>>>
>>>> [  337.429646] [374] thunderbolt:tb_handle_dp_bandwidth_request:2752: thunderbolt 0000:00:0d.2: 0:5: handling bandwidth allocation request, retry 0
>>>> ...
>>>> [  337.430291] [165] thunderbolt:tb_cfg_ack_plug:842: thunderbolt 0000:00:0d.2: acking hot unplug event on 0:1
>>>>
>>>> We had an issue with MST monitors but that resulted unplug of the DP OUT
>>>> not link going down. That was fixed with:
>>>>
>>>>     9cb15478916e ("drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_COUNT_ESI read")
>>>>
>>>> If you have Intel hardware still there it would be good if you could try
>>>> and provide trace from that as well.
>> I tried the latest mainline kernel, d358e5254674, which should include the commit you
>> mentioned, but no luck.
>>
>> I put all the logs here for better reference
>> https://people.canonical.com/~acelan/bugs/tbt_call_trace/
>>
>> Here is how I get the log
>> ```
>> $ cat debug
>> #!/bin/sh
>>
>> . ~/.cargo/env
>> sudo ~/.cargo/bin/tbtrace enable
>> sleep 10 # plug in the monitor
>> sudo ~/.cargo/bin/tbtrace disable
>> sudo ~/.cargo/bin/tbtrace dump -vv > trace.out
>> sudo dmesg > dmesg.out
>> ./tbtools/scripts/merge-logs.py dmesg.out trace.out > merged.out
>> ```
>>
>> And here is the log
>> https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.out
> 
> Thanks!
> 
> It shows that right before the unplug the driver is still enumerating
> retimers:
> 
> [   39.812733] tb_tx Read Request Domain 0 Route 3 Adapter 1 / Lane
>                 0x00/---- 0x00000000 0b00000000 00000000 00000000 00000000 .... Route String High
>                 0x01/---- 0x00000003 0b00000000 00000000 00000000 00000011 .... Route String Low
>                 0x02/---- 0x02082091 0b00000010 00001000 00100000 10010001 ....
>                   [00:12]       0x91 Address
>                   [13:18]        0x1 Read Size
>                   [19:24]        0x1 Adapter Num
>                   [25:26]        0x1 Configuration Space (CS) → Adapter Configuration Space
>                   [27:28]        0x0 Sequence Number (SN)
> [   39.813005] tb_rx Read Response Domain 0 Route 3 Adapter 1 / Lane
>                 0x00/---- 0x80000000 0b10000000 00000000 00000000 00000000 .... Route String High
>                 0x01/---- 0x00000003 0b00000000 00000000 00000000 00000011 .... Route String Low
>                 0x02/---- 0x02082091 0b00000010 00001000 00100000 10010001 ....
>                   [00:12]       0x91 Address
>                   [13:18]        0x1 Read Size
>                   [19:24]        0x1 Adapter Num
>                   [25:26]        0x1 Configuration Space (CS) → Adapter Configuration Space
>                   [27:28]        0x0 Sequence Number (SN)
>                 0x03/0091 0x81620408 0b10000001 01100010 00000100 00001000 .b.. PORT_CS_1
>                   [00:07]        0x8 Address
>                   [08:15]        0x4 Length
>                   [16:18]        0x2 Target
>                   [20:23]        0x6 Re-timer Index
>                   [24:24]        0x1 WnR
>                   [25:25]        0x0 No Response (NR)
>                   [26:26]        0x0 Result Code (RC)
>                   [31:31]        0x1 Pending (PND)
> [   39.814180] tb_tx Read Request Domain 0 Route 3 Adapter 1 / Lane
>                 0x00/---- 0x00000000 0b00000000 00000000 00000000 00000000 .... Route String High
>                 0x01/---- 0x00000003 0b00000000 00000000 00000000 00000011 .... Route String Low
>                 0x02/---- 0x02082091 0b00000010 00001000 00100000 10010001 ....
>                   [00:12]       0x91 Address
>                   [13:18]        0x1 Read Size
>                   [19:24]        0x1 Adapter Num
>                   [25:26]        0x1 Configuration Space (CS) → Adapter Configuration Space
>                   [27:28]        0x0 Sequence Number (SN)
> [   39.815193] tb_event Hot Plug Event Packet Domain 0 Route 0 Adapter 3 / Lane
>                 0x00/---- 0x80000000 0b10000000 00000000 00000000 00000000 .... Route String High
>                 0x01/---- 0x00000000 0b00000000 00000000 00000000 00000000 .... Route String Low
>                 0x02/---- 0x80000003 0b10000000 00000000 00000000 00000011 ....
>                   [00:05]        0x3 Adapter Num
>                   [31:31]        0x1 UPG
> [   39.815196] [2821] thunderbolt 0000:00:0d.2: acking hot unplug event on 0:3
> 
> By default it does not access retimers beyond the Type-C connector. I
> wonder if you have CONFIG_USB4_DEBUGFS_MARGINING set in your kernel
> .config? And if yes can you disable that and try again.

If this does end up being the reason - maybe we should make this really 
noisy in logs and/or taint the kernel.

