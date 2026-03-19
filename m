Return-Path: <linux-usb+bounces-35175-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEWjCeE1vGl3uwIAu9opvQ
	(envelope-from <linux-usb+bounces-35175-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 18:44:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2964A2D0336
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 18:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AC620308C4A3
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 17:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E5D3491EB;
	Thu, 19 Mar 2026 17:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="toEBUBu1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0099337EFEF
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773941570; cv=fail; b=gNC58pksZM3fZfpCM07KlOrJdfjvfNjYnTvCZDeAMH482r6H/0RvpQxi4neaJRc2deqOdWlWb9RqOPZ0i3fLZ0Rt14FFdqwQQBOLcvPI/2YVKDLzMdNFU63xeuawZKcQ4etR2SaYNzmGMeTnko0nd7AkdqSm4LL3kQEn2+fYNXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773941570; c=relaxed/simple;
	bh=tYV5qadG96H5HIyVCsl4YHNDFTURmLEb2sRXap/oaRQ=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=ZnQWLovhPWHayEf/s9dF3alZGG8ZkYf4yhzfJV2Odh4USeYZfp2U6UyCvtseMzEzg699tLbiBQbQIdBj/QKwNySbYd+RNMxBWA22cytt+QYUNFWbnYoSXMKRY1IbWOuPpqHmJ73lwODDt0lTjm7++UI2rYizI4GTE77rNIeVjsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=toEBUBu1; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JGNRqN484009
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 10:32:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2025-q2; bh=djHVw/MGnCBmD30J1v
	mynoIb4/rpQahxpXenlo4/gg8=; b=toEBUBu1J8DBC/VV3Cu6nljKyKOYEBcIvu
	6sf57x+df/y0vbOM3KdAmYq7B/J82tDvxuropBnmlWdmrmWydedJjaH7k4edNMER
	1OoL9l3H22nInoEkOwfjTKuTcA8gJ0toVliaaV3EFWF/sTc0dvf/arC0td4/E1qp
	GnHLyltpOOGmFXdKKuJhWLKNoJveJT+G2lwBsnSFbCfusqW9YM2p7yuE5uG/Wunw
	PrUkbqeQVlCRK+qfbetEks9n+NlOy2qMtYMR+4qcqJaKExUP4qcAyS6xnPkR0IJe
	JRADRTq7yfPPmoi5q+pi36oKlCqa3RAjq3JR3L2VzGiLhFwY5WhA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4d0h6fwdy8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 10:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGOfJxshPMrd/lqvvXCXRr4uEhGVg/My2+RtbzifTt2Sz6sQe2niYSTlJhGgjio9qOex04gps/MDIXCkITTJh6XOxJJXuyTnl6jfrhb1aSY/yWmMjfWTun4Zd1VPtYfTa4cmpTXS4g4ft5lErvjkXrLE2eshruISdobMK7/IZDD3oZ1heTGNTEoGq0orNQdaPZftteSid/qM3pyxIAsqM8XZcVcrvtBctpVGvxfIUqMWyrTq4xJ5xqYoQwY3t7+clRdqRo9yBeg9Bp2XaCzo0s8YBGnsfyxsq8lnWFucD1c/On7dZZdX0/eqU878KOhtjQ6yogIIeYj5L21YrTkxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djHVw/MGnCBmD30J1vmynoIb4/rpQahxpXenlo4/gg8=;
 b=bBV4i+hUEQ4hDQB3fuux53vHo148HuURtVNlJbkURxKwJGlIR9Yvt8iu3a2aB/knHObxBbd/6w30BKcqWZPdjk/GqZC1PJxj/EcSB0n9rarozG2orjtlh9JtDWZQueSdun4Jf/nUnTbeQLzY/UzhOGHmZ34PmGQ+vK7g91HY0hNAer8FqgosacE9cil6dtjmUPLWW23YA8IXcxWphQPKNcfCIJRKjskhuyruWJFnnA+BV096GJOhYvqg1/bWHx/32H4aUI5XhqXchhn+zBvpTilOFpSYaJnV6IN+cwvCX7wrr5/Ysi3S67KL7Q4YsW/xyz4ItIxYkFDoViwuHLQJkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from IA0PPF4ADFF9CD6.namprd15.prod.outlook.com
 (2603:10b6:20f:fc04::b1b) by SA1PR15MB4870.namprd15.prod.outlook.com
 (2603:10b6:806:1d1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Thu, 19 Mar
 2026 17:32:35 +0000
Received: from IA0PPF4ADFF9CD6.namprd15.prod.outlook.com
 ([fe80::9380:ef9:bb4:480c]) by IA0PPF4ADFF9CD6.namprd15.prod.outlook.com
 ([fe80::9380:ef9:bb4:480c%8]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 17:32:35 +0000
Message-ID: <2303186b-1555-4796-8bcf-8b95adab4bc2@fb.com>
Date: Thu, 19 Mar 2026 17:32:32 +0000
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linux-usb@vger.kernel.org
From: Mark Harmstone <maharmstone@fb.com>
Subject: hub problems on high CPU load
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0528.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::10) To IA0PPF4ADFF9CD6.namprd15.prod.outlook.com
 (2603:10b6:20f:fc04::b1b)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PPF4ADFF9CD6:EE_|SA1PR15MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f459b3-6b89-4af5-e35b-08de85dd81f1
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|19092799006|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8tzxiuY+pQ+XCkrWfEPzkUZl9x29dvVLsJtE3iqgmqo5w1eFjcKcdq6/SJYPXOtHCf4CnWhlhsLW/m7QOI/3Z5nMhLIpyCc5igsASLEe4929mIOoEd1f/rQrDpJ5u0p5x1MkeGBdt3NGQhAV+JYT/LN/q1gJXHIbvOzyk5TIQJDiKkUfl40rZlN2NTfKaYIVOxJWLkBpdL8wDDS+rU3B2kfAfyNHLpS6Ug5NvaLEowrlK127Hsp+PIoPEkaohUUHW833g6/QEHQ2rfKpQShG2DkQGw1mlefdTvop9o3p4XIC4wnSQr7WO1BB2KqU1Q+KDEDObsiiYfy8Fo9U4WuG0Cx0lKApTGYvwTyxIoo9Ary9MkLEyzUXKtgtiuqkPyyxR3pi+J01orAiFI2RSSZEScBNNMGJT+z4CktiB9oveZorXVPYk6VyFsvXpBA3ujyLW3ovRY0hEzxy67M9BL1vG5ZaKLsS0PP7UpLDqL/HPFR44Enbr6xPN2jxcLAuCIektXHTCVufVgOo3hZJC7WoWKk/keRrhfuqY7EQRe6Yd1oIc6S9kY1soCRsK43Jg4IEaOid+w7DjJzTHhS3iUZVrTKaMI4z+2LDmdbEVR8xPncqsbbgfJf6R5whcRDdKZJiy9jqNLt6LQ8KZvUJOkeDh8c4INm81j4EktHtFyw1ZrU9bOpHfINm1OwdsnetDDvfVmICPqmkQDxaFHzXsmlve416zYur1ajLL7AX+xijE8k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF4ADFF9CD6.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(19092799006)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXJMM0VnL3d2R2p5MnhUb090TC9nb01lNENjeVNzWElKcmdRR0F3Vk1uQ2Q5?=
 =?utf-8?B?ZEs1RCtqWGJVaE9lQnFNUFZuUFQwTUE0cVlRNDhibGJRWmxIc2syRDd5Nnpk?=
 =?utf-8?B?NWJ0REE5ZjVkN1dpR0U4M1MweGFwN1NLWjBUNnE4TFdSZEFqQ0JQeUVDT0NH?=
 =?utf-8?B?R2ZFdUlkSDRTdE44QlJ3SlFFYW5zSnNOYWtEMkJPQjR1VmUvQ2E4TUZFcHdo?=
 =?utf-8?B?SVlaNTBJNW5FZ1JTazNFTkFlWTEwUG16QUZyUWFTSVcwbUZnWDVzby9NaVU3?=
 =?utf-8?B?VzhlakhqQnhXeWJXelN5OUpydUcxZnVXdW9NYXVVTzFsdFdFeVczSzFhZGVU?=
 =?utf-8?B?UXZHUE85NW1zSVRwMlFJTGxIZDFQQkdPM1FHc1VMc1JUYWZFMTBobEgvSy9N?=
 =?utf-8?B?OFNhUjlQeTNGTGxWUHV0ZG12TkJqd2JXZWhtTHdFN2tIVURrRzdZRWl2U2JB?=
 =?utf-8?B?Nkt2UXFTbnlRR1VYS0FwcjFPZmpMRTUrazBYOU11TENZTGM4SVpydGNPM0xm?=
 =?utf-8?B?OTBzb20rRGpHV3NiT1NmNlIzRzRjeXN5TUVLdHlpVklrV2poQTFubkNraEow?=
 =?utf-8?B?dS9pUklTaHhXTEFhWUFLSVFJSFFacFNFKy9VMG0wRGdhM29HcnpXUy8wUHJa?=
 =?utf-8?B?TDF5Z1ZxSEh3dDA1MGdzUVVkbEJTUmJSTFduM1p5K3NhZzM0ZXp4OEF4RkNP?=
 =?utf-8?B?ZEJyc3V5NkE1UUcwenZtKy83ZUx3dzJWK21zWXVaSjhoMGNKMjQvMElKZWJj?=
 =?utf-8?B?eHJCOVZJMGgzcXFERk13Z3JaWmxTZ1BKODNmT3F5R3V2RUIyQmNQWFdQeThG?=
 =?utf-8?B?QVBXNEJPczRVRlRCQjh0TDRKWTdlQ2FzREkzd3Z0dWduY3NYajZwY0xNK0dp?=
 =?utf-8?B?QjZ5dXlocWR1R2NleUM5bVBUdUkvK0hZRXZZRzNuVzN6bnZhcU5BWWJXcG54?=
 =?utf-8?B?TzVnaG81dmtEcVZFV2UrYkI5U3FkVHpvYklsWGhwam5qWVQ2Q2R6N1Fnc0s4?=
 =?utf-8?B?dXcwVnRxNFFIRlJNUjVrQ3NlV0VKem1QenJzdi95M3lZQXdJNmlnWUNSWHhT?=
 =?utf-8?B?QjFXNGNUcEFEQ25Icnd0cFVNQk5IaXdRZ0htWVJHa1FBWTZRdmtEMkFkYlYy?=
 =?utf-8?B?OUZKSmN5SCs1SDJUUmZKMFd0NWRLc2Q5MTB5T0wwSW9ERlhQT0pEVGR2TC90?=
 =?utf-8?B?QjIxYkZZZGE2RXlyZzlhK2NWcGlqdW1pZDJjWFI2cmdjeVdwS2RLWkl0T3l5?=
 =?utf-8?B?S0JJNlp1VE8rNFZRcW5hdTJxbThWVHFjL0JtT3QwbzNzSDZwcUVGM0Qxay9p?=
 =?utf-8?B?US9BMjRiZGxXOEVLaUNpRWVaNXhnZXVlaklncEh3R3AvazlkRUFvRjVEQ01C?=
 =?utf-8?B?NmJHalpqY3Y5M1d2ZFBvOFppWlRaVmxrRWxLK0kzNGlNbUpvUmcyMVdMUk1S?=
 =?utf-8?B?TDN5ZEV5ZFVOYjdIVDRWREc3QmMvZmlweXBValpCMUJPcEVKblBuQkRZdDAy?=
 =?utf-8?B?dnkwa2VJRU1pck5EWlJabGo0dEJsbFIzbnZrZ0FITk54OW1LUTBXTC8ycEVR?=
 =?utf-8?B?NFJtVmgzUHNXR2ROWG8wam43b3lmZjJOK1IxMHg4czhZQ2FkUmNIdjZMVjNi?=
 =?utf-8?B?eDVRdnhNMEcrK0MxYWRXblFiSkhFY1VLa3BqMUVjZHhTaEFZMzdRNEorRFlI?=
 =?utf-8?B?emhCaEVBNjN6d2x1dTBwWUNLT2xSOWM3aWV0cHZYbzFBRCtEUG5YQkkrbE1P?=
 =?utf-8?B?SmZ1bWhYZWhSbUU2ZG5JK1BRbElFWEJuZG8wOTNKYWoyM2gveWVhc2V5ZG5k?=
 =?utf-8?B?RG9jZUN3dVZiWW1ubTRQaHQyMEdSTks3OXhZenZIWEdJTUp3eEtFdERvMWRX?=
 =?utf-8?B?UWFVU2loUm9oM1FJVDQvU3YrYy9HelR2a0cyUnkzV3d0YXI3Rk85bTk3d3Rv?=
 =?utf-8?B?NHBnQlRjcDh5cnhMeUJJeHd5VDBBZ0pSbGs0KzIvamV0Nmt4TEwvcU82bXRI?=
 =?utf-8?B?c3M2ZFBrTEVyUkdTNVpkdU4waHp4VlRUTGRiUHp6MzVWaFBXT0lBbDNqRldE?=
 =?utf-8?B?Qy9NVjlOdURxWittd00zN1cwZVhIbkRYbGxmYlNUSGdMVnZKaEdUQm5sV1ll?=
 =?utf-8?B?Ti9BNlNoZ0p2T3lvTE5sUURzb2p4Vzk5eVZ1Q3IxZE5BK2NObTFZNG5mRW04?=
 =?utf-8?B?RXlBMUprUDhzeEJLUnRSOVlBUjdsZFBMRlE4MjEvSXptL05PdGNCNXk0MFFn?=
 =?utf-8?B?OHFlZUVYblFtd2dESzV0b2o2aDhlTCtqT01TY3NZdXh2MU40SUd6TExneXpJ?=
 =?utf-8?B?Z3lQRjl3My9LaFl1aG1lekVmSFBuMEpEVlc4bFVneEZMZGxUYS9uUmhNTnZ4?=
 =?utf-8?Q?UY0ef7hbiXOB0JZmIB/q5CLBqTAYa6uhjdMhFYGA3hxuF?=
X-MS-Exchange-AntiSpam-MessageData-1: Zu/yIwoPyQ9gWA==
X-Exchange-RoutingPolicyChecked:
	Oj3pDIUxmGameVYg0TYKhHljKHghZwQrARTKdEbMm0RjLD60m/Z+AQB9jXuG0DwdwokY8MNBJkkylOl4NIK2pGD1Yl58C9qOOACjmK9cLD3PG+rg+etiTCl7kdU/LeE6IWdtgmjDAYxZUhC/FrkCsBQUTvt/AmhjvptX0sxDdzjpLbQLNq91C9cRqLP+OUlhV8LoEOGl90eOzamazLAzekWe0K3K0ubrwgG/x5j5F0bFNqiiNAm09NGGKDibjFAd7ISxV6aFEGRnqpEx9cjOpfsyaodVdu5RPKG/GOSHwEEnAZxULGqS/C2ywNjkgF0k7BWiE6SnRpCXrwrF6/YNfQ==
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f459b3-6b89-4af5-e35b-08de85dd81f1
X-MS-Exchange-CrossTenant-AuthSource: IA0PPF4ADFF9CD6.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:32:34.9658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIFUnqjB0ywgATpI2eMm73AvYj6LbIZcaGEKDOKuvgF9Y+rlZj3wW3lOJT9MhGGrKBG+zpPRgjCEOzCcR2rC3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR15MB4870
X-Proofpoint-ORIG-GUID: 7AuQ4mB53I9TevQqDmmcSUJUVbggP7Lz
X-Proofpoint-GUID: 7AuQ4mB53I9TevQqDmmcSUJUVbggP7Lz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE0MCBTYWx0ZWRfXy5qDjCVijml0
 h6X4bxqXwvpVqMbKYlF8mGmYpVSTkqAd2hPcai2OkL3aY6tEASknUFQGYvE+LxVk8TOjvf8l8lI
 YSwDg707oCIxNnlc6M/33LhyAsPHeM3EnPQ1zQv/04NevibI97d8YtC+J0xySoNB0yCmPjuxhzG
 C+MmLqCbgt2ogyw3TV9yTdmwGQabxT7dyM4WDVsLDMVf30bQpvGCjMvuYPGOUja+b8sVJzGmgbJ
 hU8uul4pw9AviqPqYQff5GdujGwzyOMX7EHEcvYozkixqATa8YlnVPGmev3rZXhxoL9+08/UeM3
 j6DvPecVhwhx7GRxpdEwp5jDZt7VReS5Od2CW0UJaZiOslk/zPW3Z8nrVewXALGMDPEP4u9EtbE
 5Cx9sIAWv33MExflwUKNj6M6xAK1HOTOQROydT46XDDFp3ERQV6006u6kaY1BdHmy1UKaEtyPdS
 kBK12kG8LWVWvIZl2gg==
X-Authority-Analysis: v=2.4 cv=b+S/I9Gx c=1 sm=1 tr=0 ts=69bc3336 cx=c_pps
 a=Ja4avHF4q49+S+GKa94BQQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=wpfVPzegXHpEFt3DAXn9:22
 a=OerfoCW6710NuIcYxSAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[fb.com,reject];
	R_DKIM_ALLOW(-0.20)[fb.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[fb.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35175-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maharmstone@fb.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2964A2D0336
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

I have a monitor with an inbuilt KVM switch - it has USB ports into 
which my mouse and keyboard are plugged in, and appears to the host as a 
USB hub.

Twice today I've been working on my laptop with my desktop running 
Gentoo doing "emerge qtwebengine" in the background, and when I've gone 
to switch back the mouse and keyboard don't work. The first time I 
rebooted, but the second time I unplugged the hub and plugged it back in 
and it seems to have fixed it.

This is on 6.19.0, I don't recall anything similar happening on previous 
kernels. I think it's high CPU load rather than an OOM as there's 
nothing in the log about anything being killed.

Thanks!

Mark

> [ 6695.077406] rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: { 18-.... } 21 jiffies s: 11233 root: 0x2/.
> [ 6695.077413] rcu: blocking rcu_node structures (internal RCU debug): l=1:16-31:0x4/.
> [ 6695.077416] Sending NMI from CPU 13 to CPUs 18:
> [ 6695.077420] NMI backtrace for cpu 18
> [ 6695.077423] CPU: 18 UID: 1000 PID: 7947 Comm: CanvasRenderer Tainted: G           O        6.19.0 #2 PREEMPT 
> [ 6695.077425] Tainted: [O]=OOT_MODULE
> [ 6695.077425] Hardware name: ASUS System Product Name/TUF GAMING B650-PLUS WIFI, BIOS 2613 04/12/2024
> [ 6695.077426] RIP: 0010:rt_mutex_slowlock_block+0x13d/0x1b0
> [ 6695.077430] Code: 8b 45 18 48 83 e0 fe 49 39 c4 75 21 41 83 7c 24 34 00 74 20 41 8b 44 24 14 48 f7 03 10 00 00 00 75 12 4d 39 7d 10 75 0c f3 90 <eb> d3 90 e8 4b df 63 ff eb 0a e8 44 df 63 ff e8 4f e3 5e ff 4c 89
> [ 6695.077431] RSP: 0018:ffffc9000afe7c28 EFLAGS: 00000246
> [ 6695.077433] RAX: 0000000000000009 RBX: ffff88821cceac00 RCX: ffff8881b72d1601
> [ 6695.077433] RDX: ffffc9000afe7d40 RSI: ffff88821cceac00 RDI: ffff8881021fbe50
> [ 6695.077434] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000000000d784
> [ 6695.077434] R10: 000000000000d784 R11: 0000000000000206 R12: ffff8881b72d1600
> [ 6695.077435] R13: ffff8881021fbe50 R14: 0000000000000000 R15: ffffc9000afe7d40
> [ 6695.077435] FS:  00007f54425ff6c0(0000) GS:ffff88903ca0d000(0000) knlGS:0000000000000000
> [ 6695.077436] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 6695.077436] CR2: 00007fcbd210f400 CR3: 00000001aa953000 CR4: 0000000000750ef0
> [ 6695.077437] PKRU: 55555554
> [ 6695.077437] Call Trace:
> [ 6695.077440]  <TASK>
> [ 6695.077441]  rt_mutex_wait_proxy_lock+0x41/0x80
> [ 6695.077443]  futex_lock_pi+0x2a3/0x510
> [ 6695.077445]  ? __futex_wake_mark+0x40/0x40
> [ 6695.077446]  ? wake_up_q+0x4c/0x80
> [ 6695.077447]  ? futex_wake+0x16d/0x1a0
> [ 6695.077448]  do_futex+0x129/0x150
> [ 6695.077449]  __se_sys_futex+0x11f/0x1a0
> [ 6695.077449]  ? restore_fpregs_from_fpstate+0x40/0xa0
> [ 6695.077451]  do_syscall_64+0x61/0x620
> [ 6695.077452]  ? arch_exit_to_user_mode_prepare+0x9/0x60
> [ 6695.077453]  ? irqentry_exit+0x37/0x4f0
> [ 6695.077454]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
> [ 6695.077455] RIP: 0033:0x7f546e6c78cf
> [ 6695.077456] Code: b9 01 00 00 00 e9 21 ff ff ff 90 f3 0f 1e fa 49 89 d2 85 f6 74 45 89 ce 40 80 f6 8d 48 85 d2 74 3a 31 d2 b8 ca 00 00 00 0f 05 <83> f8 da 74 3c 83 f8 92 74 18 8d 50 23 83 fa 23 77 35 48 b9 01 20
> [ 6695.077457] RSP: 002b:00007f54425fe848 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
> [ 6695.077457] RAX: ffffffffffffffda RBX: 00007f5448687f30 RCX: 00007f546e6c78cf
> [ 6695.077458] RDX: 0000000000000000 RSI: 0000000000000086 RDI: 00007f5448687f30
> [ 6695.077458] RBP: 0000000000000000 R08: 00007f54425ff6c0 R09: 0000000000000000
> [ 6695.077458] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> [ 6695.077459] R13: 0000000000000001 R14: 00007f5448687f40 R15: 00007f541ae3b600
> [ 6695.077459]  </TASK>
> [ 7175.458090] usb 1-7: USB disconnect, device number 49
> [ 7175.458096] usb 1-7.2: USB disconnect, device number 50
> [ 7175.680358] usb 1-7.3: USB disconnect, device number 51
> [ 7175.823763] usb 1-7.6: USB disconnect, device number 52
> [10508.257777] usb 1-7: new high-speed USB device number 53 using xhci_hcd
> [10508.493010] hub 1-7:1.0: USB hub found
> [10523.797346] hub 1-7:1.0: config failed, can't read hub descriptor (err -22)
> [10523.808860] xhci_hcd 0000:0a:00.0: USB core suspending port 1-7 not in U0/U1/U2
> [10528.917400] usb 1-7: Failed to suspend device, error -32
> [10528.917435] usb 1-7: USB disconnect, device number 53
> [10531.591152] usb 1-7: new high-speed USB device number 54 using xhci_hcd
> [10531.824808] hub 1-7:1.0: USB hub found
> [10531.828685] hub 1-7:1.0: 6 ports detected
> [10532.171254] usb 1-7.2: new full-speed USB device number 55 using xhci_hcd
> [10532.521914] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:02.1/0000:03:00.0/0000:04:0c.0/0000:0a:00.0/usb1/1-7/1-7.2/1-7.2:1.0/0003:046D:C53D.0062/input/input92
> [10532.613001] hid-generic 0003:046D:C53D.0062: input,hidraw1: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:0a:00.0-7.2/input0
> [10532.630890] input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:02.1/0000:03:00.0/0000:04:0c.0/0000:0a:00.0/usb1/1-7/1-7.2/1-7.2:1.1/0003:046D:C53D.0063/input/input93
> [10532.630974] input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:02.1/0000:03:00.0/0000:04:0c.0/0000:0a:00.0/usb1/1-7/1-7.2/1-7.2:1.1/0003:046D:C53D.0063/input/input94
> [10532.682041] input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:00:02.1/0000:03:00.0/0000:04:0c.0/0000:0a:00.0/usb1/1-7/1-7.2/1-7.2:1.1/0003:046D:C53D.0063/input/input95
> [10532.682113] hid-generic 0003:046D:C53D.0063: input,hiddev97,hidraw2: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:0a:00.0-7.2/input1
> [10532.697804] hid-generic 0003:046D:C53D.0064: hiddev98,hidraw3: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:0a:00.0-7.2/input2
> [10532.783926] usb 1-7.3: new full-speed USB device number 56 using xhci_hcd
> [10533.168829] logitech-djreceiver 0003:046D:C52B.0067: hiddev99,hidraw4: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:0a:00.0-7.3/input2
> [10533.292744] input: Logitech MX Master 2S as /devices/pci0000:00/0000:00:02.1/0000:03:00.0/0000:04:0c.0/0000:0a:00.0/usb1/1-7/1-7.3/1-7.3:1.2/0003:046D:C52B.0067/0003:046D:4069.0068/input/input97
> [10533.332006] logitech-hidpp-device 0003:046D:4069.0068: input,hidraw5: USB HID v1.11 Keyboard [Logitech MX Master 2S] on usb-0000:0a:00.0-7.3/input2:1
> [10533.379238] usb 1-7.6: new high-speed USB device number 57 using xhci_hcd
> [10533.535878] hid-generic 0003:0BDA:1100.0069: hiddev100,hidraw6: USB HID v1.11 Device [Realtek HID Device] on usb-0000:0a:00.0-7.6/input0
> [10535.673514] usb 1-7: USB disconnect, device number 54
> [10535.673520] usb 1-7.2: USB disconnect, device number 55
> [10535.875368] usb 1-7.3: USB disconnect, device number 56
> [10535.998489] usb 1-7.6: USB disconnect, device number 57

> $ lspci -s 0a:00.0 -v
> 0a:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset USB 3.2 Controller (rev 01) (prog-if 30 [XHCI])
>         Subsystem: ASMedia Technology Inc. Device 1142
>         Flags: bus master, fast devsel, latency 0, IRQ 24, IOMMU group 21
>         Memory at f6900000 (64-bit, non-prefetchable) [size=32K]
>         Capabilities: <access denied>
>         Kernel driver in use: xhci_hcd
>         Kernel modules: xhci_pci

> $ lsusb
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 001 Device 002: ID 13d3:3571 IMC Networks Bluetooth Radio
> Bus 001 Device 004: ID 0b05:19af ASUSTek Computer, Inc. AURA LED Controller
> Bus 001 Device 070: ID 0b00:5411 INGENICO USB2.1 Hub
> Bus 001 Device 071: ID 046d:c53d Logitech, Inc. G631 Keyboard
> Bus 001 Device 072: ID 046d:c52b Logitech, Inc. Unifying Receiver
> Bus 001 Device 073: ID 0bda:1100 Realtek Semiconductor Corp. HID Device
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub



