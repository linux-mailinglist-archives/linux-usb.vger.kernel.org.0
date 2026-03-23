Return-Path: <linux-usb+bounces-35324-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLenDFoZwWn5QQQAu9opvQ
	(envelope-from <linux-usb+bounces-35324-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 11:43:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B00D2F0672
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 11:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C3D03036D6E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 10:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74C638C42D;
	Mon, 23 Mar 2026 10:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="IA2nDiF4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97666383C7B
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262219; cv=fail; b=bJANuVLnqMelD73EJsTYMz5y96PwDEDjpUe/ONDjHkv3rToMaw6kcPD5bQPKzANLW+MXF4Q3O4lWkH6AExX8mLUubsnRT1IpGrem6lBzBFkcWqhZQQUzpAgfmITE/SjmX7Lm1ABwPFocxUMMhmvBoumN3ptY3lx6ACN2JVOfp5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262219; c=relaxed/simple;
	bh=HZruo/pGXNikxuBj7SGbvvxov3C0gIfjQRcnZkirqUQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 MIME-Version:Content-Type; b=MjG2wElscg76GDZsB36xKn1eaRtWf6F44QZTmdav/aaK49eglS51Dij9qDTrDm4Ob02LY2Dzy4LWjMjvkviXZHjZQKHeD2l/vsICc6rqoR+WOzVQvun8tk3r2MkAY6MvyWSQ9tL6Hyfztq7p5HiuQbkTvRNu4XB6WIccSFKjWqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=IA2nDiF4; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4UB4C904360;
	Mon, 23 Mar 2026 03:36:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=HZruo/pGXNikxuBj7SGbvvxov3C0gIfjQRcnZkirqUQ=; b=IA2nDiF4u9A7
	BEWTe3JYh6JFfmve3h7wqvfATfDtPKUcw6XLujPpjXoDVZ2MQ2PCRlNQGaP3iwJ2
	QlZ56VztAaNW0sdp2SyqtK+evG7/xs4P3Osf18HdKBiIB/Qbb6mOebGjWcKxwksK
	WYZnoqf+hADJ4bshKkN5rJxA7HysJHqIIt5Cx66/gcdjZ2z4ybnl+NH95i+tl32F
	haHiOKZfaZ+YK2d65DNiUj6XO1WoSz5U8Tnz9gQzgTSTFV5ueatZh44DlY3cKpuM
	zn9oiRp2is93pRn/ed5ptuGTTE1Arjygds7Fy93XSJyDpPHx4l7oAfT9FQLy7Qdf
	t16qtxEg8Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4d2cyd9afy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 03:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9NnnBnnZsIdD4fNOSic8tsMUvICp5cThRxbc/vexLBun/2aEvf6GjtuKUywQezhuMezLI+4bvFEMFcCQjI0EckFFSGY9pDOTv65GpOqrdrhqHW2oi4+yddQV9UgAdzeFkTsNCGcou7irDuhkTlHpgNFRuqRUWsvmtAVNjf+zQee2ljtBYNaJx99RWyzD9wizWm74tkldO7N+KoKtfgIKWnK/M0K6N6qTcxSeBT2Y9RnaBUVB05d7x/KU2JgqfXBaGDhtJXsVDQ9F9bsnZ9FN3cNOLy1B+u+IEcbILy5FZyYYjRJlRp2touH9PQsxGPYc5yopfefoyhRWb/YEutepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTervfukLbBTgvH+VHbgE1tCu+iG/ZZO+LrDlZghh2E=;
 b=j44odQS7uaLA1jj6v4JWOCxn2qdPR9ZeBFupezfQSJehPSFs4i1ar3xp7ptDsg/rIX1F47SNF2BwHI+W//QqGzf6BWR3GjQYfQvAVQNg9UzWzhiRdAhowF72+k9hV4SiqudFFqYpRWZ9e/T2OEEv3wvfK7L3KEmmZu26vf869jbVYQ5EpzJoAqN57eaG8nLaE/CSER9EaepviZ7BcH9A+ef5sX5MbujIvlv43nqh//x1YJtfweLUynn6wY6y2ctVn59Iv9uCLYPirVdBeKlyYfQOiCjnp+i90GPJXoGZPGWi4N05Dza6jmq5xSY2ET4XURLW8k5Tf6eXd+tP+ukIag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from IA0PPF4ADFF9CD6.namprd15.prod.outlook.com
 (2603:10b6:20f:fc04::b1b) by SN7PR15MB5954.namprd15.prod.outlook.com
 (2603:10b6:806:2ec::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 10:36:53 +0000
Received: from IA0PPF4ADFF9CD6.namprd15.prod.outlook.com
 ([fe80::9380:ef9:bb4:480c]) by IA0PPF4ADFF9CD6.namprd15.prod.outlook.com
 ([fe80::9380:ef9:bb4:480c%8]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 10:36:53 +0000
Message-ID: <b8584c1a-111e-4070-a02d-dc461fb2334e@fb.com>
Date: Mon, 23 Mar 2026 10:36:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: hub problems on high CPU load
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
References: <2303186b-1555-4796-8bcf-8b95adab4bc2@fb.com>
 <f80e5a6a-3caa-4579-b6c0-f5cbbb964302@rowland.harvard.edu>
Content-Language: en-GB
From: Mark Harmstone <maharmstone@fb.com>
In-Reply-To: <f80e5a6a-3caa-4579-b6c0-f5cbbb964302@rowland.harvard.edu>
X-ClientProxiedBy: PR1P264CA0119.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cd::13) To IA0PPF4ADFF9CD6.namprd15.prod.outlook.com
 (2603:10b6:20f:fc04::b1b)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PPF4ADFF9CD6:EE_|SN7PR15MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 03abed6c-3a65-43f8-61a9-08de88c81945
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|10070799003|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6sm921/odbVdWWj9lSo1uG4NFO8Bgkr3LAgUjMIPzoGg+mYUsCypBOd0faIaD/u2o3p+9dHinsMRqqHzV4VBtk1tIE+uFB5MOcD8CDZkwSE1IcUwjbLrGxOlDx1gW5duVNgMRqH0wNvdQCKNiaG+DHB7cZOUixiMtoXknD+uewfwqkj+RDoUIxknkZ05/LjO7sg7JyngBwjEAO6P6Tewcpe936lT57hLHwcTjNF9YroQnIKdC2yipuQVHVRw3VZrmtYvmJymlhlOhV4oIOKS6fC3zJ3mybVCX250LgMe5ddwl/k67jDL5XWXFlLmGRcDucKqg6PaWKVt3PW3B58vL0DOj3i4q3pEY6uQt2tu15wZVtgi1BhlhyM36xYrIh7Ge97Rll67BhaYcBC8U8zy4klbLZoBDSEOmdkpfElPh4oRxRYeX4AgLSAVWZie+ts/pDOoyTJXsZr4Q0vdTWHS/73CCa8L9Fn1BSGMrXctmMFg/jrYb85VIL6mbpKGnJOtHGhWoHci+30F+njZ8ZubpfrPLNF40uykexhdHlWX403YbiJFkPuy+dsK2nddS9Lb+b6HNHsmzd/tJxCFdN6HalkxMLMv4aOgBVfVo47d0Bdccoc3tNeZyJV+wg6qvQjfU8DAoxF4H3+TO9OowJerBQG+UuMYISQ//5xbVEldHWhuqqPpYKkX/gJ+nxZw/hF4vhWT56ZUTIfmPKyJiP4vs1UsfYEIpOwMdJB+FleVutI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF4ADFF9CD6.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(10070799003)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkZ5VDBUSmVuQWhiaFRsR1VSZjlOOEJaSGk5YmM5RHBOMk5lbnlZY2I2UGEw?=
 =?utf-8?B?T2JPcHJ5WkhEQzFZUVhkcXA3L3B5UFlVVGk4aFdYelBCWHhBOXZGY2NXQjV6?=
 =?utf-8?B?d0xlcHhYOHJCNXZ6SUE2Wi9UYUJXZjJ3OWZ5S0ZQbFd4a0FtbVlzRWE3NG5O?=
 =?utf-8?B?bDBMNUplYVllOVg1TThjMnhxa3Zkam9Ydnh1aDR2cDU1MENoMk13QjVtTzNK?=
 =?utf-8?B?MlFrR0lRRTlxdUVSQjllM3pYRzhJN2xkWFlnaGV1b290R1BROUpTd1E4WEt5?=
 =?utf-8?B?K244dll1Q1ViY1M2a09DOE80Z01sVkI2WVFwUVYvamhOQmNkUUV1cSs0YUFo?=
 =?utf-8?B?Q3lhbXlJQzhDK3UyWGN4bGtkNFZ5R0dBVC9DaStTZmVicWVRc0FLN2x5MXhq?=
 =?utf-8?B?eHNnWDlqSFo2ME5ESXUxZFBKYytlK3RadzYzNXEyU1dQWnoweUFnd2tTWnpv?=
 =?utf-8?B?WExwTDl0T0ZGaG9Ec2JpbGZaL0pMeWhOdU4vUkpOUnYrM2RiTEtuSlU2UG1l?=
 =?utf-8?B?MmpiWWVYM29HVXFJakMxc0ZwdzBCaERSdW5MZ2Jsem1tL3R2SmczVVlLL3JU?=
 =?utf-8?B?MFRZcS9wZGNITTlVeHllWUprcG51MDY2NEgxMXJ5Y0xTTTJyZUR4WitSeXJh?=
 =?utf-8?B?d3BKVDlsVWZNQUZyM0V4M0tNNWJXWmpjdTdKVGxJbk8yMWNlMmd1cE5xMlFz?=
 =?utf-8?B?ZmtDeWhZRStGdFBCcExsZFpmQUNtV1VJWFlFM1l0d3U4a2tJUlc4VEFxaDB3?=
 =?utf-8?B?MDRSNTEyMHU0NStETEErdkpkeGFQb2xnNFBzS2hUOFU1RGRPTW5Ka2Z0M2xH?=
 =?utf-8?B?S2NTaFRDUERGaEd0K1BvQ2M1QUlWdkpsYTZqcTEyWXowU25TcmtYNFlBT2Ev?=
 =?utf-8?B?Z09DdjA0ZmRRQUxKUDY5WFRnejJsUWdLcmpYUDZ6N1ZSbUtLbW1YTlc3QkhZ?=
 =?utf-8?B?Q0ZBdGF1RldGRUtRcmw1NS9aMTJ1OGtuWUtSSjZ5cnF2a0dqUVJadEg0NG1r?=
 =?utf-8?B?enFiT3VENVVuM2U2RlNJM1o1QUZka2pNRUhjYUI1d0lUQjJad05XT0xZdFpx?=
 =?utf-8?B?VUhiaEdLYmhYWVZaR0tUZFVMdXZ0c29Zcy9HanRyWFhZM3lFcU1Jc2tJTDUw?=
 =?utf-8?B?MkVvdWhNVUdFY1JOdk8ydXk3cFZWTEpYTVZIQnNPN3NJYUl1TVRlbzJmdnhV?=
 =?utf-8?B?M1RFd3F4MFVUK0JJYVNiS05SV0thSENSU1UycEp0NHBmZ3dIZWRFSGhHWnNS?=
 =?utf-8?B?UWVWUzB4dUxCYktNcWpicHlueUZWMlNFcG1SL25zNXkrQ0luWC9xM1I2a3Ir?=
 =?utf-8?B?TU1xZDZRem8rdlpvMmEzdjczWG9mTEZKK2Nib1d1TWdCTnAwTTc2WDFBNGpr?=
 =?utf-8?B?aTdaenVtMkVDVXJ1a3phQ3djTEdxSkxCZE1oR1VTblpTWDY2L1p6emM4T0lU?=
 =?utf-8?B?dDcvWTI2aUFQbzY3NWFkM3dTYUQ4VkVJRHBRS3dwaWlMZ1JNbWdQNzIyR3VR?=
 =?utf-8?B?S3JOalRrNTQvQnMwUVhYVG5zQkwxNExzQm5MV1AxNis0dGNJMlhGMTlOWTZ4?=
 =?utf-8?B?OWdPWDVvSWNyaXZnbXdPUEYxd2p1RkRFQkxzRHFNV000NEhnM0JZVFlzWVVM?=
 =?utf-8?B?SzNFL3dPY3A5d2ZLR1FzTVpCejdkL29LV1NFUkFyV0ZQeDZMVFRvRE5ISXF1?=
 =?utf-8?B?bURvRjVCWFVhU2lZdVc0blpocDBwY2YxZkpOTzFWQnVTSXVZc0FXL2ZUQzRB?=
 =?utf-8?B?MlFCcWo0TFJ2TlNIdW95M1Exc1J3NHRiaFlmTklJclRHcUZJcE05V1YwZExP?=
 =?utf-8?B?SWE5NEt5SHJFK3JJcFUxOWl1U09lTjVXREM1Z2hNeFpHa3dlWHE3dlBVOGc0?=
 =?utf-8?B?UFBzNTFkSnNoTTM1ZHRoQkdMRVZuRjdoak8xWHdudnF5eDk4anNJSmluTUJw?=
 =?utf-8?B?Z2kxWVFtSUtNK1BTRTVLOUtkOWlOSXlkSGNhV0NjWklKODhTWThYamRHNDNU?=
 =?utf-8?B?NnJnamhWUHl5YmVzTXc0bEF5MDRHV2dLWFYwZ2w3Z3ZsQnRSL0wvNGppcWh1?=
 =?utf-8?B?VEJnU1Y5VTZMbEhMdXh1SjJXQ2ZLNGg3aTVJMVA4VFZwdXU1SkNuenhWajNG?=
 =?utf-8?B?TUc0eCtaQWZCdGRHTGdOaE5xTzhkeDFlZEhPQjgvb1p4TG5sbEsrYXRGRWVr?=
 =?utf-8?B?WS9SSm5MY1pFZjZWRUg5MUdWdzBuaU1vTERWZnM3Z1d2cTI2RG9zYjBGNmM5?=
 =?utf-8?B?OWJOa20wMkx6N1NYQkdSMVByYmNTNm96UDRnMGVJZFpZL2YxZ3pDTzUxMjlm?=
 =?utf-8?B?MXFOV3lqakZ2a200eTM0R2RYY3lVbmQxZlJQaUNJK1NxallVK21DcklIdDhm?=
 =?utf-8?Q?bvrXHV3G3SlJFD6jti8Uj/a1eZah9Hpz8QAgLcRLY4NWw?=
X-MS-Exchange-AntiSpam-MessageData-1: 6jG9kC6rh4n4cw==
X-Exchange-RoutingPolicyChecked:
	pa9VexcOKWXv5sRrttEyA7PQuJxdSOLRB0y32UIoh4ZlMJuK1V9cDTdbK3vILMyslYuodkJqY7fqQ6ds+m/+krEu4Uk5jL3QLNODxEjGYzN8uwZI6+JVi1CtNb9lludSZ5F4QXxmVewIl1vi257ngQNz7QqT+BI0DbGCYpm7UewVLJAj35Pqp57aay5dPzSY2PFwqB8+kxlIb96QU6Gh5G1KAskhobu5m3ZY55uJEPvMaDm2u1/XVSYja53o1WfyPaRcMi3HygeAxaGhiES2HD5zeNVw62ZEp/ZmMtggxXMrFu/evuH7WTgZAcnu5d52KcbKX3UGPFO2SRWY7EOFMg==
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03abed6c-3a65-43f8-61a9-08de88c81945
X-MS-Exchange-CrossTenant-AuthSource: IA0PPF4ADFF9CD6.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 10:36:53.4912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8V3ORNrUSbiXob4TGggkA9I8DYCmmdC5F8JpIqLQM/naEGFbnQ/W/PFcQCSNpSynuF7Qc4O/airf4nOgWUhZvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR15MB5954
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MiBTYWx0ZWRfXzpbde34jAuyH
 eZB0B2BxKO1soitmEoIAWCcu9mvBUKtM+aItA8b/d4UldkTy86GgPRWTUs/2s4MbPHTBijfEG/O
 pPdqcBKomKI0dCAV+WdIlxUqGA2FJSMatoY3ae8buWBGQS+REtIGKG+P41pL6ZacgJw0Qr36Z9h
 qQDv32F8kkdd/dr/JRoeSQ9mAeHupQJE+crr1OHpED7KSOQQ75ovwIe/SpfIJ65pIlxnmHLtzRc
 oNzOrMoYwHiY+PV4XIILtLa0c5owNXm2Dmly2zDY78AIKo6z2hmoRy/N3d7doe5E886CtD0RggE
 Hta2OKM9J79jTxiLRTYdNJE8JAcjp2RS31z44CBEjJVjcOEpGdgPdQR2eTi+jG0x44rLBXPYs5w
 DbHDJibTwBnvzVsyKyv1XtoDNyTo6fJYhRYSOng9bRVrSRvxI8a4cuXM3+IWahTIEdOjNGyS94H
 3Mm09jl0SHqTepvJ0hA==
X-Proofpoint-GUID: WVFlM7sA8MQIXNr1Lu73naq5igwaojek
X-Proofpoint-ORIG-GUID: WVFlM7sA8MQIXNr1Lu73naq5igwaojek
X-Authority-Analysis: v=2.4 cv=WKhyn3sR c=1 sm=1 tr=0 ts=69c117c7 cx=c_pps
 a=os0lWWs/UWv4pnmIIs5naA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=7YkTNKn7nyRO-lbrYosA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[fb.com,reject];
	R_DKIM_ALLOW(-0.20)[fb.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35324-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fb.com:dkim,fb.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fb.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maharmstone@fb.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B00D2F0672
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 21/3/26 7.57 pm, Alan Stern wrote:
> >=20
> On Thu, Mar 19, 2026 at 05:32:32PM +0000, Mark Harmstone wrote:
>> Hi all,
>>
>> I have a monitor with an inbuilt KVM switch - it has USB ports into whic=
h my
>> mouse and keyboard are plugged in, and appears to the host as a USB hub.
>>
>> Twice today I've been working on my laptop with my desktop running Gentoo
>> doing "emerge qtwebengine" in the background, and when I've gone to swit=
ch
>> back the mouse and keyboard don't work. The first time I rebooted, but t=
he
>> second time I unplugged the hub and plugged it back in and it seems to h=
ave
>> fixed it.
>>
>> This is on 6.19.0, I don't recall anything similar happening on previous
>> kernels. I think it's high CPU load rather than an OOM as there's nothin=
g in
>> the log about anything being killed.
>=20
> If you're sure that the problems started happening with 6.19.0,
> perhaps you can do a bisection between it and 6.18.0 to find out which
> change to the kernel was responsible.
>=20
> Alan Stern

Thanks Alan, that would have been my next suggestion. Just thought I'd=20
check here first in case it was a known issue.

Mark

