Return-Path: <linux-usb+bounces-18357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 472829EC0E7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AEA3163F74
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F9429405;
	Wed, 11 Dec 2024 00:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="saDVUjKn";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EY5WWDdK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XsskEE2L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8359422339
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877246; cv=fail; b=B44zT+ABm5wCmnO/kcGg8r/dV2F9/wYrUGDTiqWnm4dHYYhROTiPgR8S6ITP6HkteD6pxFGVJ+KioDef2NK+r8SpoJ8top4fPMmKOLu3QfPpNAesrdC4MFI8RviOjWTKQe1qSTVkNtPIOTy3UjnWPMCPkDI4crcjvCXqPuv5tgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877246; c=relaxed/simple;
	bh=dbAQUnC1izYOFoUbny3aT/bLDQGwx6Jqor3LDPMZkYk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q0VXry/DrSHVz0W7E5OXvpeLGuC5gT74Cw9r26v5HyI4VRgfg6KG7xlvtXQ8gB3MGOk8yJ3fPs4NXus33uexWbQhdx/QNcAqsqo9fMV2FQD/uY6S3ivs1Fe3Gj0ksC8u1umW3sZpZRsNpIvLxUF5wgtlYcAOBpkv9DSN9oY+Sm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=saDVUjKn; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EY5WWDdK; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XsskEE2L reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAMtPgY000581;
	Tue, 10 Dec 2024 16:34:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=3Z4QLJrjh7iu4dKRFZjUzlHhnmWq84RJWby0PHV7H90=; b=saDVUjKntyMQ
	KAbRjq69oExSt66uVe2FF79MfHjbxpeml5jGdpbSVXAWuspZQ6yNKpdB7QCYRAtB
	B0JOowakpeBhgyni9m96O6r+cihYJM6QHg/Kc/PZA3OrACOWzqWQmbUWwQt+DNlN
	dn+NwOSZoes18RP+L5GrflZbQMG8wURxtYz1c8qbNjJnG3HmCsQPk+3qjaND5nPg
	yqazVw1W47aCkYtCbGJU0h0NeP92bnV8hPrPAV/Zqw7SgMTqa4BffJXyTYuw1PBm
	FlxfjKEZ1so1Xn4uTb8zmpuq+442HiU6itwJ3vf2dfReOz5bTxW6caL5FMmaQkz8
	Lcef5jjnBg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 43cnvka1b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877239; bh=dbAQUnC1izYOFoUbny3aT/bLDQGwx6Jqor3LDPMZkYk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=EY5WWDdKQ/vJ/N1dmuqAuBZ5FPRGcc6vehja4+lHp1rP1INTR5hEcJPMO1mqvo9y0
	 w20c6r/Sxuq0s+YdIwIAKMqRPYxg9UAlmWqUHY96WzIG0v1AfLx30kMwuEmaWJvZWz
	 zpIlx3WXcjV9BwyGlxA7LerjrDTVo9W3zSoYoLuGPaFYuvANg33pA06EtrBpQvKUoX
	 e27cCeDPQjI4yxmsvkxz0XX1FlQEGSnV9G8oHAJBSUjsjlVi4B/IE50QXMg+X9BpUQ
	 bt2ryJXtPkJr4uVBeJGP1LZgoxwSYD3KtnANWpO13pMnEukXRWEUjXh9Smh5a2YHVn
	 GKb6/RaSktJTQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9ED92404CE;
	Wed, 11 Dec 2024 00:33:59 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8E31AA0078;
	Wed, 11 Dec 2024 00:33:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=XsskEE2L;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 463DB401E9;
	Wed, 11 Dec 2024 00:33:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1dBfOGKkSpDTHDw2YuUk9QW2+d9Q7u8g3F+wcAfaafzQQCj3H0l0+G04a03+UaOt/KPt9N60P8OY+Ts1GtZBB0MXPWmwvuurPsGR/kswLd/RDA6LtCXDztVJxezs5JoJpW3ZP+JGLxoGBb208sU2gtWL8eA9mehIFYRl6k4y19rY9aqgfGi0XTWtYVFfldeBvKnbrBtpTavA3nmso5rfcrmHAx5l+6bospEAdppLIkHl+XfrjgVxl8E9sWoFxn+AyoOtmraHqAdR/TK9JCXiKVODJe7gnGgDm4EE9EGdNu7QnOiMoLsL2ed/q6X1eioKmvA98q0UY1HCjr75t36gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Z4QLJrjh7iu4dKRFZjUzlHhnmWq84RJWby0PHV7H90=;
 b=rmr2cxoAi2y3gZiUYux0TXRhk6Fs/VELA+8nimL1T3KOy3tpuKIbtDhSbB8hXrbAqizbvJe+0aTESfSyhQgsGY2GzIEmFREBPkDiMba39WObic29aG+7Hm3JwuVZvPeB4VhB/RHmsePoRycukJTxsKBwLTJb3PUem0//GIHgo5DW2NOHb/cfaumzaXwOQLN5kcglX7rU++6zwbaCqsXc4yKqZ4/oRdvn57AREpVu0rg6MFegeznY9pelGl9LnEPDEYh0EAMJasGfzfW/V9VOuFVuBEHI5VckvfJGhb3/DJkNepSso8U+QygPPk1a5UTxkg19iCIRnqzfR0tKyD1Raw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z4QLJrjh7iu4dKRFZjUzlHhnmWq84RJWby0PHV7H90=;
 b=XsskEE2L8TS30QjzhfWDrn1ebarqxMnAjF840dEs4+98sUOo8TBrVKpyK97VpCpyY/7NsBrLKO4GqDVi1SbGxYJB4K9nhPeIxT8FyA44FSpp1YufYFMwy7up8Dnv5qzy1hhnjtf+z8HdTsjtUTIvRWVpB/Fqo7VydmGbhQ6y/k8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:33:57 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:33:56 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 24/28] usb: gadget: f_tcm: Check overlapped command
Thread-Topic: [PATCH v3 24/28] usb: gadget: f_tcm: Check overlapped command
Thread-Index: AQHbS2RdbqcIeOJElUCGpUAsYUcPKQ==
Date: Wed, 11 Dec 2024 00:33:56 +0000
Message-ID:
 <6bffc2903d0cd1e7c7afca837053a48e883d8903.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 6c815565-ff78-421c-4815-08dd197b7fa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6w2STqr/hP5rl0n0p7ZzQlIBTEkGVC2q6+uKfCja3ltk8wwcBEL082cbGh?=
 =?iso-8859-1?Q?xt1cwJHl8ihLSIAwfl5lmuUh2RABvoyIj+QK1H0tjKo++5gUU4fWMN4X6Y?=
 =?iso-8859-1?Q?dpiMbt7/GxMjRR1rhmrUWfANjtwDLr9NZLWR8z3AXeQNVNbkOVyc1LWPe8?=
 =?iso-8859-1?Q?+DANUgu23qVV1CFFwimfgu6s/8QASHQh/5mpimHBLn7eJ/gn42ysJQc8rm?=
 =?iso-8859-1?Q?z4JhVMOPIm6jmZZEZUb/wz6vDNFfb3643FCy97Omnibyp+j6LHAa6giefj?=
 =?iso-8859-1?Q?ocn4q70RDR2IwPDKsWXMXX9eYG9eAKMx5vl2U4MTF7HItWio5rjoJihQAz?=
 =?iso-8859-1?Q?AS0nLKQlw4SWHe9iRUb2sh1d2u8Z0yrRnBSlOauahuNfgZk9ENVPOo68UZ?=
 =?iso-8859-1?Q?/fLN7hjSsfr1vLwPSZT+XfyIXG5U+gTr+kNKY9uzOuSGqP2bU/GqkWKFof?=
 =?iso-8859-1?Q?1wsyGMm40sQS3cjISIvgLTKVLLRstUUSV+f16BcfgKe8ZcW9lKF8WKh3sc?=
 =?iso-8859-1?Q?9qeZ11pnYk9vZa7jt1QSdi0C+wURYlGjXRrvrTz8qHTwnCfHxTYATe1apu?=
 =?iso-8859-1?Q?3UrSmc6FUBUAhnv54BKXtZjmveUm5N16EK0k1m+RniZRObrjhaaA+IzlDy?=
 =?iso-8859-1?Q?pOC2KW6iU+RdeTqD65eyK00BWZ9oznOr/psFciDNOMqv5Mnu6ydEFjK5ZN?=
 =?iso-8859-1?Q?vLU8NoGpk4VlLlJ+nD2fdFb0vH7OthUrdQ2pevvHOrlkKrCpLZyB8M60an?=
 =?iso-8859-1?Q?TedbzGQ0qbXPxvUwQhD+69O3ZyljR3Kav57xMZ6aDQ0vx7EfKAraa7eIww?=
 =?iso-8859-1?Q?7U2xiKd2UiIALoyVWYp5Yj/jLgKUD/z+aTHT0a1QpOPVIPpZSHpAt3gOs4?=
 =?iso-8859-1?Q?IoyyVI+q4sdXPlUYBXnizoWNE0yKeBO/2683KEdbFUa164dOhEoYhWj2yJ?=
 =?iso-8859-1?Q?yx6dtl1GX98LEZM6QIICds9YJnZ+0wRknei6O7wRyb5XFTFNIAUSPtj13t?=
 =?iso-8859-1?Q?4B/PT+xhnfykkNkjOIdzQ8htIkHGWhlNxDx2rRwBk7oiWEE2UwvST693Xx?=
 =?iso-8859-1?Q?gjcVi7zk8vdDFeIMjzw6mTScq+bj0jMGE2Id8DOyyFY6kVDNaU/nWyDjve?=
 =?iso-8859-1?Q?CilfEevxehXaLsoSuFrfQKTo8MsQcbEIFU/iGSEqSGqNFU89owKFdvYCIs?=
 =?iso-8859-1?Q?TIdPCkA1QqBiCjcFv3y1GleE1LLJyyIm5YUI+MGZGBcQL6U/Hjk9cNYqam?=
 =?iso-8859-1?Q?PMe1VX9IOmmAyCx57bebTPHvZXoX8BtM9oONTcVtXsCEsy5YeZ/N+uG1eV?=
 =?iso-8859-1?Q?QxtLQaV9Ktcjo2E71m5lxUXUnHLAQxGSlYAjkgOR+eCe9eNlGJfzg+/SBf?=
 =?iso-8859-1?Q?OB+FVc6yKwcDCxGdtPMWs3AAKT6EGzKcC/B+q6hVYtWyWIMdadCCM7dvbP?=
 =?iso-8859-1?Q?bH+WB/Tum4n2jpbjlkG6dSJUczOnmqyoWevh4g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MyUP0H5DIdBz0k5sMw5yysZ1T4tzHh9evpcrJP3YLq0qJia4iHDZ1zIZ5V?=
 =?iso-8859-1?Q?tAZFgx+npvzqaKrr1XrIyNJBW1Z7yQEXfdSBJcQJUssv8KzgbKiP28V1/M?=
 =?iso-8859-1?Q?GXM7q2UoB8DGhNzH7JaxWE6B0ZjcopIXMpFgzijDLPQ7olOiFWgYNP9fEf?=
 =?iso-8859-1?Q?1zT53BQJSLI1F+u6tqPip4B6D/dLkA/x62GfCxMUnDM/45z/1qHbH49jbs?=
 =?iso-8859-1?Q?gGWHtERSFlxSdQp6A2zQXPMLQxGz1xzm0kvhHCKFRUN/98xKskXqMZzRB2?=
 =?iso-8859-1?Q?R19bS1u/0infRc4SmsyGc+jli1U7sWkXzQM1oUiyQWWXQ+IJSOt5I2UR3C?=
 =?iso-8859-1?Q?5kqwFp5Yj370tvFa9PWXhHtS2uJMLZRVQLt4YV2Toq8E994ct9pCMHMaYb?=
 =?iso-8859-1?Q?hncTrpZ3CwpPzJZYtCNatPxQmrIDxHQKV8qY/vaGph5klbIH6xD5SeR630?=
 =?iso-8859-1?Q?0biDExlAePKN8F+MuQEvvTSnas3h1HHesxvma9aKp43ReyZVEP0jynUwbw?=
 =?iso-8859-1?Q?Gl75NuePAE4BT7FgPqDYbkOfeOgU4YzLD9r3mg5EaJ9v7OS+WPo79Bhrzj?=
 =?iso-8859-1?Q?3Z+m/sAzQDFZMSU/GZEuuxaDs15Bo9Q496Xyqz1AO4lAKYA3cF2CaaWMe9?=
 =?iso-8859-1?Q?sQW20Yx2IBeadmEAfFWz2ys4qtpKvLxUjZt3D03kDVc9BGCIcoBdoSilxm?=
 =?iso-8859-1?Q?KjRh1OLrR6UqIsJwH888INJ9x995skMpzECdbX1LDIk+Kj2NTbe2GDEEWE?=
 =?iso-8859-1?Q?+oP700yp51SuXiPtRD0edVs47J9qQ0BlLEjXLzR/EXFCoC8dUz4IKArg5U?=
 =?iso-8859-1?Q?ag5QvUWllPVVSf5F8g8/P7pMkRx09AEvgERfsify6K3byy87fbLxMJaxeS?=
 =?iso-8859-1?Q?ovOQ564sxtjD8YgqCw+Pxj3deUPnB4d+vFLxb0VO2NHHb89kpbY4e7Fr37?=
 =?iso-8859-1?Q?vgz8eE35T9i3yYF+fpQHFSDxREmKUZsFqVZnY2fmWMNF3sSmQ+nCAb0wI0?=
 =?iso-8859-1?Q?qTxYeloRZ/wbeSE9zBSnFReP0KIQtYt2d+8DY1xNt48zKESsnGFuO8AUW6?=
 =?iso-8859-1?Q?oXbL23kadPPgciV4wOTzdlfj1nRx87SwfvtgD3rK94AbIb+4b7UPiaMmUM?=
 =?iso-8859-1?Q?ekvCFvMWswrrmVHakCGMd1q8USs0VwEUMmBVKIk1mzaYzNwb2E1sZfJapl?=
 =?iso-8859-1?Q?frJ8gm9SDvzi+Ub9qrJFW7QvxMSIBXXqkDiWSzhfN5f65ACXDtUQWHuKcQ?=
 =?iso-8859-1?Q?GHRb4HaOM2ZzigxX51rGmCywc9fonJxO1WgImBsc3x7NKdlc7GhsNpvMP2?=
 =?iso-8859-1?Q?ZXnTDSEjDzhdfbbMWIeBE68ZmkSg0x8TZhPMWdPvHQNjrCjwdWX7Kh1XGl?=
 =?iso-8859-1?Q?295Pjf5ly6y7L01BEuA9uYB4KQVE7BZzUBWOFl53FxFZoinyglFClx7lFd?=
 =?iso-8859-1?Q?svFe4xmzOc+bmaidgT4ujyvcaM9vt2HeeYswk7M4AUWVMIdgufF3AehMVi?=
 =?iso-8859-1?Q?f1pmP1QzrFT2KTqSPmKH68zGz4ETcL/G4ju7O3/+nWJuhSpt/M6vTnLU7G?=
 =?iso-8859-1?Q?2rkEVYK80ruZgUE9LAHkth0B7eSaL5G5a9u63t2ReG2O3H4OLKPxerLnxd?=
 =?iso-8859-1?Q?+OTmFTsifv6wtG8MfVMvkfWuuXms4drKt5Wn7EycD1yVi6lvSL4hsLGA?=
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
	bLsTH7+oZygsb9WjbF8kBolhTqJhzpcY7vgVkI9OymXGZFssBGw32HFfLZ7k2DEk3+cjo8Jrwf4pIB81WQFydi9LAufKYe0FLIoZwDk4+ysK15sPimfjEq3MeXibRRpIZ52QO+o8AL1u5VB09aRv1V3yLyYOXIEE+PHXgu6CP+suSOPc1ob0EI+tHMU5WpyHEcjBnSKR2J2BWhrhJqkzXPGFneiiWgjaxRVnjq7JRygUbXopoVa3DjuvQztHp7+muA3z23g5U7vggXo9IOn+8bfQPMwjDHrDlX1ZB+YuSiKORll0gKeibbJkYben3WQl/H2jPkY4RzZt6n1qYJ0qIChYe3hPEp35Eb0PBkldX/R0fI9vW3dhe1w2/sLRU8duQascVEK+vHszRzMZOgWIXhYF5aCnx5IOvR/awaB4jAy22LcQNC0/fVQ0q+SSDphDRmND0tokFQeZkp+ZaxN3UZ37lKsXZdI5xtV0azxZRZpoZtzgxBemb3KvWh+QS46NcYcqR2dGR8RHuiX1tl9MbW75sPMgkMVkIfC/jN75wogJVe0I05EdiQ4jrIBFT+bP/gN5hf+BSvAa/94a8nV1R/R4QeRBTxTq250hUg9oJakKh+CBeF1CxCwBDpCA8AVGdVVOQQ5hxPQQvc38bkwBvQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c815565-ff78-421c-4815-08dd197b7fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:33:56.9648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibqkhzY3dsimtA3oKxPOhOae0eak8/a/bTnDA/ZOdqbCRQwBcAGWHnVpotPCb+iXVlBNbiZ8/ntmlqy6ebfY9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=fNPD3Yae c=1 sm=1 tr=0 ts=6758ddf8 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=INPJFlJSa4UCX1VCkcwA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: Bz-tCvcRE4mZLBRGlR0MUitteiWAYiox
X-Proofpoint-GUID: Bz-tCvcRE4mZLBRGlR0MUitteiWAYiox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

If there's an overlapped command tag, cancel the command and respond
with RC_OVERLAPPED_TAG to host.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 123 +++++++++++++++++++++++++++-
 drivers/usb/gadget/function/tcm.h   |   5 ++
 2 files changed, 127 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index 3e04ce40a4a0..0c7a41568f40 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -685,12 +685,25 @@ static void uasp_status_data_cmpl(struct usb_ep *ep, =
struct usb_request *req)
 		break;
=20
 	case UASP_QUEUE_COMMAND:
+		/*
+		 * Overlapped command detected and cancelled.
+		 * So send overlapped attempted status.
+		 */
+		if (cmd->tmr_rsp =3D=3D RC_OVERLAPPED_TAG &&
+		    req->status =3D=3D -ECONNRESET) {
+			uasp_send_tm_response(cmd);
+			return;
+		}
+
+		hash_del(&stream->node);
+
 		/*
 		 * If no command submitted to target core here, just free the
 		 * bitmap index. This is for the cases where f_tcm handles
 		 * status response instead of the target core.
 		 */
-		if (cmd->tmr_rsp !=3D RC_RESPONSE_UNKNOWN) {
+		if (cmd->tmr_rsp !=3D RC_OVERLAPPED_TAG &&
+		    cmd->tmr_rsp !=3D RC_RESPONSE_UNKNOWN) {
 			struct se_session *se_sess;
=20
 			se_sess =3D fu->tpg->tpg_nexus->tvn_se_sess;
@@ -702,6 +715,7 @@ static void uasp_status_data_cmpl(struct usb_ep *ep, st=
ruct usb_request *req)
 		}
=20
 		usb_ep_queue(fu->ep_cmd, cmd->req, GFP_ATOMIC);
+		complete(&stream->cmd_completion);
 		break;
=20
 	default:
@@ -710,6 +724,7 @@ static void uasp_status_data_cmpl(struct usb_ep *ep, st=
ruct usb_request *req)
 	return;
=20
 cleanup:
+	hash_del(&stream->node);
 	transport_generic_free_cmd(&cmd->se_cmd, 0);
 }
=20
@@ -842,6 +857,8 @@ static void uasp_cmd_complete(struct usb_ep *ep, struct=
 usb_request *req)
=20
 static int uasp_alloc_stream_res(struct f_uas *fu, struct uas_stream *stre=
am)
 {
+	init_completion(&stream->cmd_completion);
+
 	stream->req_in =3D usb_ep_alloc_request(fu->ep_in, GFP_KERNEL);
 	if (!stream->req_in)
 		goto out;
@@ -1046,6 +1063,9 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, s=
truct usb_request *req)
 	cmd->state =3D UASP_QUEUE_COMMAND;
=20
 	if (req->status =3D=3D -ESHUTDOWN) {
+		struct uas_stream *stream =3D &cmd->fu->stream[se_cmd->map_tag];
+
+		hash_del(&stream->node);
 		target_put_sess_cmd(se_cmd);
 		transport_generic_free_cmd(&cmd->se_cmd, 0);
 		return;
@@ -1069,6 +1089,14 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, =
struct usb_request *req)
=20
 cleanup:
 	target_put_sess_cmd(se_cmd);
+
+	/* Command was aborted due to overlapped tag */
+	if (cmd->state =3D=3D UASP_QUEUE_COMMAND &&
+	    cmd->tmr_rsp =3D=3D RC_OVERLAPPED_TAG) {
+		uasp_send_tm_response(cmd);
+		return;
+	}
+
 	transport_send_check_condition_and_sense(se_cmd,
 			TCM_CHECK_CONDITION_ABORT_CMD, 0);
 }
@@ -1137,6 +1165,8 @@ static int usbg_send_read_response(struct se_cmd *se_=
cmd)
 		return uasp_send_read_response(cmd);
 }
=20
+static void usbg_aborted_task(struct se_cmd *se_cmd);
+
 static void usbg_submit_tmr(struct usbg_cmd *cmd)
 {
 	struct se_session *se_sess;
@@ -1214,6 +1244,74 @@ static void usbg_cmd_work(struct work_struct *work)
 	return;
=20
 skip:
+	if (cmd->tmr_rsp =3D=3D RC_OVERLAPPED_TAG) {
+		struct f_uas *fu =3D cmd->fu;
+		struct se_session *se_sess;
+		struct uas_stream *stream =3D NULL;
+		struct hlist_node *tmp;
+		struct usbg_cmd *active_cmd =3D NULL;
+
+		se_sess =3D cmd->fu->tpg->tpg_nexus->tvn_se_sess;
+
+		hash_for_each_possible_safe(fu->stream_hash, stream, tmp, node, cmd->tag=
) {
+			int i =3D stream - &fu->stream[0];
+
+			active_cmd =3D &((struct usbg_cmd *)se_sess->sess_cmd_map)[i];
+			if (active_cmd->tag =3D=3D cmd->tag)
+				break;
+		}
+
+		/* Sanity check */
+		if (!stream || (active_cmd && active_cmd->tag !=3D cmd->tag)) {
+			usbg_submit_command(cmd->fu, cmd->req);
+			return;
+		}
+
+		reinit_completion(&stream->cmd_completion);
+
+		/*
+		 * A UASP command consists of the command, data, and status
+		 * stages, each operating sequentially from different endpoints.
+		 *
+		 * Each USB endpoint operates independently, and depending on
+		 * hardware implementation, a completion callback for a transfer
+		 * from one endpoint may not reflect the order of completion on
+		 * the wire. This is particularly true for devices with
+		 * endpoints that have independent interrupts and event buffers.
+		 *
+		 * The driver must still detect misbehaving hosts and respond
+		 * with an overlap status. To reduce false overlap failures,
+		 * allow the active and matching stream ID a brief 1ms to
+		 * complete before responding with an overlap command failure.
+		 * Overlap failure should be rare.
+		 */
+		wait_for_completion_timeout(&stream->cmd_completion, msecs_to_jiffies(1)=
);
+
+		/* If the previous stream is completed, retry the command. */
+		if (!hash_hashed(&stream->node)) {
+			usbg_submit_command(cmd->fu, cmd->req);
+			return;
+		}
+
+		/*
+		 * The command isn't submitted to the target core, so we're safe
+		 * to remove the bitmap index from the session tag pool.
+		 */
+		sbitmap_queue_clear(&se_sess->sess_tag_pool,
+				    cmd->se_cmd.map_tag,
+				    cmd->se_cmd.map_cpu);
+
+		/*
+		 * Overlap command tag detected. Cancel any pending transfer of
+		 * the command submitted to target core.
+		 */
+		active_cmd->tmr_rsp =3D RC_OVERLAPPED_TAG;
+		usbg_aborted_task(&active_cmd->se_cmd);
+
+		/* Send the response after the transfer is aborted. */
+		return;
+	}
+
 	uasp_send_tm_response(cmd);
 }
=20
@@ -1247,6 +1345,8 @@ static int usbg_submit_command(struct f_uas *fu, stru=
ct usb_request *req)
 	struct usbg_cmd *cmd;
 	struct usbg_tpg *tpg =3D fu->tpg;
 	struct tcm_usbg_nexus *tv_nexus;
+	struct uas_stream *stream;
+	struct hlist_node *tmp;
 	struct command_iu *cmd_iu;
 	u32 cmd_len;
 	u16 scsi_tag;
@@ -1282,6 +1382,23 @@ static int usbg_submit_command(struct f_uas *fu, str=
uct usb_request *req)
 		goto skip;
 	}
=20
+	hash_for_each_possible_safe(fu->stream_hash, stream, tmp, node, scsi_tag)=
 {
+		struct usbg_cmd *active_cmd;
+		struct se_session *se_sess;
+		int i =3D stream - &fu->stream[0];
+
+		se_sess =3D cmd->fu->tpg->tpg_nexus->tvn_se_sess;
+		active_cmd =3D &((struct usbg_cmd *)se_sess->sess_cmd_map)[i];
+
+		if (active_cmd->tag =3D=3D scsi_tag) {
+			cmd->tmr_rsp =3D RC_OVERLAPPED_TAG;
+			goto skip;
+		}
+	}
+
+	stream =3D &fu->stream[cmd->se_cmd.map_tag];
+	hash_add(fu->stream_hash, &stream->node, scsi_tag);
+
 	if (iu->iu_id =3D=3D IU_ID_TASK_MGMT) {
 		struct task_mgmt_iu *tm_iu;
=20
@@ -1293,6 +1410,7 @@ static int usbg_submit_command(struct f_uas *fu, stru=
ct usb_request *req)
 	cmd_len =3D (cmd_iu->len & ~0x3) + 16;
 	if (cmd_len > USBG_MAX_CMD) {
 		target_free_tag(tv_nexus->tvn_se_sess, &cmd->se_cmd);
+		hash_del(&stream->node);
 		return -EINVAL;
 	}
 	memcpy(cmd->cmd_buf, cmd_iu->cdb, cmd_len);
@@ -1443,6 +1561,7 @@ static void usbg_release_cmd(struct se_cmd *se_cmd)
 			se_cmd);
 	struct se_session *se_sess =3D se_cmd->se_sess;
=20
+	cmd->tag =3D 0;
 	kfree(cmd->data_buf);
 	target_free_tag(se_sess, se_cmd);
 }
@@ -2467,6 +2586,8 @@ static struct usb_function *tcm_alloc(struct usb_func=
tion_instance *fi)
 	fu->function.disable =3D tcm_disable;
 	fu->function.free_func =3D tcm_free;
 	fu->tpg =3D tpg_instances[i].tpg;
+
+	hash_init(fu->stream_hash);
 	mutex_unlock(&tpg_instances_lock);
=20
 	return &fu->function;
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/functio=
n/tcm.h
index d37358f09819..f6d6c86d10b3 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -4,6 +4,7 @@
=20
 #include <linux/kref.h>
 /* #include <linux/usb/uas.h> */
+#include <linux/hashtable.h>
 #include <linux/usb/composite.h>
 #include <linux/usb/uas.h>
 #include <linux/usb/storage.h>
@@ -103,6 +104,9 @@ struct uas_stream {
 	struct usb_request	*req_in;
 	struct usb_request	*req_out;
 	struct usb_request	*req_status;
+
+	struct completion	cmd_completion;
+	struct hlist_node	node;
 };
=20
 struct usbg_cdb {
@@ -135,6 +139,7 @@ struct f_uas {
 	struct usb_ep		*ep_status;
 	struct usb_ep		*ep_cmd;
 	struct uas_stream	stream[USBG_NUM_CMDS];
+	DECLARE_HASHTABLE(stream_hash, UASP_SS_EP_COMP_LOG_STREAMS);
=20
 	/* BOT */
 	struct bot_status	bot_status;
--=20
2.28.0

