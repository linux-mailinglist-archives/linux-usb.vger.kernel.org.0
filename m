Return-Path: <linux-usb+bounces-22242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDFEA7363A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 17:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B08A73AABF1
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 16:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08F41917FB;
	Thu, 27 Mar 2025 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="Vn6heA/V"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B081537C6
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091242; cv=fail; b=ROmo9JUNW8oXO5weY6aL7I39ZBiV3oyBhs3BxTzP086gdW99Pb4WTP9ZLwNtLS1//KdRHQgQV3JSah9KmZ50Gk7FbJ9p9G1BrbNuFMHFsLCCDGIy+K98dtauCurrchT3AkW7Qcu6l7pE1wrZWkPpcshC9eIMIUvjo+pP4B4NVc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091242; c=relaxed/simple;
	bh=htPPj9ekEG+jiYPk7upaZFBe6XQehRspMcMfLOTcXQY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F/t/eyWLQ3fKfEwyRz/CPUuwkcld9O3aSFZJUoTacfRj13uokK6LRIfMncryy9ulQHpGpJ4gn2ylEr3E2I/PYWbOUdIDavAKfFd6zDoy9BHQqHBpOBAuKI90LnkPiuWmAAhEy4kiva7YX/A31ocexau8hvodM2FJM0DzAWWg1YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=Vn6heA/V; arc=fail smtp.client-ip=209.222.82.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48]) by mx-outbound22-122.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 27 Mar 2025 16:00:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fllNYq8H1BDT6nfvnipguCYYNYziY0yzz6nzhRxCksFF8TML6iLz+RIvlS29u6OVKwPSbXSEnt4r2Mbf+ml3EPFGFFxrnD7suhJ/aXrr/PmpeE2puuu7k7X9cDZ+lHL/0G7fH6RJ7qsasquzRmUjWJBmpCzTxQgVGjqKTIfacFpaq1Mpi25dMjQsSfnTYTusnvK89pjN4I5IX4meIWTyYxoZoF6EB/lRLn+jWYCVMVqudH946Aa54vcu0BXXZ82sSb+LPaTrURMZVi2GLWA0iXvzNu1+6R1Vs6gbpTPahgYhqLHYeLK20qdcSEe5uZiWg0uf6PksvthZo+xyk0LSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vepI8bY81wKCzL/N7XdEwUTFJvZJegWLY7L/GOSZgQ=;
 b=bzfUGhSZWCD8x5iBCWzp2eEc0/B7/CRxgNowHp2JQMiQJvQiE655R/RRX050jb0exZytBPbS37W91WV0eBnM59DquwdI5UnoNCb5jmEIUi1DhB8djGr5dJZ82f2LgRtnTd7hn21Bs10Hjd1Gr1oHH0APNumxLAUSLqp62tTSS+Q6lz3ZHGA7Sg7ddh0N1UJCxx+fzf8C9Y9OexMd4i78zE6j9driKbXZIVjVld1IMKZB6/X2mLRXqfQ11oQQyp/dcLDOu2jRIY0QGN3Y91+axiuRj18/eM5sMzcDXfPj5dk+qv53+ThgGPpeifDasWMm2j9M2SWT//DOCoFunB0m0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vepI8bY81wKCzL/N7XdEwUTFJvZJegWLY7L/GOSZgQ=;
 b=Vn6heA/VXVugbRna96x7xUTFuCSdyUYuDL2UbXtfNZsixc1gvzcR+4BQ2vxYZpMGoSz52Azlw2pOb9fgj+tuHdcYlD2FEWeowhVQd/QEY+469LBoLDuc6JMlFPg63mtNSu0rgxhjYT5dcwoMWMWDSjx/x5AEPT4b3IfuufraFt6V7TFTaACT1dy4iHNJ+K+cFEit/+G+DYJhWOTMeFZ8iglNCKtnrmwaY5FXDuXDPWMa2Dj8Ca1gANlEbpmyFYeIwjIV9/uYvjOksrRh1ffPVVDE798tlgZBy480NzxVRAI6VnbHh+dGysUkVT9tM/bhl5lwXHkuoA2OWxrppqj0FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15)
 by IA1PR10MB6217.namprd10.prod.outlook.com (2603:10b6:208:3a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:27:08 +0000
Received: from CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448]) by CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 15:27:07 +0000
Message-ID: <a9bc14f2-7f07-44c0-96fa-0616402792e7@digi.com>
Date: Thu, 27 Mar 2025 16:27:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Handling incoming ZLP in cdc-wdm
To: Oliver Neukum <oneukum@suse.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <bd07dc48-d6f5-4a95-9dc4-c738640349d1@digi.com>
 <ade69712-836c-4cd9-ba79-79b2d97fba83@digi.com>
 <dc8500a8-df6a-45d4-8ce3-1dad4b8f2413@suse.com>
Content-Language: en-US
From: Robert Hodaszi <robert.hodaszi@digi.com>
In-Reply-To: <dc8500a8-df6a-45d4-8ce3-1dad4b8f2413@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::20) To CO1PR10MB4561.namprd10.prod.outlook.com
 (2603:10b6:303:9d::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4561:EE_|IA1PR10MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: c192f787-709d-4993-7966-08dd6d43d5c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzhRb3U5RlQzR2RyZzBqeGpUbTVEUFdHK1VEWnIzbjVQZUd6Rzg3K3hPMDJq?=
 =?utf-8?B?WWZIZDducXlvcVRhVklyZVBJTXBwek43RFdvWUpJMlpaVndVbkhXTElTanNs?=
 =?utf-8?B?TEk0RmRkeDVBNXlOYUpjbkx2ZU9EZmh0ZG4yVzFYRVlva2Uxd1RJRWdlWlNV?=
 =?utf-8?B?YVRpR1pOUDBrcTdiTzJYeWx6WTMweHpZWDNBb09qcC9aMm4zb2ZoRnV4VlBj?=
 =?utf-8?B?M1JRQkxpN1QwRExmVkp5SXdNOTllZ0xtZWtTNVEzelpraHF5UExlY2VySkpq?=
 =?utf-8?B?MFN0RUd3Q0MrL1Q0L0hFWGZaUDVPRC9ya1pSbWU1RmdRUklneXpLRTNZVlNj?=
 =?utf-8?B?Si83Rkg2RkZoZERJdE1jUDc5Nnkyb2VCcUpnSVp0eHREY1ZTUE92aFA0UmZ3?=
 =?utf-8?B?Nm5FRFBYcmlsMitUT0dsY0pHYjhCcHVNdWludkVXQ296Y0lWVU9ockdPVkJV?=
 =?utf-8?B?S0c4QjlrbWFRamsvY2ZtcU05MU5mNGNMdEtRenNaSHZDQUpCa0M3VjZQdGps?=
 =?utf-8?B?Zk9tbU1EVjIxaHpIdE9QbHl1MVppWW82dDN4M2w1OTVjbXVyckdoRGYwMk5P?=
 =?utf-8?B?VVcvTjJEU0pUQkgwNEFKZDBXTlVOa0xmK3F4cldGdktPVlh1RnVub3Nha2ZM?=
 =?utf-8?B?RlJESWh1NHBvYXVOVlRGd0xnNm1SSDZsWkkyTldhL1ZRMFhoVWR4NWhBZVN6?=
 =?utf-8?B?R0huNFA3K0lxTUpYemNTSitnL3dVUnRETlFGUFFMUDUvTGV2dXh6MmdHc0ZY?=
 =?utf-8?B?cVhwRkY3TUxPWXhZYzBqQ3hmYnU4SmVJNGxOcXMwZXEyQjFJd1RpcUZvQlJN?=
 =?utf-8?B?OUdNelNyVnJQRllhdG5TZXFxTHdyOVNuZDUzNSt5cDZtaE9ZT1hYWnBXbkM0?=
 =?utf-8?B?VThTa0svN3ZXYmdIQ2VqbHZQMnlvQ3JkWGlvOTRZa1lwREY0anorZlJYaWxJ?=
 =?utf-8?B?VCs2dmJjZDM5cW1od2tlMGl0UDFiWWR3Z0d5N1pQanlPZXRORk94QzBEMHdY?=
 =?utf-8?B?Y1FpU2s5cDRZeVk2Q2F1aEJ6d0F2UnBiVUtXMmJSUzlUQ293SDI1Y3NTNVlG?=
 =?utf-8?B?STAySGhjUWRzdUl1L0JkcFJOUnZ1ZGhoaFRDbktETkw3cWJONUZreUwvcmNs?=
 =?utf-8?B?elRLU3hoKzZ6YTd6bVY3VkF4M0RVU1JZY3ZGbStvbVdBZ2ZXbGdoU2tSUXFi?=
 =?utf-8?B?R2xOejR4SHlUNDl0bzR0MVNGTWVKQnE2RmZYWTA0UXNQQmFubDd2eW90Z2JK?=
 =?utf-8?B?dU9yb0c1SGt1QTNYRHlsaVprY3EzVksxSVpKejU1RWdENElSOTBwQkZBdCsv?=
 =?utf-8?B?UUt3dGVDcEI4V1Q0dml1djVITEhQN3NTNjNBWjdGQVV0NWF0Q1lETVN4d3d2?=
 =?utf-8?B?M2F3c0ozbFRBSGhXR2l1RHZwYllUN3NvUThYSnBHZnVjRXU3K3JBNlg5R2lC?=
 =?utf-8?B?MHR1WUIvT3F5d2VSOHR3eE5wZkZjcUltYXZLanNUSVJ5clY0WE5PRWRqQTFo?=
 =?utf-8?B?UThMTnl2ZHB4b0xNbTFleVFtRFBmcElLcU4zcWIvTVFGaTRJK3dTNzJ0QU1m?=
 =?utf-8?B?K3BnSkZBZTJYa2FFZHc1cDk3bGFxTk05M2VtR0JHZ1U3TEtjZVBvS3JmV3JT?=
 =?utf-8?B?WFF5NWl0bGQzTDNDOVg2WUF1RDBsTGsyaDF2SUt0WVJWQkJmV0NDdWpESTNk?=
 =?utf-8?B?QjUzeEx5UVZqVE9DZmhONW9IdCt2dS93VEZWZ0ZleHVkaGhqVUc1dzhxUHhM?=
 =?utf-8?B?RFVadGY5TlkxV0pDWHFTUlc4U2xUR3huQktiSW03R3hvZTRQbXdYSHgvdzhK?=
 =?utf-8?B?c0Fsc240UjRubC9lR3cwQVpORCtZSWxhZkIrdGRmR3JOYWRjcDJORkxZR0Fl?=
 =?utf-8?Q?xS/iLNsFcYBiT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4561.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXpoSmZoQ21kWTZUTWcyb0MrMU5OaHQ5YlBKdVo4MmtaYVFBdkgweGE4RWE3?=
 =?utf-8?B?R3lYMzluU2xNTm1Hc09keWIxcUtEMW03RlhqbDZlZ2NkS3JneHpuenlwZE5V?=
 =?utf-8?B?Y0hvUVRITkdOeVpick1vSDZtanNNY2pCQ3gvQkl0M0pKb0lDOW53Z1BlSDBS?=
 =?utf-8?B?MjQ2VmlZV0J0c3ZNQW9Gclk2SUo1VTc1S3g4QVRRZmdUMTBOUStGQmQxcUc2?=
 =?utf-8?B?eG9hcnFDU0tYN2xzWWMxeWNGaVhQYWpLSmdmdDNjVFYrOHdDU3l3cEdneCtk?=
 =?utf-8?B?S1BnNktjQ0szckxhSGtaMEtsV1VGN1BtcDVtME9XTmk1SmcwaVlGNVd6MHlt?=
 =?utf-8?B?eElXazNINDZFdFFNbGozam1saC84cWRYUjBMU3gyYVZncitzajJ2ZWJqOWVF?=
 =?utf-8?B?cW93c0JnMkI1a3ZQeHh2MFQvVURRWElhbHpKK2g4eEE3S2tqNWV6UWEyYnVC?=
 =?utf-8?B?TDRRaUFkNk5qWlJmM1ZYTUdlUUNTUmFYZ25WVTE3OGllOTkxdnpuV095Yi9M?=
 =?utf-8?B?dVdObDkvTWNnbFBBRjVrd21ISmd6Ylc1S2RwaFhqc283eU96V3hmME5EeENv?=
 =?utf-8?B?TGNWdmIxeGc4TmpPdXQxV2lKQWZ3MzBWaEpnd2pVaVd5OG9VY0xFa2Z2aWNB?=
 =?utf-8?B?SWRXaWdNZ1VYaFJsQlRRMFFER1ZNck1FK0laQjdIS0k1ZFMxNE4wd0l4bEhM?=
 =?utf-8?B?QlFCK2JFNHUxanQ2TlpJQVF5TzJ1NTZPNGFEUHd4ZjVuVUpsK0tqYjdsUGlo?=
 =?utf-8?B?T3llaEZvZjJYTzJSbmdsVXdZN0p4aUN2UFEwZlljNHlpRnVqRlRpTzN6bGps?=
 =?utf-8?B?NkR1WEVyS3FiMWVNcnp4OWE1V0hSdE1XUUdRR3luWWdIS1Y0cFZBL1Z5ZENo?=
 =?utf-8?B?dkVqOW9VSVdpOXJvcVJsWkVpU2hzQml2Z0ZuKzFwNEtXcmk2VmY0Yi92dWtn?=
 =?utf-8?B?YVFRb0ZoZ2ROVlZCVmJQVjZhakdVNFptdGdTMkRUbmVNNXVCWHVxZWttTCtO?=
 =?utf-8?B?ZUo1clA2a29MNXF0ZDRRYm44cjhWc3ptQnNScCtSMGlnUUVKbldlTzJlc1d3?=
 =?utf-8?B?RlRmTmdmOGl6K01KYktZYjdJZnVhdGg0OHBzcVlLUmc0YXQ2K29JeFU4TGNw?=
 =?utf-8?B?VCt6emtWZDl2ay9SRUZPaUEvYklVMWxJeGlQQ2VFS0EwOXFOK0NaWU5nRFpq?=
 =?utf-8?B?ZklyNWkrRXl4bThIQ1YzMDBYMUp4OTZrZHA0YmpxaktNTlBqd0kwQ1pvdkdj?=
 =?utf-8?B?WWVtQ2tHQ1BRVEcwelplVGJKaklEcnF2UW5EaXVLVS9uYmt6NEN3dnNISS9E?=
 =?utf-8?B?a3AvcnI1STIzYW9OdTdoTmRhWDRBdXppZCt2N2RWQjIwUUdsZzUyYlNOYWVT?=
 =?utf-8?B?YjY2OFZYeTRaQzBNdG1RNTk0SGRVRnEvS2k5RHFDTk9jSTZkckwrZjc1R0Rk?=
 =?utf-8?B?MVlPOEloMEFkalhZR2J6bmJwN29hdlFwZFNPQWVUamUrWVY4R21wUHZIYk5J?=
 =?utf-8?B?UTRxR0pZc1NmZC9Jckkyck1HOUw4ekt3RDBNcXVFMHJGWFhDMU9ZUHZyZG5C?=
 =?utf-8?B?U2RreVFGMVpjVFVqTncxbFlNRnhBVzVSYlh2UWwvRXBwWExkVEZUbTYwU294?=
 =?utf-8?B?Qm5FRnI1V3ZMejRrVkNCZGg2WWlOcDgzTnNUam1sYVZHL2FWWUlCQlNWK29I?=
 =?utf-8?B?bXloZTdNekw3cSsvYUNTN05YUE1IS0IrZWhQMEVFZFBIakVzVzRGMlNoUXdl?=
 =?utf-8?B?cWg4OTdCcWcrU1hmNjY4WGZlcU9lbVFlMjlweE5IYTZERTNkbGlQMFhqcFhZ?=
 =?utf-8?B?SDdQTTJaTG8xdjBrcjNmWm80Vm5WMlJsTkUyV2ZkNTVNNlBGL2M1VktlYjFK?=
 =?utf-8?B?c1VubGhvdXo2QkRCUVV5OXF3bk8xakRiN3hKRjliYnFBV0hwcUhzakc0VjNT?=
 =?utf-8?B?cEh4bVBlV0Y0MmNObEM1SzhkQXVUMWZDQkU3c2drTHRwdWhQZmFadSs1Zy8x?=
 =?utf-8?B?QnFxTHg2cm1zT28wUUl1MFFrNmJnSDU5eVhJQ05VYnhLbGJpd3lOOXE5eHNM?=
 =?utf-8?B?aHFlZlhjOGlZVHRCN2NKL2lxQmQxT1VBZFBveElielE0ejVpbUJhak05OGl1?=
 =?utf-8?Q?wg77Ro/ojLhz+8Z7B4joNCX5W?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c192f787-709d-4993-7966-08dd6d43d5c2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4561.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 15:27:07.5933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/68cO/FjEr2AniWu4kY8LSpLIUOouKS1Jl9IKRL5oDTEOxpRRfhQaschuHXUIpqkDoxv0cno1B/cQx2zHj1dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6217
X-BESS-ID: 1743091236-105754-7736-2162-1
X-BESS-VER: 2019.1_20250319.1753
X-BESS-Apparent-Source-IP: 104.47.55.48
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVubGpkBGBlDMwizJwgDItbCwSE
	pOMk02sUyyTDRPMjIwSDJOMjczV6qNBQCPQaWMQAAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.263457 [from 
	cloudscan16-177.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

On Thursday, 27.03.2025 at 14:24 +0100, Oliver Neukum <oneukum@suse.com> wrote:
>
> Why do you wish to react to this like an error?
> It seems to me that we indeed need to wait for the device in this case.
>
>        Regards
>                Oliver
>
See my previous response to your patch. Because:

    1. we have to submit another read URB is resp_count != 0 (call service_outstanding_interrupt), otherwise receiving gets stuck
    2. we should not set WDM_READ, to not confuse userspace
    3. we should not set res_length to 0, otherwise  we get stuck again (actually, should we clear the "if (!desc->reslength)" in wdm_read(), since that's is no longer possible anymore?

Best regards,
Robert Hodaszi

