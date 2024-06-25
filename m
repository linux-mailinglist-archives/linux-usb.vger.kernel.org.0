Return-Path: <linux-usb+bounces-11649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD771916B40
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 16:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0CD91C223AF
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 14:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D717116EC01;
	Tue, 25 Jun 2024 14:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="juzC4iSv"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B27616C840
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327314; cv=fail; b=c51Ljo91rxGl1PHPZJDAZKIf4JHRaZWDXsko0K0SKJj4l36B4Cy5ZXH+G5BLXhgiTIKuRxRnbhE0n4Pjv4V5+rB8cTKxlm1LSJ24BOfcTaKyoNhEr+GyUGOWzPawi9GnLaUK7Q4Gqk5jDaa5URQGg+Zcr4GSpJ6y8E+x/YO7oL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327314; c=relaxed/simple;
	bh=jJomzdZLII3cYGPJSjYKnDaR132KCr3ujcJq6H4movA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SuKCn7HpNNLlspZnNxs6OK2+jGYNs7qp1sqQFhNrvtLM7iV8F5a4YTZKJnn3466z0fESAyEt6nIY97w0x5pRH/hpu76lAiqSuPrtFmstGMYdTNS1QiZa1h3Dri9zu9RlYRKVfhbfPhvgqD8YnhWCcBQ6GqEpKsCVGZhXv7vKqoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=juzC4iSv; arc=fail smtp.client-ip=40.107.243.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJc3px6MJ3gwsFycFbEnm8kLSQHupA+dPqB0/hgwuS/fiHq+cmXMmkURmo8LE/b+uFXlpLBrtR6nvOTrsZy6ecxBwDpyRfJVj7vsSna5Jvz+geXHMVTn5z8At4Swx0x3OL6KBm/CyVuM2WQ2XVJEcHmbuHAT5MOUECIznVLEvX4vX04AG/MsmnlzyflzzA4UzG3PfH0a9Dl4tm/Dz7Q5dfRNng+0vurp7tGtLe+xv7fo081DZBKyHTh/ZT6XxUsZc8VZwq7fq93eoPRbLu+Sf5djXZcfpxJ4uoCNnC1k8hRX2l1+jZUSC/nUP+0z8wTvQkrdU1mUBW16faOKviRI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLgQABReIyaZawpdMJDuyfcRZzD6rqJifHczXD5oJOw=;
 b=WXR7flDSi4+W1I0naN+SaDnu6SVS0lAiBprxVui3AtWkWaKYdGXLuEsCbuyPx8xV8O2eGPkmlAlS7xkP/DbUM0t+QIbkTiQg+c2veY4AAq+8GJSO9ozqvZQzKO17knyCmAiEES/Sr+wJu+9k48xev0au5bWPOIgSjUaG+o6m1WGIZ5L/KBnCIlhRYPRItOHnsJiGl6SFXjI+rSd8HIjyBJ7KajQDlxpCFIG7gEJLE8KHc3HAwWiUgb/ihnib6Ia5wAkXYQO+d9JMkbT0NejtmrLyMU05fkxfSArG2M9Px3+qE0iPAOfwv4IZas3JOOIvF8p6jN24jFvyuEy2BEBy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLgQABReIyaZawpdMJDuyfcRZzD6rqJifHczXD5oJOw=;
 b=juzC4iSvdhe1G7E+tO/NsQId2rFD7l4cEmp849tGIa9jOaDtEwWBQNhnbJ8Sy3SNS7QHWhYy9mjeMIxFMvBbNp5iPDmRuYg9bkoI/SZvjP308zM19nNRbMNs8brQqqUgAFdy+3O1pRFJYUh2dRQK4cdQ7/tmPkeihjKSZpwfMP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB7264.namprd12.prod.outlook.com (2603:10b6:303:22e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Tue, 25 Jun
 2024 14:55:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 14:55:09 +0000
Message-ID: <6d9af5d1-9c3a-4619-9cba-2765e40a8946@amd.com>
Date: Tue, 25 Jun 2024 09:55:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add device links between tunneled USB3 devices and
 USB4 Host
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
 <20240620064115.GH1532424@black.fi.intel.com>
 <9ec62b68-7eef-4d33-bc47-1d13e8eec820@amd.com>
 <20240621061905.GI1532424@black.fi.intel.com>
 <844e3930-7b3d-46a1-ad90-bcecbb99c069@amd.com>
 <20240624045912.GJ1532424@black.fi.intel.com>
 <fea9e9f6-c3b0-6e22-d813-04da3d54a059@linux.intel.com>
 <20240625144546.GW1532424@black.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240625144546.GW1532424@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0025.namprd05.prod.outlook.com
 (2603:10b6:803:40::38) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 635c97c9-3bd3-471f-ad53-08dc9526ceff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUszaWxKdk1JcE9nVEllcEFBZzhhSkFZN2t5eHBjQ29LazVkWHNqbTlZTGla?=
 =?utf-8?B?QnVFRi9nNElvaDE2SmJuZ05UN243WHh5bW5kQ3g1TytxRzB4RzdSdFZFVkpo?=
 =?utf-8?B?YUZjQmRDNWVzcmZOWjBQU3lGclZvMUZheDFJdkhTcUVCRnNFWGh0K2ZHZFBM?=
 =?utf-8?B?aHFLeHZKZ1dHVWcxUHRhb3ByZWMrN2xRaUIzRGgyKzNCOWhwekh1emhrQW5m?=
 =?utf-8?B?U2JjWmlWZEVieFQwamF1aktuNzVDYzQxN2MwTVJEQTducmdzQ1Ywb2hXS2Vt?=
 =?utf-8?B?WlU5YmpoYkVEL0lRK3ltdC9kZGJKQkllWnFrRHlMK29PK1FiVGVaU3lLWHRl?=
 =?utf-8?B?L0RLTGZFWmF4L2FoT3grWTRkR0RweDVGbFpnRkpLNzF5MVVXQW9qTFR0VGpY?=
 =?utf-8?B?TUh3dXVCQlZ6ZVpyUUJNZDFKcUY4dHlkRnVMZ2dISDJXMmFTenFRZVdhVjJP?=
 =?utf-8?B?M2JpSEUvVTJmcnd1a284NkJhaUFJcENMMXBVczFVMUdySlNacEFDUlIyVVly?=
 =?utf-8?B?Z0h0VktmWGptUmFjMkNSZ29ZM0ZUVmI2b29zc0J4U3ppMXl6THBFbitEajU4?=
 =?utf-8?B?OVdvclNkZHNxTjNDakxDY0pUeWhvdzVMZTZnMkdDa3kxendadXFUYVcyZk1r?=
 =?utf-8?B?WVN4RDZSQkFBdi9FSTJlN1dFRVZKSmQ0eDNFUEdBUUZaYzNCL1psaWpvYUxz?=
 =?utf-8?B?UjJSUXZXYWRicXdSVHMwRjFzT2hrNGRxUGh3VGRvblE5a1lZME45NS9KRzNj?=
 =?utf-8?B?eHBlUkhybTc1L1JLWXcrVlFweDYyQUZuazluNGxxZHl0R2tFMHJOTWZYTkx4?=
 =?utf-8?B?NzRYTy9wcWt0RVBxV08wazZSMXBod3l3TTR6RHlHa2lEWW9HNlpQaFdONUpa?=
 =?utf-8?B?bnpZdm53RXNOZlJDcjRnV2RTSDM4QzJLK2FldDVIanBLNmt4dlM3RkF2dlM5?=
 =?utf-8?B?SHdGd1JFdDdLNGdaODJGV3VFSkN4MmE5dWV0WDZ2THRtMlJubFNCb2pzM1ZT?=
 =?utf-8?B?L3JKMTNnRzZIZHQzYzRqNnp0N3EvWXE1b2RQaXJxWkcvQTc3bnlmNFdJbjFD?=
 =?utf-8?B?emoyU3lpYTQ2TnFNQk11MEZkV1QrVDJpSnZOTlhPUEt2bmNGaGV6UjJ2UEFk?=
 =?utf-8?B?K0Q4bXJsbUg1aU9IMzJWN1QzaitiR04zTXh4ZzdVbFZCUWxoNFl3MTlMNExD?=
 =?utf-8?B?NFlYKzB6Wm03cWxFOE1tTmhKSWtmblpsTXhNOVFUS3ppVmFOMVNTWmZaaSsx?=
 =?utf-8?B?WmI4bGxXVnB2dXJ3RVZtMW1CeEpOcGplQ2tzSHVzc1NMRHVseTVML1AwRGdL?=
 =?utf-8?B?UmJkQjF0dFBWN29FTE9kSER4L3NTUmpiMm13NHlrMUZJbkpORzkySGhGQUNm?=
 =?utf-8?B?aFlUQ0p3RTJoY1RwZFkvcVN4NVdMU1lMME41MDBkWmdvL083em03TE1MemJq?=
 =?utf-8?B?dUVIeGl2TkN1b1gzRWVMdi9LMTU5ZkhqRGZ0TklNeUZSRk9mUDRRdFM4d2Ro?=
 =?utf-8?B?OHZOZ1RwNk5BWjZrMkNmWkFDUStCemtLc1R3LzhiOUh2bTVBVU51UmlEZFZE?=
 =?utf-8?B?c2JzVDhubXZxVEJRZUVESHBkQ3BWMEZwejlFQXA5dkhoclZPMWpnb0FPYzYy?=
 =?utf-8?B?RkxqdlREZHBqYUVCRDU3d3NHUVFBTTZROHBJbk5OYktRWFVRbWtoQittQUlq?=
 =?utf-8?B?cFRqTUpDTVcyRmVHRlRYYVQ1SHlCZmhQTnlXOE5wRUExeDNxTEUyaVFnNlU1?=
 =?utf-8?Q?47NySNUSfVFYFDfgepZE6+nXjmJFcHatpPGMg/J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDhxOENhMUJhc3A2bTJDeTRxQ0Z3Qm15MDNGQ0V3Z2xwc3dQanp2UzUyZzRw?=
 =?utf-8?B?UnBmNnZGOTVTL0I0OFhRK2VnUTN2ZjJVTW5FazB0cXNFY0xOVW81Vmhud25Q?=
 =?utf-8?B?cE9oZmdTSjd5U2dYOEdkdnRrMjhUMmp6UEZZQWc1UnNJcWlZRWd5Um5QQkZW?=
 =?utf-8?B?blRuRzV5eE9IU1JsZHJaS3pCSXhUOHZtNzhHd2I5VEpNWnQyS25ZNENYbTI4?=
 =?utf-8?B?WGlqaFJ6a3M4SWdHR3dseUhaaDZqMVg0VTRVak02RUxpNUQvNUpZalhBK3ZZ?=
 =?utf-8?B?dmNJVlBXQkt4WFFPR1ZOYXJXNjhKVHhnQ20rTFhjckFYRU1KcmljajYxWVFi?=
 =?utf-8?B?MjZ2bzRvTDYzbVJ5TWtqRDBJcVBVaXA3K0pWOXZQZWhBUmlSMEZRQStvV0NZ?=
 =?utf-8?B?QXIyZzdtMWhTeC9jdzJIeDRYVW9VQ2xpaXd5VElsM1JoMVdvZlZ4QkltK3JI?=
 =?utf-8?B?Um9ZOXB0S3JBcVQ5Qm9jdWdrcm1nYmdSenQwSHJCL3UyK1A4K1NubENJNkpC?=
 =?utf-8?B?K3MxeVJLZVcxa1VPNFY2NDVGYXkrTnUyYjJkNTF0NFNrRTExYjhUNmp1RG9I?=
 =?utf-8?B?cDl4T25YdDRpa3dKM2EwOVhhQUwyZ05FOWdUYk1FWFhBT0pzMHQrUldKUExa?=
 =?utf-8?B?WVQwaFFHV2pEQnV1N2c3WlI4cS9oamlrTGhwWFh0SXhyTGl6VFRMZURuOE9t?=
 =?utf-8?B?TnA2V3A5RVFtV0dvSkg5T3JxVVh0QWRickRHTE9PejlrdHhWUlhoakNLOUx4?=
 =?utf-8?B?QjdjdnZaSWk0VGJIMEhkUVpxOVgwOUZvZEJ5V3BpMm9FWmFpR0Vtc1RpdklN?=
 =?utf-8?B?Q29lMzBsRWZFOEUweVpNT1Npc281aDk3TkpQUC9iWXpoUGtYYTlRbHZwd0xR?=
 =?utf-8?B?ZndjYkl1dXkwVlBORVZtL2VVTTRRWmlKR0JCcEZuajIvRkRrY05nU3MzOTJy?=
 =?utf-8?B?QmJIWVpFODZLUVNDYmI1R2FoMVViTE5aTkRCbE5pS3VIQjdsSFFDVHNkVWJx?=
 =?utf-8?B?ZTMzVk9LQlpnMi9vdHdNNnR1Mkx2aXFrS1NsV2pSV2QzQXJqRG5PR3dXT2h6?=
 =?utf-8?B?NFBTcTU2UmpYNlVzYXRlbk5za3FCUTBqNVYybDNITGZRSWdqTDl5Zm9JRnUx?=
 =?utf-8?B?aVB0b3NCZzdKSWdnQVh5QzlvVEhnOG5jY0JjbHZ0SFVac0RWL3VTUWFhNURH?=
 =?utf-8?B?cG5TekJVMnhWR3FyUWttMVByYjBaK3FOeG5Nb1ZPV1pEaTFQdmxiZC9ySGxC?=
 =?utf-8?B?YWRzSDQ0VXkxbm9vR0xjd1llcEpPM0FYNm9LNTJ5MFMwSDhQWE1IWEtWSnRN?=
 =?utf-8?B?UzI3T25sYmFjMGFWWkhtUm05R21kbThWdmcvQm94MHNQbkhRS3FTQXpMenh4?=
 =?utf-8?B?T1JEMmpnRURLTnpEVXhtSnZCRjl6SnV5QVVJdmkzdTFLVjdqcHQ2OVpub3NI?=
 =?utf-8?B?ZkhCeXRsc0NyR2Y3c2hLK21QMWp3UWhJb1JHcFRSZGlzdmo5YStRK29PaEda?=
 =?utf-8?B?UVRuQWhlajZoVUpkUUdvcVc4dVhhYUlpYW5TWTJNSkgwVnJCa2VpbmNMN25K?=
 =?utf-8?B?eTFydkY5SWhCS1N1dUx4cE9ueFgyRGprY0F1MDZldFhEQWdZU3BvTXZZbzRX?=
 =?utf-8?B?ZzAzamJpVkM0WU5UOWFKTEl4a0h3eUgvUlh5dStURy9wMkQzQU9rNlVweUw5?=
 =?utf-8?B?ai9nTmZvb003U0c1K1pITEFFMTdBeGxXR2RjeXlmamRlakNVVUptZWdFWklS?=
 =?utf-8?B?M3RSZmJ2RXp6TTByRGpnOStNMkZpbTlKRU5DdFFqbUtYMWljdkdxTHpUMVdm?=
 =?utf-8?B?a1U2WHFnNS9RdExsUnpPVjJVdmxHMU1sRUd3RzcvTjFXNEJYZmFZbVUrM2Jq?=
 =?utf-8?B?NHJydDBDNnl5UFhJNkRLNG9lNnphcm9ETTRIR0hPSmdMdmhmRnZOaFUzWEdF?=
 =?utf-8?B?cGt5K0R3bitHL05SU1YwdkVTcTNTa1RBdFpuSVNhclZ2YWZNMTFDbjFxRWw4?=
 =?utf-8?B?S1NKWVNHbmt1UWg0OEVkVWFCZXBpQjBrQmY5QmR4Uk55a2Nud3ArSzRTY0pL?=
 =?utf-8?B?TmJnTzFSSUpSSjg3aXNDY3E5d2NiVloyL0hmUlhPNUVGNFpTQTJZcDFOdDkw?=
 =?utf-8?Q?/FLLQOpBVvS+tNZlzLtT5O0F+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635c97c9-3bd3-471f-ad53-08dc9526ceff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 14:55:09.5376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmZhuBhIPiuYUHBE9PHVGs8tToCBY8PeeXprJ69JUPKJvDF/w80QijheJV4rUwI/u9peq0sXPI822qj5QvXwwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7264

On 6/25/2024 09:45, Mika Westerberg wrote:
> On Tue, Jun 25, 2024 at 05:37:27PM +0300, Mathias Nyman wrote:
>> On 24.6.2024 7.59, Mika Westerberg wrote:
>>> On Fri, Jun 21, 2024 at 11:30:05AM -0500, Mario Limonciello wrote:
>>>> On 6/21/2024 01:19, Mika Westerberg wrote:
>>>>> Hi Mario,
>>>>>
>>>>> On Thu, Jun 20, 2024 at 01:36:56PM -0500, Mario Limonciello wrote:
>>>>>> On 6/20/2024 01:41, Mika Westerberg wrote:
>>>>>>> +CC Mario from AMD side to check that we are good and don't break
>>>>>>> anything accidentally.
>>>>>>>
>>>>>>> On Wed, Jun 19, 2024 at 04:03:01PM +0300, Mathias Nyman wrote:
>>>>>>>> The relationship between a USB4 Host Interface providing USB3 tunnels,
>>>>>>>> and tunneled USB3 devices is not represented in device hierarchy.
>>>>>>>>
>>>>>>>> This caused issues with power managment as devices may suspend and
>>>>>>>> resume in incorrect order.
>>>>>>>> A device link between the USB4 Host Interface and the USB3 xHCI was
>>>>>>>> originally added to solve this, preventing the USB4 Host Interface from
>>>>>>>> suspending if the USB3 xHCI Host was still active.
>>>>>>>> This unfortunately also prevents USB4 Host Interface from suspending even
>>>>>>>> if the USB3 xHCI Host is only serving native non-tunneled USB devices.
>>>>>>>>
>>>>>>>> Improve the current powermanagement situation by creating device links
>>>>>>>> directly from tunneled USB3 devices to the USB4 Host Interface they depend
>>>>>>>> on instead of a device link between the hosts.
>>>>>>>> This way USB4 host may suspend when the last tunneled device is
>>>>>>>> disconnected.
>>>>>>>>
>>>>>>>> Intel xHCI hosts are capable of reporting if connected USB3 devices are
>>>>>>>> tunneled via vendor specific capabilities.
>>>>>>>> Use this until a standard way is available.
>>>>>>>>
>>>>>>>> Mathias Nyman (4):
>>>>>>>>       xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
>>>>>>>>       usb: Add tunneled parameter to usb device structure
>>>>>>>>       usb: acpi: add device link between tunneled USB3 device and USB4 Host
>>>>>>>>         Interface
>>>>>>>>       thunderbolt: Don't create device link from USB4 Host Interface to USB3
>>>>>>>>         xHC host
>>>>>>>>
>>>>>>>>      drivers/thunderbolt/acpi.c       | 40 ++++++------------------
>>>>>>>>      drivers/usb/core/usb-acpi.c      | 52 ++++++++++++++++++++++++++++++++
>>>>>>>>      drivers/usb/host/xhci-ext-caps.h |  5 +++
>>>>>>>>      drivers/usb/host/xhci-hub.c      | 29 ++++++++++++++++++
>>>>>>>>      drivers/usb/host/xhci.c          | 12 ++++++++
>>>>>>>>      drivers/usb/host/xhci.h          |  1 +
>>>>>>>>      include/linux/usb.h              |  2 ++
>>>>>>>>      7 files changed, 111 insertions(+), 30 deletions(-)
>>>>>>>>
>>>>>>>> -- 
>>>>>>>> 2.25.1
>>>>>>
>>>>>> Hi Mika,
>>>>>>
>>>>>> Thanks for looping me in.  Unfortunately with this is appears the XHCI
>>>>>> controller link never gets created.  I've not checked functional impact from
>>>>>> this, but I'd guess there "should" be some functional problems too.
>>>>>
>>>>> Thanks for checking!
>>>>>
>>>>> I think the code that sets up the device link based on ->tunneled should
>>>>> do that always if the hardware cannot tell if this is native or tunneled
>>>>> link to keep the existing functionality and only do the "optimization"
>>>>> if the hardware is capable of identifying that.
>>>>>
>>>>> Perhaps it can be a callback provided by the xHCI controller driver
>>>>> (->is_tunneled()) that then defaults to true if the
>>>>> "usb4-host-interface" property is there and in case of Intel hardware
>>>>> also checks the proprietary register?
>>
>> How about changing the boolean udev->tunneled into a 3 value enum with
>> "link_unknown", "link_native", and "link_tunneled" options.
>>
>> "link_unknown" would be default, xhci driver only changes this to "link_tunneled" or
>> "link_native" if the host can detect tunnels.
>>
>> device link to USB4 host would be created for USB3 devices that have
>> "usb4-host-interface" property and udev->tunneled != native.
> 
> Sounds good to me :)

I think it's a good idea as well.  Could you leave a dynamic debugging 
statement with the result?

I think this could be helpful for rooting out unexpected BIOS problems 
with this.


