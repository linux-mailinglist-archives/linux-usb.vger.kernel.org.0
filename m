Return-Path: <linux-usb+bounces-11604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 928A7915693
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 20:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B615C1F21560
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 18:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1604C1A00C4;
	Mon, 24 Jun 2024 18:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aNyHW63H"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3284E1E4AE
	for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 18:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719254475; cv=fail; b=hAnK1KOGntnDR3V3p03krOUEKj0sy0Nwui1CBgQ9Uugfk+tu2To0BbOpjJaOGr3ikbbTY/ip/lybyoVM/6kH2Hv8jLtfhdH6B3qd7nIjvfM7SbWihit5FQrle6rB0FtkFFDcw9Q2MK3MZTYWRrzqR6Ym6MYur/yjlISi7ooQxK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719254475; c=relaxed/simple;
	bh=9WwNgxsWGcua16l424IKaqYU0aO0W9Q2DqpIJsNl0zY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tZ0zdbvgaaykX0L2tCTDo0OV/pVvVIQC/d3BLLS4pMKDnryAJXkkBmeSnZr2gDDuM22WzTyvarwWYfNfm7hsxQOn27aY1OG7Jk5l5MqvopKx9bP1zc/Y6WUJIF/A78j/TZhtA6M8NImwrXklg9MGFnnqgvpQmz+LU+Rw+byCjG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aNyHW63H; arc=fail smtp.client-ip=40.107.236.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSHGj3k4HfG6aO7P3nJER0N3eg7pJEIIXqN/ffOz+xc+J/IyfWppixFHWVDpVIpVzqm4hOxG8f94mTqw34Tbf2ByYFUiBa573fZGZunPyaXR/bLw/gBjqo78SZVSGAV1ZHVKigRoYDaM6BkwkWYcle4baHFw6NFwbWnhbwgg9JrqLJC2AOOTMzb0WeTJIRo3pS2k14ahPjOc19O5aM38vi/0kqAulMeOb0LpCEFayevkKoEhCNGGxzbrD+FdECJY4fOagm32ktkAVwogZ9d3jJ2K3zXhdBK7RaNC/PYf0xzIUiquB0OXeZsu7K6v0grM8OtdRAP987B/xydKVK4WzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsCX1QzaIiNA3WucAQzNDDAecWee2bQ/VRYLZ4NSeQ8=;
 b=mvmYt+wYvrqXIHURKNEk5hkSjb+50Ek7T+BXyMVoBZm3+mt1utgmkWtlvUT6kqO4/MwvJFfiXp096azwQyMaVWHsY/DpB98NhT6abelpONKZsQ/pHtiLseZZSz2mWKxTlQVNpGaCvM7eapflu+Ay81RfEhYYSwGSYCzaOga61BBQ9Cn3i04T/y1+ktiHUUi0LHG8F/9yQ05PazWlsbMF7DAOggXh9Ll7O6gF6jcNi4NAkyBoHGypB4dqTWUq1bP8vP6xcsBtjM1VJpz4pi42oWJRhUdyjJSSB7nXcTc1ZS2iupbT7yelD90Sj6/NCDSpReq0XCsADah/KIFauqZWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsCX1QzaIiNA3WucAQzNDDAecWee2bQ/VRYLZ4NSeQ8=;
 b=aNyHW63Hn6kc9MZqQAFjq5p0XMESUKv8TnwtwCWMnchmEZrX0/su/YKBvve9szlBcl61XveAO0jnvumWPifL8pt71jVTPILDYwg3AHaEzmdcL93/1dNXdIvC4KXJlghq7X5TvCRZlJmdRjoagpeYGv56RNG36jZDvp9mSyu/5x8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Mon, 24 Jun
 2024 18:41:11 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%5]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 18:41:11 +0000
Message-ID: <78a4acf4-4701-4d1c-8547-c8809761a452@amd.com>
Date: Mon, 24 Jun 2024 13:41:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add device links between tunneled USB3 devices and
 USB4 Host
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org
References: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
 <20240620064115.GH1532424@black.fi.intel.com>
 <9ec62b68-7eef-4d33-bc47-1d13e8eec820@amd.com>
 <20240621061905.GI1532424@black.fi.intel.com>
 <844e3930-7b3d-46a1-ad90-bcecbb99c069@amd.com>
 <20240624045912.GJ1532424@black.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240624045912.GJ1532424@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0004.namprd21.prod.outlook.com
 (2603:10b6:805:106::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 7832304e-c2cb-489e-246a-08dc947d3805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXlWUDVMY0dra0d2MzNtYytUdkQrQitOeEpRVEJpbVFsKzZXUFM2ZXN0dCtV?=
 =?utf-8?B?VERMZzBrYlJUOHpNazNIQVpxV2RaaFBvMmo2TitubjVGWnJuRkV6cW5CZ0Fh?=
 =?utf-8?B?R0xJYWMwdDhXejZKd0FmbWl4b0k1TmRKN0ZZZHc4aWN1SDFFTkM0anRjMzgy?=
 =?utf-8?B?ZWNWQlFhOTVvRGk0L3JzOGhIcnU5RjZpRzV0Q2hvTWdIZ003U050eFlhN2Z3?=
 =?utf-8?B?QU1UR1Z2dWM4d1BCQjQ2M1RveXRXT0RUNWcvN2RVM3hCTUhtMzh1aThtOWZO?=
 =?utf-8?B?VS9WcFZKdU51T0JPYytRQ2ZQVFdLT3djSXlTMnN0NW4wMFdOZzNObU0yU21E?=
 =?utf-8?B?UWt5OW1KUGhDUGhhZU12TjNaZHlvVEZBcVhBaVdKMUYvSTA2NzlpS3M3T0NI?=
 =?utf-8?B?TjgrcTBNamVZRCtKMUJLMWFXZmlWTk04ejJYVXEvb2Nod21tSG56V0RvYTFM?=
 =?utf-8?B?cG11TGdlNUFWakZlM01meDJFZHdZMjNGVnV4clUzdEpVa3RUT3czbVFKMm9r?=
 =?utf-8?B?MTFUcnVrQXBBYjkySTVTTEhsUDl1MGsyMzQva0lhQ0gwMkR2bXdmNENXaU9W?=
 =?utf-8?B?L1dxUlVDb01GR3ExTFI4aHRLSTJjaWlRdW9vc0wzQ3F2OW1NeXphOXFSZGF2?=
 =?utf-8?B?WTZ1ZzBvOU9ZaE0xaXl2TXZ3WlRwckFEaDh0dmpTSzR6SmMrMXhhOWNIOGdE?=
 =?utf-8?B?ZWExWFVqSEV0NkRFeGp2a3lYYk9MRnlaZE0rQmFjWWxsK3RhSEJ4NTJYaG9U?=
 =?utf-8?B?eldNdVl0WlFXUXV1cmJNL3Z5NlZtVDhWUTVPZWpVY2ppT2RjbGRwVXdrNkgr?=
 =?utf-8?B?M1hMTEpqS2pXRHZlREdlQTljYVFYRHpLYWZyR1I0Q2luVmd0cjdQeDkxNVFi?=
 =?utf-8?B?U2k4bmxnUzRzU0ZDNXpzY3pXcXB2c2RZcEVtK0V0ZkFSTHlKdng1VVN4VkhX?=
 =?utf-8?B?c2x5ZEFaay9Tc09iSnZBVDhIKzFRSm53QUF5bUJ3Y3JwUERGY08yejNlZmx4?=
 =?utf-8?B?VVZNcEJoQWRUcFZUdWJrR1BnZEZEbE1tanBldldKU0JzUUVQSC92cWF2OXVu?=
 =?utf-8?B?ZVozTlRaTElrRUtKei9GUVRlYlk2NDJYT2FOZ3d0WEtyTXRFSlBndXB0alRk?=
 =?utf-8?B?VlU5NEVYVEhybUdOZ3JyQlNTanlJUG1GcmNEdmN6MXR2MDlCOUtBUDhiSDZx?=
 =?utf-8?B?Slc1amVyQkYvYlQ4VlZPdDVrUlZVRHEyWnIyTmxuTkljM0NFNG9sRmJLai9m?=
 =?utf-8?B?YTNGTkJ3ODlHYmlaeHY1cFJ0VUUwZkxOWkhKN2xoUDNIZXpnRVZNRUtyRDZy?=
 =?utf-8?B?bkxUU2hVWk5IUzNyY01FVVNLa09PNjZYV3dUaTk2bllqVDdXY2gxOHUzTTFh?=
 =?utf-8?B?end1WTJZZ0FNSWJMUE9VeXVKdGhTcjdadmNudE5KVVhMSUFEZ0lKejNBcGJw?=
 =?utf-8?B?bDVBemhBdHc0MEcyaEhJUkVQcUVNNm8wc2NyZUMxWFZyblc3cXpjenNjUmR1?=
 =?utf-8?B?R0xyOUplSDdCYVpBeitzM3JiMEo2VUhkNTg2UHp1T2lFM1FIV0kvSlVKbGk0?=
 =?utf-8?B?bjNGNTlCTTV0cDMzZVJIYkVzWUVDTXZ2aTdCNmdsUkpPTURMT1JjS0pkVmVk?=
 =?utf-8?B?S2dOUlJWUHVUaUk1N1hGV1ljcUtBeXNVeEYyUzNVQ0h2dVRiTE5OYXo3M2o1?=
 =?utf-8?B?U00wYVUwbE5ZZjk2V28zRVdOTStQcjBQOVhsSjFlZ0tySjcxUGdZaWpuZ3FD?=
 =?utf-8?Q?cR0NhmlCcslLSD7+rgp7R/bj+vCjKKlsL/S5nDb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzRtcXArN0dXeWtEdmZFOEJMZjdtMnNQdDdUU0ZNNFNCdzNQOWFacjRBVFMw?=
 =?utf-8?B?emI4SzZ0Zkl2Q3hGcEpEUTFPWFdrbFVRdHVSNjFKbC85NjVkVmpsWkp1UVF3?=
 =?utf-8?B?b21CNmFabTFzbVpkMnNYNGt3L3VZQnZ1d0VWZ01iWGMvaU83WENKMk1UeUh4?=
 =?utf-8?B?eVRUQ3IzTjR4L0l4d1o5MkhGcDUvcWM2SDFoWGN4Z2dsUnJ0bkhxdElLc1hw?=
 =?utf-8?B?WTZtam04Zm5acEl4cGhsNGhUcEZ0RUVGSVZZOHllallBWi9hWmNzK00wVjVw?=
 =?utf-8?B?TVFPYml1eVVxUm5oblRIRHk0czViUnlyYldOTkhRbnM0SkdUT0l5cFlpV2pn?=
 =?utf-8?B?ekNQU051UVB4QkNENUhOZU9UKzFtSDlNYUl4ZkUxZXdOOXpHV1cwOUNBVldK?=
 =?utf-8?B?dXdDYnlMQ1hJT3J1V2cvY2V5aFhMSjRUV1hmdHhtdVJ3bTZNV1ZNZHYxSTky?=
 =?utf-8?B?eE5GNThaSHFGYUp2MXJveExJWTVFTHdIQWttdVpPRm1KQzZXSmNaVytSNGgv?=
 =?utf-8?B?bFcvbmt4b0VncVQ1SVhteXBHOXZXalE3T3lON21QVXVHZCtzbnVkeWhSajAx?=
 =?utf-8?B?Z09acXdxTC9id0hTOWg1QUEzbU1MMFkzOGZreG1DSHF6UXNhdGJFRXZiOWQ5?=
 =?utf-8?B?REtmd1Yyenk5bUZxTVdwNzBPYTZ2bFNqWnk1cDkzUTN2czdzZk9BczFVVERs?=
 =?utf-8?B?cGpxQU5ISGREc2VIeHlCbjQzcHBrVkpySU9Ya3EwUFdYOTZyRWNtdEphTmJ4?=
 =?utf-8?B?cEl2SUtYUkpzSm1oZ1NqYnBHc2xWYUF2S0Z2N01EUEhldjhKQjc4TG8rcWxF?=
 =?utf-8?B?Z2JqbXNwSUl6R2x5SkFTTnR4VjdiZ205emh2TjdHZXRZK2FzNTc0Q093ZTlD?=
 =?utf-8?B?MXM4L2FoQ2NrWCtZanF3N25FQUNrVURMRGNhZmFnaW9wZTFCUFVGSXVvVDJ6?=
 =?utf-8?B?QTBGK2k0NG1MTFIyUlRwdUlrNFpDWjNWWGUwL3NYMDB5RTU5V3pleDZPYnRx?=
 =?utf-8?B?dXJoZEs0NitzNFk1T1NzN3NEY0pLdmNDQmxReEhnYWM3UjBVVE8yNys3aHZJ?=
 =?utf-8?B?SFllQkNmTWQxRHVmZXp2NnFQVlBCQkg2WHM0cmowdmdYbkJWRzZTMmNTZEZh?=
 =?utf-8?B?NVdOVmwzTktIQThhOFJOVjZLd2NsRHc3dzl3ZVhlWTMyZWxXUFVJYWdWTXFX?=
 =?utf-8?B?Mkpjd3NydFlBb2VQVXJ5VlJ3dmQwbGZlSzRJY3NKZzZjMm0zSTNpR0p5cEho?=
 =?utf-8?B?NCs5ZXcwL3pyWVBHbEtiajFWcC8vZ0MzMFdGZkt4R3l5N2YzOFI4bkF2R05I?=
 =?utf-8?B?MjRtVUdWd0s0b2dUOXVSQXVORUlFVnVIdDYwbklreFV0RU5ucmNUeUEzSUVB?=
 =?utf-8?B?RVZsV05wanc1OXFZUGlnaE5LUERPZFExUi9ZRnEzUjRiWnFHcXVMVjVqWU5T?=
 =?utf-8?B?eXNEZnVHNFZ0M3NXK2oyaUhobjdvNk1DTVNtb3hKMVlDS3FVYytpZUx6WXYy?=
 =?utf-8?B?b0F3NWpyUmdqSlA0cmJlK21YdUNkVW1ibzgzUjN3MWNua202a0xqaGp5UFMw?=
 =?utf-8?B?MXdxVGYxb3lpQVJYemJ6VlgwTlErOXRWa1JIUEpMUGJtOFU4RUJRM1FsbHhz?=
 =?utf-8?B?WG9KdTk4UU9iUkFMS1pjN1RnWm5hWXZYTVB4VGk5a0hUKzRQZnAxUGdvYWV0?=
 =?utf-8?B?dXFXWStRTWtoK1dBOVhqWExzdVJsVlV1U1prSC9mUGJUcEw2NGx1RHlWWGpj?=
 =?utf-8?B?UThlU0prWURJQmthOEwxK2dwc2xsOGJlbi9wcG80clFjM0NjeE84Z1hJK3Rp?=
 =?utf-8?B?QkcwdW40SWMvR3VJbTd5WEFYeitsOGlWS2FGWXluYk5xWUhHQlhQUkczUENW?=
 =?utf-8?B?cnJodCtiNHhTNUFLeGtON0VyWmhUWTIzdDZFUDB3VTRCVS9QSjVmMkp5V1Q0?=
 =?utf-8?B?anBBYStxaEVjMkZWMTNlYnJoaFNibnkvQk9qczdMc2VLaXZLV0kwTGFqQzdC?=
 =?utf-8?B?aDdCbExDa2t1VVhNV1NxMGN5eG5DeDZXQzc1V3J0T0pPMGtZRDBPdlVRQWtw?=
 =?utf-8?B?ZTFqM0J4SHQydi85alhWZFRCcURFanJlOTN4QWN3MjVESG5EYVkyN2RyMHR2?=
 =?utf-8?Q?qys356lvMpfYB91MXDhhWjh2U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7832304e-c2cb-489e-246a-08dc947d3805
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 18:41:11.3131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skWFycX+I/i6JR2OLjXge8+H8Ylbot55lLjId/3hkzeyFJswGFFENzndMxAWakLIi3dAs7FDd7Q4ZfR+7iovjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154

>>
>> So I think the problem is you will have an ordering dependency between the
>> two drivers for when the link gets created.
>>
>> Like if thunderbolt.ko loads you would end up with links to PCIe root port
>> for tunneling as well as XHCI controller.
> 
> With this patch we only create links to PCIe Root/Downstream ports from
> Thunderbolt side and the USB core will deal with the USB ones.
> 
>> Then xhci loads and you end up also adding links to individual ports.
>> Would you remove the link to the controller?
> 
> See above.
> 
>> And if the order is the other way around you end up with a larger state
>> machine.
>>
>> How about PCIe core provides a helper to know whether or not a PCIe device
>> will support the proprietary register?
> 
> I think the xHCI can be non-PCIe device too (Apple silicon for
> instance). The links here are created dynamically and only if there is
> need (and support from the hardware) so we can let the USB4 controller
> enter D3hot if there is no USB 3.x tunnel needed.

When I replied I was under the presumption that the next version the 
link creation code for XHCI controller would stay in thunderbolt.ko and 
the XHCI port would be in xhci.ko.  But if you move both non-Intel and 
Intel cases to xhci.ko this should be totally fine.  If you can CC me on 
the next version of the series I'll get that tested for AMD case.

Thanks!

