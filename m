Return-Path: <linux-usb+bounces-11839-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1A5924CD7
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2024 02:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D24C22853D2
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2024 00:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBC31361;
	Wed,  3 Jul 2024 00:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aKia2c+S";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jStJmjfr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ErWP8l30"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09486184E
	for <linux-usb@vger.kernel.org>; Wed,  3 Jul 2024 00:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719967652; cv=fail; b=R2dXJxvtFEuo4Mza5s3RSXe+H+KopeUIXX7TYUX6ldek2sDng2bvmZ+4vpooeC0bPAnKDqIe/9GfbEY/+qrwSBXXrAV9XqZyVo6ji3P7lLeN9P4rcgIbkVuQrjpAC7Kyi2nmvmJg5Zx0Z2qmaXGpE3y1gAQfi1l3pLOsmS94qLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719967652; c=relaxed/simple;
	bh=tsbzxbFULV+h4Kb3qMyJTcRFALbACQ/RKD/hY8Do0TQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZdFzHudiwLH+o/zZAwBaK0YCHZCQYzPH24KrY5vgQGoRw253lZd5hiSK8CgAp01ne8wXRoXIAJLj26OxcizEtvQXVw3r1TFnh4YSZ97dz2D9NnKdWzvqa1C/A+qv/YZMKNyDPqMyvryCMFaR37tx2ToRP28mYewyisy6XiG2ltg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aKia2c+S; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jStJmjfr; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ErWP8l30 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462L5rLw008709;
	Tue, 2 Jul 2024 17:47:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=tsbzxbFULV+h4Kb3qMyJTcRFALbACQ/RKD/hY8Do0TQ=; b=
	aKia2c+SpItRJW/EHaIvzDWzUe5eUAn0CIyoOwM/79Yv/EhzXNNqf5pSyVZJVVzr
	gakYEhUhavlzGsi2lCujm2gO5/Gj+3rdyJIrhsnzIRnW4FqwyRUGnFTcOq04g7tE
	vwPpLzX6xgtsMVNUtg6t0kDIUYEIb8bLfypelZhosovn95XxSaU8MylvWHpwDDKM
	rpHz+XH+Ua1a8/0uJ9r+oH13IpDDI+2LBgtMWGC6SCP9PYE+ZQowGcpRiUDXAhpN
	a4SDPgzYVWSVWwL342PZ7CENhwil+41gL3uMNyZOExyghh6/LFgAiIDBeh+Y1uPf
	7Ex1sAwEXT6vc9Rga36EpQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 402gwdnku5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 17:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1719967639; bh=tsbzxbFULV+h4Kb3qMyJTcRFALbACQ/RKD/hY8Do0TQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jStJmjfrgizZBeszULekaXeNq5DXcDSp+QqHot44MHUH44WY7Ah8FopFjnDoh9bp/
	 SaR1mg6avVz4tjA6PLydq8aOgbiQuj5J58IMhYkuVufjL+ax27dyY8VBDKw6HT8loN
	 /i4MiG0hBA3T0h6NoFLEyjxtyF6vY39LysDGSvXnVJnoOokveiFL3MGn27Qn85GiZa
	 LJS88pcQde60dQJBpu2ybeZL7twolTNNEX526pyUhGrOxaYtmLGyOhB35GRk7UeHMq
	 3W+4KB4ohiRW1US9r3V8uTjUQFusgvlMbTAB8QB5eN5acy50JpkqAeKAwWUKAOcSL4
	 pysjVH2DFpiNQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0AE4740349;
	Wed,  3 Jul 2024 00:47:17 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5FE33A0076;
	Wed,  3 Jul 2024 00:47:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ErWP8l30;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BCB704028D;
	Wed,  3 Jul 2024 00:47:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPpyUF6Ai1OOddobrd3nGs3ZzAyKpMaexZJbC0so4fvZGvxG1/YXsY3yOouSvpl3yLywEFkoEO9Muo8Yl7QH2pz0MBKjA9Cqmb5uqUi/dmican41vydqTeYVA2qfob23AFuiKDZVG2xUsd1gPtsKRn6pupA9tLdoPi8zHYhnGxL4lKY/lz3qgRamT7Nl4N8mR7jsD6d7Iy1Z3mpIiA79dsq/Qm0Mg9OfeToRwnSKiPv1Da9Eo+oZnPwpahOOuEczViAdI/yHzgsg4qk0pQt/dNGF+YcvW/8l55y8AuO8Y/y5mqMp8rphkHKM/7YYaKFQL3J5df/T4j0PTfJTCajYrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsbzxbFULV+h4Kb3qMyJTcRFALbACQ/RKD/hY8Do0TQ=;
 b=Twz1xj3efef30Sf3EndBw0C6fAhaRzlFrrislLFcGRSk1h/nuCy6YnCJzmvz0JFgx3NYXux5qcw9siNdTKFJqlCBr6WyUTkDFXy3e83F50dM/gNR/yEZh4WNYEahbEfuqdCTwywG12QK1goHNxTGEO2mqJwwbHEo6bMpHmIalkF52C7jSmO2rc3jXvvv8K/yjKBRyZ5i1rZgMgVzDjNo718+B3t1kfej3Ab8t3T+FSjQXKsH9UtY5MoSKKZYPV/+8OsYBWC+10uMEsBLj1UFPH1Ds7jLYE3p7X76tMdr4BVPWB0gDqT8yJT51+2pwyQYVIzxCGYawtXlM23wdtMCCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsbzxbFULV+h4Kb3qMyJTcRFALbACQ/RKD/hY8Do0TQ=;
 b=ErWP8l30r6Su3FZ1NqJ9qkUa62AV+l8i7WeqDp8al8Det5JhgvDDjN5g7nr1DXDVIl5cxyp0UjwRBfk62QU07abxZXTq1vImY777IkqZvRaYX+82Jkq592cKsdafZqrHQZGzXb73a7jes5b9ezZq78lV/sXpBWrWZCEzpa0IZTk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Wed, 3 Jul
 2024 00:47:11 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 00:47:10 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ana Clara Forcelli <ana.forcelli@lsitec.org.br>
CC: "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Issues while implementing Designware DWC3 on an Actions S700
 chip.
Thread-Topic: Issues while implementing Designware DWC3 on an Actions S700
 chip.
Thread-Index: AQHazMYKo12mSIzDr0+kSsLg8FpD0bHkK4QA
Date: Wed, 3 Jul 2024 00:47:10 +0000
Message-ID: <20240703004708.stx2dr2vix6j2d7i@synopsys.com>
References: 
 <CALWWSVGAg_4hW-a-SHFvQQ1N2A7jjTQpfO34fRUWdfR6N43ZRA@mail.gmail.com>
In-Reply-To: 
 <CALWWSVGAg_4hW-a-SHFvQQ1N2A7jjTQpfO34fRUWdfR6N43ZRA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM6PR12MB4338:EE_
x-ms-office365-filtering-correlation-id: d8f99833-ba67-4943-d8f9-08dc9af9ac55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y3NKSHpHc3ZNQ1B4Zjl0ZndPcVJFaFhnOXBET0tYQ2VQOHR5TlBid29qaXRw?=
 =?utf-8?B?VUx6ZGhRNUowRnNNWGlXRUZRMTFTNk1VbzZqQW9QcElXOHIvNUo4WEJ5YVlz?=
 =?utf-8?B?Vkg3M2w3MWNObDh5a21HU3MwZy80ZU12YlpEU2JHUnRlK1VBNEIvQjNHVDhW?=
 =?utf-8?B?Sk1LRHVmclE5Q0E4TW9yUzZ3SGgzNUFtTnlaVWdnSjNQMU9uQkVtWHZFM0Fo?=
 =?utf-8?B?R2FUN1BZNHVncmR1dytJN1pwcTVRc2NVUDZnbHZoWVppclpBd3dGR3VCQnhh?=
 =?utf-8?B?NWRGdWVTK3laQlNIQnh5aFplOU9kL2gwajd4SCtUcEx4ZFBpcEJuTFBlM0NY?=
 =?utf-8?B?ODJjMU55TWRWQlFnVklUclBySDd5ZVRHZGRLaDZ4ZlN3NnUvRENkT0ErdERl?=
 =?utf-8?B?SW1xdFVwc2pSQ0FRSmJaekZQb0JTU3BQUVl3aEtsTGlRNlRvWWxIdjF6SzdR?=
 =?utf-8?B?dkNvc3ErYVFNZHJYdlpFeGVoRWVJVGE2UnZHRUVlazlYeFJ6NFJ0dlhPTldV?=
 =?utf-8?B?a0xFRzhHN2grVTd6M3FsRG9DakRMb0tUMlcwUmFyNExMSHZxK3JZSGlMRDZK?=
 =?utf-8?B?YlRETndTZVkzTW80emo3SkFmMVE5ZHZHZWx2Z3hrVHhSMlFaUk9FcVBaN3FX?=
 =?utf-8?B?cVlqTzVkNnhDTjhRdEExeU5IZVVBR3B1MVBiVG5WTVZJMzNHbCtnWXg0WDN1?=
 =?utf-8?B?YmNCZTRMNzZSZSticWVNMkpQZGF0OGRMSWVuYXoxTUVtUEZkU0l4cXRic0E3?=
 =?utf-8?B?bDVOSE4vckl5Mit4WWtzeGRwYWx2SENQbHhLK29Ib1V3azlHMm9jSmlzU2Ez?=
 =?utf-8?B?MWY3VFdWeE5xY2RLcmZmbTJGTUVEQkJ3L2lTUzBzTUNrcy9FeE1rNTcyUWRG?=
 =?utf-8?B?bjZqZ2VDa3pOOTRyUDRxSmFxbEc2UllwV0JQa2JncnVneEhDM04vWEMvTUY4?=
 =?utf-8?B?RytYRHBwYklVbm0xWmY1c3U1T083bHdKRXVWUUk2TmtmRmNxbVRsY2hmQkJk?=
 =?utf-8?B?REdLaWFXcmRlUU40VEhwRFZoNmdpY1h6b3lrL0NVU1lHUjU5RjE1UXZ1Qm1P?=
 =?utf-8?B?emxqQ01pcHdwOFNJeEw3dFlwOTJ3Y1ZMcDZqTHM0ZVJGMHFBTlR2TUVSU2hX?=
 =?utf-8?B?eVZkZUJ4ckNQWXUvb2Vsbi9rbEhqeHpoUGxpdGh2aFFPRjI0ZjhZNWpwMkU4?=
 =?utf-8?B?WVM4OWd1YlZDZlFLRDl6ZlM3bGNGdXhOSVVDaXhmTERKbnMzNjMvOGNGKy9M?=
 =?utf-8?B?d3l0Y1NGNy92QjV3MFBKdGdYdFZFTkxtYXJJWDAyZWVaaDZqSElXdG5zaExF?=
 =?utf-8?B?dmdVdGNGUjgwV2dOeUhQWDd2Y1Q2TVVYR3JJUlN3eUoybXVmYUFjQVRUVXpj?=
 =?utf-8?B?d3g0bzlCRytwOUhUYkdXT1hrQnZMSHlySmVaZ0V3VHdFbE5YUzNsak5YdUYw?=
 =?utf-8?B?TytLMDJ5dWRwTlVWR3N3bVJSL043ZEN3U1daN1JUVUYxOUZkQmNSRkJBTFJ0?=
 =?utf-8?B?b1FDRnludGsxWGc5eFdEQUlxWEhaS01Oa293NjVMbnZ0bTJIOGlWSHV2SzFS?=
 =?utf-8?B?WFg0K1Ewcnl3Q1lXWXAzR1NuUFFsbXg1aWdZQnZ4bnNQaHJoYVdiMDJQUEtq?=
 =?utf-8?B?eFRhaFduVXNtWFh1Zk5CSTVpVnJZOW1CMk1UZ2RtRnVBL0tBVGtnN1V1eVRP?=
 =?utf-8?B?cmJ1bWNScGdFU3NwaVhnYmpvZno0dTJDOTlob0JlZitxTDZXb1FFbkpUeHN6?=
 =?utf-8?B?SUYzYmZxUkw3djc5a2ZLQWtqZ1o2bWhnOXNqYzFxNkNFVVhweHdJWXErQ2RJ?=
 =?utf-8?Q?Qu8aXdTlsszEBEJER0bGyNc+rTKhwbNgxizX4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OENmaUtIZ1ZQSEVmTEhzZEExMmtFZzBjZ1dtK093anZjVldudmRvR21CMDdH?=
 =?utf-8?B?MkE4SnJjQmxqN0JpMEgzQ1o1Wmx0Vlp6cktwUlJzK1JsYlNnMSt1NjhqSUg3?=
 =?utf-8?B?ZVpFYnRVZE5lUFhHRnpaQ0FrTndPdmlKMXNLQ2ZlZU00MVlZbzV5R2Yzc1c2?=
 =?utf-8?B?VlMyTlRWYzA4RTJGVkpWSy8zR3U0SDF3aWFFMnlVbmRYUzVXTGRKbElJU2lN?=
 =?utf-8?B?ZkxSbnpieDZFSFl1RzI1L1kySUx0Nm5NaE1JT2Y4VlZjdUEvZUtRMk03dEd5?=
 =?utf-8?B?Z05XTk1XNW1tMys3WWpteWkzSEtrTWl6QzdJdTJiZXd1b0p5aUV0dGNydXpB?=
 =?utf-8?B?aHlaemliRHhBSW40a1JDT1ZvMlJMUU1ZWUdpQkhOQjd3UTMyeXBaNU9wa3N0?=
 =?utf-8?B?M2VadkVYaXY2TnBKcEhuY2ZvUU1lcEZ3K2RlVFhYSEpSSFhQVHplcWVGK2ZD?=
 =?utf-8?B?dFBkYmZnMmx4aDRVajM4VkJBTGFWaitXZ0Mzd0xNa2NBdlY0U2lTZHBtVkVn?=
 =?utf-8?B?OUdOdUdYYnVpWVpRN2d3UHE3ZEtpWFZTV3ZvS3VYeVlwVTQvdnhXRm82SC9v?=
 =?utf-8?B?Mk94cGN3Ti90V0ZTMndPbnZUa21uWVl2Tk81RVVyUlFYZmU5K2xFSzNUb3pu?=
 =?utf-8?B?U0ZEUk5DQWNSTGpBVFZ1U0dncG9mNlJHRkR2T0U5WDFCUU41N3lWd1Jnb1JD?=
 =?utf-8?B?VHFBdlpUcnhBbTNOV0hEQWk4QjF2WmhSMUdod004S1BOL2RsWmdIYjNWNmw5?=
 =?utf-8?B?cC9DTVpndUI2VUt2NnUvd2Z6eUxLWExINWpqZmxqcUpkdmUvV3piK3NacjJN?=
 =?utf-8?B?VXloWVREOXJWMzI1T1J6dERmcC9majYyZWJ4Y0hDellVdm5jNmdvbDd4d0hG?=
 =?utf-8?B?VVJMZURFMFJyaEZFT251czMxM0E4dlNHNWhFdUpZYmZTWnNSSzJob3lZczll?=
 =?utf-8?B?NlN5dFJLT24ycUhTOGhKeGFBa3NRODhWNHBybWtraXo0ZTlKaW9QcGxHT01P?=
 =?utf-8?B?N3NsODRyN2wxZ082REJ3NDlaaWxZeFpuT044VkZmVnlBWmErWVNMNGMvVlRF?=
 =?utf-8?B?T0RHcGVwUjEvUGxQdEovcjU1OEE2akwzZm9hZHR0UkNveHdYazNwM0RoZ0lP?=
 =?utf-8?B?aFFGTnhwSlluR3VicTRoTGUyUytQeFR0cFVCdENaVGpCaUhvdHRJZm5wdzNL?=
 =?utf-8?B?RCt0ZjZiQWdPTi95VjJBeUVYWjNhV3ZXY0J2ZE9TM1dleUpmWWZWU0szRkFL?=
 =?utf-8?B?dDBvYmc3Tm5NUTMwVURjOE5PMmJKN3plOUZpTitwUGdoS3cxMFZiMnE1U0tP?=
 =?utf-8?B?cjZpa1hRYnNlZlAzYWl6VlNuenZYWnZGUzYxTzlPYnI0VGxrcEpXVG9PdTBh?=
 =?utf-8?B?ZEdXOEFmcTZlNEl5YS9HeWd5MDFXZEIyaXB6R1VXZE16VEZwdVdYSjNDNlBs?=
 =?utf-8?B?ejd4clJYcEIyQTU5STF0ZUFkS2p0SndVbVhIVTJETk55UlRISXpycGZweDlK?=
 =?utf-8?B?Z3c4azNkN3Q3WVVzaEdMSExNZ1NER0ZlQnJpd29XTjZxbEhJTGlZM0JMU0Fr?=
 =?utf-8?B?UGFweEhKSHRadThBUjg3TC9UUU1EZjRQTk5JTVJzSklKZW9ZYVNiUTZzS2dW?=
 =?utf-8?B?cVpRUHJDclRSOHpYQW54QUE3TkxBNFJkZVBHTEIrc2Uyb3pBbkZTcjdkZGdN?=
 =?utf-8?B?MFhkdGdITGR5OEhtOE1yTDBIMmtkYStpQzJ1cVFZQm5lUFhlS2hyanhuTTNS?=
 =?utf-8?B?TlhhTlkzYlEwdHpwRFYzdExtRzJRcHV0ZmJ0WGVDWmpXaUJmendYU290eFVu?=
 =?utf-8?B?c3Z5OEU5RE1KQ2tHbTJQSkVXM01ac0pQZkVEQWcxcmF1SDRYY3ZyZDc5ZTRP?=
 =?utf-8?B?OFRnUUVqWTlUMC9ramhjSGp3Q0M2K1RwMDBTZEVqK082MDZzMkxGQTNTbGVT?=
 =?utf-8?B?RGhjcGdCR1YyeU14WXA0WG1TVWlWRElMbGFKeUY3VG1WRG5sTmNwdjBIYlNi?=
 =?utf-8?B?a1p4QkFHWVhheVNvUzhTYXdjVm5aMXFFSEc5cG91Z0J6MTc2d2JPaGtZYzhF?=
 =?utf-8?B?aWEwUGtFMGtvUDZEV1ZwNkZkdlVWdlMxWjcwUEhQc20wSXdYeTlNeGpMMWRw?=
 =?utf-8?Q?M/jTRpVAfQ/Vlt4szspqLS0qw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F605A2D869BD7E48881863961A05DF6F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+NYTWRyTPTmQ85TyfQ1fjej3m0qjWmKBIECpqA0H+5iPNvqZ3w/QEa+Q9AYnV4bPwPOEI6SY6k9Dp31kbJsXNwQ5ZJTyvyE6yFa0LATdX9pDPCFCJpuKpPZ/ZyZhU2LGHDfejBXG/23pRaWALU984iAh6QGXwiSpZi6sAZyYUfcWlfeCe7rl61cc0gtYnpkH4KpEKfxYTzxaU69NlEnijZerktF5E/klrB0XzvuTFeQfmjtul+ssgQEPkTlVerJ2fmljYcvLG/N2jQPfjZl8EWz1mVqnyNKCFP0/V3jjZ3F2b3iVqlbclXQGPugX7tq2r15Qm8Id08bNJ5DapyPy5d4TuO2sr1iNjnAZcUR40sOw7crATDo0OVXAajZ5Icz0s/7PuVfk+4kqYWsntP1Tp6MULUekXcfX42HKBco9FBXfF7H4fJtk4aQsPmtGdYFpFGdjZS91FdwGySwpmajTOEf8uv8prbZaYfOuULvLqlnHKUNzH5HvFVoQlMe7tLBoIIzwL/x8OAwAU5tOEgWzhgkxdfbz7pfyrNrVeAYAicMbRKx3WsNfyQyfBekJN+0vA3HB1hNjLkEidQo8dZ+GIpWej+cBRerywkXYzkTq+4TregbEFbE+cDzU5xIwlACRpSxgIUB2ozLDf9oFRus3hA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f99833-ba67-4943-d8f9-08dc9af9ac55
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 00:47:10.8471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2wqUCsnjQbPGfFRRBvjZN0bGRpy1LdROBleYFP4C94YWY2ZDZgdf6q77C0Pw8j6tzBdkoZP/k1fQfKSzLSfcLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4338
X-Proofpoint-GUID: HjdAmfBQHR9fhkrYO4NeSy8uPPQ8nevX
X-Proofpoint-ORIG-GUID: HjdAmfBQHR9fhkrYO4NeSy8uPPQ8nevX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_17,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407030002

T24gVHVlLCBKdWwgMDIsIDIwMjQsIEFuYSBDbGFyYSBGb3JjZWxsaSB3cm90ZToNCj4gR3JlZXRp
bmdzIQ0KPiANCj4gSSd2ZSBjb21lIHRvIHlvdSBiZWNhdXNlIEkgc3R1bWJsZWQgdXBvbiBhbiBp
bXBhc3NlIHdoaWxlIGF0dGVtcHRpbmcgdG8gbWFrZQ0KPiB0aGUgVVNCMyBkZXZpY2Ugd29yayBp
biBteSBjb21wYW55J3MgY3VzdG9tIFNCQyBwcm9qZWN0LCB3aGljaCB1c2VzIEFjdGlvbnMNCj4g
U2VtaWNvbmR1Y3RvcidzIFM3MDAgU29DLg0KPiANCj4gRmlyc3QsIHRoZSBjb250ZXh0OiBzaW5j
ZSB0aGUgY2hpcCB3YXMgZGlzY29udGludWVkLCB0aGUgbWFudWZhY3R1cmVyIHN0b3BwZWQNCj4g
dXBkYXRpbmcgdGhlIGtlcm5lbCBzb3VyY2UsIHNvIGl0IHdhcyBzdHVjayBpbiB2ZXJzaW9uIDMu
c29tZXRoaW5nLiBUaGUgVVNCMw0KPiBzdWJzeXN0ZW0gdXNlZCB0byB3b3JrIHdpdGggdGhlIG1h
bnVmYWN0dXJlcidzIGNvZGUgYXQgdGhhdCBwb2ludCwgYnV0IHNvIG1hbnkNCj4gbmV3IGZlYXR1
cmVzIHdlcmUgYWRkZWQgdG8gdGhlIG1haW5saW5lIHRoYXQgd2UgaGFkIHRvIG1vdmUgb24gdG8g
bmV3ZXINCj4gdmVyc2lvbnMuDQoNClRoZSBkd2MzIGNvbnRyb2xsZXIgaGVyZSBpcyBxdWl0ZSBv
bGQgYmFzZSBvbiB0aGUgcmVnZHVtcC4NCg0KPiANCj4gUmlnaHQgbm93LCB3ZSBhcmUgdXNpbmcg
RGViaWFuJ3MgcGF0Y2hlZCB2ZXJzaW9uIG9mIHRoZSA2LjEuNzYga2VybmVsLiBPdXIgcmVwbw0K
PiBpcyBwdWJsaWMgYXQgZ2l0aHViLmNvbS9jYW5pbm9zLWxvdWNvcy9sYWJyYWRvci1saW51eC02
IC4gV2UgaW1wbGVtZW50ZWQgdGhlDQoNCjYuMS54IGlzIHN0aWxsIG9sZC4gUGxlYXNlIHRyeSBt
YWlubGluZS4gT3RoZXJ3aXNlIGl0IGJlIGRpZmZpY3VsdCB0bw0KcHJvdmlkZSBmZWVkYmFjayBv
biB5b3VyIGN1c3RvbSBrZXJuZWwuDQoNCj4gZGV2aWNlIHRyZWUgbm9kZXMsIGdsdWUgbGF5ZXIg
YW5kIFBIWSBjb2RlIG9uIHRoZSB1c2IzIGJyYW5jaC4gU29tZSBjb2RlIGlzDQo+IGZyb20gdGhl
IG9sZCByZXBvICh0aGUgcGh5cyBlc3BlY2lhbGx5KSwgc29tZSB3YXMgYWRhcHRlZCB0byB0aGUg
bW9yZSBtb2Rlcm4NCj4gZm9ybWF0Lg0KPiANCj4gVGhlIHByb2JsZW06IE9ubHkgYSBmZXcgZGV2
aWNlcyAoa2V5Ym9hcmQsIG1vdXNlIGFuZCBzb21lIHBlbmRyaXZlcykgd29yaw0KPiBjb3JyZWN0
bHkgdXNpbmcgdGhlIHVzYjMgcG9ydCwgYW5kIG9ubHkgd2hlbiB0aGV5IGFyZSBjb25uZWN0ZWQg
YmVmb3JlIHRoZQ0KPiBtb2R1bGVzIGxvYWQuIE90aGVyd2lzZSwgdGhlIGRldmljZSBzdG9wcyBh
dCB0aGUgc3RvcCBlbmRwb2ludCAgY29tbWFuZCBhbmQgdGhlDQo+IHdob2xlIFhIQ0kgbW9kdWxl
IGRpZXMuIEkgdHJpZWQgdG8gZGVidWcgdXNpbmcgdGhlIGd1aWRlIGF0IGtlcm5lbC5vcmcvZG9j
L2h0bWwNCj4gL2xhdGVzdC9kcml2ZXItYXBpL3VzYi9kd2MzLmh0bWwsIGJ1dCBJIHdhcyBxdWlj
a2x5IG92ZXJ3aGVsbWVkIGJ5IGhvdyBjb21wbGV4DQo+IHRoaXMgc3lzdGVtIGlzLiBJIGZvbGxv
d2VkIHRoZSBjb21tYW5kcyANCj4gDQo+ICMgbWtkaXIgLXAgL2QNCj4gIyBta2RpciAtcCAvdA0K
PiAjIG1vdW50IC10IGRlYnVnZnMgbm9uZSAvZA0KPiAjIG1vdW50IC10IHRyYWNlZnMgbm9uZSAv
dA0KPiAjIGVjaG8gODE5MjAgPiAvdC9idWZmZXJfc2l6ZV9rYg0KPiAjIGVjaG8gMSA+IC90L2V2
ZW50cy9kd2MzL2VuYWJsZQ0KPiANCj4gIyBjcCAvdC90cmFjZSAvcm9vdC90cmFjZS50eHQNCj4g
IyBjYXQgL2QvdXNiLypkd2MzKi9yZWdkdW1wID4gL3Jvb3QvcmVnZHVtcC50eHQgPC0tLSB0aGlz
IGhhZCB0byBiZSBtb2RpZmllZA0KPiANCj4gYnV0IHRyYWNlZnMgcmV0dXJuZWQgbm90aGluZyBm
cm9tIGR3YzMgYW5kIHRoZSByZWdkdW1wIGlzIGluY29tcHJlaGVuc2libGUgdG8NCj4gbWUsIHNp
bmNlIEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhlIElQIGhhbmRib29rLiBJIHRyaWVkIG1vcmUg
d2F5cyB0byBhY2Nlc3MNCj4gdGhlIHRyYWNlLCBhbmQgZXZlbiBlbmFibGVkIGFsbCBmdW5jdGlv
bnMsIGJ1dCBJJ20gbW9zdGx5IHN1cmUgdGhhdCB0aGUNCj4gYWZvcmVtZW50aW9uZWQgY29tbWFu
ZCB3b3JrcyBqdXN0IGZpbmUuDQoNClRoZSB0cmFjZS50eHQgaXMgZW1wdHkgYmVjYXVzZSB0aGlz
IGlzIGhvc3QgbW9kZSwgYW5kIHlvdSBwcm9iYWJseQ0KZW5hYmxlZCB0aGUgdHJhY2UgYWZ0ZXIg
bG9hZGluZyB0aGUgZHJpdmVyLCBzbyB0aGUgY29udHJvbGxlcg0KaW5pdGlhbGl6YXRpb24gaXNu
J3QgY2FwdHVyZWQuDQoNCllvdSBzaG91bGQgY2FwdHVyZSB4aGNpIHRyYWNlcG9pbnRzIGluc3Rl
YWQuIFNhbWUgc3RlcHMsIGJ1dCBlbmFibGUgeGhjaQ0KdHJhY2UgZXZlbnRzOg0KDQplY2hvIDEg
PiAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL2V2ZW50cy94aGNpLWhjZC9lbmFibGUNCg0KPiAN
Cj4gVGhlIHJlZ2R1bXAudHh0IGZpbGUgYXR0YWNoZWQgdG8gdGhpcyBlbWFpbCBzaG93cyB0aGUg
ZHVtcCBhZnRlciBjb25uZWN0aW5nIGENCj4gZ2VuZXJpYyBVU0IgcGVuZHJpdmUgYW5kIHdhaXRp
bmcgZm9yIHRoZSBkbWVzZyBvdXRwdXQ6DQo+IFsgICA5MC44MDA0NDRdIHhoY2ktaGNkIHhoY2kt
aGNkLjAuYXV0bzogeEhDSSBob3N0IG5vdCByZXNwb25kaW5nIHRvIHN0b3ANCj4gZW5kcG9pbnQg
Y29tbWFuZA0KPiBbICAgOTAuODI4NjIxXSB4aGNpLWhjZCB4aGNpLWhjZC4wLmF1dG86IHhIQ0kg
aG9zdCBjb250cm9sbGVyIG5vdCByZXNwb25kaW5nLA0KPiBhc3N1bWUgZGVhZA0KPiBbICAgOTAu
ODM2NTM0XSB4aGNpLWhjZCB4aGNpLWhjZC4wLmF1dG86IEhDIGRpZWQ7IGNsZWFuaW5nIHVwDQo+
IFsgICA5MC44NDIyNTZdIHVzYiB1c2IzLXBvcnQxOiBjb3VsZG4ndCBhbGxvY2F0ZSB1c2JfZGV2
aWNlDQo+IA0KDQpUaGlzIG1heSBiZSBkaWZmaWN1bHQgdG8gZGVidWcgd2l0aG91dCBrbm93aW5n
IHlvdXIgc2V0dXAgcXVpcmtzLiBCdXQNCkknZCBzdWdnZXN0IHRvIHRyeSBhZ2FpbnN0IHRoZSBs
YXRlc3Qga2VybmVsIGZpcnN0Lg0KDQpCUiwNClRoaW5o

