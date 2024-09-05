Return-Path: <linux-usb+bounces-14733-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6001696E28C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 20:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DB1C1C23B32
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 18:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13ABA188A19;
	Thu,  5 Sep 2024 18:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YAQ1BBDr"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5D243AD7
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 18:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725562679; cv=fail; b=TVCkX9Z6FcvIBLEjv5ykD28ZNZ+JUGjC9DpPhRozw/WUwjU/EhK68BzBf7Rc5zIcsTa/75yGtyIXekop0wrM1tJsOPAUBWnzWTkPPjza+D2jnF/WZ+/RJlnUZed1ijKP+jQ5gSG6wHKZzsr68QVBH6dTWjRR57CIJFzdpLKsbgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725562679; c=relaxed/simple;
	bh=Aa0nhoslfrjRWf4E16Zy2F38DxflLuHawzYhTgxUPII=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=We3aVDs9T3alvMrhPrEQfpdC85cVuEIjYBZhuP2Dnkc6xQ9wUNIYFwJiF5IDyihDMbjVzoMWiZ4Pc6N67JqbgWrqT1PYDtYPdGuLrYpquzGByziVCwyFUsvMNOO4ViW6/jL6lI7GVpvkdf8uMFd9myeC1v1MJ3ODyrLdoLCPnlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YAQ1BBDr; arc=fail smtp.client-ip=40.107.100.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7P6TjmIk/Ql6OdC6yy8O1/fCl0udavJDESU7wtGaB75WdMhjlDxQpK21kTTkL+NQ5Tw/InPz4AkNbB2TaAegtJM6WY5GXJhqY/76Tef4E3oOgwsnmHtT++zZRqTGg3WvmsRj+FVi7YbZhIijxvCUTKfCTH9YEJsG/TA6zn5tpEjTCBcakAl9j1f/zVv828LFkmW08tEcSLAiseysxFBGQpJcxuhl4ZWjnWphRF1c0IBgy+S80FLdoP3jy8ggJfiu5ua0ZFmTaErPgGQ97CGw6cR9YiziROYx46CgsEzudCmsTdDmSD0KTJNmPPMQVvWVY5epck0NVDOFnRSRxvL5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxRTmsaioJodV3AY7/0SSOgMvOu7SvxDhtZdbxoZLXk=;
 b=ayagupud7t2zVdNZxyU69WD0aoj+6s1wciVVdRyW2HDm/thi+nApgGM/Mhb6zjYF6hMpkRl6evdaxmxh1uccUShQaAu0b1YjTYZvGS2PfNtan0/w3l7BP8ccMP9ZVFTCl88sUcD962znvZP9UMQT3whcsTogC4IsPTUHUJvfL0V/GWqJytAGv7oB6WBNscGHIM3leCigyN1FsYGAoeh1yAFA1+FS7sXuvTU+9F4J/VxErrFwVMMAWS6cv+ufnuBldH3InoBz+RRXEjLaMW7XGYRu57FBX5P0hOlux3X19C4TjwpzcsjQFJ0FIvgkAsYDz4yUcFPSD/PGBLqAwRvqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxRTmsaioJodV3AY7/0SSOgMvOu7SvxDhtZdbxoZLXk=;
 b=YAQ1BBDrMiKj1kL94qnKY4GOYU2jA3zFJUZBK5nvkd8ov3686W2o6RQD42FWwPQ2ZeH0jeqFQqlGjec19xRKZzHaw2VD9jSLUFnyQTFVf6xTkO7dtrXTzka64slL7CBW+2O5nT+qeN/iPW+CXqiRxymx1avqPjsP/J3jpqYASJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 18:57:54 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 18:57:54 +0000
Message-ID: <830cc833-24a7-4e19-8804-6b4135e122d1@amd.com>
Date: Thu, 5 Sep 2024 13:57:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add device links between tunneled USB3 devices and
 USB4 Host
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org,
 "Rangoju, Raju" <Raju.Rangoju@amd.com>, Sanath S <Sanath.S@amd.com>,
 gregkh@linuxfoundation.org
References: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
 <321cf204-cf74-4f51-8ed3-8c5738444359@amd.com>
 <20240904050013.GZ1532424@black.fi.intel.com>
 <7a3fc5cd-1705-40ab-8d93-d9f286009aa7@amd.com>
 <20240905055330.GH1532424@black.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240905055330.GH1532424@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0076.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: c5766d31-5f29-4f83-14e3-08dccddca5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djVpU1MyZDF0N1J6RkdVcjhCM0l6T0hQcmNiUC9IaXZ5YWZPSW1RT2NNVjBN?=
 =?utf-8?B?ZnM1NVFFbWZMRkRhVUhoNUV6Z2lOWVhGRGFVODlqOHpDeC9nVTZzakRRZVI5?=
 =?utf-8?B?MTFxSnMrUDJJaWNkV0ZsbkxSWURldk9iT2hQYXFwL2lEUXY1QjQ4aVRER0ZR?=
 =?utf-8?B?eldmcHpMS1FWYzZ2d1RHTk5OMXQwODdac3A4WFN3WDBWUjRrdml5bmZGNHVE?=
 =?utf-8?B?eWFqbHdjTVJUSC9wdU5LOElyd1NRWm1kME5qMVpiK3EraEY2SDREYS9NaDVu?=
 =?utf-8?B?WFZzdGF2REpzQzhhZHU5U1RSM29YWTZSM25WT0lPb1dMa2JQZFM2a01sWXlS?=
 =?utf-8?B?dEFUcXpLZTRoczYxOGZKazd3ZlNjYWdaeXUyWlNWcnkvVENFSUZuY0lNSHM1?=
 =?utf-8?B?T2QxTGhldmpibDREcnp0U3lCa3hEaGdrMTN0SlFSVlJaVzRZVzNlYWdNQ3Bi?=
 =?utf-8?B?QVUwNEI1WGVsaDRZNnFUdmtJeXhMNzV2WnZsY1k0dklZb0hnYUU4dmQ2SjEv?=
 =?utf-8?B?NmdJajA0eU1sOWozWW9kWjdBdzBNTlI5WTFwejRLa3hVTzN5b2xXaHhCb28x?=
 =?utf-8?B?WVcwbWRMTjdscmpnVUhvcFN1c2VVYWVVMW5JazVyNGNJcHp4MUZZK2xKak1I?=
 =?utf-8?B?UzB0TW9kYmQ4K1RMd1JBKzYxTHVWRTBtSGRtZFp1ckU0Uk9lQ25mQVNnb1VN?=
 =?utf-8?B?NFZzWS9sM0d1Y25nWUNXU3Rkek4xdVEweTJRSEZuL1FXZ2YxWjhuM0JQUHdS?=
 =?utf-8?B?WEM0QXJZZWkwSDRCVnpsRlZLMm1OalhDUDVpTE5KZHhWVWw3alRMRStEcFVG?=
 =?utf-8?B?andzZy9LaFZZWGdoYUVkOGhPUzY2d2IwR2Y2cU40T0VORXJQeGk1dUNoOXlP?=
 =?utf-8?B?c2lXQ3p4TnBjMFV0Q25reWRiaXhzNnFwNkdxWXNmN1FGRWIvZWU0b2hHR1p1?=
 =?utf-8?B?TEZSbkJsekE0YWo1d0laVllKZ2xjVk8rREZuKy9tTTZ3WWE3blA2bXZHVkJN?=
 =?utf-8?B?UjBXT2dEZnhaajNwcmhoOHdpTE1BeGNEWDIxZ1VmRmNFalVpbk1sZVBBVERw?=
 =?utf-8?B?R2hIVmFkMUl2L1Iza3dpVzNUZGNJSGl0TDExZG5qMHQxdER4NjVvWXlEblRr?=
 =?utf-8?B?L1Q2WnJoYVd0YTl4c3c0TjRMOG1ZMHVjNm5Ud1RPQW5DVWlqdHhIWlg1MnVp?=
 =?utf-8?B?cUJjeHpzVlcySk94RVpuZmhCb0IvcG1oMkY1SDRudXNZY05DeThqZkhyVHRS?=
 =?utf-8?B?K3JFZnppTy9zc0hYNlFsNHl6YWdoQy95QllPbkxtRWxJSno3NEtiOTZwTEo4?=
 =?utf-8?B?TUdVKy80a0RqckYrZDlOWHk1MUdzNjhSL2U2SGs4N3V1MWd2bXJRVGZxaW9v?=
 =?utf-8?B?SEhPQTh3dXhtYS9jbnU3L1RQV0ttWjNkTmY4dzF5TDFnZzRvMDcvYlczcVov?=
 =?utf-8?B?bHNuY2xvMW43eUt4QUpQUTFXc0JsNEpiczZyVGxBRCt1b3B3RG5GYzVLcURm?=
 =?utf-8?B?UGNxQXBGOUZKZWJVNnhobHYzaVZZMlRIV0IwYk1YLzBzNzZrNm85WVVMRzJK?=
 =?utf-8?B?cTJpTEdhQ2d2dk13eU5uM1UyZVB2WTJmOWdxVzdzelcxVXFqRHlIY3JzWHJG?=
 =?utf-8?B?Mmw1ZFVOK3FoMWQ0dWxwUy9nNnJFN1BHK1dLQVlpbFE1YnJNUW43TU95emJT?=
 =?utf-8?B?Si9uMTMwcGswVk5wZ200Ny9DN09CaHhSMm1jSnBDUzhIeUZDd1pGbVJ3ek9I?=
 =?utf-8?B?eFRwU2swbVZXdVVtdnNTTTZiaHF6RE80Nkl4ZmdEdzBrQW01bWFXZUU4R3Ew?=
 =?utf-8?B?Y3k3c3JtTGFtWkl3UGZIQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0pCcXFjRm5MN3ZSM0FsVlZPZ2hyNGxoM3RUKzh5L3M0TGExdnN4ellJWnhh?=
 =?utf-8?B?aUxoQjRUZ09qaEppVGNuZm1NUjhDWDhYNFBFbUNDT0hGd01zc3BoblV4MFVS?=
 =?utf-8?B?OXdvdDA0WWZWZWtlc01rZWp2NHNVRGFsZWE1bHQwYndzaFVBSm5McGlYVFdh?=
 =?utf-8?B?c0k2a0hOZlYwVEh4dnJUODRMbFMrbTMrb3B4YURraVprTmhHb0ZKbmlxekdm?=
 =?utf-8?B?RHZ0V1M5ajhnWi9Da0Z5d1E2N1BKL3hjeUVqNnRvbm9xTzYzaVNqcFpLZllj?=
 =?utf-8?B?M1B5RXd3OVpKb3E3c2lPUENUUjFwTVdrZXAyZFcxc2FTUndkUDdMU3RweUs5?=
 =?utf-8?B?d2RPTUs1K0JiQVVuYmIrMnRONVBZR0NOSWhaSmFycS9UU0ozRlJrRTlRQmNR?=
 =?utf-8?B?aGFBWmgrOGVBV0N2SjBVbTVlY0R4TjRWczBkUUdXYkFJUFM4bnVLVGFnT2k3?=
 =?utf-8?B?YjBWRFlnUTRvd3JZQWU2bitoVmJ3QWN3eHNxNUNXRVIrSFoySTV4VXAvcHVE?=
 =?utf-8?B?TDlOdFNxeSs3NnNXZG5UUFJaR1ZRQXIxc05YVVhtYmxxcTJMU2lhTWRCZzdE?=
 =?utf-8?B?bW5oc3c3eHFKODA3QzJDV0NkaUVOUXVycHdJWWtnMHovS1dZbkVmQlRKMFhl?=
 =?utf-8?B?SnVyTzlCMWkxeXNnSjV0UjZJTGFodkdreUo2ZnNrYWlDY1FJWmtFSWRvOTJ6?=
 =?utf-8?B?dHZqL1RJTFNyMjltT1hmREJCdDJsRUhINjl0Vy9rWFVxUWl6WWxraExIQkxa?=
 =?utf-8?B?ZGRETzdzQUF2ZHI0ZzQxOGtFbUtwaC84ZnFsc1JQenhRTTJiUUhWSitQZU5i?=
 =?utf-8?B?ckQrU1BJTjZ3SVRQMUwzOWc1V25MNW1ibkRRSHZNaDhhM1BoaFMwTlpZT05a?=
 =?utf-8?B?b3dRV0d4dVEwcE1LaERWczQzdmVRS3Jod05PaFhES0wrMWFiajYxODU1bHc2?=
 =?utf-8?B?K2pDSEROVkl6b0dTd24wV1pEbmlqRFUxdFhxYjV2cS8xTEV3UjZudjcxM0VW?=
 =?utf-8?B?ZW5TbmZiT0JhanhJOGFlOHNibFhpeUNsN3A5OXBiU2kreVU2TUptN0pKZ3d4?=
 =?utf-8?B?ZUtKUWNYc0FNL1pEQUNScVNzaDZRMFZ4UnV1bHBUNTE1MzhXeE9zcld6L1ln?=
 =?utf-8?B?Q1BXaDZYRTRscS95SHZHWGtybGNaOHdVVXNDYjRkcG9EcFQzc2ZMOVJaVTc5?=
 =?utf-8?B?NHF3T3R1bWpZaHcxcm9XWDNzSmxQTFJCZzNONUU2WUZDTUhSN1Z3eVpTTWkx?=
 =?utf-8?B?RktMNlc5empVS3NIRm8yMDF4RjFuZTB5VEZJUGpHNDhYZXc3bjJxa1NLSFJy?=
 =?utf-8?B?Y1g0V216QUVabTVCZGU4djFUUHpCN21EdXZhN3pVMGJRaTVQeHh5cmtRdXBG?=
 =?utf-8?B?R2N3WTdjdWtpQW5Bd2NFZ00wcXkyZXJpN0NGMlhYQWtrZ1ZJOGNWQlVKV2Rl?=
 =?utf-8?B?dkkzRnpONWhLazY2dGkxMDNvNGVWTzBvMXcyYVFQLzdCZXBYbHA5OVdKMVBB?=
 =?utf-8?B?MkUweGJqNWMraTN5czRlRjhrbnFsdHUxZGVOckpicXZKbDRsZGNEL1N4YlZo?=
 =?utf-8?B?VThTd1hLbVc1VHk4b2gyazN1a0dEMFBlTTU0QllYdzFoTFlXT3hEalFXTzZT?=
 =?utf-8?B?UVJJeUNSYWhaeElnTmhrbkQwWUNVMFNleTVuK2doZEZXMlJFS2t3T1NLNXJV?=
 =?utf-8?B?TlZJYmxGbGpJVmk1MkFlZy9MZHo0ZWpSVWV6aE9MeXAzL1czK0QrY1ErZTRk?=
 =?utf-8?B?enlnWUl5UVNWaFM2eXN3TFdoMUpxVlBXUWJ2eGNoQUhRUUU5M0J0cDZsSzNi?=
 =?utf-8?B?dkVEalZTUFA0NGtrdjlMUitvcU1KTVJSNm1hOHQwaW4xOG9MeUlodXRRRW5I?=
 =?utf-8?B?cUhFMnM5dmZ2NFhLaGhKZk9VL1hqOWtFUE9kMkVYbnh1bldQVmM2YitsRjlD?=
 =?utf-8?B?VE4relRGbEJZMmdGSGJ5blhKUWNlZENzRlY2bWFvNkhybnNJWWxFbU85Njlp?=
 =?utf-8?B?eUQ5aC80bWhZTjExVitQelZFUjFYb2tSUW1tSFF4Mi9zNXZSMEpIYSszZXEz?=
 =?utf-8?B?bG5tcnovb2ZlT1BaMURHQmxIYk9sVDhMYzVzRk1QRDlQSHF0dEZKL2ErV2tO?=
 =?utf-8?Q?ByGVvM2dQtTK05LHl8rsKbEPb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5766d31-5f29-4f83-14e3-08dccddca5d9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 18:57:54.0999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1HvXmdP0IDp8JnDFDOYMBYVj4KD/jszYMxx2mm266W2x+9eM9zGdcXNkRT2yopvfWmULRAQu5cGza2xPQwYDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650

On 9/5/2024 00:53, Mika Westerberg wrote:
> On Wed, Sep 04, 2024 at 12:38:15PM -0500, Mario Limonciello wrote:
>> ❯ ls -l /sys/bus/pci/drivers/thunderbolt/*/consumer*
>> lrwxrwxrwx 1 root root 0 Sep  4 12:33
>> /sys/bus/pci/drivers/thunderbolt/0000:c4:00.5/consumer:pci:0000:00:03.1 ->
>> ../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:00:03.1/
>> lrwxrwxrwx 1 root root 0 Sep  4 12:33
>> /sys/bus/pci/drivers/thunderbolt/0000:c4:00.6/consumer:pci:0000:00:04.1 ->
>> ../../../virtual/devlink/pci:0000:c4:00.6--pci:0000:00:04.1/
>> ❯ cat /sys/bus/pci/drivers/thunderbolt/*/power/runtime_status
>> suspended
>> active
>>
>> I would have expected the USB4 host router to go back into runtime PM, but
>> it doesn't anymore until I reboot the system.
> 
> Yes, it should enter runtime suspend after a while. Would you mind
> sharing dmesg around this?

I was capturing artifacts when all of a sudden it started to work.  Then 
I remembered I updated the BIOS on this system very recently.  This is a 
pre-production BIOS.

I downgraded back to old BIOS and everything works as you expect, so 
there is some BIOS bug at play.  I'll see if others can reproduce my 
result and drive a BIOS solution.

Sorry for the noise on the patch, all is great!

Tested-by: Mario Limonciello <mario.limonciello@amd.com>

> 
> I tried on my system and it works as expected (the device-power.sh is
> internal script that dumps the device power states, I can share if you
> want).
> 
> Devices 0d.2/3 are the host routers. 07.[0-3] are the PCIe tunnels (not
> really used here but shown for completeness, I don't have PCIe tunnel
> enabled to the hub). 0d.0 is the xHCI controller.
> 
> Plug in USB4 hub
> ----------------
> 
> # device-power.sh -s
> All PCI devices (software state)
> ...
> 0000:00:07.0 8086:7ec4 Status: [D3cold] Real status: [    D0] Runtime PM: [suspended]
> 0000:00:07.1 8086:7ec5 Status: [D3cold] Real status: [    D0] Runtime PM: [suspended]
> 0000:00:07.2 8086:7ec6 Status: [D3cold] Real status: [    D0] Runtime PM: [suspended]
> 0000:00:07.3 8086:7ec7 Status: [D3cold] Real status: [    D0] Runtime PM: [suspended]
> ...
> 0000:00:0d.0 8086:7ec0 Status: [D3cold] Real status: [    D0] Runtime PM: [suspended]
> 0000:00:0d.2 8086:7ec2 Status: [    D0] Real status: [    D0] Runtime PM: [   active]
> 0000:00:0d.3 8086:7ec3 Status: [    D0] Real status: [    D0] Runtime PM: [   active]
> 
> Unplug and wait for the autosuspend_delay
> -----------------------------------------
> 
> # device-power.sh -s
> All PCI devices (software state)
> ...
> 0000:00:07.0 8086:7ec4 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]
> 0000:00:07.1 8086:7ec5 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]
> 0000:00:07.2 8086:7ec6 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]
> 0000:00:07.3 8086:7ec7 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]
> ...
> 0000:00:0d.0 8086:7ec0 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]
> 0000:00:0d.2 8086:7ec2 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]
> 0000:00:0d.3 8086:7ec3 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]


