Return-Path: <linux-usb+bounces-18340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA78C9EC0CC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55AFF188689F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC3918E29;
	Wed, 11 Dec 2024 00:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZVLHcMyx";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JpKL0WPr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="a3I5UfnU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217E71172A
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877169; cv=fail; b=eC3cxYjz3OGjzVWJdYXA0G/oOxkTH4s3ZBG+TsvV4sEcOT/lf6/2uOeyBdBLFKANipnZr++NfXLYCUesyzJ/gFDr8Wt94nH/fPVwk3MzY++37wofOXaRKpBRhQNgUEY9Cx9/3pTHH7E8s6oisorzeS6NjNXV5hWStosZJZ7B+WU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877169; c=relaxed/simple;
	bh=l6AU+i8P76DEjQMcLEjQkJMh1+s4+UbeXIPxvqAO9sc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sbDbNIKkbUkaP+FF6sQPdJwUGMNN2qDkj0kZDjvcgPArJ/4S9b7EWR6qy+FbCIfXtmZTZ/gB+KSxun3zBf/j96EBJ1pDmpYOk5G/A+OUHkOVhXO/YHLHXy66PiNtwuIQjKClZM3sOo1Hn2N0ywAtvGI3T/Oy/p6M9C6EngSkqMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZVLHcMyx; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JpKL0WPr; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=a3I5UfnU reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAMVk5u010832;
	Tue, 10 Dec 2024 16:32:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=dlxgDh+LGiF3VVGLtZd8v8h1BCOaIxniu1QuNFmrvw0=; b=ZVLHcMyxCake
	hT7CYK3ZHAb0Rx6jg2GMaUPNkkVXVI7Ijzv/OP2vp4QfO91ZRI8VfpxSJmZYHI0Q
	WOtvAmlLFbAEURooTgJBrdSBGtiBs4vi9+v3OJLu9p/QVuOC1H67aOGC3SN9DT/f
	o88XKOPmCIdVAofOLyfxcTH0ghKue19+BiSrAp0UJoW6psULc/Ca/PYoOmsblS1h
	Xp/b1p0TGIKvd0u2pOmmm9Ih0MtwnmzpjKRJnPkzgV5f9sWhupDye7GEu6S2YGZb
	TuCxPZLbJ5mjOC4KzkYZ0V90GwI1RHwFEspz4HlpUJxsU6gTMBhHccnDpPQZbZrg
	iwt8BbukHg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cpgb9pwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877162; bh=l6AU+i8P76DEjQMcLEjQkJMh1+s4+UbeXIPxvqAO9sc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=JpKL0WPr/cnd6eNt96MX8KgH4fqyPz7F+pym+Wdk21kCSgADu06hTAVP1Vi3FTZV6
	 IN2HCbv0pRNBRg2PEdzR3uIiAOEDFEqpfPmi8+8MNbvNhs0W0pvdcmMJwCNtv+Ynrf
	 HjlqtddH84VDeRgPd7GqmNQUBGaWlk8R7jpMMWn02vWeWBi4XE+kn8+h0IOcZfEtgP
	 L9v3KDNzxFxeTAH/ZI0TUbJ9SLqnbWH+iqWbv7H2GbcSfmdMc2HibdqCAAEQQDLGAz
	 KcChwHDu5gKwsSZW1JuU6YeWbMGjLFniELnBWeROFvIJJpUBMko9baeWGmt7RFqN4u
	 a/fzL7OpzWzSw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 095CD4024D;
	Wed, 11 Dec 2024 00:32:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C54EAA005E;
	Wed, 11 Dec 2024 00:32:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=a3I5UfnU;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6A3B54041D;
	Wed, 11 Dec 2024 00:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPxAhz5YJOtqrfDy0u+adGJWyNLiMJH1QqsMjS+r9+3FjUH1zkEWOqt7qe1gb5DwctbiMBRwRjopWGUpC/4mizaMPKvNehvsN9j+Vq9nfcOG0CIrmPb0vL0rl+jMlUcXtyvo/0Retwpnn57427O7g5WtZPJ7rRYijtovntDm0g2H7r2rTXP2fy2H0QpP73Y2kiY+K9hHA7W1b3JnmkuBgLfx2kOc7mspq3bUNWsawoimefLdtHiPksDfgTk9i0/SNWHDA5lDxEWY7J1hTYcVc/S3IkeFrZOVqMlYOv14ffGmEyBWKqW3LdQ8xXzWpGZnKBKkR+yq8cq/M2kp94FzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlxgDh+LGiF3VVGLtZd8v8h1BCOaIxniu1QuNFmrvw0=;
 b=fkk0v1hWNwkgnVl05w4SbAqD7RMhI4lobp4bCPC8LFekBYeHy36pTOKEQbdabDfyjtibAFGichZ+jb53lPcghgmHmo5eZ5TU7OaGkSisMndd558liqPPUeOzyssexl5V9L+ef+pFExUqW3tE6C2iJOefAZkgbBb+NteTeBPquc1yV0Rdgv5uZF+Zf/LhJE8qwqxNWh979sF6pwO8RJmSuRjyVwfaF2F7DhFMaRwPGX+RLgz0ZStPzrKM6FoG+WO35+aTVWb51390WoLOAY+HMA0RIK8L4vhY63fmgpSKrLPKArSlazb66i5mAdtjKItbfbxWXmuKx/KPqWeY5T490g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlxgDh+LGiF3VVGLtZd8v8h1BCOaIxniu1QuNFmrvw0=;
 b=a3I5UfnU8AREYG8YCut8julgGELa6BalQerW8P3u1XvsrJCVO6KagafxvBsLAsLSBO2TaFEc4fWSDQBGNZqx19g/rKeG8yk5d3+HrOayTY88zPFhvMRwPZgDkAgezYAVwiizBtohxdM2xF8F+s345Olaff3p+AGNwirwJBmMrP0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:32:37 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:32:37 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 11/28] usb: gadget: f_tcm: Don't set static stream_id
Thread-Topic: [PATCH v3 11/28] usb: gadget: f_tcm: Don't set static stream_id
Thread-Index: AQHbS2QtDvRyrdgpDkO/+frJcDgIkQ==
Date: Wed, 11 Dec 2024 00:32:37 +0000
Message-ID:
 <d57b7dfd228199cef811206b1b83ec649f742752.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 792eef09-29ad-4202-6b62-08dd197b5031
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hFuW3t/nv5VXVkfxl7THf7TURkagXRhHskjCOstyEM87Nc7JM6aIOWZmC+?=
 =?iso-8859-1?Q?zSzuZzlvP8Zvak1KtGcax31FMXzTf8ffMGKcdfJEg107iqC8zYrNkFmvs6?=
 =?iso-8859-1?Q?DOjOd2eHm5Gk9DcwAIH/AZdg2/K6Qmf6vdtfi4zEhORcu98siELDX/UkOU?=
 =?iso-8859-1?Q?yKxu8F6H7l8cK4sS5Mti20XzPVfFrIeWaFYd2YDuLRZZE0wyqmvo8z4Xyd?=
 =?iso-8859-1?Q?GBauV7UHwFCgg7JpqTMyDeE2S7VHbY94X5XwFFrPqDF9KxVc0BQmI4pqBu?=
 =?iso-8859-1?Q?7DnCitaQqQRUpIlGtMLdbhSpiPYWRf75YtYwEm7czEW+HbjqtQ/6OtjS83?=
 =?iso-8859-1?Q?T9um4NRpheZpE4Lddn6pyqvpgJOsgvOU09zRw8fn39lhVvLjyJIp39yg4o?=
 =?iso-8859-1?Q?npkaSMcPYC1vixmY89Evq9OCzma+4y51s/VYCVHgaMpmDBK9ebC2TZKcYn?=
 =?iso-8859-1?Q?gyulRnGN1IPw996ybtrkKV8jAUkTRCnKDVbOrWoYETxkNgn8YliiEdftmK?=
 =?iso-8859-1?Q?XVo9jrOvO+oHY2Ucl+PK1AgTrsQ81/MjznNCn+YPcnK3Hk9h+Ty1p7WIlh?=
 =?iso-8859-1?Q?DNMYckkgO37vj6LgulWbIZMlCivkfJWbNJbt16YTjQb4JVbz1VLkp5CRSn?=
 =?iso-8859-1?Q?pwmmN4UhbTJGK2h7ibVXUqfNFTRcA1aFmn4StQFuF3xojDiyTgBfh9YPvx?=
 =?iso-8859-1?Q?f99ytNa7SpRA92u+Mz4RKJ4RqbbeUDOx9vd/sKLw1E9B0te1D2rSi4ypO1?=
 =?iso-8859-1?Q?VtGhBqcm0aTL4qkBYmirt3ysdaoB38pJee6dUCU8zps391Atf49TLyTKsW?=
 =?iso-8859-1?Q?EWVxZirzCUDAFkStSrGW7OHXOnwmx0yw7aGCZ0Gx1U9Ru3yMZIjLRzq+BN?=
 =?iso-8859-1?Q?hDaF5I7dW2c+eFQE3P8p01fBcXTBEIZLEUX3IB5dp5FsAt1l4Cr7bP44xV?=
 =?iso-8859-1?Q?byhmS95AcXWCG25+Y6MR2nmA9POwkGYbFMQ8Z5ORTAoPuSBo4uTmAYAFgz?=
 =?iso-8859-1?Q?+4gAlCv+amr+ozZWNPi9fcmKI24MH9Hndx/jAwxoJUeTVNJhauEQvT1Fu6?=
 =?iso-8859-1?Q?apYou8FG/GtRZ8esAe1rW9x3jAv+1F0Q1VeoLkPYFfBKNup5YTZQuBXKA3?=
 =?iso-8859-1?Q?aQY48e8u1ANC+bBPaKHxRgaVVp+DNpt80okRHJbVtIqSn1B3JzWE3G66x2?=
 =?iso-8859-1?Q?O0lwdeI5aGqnPywITC2CiPiAMhMcELK2e2ekjdnUULY1K4NiIPKBDVrI+6?=
 =?iso-8859-1?Q?xRS0gPc6FKRjDW0hkAsLMgQZ1s9684U7ZeWvIJ5JYXK7l31XW6HI+oo5xY?=
 =?iso-8859-1?Q?XASqhmUrZC4zseJFbA67xXn9VuyuoMhYmJ1YNSpanRVLxYr9ugInBdwNIb?=
 =?iso-8859-1?Q?7I63A3o2RO7J1Ki0Je44x16513F0wJA64hb8yubTSb8FfmruLg4FuzkO5m?=
 =?iso-8859-1?Q?uUOLOenCT+pRFnba2tRIJXPENx2hINcZB9YYMQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SeHPVGLVjPCdx1sR64nHnyy64pMRTsAeEEi73hWYoKr+cyYWth/bwZ0m9x?=
 =?iso-8859-1?Q?lmtj/rpFUz5JDK5l/07M44hqucTc37H44ofgnrjtKrifxjfFiSdnV4AORr?=
 =?iso-8859-1?Q?hNP0UR3zT4JVKWcKuDYPkxQsK0IxU/dTM7YkN8xIf4/EdbWfyY4sebwx24?=
 =?iso-8859-1?Q?D2B7OzoKHBDD5ofwNDr6GGjJtHCeM/3aw0tk5zZ+/k/ptbm1anME0I6t2e?=
 =?iso-8859-1?Q?XpwOSE1J4VnvuwCNr1ebBcokqvdikqAuLNkQBiRdjVgkYFIWTN6SpGDN66?=
 =?iso-8859-1?Q?+fF/KZioMNvKZRLHbrcS/fCDpuyzT4md4Ps6aT0zgeEArvVaaEt4N05h3N?=
 =?iso-8859-1?Q?gimjnxw8TbcyQcmZ5uI+1M4y1YQw9hv5yc6lbrf8TC43GPUVU03SB7LWXx?=
 =?iso-8859-1?Q?rDxvBoPNS1M0a0JptLa13hAAVP7ZAmSusckeavL2Poe48ozC3ApP8kea0d?=
 =?iso-8859-1?Q?BH8dSIhPxDOZtM9RUIQB1cR5E6EJTr5+4eRBhVFYvp8R8/wcKBuI13PQL5?=
 =?iso-8859-1?Q?yU1JNbUjariIBCn9DCjj4xK0BYAlbsh7yE7uD01f7Vi9dZ8iM0glA/jYTh?=
 =?iso-8859-1?Q?i2u5p1M3AGFe5cfmfnnfogEzxaoi8wuNlB+hUVu1fDO0FEui54AJ2mObJa?=
 =?iso-8859-1?Q?ADjdWOPzjE9aLKTeXu+70aPlIwVkobhbK7xY/HoYT+Z0zAAgAPPIZJN+tr?=
 =?iso-8859-1?Q?wXCRNRJS3k2psdqC2oq9l3bwI6xGLN6+deLWrhMtn7F3tWrhv+Ns5O6UQE?=
 =?iso-8859-1?Q?p2G1qNr9erVdTiFuUsS0ZvUXgGbdBzsURO52IdXelLFyYU4c1Rj3wVIo5T?=
 =?iso-8859-1?Q?+VmBzCUUxSvrNnXwHGTUL8jzmuJ0kazqGHK63w3WS/CZVobknTQ2W9Rjk6?=
 =?iso-8859-1?Q?JIbmS1m2hfz9PeCPbA1Y9IkqnjiJ6naMrut072GiNALARVXezoN6/WA2oU?=
 =?iso-8859-1?Q?HsbJ45/qf14GR38Q62q7012IpuWMYTchKt3hT1h1nX98exOu2CTEIWe860?=
 =?iso-8859-1?Q?fA4j5GijG1vxC+uCfCjnZE2hapV2w+kCHk2mOlqBIWU7wtGqjswT23sWGh?=
 =?iso-8859-1?Q?d6AknwIEXufifd9RQS0RFfu84klLLrGLetLEhoWfqBxsevuMFsNH2yv2a7?=
 =?iso-8859-1?Q?DmVH3FaTkYZ6Kejp+8WJj/Y548E19X/O6pffCuvF8tXHdjN2LMWD0uRvA/?=
 =?iso-8859-1?Q?zQudxESCbELEVTE+Qs0M5FDCAwplYs8q5sPBeRRBlNpI5XvFV7nBW31fqM?=
 =?iso-8859-1?Q?GK71vD5c3T30QMSoof0tNLLR5zpoqVbAPaM1sFnkFAG+Umlg2JA/dtcCMH?=
 =?iso-8859-1?Q?5p4W1Qn3kAjiLIsKtgSo2Z7kFLoLqb8R/KxLibPKruRHX8PoDKOySBW/Gn?=
 =?iso-8859-1?Q?yXnLSac/kVsknSprBcpZUxtK9CnIjfHF6CWd0VIS817IH5FA3NAcUAELfb?=
 =?iso-8859-1?Q?eq9x6J+eihGVqAtvKUCJNfzuC8/l0c+exfq4rQPdCSLDr+1gRsSWKkp/vJ?=
 =?iso-8859-1?Q?qbamTbShx7VPOW4ZFUvq1X7POjKTq+ck2IFEJ3Z92Np8W1XJTh5JLxd8Af?=
 =?iso-8859-1?Q?HUBLeb1JTEB8gXHRFwW6zYxV4Yci4pdDzN3e73KsB2Uh2SwA+fLUPFSzkB?=
 =?iso-8859-1?Q?0G/1K4E3jQZpzj8dGcacE6hTrc97SF+y6eX0VUDZTEHwZNsclNFXINIA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gYB8Ke8jI0CUacMZsuYAO3w4sG6whZbTLM8myskwHDUJLhFUNujoB+pY8zF/FILfgTtjL7WPovmGzZPqfam06O76WtlKtwSRpE4wjfhVZefrU7+L8tSt9xFyzjT2CN2aNAalEre7oq7bH6kCbYqRghkkbVr1CiLq4mJhlgQEjw2cLkh2LL/W2oerigD8jHvCvw1hfM0XGJHV0nXLikqJXTw/YUzNGe+/g9BJYL972jF53f6mrrcQjSlbS/0c7j+W95+1RVNgFp3pm3H7nOE72dzV762JZLIcGg7JVj7ZA87R1ArjxMgA3Xiyso7tpk4rYHIapeWJM1+HdeVus5Y+HcsXAkBnFtOlADrePH+/Ep1JbPALBL8LjTsx9zAAbbSqfrAz7uJk+50yDSFgxozUXCecsLhYpXKdPyUSJKLAdsenBIwlgyjCaCmABFu3Bf0zIIZfJmPLmy8g2Zxjr2qGpHkRi4HWtEGPRjBCMOUaa+3LOpronPkeKSvEpmjJMiQTd7rbKkHg5V4Hd2TYOP/hxTA43KUhT6DWTLZgDlgNH/6wjTzQlKpjJHir/a/XXk5+HYAZDZU8NQT+RvX6NXzwe9Z6H92D0Z9nLaZr+2KWGoCZR3gpr5tOp6fDrLfPHb1jZ41PIy78zugsTy88jpKKSw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792eef09-29ad-4202-6b62-08dd197b5031
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:32:37.3419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rC9jYqJnW33LqJCHf/AtBS4LobfS0YcotvvjYM5EXVTCUtta/Xr03TuEk9uDtlQDEODB5zDZg0IZr9tB72s7+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=d+8PyQjE c=1 sm=1 tr=0 ts=6758ddaa cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=UZ-aGP34sXRJlaZFjlsA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: Kis1KXXfW6HV1fKzxMkMHIRCmcOpBnkn
X-Proofpoint-ORIG-GUID: Kis1KXXfW6HV1fKzxMkMHIRCmcOpBnkn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=974 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

Host can assign stream ID value greater than number of streams
allocated. The tcm function needs to keep track of which stream is
available to assign the stream ID. This patch doesn't track that, but at
least it makes sure that there's no Oops if the host send tag with a
value greater than the number of supported streams.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index a908bbd04b09..a594ed1359fc 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -511,6 +511,7 @@ static int uasp_prepare_r_request(struct usbg_cmd *cmd)
 	}
=20
 	stream->req_in->is_last =3D 1;
+	stream->req_in->stream_id =3D cmd->tag;
 	stream->req_in->complete =3D uasp_status_data_cmpl;
 	stream->req_in->length =3D se_cmd->data_length;
 	stream->req_in->context =3D cmd;
@@ -535,6 +536,7 @@ static void uasp_prepare_status(struct usbg_cmd *cmd)
 	iu->len =3D cpu_to_be16(se_cmd->scsi_sense_length);
 	iu->status =3D se_cmd->scsi_status;
 	stream->req_status->is_last =3D 1;
+	stream->req_status->stream_id =3D cmd->tag;
 	stream->req_status->context =3D cmd;
 	stream->req_status->length =3D se_cmd->scsi_sense_length + 16;
 	stream->req_status->buf =3D iu;
@@ -765,19 +767,6 @@ static int uasp_alloc_cmd(struct f_uas *fu)
 	return -ENOMEM;
 }
=20
-static void uasp_setup_stream_res(struct f_uas *fu, int max_streams)
-{
-	int i;
-
-	for (i =3D 0; i < max_streams; i++) {
-		struct uas_stream *s =3D &fu->stream[i];
-
-		s->req_in->stream_id =3D i + 1;
-		s->req_out->stream_id =3D i + 1;
-		s->req_status->stream_id =3D i + 1;
-	}
-}
-
 static int uasp_prepare_reqs(struct f_uas *fu)
 {
 	int ret;
@@ -798,7 +787,6 @@ static int uasp_prepare_reqs(struct f_uas *fu)
 	ret =3D uasp_alloc_cmd(fu);
 	if (ret)
 		goto err_free_stream;
-	uasp_setup_stream_res(fu, max_streams);
=20
 	ret =3D usb_ep_queue(fu->ep_cmd, fu->cmd.req, GFP_ATOMIC);
 	if (ret)
@@ -975,6 +963,7 @@ static int usbg_prepare_w_request(struct usbg_cmd *cmd,=
 struct usb_request *req)
 	}
=20
 	req->is_last =3D 1;
+	req->stream_id =3D cmd->tag;
 	req->complete =3D usbg_data_write_cmpl;
 	req->length =3D se_cmd->data_length;
 	req->context =3D cmd;
--=20
2.28.0

