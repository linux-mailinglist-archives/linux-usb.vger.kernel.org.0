Return-Path: <linux-usb+bounces-16878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 067609B7201
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 02:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8C64286F33
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 01:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DFB2E628;
	Thu, 31 Oct 2024 01:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tEXngJPl";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RsqTbRev";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OzN2vDvs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3518348CFC
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 01:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730338462; cv=fail; b=NXbgtq7c2cOpeqZESPdYbpov8lSEKN18wj1viS1YDaU65IjUiSoZVb3ED9PQaW20m88Vu1SkG658ALywe1+2ea7ZSF6xn7SsdbkenlLaPpI5FWTUDeuJsdhSWTr76Wm+8RRsweeRsGlOimCBtfhlMDHZRJLfqBAMIDWmOl4Oy/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730338462; c=relaxed/simple;
	bh=I6dxDx3X2PVvEEFv+kOupv3NXYr7SD3/3WBEk6aLNI0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a9lNsYAyIsG9LPf++K0L0jRxe3sK4IwHJyjajUGJOIzhJfvn3wtecALAIguPw0Fzw5a9gzUPKv+ilFoqpvNvt3xfiwahoCdnWIdB+v+eu+lIwkra4KHFT8ISh8I1S8317108Sy7VghAP2TtEOxWTtSxKiqoPcnTV3eoHR+teIo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tEXngJPl; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RsqTbRev; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OzN2vDvs reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UKORCa031385;
	Wed, 30 Oct 2024 18:34:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=I6dxDx3X2PVvEEFv+kOupv3NXYr7SD3/3WBEk6aLNI0=; b=
	tEXngJPle03pPiCzEdzLk0LfCBA+qftYa8X+R0R6SXeMjzmqKmrixqP+kcG45pTA
	S91x+GfUGl1dhgqxExR6KflcuS5/fM2Iki4MhIP1WSP04AmgEBnSf9u/hTTrMeQJ
	qoVYli2M2QAz3ljPtNK6SSkg9+JVii86nep4LjifvYXCyqZAKHPaJsJptS7H6A5b
	IvqjvKmHjXvT9J/bZC35KxP7+jbJeHB7OfC9UwIcbp1Dc43JJuBhcRDJUMbu5zwj
	vQ5xBPF4zUj7JE71tmlzV1RtQKfjrKZ8aPdTDy2Dd7pTYTYIvNAZWYR1BO/jqHLz
	5YvoQoZpYBBX1pYN96lkOQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 42gybwbjt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 18:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1730338440; bh=I6dxDx3X2PVvEEFv+kOupv3NXYr7SD3/3WBEk6aLNI0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RsqTbRevosNHqb71WjBZYtGmm3uMrGZ8NJnSDKTccXt6eXhGyMEgtCnNrWSoier9A
	 7mnd01SftVeQ6eBXj4zUYo1qvhSE1HK2Uce0hz+khzyleiCo0aZUWyu4J6AVKhYqcG
	 gzZNPGUro2GGOpfbNeS06pp52CH0yTzs1AxsfsenUGD+e5jGWO83j1dbfx6Z7Vec61
	 yfNcQmLhp5DRfEqvHs/3bcZJP6u4gEDkC5WccqR18JMXxV7YYt0qv3nWU4z1U4UTVO
	 Nb9WCzuunLMNh+j+wVgWiFHEea4JSFXf9nsxxlxjfkLdx/G+1tjmTAfpo/WQ9OMvb0
	 XAseMEQNwxU8g==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 17B8B4012B;
	Thu, 31 Oct 2024 01:34:00 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D637EA0096;
	Thu, 31 Oct 2024 01:33:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OzN2vDvs;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 69FE24011F;
	Thu, 31 Oct 2024 01:33:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKYx82z+p4O402tpYZrfcO6MwHsMAiET6AV7rPRCxMFAsINPbtkkXjBqDilQDs3kz58+Y3BHYxh+zyJUWZFkuDh54Fgv+Xqk6bZhqiKhKwpqv8qfAwEJBruaAFg/KMzRCPoiaDJLFZX5VfrOjqFlIEYh9CIZXV/AcIdhajMlQzeS7my0zTWykX0maYDosrR29pi8D2nEYw9JPrEWpGJdJzL6qIZXsX/0p8LafXNHxviGnSqFxv8sjABvxGDFAO/gctMzBl6M27ZbW4W0Lao/B2YkfM15HY8wozPu4t59iIZL5gzKjjMWshXH2ePCZukhIeNCVle7gFtUgAceo5aSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6dxDx3X2PVvEEFv+kOupv3NXYr7SD3/3WBEk6aLNI0=;
 b=a8biGNUs/ZjVcmccV3QizkUnCJB5+Ydn2FhseezWIlsiurVFLTwKUrtix0GYNxJ/pKZN2stgvkeMPGzXwqqnGIskuAzj911KtXYOznoMdkuCbVUJLCTCjql++3bjnjZKJgld+fNedUL8e30RZncnjLg6cFYmqF2/zOVOnJNxzqjV/ovvKrDdzcv+yoAwmtEZnsTi6Z6z+s6GFdIxUd3ZVW8856lOsX9J+tbcWQla4SyvBmzFBA+O3RQ6kOjqb9bK0VWPKBCcgzn3nRhtlP5bRNufj3DV3qmNOKmpa96HhO3oCiv/WSQkW9pUJAAZhsCqWmohglexRTWBO6b+B4g7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6dxDx3X2PVvEEFv+kOupv3NXYr7SD3/3WBEk6aLNI0=;
 b=OzN2vDvs37vIkBSuG6Ket9bGhfpjVB5P5czmZZDoJ6jgKqFYiVbNfgIdJrNBuVWZufmFYoiy/CK5tcKWvqm6SLRyBEuyxKj3W92ka4QypjLWs7LO3GothQJvS8oAhrVwaOiH9peGfru14B7rixg7eEXIk/pQDt1+zkcFR/i517s=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB7223.namprd12.prod.outlook.com (2603:10b6:806:2bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 01:33:55 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 01:33:55 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chris Morgan <macroalpha82@gmail.com>
CC: Roger Quadros <rogerq@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
Thread-Topic: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
Thread-Index:
 AQHakFeioIjMhcyoIkClbCNPPNRvWLJpHmKAgC/myoCAADfOgIAF5FQAgABnfwCAAPC4AIAAdCSAgABbi4A=
Date: Thu, 31 Oct 2024 01:33:54 +0000
Message-ID: <20241031013353.cgxjqgboz6hcy4xx@synopsys.com>
References: <cover.1713310411.git.Thinh.Nguyen@synopsys.com>
 <e8f04e642889b4c865aaf06762cde9386e0ff830.1713310411.git.Thinh.Nguyen@synopsys.com>
 <1519dbe7-73b6-4afc-bfe3-23f4f75d772f@kernel.org>
 <671bef75.050a0220.e4bcd.1821@mx.google.com>
 <20241025224003.yfujqurxhrgzgzld@synopsys.com>
 <CADcbR4KhWdXpynk2c-tryx1=Eg4LhC4t=C6zcVHAMcMz2hH-8Q@mail.gmail.com>
 <20241029224900.by3zglncf33izsgw@synopsys.com>
 <ca4daad3-9a34-4331-9faa-91b960924b9e@kernel.org>
 <672291b9.9d0a0220.1f040e.013f@mx.google.com>
In-Reply-To: <672291b9.9d0a0220.1f040e.013f@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB7223:EE_
x-ms-office365-filtering-correlation-id: 9a9496cd-2f56-4ed6-2c08-08dcf94c1555
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U1NSZFYzcHdodGQ1RGlsWjhpWjEzbUUrM1JpL1lnRjFwTW1nQzBwajU1NlRw?=
 =?utf-8?B?SHNyVEpOYXBsUmRVdW1xbm01UmFiTjI5ZWltQjVuUE9OUVpwSitRdzF6OS9M?=
 =?utf-8?B?dEtGWi94MGlPTWdRNzJEQlNLMkN3b0dRZ3JZQ2N4RTBNZUtZZXh6aDJ6aDZh?=
 =?utf-8?B?ano2VjNYODR3K25VN0NJZkovbUZuTmQzdWQ4by82aGJ0M2N3M1dkMTZ2VmVJ?=
 =?utf-8?B?dGdaQzRYYldJOVJNRHVKZ3ZHdU1pNW5hWS9qQTVsZkVWejJOOEJHdyswZWhj?=
 =?utf-8?B?eEtWaW9ML3VBYW1PYkp0Mnp2bzVaTWpCZWphQTh3cGVKM2E1eVltNnlNbXIx?=
 =?utf-8?B?NXNNWlZldk5WUEFOZzF1bStXcmVNdE1xTTYxNXFhaVFkTDROTHNMSENkNnl3?=
 =?utf-8?B?VkFRQlI0VHdwWDdFRUJyRWFvclVZdGMxMFRZNFZjMzBmaVJES0RuQzBZSzlP?=
 =?utf-8?B?RktBQng5cFIxZ1JuOFFLSHV4L2NPUGp4UU9LaXFPaUhwMGV2NWMzVnUzODN6?=
 =?utf-8?B?cFVUaGdDVFZITnowZENSdmZ4ZUFuYVlVS3Y2VDdaTTd0TDJKRHUrMU5FVmdh?=
 =?utf-8?B?bmI3b0Z6QldnelhqNGVoWGJ6VElHNWVNMjdJbnJSS2pCS2FJSnJJbi91REpX?=
 =?utf-8?B?ckdNcW45SXQ0bW1LMWIwam51Q1JqK3BodmMzMXQvNDlLay9YNmhjV3RrU3BB?=
 =?utf-8?B?OEpZam1LZnhFWUF0R3g5UDZSMWZBb1VLR3JFY0o4NkdkSStOc3lsWHlJZE1i?=
 =?utf-8?B?UjNWWlUvR29QRy96bXFNdnRRenRKUGxOSlVxWml2Y3BpNFovTUFwRlpRUm53?=
 =?utf-8?B?VTE0ZFYzTUZpemVkT25tVWlEMWlld2ZheU96ZTFaZFR0cUdPZ3lJa0pLYlUy?=
 =?utf-8?B?V3NrZ0hyM2JObnA1QVkvN1ZEYnpGTHRKK0VpcCtTS25IdXp3WGFzWlBtc3BT?=
 =?utf-8?B?ZnJwYXVTcFl1Tk95ZUxqWEV1cDZTNDlHUFd6ZXNkMjBvRFQ1QS9kOWV2VUtJ?=
 =?utf-8?B?RGxkdnI3Q2M4dHdNYzNCKzNxYlVmd256SEZVT1V1QnJKcnRJWk9GREhaa3h0?=
 =?utf-8?B?ZHN2RU9oVG1QVnZ0d3FTeFpBd0ZaOG5tbWtKZG82MzF3VXc2U01aYlpMUURJ?=
 =?utf-8?B?a1hFSXpiQW9aaUFkWDBaYkVBbmt4dkFoOWNXZXVoVm1ZSzQ4b0hUaTlRWDhM?=
 =?utf-8?B?MWlPTjJiRm1SOXZ2d1NCZzBmcEJuQUQ0RUoyUStkaG94S2p6b2tXdFVLdW90?=
 =?utf-8?B?L1NqUHlHOHZROEttMkxpR0JVQ1FjZ2N5dDNidGkrbjZQNXJqdG9LekwzTmRT?=
 =?utf-8?B?NGs1TVdETnRtTGJtcVRWTm54bjBzR3hVUEZzTDhqcUFBU1ArZFh5YXpkd0Jl?=
 =?utf-8?B?STRucVE0QzYzV25FVXo4dHVlYXVkTUtJeGZKZFA5aURQWVQ2b2lueDJ0U0pv?=
 =?utf-8?B?ekxob1lEWnlQNVRnakxmcUUrRGNSTDZoK0x5d2ZBeEw2YS9xRUM2Ukc2bTZy?=
 =?utf-8?B?NWV1TU1YMENHTEhMOFg0SkZzcTFGKzNBN2NJZWlETm5KSDhURzBsOG1xcFdk?=
 =?utf-8?B?WFJNOXpwa0FiT1hBdDZJRjVhdEZqZGtqb0NobVRjYzNoMXJzYjR3NnlqekJD?=
 =?utf-8?B?SHRwSnNrbzNhak4rS2ljcS9KeDQ1amE4WjlPWnlnR2xRRGlrZWZRRVJ3WFo5?=
 =?utf-8?B?L0xlblJDVHpiVW5Jd3l3dmJyOEplNzhvSHlDQlJ2MXU4MERVNTR2d3dnUTBt?=
 =?utf-8?B?RkNXVDQycy9IbDFnWnR6ZWh1ZkJRcUpzMEdOVTZwaENBTFpCYUNMWTFZNmlQ?=
 =?utf-8?Q?Cd31QqngekELI+DSYRXbV1fRusk4TXGpQn/pA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SVh0dXFHa1JWUnMweUFYQTE4RDVyNWRSVExKbFZhL08rS3MzWkVaNmJuV2Yx?=
 =?utf-8?B?WEw1Wm1wMWlSNTFYUUlCaHJTRUUyalBJdGFDbHBsMVdhc0tBSFZmT3hOM2pX?=
 =?utf-8?B?VG9mZU14R2ljWktRS2MrWit4V0ZSaDRQU1h6bTJaek5PVklUT1U3MWlUZEt5?=
 =?utf-8?B?V3lxd3p3UjA3czFFYUkwYXRDTDJ3a3NRNDJNNEJ3NTRnTXlDSXFzZUQ0d0JN?=
 =?utf-8?B?YVdGemxQU3pPYzhzMDRCRGNJOVdDNXZTNnJsNS95QVJRNUxVY05Vd2wvL2RV?=
 =?utf-8?B?aWcxOWlxMjVEbi9BSlBzMWx5dVdZTDhyalA3MmFnajltNnR0cHZBVDQrcHJO?=
 =?utf-8?B?aStxSkpCWldRYUhWRG1lNVlKS1dOa3JSZTNUZE9mZ0htdlg0cWs3ZGg5MUVC?=
 =?utf-8?B?SUtnNGlkSk5VWUdVYW0yakxKZ1prSTJSKzJBSytUVEhubXlNRjVNa3JLODZV?=
 =?utf-8?B?VjZtanlFVGpsVXA4Ykk3TlVwQ3RiTVltRFVNNFZtQWFBVDByRXNiTXhwMjg3?=
 =?utf-8?B?KzZhYmVwcW5YSDR2WkJnRWg2dCtLaGVkUVZGUEhQK2ZnTFNCVHhyWFRaRzFW?=
 =?utf-8?B?ZCtPTzRRdkt1YVpjSXg1ckZtNGNobXZuN3FUb3BTS3dFU0FoRmZtZms1QzM4?=
 =?utf-8?B?eWppYkI1WFhWUUVlZmxJVFllUVRzWmZTM3RpRFdLY2l2ZEx5V0pzVlNVVmNu?=
 =?utf-8?B?cXZITU9UTEpvZkxOdDZXWTZ1K1lmdTV2Q2hwN3I2S3VoajY5aW5aTmlDYnpp?=
 =?utf-8?B?NUI1YWtLMlRCODNXNW55a05wOE5CYS9XVjR3YVJRRHFtMUJvMjB2N1VzemRL?=
 =?utf-8?B?MkVOQlV0SzRKZjdYQ0FKWW1aZmVGTVdpQ3Y5N2tRa1VaaVVkM01GMVRpU1g2?=
 =?utf-8?B?bVdEU2ZRVGxmUmoyeVlMZkZtdjZHRDlBNlh3OFVoQlg2NmU2bjJTSDdDcExP?=
 =?utf-8?B?STdadUVJUGJxRnduN09GeGtyRTQ3TW5oTnkvbDlVeEhFUHBvYXF6alFCVUZL?=
 =?utf-8?B?UzZtQmZHQVp0b24xa2FiR1g3T2VaQlB2amViV0tNcmxiVmRMUnJFa0NIeTlS?=
 =?utf-8?B?NzJmVjViUEcvWk9YeXN1ODBNY1ZvTnhWQldsSW04eE11NHpRSWFxTGttc0ZN?=
 =?utf-8?B?cFVVcEh2dFRWMGd1VlJQTENhZmVhQnhBaGdndWhvelRDMm1FSFp4aHJYTHQ4?=
 =?utf-8?B?VGN0RHVMZDd5TWx0MmVSWmVDd1lrZW5rTFBUYUJ2OGpldHZqKzRuU0pCYUVB?=
 =?utf-8?B?bUp6cWNxRHRnaWJTbnFzMVd5aVNnQi83MG94cDJubGV2RzJVSThHdXJiOW9s?=
 =?utf-8?B?NWsyUkpRbFVmMFR3WFRXVFZnVTVOenZqeFA3aHp6VWQwZWJ5TzVabi91Njhk?=
 =?utf-8?B?N25aS2RqN3IweVFBa3dNaHhOeHVaMzJSd3hScXZKb2tZd0RheTR3R3dZd1c0?=
 =?utf-8?B?ckJrTlhIUnZyZjJET1UwS2VSRWFTaHJFN1NrQmJrd2EyV0NLTzJNSHovR08x?=
 =?utf-8?B?dEIwdXpIa09KcDdNRFAzY0JmcUgwTHJxVnZjRG5veVAwUUs1dWY4OVRoSDFV?=
 =?utf-8?B?SUpGVXB6TWdjcW5vU2ZXSHBGejZQWGZLc1laQlhkVW5iQ1IrZmlYUEwxclVt?=
 =?utf-8?B?eUVjekNFQXBoKysvb3RvVzRlRGI0TkEvN0EwaUIzOGdScndkdUJWUzJtRm5W?=
 =?utf-8?B?Y1BXbEc0czFEaGhseWpNb3dZS0docjNpaTQwVkkra0lWRGxQdHJreno3K3Fl?=
 =?utf-8?B?cE5lVkQ0QzNQSVVTb3IyZGNDUVlmcURWQ3dTWlBPN0lPUVRlb3FzUUFsemZi?=
 =?utf-8?B?M0hLOUdKZzBRNzZwMGI3dVNhdzNnYUU2cVhhSEVrcGhPQk1WcHJMamJvMk93?=
 =?utf-8?B?NmRkc3BTWUlDSjdWbnE1MysrcXhTRWViQnhGUC9ieHJmbElaSXdHSXljQTIw?=
 =?utf-8?B?TWx5L3cwMzh1OS9iOXl0cFdiVHI0bjdoaDJyTmE1UjRrNlA1dVZ4OXcwVWVZ?=
 =?utf-8?B?c1ZYdVI0cXR6cHZzVzFmQ2dLRTRBbnVLeUUzaS9mcW1OUzFONDF6Unc0eDQy?=
 =?utf-8?B?SnhXYjEvSlRzWFRCbkI2TCt2UU0rZE1VWmdsSEIrUE95OXJ1Vjc1Y2ZtYTBm?=
 =?utf-8?Q?JhuEBVXTKFuuXwJE3SDxu4g4d?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E7B76D1C9234049B0F8CD19C379A278@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NYm9SUKN4CEEQA4akVXuIL4YOfGsW+bZz627ZOGTBAfd4IXFZzXorpbfwPPYLPml8XOWRfgF+7Goy93yjLPTd2vuRZUUPePCQnNZBOGf9vNPCAxYCgW/LfnntSBesQroCM9ssFwwJqMlgfRgndMAf4bHA8+/u7Pf1G06UyAcpUKhXM0KD7v4jDsHSEsNrM5g9rJYfUniPCtDcVCKAWbd08pUoRJP+Ob1kBsLkGX+tPrwZ3H5UFl3DGleAqS13tJjv+8vx3DosaSOXLBrB6vqQS6nwJzNd/YR4BWAY2YoSY0DOXe2HlEgCGaKWTwpOmLEFcyltNly51dQ4JFRFWXXqiLq4do8SIR+Sb5SuKVB8bFI5OqVnh15JC6WWjX3aP41XfUXQUZeTlAoN8G9uEsYRBUaLOlEGGloyOo72hy8//+GrGMjPL/F682KhvZ97Et9PgZfU2zyd0bDm0fP7A3fOrnCM1pobfzX+x1jTtwxGneVagIivRkW90icjl/yJ1kLrTJ0fPoJTf8ox04OAeJsDHUKDlsjBeYQjiksStQokh9n6J9P4JYT2u0IHLpWsHCVxr0hx+vDe4/U+2lf+RaDfmQQFvubSrz4tWgs8rCIPxy54PFCSMoWaMxj4mZmT+enciPbzSx5UwUtdBEBT4eO/g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9496cd-2f56-4ed6-2c08-08dcf94c1555
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 01:33:55.0152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uCzOFvi8yirVEr+tQzMuienZtf3Ksu3y3MO9CRE5IwUP0wytR5UXhKiYwfa2TWYoBqpGcKXIsvZ30xAEJcwI0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7223
X-Authority-Analysis: v=2.4 cv=Av283/9P c=1 sm=1 tr=0 ts=6722de89 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=nEwiWwFL_bsA:10
 a=qPHU084jO2kA:10 a=wF4RIZ3Zjk_SziI4kR0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: vvtfp7c0Z6Iw7TIg1jGPMvulfhXyDVJ7
X-Proofpoint-ORIG-GUID: vvtfp7c0Z6Iw7TIg1jGPMvulfhXyDVJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410310011

T24gV2VkLCBPY3QgMzAsIDIwMjQsIENocmlzIE1vcmdhbiB3cm90ZToNCj4gT24gV2VkLCBPY3Qg
MzAsIDIwMjQgYXQgMDM6MTA6MzRQTSArMDIwMCwgUm9nZXIgUXVhZHJvcyB3cm90ZToNCj4gPiBI
aSBDaHJpcywNCj4gPiANCj4gPiBPbiAzMC8xMC8yMDI0IDAwOjQ5LCBUaGluaCBOZ3V5ZW4gd3Jv
dGU6DQo+ID4gPiBIaSwNCj4gPiA+IA0KPiA+ID4gT24gVHVlLCBPY3QgMjksIDIwMjQsIENocmlz
IE1vcmdhbiB3cm90ZToNCj4gPiA+PiBTb3JyeSwgdG8gYmUgc3BlY2lmaWMgaXQgd2FzIHRoZSBm
aXggdGhhdCBjYXVzZXMgdGhlIGlzc3VlcyBJJ20gbm93DQo+ID4gPj4gb2JzZXJ2aW5nLiBXaGVu
IEkgZXhwbGljaXRseSByZXZlcnQgY29tbWl0DQo+ID4gPj4gNzA1ZTNjZTM3YmNjZGYyZWQ2Zjg0
ODM1NmZmMzU1ZjQ4MGQ1MWE5MSB0aGluZ3Mgc3RhcnQgd29ya2luZyBhZ2Fpbg0KPiA+ID4+IGZv
ciBtZS4gV2l0aCB0aGF0IGNvbW1pdCBpbiBwbGFjZSwgaG93ZXZlciwgc3VzcGVuZCBmYWlscyBm
b3IgbWUuDQo+ID4gPiANCj4gPiA+IE9rLCBSb2dlcidzIHBhdGNoIGlzIGNhdXNpbmcgaXNzdWUg
b24geW91ciBwbGF0Zm9ybSBhbmQgdGhlICRzdWJqZWN0DQo+ID4gPiBwYXRjaD8gQ2FuIHlvdSBw
cm92aWRlIG1vcmUgZGV0YWlscyBvbiB5b3VyIHRlc3Qgc2VxdWVuY2U/DQo+ID4gPiANCj4gPiA+
ICogV2hhdCBkb2VzICJubyBsb25nZXIgYWJsZSB0byBzdXNwZW5kIiBtZWFuIGV4YWN0bHkgKHdo
YXQgZXJyb3I/KQ0KPiA+ID4gKiBXaGF0IG1vZGUgaXMgeW91ciB1c2IgY29udHJvbGxlcj8NCj4g
PiA+ICogSXMgdGhlcmUgYW55IGRldmljZSBjb25uZWN0ZWQgd2hpbGUgZ29pbmcgaW50byBzdXNw
ZW5kPw0KPiA+ID4gKiBDYW4geW91IHByb3ZpZGUgZHdjMyByZWdkdW1wPw0KPiA+IA0KPiA+IENv
bW1pdCA3MDVlM2NlMzdiY2NkZjJlZDZmODQ4MzU2ZmYzNTVmNDgwZDUxYTkxIHdpbGwgZW5hYmxl
DQo+ID4gRFdDM19HVVNCMlBIWUNGR19TVVNQSFkgaW4gRFdDM19HVVNCMlBIWUNGRyhpKQ0KPiA+
IGFuZCBEV0MzX0dVU0IzUElQRUNUTF9TVVNQSFkgaW4gRFdDM19HVVNCM1BJUEVDVEwoaSkgZHVy
aW5nDQo+ID4gc3lzdGVtIHN1c3BlbmQgcGF0aCwgdW5sZXNzIHNucHMsZGlzX3UyX3N1c3BoeV9x
dWlyayBvcg0KPiA+IHNucHMsZGlzX3UzX3N1c3BoeV9xdWlyayBpcyBzZXQuDQo+ID4gDQo+ID4g
SSBzZWUgckszNTZ4LmR0c2kgaGFzIHNucHMsZGlzX3UyX3N1c3BoeV9xdWlyazsNCj4gPiBEb2Vz
IGFkZGluZyBzbnBzLGRpc191M19zdXNwaHlfcXVpcmsgcmVzb2x2ZSB0aGUgaXNzdWU/DQo+IA0K
PiBJJ20gYWZyYWlkIGl0IGRvZXMgbm90IGZpeCB0aGUgaXNzdWUuIFNwZWNpZmljYWxseSB3aGVu
IEkgZG8NCj4gInN5c3RlbWN0bCBzdXNwZW5kIiB0aGUgZGV2aWNlIGJlZ2lucyB0byBzdXNwZW5k
IGJ1dCBmcmVlemVzIHdpdGggdGhlDQo+IGtlcm5lbCBsb2cgb3V0cHV0IHZpYSBzZXJpYWwgY29u
c29sZSBsaXN0ZWQgcHJldmlvdXNseS4gTm90ZSBJIGhhdmUNCj4gY29uc29sZSBlbmFibGVkIGlu
IHN1c3BlbmQuIEFkZGl0aW9uYWxseSBidXR0b24gaW5wdXQgbm8gbG9uZ2VyDQo+IHdvcmtzIGF0
IHRoaXMgcG9pbnQuDQo+IA0KPiBTcGVjaWZpY2FsbHksIEknbSB0ZXN0aW5nIHRoaXMgd2l0aCB0
aGUgQW5iZXJuaWMgUkczNTNQIGRldmljZSBiYXNlZCBvbg0KPiB0aGUgUm9ja2NoaXAgUkszNTY2
IFNvQywgaW4gY2FzZSB5b3UncmUgY3VyaW91cy4NCj4gDQo+IEknbSBub3QgYWJsZSB0byBnZXQg
eW91IGEgcmVnaXN0ZXIgZHVtcCBwb3N0IHN1c3BlbmQgYXR0ZW1wdCBhcyB0aGUNCj4gc3lzdGVt
IGNvbXBsZXRlbHkgZnJlZXplcywgaG93ZXZlciBJIGNhbiBnZXQgeW91IGEgZHVtcCBwcmlvciB0
bw0KPiBzdXNwZW5kIGlmIHRoYXQgd2lsbCBoZWxwPw0KDQpZZXMsIGFueSBkYXRhIGlzIHVzZWZ1
bC4NCg0KPiANCj4gVGhhbmsgeW91LA0KPiBDaHJpcw0KDQpDYW4geW91IGhlbHAgYW5zd2VyIHRo
ZSBvdGhlciBidWxsZXQgcXVlc3Rpb25zIEkgaGF2ZSBwcmV2aW91c2x5Lg0KDQpUaGFua3MsDQpU
aGluaA==

