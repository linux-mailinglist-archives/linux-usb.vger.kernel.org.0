Return-Path: <linux-usb+bounces-22517-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B805A7A59E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 16:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF9533B760A
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 14:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C69024EF7F;
	Thu,  3 Apr 2025 14:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="NjFJly+A"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E4124EF7D
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.206
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691368; cv=fail; b=Ys3LhFSIYxgmnzSCI5HZehx1pjdCCilQP4zfrsHY5N+BuPOtln0nNvuVLHyg1e4lJl+TicE/c3MtlDsSrTFGmSTBKlaZDpYlMrltSn+piM9rNG3FH/TAeH9l/at6HoR4PjLoyCgpMn7sar0ndFFKyfVuA9zMCfeX0tzse4uY4/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691368; c=relaxed/simple;
	bh=MmB9jzdLAeOeScfCvgEAMVMWuz5MG41gWMHFDYnDbMo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cTfpFSVUpfSnxP8Y9zu1eekZ10zQ3PhDW4wvAHw1aQi/EFyXtDn6zIHuCRIeGTIXXhBACw1vlP7X3seOaYfQAZmITKOHKde7gDcwhZJoUS7Vu5FpYptz1ap6DsL3PEQzyLYyWIaGJcqxRGn52wrrvDRaUkPwgq5WPJCLu6h7Cag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=NjFJly+A; arc=fail smtp.client-ip=209.222.82.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176]) by mx-outbound45-202.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 03 Apr 2025 14:42:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOxZrJceWRO2EaAqCZWeQau8F/9O3YoKmdHuMIBgoRkwkxS1GB0bjar511FvYo0EKEUePWGSTWjKlGyvVpfDwsBV10Z2/UEBXF9WSaDZBRbMSjI1lM4XQujPh1KGkBADZAWMUhEn6ri/YpIjDGdfxh6jT1PK2fKSsNv22cOoBJ1Qk1NHh+L2b6KUgC19P89QjPaA5tRIBL9FT9LGZFDERwF4NLMCT0v5PX7sUZJUsgAld+noUJL/3rNkmVroDF6K6/3HIjpNHjJUFMJMmiit619CWqkIfTlNhiCDdTjWxeUJbRZ9QPwqi1cBdfynG1duZY6bQj6o0Hf71psPM8gUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmB9jzdLAeOeScfCvgEAMVMWuz5MG41gWMHFDYnDbMo=;
 b=yzkc3qylq9afS4/rSZClkzNfAT2mVlasnIzPQeVKLR/oifluk58rJrOllHXfiz35LOKc3+gRc5LeFFIPA3i/0iAgB+xMnikgA552rW/Q+XAi2rxdO9RJHyxKoLUKXLbeJiO+mO1CECBZ/1ouHucQi+U5IXkhx8z5k9PL5fHiKaSiGCryw4s/OtEUF3nGjUWaT7St3o2qIdujI1kim4IJqR6UeMU8ptCmDecqoDejzA1o0hlHMl5vAmba6I29Ce/pSYM0JRarxAH8rkrUxWGRmr+7zUjS8DhCqugGYJI2aJxHFVjLgtKlBk/J+5wA1LjawxvmI1xvUtw9nwY78rI3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmB9jzdLAeOeScfCvgEAMVMWuz5MG41gWMHFDYnDbMo=;
 b=NjFJly+AGaiHT1HOR4GnWm6X92nT4z/w3kqH0y4PiWrhlMPKMihcZn9d8wrwD2VMp4Kfy7gWAFmrYSVQ8LyJZHAaGw2euo+ELYV9uPWodTfG93gAUyc+eLv5BdYAnsSAP6bSyf89oCy3KTGY5Qtsnek/Ozo5B64v1iX6u9m8nYRwY90MqBRofqtrE9jWO8jclq3vZnBNbLE/8B/bO4wzI4uzzoT/SwsWXyLWs4JUzF45o2F0qYDCJ77jXJEGnTfy2hoiqt7+oGcovxItJlHiCJcirvg7zto9tM15Vq6xrit/fdK7rsHxuDJbpzB2KOs72DFL6gfkGY7PbTgRyE+hFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15)
 by MN6PR10MB7442.namprd10.prod.outlook.com (2603:10b6:208:470::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Thu, 3 Apr
 2025 14:42:40 +0000
Received: from CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448]) by CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448%4]) with mapi id 15.20.8583.038; Thu, 3 Apr 2025
 14:42:40 +0000
Message-ID: <c35d1c36-cf13-4b8a-be4b-12288dfc76eb@digi.com>
Date: Thu, 3 Apr 2025 16:42:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Handling incoming ZLP in cdc-wdm
To: Oliver Neukum <oneukum@suse.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
References: <bd07dc48-d6f5-4a95-9dc4-c738640349d1@digi.com>
 <ade69712-836c-4cd9-ba79-79b2d97fba83@digi.com>
 <dc8500a8-df6a-45d4-8ce3-1dad4b8f2413@suse.com>
 <a9bc14f2-7f07-44c0-96fa-0616402792e7@digi.com>
 <d1a9bfca-0c94-4770-b5a9-c7d0432dd476@suse.com>
 <e73dd429-55c1-499c-82f1-f9553ce06cda@digi.com>
 <28a5c207-6c2e-42e1-9568-2f949554026e@suse.com>
 <8de930f3-2e87-443d-9e8f-9d6f16f7a399@digi.com>
 <3296aaff-a591-4fcd-b421-9cfcc6291d2b@suse.com>
 <898977f7-3882-4ffe-8833-c44f06914337@digi.com>
 <6f6b48cb-6b9d-4637-9dd0-4464c4b795da@suse.com>
Content-Language: en-US
From: Robert Hodaszi <robert.hodaszi@digi.com>
In-Reply-To: <6f6b48cb-6b9d-4637-9dd0-4464c4b795da@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::17) To CO1PR10MB4561.namprd10.prod.outlook.com
 (2603:10b6:303:9d::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4561:EE_|MN6PR10MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 5507027c-5589-4374-be28-08dd72bdc8bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mkd0YlBYZFk2TWFLY2pxN1lITXp3emRTZWhZM21lcEpVWG1SblVGZE9Ha1NJ?=
 =?utf-8?B?dFBNVDNMVEhadTdUcmdodkdSTG9CVXA2c1VRcGEzVUxkeU5HVVBsTk1OcUVT?=
 =?utf-8?B?NkpGVHZvcW5LdVM1bjhlTGZnTm5mbTNabEsxdHdObElvZWpHOUtZanBoYng4?=
 =?utf-8?B?bi9IVnozZ05IeW1ZLzVxWE1ValBaWm1CUkF0N0UzNW9URkhKUnMvdEZpd2RO?=
 =?utf-8?B?SGlkdjFJR2xKS2FIREhSSHZEMitPRDgyWmdENnN2cWFzNjVwTUt5MjRNL1JQ?=
 =?utf-8?B?QUM3ZDNWL3RKZzU0dFFpL1RRQlRpZ0orUXFNd0F6NFJpR3UvRzhFV3lPVU9K?=
 =?utf-8?B?OEV0cElKRWlncTV3SFMxSXQ3QktGRFc4akplQ3NDLzl6Y0tWeGwzT0JYemVu?=
 =?utf-8?B?VG1rdm5SbllxK3JQNDREZTRUV2xMalJpMlBPT0NDZ3BBMm8zbG5zU2t2MUYz?=
 =?utf-8?B?NHRuMUswd1prTUxDMGZXbnBGbExsWGRpK01pYnpBZGNZcXUvdk9CYWxSd3pj?=
 =?utf-8?B?dGdkSUVuMlZtVjMzcDJ1eWZxNURYK0JDN2ZmaHc0SVh3QWRJVDFxQ3NMeHlX?=
 =?utf-8?B?Q2ZlZE51QkxGWGt3dDhNQS9pYUI1YW5vTjdKWGVIeS9JVGlGSHBEaXBKcjRC?=
 =?utf-8?B?anB6bndnV3d5RlUwWCtDYzJRV0ZvclpTYmNoVDBTQkc1eWdGb01GbG5Bb2JK?=
 =?utf-8?B?dDlxTng0ZFoyMm5sNXV4ZWFkeWdLMlA3L0k1Z3ZqRFJ5bUxGVG1Ga3hqYXlj?=
 =?utf-8?B?ektjeFdjbXFGbG5HZXpLTUhJNll4VW90WnJhQ3U3azgvSW9iMkd6eHR4bzNh?=
 =?utf-8?B?U0VkaWp4L3cyaFJ0dXlKdUFmRE5uUktDRmx1WWlUR241eU9mMEQ2dTQvcEJp?=
 =?utf-8?B?M1NmRTd4RmRTelJSU3pCSWJQK0RPbnRmWkNlbnlFMnlhVEJsMEk5aHVoVHhR?=
 =?utf-8?B?d1NSMWo3TFFrR2JwZyszMWRjQXVlV3JuemZDMXBGbU92ZzJJbWxrWGVWaVBX?=
 =?utf-8?B?RXN2UGNwUTNCQnhPT0cyanZzblJLVGJhRXVjbVBEbkpld1U1Z0pKZWdoMkRq?=
 =?utf-8?B?RFc3eWc3T2NVd2ZnTjdwaFZxUWhkM0lFdGVhcEVkeGJyOTZRMjA4c2hoS0pI?=
 =?utf-8?B?djNiWTVSaEpZazlObEhNVnBvaHovNmpEbThkamk1K2x3MDErRHoySThmZWlD?=
 =?utf-8?B?cE1nMURkSUV6b2JPZlljbE16dWUvVkswU3FWSEp4a205dU8xdGdTSytPYzRq?=
 =?utf-8?B?QXlFWnlZdjF5cEZxK0VTNEV1WURScGU0SWNjT1RkeHJOL29zUkRaQVpKcEto?=
 =?utf-8?B?Zi9GcWREM203U015SXJsandoZkFMU3FURTY1RnQ1R2x4ZTJLeFdYdGtVV0lW?=
 =?utf-8?B?eWhXdVQ4dkF0Qmo0VWlMOVJyVTJOTGRBUG5OWW1aTXBoVkVBU0tEL2FYRHYr?=
 =?utf-8?B?MkNuRmU1YnNJd0JReW9BYWM4NC9lcFgvSVlRTGx0cHlBVzR5ZzZjakdlekxP?=
 =?utf-8?B?YnVsTkpEMDVNYXFYWnNJaVhjQ1NuR3pkLzdmT1ZrNDlPc1dFQ3VsZzJMRUZu?=
 =?utf-8?B?WjlBTE1WM2xZSHo0Z3BhdXpncTZzeWtHUDIvanN4LzhHbDZGRFBsQnBpbFBo?=
 =?utf-8?B?eERPcDVDbk5XRE5aUEkxcmVLRzE0OFFXMGFmUWxLZHpqZXpsaWpEOXcrYm93?=
 =?utf-8?B?TEcxRmpRMkExRFdRZVh0WEY4b0t5MVdzVEEzdHc1bjBzUWRRY2lDQzdQaUtv?=
 =?utf-8?B?VEsxcUpzTFY4SHFaaUpGVEw0Y1YvWFpzNk04dE1VeHFWRkhqMFRIa2VEV2Vi?=
 =?utf-8?B?U2YvSFVyWVhJUGJseHhRZGpTdnoxK2VscjdVazBFWWJaQUdxUy9tTCt0TXdT?=
 =?utf-8?Q?EZ+FBXBaV13dE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4561.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3dNTVoxK2Ixbk1wbmpKc3hlZFZZL05taTVTLzh0YXRWaDVoMDhSektEUjhy?=
 =?utf-8?B?Wkt2ejROZDZJTXMvdlhhWG1BZVdPcDg3c3ZnMWQ5ZjdZaVUvRE9VN3RHM25n?=
 =?utf-8?B?VlVaTWNaeDRGUVFYRzBnVVFpWUgwQVl5b2l6U0tPOTVVR1ZmUlpCQTdTSmZs?=
 =?utf-8?B?L0tXOFVYR2EzSTZybk5uN3diVVNWV2hHRGFTNm9iSHNrZDZUbGliUWJVVHRy?=
 =?utf-8?B?cGZNV3ZzMHZiTWJwcTJlYlFTWEovZitOMm12WmxDc3VLMERROC96Q0w4Tm96?=
 =?utf-8?B?ZmhOWWFDRS9IVndFdDN4WFdMQ0Q3a25aQk8raEMrTEFIYXQ1R2xCY0duS21D?=
 =?utf-8?B?Nkd1enNnWmcvZ1QzdGVIUG9xamFUT0dleHJ1TG5ZeGc1MkJIS2ViRWJ5S2Vy?=
 =?utf-8?B?V3Y1UXdiSkVrYmxvUnBLSExsS25US0N6bjF0elFFMTB5MmNUdkgwVTRLV2Yv?=
 =?utf-8?B?WElCZVJmY1hXSm1aVDlwRzM3VjNuVFBBdHVURVpkN0creGszYVpISVNkTmc5?=
 =?utf-8?B?QnZFNmYvVHluNEtucWE4VEsvSmRzM0NiNlNMNFRId0pwZWNEZVVROHIvNDF2?=
 =?utf-8?B?MnFXek1nOEN3dStnbFNwRXhQWVFNTmlGb3hSdFV1eGMyZU1QVzJzRzdGSGN6?=
 =?utf-8?B?ZDFkb1A0QUt5b25MNVl5b0FRWWxWOW1FMkZjcmJYNkttS2RPc3VtR29aWUls?=
 =?utf-8?B?dk0vM1VTMXRUT1dJWG5mRkVuRC94YzhENnFCL3J3NmYvMGlKSWJMdXdxZDBp?=
 =?utf-8?B?T3JocXJHVHIwYzg0L2duNjZBVk4yVFo2anptaTNSczZjNkJCdXRVWnJkVCtB?=
 =?utf-8?B?WlgxQWh6Y2tKM0lEWFRFSHk1K3Byd25Vcy82SGJRa0hDam5yVTE2QTdJd081?=
 =?utf-8?B?a3RReE5XMGV4T3lJZWl5RTF4ajVKZTNIY0FOcGxnUFZZdzhoZ2Raa3JlY0lw?=
 =?utf-8?B?WjM0OGtXVk4zSFNteXZyVlJKZ0xZc3l6YTQ2S0ZtRWkyS3lGMlZCZzZYL1hK?=
 =?utf-8?B?V1ZPU2JJS2FJT2VUdnFLUU8wN0NIZzljdi8zaktJTDUwUlRjQ2lyZStTNHF6?=
 =?utf-8?B?S0RKMEdzc24vbHNBaWtxbUpscTZTMXloU1FETDZiZGRQcUpsTmFHR3Jab2Z3?=
 =?utf-8?B?blBGbEE1eE5kYTJDQ0RTT2E3d2FaRGJRcW16U3B0RmVUWnRjMDlxazVsVXlE?=
 =?utf-8?B?bUpkUkVaS3daeDRDZnQ1Z0x3UlZiMjE2MGRDTm5tVEJaMXFxaXdtaXhTdmg5?=
 =?utf-8?B?MmJsWDNlRTYzR1pZU1lRRFQzVVBYUndHM3d1cDkyaUhFb0plNVl1OFVEMVdW?=
 =?utf-8?B?YitTUHlMZ3luYUduLzBEMHVLZjA1aDV3L21QUWxUVWVWeC9LK1F3YS9iM3dw?=
 =?utf-8?B?UE1oNFdLSDVUR2pmMXFpelE4R0oxZ3liVHZSU3BheWttTUZuY3JkT3NycjZI?=
 =?utf-8?B?czR4QnpqVWZpVW1WRFRTd3UzV2tUZmdzN3o3NjBURUV2R0x4TWxTdi9obFg5?=
 =?utf-8?B?ajlVVm1kSWMvNmMzUnc5eEh2a3ZlcHJoUWttd1Z3L3l6bnliSlBCUDFZMDBX?=
 =?utf-8?B?QkZieW1ENUpyYVRhVnBXWlFkWkkxSGQ5RlVnbkcrd09lSnJ5d2NLYUFtVE9p?=
 =?utf-8?B?YWZTU0JVaEFkZEl2a3l5ZkFManpHYXltTUNNVEJDZFM1MHQ5cm9nS29wTDdG?=
 =?utf-8?B?Q2xhOEw5QmM1Q0hYOENnSUs0QkEzUlNERlpUS1psR3VJVlpsUWx1WjRxL3c5?=
 =?utf-8?B?anFCMGVVanJmcWlSMVlhMHBaQlk0d3puZW1acU9JNFdyQ0pVTS9YdUZpekpj?=
 =?utf-8?B?ckw0S1lRcURvcmlsZ2dwNTdncWd5NUIyeXNQT1lhajVIMzZtUHFHcER3WWRr?=
 =?utf-8?B?S0pOU2xYcllsTVkvZmwzVUJsNzRxMURpTzh5MnE1U24xOVVqaEh4dUtHUllo?=
 =?utf-8?B?MnhGTnR3amZ1K0FhbVZ3emtYU0ltRkI0ajdlOEZaTFBqTFhKUkdEd056OG9S?=
 =?utf-8?B?akgzeVJrZXkrSU9DWjR2OSt1NkpaMnB4SnVKRlVVdzI0eXkxVTlhZW1aVVRo?=
 =?utf-8?B?emtFWTVweGw1UENXTm5lVGJ0UlU4c1Q2QzdQeVg2elBkNDZaV3l1azNCUmNZ?=
 =?utf-8?Q?2IW7HaMIkng+Q22B6AlYOlF04?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5507027c-5589-4374-be28-08dd72bdc8bc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4561.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 14:42:40.1669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYlaXvenhU1dAnvpCLOZ2rRBJxEWT7JnDECLNAmGxnpEvRtOt8hgjjr6TVPFBVkZZT0Yzusj+um0Bp2HJ+fe6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7442
X-BESS-ID: 1743691361-111722-7603-9335-1
X-BESS-VER: 2019.1_20250402.1544
X-BESS-Apparent-Source-IP: 104.47.73.176
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVkZmpkBGBlDMwjQlKSXN0tzcwN
	Iw0STVzDzZOCXZ1DjVMi3Vwsg00USpNhYAHQaUY0AAAAA=
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.263623 [from 
	cloudscan20-124.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

On 03.04.25 14:58, Oliver Neukum wrote:
>
> Please use a dedicated label for this. No need to retest length
>
> Otherwise it looks good to me.
>
>        Regards
>                Oliver

Thanks! I sent up a patch.

Best regards,
Robert Hodaszi


