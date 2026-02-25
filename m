Return-Path: <linux-usb+bounces-33680-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJq3FHk+nmkrUQQAu9opvQ
	(envelope-from <linux-usb+bounces-33680-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 01:12:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6CE18E55C
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 01:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAEEF30AAE72
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 00:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A81A198A17;
	Wed, 25 Feb 2026 00:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rhoo4yur";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="W9Df4Tel";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hAwflvtT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7403FCC;
	Wed, 25 Feb 2026 00:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771978272; cv=fail; b=nV/jcjt8VXhpR8z6WKakGiJEu6hGz7K4qyoxFCuNoZny6qKs+HtjGTGneYaQJfc/oO1dceYi/bkHPJl0zkTsDt/Fnwton/FFzoY+MHLPGiMLG1KCHEAbDncrSlOxpA5/c2TWp/N3TXfHJIGz8YaOwzo6fBGLcaCdYBQrINYc2MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771978272; c=relaxed/simple;
	bh=5CWMOZLgpGXG3+wKiJAtJgVBAzUJ0+t9qaQJMW1mQ+M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=koDoCBc9DVTSLDHxIrH+hNDwPlDb4V/dx1izIyLE8JOxy6DgFn3XJJ1bM0Qvz3OwkGBtuTJLClMT/ROvp7Dw587YtcSI8fPW3eAU+l8poCRn/EBb3J4PcR9PEjE7T6TomOQPg0V0PuHpJJY9Zf5AmfhbQIHbZsJwqpd7aswCfKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rhoo4yur; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=W9Df4Tel; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hAwflvtT reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OLBJFw532963;
	Tue, 24 Feb 2026 16:10:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=5CWMOZLgpGXG3+wKiJAtJgVBAzUJ0+t9qaQJMW1mQ+M=; b=
	rhoo4yurR53vU+ra8Yo3y8svdvVobi91xKMyjv6HDLe8yIHwUlMMTfiPEqO2UnpK
	caVdPqlGBrfKRjMA5tmoo0jJo/k8xt7x5U3raqCsU/IC4IZffG2r25XoBN1isu55
	eZfT1dfQ9zVg5O45EKJqF2uT0q0c8Ux4wxvLbiK1qrAoBPi+0ViiO3+bGnwhDb9a
	4/lHNUx9/QovEK3GpaEWCU5ll7fNywOA+0ySZWkq5O8j5nfcuIvO0tl0kv8Dmy3N
	BSSYxxt84NJ+PPcudUhzqPiap3K5hmYpIqjhx+3u57ZvpKyfMJWFXsB5J8woVwiR
	82l28M9SIaNoIZRAO3Aq8g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4chgt2hw0k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 16:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1771978250; bh=5CWMOZLgpGXG3+wKiJAtJgVBAzUJ0+t9qaQJMW1mQ+M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=W9Df4TelIRcFKVo0aDV3/2NLAFcfCdvZiNHLhOuMK4mBiJKG8uSRPgouBg+5QvT0l
	 7C+zxSJ8mO46MdFDjOWOcaLiFuHfY94ayb3FtZxPLnk1EAyvkpRyV1DVqX71nQSVMV
	 bynRsR1pEa8XAFf1DSSe0zlBKh9yhTIoRaD0PdjlT9bXO34pDmC51DfMzRulsD1R8o
	 fdTo3rPeF0qCUtQPFvbQ1PZb6XIHl/pW0f9x4JBlnZAuq/6ZtD/zfIalqpGk6eWkML
	 tQKmAlH+cqxHAOnPD3124yceGuPV19zj/aIrLDDE8GP08LX/4NJ2DX5M05wv6o7BcT
	 FFYE0Cv7goofw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6EA934045F;
	Wed, 25 Feb 2026 00:10:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 461BFA0180;
	Wed, 25 Feb 2026 00:10:50 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=hAwflvtT;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00102.outbound.protection.outlook.com [40.93.10.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0B80440682;
	Wed, 25 Feb 2026 00:10:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4unh7ipvQ2YtNro11g35hvUx15S5UllA8Mkmgh8T94BbTiwD/08lR9XNDwT70plsG/X9ksGtMCA+IeMF8nLqb2p5Wt9WkMgHGC6kO2UXPjxpKOwVOraf6mZ2osHaqWV3kDovley887qtrMetgyZADZpOrEnMNcSLXM/uoxjuuoptk+clDICpgYIQaWNvaRn8i2b4TWF8t/qHAeC4PHZM5aV19IRvGi7bkmZAiQmkFhn2At4UrmeFoQu8834ku/4COrimcIDS8LmdnNHPr0/D1nC+7kTGhPmI9t09tzkYwxE6vvKdGTcxn2gCCl/58Vy3+Q7RMAODIpDHaNIcw98Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CWMOZLgpGXG3+wKiJAtJgVBAzUJ0+t9qaQJMW1mQ+M=;
 b=kp7MfmHOJxNJtSa4k7nRZ9J8gcYvUJPFbNwPcJ/sa5afWLqKFp/46fBVEu0YBYmcfW2DHFmVlTCxR6J2qcTyFZQetwSJE+X0csvsI0ynhOMuQd0E1nJ6kJeErucZk1bgBzut4N64JQrQXFrGm559weyyCl7Bb8iTorneZE5VBG99reanBcdFwHFbTV7xcL4/8smOkYqGUIHhTUIbB43ZJvSOm7FSY2GXMIbMCCrN1cP5LIrLkHNyUGx7ZAEWpHhpGjxjngdqkenqeKuH7efuQs7ZiLoDlPaBsDXRfpuxphHaRMq7nGosPv2ZVCdDx7zF6LjGu7WMJr4kVaIvoVzdFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CWMOZLgpGXG3+wKiJAtJgVBAzUJ0+t9qaQJMW1mQ+M=;
 b=hAwflvtT/JwsaCLg/8EQUJHvNxF7XPgL38OmuVEJGZg3XUM83Olm32o5DW9sVxEul4AvkfwciQHyv1tqs+e2DaGsx7Et8Xx8HC26F6DfmWOtWQ1aEr65uSOM4CpyMu6Oks7mwDx4k0Uc8fFNnyv1rej1vp/VQmxbYpMWimaEULc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 00:10:46 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 00:10:39 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: simplify error check in
 dwc3_qcom_find_num_ports()
Thread-Topic: [PATCH] usb: dwc3: qcom: simplify error check in
 dwc3_qcom_find_num_ports()
Thread-Index: AQHcoMX/Agr/25klTke/2w2+ee9zjrWKpCIAgACcggCABcptAIAAZVeAgAEkYAA=
Date: Wed, 25 Feb 2026 00:10:39 +0000
Message-ID: <20260225001036.gg2ghnayekrhbcxh@synopsys.com>
References: <20260224004126.ue3nfgzlf66rayfz@synopsys.com>
 <20260224064409.3888-1-zeeshanahmad022019@gmail.com>
In-Reply-To: <20260224064409.3888-1-zeeshanahmad022019@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY5PR12MB6035:EE_
x-ms-office365-filtering-correlation-id: 738c1a14-2b94-4151-5270-08de74024f15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?K3B4TFlsZXpNdkphQXpHT2FETEkyWVVEWXhjb0ZJRkk3WHN5TVJpRFJZK3My?=
 =?utf-8?B?Nks5R1RINmtBeWFWd2pJelVCZ0lTbWhuZ1BDbTRFaWozQTJ3eXk0NHR0bGc5?=
 =?utf-8?B?UUxvd1czMDM5Zi94RmppQTNib0YrUEd6Um50VUNZcDlGcCtUNTZ0SGFpVHdN?=
 =?utf-8?B?U1JDVE9TTmNJRGYwRkU0SHgyQkN3ZVFveDNkNWxmckJBc1l3ZXg5ek5yaU9l?=
 =?utf-8?B?WmwwTVY2R3BBeE03TDJ4aE9McTEvT1JLck40OCtFdHBsYkNPUXBFSjUxcmsz?=
 =?utf-8?B?dzI4dDZscHdJTTFmclpSS1Zrb0E4clY0dVYvQjJTN0hzcHBJSHQ4RFJPNmww?=
 =?utf-8?B?V2xrMWV5blRqVi9kU2E2cGl4SVJ2cGczVjFzbVQwY3NjTkJwL0dSSXc2bmdu?=
 =?utf-8?B?a2dndmpsbzdwUnhROGU5clVzN25FNVQzbFUzL0hKYjM3enVzNzdSSkR0ZjNC?=
 =?utf-8?B?c2pGUWdKdUFDNHRDbXhnRVcwS0oyYjdWMGlhdzA4UzBaZmNkYzYwVVV3a3pB?=
 =?utf-8?B?V2hmZVpsTXFyM3lDYnowallNbUpaOExneEY2ZUhGQXN5UmtseUFrMlZFT214?=
 =?utf-8?B?Q1YyTFhNUHUvSTVYVVVpeG4yRmF4WlhaUnJWWnpHcmZlMW1wQnpraEg2RGFl?=
 =?utf-8?B?cTQ3ZUxCQis1Q3YyV0JNVG1EdWRQZm1oWWplVHUzVkRZVFhTWkg2TjgzakRo?=
 =?utf-8?B?T3V2TjB6c3c2L3Z1TXZ1dnB2L1FoWUZDWWx5QVRwdURoem9nSHJIRytwSkV0?=
 =?utf-8?B?VVBtaHpMeVh4Rjg3TVdYcGxJUEZDa2FuSTRzZXJGNjA0WGpYMzV6RnR4TVBB?=
 =?utf-8?B?QXdnV25odGwxZEVWK3BFNGFjSW40OGhQOVIvUHNjSStqQXA1YmpXMUgyZW52?=
 =?utf-8?B?U3pNVStnaGNSckx6OTVnMU4vbDN6bm5ZSFg3dWFXNnlFVFg1dUh4SUlCNndL?=
 =?utf-8?B?T1d3TGRMT3hIdDJlSXRXdk50ODJmTzBaRXVFWjdIWVJoT0lxT3FYakZIYVVO?=
 =?utf-8?B?ODB2MloyMnlNZHlJUjZVYzNRQ0NrMnJyU3JVdkpDVkdlSDVseGhONS9mZDlL?=
 =?utf-8?B?eVNQQTZPbWVrZjBNNEdxSVo3ZjBKazZ4ZThXOEtjdUhIaWtoMkt4S3hhbmRR?=
 =?utf-8?B?QUJUMFlqdDJ5OFhvcEp3eDE2ZTMxVzBZSDcwN2dZZDNtYXliaWgrRTM5T3hm?=
 =?utf-8?B?cXdVTmdWbVFYZm9VL2ZzM2NIZGJOSzZ5K2VrNWVSc0FNQmNFcXhwQ2psNDBY?=
 =?utf-8?B?T3JoS1hZc1V4bUN6bzZDSlZJRTNyVEdoNUhVR2syTmhQWlZZQWNHUHNybFp3?=
 =?utf-8?B?QXRkV3JpS0xzUGU3NVdTQ3RsZ0FJdi80RTllcTd6QnVQRG0rNU54Wm1UcU56?=
 =?utf-8?B?QU11OGloVUQ3NXBZWUV0S2d3bEtYRklCb1AwV0hRb1NhRlpSQ3pTdGNIemlN?=
 =?utf-8?B?Nk85UUhUUmZFeTNTbWVHT3JoVnFkRHNTL2h4QkUrZzdkMHpvamNyNTZjQmEw?=
 =?utf-8?B?RitRdkRBc3FUUDFSWUVKNk1EcnNOOVVNWmNhNkV0bzg2Z3krSjJXQ1ZQV29Y?=
 =?utf-8?B?c3luUTg5Qzlka0RvT1pXTnBUcjBDa1ZpUURFMFFNS1granRJeDRsZVdaMHds?=
 =?utf-8?B?NjJHRi9RQ2EwNVZ1RkdvUTVMdWk0QUl4L21zWGZBelkwWXhBc2h0VGc0bC9p?=
 =?utf-8?B?ejJ3Smd6NWhHeU9saEVtc0hodFBWbENoUlNPeHdBRG1BeWhSVXl2UDRtVkF0?=
 =?utf-8?B?dzhzcU53SHhXQk5hZTdpMm01WEg4NGhqdloyU2RHN3oxWm4rc0YyR1NDSHgw?=
 =?utf-8?B?UHZqMEYzMWV1d0dnT0xDZm9yZEwwVjBScjVNOHhlTVVVVEtqdFFxc2pyV0Rj?=
 =?utf-8?B?RDFjdjlvQSt3SGhOQU5LenBnZm50R3pBaDRSTGZzcTkxanNTSEdmcFFaNWxh?=
 =?utf-8?B?WCtwd3ZIUnc2VEZYK2tIQ0xiZmtpbERmUys5cnkzblhuNW12MHhWa1RQRmVw?=
 =?utf-8?B?UTlHNmlVaUtGZDUrcUlwNEJtWkIycU5MQWZ5V1N5eUI5aWNqK3crK0ptTEhS?=
 =?utf-8?B?eEVnSVJxVjhKWGlqS0U5ZjhPR0xkMnJwejhwUzRRQm5QeCszRUc0YVd1QmdW?=
 =?utf-8?B?UFcyVm5ZNER4MXYxSTQrZERKUVZES3hxQmdISGlCOFBHdkg5WGFDRXlIZDYx?=
 =?utf-8?Q?+vTMOiCrz29p+gIZCI0KzLE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TTRRc1RtdW9OZHVvN0lOZlk2eSszTU5HMzg1eStLWHZzck4rQzVOTGd4bkc4?=
 =?utf-8?B?VlNLRm1GRTlwczZOa0p2VEpNdjRiTXZpVXhFMWR0bUJoaVU5TWhzd3U2NW5y?=
 =?utf-8?B?SExMdnpaMlZxd2FnV0VFcndCZkFQQk94eGIwK2ZDQzZnTEIyUmYvREZuV08r?=
 =?utf-8?B?Z0VIMmtqbTlrQjlGS0plU2JINkJNeFdWbmRPUUV0ZTV1Q013Y3pRR0h1REhY?=
 =?utf-8?B?RVZoZHBxOGhGajIrU01JRXc1a1dFRmlvSkFqa0hieDNRS3Y2NDdpa3hEbi9r?=
 =?utf-8?B?ZDFPVThmUEtEQVQ1ZUZWRkpWR3k1U3MzQ3lnSDQzd1MwbnRmRDM1ekp3UlUr?=
 =?utf-8?B?RnFaSEtiblBVR0U1T2ZpTTlyd3pwWHhGT1JIZFBSRTY0b09KU2VpUkFrNkVS?=
 =?utf-8?B?QmNHSnhYUnFsWG9uaG5oTWNpYyt0eGVnek1UbExGWENxeWN0aUN0MWgyZUtG?=
 =?utf-8?B?dDluWkpyeHlhbDk2SVc2U3VsV3ErbmhjN0NBVVFXYlR6ajQvcDZBRGNjUXEx?=
 =?utf-8?B?VzFBU2t3MnpLNDFMNmszRTBUUzZnVDAyUlFUenJscUc1NGJPbS82MTFlUFg3?=
 =?utf-8?B?UVRzSzA4dVZTc1RzM2FaOFJYZlpXWEphYXRlb2dHcVdVTjQ1emFLRGRrY25U?=
 =?utf-8?B?REcrLzkrM21pQjFaNmcyell0MlR5VTY2WnR4dUxsZlZja1ZTei9jSWRNV2M1?=
 =?utf-8?B?THpvVmMvamRaODF2bXpQQ2U5U3V4ekJESDN4N1RwZFB4VWY1L1NXTUpZTnB1?=
 =?utf-8?B?S2g1cEd4UElTMGNPOUJpYXorU1BTZUFobGFjRmcxSkdicVpJWVZWT04zNEY4?=
 =?utf-8?B?UlJZZ1pKTUl5VWh1OUhaZWliL1FKVWd5bjdYeGUzamJxTTVPNnZkakJuWXpI?=
 =?utf-8?B?clFEWFFKamVYTElvY09QSS9jN0o3NkoyR05ORkJra2RxVmprM2VvYzV6TGJI?=
 =?utf-8?B?VXBHcUFqUDFZbW02UmN0Q1dMUU13MGQvVFQ2Q3JqeUhuZHNQODFvYXhsRjNU?=
 =?utf-8?B?d2JRd2s2cnhpeGRJenB5T0NacllvN2ZNMllmdXpGSCtXb3lSVXRteDBaK25F?=
 =?utf-8?B?QkFDSE9lV2lCOHBXQVhkcDk1L25ES0VhNXV3MFBXeUdjRkh5dEsvK2lkWXBH?=
 =?utf-8?B?OWQ1MDJZVmJNR2o2MG1LUjJhNzVMc1hwVkYvTmR2OWpUOGRDMm5VTDJHY0xX?=
 =?utf-8?B?SU53eGVHY3pLenQ5dnZISnZwbi94Y1p2VDYrdzNGVm1wM2l1RnU4UEdMLzJP?=
 =?utf-8?B?ZTU3WDBnVXJvMVBUcHFWcU9zMVRtaU1ML1ZkNGlELzF6MzlTemkwVVB2NHJu?=
 =?utf-8?B?Q1RUbHhZbFRNWlErSHdVVk5IYzIzSlhlZ05zZ2ZoMHE5RUZoQ1lTbUhST0tI?=
 =?utf-8?B?c2RWdis3QmVHUXNMRXk2ek5udlR0MDRPK3RPajEvWGVmeDZINDVMZ1hqYXda?=
 =?utf-8?B?ZDg3R2hpczRPSGZGV1hHOHdyUFQvcktQS1hPd042ZW1VRVdOOXNhemtZUlFV?=
 =?utf-8?B?eUtDRFNsNzluOXVlcE9ud0Z5SmFLS2V5eU1OZHpaYWE5VjE1eTNoTGI5UHRk?=
 =?utf-8?B?MEg5V2szaUlRcHBmbHc3ZU95ajljQTBabEFENytkclJvRHp6M1pqeGl3Y3Iw?=
 =?utf-8?B?ZXhrOXR6SFJMbzYyWVVxY3o1L3JEc0pVV1JROWVzbWUzSGFYK29WNmRYbS9o?=
 =?utf-8?B?YkFvM3NnYi9adUR5aDhSY3hkMjhnMWZybmMybExQTWFuL0dGY3ZrMS82QmRH?=
 =?utf-8?B?ZStMWGdYM3ZPV1lsNldHMCtSTFBKS1F5ZzJEYTFzL3hnYzFkTi9yZm1OQ0Ry?=
 =?utf-8?B?YVNmbWxpdWtmNFVkOEYxT1lBejFUalREQ25IaUswV2tBMFFLemF1WEpVMW42?=
 =?utf-8?B?YjZUSGZjWXF4Nlpua3hIRFRuMFlaQ3BlWEVBcWswVEtYRDc2SmVYblg1YzRl?=
 =?utf-8?B?c0duUHdvbDRwS3Rpc1YxQ2xRRVUrV3NsR2Jkby82NzM5NXM1SkNWUWFKZWxV?=
 =?utf-8?B?dEw2eVZuYVJCVjhIS2MrQXR2SHZDQmNXeTNIbnZiRDBJNm5mQlFMYllnNkcy?=
 =?utf-8?B?aTZpMVA0TjZNRXZ0MmlWci9pMmI1THZzcDVUOUcwWWVjN0g0SVhpYlpiV0VS?=
 =?utf-8?B?MVpWT1dEeUNyRjB2dDVlRG5ZTVUxelBJcUFWZkpzRXErYXNISmJteWZaQU11?=
 =?utf-8?B?K216WDgyVnNMZjU2NUx6NzlTWTJCRG1YQUlUUVFEZUJwUVBYT2hlZTJPMW0r?=
 =?utf-8?B?RXNXTHJmSmR1N0daYUhpSlZuNG42N0VhdU0zWUhiczRYaThWNlI0UXBNNjZ2?=
 =?utf-8?B?TGhFcktORWtHLzdCeGplMUdtWHQvemNzQ3JwVytqU1E5MVFhYXg5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <481F2AFE6463094BA28E4A8ADC908B02@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LSlipZnrrb6X/6Hlkq86C0XFx2jhnl520v8KgCG2OVFXpdSq8avjCndTgo1xIcWhboNZPG+Sc+5GbbegK8qzznf3gXmh+mcdqOo9RfTn28gBIHuEkcgEnKU+Ojg3f4OFkCqgFbn/H7Lk6LC2JAHKcHQgghkh9hgqPBekFDjkdOpG+QNHXExrB8rvD3FwcWQOvXxdyw/kUyQXk3EdxLjh8OQdtH/ex29FZlIHhhhhoK7gga6wbjX19Zbn+q9C/yrEYOxCau6Dmii6DeamoUlRwh153w/3TN5Vf3UY9c8TJdV6uH+2SBLZMUcPEX3fMfJXTeIBGvO9oSAGbXe6EK/ResddthEzKrbcwmVk/pOTAW41STOIHMQmyhNenSX4FcmM2M3sPKDYmuEs2pspOhkq9l8s2llDuU2iPiI7NLxipgXBZhMXY4OeDPB43//mo/O7e8GLrZnf2nF9wQxJPrF42DAzGFrxC+FTJnly9aFB/91eCugO9GTXx65zccGh1DLFjf57ciElZsw460Cn18yM3sixpZWNWbKG3PZWf0Dlr4lUWV7jAPSdQmgWvw2By6XtHiMU+tcwaHmujbLmjvyC6lT10r7Wbz3V+B96NrY8PdI94hFK6QG3nbs7tLClAiMoB04lICPFwDgQD9ATiBKClQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738c1a14-2b94-4151-5270-08de74024f15
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 00:10:39.8366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: niwwMouHwlXmantSFwghckE3SKEC1Klycc7V/QFh3kRGi46VeUV4kDsJATnc4YsMJ8kYzZNuOUHT+kj+KoZmEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035
X-Proofpoint-GUID: SBMZsvEefuuuYKQUcNkBlksjyeK1sh3C
X-Authority-Analysis: v=2.4 cv=beVmkePB c=1 sm=1 tr=0 ts=699e3e0b cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=4y6thssrPNcO1YLS34cA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: SBMZsvEefuuuYKQUcNkBlksjyeK1sh3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDIxNCBTYWx0ZWRfXwtiXEqTybMtr
 4QGRgpqD4Rg8ybJuGdcqnOyGrglcLIa2xZV+oHzKIA5a6Us1a/IAD6MA28sxjILWnbwS6QHHG9s
 L6VAwGdME2Ftqi3bPlGLBOLgwT4xs7oM8zVeMtINm2voKLa7uhs70IR6QUzKBWnUzucad0bcYQ6
 C3Ns9u99AJCJZOx+apNFbKFicUPjPTV03UJaUaYI1kBqaQDGcTwZDhbGxHWM5qtviOcmE4/LquR
 CoFiZ7wT13HLuU9kQxr6eoM1mZtsyu8qIDdecsu/98hMq6HqGKMVLoW9VwFyYwLukTH/UApgCZ3
 xMGQp1xE5Ol8a/bnyYK3t50hymE1wTBiIU1S6BBtbbLxk5CN7zadAkMQUwTGKwSzhORwBlwtBWf
 aVhuCV8XmOoQ0fQlGVaf2TR0NsZD0WIUSRGAGhL5Zhm0+R7kI0qFpvO947vu1+663jyOyMFOeES
 sc0NEUNwOMFzVy7m/kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602240214
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33680-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CA6CE18E55C
X-Rspamd-Action: no action

T24gVHVlLCBGZWIgMjQsIDIwMjYsIFplZXNoYW4gQWhtYWQgd3JvdGU6DQo+IEhpIFRoaW5oLA0K
PiANCj4gVGhhbmsgeW91IGZvciB0aGUgc3VnZ2VzdGlvbi4gSSBoYXZlIGF1ZGl0ZWQgdGhlIG1v
ZGVybiANCj4gZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyBkcml2ZXIgb24gdGhlIGxhdGVz
dCB1c2ItbmV4dCBicmFuY2ggDQo+IGFuZCBjb25maXJtZWQgdGhhdCBpdCBjb250YWlucyB0aGUg
c2FtZSByZWR1bmRhbnQgSVJRIGVycm9yIGNoZWNrcy4NCj4gDQo+IEkgd2lsbCBkcm9wIHRoZSBw
cmV2aW91cyBwYXRjaCBmb3IgdGhlIGxlZ2FjeSBkcml2ZXIgYW5kIHN1Ym1pdCBhIA0KPiBuZXcg
cGF0Y2ggdGFyZ2V0aW5nIHRoZSBtYWluIGR3YzMtcWNvbSBkcml2ZXIgc2hvcnRseS4NCj4gDQoN
CkhpIFplZXNoYW4sDQoNClN1cmUuIENvdWxkIHlvdSBhbHNvIGtlZXAgc29tZSByZWxldmFudCBj
b250ZXh0IGZyb20gdGhlIHByZXZpb3VzIGVtYWlsDQp0aHJlYWQgaW4geW91ciByZXBseT8gVGhp
cyB3aWxsIGhlbHAgdXMgZm9sbG93IHRoZSBjb252ZXJzYXRpb24gbW9yZQ0KZWFzaWx5Lg0KDQpU
aGFua3MsDQpUaGluaA==

