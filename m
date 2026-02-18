Return-Path: <linux-usb+bounces-33441-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FBtEmMRlmkXZgIAu9opvQ
	(envelope-from <linux-usb+bounces-33441-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 20:22:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E4D159021
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 20:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ED50301D04D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 19:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28A6346FD0;
	Wed, 18 Feb 2026 19:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HYcFm7Y2"
X-Original-To: linux-usb@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010056.outbound.protection.outlook.com [52.101.193.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B4A1A239A;
	Wed, 18 Feb 2026 19:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771442525; cv=fail; b=jktpX5YGunR758+dwz+JdEziNnYDkXQQTMKXVb0hImSJ0A9k1JJlxBWdpMqPnYtoY41J/aawHZIu+Pl6kCq5OxM5/Z0ROfDr38hOw4Z4KwhT2SY1gpeYwAAueNqfuUmzau6ywRHzcg5G0LwgCUpBtskBEBlQ6WcAhhD1t55sAhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771442525; c=relaxed/simple;
	bh=otFRD4uSW1hM0h41/7821+6028V/rYrofDTnNinXuxc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Eng9+uG9FR6Zro4ilt14Ha3rWW7ZgkTtwRaoA3cNUSQUArBYidESsPoxtcvPu9begskqPd+PAc/4qLbeR3SQbEG0rUq+6M+XFX2thoj+I0cSYOQ7GjXw7tzL1eN1wFuMzizt+3c90tOpUbZyb/2IOnKrwxOIOvSTbxrKn3NXpRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HYcFm7Y2; arc=fail smtp.client-ip=52.101.193.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sChSZzlcjxpCsIeG913Wh9vrncHmUiyxdClNpPiBedFctAsIux/rrdgfGA33JoI/achJs10H4Lokp/OqZqvrhJSA2TcrPtyR+ehZ5QxhTu99BQJ8ntuo9NOA29h0sQtMaYL2kx6sDmrOp09s7WTKiQ9KlWtNJxsyluh1e65AvSQ8xgDr5HUcCOEtQHjHEvDIvKIvJBBNM9AMOtAmOwZ7p06zvbpnPvlVQX1i0k/HY+60QGoAZy3gTXRv6gXc42vUiJZFYdQXTZ9wXTZX2e9Zy/twzemOXShhxWDR8abtxhcnoOL4kZLDE5eCCZWGZZm6eY1czREEc/Yc+jK40GeqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X52pRAFbGK8KL6tAbMUQav6948kxQ1Y/pg4BRD7AbQA=;
 b=uVz4A6vBwmTbZg3ZU/oFfX0Yo5kGhBX+WnXd+NtGUBV3d/vgqKJz92wFPO3N6NyIcWA7h5ZtutW4YpoDgIy+IWMVgXdfuh61av8YFgLO9nXiPnUK3UjVhWFqMPEee4vwdEyYwO7ZqdOCW4wCmHGA7S5AXNnpdfTfli9pvX/fHudZ+OI00t4bp9DAC2LOsk1Q2/aIL+6Pm+66UE2TYrtUMWf6JLvpUxdOB0pvJmiI0YbS64VvEqTYK5Gq/SKOjDPfvmGPYXfPk4esP1v8apSShQ/frbNEIOUF+OuWtNuR82XsTPZtmeNd1KH30yQODij1af84j7rYTv9Y5qZIZNU9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X52pRAFbGK8KL6tAbMUQav6948kxQ1Y/pg4BRD7AbQA=;
 b=HYcFm7Y2LCcrwUDMSzC1PCVUULJWOf99UqaJVaeiNZUjvyDsK4xFL6LFz3HMcWXMiZlXAyf1pFOmiUNTGCMIW0l4Acu16F10ENIKclan31tyybgewnF2U0J9n3NDu4AaEklJIvMRVVW/ZrwK0MlSChVifV3pfQtYNVTJlxGoQts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB5975.namprd12.prod.outlook.com (2603:10b6:510:1da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Wed, 18 Feb
 2026 19:22:00 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 19:22:00 +0000
Message-ID: <49393a7d-5b7d-4a80-af62-11856196fed0@amd.com>
Date: Wed, 18 Feb 2026 13:21:53 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 AceLan Kao <acelan.kao@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>,
 Sanath.S@amd.com, "Kovacs, Alexander" <Alexander.Kovacs@amd.com>
References: <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
 <CAFv23QkN1ypnMq0VwmUbfrxcyqihM1G8Ga3sgiTOWT5rtRnSmA@mail.gmail.com>
 <20260212070754.GF2275908@black.igk.intel.com>
 <20260212073419.GG2275908@black.igk.intel.com>
 <651677b6-bdc7-42a0-a568-6a81761ceb65@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <651677b6-bdc7-42a0-a568-6a81761ceb65@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR08CA0058.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: c993229a-e35a-4b57-75bc-08de6f22fccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHBtQVpBYjlnU0VjbTBBemkrdU81STZHMWNPUmtidUhwNEpVazFNVWc3WXF6?=
 =?utf-8?B?YzlhcWE0WmkwcU9YWlFvRERCdHhQVG1LK1p5eUdUZ3ZxMU91VnRHekpkZDlW?=
 =?utf-8?B?SExPdUxuNmczL20veDVOMWFobkZ2TzE0a2lNbUZSRnd1ZzlQQVFnd0ovR2FE?=
 =?utf-8?B?Znp3RjF0WmxDYmZ6eWpXb2NMRkJnMzZ3MHFDVS8weklUU1dtZzBaajZweC80?=
 =?utf-8?B?cW1Ia2dxd1RCLzJJMTdRdGVvNnAwdlFEY0tabUhHemFxRnB4SC9Xdkh4UW10?=
 =?utf-8?B?RERldG8zY1JCd0J2emZ6eE5FZk5wTzlYVTBMeWozckM5T2dXdXZHNENiTWZV?=
 =?utf-8?B?cXNld3RQY2Z2L2VrOXY1V0YveTJ1R0FQd3Rpa21meGtZNWJmS3pzbHNJK1Bk?=
 =?utf-8?B?RHdFSkFtMFVpTDVrNno1am5BMWxieW9ubjZma2xCL0lhUTZQeDF3RnROeW1u?=
 =?utf-8?B?MzJyMEhGb1VOYW54YldnL3gwWHV5Q0dpc0lpUUFTOWFJMUN6QVRRVTAvWnpn?=
 =?utf-8?B?R1A1elFlQU9nV0RKSDdIY1JCdnEzMVoyUEJydFU3ZmRXellYdnlubUdOYnIy?=
 =?utf-8?B?NGc0UnRKRTFmU2cwVHA2TWtsc21BdURIakJPS1pSWElXK0lXUzBvOVlabC9O?=
 =?utf-8?B?VXBkUHB2ejZjbmpvOTI4L0JxOWU3cVIzN2o0UnhsTzlqbzZtOE92NXY1eXll?=
 =?utf-8?B?YjV0dmxSb1lYYjRZVElIZVQ4NWdiZ2tqenFwZUlXTGRHWUUwcFJwSXVuV3h2?=
 =?utf-8?B?aDNTNmpPTkUyaTlBSGV6ajY0NFVJV2huMjRMaTFyeTJGdnk5UUNUdHA0U1l3?=
 =?utf-8?B?RUliQXBOb29HdDJZWWxKVCtrbHpDbHdNYnd1SVlVRWtwS1ZaSmpQVzZpVGto?=
 =?utf-8?B?OWdoZVR4MVUrZGVzZldxUlQzdytycnYxN29sTU1UZmtEOHBhcVduUmtvbXlp?=
 =?utf-8?B?S0VZaFlRcUNHV1JsZVVtZEtUNnRJZXpOOGJhSzhhbitCMklJUFVpaDF4UDZ3?=
 =?utf-8?B?ZWdnY0VkNG5nQTRXM3hpSTFYV2NwcE54b1dUTkRFbXROYndhUGttTm43Z2VD?=
 =?utf-8?B?aWlsMTJvZ3FjVG9xSEhQVUtpVnN2SGFXSFh3L1JZaDgveVdTb0lLTUJYRkV0?=
 =?utf-8?B?THBPOXVoSTVpUkRWaWJPWVhUR29YZ2lIeSthWWgwRElrMDRwTG9HTUFWOGJn?=
 =?utf-8?B?U0RoQitPUU9PM2dCS3lkbWFBRkZXdks1S3llbGdWdG9UcXBDaW9xcUxUTnhL?=
 =?utf-8?B?TFV1V1ZsMDNmSHR1NWtEcTA0UHF1VFhjSlRwTDRNY0pzZmFKLzlLT2d1Nlox?=
 =?utf-8?B?bktNdlJMUmxhdzFaNkhscjEvODJwcUtMOVNKU3BBajFJa0hBcUlrZ2lpZFpr?=
 =?utf-8?B?TTZpYkZXUGxOMmJSaGs5MEU4UHZsL0RhZEU2MEMxMEZHb0J4ckhJRGZ0OWxp?=
 =?utf-8?B?OHdsUFpRbGlJL0JUdmVIdmxKakU5dVhhMCtBVWlmN1BVdllxQ2IrYU9iVHRC?=
 =?utf-8?B?SVE1cFZOc25aZU5RV3h6TGR5SkdTRUo1V0taUG43c3ZXK2VoMlpYSSs2dlRD?=
 =?utf-8?B?b0Z2VzA4Qk1wa1hPL3RBK3NNdXBXaVYzVXMrMzFtdHdmcjlIU2htcGJkWndM?=
 =?utf-8?B?WGQwNUtYQnVBcUplM0xWb0tvdWdjWjZ1U0xUTEpQR3ZLMzR3VVNMcVVBemtC?=
 =?utf-8?B?Q2ZDbVZielFMWDRnVzFsdFg3eUlCQVZGZ3dQUGQxbGhWZGZnejcxTmpQSVh3?=
 =?utf-8?B?NkVUMTFZZ1hwM3ZrKzNRcVBmZzRLQjBCR3JBcUgyZHBCbFo1TU5wcWFzanN1?=
 =?utf-8?B?b09FT2RhaFJJWVJnNVhMTkVWQVkvUVkvd2pwV3dpUDVQOGY5MmNSNm14OUxq?=
 =?utf-8?B?aFpDbDVERkJ3L2JHdmdIRnRXajJQZmU0TVBzcU5TVGRHcldDYW53dDlPb2pU?=
 =?utf-8?B?OWFPS1FUM0RtRktkV3RLcmsySGM2MDFqUFY0WnZUMlFWZjZZc0lLNUhBWlF0?=
 =?utf-8?B?QURQcVQwd0ZSSDNJcXVFcHdVVGlsR3YyQTltNys1S0tVaEZGaE85N2ZoQ1VC?=
 =?utf-8?B?NG9qcXRVY21RKzU5NVk1dk9IRFU2NDZIdVQ2WDQyRHFORDBMVDUwYWMwQUhk?=
 =?utf-8?Q?NJBk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVllMkFieUFxVk8yd3NQTFM0L01WQmo2UnQwS3IvNHFjVVViVk1tZnlvbXhC?=
 =?utf-8?B?U1Joc0Z2UUJPbFd1Um0xelJLR3Nob216Yzd0N3hYWVYvOWFBdXVEL1kwNmVq?=
 =?utf-8?B?TnE3OHJOWFBXNWNFRHFUQmdnZzhMcFo2NUNkVTBNV0RGdnVMZWs5MU1VT2tV?=
 =?utf-8?B?ell2cUhxOVdTdXJyVFI2cFZHUFBScmlGTS9HaG5sNlZHSVN4bmtYRUx2TCtF?=
 =?utf-8?B?eFJyay9rT1RaSHVrV09zRS9nWXBGdExWS21xOHdHUFk5VStyaVdFRVg2K2dq?=
 =?utf-8?B?blE2dDVLVzRkRnNaY1NoTit0NFREdUhGU3hudDhNdlZSb1Fzb2xVZTFsU0ZC?=
 =?utf-8?B?UWR0N3dJT0RZVkdnRFBQTzkwOXdKaS85UTkvUmxYZVlzbjlBaUMzTURFQVk0?=
 =?utf-8?B?MGFoK0tHRGpNS2gyMEdDOWljREVzeG5EVHNvV0ZCc0M1VWZVY3BuS095U3pZ?=
 =?utf-8?B?SkY3RUdtMVJnMEo2VmcwZC94RzhpcllLaHl2U1hhSUoxSytLR1hYbVhUa1N1?=
 =?utf-8?B?Si9XeUZjS3lLN0lnWDNHQ2xBRDBIWmZkSHFSelJqWVppYXJ2TWk0VkdJUHdn?=
 =?utf-8?B?eWdGbkRSdFZOckZ4OEV3RHhRVUxJTTFBVHNRMnZJRnBzbk1tTmNOQ2F5R2hZ?=
 =?utf-8?B?b3RQR3plOERMRndXUTNBTUJ2bW1WdjBrK0MyUlQyQmgrc0RNMkJjVllKVzBQ?=
 =?utf-8?B?bmtydGpMYzQ2aUkxa0ZyRjZBZWVsU1BCTXpDL01MV01hNGNkV1Zsc2NRdWRh?=
 =?utf-8?B?VnpBb3d6aVFhNDFXbys1ejJnd05JQzFUelRvcWEwS0drSERJdkljTlpjNjNk?=
 =?utf-8?B?R1FTb0hvSXlsUEVRYVRBYjIyV2MzNW1HYjE2V3Y5MDZrTmNpRmxoRkxpektF?=
 =?utf-8?B?NkZaSkJVMktDeklvVVVWS25HMWxNWTNxYU5wVFpkbThhUHk2eC9ZRlBYaWxu?=
 =?utf-8?B?bzJqREtSWXpyeTRKR3FNbW10MVU5WTkxZHpMUVlkWFhWNDNCUEdlVkhvTm1i?=
 =?utf-8?B?NjYyYjdJOTFSNnVDK1JsaTZsNnBwTFdpMTQ0SXlQZ0Iyd3hUK2JNK0V0U29y?=
 =?utf-8?B?N040MTNMaTZlT3F3aXJrRjcwcENWbFZiYVdTM05LL1RuTnhqaHFhbGxLMURn?=
 =?utf-8?B?MHM0RjZBenRoTmlEeldyOVIrdlZFTVUrSWtRY3pjbVM3SXp6dGwxUllRQW1k?=
 =?utf-8?B?RzlYcW9rcHNnVExGSlVSZjJhU1BKNFFsMkM4cWw5d0NrTUk5QitDanBCSEh3?=
 =?utf-8?B?cW9XV1VTdWxIVFRucGxtcDZOa1REVWxuVHpzS3lEd3htSTZaMzRrVzZ3Nllt?=
 =?utf-8?B?Y1ZIYlNuTmEwMVNwUkJ5OUhydklXU0pnSjVGQVJrSDRKQlJRUkwvSjI0aFVZ?=
 =?utf-8?B?ejRJcDJLWmxWWDlBRXhXTU4vQW8vMEJQNTRXbVgyYmw1S1QydzQ5YXJnK0tv?=
 =?utf-8?B?TXBQM0t2eHFJRzJMRFVzSEF5MXFCYXFUY3pZVlNGUkd2K0t6bE1mS2hLUXp2?=
 =?utf-8?B?ZC80K2U3QUtSNEkrWCtUN0ZCekQ4SU5aeDNPbnJwRFV2ZkFBRG0xNklOV1kr?=
 =?utf-8?B?bTBSSWQ5N2hmVnZQV1ZkL3haUms0cFh3NC9UNlNyTHdpU3NIYWc3Wms3Vk9R?=
 =?utf-8?B?OE1Jc0VQQVN4RWdQS0FnRjAzVTRaMlZsK0sxRW9HbHppYXFmS0F1TWxBR0tN?=
 =?utf-8?B?Tk5UK0FDcUtkT2ZZTDJla2cxUWdQdjA4VE16ck1LeDBtM0l2VmJTUlVTR0xr?=
 =?utf-8?B?ZHZjanFhY2hQMXBuU0RNcmtDM1lMcGgxRFRRRitHaWNBMnY2Q1J3TG1rT0cv?=
 =?utf-8?B?TlZoL3JRNU5PK1d1SWNya29XeU9JUVkvNDVrbjU4bHhYYnJ0bm9HWXAxQkdE?=
 =?utf-8?B?Vk1YM1VTMHZxdDBVMFp5L25ML0Vya1kvY2hoam4vZDZoTGVyRURXM0lXUyty?=
 =?utf-8?B?WjQwem00MkUzUVlUYVhJckQ4YXJQMDhKZTZYQ2R3bWJ6QkxKL3hwV2krMlRs?=
 =?utf-8?B?WUYzWGIyWkFvNENlYkhuWk5yOEV4VDF5b1VDck5EN1c4ZVRQaFBCS0ZlUWJ5?=
 =?utf-8?B?QWhzMk9obitrRE9HNURTQVgvOW1ybC9kWWpYdmtZVHhIQ0JHUnFYUTUxY0xy?=
 =?utf-8?B?UHZQZkN4RWZ3WUNtZlhBb3p6bGVqbUxSSFZoSUdjQ1pndnZGamlPL3BBSmNW?=
 =?utf-8?B?Y1JmQzkwTU4wNW1hNUNqMCtyZE43eXR1Qm9ZMDNzd2Zmck05MHZtbkRUelRo?=
 =?utf-8?B?dWovbE5EYjdEdWN2RWl4TEd3MHVhcHBZc2M3U0VTeFgrZmdWdHJORFpaNDBH?=
 =?utf-8?Q?DOO/fAcQYaD2syLRzR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c993229a-e35a-4b57-75bc-08de6f22fccd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 19:22:00.3194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6l5I/MmKKPvwFm2JauNkdFRIwweAxpbU6wS9AXl49QuBbxoZdlG6rcEhXZ3KcEopwQ/DvFzwGQEKsqYFE1zrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5975
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,linux.intel.com,amd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33441-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 97E4D159021
X-Rspamd-Action: no action

On 2/12/26 6:34 PM, Mario Limonciello wrote:
> ++
> 
> On 2/12/2026 1:34 AM, Mika Westerberg wrote:
>> [+Cc AMD folks]
>>
>> On Thu, Feb 12, 2026 at 08:07:54AM +0100, Mika Westerberg wrote:
>>> On Thu, Feb 12, 2026 at 12:16:03PM +0800, AceLan Kao wrote:
>>>>>> Disable runpm on 62:02.0, then we have 83:00.0 and its downstream 
>>>>>> port
>>>>>> 84:01.0 and 85:00.0, and then the tbt storage is recognized.
>>>> Got troubles with mutt, my reply got rejected :(
>>>>
>>>> Using gmail and copy/paste the content below again.
>>>
>>> Okay.
>>>
>>>>> Okay that means there is nothing wrong with the PCIe tunnel itself 
>>>>> it's
>>>>> just that the PCIe side either does not get the PME or does not see 
>>>>> that
>>>>> the PCIe link becomes active (e.g the PCIe Downstream Port runtime 
>>>>> suspends
>>>>> itself before the link status changes).
>>>>>
>>>>> PME work so that there is wake first on Intel it's GPE that wakes 
>>>>> up the
>>>>> root port and then PCIe stack wakes up devices and then the PME 
>>>>> message is
>>>>> sent to the root complex.
>>>>>
>>>>> If you do this on Intel host do you see the same?
>>>> Intel host exhibits another symptom, I think the root cause is 
>>>> different.
>>>>
>>>> Plug in the dock, and then plug in the tbt storage to the dock one by
>>>> one, both storage can be detected.
>>>>
>>>> Plug both tbt storage to the dock, and then plug in the dock to the
>>>> machine, only one tbt storage appears. In rare chance, both tbt
>>>> storages show up, but most of the time, only one tbt storage is 
>>>> detected.
>>>> In this case, none of disable runpm, rescan, or lspci work. So, it's
>>>> most likely another issue.
>>>
>>> By "detected" you mean the TB device is not detected on TB bus? Or it is
>>> detected on TB bus but creating PCIe tunnel does not make the content
>>> visible on PCIe bus?
>>>
>>> You can check this from dmesg, the driver logs if it sees the plug 
>>> event.
>>> Or run tblist (from tbtools) and see if the device is listed.
>>>
>>> I suspect former and in that case it is likely a PD/retimer related 
>>> issue
>>> rather than software. I see these once in a while especially with new
>>> hardware where the PD firmare is not yet stabilized. If there is TB/USB4
>>> link then all is working from TB/USB4 perspective.
>>>
>>>>> Right at that point the PCIe Downstream Port probably is already back
>>>>> runtime suspended.
>>>>>
>>>>> Here you could try this:
>>>>>
>>>>> # echo 250 > /sys/bus/pci/devices/0000:62:02.0/power/autosuspend_delay
>>>> No luck, I enlarged the number to 1000, but still can't recognize the
>>>> second tbt storage.
>>>
>>> What about -1?
>>>
>>> That's effectively same as blocking runtime PM completely so should 
>>> work.
>>>
>>>> I tried to wake up the PCIe ports in the beginning of 
>>>> tb_tunnel_pci() and
>>>> it works.
>>>>
>>>> +       pdev = pci_get_domain_bus_and_slot(0, 0x62, PCI_DEVFN(0x02, 
>>>> 0));
>>>> +       if (pdev) {
>>>> +               if (pdev->dev.power.runtime_status == RPM_SUSPENDED)
>>>> +                       pm_runtime_get_sync(&pdev->dev);
>>>> +               pci_dev_put(pdev);
>>>> +       }
>>>>
>>>> But I can't find a generic way to get the bus and slot number, and
>>>> would you consider this a feasible approach?
>>>
>>> No I don't want any (more) PCI related hacks in the driver.
>>>
>>> This is not a TB issue, it's a PCIe issue. I suspect it has something 
>>> to do
>>> with handling PME/GPE on AMD side. Essentially when runtime PM is 
>>> blocked
>>> the PCIe hotplug driver notices the tunnel just fine. When it is runtime
>>> suspended (e.g D3) it should send PME to the root complex that the 
>>> brings
>>> the topology up so that the hotplug driver can detect the presence 
>>> but this
>>> does not seem to happen.
>>>
>>> If you enable dynamic debugging of pciehp, do you see anything happening
>>> when you create the second PCIe tunnel? I suspect not.
> 
>  From what I see above I agree this does seem like a PME delivery issue 
> of some sort.  Any chance you can put this on a PCIe analyzer and 
> confirm whether the PME was ever sent?

We could reproduce the behavior on our side using a USB4 hub and two 
NVME disks.  Keeping the root port for tunneling at D0 (turning off 
runtime PM) avoided it.

In cross referencing an Intel system (Intel Core Ultra 200V) we saw that 
it couldn't reproduce.  But looking at differences we noticed the root 
port for tunneling on this system stayed at D0 the entire time.  Is that 
expected?



