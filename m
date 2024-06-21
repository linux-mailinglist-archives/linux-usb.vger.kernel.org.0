Return-Path: <linux-usb+bounces-11542-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8044B912B58
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 18:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A30BC1C221D2
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 16:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17A615EFD7;
	Fri, 21 Jun 2024 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eNiKwddq"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B44657CBB
	for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 16:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718987416; cv=fail; b=hSe8gzlKuf9hOUB2kuYLNjEXBIrV4JhUrLiK6bKkSBJf8AH8TGzlxmfCR/SCDeJJ4hca3yKZKpBGWuXEIeICijjn8xWUuvkd0ME2Is2HRqayd4sUzOIWjChjU+NIdAL9i6LOGoX4OeXvs17spMJmde3YuHUwUEWKlX9yDXUyi00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718987416; c=relaxed/simple;
	bh=tC5FIIjnzZrRo/Xwfrws/NpGcZFDMpeQng0G2Oa1o/Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t8gCQvT1QctF8rIM36yvURFhJYDwxTdIxcyUUrkLZJWYErTNiIVV6hh4aNXiXMfpn9Hsz8ey4YvXjZrR0zOJRJnkIEFkr7IdivDYlXxx0FmiYTBv97O2sdZ2yPcXrM5eHj/JZ1taXSNYAk9c+8OWk3p2vQykvxvf3zTZjcvIMwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eNiKwddq; arc=fail smtp.client-ip=40.107.100.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDyqIHhYxEv6WOrMDiOYh5oH57wHoU2bzScIt+boV6/oBigZBGQT6Cl/pKSamizaxxUnOSYAnhygUbpqrQTgMZmPdX+OV7EHpaespB9FndDcbZT4Twh8LbXTExjrZht6SxLi3sxPO+51MFPZZR7tn7+hrD4lzVxavS0G3sVQ2oBlhxhKyqzXWH0qeozHmEmzb/bZ8De/lMRbJxubK5J+7/eWB/mbadwFxqHPZvOPuwoEBg27zhdkWDu9t3TxtWjU50b2IUeU7JRygILZpqONXd2zdQ5dPk8SXEilWka6/KFQXiw1BiyLMD4VVPiFkZNUPIdf3kB6WeOBZOqFI0nRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWY2Kn1iIJbsgrksVnEUWxEDcStea795C97UCScOhYU=;
 b=efM0QjAY584mzIlxN4Ph94Grdlcm7Hrfhl5EuwK4b4r+y7aZbjjhwvIHml/TBnGcQvjf2NIJ5A7ZjsIhZJPgjXf8TaGj/uVKnxX+8iTcHsn8kpp3Lc9B6fHwBCXtJHISQDQEGy5C3kyVSuaGmp00GS1VB7lPWlNhwLfyWTvg4zhvaBh1302E8yhd0PioRXsQWopKquJeynxZ+MJA34gGSPFnzs+unEjmKQtbP61ErbxJsDtldcZTwLMm+xh9Fru/sc2aEUJIf4TMejNtmyf+23UT3vWmkJ06qcJ0KrP8XIVnqh06MAVd4xHtyf15T91FlpkdpJ50NXtHXisQ4SpomA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWY2Kn1iIJbsgrksVnEUWxEDcStea795C97UCScOhYU=;
 b=eNiKwddqkaQyrWZT0Fse8KEHuBnB48GAUx9qqQn1OXzfUMOnaNH8PIinxaN4SrrVHXaWkCmfVIbsyCJ0RHfgzcxsJOBOI+3weRsrG7IMYOvcEq1YHi6fl20GJFogHILMVVpVsveSXMUv42VUJFXCve4mIdKs/wkXy/CDLcZNtuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB9237.namprd12.prod.outlook.com (2603:10b6:a03:554::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 16:30:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.7677.030; Fri, 21 Jun 2024
 16:30:07 +0000
Message-ID: <844e3930-7b3d-46a1-ad90-bcecbb99c069@amd.com>
Date: Fri, 21 Jun 2024 11:30:05 -0500
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
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240621061905.GI1532424@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0116.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbc6e09-e694-4f1c-8f60-08dc920f69c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUEyb0NFMjRBdUljUEJIZWszNEphaENmYVl4Q24zbjRHQ3M4b0FjNGczd0hH?=
 =?utf-8?B?L0wzNDR1Z2FzM1BDclRZaExlbWVOeWdwdTJNbnNNYURCYmttZDZKeGtSZWR2?=
 =?utf-8?B?R1hrWHRvQThnNXRqWTdWM3J1cDlJU3Z3bEVCVUlSRGRmeG1MOGN5VHhVZjVM?=
 =?utf-8?B?TE9PekkrUkhTZU81NnZXem5YakZnN205WFliUnc1MTNsbWZMOFd6OEdIOFhj?=
 =?utf-8?B?aURhN0lKZitoMXZZTVQ3U1BwY0Rjck5RaTdpRGl4aHJHSFNFbnhJNFdNaVlv?=
 =?utf-8?B?VEYzOU1LcUNpSFp6ZFFCZC8veW4rQnJCc2VSZ3FhcUUvNDV2cE5SeHlmMTU3?=
 =?utf-8?B?NHJ4VjQ2enVvR0N0ekN6SFQySWRXd2hXNU1VTkZuQlR4Ymt0TnoyeDRvVnVI?=
 =?utf-8?B?cU9haEJxNmxEdUgxcWtBd01kMFNQaUNhc2tlbGtUSkhOTWIrQ1JTL3ZsRzhl?=
 =?utf-8?B?c05oZ0RKVW5aVFhXbGVEd0ZBQ3RpdG9vTldwT2J5NmZNN0p5dVZvN29raitu?=
 =?utf-8?B?UTZtcDlTSDBKTmFlQmVIZnd6a0EwZ3ZFK1V0OERDVmJxaE9oWkNBdHMzcTg1?=
 =?utf-8?B?VVdqYUplQ25aMzBLRy9VWXk5TnpiQ1dTQURZVk0wRnRFZDBaN0dXSkVpcUlj?=
 =?utf-8?B?NGxRVjl4SlBmSEt0c3U5cDVXN00zQ29hQlFZZHJUMVZlZy9rZE9JVkJ0cThP?=
 =?utf-8?B?VERBRFRUR2plRGVzVTMvN0ZSUzNTL3Bra3dBZGRCNlhiUW1GQkc5d1plTWlO?=
 =?utf-8?B?MC9wRitCU0g4dkYrVXNiQlFvbkxFejd5b2hLR21FeUxhVnNYb3pvQWtpUEYw?=
 =?utf-8?B?b0lEZ0hyVDlFSnA4NUFwWFVWWUhqUURxcDRqNlpwNWxIYUZUTlB6RWN2OUg4?=
 =?utf-8?B?WUdRVG1pa1lHVFhBWDY2aVhCcG80SnZBc3o2bEpMMEZvZXZ4V25VdkpCS1dP?=
 =?utf-8?B?ZFh2VXhQcEtVSW9lMWhOOWY2ZTFTOVVPU3dObTVudjF3L05kYjQycjJiVlRT?=
 =?utf-8?B?TzBOTVhkL2NtNDJzQ3YxZ1d4NHdORUpWUU55OWg2VjQrcWNkTE1IU3lMbTNh?=
 =?utf-8?B?R0xmbjU3WHN2SUU2RlJQZlpENFRJK3ZKUXVKaHMwOUkyc0pQaS9BNW96Y0wv?=
 =?utf-8?B?WkxTVEdoa09lcWhHeFU5eGxpemw2a0RTOTJNb0pTZnVIa2VVTUJKVXpxRCt5?=
 =?utf-8?B?OFV2SzZtVGR0MGJIbUJ5MzJSZkdyM2hSM3gvZVhwc2NzQnZyZFpWSGdYNnFU?=
 =?utf-8?B?Tld2THJyR2xtWkM3UDZZd0NiQmdxMHZzdGp1RnFna3pWNTlBZ2VONDhGcW1V?=
 =?utf-8?B?WEcyMElvdUJxT3J2MXQwUEozTVZ4c3Fha3hlNlZXOUNGWG5xTVBjNWl4Qmtv?=
 =?utf-8?B?dWRXdG92bVNjSWxOODcySFNKSmFoem5sM0JSRCtQN0hqbWRXNFpWU1NDOS9y?=
 =?utf-8?B?K29qSFk4NWdaVWs2TXJTZkY1K1ZFTlpZaEZkOU1NU25TcUMwbWdLVU5nWkF3?=
 =?utf-8?B?UUlsWVlYcTFCcTNoSDk2MkFHK0huM29acFRuMzEzcUhXV1k1RmpIb3dJeVRy?=
 =?utf-8?B?VVdxT09rdlU0MGhKZnV2Y3F1N2E5UTFNNjd4QVhia3hlQ1VjUUhzbTNKaUxi?=
 =?utf-8?B?aDVYTUdlNEdkWStIOVZEc3hWekZnM2l3ZDE0WGROY0JjVjlmQ1lBMGlIVFU5?=
 =?utf-8?B?Ynl0a1A5MUJ5M2hwM0U5N2JUR1lXcXZuSnNubk0vRzZYWGgvcTViekk2Mml3?=
 =?utf-8?Q?e8bnHegnGnetmWOy/yxJPWSUZpB8ln1Zwe8PU7P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTF1NkluS0gvUFJLTW84Z2VXdmNhUk5SWGJBMDlyV2lMWW5PeHVUTFl6anZE?=
 =?utf-8?B?QWRBR0V5c2RDQTZLRW1ndm5rdURuaEdkcy8xMDVUajMvZEJVbHNGSVVuWS9y?=
 =?utf-8?B?WDM2cW1PWTZtSlhsK0d6aWR6Z1Nna3hMblpiL05QVitXTGJ5YzZKanhweE40?=
 =?utf-8?B?Wi9zeWtFaSttSVZ5b2tOakxBREthMzh3eUFQTlg2ZXRqeW1pazNYbjBxYkFu?=
 =?utf-8?B?azFybk5nY01HdGlrd0d4bGt0ZjYrT2xVTWcyRlRHb0ZCMkdFNXNqM2hhY0hu?=
 =?utf-8?B?SUJ5c3JLZ0RoUUdCVWlIVEI5VHdEckIvYmdGcWpEcFYzUTZuMktMRnlMcGMv?=
 =?utf-8?B?KzRUdllOQmU0S0NnVGpwcXp2d3owcm9lQzlZUVJwVmx2UlRhZkZWL0NCOVNR?=
 =?utf-8?B?bXNrdFdobDNQQk5raEFnTzlDUGZsQ3YyVWxXTml5WEE2OUZDQ0NabFZSTCt4?=
 =?utf-8?B?VHQ3L3V3VThkVHdEV1N0bUtLV1I1emFjZVdDV0h3elNWUFoxZDFydVgrZXRy?=
 =?utf-8?B?L1JlV3MvaHZQYUxZUUt4NUlRalJjU1Z5NVhKZHZLWkJYQXBtTzhsWlp0VDNQ?=
 =?utf-8?B?emsrVG1tME9Hbmd6eGV6K091OFB0MkEyem5JbDlKQ0xBVmgrMXhiSDhLRjEz?=
 =?utf-8?B?NjlFYUF1QnRlQm1NOG5UYjhLeEFsV2hjdHh1ZlFxVkdhbXk4eGFrdGUxMkVn?=
 =?utf-8?B?VS8vcG9wRDZpK1VYeXVNL1RYTUdxUUxSMHFMVEJyMDZydUlhR2JCQytUeG5V?=
 =?utf-8?B?MElFQlkxUGJwTmtxd2RLdHgyZkhvS0U1ME1NMUlRdDBmYkxRNzFyaExkTDVx?=
 =?utf-8?B?cWtiS2Fzc2RWUXpSTGpNOUo5ZWNlNVJIUXZUTkVlb2ZTeFlvSVpncWlBbHho?=
 =?utf-8?B?bDNrZWxpRG9DVXVoSjZoRCsrQUhjOVcreUlLTjVZU3hDOXpCaS9YODdpV1lt?=
 =?utf-8?B?U0k0dnFwcVo2NXVtbUdDWG1XTE9RQTRzcXdSUm5xemQ1aEFQWDlXbEJCRm9D?=
 =?utf-8?B?TkVBdzBvREVHN0F2NWc2L1RPNlViNG5aUkY5bFBTOENNekEvVVd3ZTBDY0JB?=
 =?utf-8?B?bHN6LzVaVUFnTlMvc29GUG53UDg4eFhzbXZhd2M4TjVjOFJhSVpZV1FHbUQ1?=
 =?utf-8?B?V3ZsU0x3MnNzYnIwSTBXQTR6a2VodmVPTVdBOFVIU3VxMEZzVFNjTmhQN3Fr?=
 =?utf-8?B?a0d4VE5SL0gzTmJTTzUvRm5YYXNVbnh3Z3RBK28yNFRnMEVjRUxhZFZVZ2Vk?=
 =?utf-8?B?SDNQNytOTStoWEFGaDhYZW9zSmdqQjV1cnVGbWJ4RTdFWjJlZ01PR25Id2ZQ?=
 =?utf-8?B?c1NIUVhsb0Fra3dSNHUzRkF5ZlZHMjlmNUkzOFdFYjU3d0dqRkZIL2l0NWhq?=
 =?utf-8?B?NWM0SG52VjJtSXhJMlJSdWQ2ekdJZ1FNMitDVGY4SDNwTzh6S0NsUU5Fb2pL?=
 =?utf-8?B?RVBJcmIya1NtekxjRmhQUUwzeW9LVkNXOEgxL0U2UG8xdlRBMkh2NXhYVTRv?=
 =?utf-8?B?SE81Mm5heUluUUhCY3JLdXBBaTJyVWdVREs0MnFRQlNGeUZpREhCWlNoWkdX?=
 =?utf-8?B?cHpDL2cxNmhKVmErQ1l1cDZ4K2dSeGNBOEkzY0hnVTRvUjh0SVh0Z1dEcVRH?=
 =?utf-8?B?b2ZDWWFLemxmS0VNQkl4VnhJV1JqUkJlOTNZakJVRUlCTFJqWlpyUUVqUndv?=
 =?utf-8?B?MkduWVFSelNFM3VUWCtZVmkxSHk1U0wwM1dJS05VOHJ0eEJEL09lRXV2QjQ1?=
 =?utf-8?B?K3FqMGNYeWNkSWpIYkhZSmRtRGdYN3VmUVpxcjNCSW81OU9PeGZjNFlvWkVW?=
 =?utf-8?B?eUZHTk9Ub004R3J5dXpSTnl0U0UvUC9hS0p3c0FSc2NSU3F0VmN2R21CQWFt?=
 =?utf-8?B?QllUT0EzYzVXVmFPdXdoZXhrczVtYU95N0dCOG5lbjFDZUtkVFc2YXRjMUJL?=
 =?utf-8?B?UUsxZFVrdURuNUFEY2dVSFgvYUliYzNOUGVtKzh5Yy9tayt5MFF4MThyejdW?=
 =?utf-8?B?d3c4ejhITDFab1ZzeEFPUVY0Z0xiU0xnZWFtNnBscmpPelRVM2twSldOUlpZ?=
 =?utf-8?B?N3VzaXRUYndDMTFSWDNOaStEWncwQXg0THkrZG9Vb2k0SGxkbExGNDI3YVJ6?=
 =?utf-8?Q?5h6VvBAX50ITsqoKWwVlSusrB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbc6e09-e694-4f1c-8f60-08dc920f69c9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 16:30:07.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ceO0XLB3N2CbWLTkYs9JM7TUoXsPzCSA/8TpboX+TIe4mUlu9rBTolhkKra3j+KT4Yw9tk5YVoyruEs/iTr5rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9237

On 6/21/2024 01:19, Mika Westerberg wrote:
> Hi Mario,
> 
> On Thu, Jun 20, 2024 at 01:36:56PM -0500, Mario Limonciello wrote:
>> On 6/20/2024 01:41, Mika Westerberg wrote:
>>> +CC Mario from AMD side to check that we are good and don't break
>>> anything accidentally.
>>>
>>> On Wed, Jun 19, 2024 at 04:03:01PM +0300, Mathias Nyman wrote:
>>>> The relationship between a USB4 Host Interface providing USB3 tunnels,
>>>> and tunneled USB3 devices is not represented in device hierarchy.
>>>>
>>>> This caused issues with power managment as devices may suspend and
>>>> resume in incorrect order.
>>>> A device link between the USB4 Host Interface and the USB3 xHCI was
>>>> originally added to solve this, preventing the USB4 Host Interface from
>>>> suspending if the USB3 xHCI Host was still active.
>>>> This unfortunately also prevents USB4 Host Interface from suspending even
>>>> if the USB3 xHCI Host is only serving native non-tunneled USB devices.
>>>>
>>>> Improve the current powermanagement situation by creating device links
>>>> directly from tunneled USB3 devices to the USB4 Host Interface they depend
>>>> on instead of a device link between the hosts.
>>>> This way USB4 host may suspend when the last tunneled device is
>>>> disconnected.
>>>>
>>>> Intel xHCI hosts are capable of reporting if connected USB3 devices are
>>>> tunneled via vendor specific capabilities.
>>>> Use this until a standard way is available.
>>>>
>>>> Mathias Nyman (4):
>>>>     xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
>>>>     usb: Add tunneled parameter to usb device structure
>>>>     usb: acpi: add device link between tunneled USB3 device and USB4 Host
>>>>       Interface
>>>>     thunderbolt: Don't create device link from USB4 Host Interface to USB3
>>>>       xHC host
>>>>
>>>>    drivers/thunderbolt/acpi.c       | 40 ++++++------------------
>>>>    drivers/usb/core/usb-acpi.c      | 52 ++++++++++++++++++++++++++++++++
>>>>    drivers/usb/host/xhci-ext-caps.h |  5 +++
>>>>    drivers/usb/host/xhci-hub.c      | 29 ++++++++++++++++++
>>>>    drivers/usb/host/xhci.c          | 12 ++++++++
>>>>    drivers/usb/host/xhci.h          |  1 +
>>>>    include/linux/usb.h              |  2 ++
>>>>    7 files changed, 111 insertions(+), 30 deletions(-)
>>>>
>>>> -- 
>>>> 2.25.1
>>
>> Hi Mika,
>>
>> Thanks for looping me in.  Unfortunately with this is appears the XHCI
>> controller link never gets created.  I've not checked functional impact from
>> this, but I'd guess there "should" be some functional problems too.
> 
> Thanks for checking!
> 
> I think the code that sets up the device link based on ->tunneled should
> do that always if the hardware cannot tell if this is native or tunneled
> link to keep the existing functionality and only do the "optimization"
> if the hardware is capable of identifying that.
> 
> Perhaps it can be a callback provided by the xHCI controller driver
> (->is_tunneled()) that then defaults to true if the
> "usb4-host-interface" property is there and in case of Intel hardware
> also checks the proprietary register?

So I think the problem is you will have an ordering dependency between 
the two drivers for when the link gets created.

Like if thunderbolt.ko loads you would end up with links to PCIe root 
port for tunneling as well as XHCI controller.

Then xhci loads and you end up also adding links to individual ports.
Would you remove the link to the controller?

And if the order is the other way around you end up with a larger state 
machine.

How about PCIe core provides a helper to know whether or not a PCIe 
device will support the proprietary register?

Then thunderbolt.ko can use this to know whether or not to make the XHCI 
link and xhci.ko can use this to know whether or not to make the port links.

Hopefully that means no ordering dependencies.

