Return-Path: <linux-usb+bounces-31551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DEFCC9373
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 19:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA28A304F64D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 18:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A3D34D4DA;
	Wed, 17 Dec 2025 17:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ULzepI9C"
X-Original-To: linux-usb@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BBB34D928;
	Wed, 17 Dec 2025 17:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765992365; cv=fail; b=nPfedCUE02SfHiGGvcuTWsWkouZo7q/VxlE31iP8IWsg+OXAWBV11h2295fXWgzjQICd+jkgVhCW2zumBGXxOpEX5oi3tFVy2hC4vUHf8sG3aVRGYarvjm2BPNkpJ3z+u9xQw0hxa7fy/KBkJibP0N7HvoRezRbXvzthLdDMW6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765992365; c=relaxed/simple;
	bh=LvwsHk3afh9VLwEGwHH98lf+LOY/WPG1R+jt6bdivVU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iexodDERZvGIgWFuYVVTWZewGcuNndMidDgXBnrTme9/ZDGfZE2OiogdGNvYUKRd3r1GWDlk4azSuH+A1GjUIXqznDkmTnkk1cE6rOKQXpxMY0K/lA2PKfvU+4fCT09dtpmNt2WWh0SweE8+RbV/D2MSykzcVuvWzUN8voPFweM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ULzepI9C; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Na4gW38OeL/krQLmqEIJGkBDmiwJctbV85wf+hntCBBF6/OcnNe3c82+Py6XT0aI/dNGdT9jyiqdUeXwbxEWq7qUd/we6FfUuNt/YNQi3j2ZMK0Z5mX/sKlf75qT5sILosGq3rAxPNnZfLXr97wkid0iyQOjKtV9+A4YzGysxgB+FA7ljh+BuGq3O9Y1msatijmLrxiW27Y3e1e3gbovA+0WEDf6v9Uu1fsBYGMZuTqP7ExIOZioQAepSDBUF8lsucHE1suoqR1VKGAsKxnOWGVUyx817MpzlklQAfsE2BWXlXHs5hwJhDb8qbZONcwfBx4WxwSDC7SGAvIjXxI6oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czABnNrcrtW/JUVYvcI13bGHIJ6eHoALnYhmsEDMC7o=;
 b=wPVmO5rR+xcM5bNy+ENEj2tfi0uw12r5/XOvpNifbU7xzpmUWuBdo0fRaq1NNJ+681/ytF80oMlj2qotNizJwtoWx+QNaNDPgl6IZRstvzh47JAYfPfqGqfma+vlcliX2p8uIRWPuRSYQr/EAJMDRGDJfWa+02CDXh45etBlWVCunjLARW4uLJEjh/TEZeND45DO3vWgBlvnfL8tUcEjl0HWUtv6TUlY5e494jyvy6WLpU+1mDu/glqQg01IWSj6Q99X0SjSRMHRI0J409b8fuh3WnfMZ9nohq8Ut3MWFhwgNEmq35yJeg5iojaFWN1ISKrwGbqXlh5uR7nmMY9NHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czABnNrcrtW/JUVYvcI13bGHIJ6eHoALnYhmsEDMC7o=;
 b=ULzepI9C5AtiF8qwcKreDId3GtgYfPDSgg0FLhkvNl2A948+TNcD0kZKNL31BnOlzXTjIVaQ65mC083oX2nbi3CH6V2Zn/6OeRaS/fCxWuvm55t5STGdi+Yxy2qjB7lexfmiKQq8ZFiSUQUumXaMPlpJazHM8gxTcl1a537Ukqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB8082.namprd12.prod.outlook.com (2603:10b6:8:e6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 15:53:15 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 15:53:14 +0000
Message-ID: <5d7f2661-f02b-4985-b438-196b48c10237@amd.com>
Date: Wed, 17 Dec 2025 09:53:06 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 AceLan Kao <acelan.kao@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
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
 <484ff606-ec10-477c-acfe-d4d781e2873d@amd.com>
 <CAFv23Q=bLCif750y8eDEP4J+KwVy8CknZawYOGZWWrBSiE8FNA@mail.gmail.com>
 <20251217125507.GR2275908@black.igk.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251217125507.GR2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0212.namprd04.prod.outlook.com
 (2603:10b6:806:127::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: d2536457-9a29-4cb8-6607-08de3d84636a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFZ3UG0rUU1icjFjRGtQN1JZV3NkZWZkbmwrWWRhVWhVWEJZOHd5V3k5OUFa?=
 =?utf-8?B?S1ZpK3B1WUgyK2FFdllOZGF3bmExK3IxejlFNitaSDZBVHRCM0lNRWRBVmo2?=
 =?utf-8?B?WnJISUxKd001SFpNNkdmbDdHTjlYMGV6VnhZdDU3TkRVOTMzeUVhSkdUdkd5?=
 =?utf-8?B?NWxNd0NCdXM4SE5uUml1Vk9XL1U5VzdTQUNjVmh2emQ4NFdXOEtQd1RoQzFr?=
 =?utf-8?B?MU00Q3Z3WHVmL1NlTk5JZ1U0eENvYmpVcjZOdDZ3R0VwZ1prYkFSTVJucHJ5?=
 =?utf-8?B?WEl6T1dkS0puSlNHWGtnM1UvSkpTOEIyMzBndlJ2cFdtUUoxMUhNdGpORHhl?=
 =?utf-8?B?aDBna0FWYVhrTzJJamx1eWI1a2RRMW9xUVFSOVBqQy9LQ2dwRUtEZlZCNEg2?=
 =?utf-8?B?S3RUTExCNnJDRm1kcERZcWwwN2tiR2E4SERkYzZZRWxkbDgwTjNCNlQxVFFK?=
 =?utf-8?B?NS9JcFJ3L01mc1RLdXlMYzRpaWxDS2UwRTJUTC9KdjhQZ2N5WHhzbVNmQmpU?=
 =?utf-8?B?YjNFc0lyVXN4ZlBmN3ZmMlcwdk85TUg0QnJkeGw5dVBDc01rb1dwMm82N2RZ?=
 =?utf-8?B?T2hBbTVLUldPWjlpcWlPc1BTTHhhU1VNRnIrRGxJZUZmK09haEEzWno1bGdD?=
 =?utf-8?B?enZ6RDRtVngxMFFPM2phdzk2bVVLUS9ZeHN0OVp4cjVTSHFrTkhxMm1YTEhV?=
 =?utf-8?B?OEZkY3JZZk42MGNJMWhyNGJrRWxvdXNHNUFabmo5aFBPV0VEbE5abXF4bzMr?=
 =?utf-8?B?RTl0dGNlbnBWanJ0Y2VBbmVyZXdpYVBQNXFpa1ZJUUVoSUdhcERucWE3aXdG?=
 =?utf-8?B?c2Q5a2hhekR0U1o0Skl4Y2FXVTRQTFBhbG5LSTgva0hvTFRPcGFUT3hKb0ly?=
 =?utf-8?B?Vzhqa0I1UzJhRkx6QitJMzh4WndldC9YWVNuRGxLS0RuV2hhTStUeHl6NXla?=
 =?utf-8?B?eFlZbDZpS2NYY1hDdlZXSlpXenc0Q1g0KzNNc1hLT0xncVdmR0M3L3JPR3Fz?=
 =?utf-8?B?T3BpLzlUbm16M3pRclpqTlBjQTN2WTZydmNPUmhlWWlGNnNmTFhuWXRTNGhw?=
 =?utf-8?B?ZjNNL0VUTWNRUW1iQi8xM3h2RUtnTXhhaGFLRm5FQ0RQS1dSQ1E4NUVING9O?=
 =?utf-8?B?bSs0T1U4MUsvcE9JbnJ3cUdZSGpWNmkzZnk1cG82N2hhNG1HaGhQdnJvZXp4?=
 =?utf-8?B?WVRxS05lRmt0TnpTZUE4eDV0ejNlVmNtSGRsZzhsZWVJbG1YUTdmVTlTc0pP?=
 =?utf-8?B?Z3RrTk9kbTQxMGJXUU9lQmgydWFDUDF3d0dvOVNFOUJUUUZIRCtDa1JsNksr?=
 =?utf-8?B?ZEpJeVduQnZ6VVQ2cXd3QWdWR3VKd1VTeU1pYm5NOVhTQVc2cEp1UnBHQ3ZV?=
 =?utf-8?B?SEpjQTN2bG9WdDFZUFk0azRubmJ4M3l1YWFpZ3pNUjg3WVVIaUoyRk1hT3cy?=
 =?utf-8?B?Y1RMS0pYQ0dIVHgwRzhJWDZGdlc5cGgzbjdqM2RTZnFuYVJmN0FKSzJ5MTJO?=
 =?utf-8?B?MEYyb2FjbHM1VDFyWGo5WXdPay93ZEtKYlNwNmc4cmdIRUdLdWR4VS9WUVpV?=
 =?utf-8?B?SDZ5U0UxUUwzL2doZEVlSWJ0a2FXSGRIWWZpV1UyQzhVWkNiakRUei9iNDU3?=
 =?utf-8?B?YTBYSWVzVllwRldCQ216NkNTVjczYlc1MFFGRzFlMVBsTlVLTGRBNUlSQlBR?=
 =?utf-8?B?MjZkbCtrMWJPdmtINE9mWjBQQUZyelhuT0NBbWZnMHdjMDZUU1k5Zjc0Y0w3?=
 =?utf-8?B?b0xJZnY2ZDl5TkpKZjJKVi9ScnpBaHNuWEN3eC9uZW5heVV5UXJrbHNUay9a?=
 =?utf-8?B?Z0RLUWpWUWwxZW1TNGZ0OFZWQzltaEN0YWRXSkZRbVM5NGxnV1BZeW1Uc0pI?=
 =?utf-8?B?aDE0djFNTTI5azhxSlNMN3JSMk5TT0djdXpCalZCWDlZWFE1c1piYm55bWdh?=
 =?utf-8?Q?8YTxCuJlkyq8VSdcAlcipBWS+kdqF9/y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTlweGowZk9KUEtONXB5Tk9ndTBhTkRHdDg3cUo5OXpHeGVxeEtIQVQxYi9q?=
 =?utf-8?B?dXEycm53bDR0TzBqanRhTkVLZHczZTI5WHlFMkpVd2RMWlRpWFVBWE9Pc29x?=
 =?utf-8?B?YVVRNlNqblB3dVcwRGk5Q1JnNnJhYUhmV25zNmpieVRNc3pMUzVlMmRPTUpz?=
 =?utf-8?B?TU9WWmR5eE40VDhwalhML1FZVGZ6ZkY3VEY3QURqeWp3TkZrT1BHS1FiRGlk?=
 =?utf-8?B?eC9YWGJPVmRJbGNmUzh1ejgzejBEN25iUjk0OE4xTGlYeEQrdjRRNVZnTmJX?=
 =?utf-8?B?bFhDdnRldWIzS1VkQytEdEcrV1k1OFRHTWU0d2dSdG9kRHpTT1l6ajhMSWcv?=
 =?utf-8?B?azl1Qm55QnZlRVUxbEprMGkwZkU1UjZhc3dPVUd3WXV1V0tpSEcyQWo2VkJM?=
 =?utf-8?B?aVg4cWx3cTFNcm9FMlRCdnFOSmVmRXZtQVpZRDFCVEpub2t5SVJUdUZzZ3Bx?=
 =?utf-8?B?cFUyVEIydWZGY3ljb1FjTHB3dEFLMCs0OGpUeVdpTnp4QUFRZDN4TFZEb05V?=
 =?utf-8?B?a0Y2SVJzakRTZ2k4VFJpQ1I4Q08vZHlnV1Z1eUZ1STM3VjBNV2VFTE1McEFE?=
 =?utf-8?B?em55TlliNC90c2lqNFllMnhqVm1ISDNjL0ozN0Z3YzQyc0NGcWNCWUJKdGJq?=
 =?utf-8?B?VGI2bDlXck5ObTZ5SlRFSzNvb1E3N3BodHNmZDRZL2dhMmMwenBpSDBabEhU?=
 =?utf-8?B?WStoNDgvVE1iUzAxNVE4a3dqUkx5dldPV0YreVl2T0RYQUlSRkc4UWUydG1k?=
 =?utf-8?B?SG41WVcraXV0V05kVCtlZTJRcERMYXhFeXQ2QjRiNldTa0FTVVBKUEtwL25u?=
 =?utf-8?B?ZEJ4eG1TRU1WYllFWGJKMSs1Z1V1REtOY0FXTUExTHl0NEZlVlhQVFE1Sm50?=
 =?utf-8?B?VFVhSGY2cGxRRUE5Ymo4dHNvMGZHUUQ3c1dXUnBnWGVxdkhJRmhHRXFTWitB?=
 =?utf-8?B?N25IbTZ5djRCVnJsZWFPT2lCVW13RVdpYkFyc0tLSTZIcHFLM2ZlK2dFWUZH?=
 =?utf-8?B?U3RMb2o1VUx0STFGSTQrYlJUS0oyOStrNU9FMC9lOGhKRlU1YXltQWF5ZHpx?=
 =?utf-8?B?aFZuMDZzOS90SEpZM2JhbTN3ZVloSTZXRTQyRktqY1Joci9ld2h1MDVVT0tt?=
 =?utf-8?B?WVJYZkl6d3U2QnZFd0hJZzJIbTFQR1A3eG54N1FiUDFPb01BNER1OCtnQ01n?=
 =?utf-8?B?SVhZVU5ibTVhWWNPdzR1bDNwWHJPZGdiSWVPVy9BWDFSNTVsbVVJYlpoWVVO?=
 =?utf-8?B?bmlWWkZ3aEIyZ1M2VUpyU3pjMEtBeDFncWRVV01YQnFHRldPNEcrd0NleEdr?=
 =?utf-8?B?Mm5sM0E0bWs5K3lUbTVaQUFZQmIvSWNFNVRJYUtkK3hSNXNrVXdpVi9MTE9n?=
 =?utf-8?B?bGlhZ3dzRE90VWRLMit3UExXdnpLQytyZWxjU2lXNFhwSVkzd3RMNExBR0p3?=
 =?utf-8?B?c0d6Z2JnNUtLQm1XRFQ2ZzRhNTNYYUtWNjIwSTBsdmtCelJtcGtqbVdxYVdp?=
 =?utf-8?B?c2NGdnV3M3JkMVBwZXhtbjVXVnFBL2N0MTd2WGZFN0o4SzlqMXMxK3YwQjlh?=
 =?utf-8?B?OHc0bUdEZWZLeFRkdHhOWW8wWWpQRXZFY0VMWksyU2RTRG5BNzg1UWQzQW9v?=
 =?utf-8?B?WmJhbStaY1RHendtN1FFTXFURzhYRCsvNjNyOERMREJCTnpKVitCM1BtZnRp?=
 =?utf-8?B?Ukl2SGJBbS83cERDTjBwL2FLeTNzOThtSW5rTWd4dXpESDlWSUFuZGRBa3Yr?=
 =?utf-8?B?R1ZiNEF5U1dDMGZSNHE3QXFsRjlRQkhiRW8wRGFsZGVnR1Z5OVVTMWtwL2Rr?=
 =?utf-8?B?MVRyTzZKbTJ5QnZBcFNQUFEzajloM1ZKdWVIdVEvSDdzRWdYMXlDdW9oNm1o?=
 =?utf-8?B?ME02eHRUZVh2VDdES2RicVlDVm1NNFVHaTN1STZ1Wi9KOFAxYyt5ZjlJNXoy?=
 =?utf-8?B?aUpBc0FqdVNzTDYvOStIRHJRMXJ3eFVDWEh2dGlYaGphNkhmQnhlS2NTNTZE?=
 =?utf-8?B?MGsxV0grN1VHWmt5UVBYc2dpaTFwTWpaQVRRYU5nQzlDY0tXbEY5NlByU2Jz?=
 =?utf-8?B?OEdGcmtyR0U1Q0pDSUhSUHNkSlZWZU9yUmNHR3NqUEs3NXY2QWQwMzB4ekcv?=
 =?utf-8?Q?82QqlzgNnf31ZakTCpbwTmBAa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2536457-9a29-4cb8-6607-08de3d84636a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 15:53:14.9147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q14SjVZkfxyRfvUnYVAqD04LIGU6e6+DOex40LIEStoZVopHUZCGD07ZfR1pkoM/it3quq8ud7dcEHkVlWziKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8082

On 12/17/25 6:55 AM, Mika Westerberg wrote:
> Hi,
> 
> On Wed, Dec 17, 2025 at 11:06:52AM +0800, AceLan Kao wrote:
>>>> By default it does not access retimers beyond the Type-C connector. I
>>>> wonder if you have CONFIG_USB4_DEBUGFS_MARGINING set in your kernel
>>>> .config? And if yes can you disable that and try again.
>> Sorry, it looks like I got some troubles with my MTA, some emails are
>> not sent out correctly.
>>
>> I've rebuilt the kernel without CONFIG_USB4_DEBUGFS_MARGINING, and
>> here is the log
>> There is a tbt storage daisy-chained after the tbt monitor, it's
>> easier to reproduce this issue.
>> https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.2.out
>>
>> And this one is only the tbt monitor plugged.
>> https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.3.out
> 
> Okay from the first trace at least scanning of the retimer at index 2
> (which does not exist) does not complete too fast and I suspect there is
> some timeout on the device side that triggers. We had already similar with
> Pluggable devices but perhaps this is implemented in the Dell version too?
> 
> I wonder it is enough if we set configuration valid and then scan the
> downstream retimers? Can you try the attached patch? We do need to scan
> them before DP tunnels are created to support ALPM (this is work in
> progress).

If it needs to go even later - there is OFC the possibility of doing 
upstream ones first and USB3 tunnels first too.

I'd say if the below doesn't work Acelan you can try pushing it right 
before tp_add_dp_resources() to see.

> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index d7f32a63fc1e..e23e0ee9c95f 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -1380,14 +1380,6 @@ static void tb_scan_port(struct tb_port *port)
>   	upstream_port = tb_upstream_port(sw);
>   	tb_configure_link(port, upstream_port, sw);
>   
> -	/*
> -	 * Scan for downstream retimers. We only scan them after the
> -	 * router has been enumerated to avoid issues with certain
> -	 * Pluggable devices that expect the host to enumerate them
> -	 * within certain timeout.
> -	 */
> -	tb_retimer_scan(port, true);
> -
>   	/*
>   	 * CL0s and CL1 are enabled and supported together.
>   	 * Silently ignore CLx enabling in case CLx is not supported.
> @@ -1406,6 +1398,13 @@ static void tb_scan_port(struct tb_port *port)
>   	 */
>   	tb_switch_configuration_valid(sw);
>   
> +	/*
> +	 * Scan for downstream retimers. We only scan them after the
> +	 * router has been enumerated to avoid issues with certain
> +	 * Pluggable devices that expect the host to enumerate them
> +	 * within certain timeout.
> +	 */
> +	tb_retimer_scan(port, true);

Just a note in case this turns into a proper patch/solution.  Make sure 
you update the comment to cover this monitor too.

>   	/* Scan upstream retimers */
>   	tb_retimer_scan(upstream_port, true);
>   

