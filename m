Return-Path: <linux-usb+bounces-5303-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0251F833211
	for <lists+linux-usb@lfdr.de>; Sat, 20 Jan 2024 02:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24CBE1C2114F
	for <lists+linux-usb@lfdr.de>; Sat, 20 Jan 2024 01:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2CA807;
	Sat, 20 Jan 2024 01:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VrmpNTI2";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ewcJB9M3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="q3q3wGbY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5568C7F7
	for <linux-usb@vger.kernel.org>; Sat, 20 Jan 2024 01:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705713151; cv=fail; b=mFW+tyEMvuYVZkOZUNKDa+k63k9ruOMpK9sYIh4tH4kiMWtGNPZJUTFl3xzaIm1ThHSSNDv70chkhiXbjhqeOUMLWKNMjMp75LkDar/LuXBS/wocuFfEGZ1eTDJZlJik+CJ/0S+Bb8qMTksiRQMkU8LXqH++pDCuHi5ZLQMhY6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705713151; c=relaxed/simple;
	bh=gngGjbfQADDznaORw/cH5oCSRyjcEvm2cxZfRdLddSw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PrlibtBdxHXh+4ckE+rUJ0gLzrEgPG+5D5yQC0TQm0z6PlA5BOz3N/p0YHDKautCuaP0Uiy3xmCsAXf738Q0db4Jv6ZYjdcNrwvh8+y4mYz5k+xMZtz3zyTWa0e7ckrOhP6K5o37FLUTm//qClvJHaEFNoTtvXJi0d7K15Oxffo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VrmpNTI2; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ewcJB9M3; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=q3q3wGbY reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40K15cUr003489;
	Fri, 19 Jan 2024 17:12:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=gngGjbfQADDznaORw/cH5oCSRyjcEvm2cxZfRdLddSw=; b=
	VrmpNTI2XEtZO1xlxgJmDdxIg4Tv+H41ULgVb8y3NNmFyHW75CxIm9NP8Alshlby
	EUAid8piNVNK6IXw3Xitwy3kmixKPFLMi1R4HjpWAlhc03mEgOmQJF5uV/Gq5CXc
	VMsUIAwwNCvLluMOLImaqu0aPdbVRAaipgFbpll74c0+T2zGw2Opd+r7KIr19fXf
	Zj43tcwNGBCoRBfK2Cd1dIzhMua/ivnqq5o5xYW/Mtr968wgt5p6LxU0uz/j7B2F
	LYHNejxEClVSkP4YgQsfEP4l370JbveM6fzmkCBBN+EXuO7YTxzBvbBfoFlrW5gm
	RJY61Y2Ybjr95LfHsfO4jw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3vkt1g2qge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jan 2024 17:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1705713130; bh=gngGjbfQADDznaORw/cH5oCSRyjcEvm2cxZfRdLddSw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ewcJB9M3QHc+Jcp7SGaALp0ji95xqthM7KwuxLibEdSF4HvaZKkmWsx/zadFpy8si
	 IO7AFjTg8rfcQCC0NqBDNmuXdUszFVDh04yGHG1qN741XtVAj6ENnYZJlKe7tS1B41
	 A7yg/scj1dSVfoG9KjViM1BX0EGkWKLCc+/mdxG2ND4/1TtbXEf9cHf/cTyFME3VVq
	 Z3OGkLHTXlD0mxMUlDk6xCw9fikjtYgIi/+KY8fjUgTntPwn1kfJK3cRQYlMjIhexI
	 nm6kyTruTHpFTnPzT9xQJmsM9wANcN2GvpW/qVN2nQUmK2PVv8xTg6034G7VV+0agb
	 WQ250d3gNq6pA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B463940407;
	Sat, 20 Jan 2024 01:12:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 73515A00A8;
	Sat, 20 Jan 2024 01:12:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=q3q3wGbY;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id AADF1404D4;
	Sat, 20 Jan 2024 01:12:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwGFxNaXw7r5DQyrl/tyvh/QU479eRARTibqEH6FvbqbZfJ013f2d1pAw/HcdYXvISjP6aJllrJVdPZNej3QD7yd3pvFpvmfZ/HvehNWObmAmUJ9uwrc1DXn6xp4V8YEWf3J8OYKdKPMvL8Y5ikgdRrY4Hy5oYW25GWDv9dAkA08h0kv/1uHQSXriWYLNqN06BqlnobUVPAq44qfKv/eFmeJjtldXHPC9Qk1bvQ12vKCoMo04AkaS9SgfB1JynQl32mHzVoLwpQfTZc43sDegcRNvfJhvtvk4HL/9pSU+FsPN/2HlGxLrnqHGDLwb7MLzR3QrtmNZbypIhiyyqOpUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gngGjbfQADDznaORw/cH5oCSRyjcEvm2cxZfRdLddSw=;
 b=IdQoewPVUJYl/ZwnQTqVF+GAQNiwSJlAYUKhnFfNDf9zgO4PnMPTqws4WG5PJPTVebN10wzLf0C51B2oqp9uSYZQRy3h/FLp/RVbndCtPkKV1yKmP4ml/Agoiqw78NTt+hYPQTxZ4k4D/b5VsgaC8vfxltAEhwEAOZKNPOFVF7Jeg/7e3Rm1spNm6VkGrJjj0IX+29HpeBvkSqrHFB4X9SHACpcDaUfOxt1RUZubjS4S+tmrMyOICIuNF/AL/iaN7ehn/wshFxHoYkSahvwCanWkhcj2jcVK8XL6aDnB1cMyGkJnZ9Zx3N/mIHSZETMiVQGEbkTOEgHWvsWeD/PDNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gngGjbfQADDznaORw/cH5oCSRyjcEvm2cxZfRdLddSw=;
 b=q3q3wGbYxu6e8Wy5IVO12vZZEIjZMN09CTifocse2EZCWZI2nzdmE+V7hIugui1zlE6L4ydytt84ZRqkzSkCoX9NIXK+80aeYeyQfcT+sn+Z59VB/f1J96A3QC6WAcDkptPD6h/N7Iq4+ROpJTLwyU162/aBRaG4GGaxfvk8OGU=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MN0PR12MB5954.namprd12.prod.outlook.com (2603:10b6:208:37d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Sat, 20 Jan
 2024 01:12:05 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3%3]) with mapi id 15.20.7202.026; Sat, 20 Jan 2024
 01:12:04 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: yuan linyu <yuanlinyu@hihonor.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH] usb: udc: run disconnect callback before pull up zero
Thread-Topic: [RFC PATCH] usb: udc: run disconnect callback before pull up
 zero
Thread-Index: AQHaSp3z3ulcuGmZ70aRoOSeDEQrRLDhOE6AgACtv4A=
Date: Sat, 20 Jan 2024 01:12:04 +0000
Message-ID: <20240120011149.fbrbunf4l7deckek@synopsys.com>
References: <20240119054813.2851201-1-yuanlinyu@hihonor.com>
 <9a483f40-83ef-4476-b94c-21506d94653a@rowland.harvard.edu>
In-Reply-To: <9a483f40-83ef-4476-b94c-21506d94653a@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MN0PR12MB5954:EE_
x-ms-office365-filtering-correlation-id: 0007d674-0094-4fc3-d189-08dc1954d0ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TMLq8vdq19MwOjA5sgw7bTAgj/jx5/nxSUH6OvnDnPNDDrCGHU4josRDuTp4IAo4J6bH4Nx6xuI2KOjce4VD/bJfAmfZn6UdO8y9iaRQWgOnU0cwNrWB6VerIH5gQVJC7Wde5i/ODBv3E+j1l6sqcq5Plp5YXEddgYfygJsnrT4+6M27DLQWWnWg2Cojoo6Lxxn9wRwXnxTh5mBzL0oby5005PWyKMC2GwbTnUixVhsbdO1gXTsi6NES2SwCb6fP9KbxFxcZIO5UTU0nfRJnFA23tbX8UPqiXNrOh8auhO6PZdqK/n5K2bqKVk58wubG/IJIhf3W0DtZT8VOiXcP+aJ1mt+G9AGcH9uisg9oeVVgjG1qx23nIjux74+uIM9lZuAJHZRPhCkyUzlQ96+2Dl1BIT5YhhlAtroT4JQZz9iMEgFdWv6st5yXe7OLjiSCyh/gZssWmryz1qaGBRoHVKRONC690f/XhGpML75nWW6dl9FLD75jeGCQ8lxM4H5SxQbRTMvrG2Mu91ndHxRdEYWHVUGLSEoACnK0YiSP9f6nxxiw79x7s96xVimankyCFPpNtD0ZLP+DQB13lVl80Fqb8/PhTpZp7a/JKG0H2S72q1RkSgzwEYLQ3ElTGjEE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(83380400001)(4326008)(38100700002)(122000001)(2616005)(76116006)(6916009)(66946007)(91956017)(478600001)(54906003)(66556008)(66476007)(66446008)(64756008)(6486002)(1076003)(26005)(6506007)(316002)(8936002)(71200400001)(8676002)(6512007)(86362001)(2906002)(38070700009)(36756003)(5660300002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UXAvTXFFZUprMjNrTllHR1M2N2FsZGVTUmZ0NjcrczFSSXVEaWxsZ3liKzFL?=
 =?utf-8?B?WmJIaSthOVVEUVdBNDZyTlREZ1ZhYmJZQWp5M1V1M01KMlk3d3pLZE0yYmww?=
 =?utf-8?B?anAzYmpKV3VvVisvMVlZRnFrMEFWQnIyYXQydDRvV1NmbHpoR3pEZDZocWNr?=
 =?utf-8?B?Z1l3OWcrREpmZTArNGI4RTFLcnhnT1h3V3lOTXBNdmlCZFdCVVFJb3RrbGFr?=
 =?utf-8?B?Ykx3VjQzVGVzSENZcjdEVWJUYS9HSDUwTUhYY21oVW5nM0lLZDM0MlA5Wk1Z?=
 =?utf-8?B?dVZTUlNqWS9ITTlLeDJiTE42Qis3UVRqUjl3dEJLQVJIdTU4NTFOazFuUTJx?=
 =?utf-8?B?UElJdEJDUlkvdGR5M25LeDFPb2ZUaUw3TklTYlJmVlBzcDZyV0YreE41YUVK?=
 =?utf-8?B?b0ZqbHpsYkFWWHNURFdPQzIzK2JiMDZ6a1NRS3hnS1hLRlZBUlhqeExmbnIr?=
 =?utf-8?B?MEp5Nng3eGE5OEFUVU1DbzlZSjhXK0hQYlE0b2s2MGppL0FQOUpJazFwREg3?=
 =?utf-8?B?dGgxdjFRZWNvUlBvQ1l1dDgwYk9yZEFMUnVEZnk1OTRtS2pKa3pGQno2di9Q?=
 =?utf-8?B?N0p1bG16MFRObFl5VVlOOUhBUWlVWGtLQ0E3U0Q0Uk9OK1ZhTVA0SFF2Q21G?=
 =?utf-8?B?SXpPaGFwM20wcXZNK2IyNzFQbmlhME9hczlrNk1yQW5seHVqTHNybklDclNG?=
 =?utf-8?B?U0JMakIvb1ZXZytBdU0zdjNueUJiNEk4Z3MrTnJ2OGh5VWhkRmhPa1d6K1Rx?=
 =?utf-8?B?TGdQNFNka2VNN1lSTGhRZEpKSENFTjJzaERnMFkwVjJwREhzQ3JBYVFUNjR2?=
 =?utf-8?B?dWQyT2ZRNW1DV0xJYmdINXE1Uk9rWVo5TGtKMkthZjhNTTZnYkQzdEdPZUZS?=
 =?utf-8?B?M1U0YUJnb2JrN0tvNkd0MFY0UVpiWVFUdXhYSkxpWmtUTkNRS0t6SHljeVpK?=
 =?utf-8?B?cThkbXV1U1Z4d2pwbkY0dXlac1M2QlBxTE1ySFZiSlNPbSttbktyN3pXbllG?=
 =?utf-8?B?MlJBc0d1SjdBNWRUT1NLbHpVY1RneTJHeWFNNE1RMTNrQjNzTmF0VkdtU0F3?=
 =?utf-8?B?QSt4U3JaSkloUmltcW9jRUNQdmpwYnB2R2RyK293c1Zrd2RveWM4RUdvQUts?=
 =?utf-8?B?UU9JWFpFN3RHamttaDJyeW5pVHpTSHRUaUxaTThDS0xwazVWekR5YlkzTzhn?=
 =?utf-8?B?bGtidlVSSVE5WWM1MGUyUWZnZVVXSE9qNnhWY2FqNm14S3dSMGE2ZW9oaGJD?=
 =?utf-8?B?ZGtiK00rUm9xUDJCUGRUczhjZ3JZK3JDWVhoOGU2QUFheFpycnZhODFhRmcz?=
 =?utf-8?B?NHRlQlBqVGRnMnYrNG5PWVI5b1hXZms4OUdML255YTlKRXlxekk4K2QrT1p5?=
 =?utf-8?B?ZGMyV0pSc2s2bGplMFY0dG1tYjVUSzBCMFNIdHlLSDBjMHp3MTRTQW1vT2VH?=
 =?utf-8?B?MEMzSDN0eUFGZ0V2K014MVFsRjJFSkl3Z09PWGc1eUxJUFRnZ1NTUU1WVElq?=
 =?utf-8?B?RXIxVWFQeWY3MFZiS3RFYVdXeUd0aDloQW5hc3h4bzd5YnFhSGFDc2xGZWU4?=
 =?utf-8?B?QlBvWi9MTUdoUFlqQzF0aVhaMDRPaXJ0RkZtTTE0MU1PZXB4MFdlaGFXMXNG?=
 =?utf-8?B?M1RCY2FIMHNpUWRVQTVYT2JzZ01PU1F3cmx5RFUxY2VHZGM2aEZwUXNCc204?=
 =?utf-8?B?OGRYRUxkRTRQdGFqZXNKdzZVZnZYdnVmT0daVkNaVFBFRlA4YUpVbGJWeVRy?=
 =?utf-8?B?TStuWFU2Q1ZTaEQ2M3RlaFk4MDJoSWV0amxUOHk5TDQ3Yk11aDNYRUZvajJs?=
 =?utf-8?B?UGpwMXNPd3pPakswMkRwYU9HQTV2alRXTzJCQTY5VDJhcUJvcjNBNXQyOVNv?=
 =?utf-8?B?d1dScERQbyt1NFRWYjJPK3lUYXdiOHF2V01US1hRTklFaW90YVRHNzFxMDlE?=
 =?utf-8?B?dEgrdCtseVpLYlFUVjZTY1ZOQ0xqVjFPbVFuMURNRzJ4QkphclJvMXdpaHVG?=
 =?utf-8?B?VTZxc01MZ2FVN21yWmkzQy9uQlVhMFEvaGJQeEFxVEtySS84NnZGdnV1dHgw?=
 =?utf-8?B?Z1k5Nnl3alhkUHBIa0VDNzhPLzFyRWRqZW02YXhpVGs3NjNkZ01ISWZGZEVL?=
 =?utf-8?B?QUpNZkVhYzhwNjFGNnNEQUpETEFaTE9JSFhFdkgzSXpLTGEzQ1hvaDhyUEow?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0DFFCAA5C74954D963739C0DCAC3B5E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	g9HnhIx4hPQ5tJ2aYXMZLjHSEZm7rEBS8W8ChX1roVWmbbCafZwnIDBer5PvsjhnWtIwoPN6qQJASGxibqxVW6FgVDBt37HvJCDHnKQDhNAMKm6e+2SY5lHDaZBojOBipSg0OvlbnNhJBkzvhPctiBOGPZxgB6FqYv4PuwPp3mqXoGVW9E1naegnwHReBBn3QqEOnox/kQXPG47zl0LjrBuhmGtCEVNiseIgGDISNJsEhtWbWK2Y7e1varJRsRPvoLj5cWxZB/NRjT8UIVtXB7ZQT82TQCz904/FkorQRY4nttnWjdIXyHFDCMmPfcr/JBUVQ3QVWbTNsNmFf0EhRUM6bZIQd4cOdlbDmLQlCCz591sFS28HXzSIUZI4FHs6ZFpGrNXX9BulcfskBeizpXl4418qKNd1CRO3bOEWFnZQsXd24/DX/AiasEJq84A5csPtvNQnzyg91qd/rkXr2zYWWQUzT5GRLlYUaclswoP2Ksi6BQnLX3Oqzr6JRceD82IkFyY3hvsoOJqvCSKt43uVU8Mv65d3CQzL4lx6aKciwlEC33J3XQnyYnTUS9E6Rm1wOQSPTCXKHpeHlyftu6ePs7MtnrVRLgL8UwKjIG6OHcy2melI1JWrqIKofeCWYCD4xp5powPLdGfT+2wsTA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0007d674-0094-4fc3-d189-08dc1954d0ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2024 01:12:04.8105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yz4acZQ+J5Hu5mr9NzYEVqqM+bDDZQ/+z1foA0jJfMCsvaPsaZjiDp7pxswn9IEXOG//i3b5aWk0k541oeBHew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5954
X-Proofpoint-ORIG-GUID: 1Mp36M6hz3GI0jz0K9huyrp1x_Hc4Nto
X-Proofpoint-GUID: 1Mp36M6hz3GI0jz0K9huyrp1x_Hc4Nto
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_12,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1011 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 mlxlogscore=541
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401200008

T24gRnJpLCBKYW4gMTksIDIwMjQsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIEZyaSwgSmFuIDE5
LCAyMDI0IGF0IDAxOjQ4OjEzUE0gKzA4MDAsIHl1YW4gbGlueXUgd3JvdGU6DQo+ID4gV2hlbiB3
cml0ZSBVREMgdG8gZW1wdHkgYW5kIHVuYmluZCBnYWRnZXQgZHJpdmVyIGZyb20gZ2FkZ2V0IGRl
dmljZSwgaXQgaXMNCj4gPiBwb3NzaWJsZSB0aGF0IHRoZXJlIGFyZSBtYW55IHF1ZXVlIGZhaWx1
cmVzIGZvciBtYXNzIHN0b3JhZ2UgZnVuY3Rpb24uDQoNClRoYXQncyBleHBlY3RlZCByaWdodD8N
Cg0KPiA+IA0KPiA+IFRoZSByb290IGNhdXNlIGlzIG9uIHBsYXRmb3JtIGxpa2UgZHdjMywgaWYg
cHVsbCBkb3duIGNhbGxlZCBmaXJzdCwgdGhlDQo+ID4gcXVldWUgb3BlcmF0aW9uIGZyb20gbWFz
cyBzdG9yYWdlIG1haW4gdGhyZWFkIHdpbGwgZmFpbCBhcyBpdCBpcyBiZWxvbmcgdG8NCj4gPiBh
bm90aGVyIHRocmVhZCBjb250ZXh0IGFuZCBhbHdheXMgdHJ5IHRvIHJlY2VpdmUgYSBjb21tYW5k
IGZyb20gaG9zdC4NCj4gPiANCj4gPiBJbiBvcmRlciB0byBmaXggaXQsIGNhbGwgZ2FkZ2V0IGRy
aXZlciBkaXNjb25uZWN0IGNhbGxiYWNrIGZpcnN0LCBtYXNzDQo+ID4gc3RvcmFnZSBmdW5jdGlv
biBkcml2ZXIgd2lsbCBkaXNhYmxlIGVuZHBvaW50cyBhbmQgY2xlYXIgcnVubmluZyBmbGFnLA0K
PiA+IHNvIHRoZXJlIHdpbGwgYmUgbm8gcmVxdWVzdCBxdWV1ZSB0byBVREMuDQo+ID4gDQo+ID4g
T25lIG5vdGUgaXMgd2hlbiBjYWxsIGRpc2Nvbm5lY3QgY2FsbGJhY2sgZmlyc3QsIGl0IG1lYW4g
ZnVuY3Rpb24gd2lsbA0KPiA+IGRpc2FibGUgZW5kcG9pbnRzIGJlZm9yZSBzdG9wIFVEQyBjb250
cm9sbGVyLg0KPiANCj4gRXhhY3RseS4gIFNvIGluc3RlYWQgb2YgZ2V0dGluZyBhIGJ1bmNoIG9m
IGVycm9ycyBvbiB0aGUgZ2FkZ2V0LCBub3cgDQo+IHlvdSdsbCBnZXQgYSBidW5jaCBvZiBlcnJv
cnMgb24gdGhlIGhvc3QuICBJIGRvbid0IHRoaW5rIHRoYXQncyBhbnkgDQo+IGJldHRlci4NCj4g
DQo+IFdoeSBkb24ndCB5b3UgY2hhbmdlIHRoZSBkd2MzIGRyaXZlciBpbnN0ZWFkPyAgSWYgaXQg
YWxsb3dlZCBlcF9xdWV1ZSANCj4gb3BlcmF0aW9ucyB0byBzdWNjZWVkIHdoaWxlIHRoZSBwdWxs
LXVwIGlzIG9mZiB0aGVuIHRoaXMgcHJvYmxlbSB3b3VsZCANCj4gZ28gYXdheS4NCj4gDQoNCkkg
ZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGRvIHRoYXQgZWl0aGVyLiBXaGVuIHB1bGx1cCBvZmYgb2Nj
dXJzLCB0aGUNCmRldmljZSBpcyBkaXNjb25uZWN0ZWQgZm9yIGR3YzMuIHVzYl9lcF9xdWV1ZSgp
IGRvYyBub3RlZCB0aGF0IHdlDQpzaG91bGQgcmV0dXJuIGVycm9yIG9uIGRpc2Nvbm5lY3Rpb24u
IEJlc2lkZSwgaXQgd2lsbCBhZGQgdW5uZWNlc3NhcnkNCmNvbXBsaWNhdGlvbiB0byBkd2MzIGhh
bmRsaW5nIHRoaXMuDQoNCkJSLA0KVGhpbmg=

