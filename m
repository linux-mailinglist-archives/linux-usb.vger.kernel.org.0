Return-Path: <linux-usb+bounces-19290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF3A0FE17
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 02:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 592721699F4
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 01:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECE82253E6;
	Tue, 14 Jan 2025 01:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bxSBL/2q";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QFzGd0Hb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mMHPflpo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB5624024E;
	Tue, 14 Jan 2025 01:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736818187; cv=fail; b=GPeBohBqW2J/plumCkZtfp9pFGwsV9+CoeM5ZZLX2JB893I6EnO4mB2idjxwIZnzV/vSyXT5K41wjzppuxgmL3BByKXXbAewcOnci+FKG8DEeRR859mnXyf6E/hWTBAVog1tFEAtsQyL+PUZQsLH2JnWrrdmim8l0JWcpfY+T+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736818187; c=relaxed/simple;
	bh=CaqiOxscLJ2MH1G9+zOQjudwTFlPp7vmvuPKlKY0uv0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cbhP+dZtlkAe6x56X25LodNn4rVdUB7W8Tr6T00juBto1k40SVZ0y9pccBugXmMNXpG/SFo4ze6VSw+h8VMgXCigI/+p2vEyXynoxHif9T9CqFsblAoV82fAcXVwiOuCj9grLBl1vD08hP/YoFkcGyxM42KklPv9aWtGe0A/T40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bxSBL/2q; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QFzGd0Hb; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mMHPflpo reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DK7EW3008094;
	Mon, 13 Jan 2025 17:29:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=CaqiOxscLJ2MH1G9+zOQjudwTFlPp7vmvuPKlKY0uv0=; b=
	bxSBL/2qcyh0JpohDGlww8tBdpLXkJ0TRGtC/r5qo4ruRQMjTie2hHNF/UBoU5xS
	IVOgRha92Pv14U8NAJnVXx5zkbXb/qVa0NZ+QaIZOFeNHEUCSKZrtMjyrW8mLNRi
	HLga+eVY1Kcf0ysj3h9zcLUpq3AA1EUlviPIXK9rFny5yCWa9Ll3xJlqNX2vH0Fe
	Uy396wXETHitAZ1AhqCvdwaQA2FgumnT46PaQEN62RSn++9n/5uVkEPXZ+6Ed2QO
	6ALjD74RKPJTWaWpKVEdLvCo3wkgoDlAMJrM/GYKbJWwc0yjxZBUiRH+M/nvA8A5
	RN2Pz5GPlZVUTlgniO+0Mg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 444yvscj3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 17:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1736818175; bh=CaqiOxscLJ2MH1G9+zOQjudwTFlPp7vmvuPKlKY0uv0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QFzGd0HbH9KCQmCrn/A/9nlsx32fk3OqWhNiU+STXbyMtqATuJRWSJ4rC/kfCf5yW
	 zhohK7o345OLx2isy3HnAJHruTVdK9rJfX3r7gyZv2Epy1gFMQOa2bQ+MbeIC6ps3I
	 pacQPQP1+cdmNyOI7J6gjsxwhopxOd9W2MkiznYr/D0ptPtSZEA4hd9iTC7GkMehfI
	 58lPbi3oOZnwOsYXRd2Nafv5X847ao0Seq++rcz3bHbQtDSSOTkUQ/e/oP4tHU2aSF
	 0AurIkuVryQeAy1sBuSAApwpkx2CLxsPtlFFzle+VB5D1xOV9W3DG5tePssb/85qHn
	 gtTVKSWEeXRGA==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0780B40140;
	Tue, 14 Jan 2025 01:29:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0864EA00B0;
	Tue, 14 Jan 2025 01:29:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=mMHPflpo;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 28E83401FA;
	Tue, 14 Jan 2025 01:29:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFc81Vp96wMzcWpQm2u5TK6OZ0Ei22+4+AIn39pwYERaxqarqq/VsCoa6hOkhADmRGIbFg6fA/PEwZbmK1pa8iU8dU1HO+gw6yUCZmIzXwMU/+pSd/phTefT5nDFwgNCKT0LX3DEy6H3TQ40CVR5Vq59Ki9dDo0uUm2K8Vn/U2htAObGGeS/FAiwoTskllrqDyIlSSTZy14n+s/+pSTAwaeGnoB3aaK9EVqBln5OIkDgsW4Ujity0nRqZpSJPyWQ5mbhRC410eT5QR4FrwbpwjPd2xeUQWPgnjPVzHTtO7J2WqzDif9O6VCFj99XEa3SygQEwgR0nWjteU5FpCva4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaqiOxscLJ2MH1G9+zOQjudwTFlPp7vmvuPKlKY0uv0=;
 b=lkfj/eGzPjZgXXgVIDclGGdPTGn/zD8Uwi5Kh2AtU8k5bURJV9yI9fSYX+tpiPTr3EO5RUYAvdnJOHYjIkRJHLnFgYLdkUSmP6v7h+poavryyjYa5rLXIyyxWh8Nnef4y/hhkpgRsS0utyEMmyLBDnlFqjj3GO9DNh/WYwVvNyVd+cAnxgCxtVd143Ipl9XRj18HUQnSNKRMWMKn/6f82Ev+xcCLZsMfBKfuZduByTmxzIeJjj/lv4ljBjfzOu2FXw4Jy0VfSryL1vXHIGg4Lm9+7E2WmewRvttBBMxgct/0PutJujWc3q/vqZrFLuESBuvY6ibbIpO283ybx4XZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaqiOxscLJ2MH1G9+zOQjudwTFlPp7vmvuPKlKY0uv0=;
 b=mMHPflpoLLjyoIogOKtv2HXMKvQSgKGj18+BjWZ0255vgsKD+7tWDTayTFmzFhbfPGdpWWgBgBMHrWEBdyaGkN/Hmhu4KKK8D/TCFTIZmV9O2lNzR9qCMMKPB5wuKAykjSXZ360eVrQaDI58xKXraDdrw2b+I5tK1Ex/XS1zCnI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA3PR12MB7924.namprd12.prod.outlook.com (2603:10b6:806:313::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 01:29:29 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 01:29:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] USB: dwc3: Use syscon_regmap_lookup_by_phandle_args
Thread-Topic: [PATCH] USB: dwc3: Use syscon_regmap_lookup_by_phandle_args
Thread-Index: AQHbZFo6WOFQwendEEuoBFWtZOIjdrMVfrcA
Date: Tue, 14 Jan 2025 01:29:29 +0000
Message-ID: <20250114012910.ljmvws4ychhfukhn@synopsys.com>
References: <20250111185412.183939-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250111185412.183939-1-krzysztof.kozlowski@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA3PR12MB7924:EE_
x-ms-office365-filtering-correlation-id: 4480d888-61a6-44e5-3c8f-08dd343ae40f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RWRXaUpEcGZoT0loL2Njczk4c3VRWUxqdm5DYjVPQjJOYjhENEJjdzI2TmZ6?=
 =?utf-8?B?eUtuMjB4S0twaE1yZkxQQ0ZmUmo5d1NnNDJCUXJlOFlsRVlBbGxlMHNhbEFF?=
 =?utf-8?B?NTBJclZWcElCYjVDNGM0QzFRVlI0bmRrQnZxVFNoMHhJUEcrWktFZUFuVXRw?=
 =?utf-8?B?djE5TkhWaGszdERXTXJ5OTh4ekl3NTlOeW0rZmJ3Nm9xQjkvOWtIVlE0ZS9r?=
 =?utf-8?B?d0xDeXgybDc1ZGdnemR2SHZjc3MrbjBUN1NJaVJsZnVQazV3b2tpZ2VYZ3Q3?=
 =?utf-8?B?akVkQVBLNTU1T3A5VHR0MFN4aG5aZTdlOVNlaFhNeERoeHVYbWI2bW4ya1Q3?=
 =?utf-8?B?VXRqbHBQM2hYSDZVWFpzRTVWVW94ZG4yMGpmTytCRTJIenFZcEorR2ZEb2h0?=
 =?utf-8?B?WFA3RlQvRjVyT2hyT0NNRTc2RVFwdi9DVGxVck80SjdHbWJsOGR5Ny9Ma3FW?=
 =?utf-8?B?SE1VL2o5dWkrUW94eXJiZFVxLzRTUHNEZXM5RUJuY3FpWjRNeTlsVzZZV2d1?=
 =?utf-8?B?ekVNTVpVVkxNQkxZTGMyL2NCWllQcUNjbUIxNGtlUGpjK2ZualY3ZzJIM3R4?=
 =?utf-8?B?dGVTcjFoZHVXRVJBVktqT3ZFSFNMZ3RhVlVYbUw5K3F1WmZ0ZC83SzBpbUlh?=
 =?utf-8?B?c2tvR3JYNnp5RDEvN1ZKdFk5d0JHSi9QeFdBNE9jK09XMXkwUlpHY0FEZHZi?=
 =?utf-8?B?WjhqRG1pR0h1eVFCdmNFVDVROTlmcFZQdkt6eXNPL0t5MCtadm1IN0RIdUg3?=
 =?utf-8?B?bWJ3QXczT1JxeVdyOWFHaGdBL1JjL0wzSzlLTnBIdytLSHdINTRIbHdONXlR?=
 =?utf-8?B?dE1zeWFQMGN0THA1NGovbU1CaG1zNEdoMHdMVVFOK1AveFgyZGJ2VWdNWWYx?=
 =?utf-8?B?RzV4RjNCa2E0Q1RsalY4ZjFGV0Zja3N4V1F3MW8yKyt2cG02L0VtcldnVkcx?=
 =?utf-8?B?MEpqVExYMmtvVVE2SXlUZTQ3Z1FKZEkwaFJncUFCbUZ5ejZXaWorb3VwY2Yv?=
 =?utf-8?B?SVlucE5BbXB6STdUdHlaRDBRVEtGMzdla1RBOHVzM1R3U0dJM3Z5R0NLN2ht?=
 =?utf-8?B?c1VvTVd4aE1CYVpMWTJYQjd0WHZETVgyUlRVazRFRU4wVVlCbUg2Z1pGZWE5?=
 =?utf-8?B?QmdSZXlPTmVqT3FTZVFSSEpvb0ZZVm5BeVdlSjdEWUtiL2FKdVhsUGdWM0hB?=
 =?utf-8?B?SEN3cVRESzNsbzF4eEkzUVZMN3lIT1dBbW1oR2VoUDZmSGFnWEVUWUhrOVZo?=
 =?utf-8?B?dURzTzNEL1BxblB5d0dxVWdUTWZCZXNqaVdxVkZnZlpuamowV3QvZjBsVFJv?=
 =?utf-8?B?eE5NS0JsNHpMV3JPNSt5bVpwQ0IwK0d3QTBCMFpNTnVlQWI2N1JKM0JPQWlt?=
 =?utf-8?B?ZFFFOTM5eitjc0N1RFB6U3QvUDQ2aWk0VTExQzhvdnVldUZacFRWZE95MFpP?=
 =?utf-8?B?MmMycGRMTDN4QlovRmJIdWRxWVpkVzUzRW5hMEJiOGpZT0dFZnRaKzdpYlRp?=
 =?utf-8?B?RC9YTTRLb01tN280RXoxQW5vb0FqMjVnQ3B0V3pHWk1GWFlIY0VQLytYSzhi?=
 =?utf-8?B?bEVHTWpnWUpST3o2c3FOZjdKNWVFQWtLS0p5R1Jpd1J2VmNxU2JCblpSeDVW?=
 =?utf-8?B?bkZrcW9CNjd2dlJIU1hLZUt3YXMvRHBLcm1JN2FqWTQ0T3dTRExTRDhMdHd0?=
 =?utf-8?B?aURncy9BYVJwNEp0VVozVXZ6Nm4wTGVMdEtuRWxsVHI1ZHo3UUtqbU05VCtn?=
 =?utf-8?B?cmN0NnFBcDVuQW1JTk9sZlFGaC9INXAxZ1Y2a1d6bDdZeVdGUkIyRENqeHRR?=
 =?utf-8?B?K3BCYjdTeW5GK1FHd3l6YXowVWt0dmx4Nzd4VXEvd1dKVmVkVngyVk1kMVhi?=
 =?utf-8?B?bXJ1ZXZTR2tTVzY3a2dVc0EyMS9OWVdDRy85cTdpbk9wOVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MnNWWlBUdkk3cTcxVUFYQXhtV3IveGpwQVBPOGtqRkVHbXYzU1BGY1RwY3Fh?=
 =?utf-8?B?V1pLYXN1K2c3ZGpwT04wYXYvZkpsdG1OdTROT2w2OVJxMmV0REpwTE5BZ0g5?=
 =?utf-8?B?L08rdGo5d0xPUlVUeGgxUnNnRkY0K3pYNkNxUys5eXBrM2xLNnNPbEN5WlRE?=
 =?utf-8?B?VjFLYmw2N3lqN3hIbEUvL1d2ZExNejhnREc0RDFIT1FlV0hxVTZoWFdjdWVW?=
 =?utf-8?B?eTZxTlpMR1c0TjBBVGN2dWxlOGROamJQQUpqMXhMSGR0VnJJeVJnYStrS3lr?=
 =?utf-8?B?ZG9kU0Rua3BETDdiaERnUWI3TnZtNTZvYUtPYThBNHcxenlzQzlYeW8zNU1T?=
 =?utf-8?B?OExkcWNsTFNJcW9RMHRlSDlkYVJ4dWJOTTNoYmhNd0VidFNuVGVGcGora294?=
 =?utf-8?B?Y3ZxZy91aUpUejBFY0U5WEZjYi9vQlJuQUZrUWtmTkU5SUdrdVBLWnYrb0o1?=
 =?utf-8?B?QXJEQVgrZHlLTlcrZXA0U0grTGZNdnBJK2JiZkRsdHVoZC9ZalRSYytwN3ZH?=
 =?utf-8?B?alZ5aUw5TWMyYnFjYVFjcFpHNldvWjUzcFBJcDZCSmRRUzFUNktUSFBtd1hr?=
 =?utf-8?B?N1piUUxUcmFPdDdyQkszZmRFLzNtQzVpMThBM1ZGbGxQZnIzdllmSWI3bWNj?=
 =?utf-8?B?WmtVSTF4SUYvTnZQT2NOSWVKejQ4WEw5bVg4TUkwYklMYlVMV2hONFFIMzFP?=
 =?utf-8?B?VTM1VkhDbzJLUW92VWxzSmJ2K3pYdGFXV0RqZE5ZSVgydmkyakZlOUVEV3k2?=
 =?utf-8?B?bDdaRzJUbzc3cnByZEJ4UmgydU8rMDhyVHRnNUowN2J6R3A5eGt5Mzd4QTZL?=
 =?utf-8?B?aTFHR3FKQ2RYdHRNWEZ2Y2NtVTMwMFpTVDBSWElHMUtYMXNNT081Sms5eDNt?=
 =?utf-8?B?bjVrU2dLOFdBYzRQQWloUFZJQnF4SWdKQXdWL3BOVElLTjJtZ2ZKRTFlL1gr?=
 =?utf-8?B?a0oxWHQ4a3BicStqclYvYUtqSTc5a1QyaHY0NVRoNEtVQ3pmRnZxZTBkaWJS?=
 =?utf-8?B?MVIxMVNIZ2RrMnZCQ284eDRRUG5MQzJvQWhPZXdhem45cFpYbldWMjFaZkpY?=
 =?utf-8?B?aDc5RUJEUDNldEI4ODJLN0x1VGNCOC9iWHNISGNFbDhMeGJ4WlV0YzNKY21j?=
 =?utf-8?B?NHN3MEMrejVOZGd2cE9meXpHcGY1MVduUTFpaTJsQmRCZElLelVtNWpwajZx?=
 =?utf-8?B?NGxORDdXZEw4cGlNb3JQWFJCZHFrVDFjR3ZtVGIxQVcveGpFSnhkOXRMa1Rm?=
 =?utf-8?B?TW1ubjlTbzRnYXZwOUdJN1dZYXR5N0hEMUxmRFhuLyt2OXF3Y1lxQnM1SWk3?=
 =?utf-8?B?cWNubmtFTS83RS9NS2RnaFhOQ1VHeWp2Sk1kYnlWZzQrOUpSVGNYNEplWDBH?=
 =?utf-8?B?RHlUNW4zQmVpM2Q0YXk1dUZBTjA3SnBSOGsyYVVuV3ZoSWRsNldOYnYxRjhX?=
 =?utf-8?B?QTB0Vm5VamZ1L2ltbUNxN3BPRDZvVW0wdFUwVThQUktRN2VLL1YxazRjYXgx?=
 =?utf-8?B?eDlDZllBejBpb05qVVc2VnhvL3JXYlU1T0ZRendQbFpsZC9KVEFJRlRKbjVy?=
 =?utf-8?B?VTErVmRJRk0yTFpaZlpJOUZIZ0d0N2FLNUlWWmM3TXY1RjlFWVZyR0pEMklO?=
 =?utf-8?B?ay9CNDM5WFBUT2plTkd6cjlaWlIvTU95MWUvQVA1R0VHZVZyYTRkZjZzbm1T?=
 =?utf-8?B?dDJhbUJMMXlVQWdZeU4vM1BsZkVHb1NtenJhV25LNXNsMFRSUDBCTGd4K3J4?=
 =?utf-8?B?V1dxT3NXSkREMXozbXVsaUZxaVl1OFhtdHJleXZuRjM0bU9Wd0hkRXAzNDRG?=
 =?utf-8?B?TXgzUytTQ1RCU2J0UThydUNKMUxFejk0bC9LL0VPKzhTckdSZEYzUWRQaDRG?=
 =?utf-8?B?Mm5EdWRCYk4xN212Um1SWWxwZHVwZXFqWGZyL1VzSTVaeWY5MC8ra0phMVNK?=
 =?utf-8?B?OXRQOFEvYWNkUkdHMzdZSmhVNHY0L1hLWVNsVks5a1N5VitsMkp2T3g5SVJX?=
 =?utf-8?B?RjBacnd3bnVTYTFXYkovY2pRRUZMRU9PQUVsNng4Vk40UzJHWGRWalRTZFUv?=
 =?utf-8?B?OVBWYWZJNnVIc1JXR0RIRy9uK1p5Yy9CTzllNklyQ0xlMW5hd3Zibit0bGo4?=
 =?utf-8?B?bjdmajFxTnpSLzgzNnk2NXdKZXVCcW9DdG9sSExGdEpyaGpkb29FRzBWaE1R?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C81F944B9E308B4797D9493402FD8E0E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KjBkRWkrlZvRYiY4LhXYsp9tD+wNV9PyoA/Ne4xzjnftH42xBORpi5sY4TdqRCfcJ9Ct2d/Q5KBUAUnhSbfv8jKiH+HgAQRGuWxbmS7edSa0Gl25/B2Z8pL8y2tYpTIq66iSzqcEmycQLtU+zvFvuSWNYSpOuIJlqCfcyy4DHCquEK2u/8GQp4avUHhJq0ef5JAVlPRNcz1NbQwQb70Yvy9R77J6pwur1eeT7lDUbuW+QYq5ZoV9U0QeMtR2kVu66YG8mGI6ukzEn8LaPbisPQTHyqmJrgYj7wlDXgJXd0rvlYBZbkFwW2fEk1pTLqEww1JMuibVy+jFXbZoH29vz007/LULqrhGNxjZideS47J9++FN7hqlp/Z9YWOxw7FJZ6Jrllwi1F5WSC6CqfXA81396XcesK7QG2xJynNr6tH5cy8UdpwQMsN7JhBlKD3Ep1mFRPnqJpMiNVAAAD43zigMdNrBANsXRnYUszZH13JpRhUFHAxk6KJPr+/qrf63NfWsfX3DC7vMowSmPAd5mV9Na1sWRApgW8cj9AO5VfRp/DUAYe+F5G3vj27Ou1JbVTJFihGktyYxK3kiEEvvF5htagQYVC4HbltMzXRtBOPUSsSTqN41ft/EigEeu5F6rUdyRSG67ge3zsq3fjEHyA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4480d888-61a6-44e5-3c8f-08dd343ae40f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 01:29:29.4792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TJ/5zqC+0WThKZbmBWUBKl94V81R6q9jocY1RYLokQNZ0XF26RpmhbvlICPzWZXuGdRdZMzQ7nmCgThPWjR5nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7924
X-Authority-Analysis: v=2.4 cv=ctxhk04i c=1 sm=1 tr=0 ts=6785be00 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=KKAkSRfTAAAA:8 a=9I0V6B0BUNLsIv-pe5QA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1jtRNHxmMwXUIXHifN_pPjiO0rZ3dtLk
X-Proofpoint-GUID: 1jtRNHxmMwXUIXHifN_pPjiO0rZ3dtLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 impostorscore=0 phishscore=0 mlxlogscore=865
 priorityscore=1501 clxscore=1011 spamscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140009

SGksDQoNCk9uIFNhdCwgSmFuIDExLCAyMDI1LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0K
PiBVc2Ugc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZV9hcmdzKCkgd2hpY2ggaXMgYSB3
cmFwcGVyIG92ZXINCj4gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZSgpIGNvbWJpbmVk
IHdpdGggZ2V0dGluZyB0aGUgc3lzY29uDQo+IGFyZ3VtZW50LiAgRXhjZXB0IHNpbXBsZXIgY29k
ZSB0aGlzIGFubm90YXRlcyB3aXRoaW4gb25lIGxpbmUgdGhhdCBnaXZlbg0KPiBwaGFuZGxlIGhh
cyBhcmd1bWVudHMsIHNvIGdyZXBwaW5nIGZvciBjb2RlIHdvdWxkIGJlIGVhc2llci4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtYW02Mi5jIHwgMTEg
KystLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWFtNjIuYyBi
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1hbTYyLmMNCj4gaW5kZXggZmEyYzRjMDg3MTFjLi45ZGI4
ZjNjYTQ5M2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1hbTYyLmMNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWFtNjIuYw0KPiBAQCAtMTUzLDExICsxNTMsMTEg
QEAgc3RhdGljIGludCBwaHlfc3lzY29uX3BsbF9yZWZjbGsoc3RydWN0IGR3YzNfYW02MiAqYW02
MikNCj4gIHsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBhbTYyLT5kZXY7DQo+ICAJc3RydWN0
IGRldmljZV9ub2RlICpub2RlID0gZGV2LT5vZl9ub2RlOw0KPiAtCXN0cnVjdCBvZl9waGFuZGxl
X2FyZ3MgYXJnczsNCj4gIAlzdHJ1Y3QgcmVnbWFwICpzeXNjb247DQo+ICAJaW50IHJldDsNCj4g
IA0KPiAtCXN5c2NvbiA9IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUobm9kZSwgInRp
LHN5c2Nvbi1waHktcGxsLXJlZmNsayIpOw0KPiArCXN5c2NvbiA9IHN5c2Nvbl9yZWdtYXBfbG9v
a3VwX2J5X3BoYW5kbGVfYXJncyhub2RlLCAidGksc3lzY29uLXBoeS1wbGwtcmVmY2xrIiwNCj4g
KwkJCQkJCSAgICAgIDEsICZhbTYyLT5vZmZzZXQpOw0KPiAgCWlmIChJU19FUlIoc3lzY29uKSkg
ew0KPiAgCQlkZXZfZXJyKGRldiwgInVuYWJsZSB0byBnZXQgdGksc3lzY29uLXBoeS1wbGwtcmVm
Y2xrIHJlZ21hcFxuIik7DQo+ICAJCXJldHVybiBQVFJfRVJSKHN5c2Nvbik7DQo+IEBAIC0xNjUs
MTMgKzE2NSw2IEBAIHN0YXRpYyBpbnQgcGh5X3N5c2Nvbl9wbGxfcmVmY2xrKHN0cnVjdCBkd2Mz
X2FtNjIgKmFtNjIpDQo+ICANCj4gIAlhbTYyLT5zeXNjb24gPSBzeXNjb247DQo+ICANCj4gLQly
ZXQgPSBvZl9wYXJzZV9waGFuZGxlX3dpdGhfZml4ZWRfYXJncyhub2RlLCAidGksc3lzY29uLXBo
eS1wbGwtcmVmY2xrIiwgMSwNCj4gLQkJCQkJICAgICAgIDAsICZhcmdzKTsNCj4gLQlpZiAocmV0
KQ0KPiAtCQlyZXR1cm4gcmV0Ow0KPiAtDQo+IC0JYW02Mi0+b2Zmc2V0ID0gYXJncy5hcmdzWzBd
Ow0KPiAtDQo+ICAJLyogQ29yZSB2b2x0YWdlLiBQSFlfQ09SRV9WT0xUQUdFIGJpdCBSZWNvbW1l
bmRlZCB0byBiZSAwIGFsd2F5cyAqLw0KPiAgCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhhbTYy
LT5zeXNjb24sIGFtNjItPm9mZnNldCwgUEhZX0NPUkVfVk9MVEFHRV9NQVNLLCAwKTsNCj4gIAlp
ZiAocmV0KSB7DQo+IC0tIA0KPiAyLjQzLjANCj4gDQoNClBsZWFzZSByZWJhc2UgYWdhaW5zdCBH
cmVnJ3MgdXNiLXRlc3RpbmcgYnJhbmNoLiBUaGlzIG1heSBjYXVzZSBtZXJnZQ0KY29uZmxpY3Qg
YWdhaW5zdCB0aGlzIGZpeDoNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzIw
MjUwMTEwMDIzMDUwLmsyZDYyeGptZHRhc2Ntb2xAc3lub3BzeXMuY29tL1QvI3QNCg0KVGhhbmtz
LA0KVGhpbmg=

