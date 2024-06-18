Return-Path: <linux-usb+bounces-11398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5C590D676
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 17:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7692280F75
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 15:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0897FDDA6;
	Tue, 18 Jun 2024 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jWJVJPe5"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38101C698
	for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718722925; cv=fail; b=eXeg/nfxTNOByzrjSYbYNkCV9Jyj6Dhs2KzumLsC4zBvYvcK0wFvFXhzQ/QVy2vwDux3OCCuZ4DeyllJcTTjh/66+dTj+06lEdA0/cPsoCnMfF6aRYwpsoDx3+cnSQTBsbvfEhQezOi4v+Cjig+jhDS02wprTu4xvp9n167BTQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718722925; c=relaxed/simple;
	bh=b05lo5FaLqO9mB/Lee5dNvpr1zOAz1Be5/o3vwZwdaA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UPSvpxICBmg2d76nXS8c9jILxr7Srf/duh6oxjkfRaxAh/810Dje05sqv8uXYDX8HMaCLwiQoDe3Qg0q4vo9NopbGL48Yw/vmcs6f+ObPfVFmKEHMW/WZWFyHq8fljfBZuwwHK4AMFCipfNqPNBJQTBbYZ6K5IZDq1Um6aTG6sE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jWJVJPe5; arc=fail smtp.client-ip=40.107.223.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5K6nt5LOLLvhDQVML51upqx8CineLI/YAvwmPz/Nkz6otrf0sE/yDNyksiCQNJmSDNGz2t6+yrY40nF8JiyZIb+EOgETughKjQljJVqSGs/JLX7OFGSx/kO2MhE57cE4ijfDmQRKHYa8p8ULOzcSZk5Fv/gdhHMNqo9S6X3EHu7GldiT9ZtVHhY6ki5OISeLu7Fn3RVLFTLpL87MDRSYa8VcnjdOudEAzjt9j/I+kqqaTNXmGbZkoI6GDVBClrlnnS+CJEH1Kce3/rZMm2suxYHJ3HhlJksibQ9qYK086rQkfjbl9CGelxiy2FBUoQIDi8P7hnqOYR6KBEgLcEFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYT1p0P7udiQ7CF9tlueogoLuEiok7hjf6ibecmakvY=;
 b=nfdMpuOKRQRa9kzErze60j8yR4T5GTN0L75iSb4owGHhjaqNKKwN+AL1MyvJFFDw3GjkO2+0CPYJXMcl2TuxhnR+u+1/wyqy692wClfAHrb/wblzBm4JMLYqRmCd+SqUFw+lIeFKu28U/pQQ19szx3f9ZM/FB/VsaN8WFh4RvjGOZWHTnQL3CCMlQcrhoN8outFpsWwyNGIkEFnNlqLpBgfSE3Zi6cK1s69I8azTLGWhfFEnXnZxVhopmd8ZdNqPqSOniCEv2+UP5rLRZwZYA1JMjkObvobx+RhJh/KH40pHROlcDdNe1GLQG2f5V1L3oOjHzSPt9cE415lLjR7RGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYT1p0P7udiQ7CF9tlueogoLuEiok7hjf6ibecmakvY=;
 b=jWJVJPe5AG9fxLTPHmVgWe4BRv9q0L00sfZPlVOuLghojUzO45mNFqq5+gbRENbv0DsPNKfu8RgXQJIhgVgQ56Rxh4eqLnaeWaY+gR8r7sfhbonzniGe+B2fkksAqk0qRT2UhyHykcsAFVcR5nzcZ8rRxSzzJbXA+1pU9iL7PN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB6607.namprd12.prod.outlook.com (2603:10b6:8:d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 15:01:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 15:01:23 +0000
Message-ID: <bd44a37e-ca64-4ab0-81e9-b25d7185fe42@amd.com>
Date: Tue, 18 Jun 2024 10:01:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: ucsi: psy: Add support for the charge type
 property
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-usb@vger.kernel.org
References: <20240618081510.2764297-1-heikki.krogerus@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240618081510.2764297-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: e18c6d90-d0c4-4827-f64c-08dc8fa784fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MThZYTlLT0tCemxoNGw0RnpvZWszUElnT3VXeGhkaXNCY3hGQkJXYW5lTWFW?=
 =?utf-8?B?V2lBQjZjcVQxbzhkQkpMaERLSmNjRjZZaEkzYkRueUEvZWgxd3A3RGxLUHE2?=
 =?utf-8?B?eXNpTzhXWXhiamgyeFlJd2FFMVZ5cWx1b0tNN2F2VS8xUlV3YkRsWUFPcG4v?=
 =?utf-8?B?NVZMRU05aUEwdXAvQ2lsMTFxam0xeHQ5ektWU0o2TDZNV3o0eWdRSS85ZkRq?=
 =?utf-8?B?cWF2WE1EdmladUlMZlJLcXgwT1RPMllUd0N0b3owK0JDRVBXV2NSbVFBL2JL?=
 =?utf-8?B?NndPQmVZTW1GSkhCRzZPYzF3MkpPeDl4QWtoRXI5K24wRUllNXV1ZG5BK1Ix?=
 =?utf-8?B?NnhkM1NxYml1OTU5dmlXNWgrcTJMMzU4b0pHcEFaMmNlYS9NWFV1a0ZFSWd3?=
 =?utf-8?B?akZkeTBpNjh5WW9qQXlQdlNLck83WWx2VFdOOXdkWS9WK1lSenZRbFFuNUwy?=
 =?utf-8?B?VGMrSHFjRzh6NFN4RXJmc2sreDk4UGxZeUpzUWJJaEsxdmUzbzJNYk5wWUE1?=
 =?utf-8?B?ZUNzclFzSnpPcnMxdTE1alN1UUhZNTIyeVl3NFRoZGJKVklzWHdDZUZDd1NN?=
 =?utf-8?B?MjlmUXZVUFU3REgvdSt3N3AyMEsvcHpvMUhzSDROUTI3MEJkaDUzL04wZCtB?=
 =?utf-8?B?TCs5M3VzM2dNZG5VV2JqWXdZT1NnbDhya1Jld2ExNXFaTEZuRWVnWWR0TUtm?=
 =?utf-8?B?WTk0MVFvUm5nZTVpZUFSVG5GbThXeWJXeVcwcm1ndkxhdjdxUkoraWVEeEFV?=
 =?utf-8?B?TmFQdlExS21udGJlZDhkZ2Rvc0hJNGh3Yk1LUVkvdTM0SXM3S2dxc0E5RWZV?=
 =?utf-8?B?dFlkd09sYkp2bGFzalNxR2h6Z29iR1lCMmZHaWxCeHJwYk9pT044QWNNWThV?=
 =?utf-8?B?WWJpMTc0VzN4QUwzTnd4b2hJdGU1OWU2QVFkOURzU0tZWHdrNGVwdW5xWW80?=
 =?utf-8?B?OVhpR2t3bUlCcnNXZGJmQjZQNk9wUXVxc3VRRDBxdVA5elNiZms4VExTaFUz?=
 =?utf-8?B?b0lYSS9oc2hwQTZFeUtZQkF4VGNqcmhRNnpwb1ZnTElobUtYY1g3YkhOanYy?=
 =?utf-8?B?MWNJUzUyVVcyaFpOWVJSZC9uTTlaUnNXWTV4ZFZtclJBSUthekdGR3RobVFo?=
 =?utf-8?B?NTIxNkxLbzhUVm52YUM1QmF0UU9sMW1mU0M1dmMxS2owVjI5amJ5WHg5Uk4w?=
 =?utf-8?B?WTh3WGNOWm50TW1NUHlVdGxxQUNQM1JHaEdCZHZoUXk4Vm5GZCs0Z0lmMUhn?=
 =?utf-8?B?TENpeW5yMHVRRldvQVQ1OFdEc0RHUy9SejdWZWZVclllRTVKSmhUUFJWRElG?=
 =?utf-8?B?d01Kd1IzVzByT2NKcmgwWmRjQXBWUGxiL0VBV1QrMEVSaHp0YkVHcEJNUEVZ?=
 =?utf-8?B?WW1OZHRFMit2UVlPUHhGRFBKOFlKVnRDTE9rUTdYZzIxd2N0Q1lneXQxTEl5?=
 =?utf-8?B?QnpXSDJGcWorMnE0VEg2eGtpT1RjM0ZkOHBwcVgwbUN5UE5iRDZQYTFPR2Er?=
 =?utf-8?B?YkFxZGxvZGFOV0tnMFRqcExkVnkvOGJCZGZ6bktJZmZDV1RPRmZiMnpPMzY1?=
 =?utf-8?B?Sm1CU3ZjQmxoblBQUHVLaTF2My9NQS82czM3amo5MmN1TE9Yay96VGVDVmM5?=
 =?utf-8?B?ejZCSXpSWDczcXdoRm1VeTJldjV1RDNqVklwUDZwSCtFdEV5MEF5SXc3SVRZ?=
 =?utf-8?Q?3lSEdP+F/pRguz+uS7H4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE14Q1F4QTRUUnZhNGtPUmp0YzVma3huQWYyWWZrWGwxL3hlZnVCL1Ywby9p?=
 =?utf-8?B?V0V0QjNhdXk4dXBMYmZ0bURhcVhlVGNvVkt4SlZrNnFZSWt6YVIwTUNZcHdD?=
 =?utf-8?B?eGt3RkZhSjJzaWloMVJ5N2ZCenhvbkFJVFJEMm5XZVBaMjZzak5BaXZlaUxS?=
 =?utf-8?B?QzMxTmdzMW9VQ3NvU0x3MXlCMXFaQUFELzhhRXlzMSswRXZvck5nblVlUUtl?=
 =?utf-8?B?SEY2UXRDOE4vOTd5M0lJR0ZRa1I0c3ErZCtDRitDam50VWZqMWZ2cW1IVklq?=
 =?utf-8?B?eUZza2x0czAvY0RrS2ZnZVlFamJMU0hmQ0JUWGdNM2c2eE42eHhjV0E5ZkJr?=
 =?utf-8?B?UjYvZDVjMnlGMkxqbStLVHZZTTNJZStLOHVQZzVkMDF3WVVaTE1KSGliSVpW?=
 =?utf-8?B?aWRYQWo4VFdycFBkaEF3OHNYUFI0d0RmQVNnYVRyR0NTU2Q5VnN3RGtmUzRT?=
 =?utf-8?B?MndxZWtRb256MmJpOHE2SnIwb0dJeHN4emNXQ2pvbDd5Rit1YWcxTHNFb252?=
 =?utf-8?B?OUEzd2RLSGM3NkhUeXpmK1pBLzlqcWdYNEtwNk9ZVFVrWE1mQzF3b2s0ZDVa?=
 =?utf-8?B?bHZuL3FYUFVQU3hxTDM1TUY1cFppNi9qdGNYSEZYem03LzdDSmo3b0R3blNU?=
 =?utf-8?B?ajQ2cHJpV29KWThvbjYyZHJlY0dWUHBqQTVFQ0pSNHU5K0o5ckluODcxL0dM?=
 =?utf-8?B?Z1IrVTJ5blg0eDVBbTMwM2k2WmRkMXdoOUdWRUM0eVpmY2c0Ym9BMnlFWmtG?=
 =?utf-8?B?YzhxeGwwZVNMMndxTEZFWFFXODZsSUdaL0dqYXlMVnlnMWlmZDJJZkliMjl2?=
 =?utf-8?B?WlFDNUlCR05wUHVOMWNSZlJJNlZoUDFCbEZhZDZhejkxU0M1YTVuUEk1c1Zu?=
 =?utf-8?B?Z2t3a3pNMy9YTE0rWVdsZ05KWkt1SGJ3b2Mvdy9DdWZkS21IeWZLQXh3VWwv?=
 =?utf-8?B?anozVm9sMjljaUkrZktGdnJEVGs5QzNaRlJ6Tmh1b1hKcElYaTluOTZvQ2ZV?=
 =?utf-8?B?b0xMdnd5eUJtYmF3TmpzRHZOQ09pRExFNSt1ZmQxaTNvWDZOL3NqZE9xZU5j?=
 =?utf-8?B?MHpvYlFNVS9POFhVYWFPTzRRdFhmTWVUdGZrcUhad2h3UlNhTE82bm5KQjNV?=
 =?utf-8?B?aG13ZlNLMnBTZlhCdjVrdlA4YjdOK3Z2MkZ5ZWFsODZpZHhwZEtIcnQxTnVX?=
 =?utf-8?B?bWlsVFFSb2tOdzVMQWtVS2pNaTVXUFFJT3M1TUxmYm15RWQ0WnJpcmtCeThJ?=
 =?utf-8?B?QUdkbkRpV3pKMXNkRFk0dytVQnYvVkhRU3hJZk1nNGFIZjJWTkJFbjJJTG5D?=
 =?utf-8?B?aWR2cmVZVlUveFNQSnpLVEZDTUtLWXNjcG5WMERxYWViNDF3NDBFaFJIWVhX?=
 =?utf-8?B?WW5Vb2RyelI2T0tZQjM0czlMZ3RVTitGa1I5Q2N6M3M4WWo0YnBuN3lCS2VO?=
 =?utf-8?B?L2NHKzYzNm1PUjBZYm9rNGxEOWk3SmxLNkdyZW5JM0pvZS8wemFxMW1oN1dO?=
 =?utf-8?B?REg3UWg1Tkt3L3gyOGU2YlhmTjBWVzUxQ3dDR1B5b3JMZG5qYWZEbTVYNEs4?=
 =?utf-8?B?eFBkQ1ZCMHlWOE5lMGx3WDc5aG9oR1grSzh1TjRKWW9yVytIc1BXMGZRZU9U?=
 =?utf-8?B?cTBvUTloODZkcGd6c0Irb2IvSHNPTlFzY0pQR05RamxrWTlSa0hiNTNydlZ0?=
 =?utf-8?B?dVd6NnJnTW44Tm1BcE03dmV5dUV1Y1BwSEhxa1RNTEFETnVjSTFiYk5ZQm5j?=
 =?utf-8?B?d1R5VmpvUnVXRUlxbWFlVnBFZkVYTHRmc3VITGpJNFJMeGM5ZFpRSEVpUktU?=
 =?utf-8?B?Q0RlYzFBSTZpK3dGVW9TOW1SR29HMmQrci9UcDlpSE5sOHdkVTV2ZXdLREwy?=
 =?utf-8?B?WDk2dHBJKy8yY1RhdUNVMnQ4alZDZENtK2dqbHZ0QTdvNnRIZThQOEpzYmlY?=
 =?utf-8?B?Uk5mTlZtZ0w2YkVScDBCSzduRkdxZ1Y4Q0dhZzAreG16dlJ4VHZMYXR2OFZ4?=
 =?utf-8?B?ZlIyeDZNU2NLeVNlY0gzNWN3bTNPK2VlNVBUMnJ5U1dxWmRDc2NUMjVJa1pn?=
 =?utf-8?B?Sll6RmpCRUk3cUovQlladzBFQ2RxampZaEtiaGNQNXZtY3V5cEZZT2tKeXho?=
 =?utf-8?Q?U7NFLrJ0Z+7AiKUV8vOoyXA7V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18c6d90-d0c4-4827-f64c-08dc8fa784fb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 15:01:23.4376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiRQiYKLRjpNg47KCHZSpOPwK+zbjTRrTflnRYWwRw7oZK/FhhmwaPEex9qxy6GqBPS+mCT0WNcXkgQVZGCuTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6607

On 6/18/2024 03:15, Heikki Krogerus wrote:
> Adding support for the charge type Linux power supply class
> property (POWER_SUPPLY_PROP_CHARGE_TYPE) to the UCSI driver.
> That will make the charge type visible in the charge_type
> power supply class sysfs attribute file.
> 
> UCSI has the charge type specified in the Battery Charging
> Status field of the response to the GET_CONNECTOR_STATUS
> command.
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> Changed since the last version:
> The commit message is completely rewritten. The subject line was also changed.
> 
> The original patch:
> https://lore.kernel.org/linux-usb/20240617105554.1677285-1-heikki.krogerus@linux.intel.com/
> 
> ---
>   drivers/usb/typec/ucsi/psy.c  | 27 +++++++++++++++++++++++++++
>   drivers/usb/typec/ucsi/ucsi.c |  3 +++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index b35c6e07911e..b3910f37e171 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -20,6 +20,7 @@ enum ucsi_psy_online_states {
>   };
>   
>   static enum power_supply_property ucsi_psy_props[] = {
> +	POWER_SUPPLY_PROP_CHARGE_TYPE,
>   	POWER_SUPPLY_PROP_USB_TYPE,
>   	POWER_SUPPLY_PROP_ONLINE,
>   	POWER_SUPPLY_PROP_VOLTAGE_MIN,
> @@ -194,6 +195,30 @@ static int ucsi_psy_get_usb_type(struct ucsi_connector *con,
>   	return 0;
>   }
>   
> +static int ucsi_psy_get_charge_type(struct ucsi_connector *con, union power_supply_propval *val)
> +{
> +	if (!(con->status.flags & UCSI_CONSTAT_CONNECTED) ||
> +	    (con->status.flags & UCSI_CONSTAT_PWR_DIR) != TYPEC_SINK) {
> +		val->intval = POWER_SUPPLY_CHARGE_TYPE_NONE;

The not connected state obviously makes sense for 
POWER_SUPPLY_CHARGE_TYPE_NONE, but what exactly is the other situation? 
A UCSI state machine failure?

I'm mostly wondering if POWER_SUPPLY_CHARGE_TYPE_UNKNOWN makes sense for 
that or not.

Besides this question the patch looks fine to me and you can add my tag 
with your decision.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> +		return 0;
> +	}
> +
> +	switch (UCSI_CONSTAT_BC_STATUS(con->status.pwr_status)) {
> +	case UCSI_CONSTAT_BC_NOMINAL_CHARGING:
> +		val->intval = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> +		break;
> +	case UCSI_CONSTAT_BC_SLOW_CHARGING:
> +	case UCSI_CONSTAT_BC_TRICKLE_CHARGING:
> +		val->intval = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
> +		break;
> +	default:
> +		val->intval = POWER_SUPPLY_CHARGE_TYPE_NONE;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>   static int ucsi_psy_get_prop(struct power_supply *psy,
>   			     enum power_supply_property psp,
>   			     union power_supply_propval *val)
> @@ -201,6 +226,8 @@ static int ucsi_psy_get_prop(struct power_supply *psy,
>   	struct ucsi_connector *con = power_supply_get_drvdata(psy);
>   
>   	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_TYPE:
> +		return ucsi_psy_get_charge_type(con, val);
>   	case POWER_SUPPLY_PROP_USB_TYPE:
>   		return ucsi_psy_get_usb_type(con, val);
>   	case POWER_SUPPLY_PROP_ONLINE:
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 6bbaad4b89a5..51135e3502cf 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1257,6 +1257,9 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>   	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
>   		ucsi_partner_task(con, ucsi_check_altmodes, 1, HZ);
>   
> +	if (con->status.change & UCSI_CONSTAT_BC_CHANGE)
> +		ucsi_port_psy_changed(con);
> +
>   out_unlock:
>   	mutex_unlock(&con->lock);
>   }


