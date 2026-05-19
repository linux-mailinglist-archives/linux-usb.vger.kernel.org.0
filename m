Return-Path: <linux-usb+bounces-37742-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IJgDsvmDGoopwUAu9opvQ
	(envelope-from <linux-usb+bounces-37742-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 00:40:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F16D585BF5
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 00:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81CD5301875F
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 22:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CF536E470;
	Tue, 19 May 2026 22:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dZ0qQ8PE";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QwnW6vJI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EMwd/TC9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD88B18FDDE;
	Tue, 19 May 2026 22:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779230404; cv=fail; b=kJgoyI9uBCAWMXxBe6/ORQze4NODi3ws1cbpxMq7p3s+X5MoCj22calfQ/HS5jEjqEe+oAkXOWdQomrEiOrFJryVmPn9HS/pc9UvatTSw3yrc2D99dfX1S7rklBPmjGHb251He2zYogspHrCA3By52fkQvMN4tFisqRHCq1SrHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779230404; c=relaxed/simple;
	bh=mLF0gN6q5z90tmIe8c7BuRDsVj8JrthnE05LwwO/yDU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tV9BeclNEzgwH2mGTpWg0Y4VobhkHNG1w5AkaI4BTfZ1WjyaS9kMblehGHjIrLQM7OdrcBIDb89tv1PAnL20TJ3X3hO7Mh0LkCHXChDJGRhbYw7nFuA0eslH26xXdI/sR4Oaxf/YSF7op6FqB9eSSKq7X0s7ofED7XXCyHnNhtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dZ0qQ8PE; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QwnW6vJI; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EMwd/TC9 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JLGCOw2201190;
	Tue, 19 May 2026 15:39:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=mLF0gN6q5z90tmIe8c7BuRDsVj8JrthnE05LwwO/yDU=; b=
	dZ0qQ8PEzWbve7jbvYbq8mSi3duzGIh1ptTw8jHSUIw1AwZAZPMASq7Zt85GHhL6
	cmr0sovA6oW8IO1ncepTQP/fPKhHxZBK1lRabukx+CpLs1w+ZbaEHlgQjgFqxc2d
	I7jzgJAX8ZDaIGc/0UY+eMA9dloGlrlF4WJXGsMF/6kMTh/rC/vmRiLeWSYfpa6D
	4ABkWLeJd/KGXmCkJKq/TM6BTQzKGeWcy0JtI8vM9O4+0KfsF1y2FX2Zo7fnODQw
	TmerdAhQXS+lhaQnfgnSqbagmelcvASTuN60+OndKq4RGihFx6aB29sOcm85UJk8
	idgqyd4gjngJoV+DBt56JQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4e8ymm0g7e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 15:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1779230375; bh=mLF0gN6q5z90tmIe8c7BuRDsVj8JrthnE05LwwO/yDU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QwnW6vJIARdKbI01l0yhk0tPlFUnKf1hOfd4na4YOufGLjnPixOuZ56OJW3yeWgVT
	 VsqGhpo8bcqsbqmW9jsL4QNnU58p515gm3gA3i4Z2kynWfaOVa6CHBS3gd1cpSLbj5
	 H75CvwnryNhuiIqwPFh8FkcU2SYhNCgPuzyVf/shwe7E3/AzaiUWMFGWyvwXKkVDaU
	 niSHkvNpvseV7ZWVT5ctTozqeWOyslXqHs27Vv3biBdR207NYGToXG1eln6ulnYl/I
	 9vFLDUgOsU/y55+HjryyQwzArAdithPwd+Uns/GFdazmjk5SX+Jhc0uHFHAn1AwBDX
	 Jh6cZ5sJ920dg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C2A0A4041B;
	Tue, 19 May 2026 22:39:33 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 72F1EA09FF;
	Tue, 19 May 2026 22:39:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=EMwd/TC9;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00306.outbound.protection.outlook.com [40.93.1.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1545840361;
	Tue, 19 May 2026 22:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjqFSIhY/aFJ3uM8N7W+lWC4OCKi1kR3ZY6qTE54bSoqy6R+Q3tbZBr3KOfHOt9h2IEKRXGcdPi/TiPFHd2XnJfD3GtFf1CRYyadiYCMeRKQkvHcoT+W1VUnDMYyNHX5Vu7sT/xAucYUCo9mEnpg4J3oj0GBvQF0YQF3JzcBj/PSRongRfCTOCaOBh8ucHvXphOU42J6QNp1rGEwuBqMuEyd+NF5BYAhV9sjSACmrQ7gS5zCIzZsFMYr328Bpa8itoNz8OpvFuDLNpdphBYYY9xOObAFHupGFdwySUuobzsp7zUZ9B+4cxYQt4DpEBWszUOoUvH7LfHe+XfU4gfttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLF0gN6q5z90tmIe8c7BuRDsVj8JrthnE05LwwO/yDU=;
 b=gsJX9lyV1hXYOcjGll/dqdpUFHqlOXB/jOdMGCw6bYHaSdy/H/VQY1d5RZXurVCpGha7XAt2OVjNgRCs2aU/xazltGl+sVY5L/YMu2zP9sFQg/dwnSN4LQBfhmV4vU2t4gaWYN3VDzHQSnpidtQH0+HNQWepCQ91BjXjBEUDyHEq9uyXvHbbmT4NTDaxcjZ6w91x+2zwIJEx/R+biJ3Cvb2hb4O9UikDWFE+xVD8HAmxcN9dEI2BCPtzkafyYdVGdVkmd6vNQoIIWy8Z8J+jaQm3TyyulsIxlI+7ovETFXJE7EySMiLBDqv///Ok+y9gjyPnyvfGiuTbJTuX6ZiDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLF0gN6q5z90tmIe8c7BuRDsVj8JrthnE05LwwO/yDU=;
 b=EMwd/TC9Vf24/BQVA6D9FecgTAC4eNzkm53keow1yeeAsg2DipS/dOWQTZT77ip1f9usM1Ba/slMVAupkQGfC8dD4bQ1YM24u4E2H2d+XizZWKlYRxpFEcSY1L1gcqTVBMMz9RV/Te1UDvMYzAtBC2zMmDIoc4U9UatbrvNeuow=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ5PPFA5F0E981D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 19 May
 2026 22:39:27 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 22:39:26 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Pandey, Radhey Shyam" <radheys@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH 2/3] usb: dwc3: xilinx: use reset_control_reset() in
 versal init
Thread-Topic: [PATCH 2/3] usb: dwc3: xilinx: use reset_control_reset() in
 versal init
Thread-Index: AQHc4WB7RBHa6DOuxk6FKzMpQbn6XLYMwJMAgAch/wCAAhtbAA==
Date: Tue, 19 May 2026 22:39:25 +0000
Message-ID: <agzmZOrMiqMxj3bz@vbox>
References: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
 <20260511160814.2904882-3-radhey.shyam.pandey@amd.com>
 <agUltzvDFgJtPa6j@vbox> <95361d3a-34b6-4f0f-935e-9e1b45698e81@amd.com>
In-Reply-To: <95361d3a-34b6-4f0f-935e-9e1b45698e81@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ5PPFA5F0E981D:EE_
x-ms-office365-filtering-correlation-id: b3a8f74c-dbcb-432c-150c-08deb5f77b1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|5023799004|56012099003|18002099003|22082099003|4143699003;
x-microsoft-antispam-message-info:
 UGE30/Ge6QpABzaHkWTNGb9DVCc0M69qL/CStzrvy0+g6qYhVyqgxyTBhFNzIUR2h3gt1mWuNUAu82ar10V9azPDkV1PX/35RRPe6XRlOGv1oU6afNV3CgBs5p5rAbazUY1AF5NVeUXLamlCTcI2Ndnfp8lGfPBtP6VLN17nrVaFdSEznMbvyf3ebIR0DEWPR/Gs/GoSBGjT4+ugSQBNJAkJP3kSYkUhlSVlXoyBFonfpNSrv1rClSjMy6iqyLqS84cQk+d1LuJPyatUFVTxpnfhJJH2fmWwdMFMFc6WF5r2PUxNPxwHJbT6x2xn7cx3KmYMdLF9eO8GZd8mzquby36R1NFpcoOo+t/2Mw0s74OATKAEMnk32/+isqZ+cXwh1i6lGNLF/jvupkmHmed7WP3gPas7kHY2uYbiGceVMRuyPr20I9wJsCrTGkfD0/U9JxqBcttKL3BOwiD5xQL89wFsLEyEME7tqBJ758W7Vp9kBSktzoNtsE6unN0GhWA6aamaWKuMuGS+RjQl0t1accOsFtIX7io4gUy1+kITC1e9h2xv86hL+z/36eZXRv+6Tz5jBXiGdq0Z9RVgnK9CEC+v0kXRWfr+aU9qsh7VRdtmeNvTFsz7CxtT/Bp7NYlHqHTsUpV9mChp+pM05MmipSa9BgnmqkBAktrD24brdwV9rz9iz042bAVlPetPHVEhGGVLEwCphZOIhkFS2ppM15QRgmWv8soWgJO0JDfaXBeZHRUKcDGvVL1BEjm23kan
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(5023799004)(56012099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UG9zQnd2Mms3VGV0SDZDcy9MZUNqTHVObE1TTFpDa3pPcXRpVlBvVEQ1RGV1?=
 =?utf-8?B?U2x2Mjh3MWp0V3ZNaGJIVjNxekoxK1JmdzQ3bDU3ODhPSFlxUFdGbTEwV3pT?=
 =?utf-8?B?VEtTUTUrMUwrK2FPb3ZlWkUrYzhVQTJQcUFaUE4raXBaZVp2N3FKV2U4Y3I3?=
 =?utf-8?B?QzhxUGh3TWRUY1dWUmhyQlpXUlk1OTFGTU9kZytBWVpXUENlWGdkN2tDRmYr?=
 =?utf-8?B?YXpOaXpDWXNoVnZsTS9Sekk5d1BJRTRsVlBjUjB5UnZuNEo5ZWZneDlNU3FG?=
 =?utf-8?B?ZTZSalVWSmxoQkVkYjFhWklXTnZLUVZwb0dEK0I5MGlicTdaK2doeEtNTERh?=
 =?utf-8?B?ZU9oOXZDZFJjNU5JYnRUN1V1blFyWjRSVmtmdTVLYzdBYlFQRHhMN2VQTjcy?=
 =?utf-8?B?Y2NvQ0JFVmNiaU5TVUxKT2lpZ0N0MlFpVThlamZBUDZ2czcxZ2VrM25sa0tR?=
 =?utf-8?B?Z1BKSDUxb3JoUFg3endnQlZPdUVxTmdHN28rVEFDamdLWUw1aUdvbEtodjZO?=
 =?utf-8?B?SUh1ekZGUW1MSk5VUGI2R25POUJDZTh2OHVzQzFJNkV3dzBGVnBRM0U2alE1?=
 =?utf-8?B?TzRlUjdnQVR1SGJUR2JBS1lHNlNrTHk0clU5WmtXSnpxN0I2dlNkWlArK04x?=
 =?utf-8?B?cmpzVkM1Tmo3YnNJNFFoZlVjMkVVWjFmQndPL3NrcFhsN05VbVFzbXE2UEFD?=
 =?utf-8?B?NTU4ditZR0pFdW5obXM3a21uT3Z6cnpRR1BDVTUwYy9TWHVwRTl3WXdjRFZV?=
 =?utf-8?B?YWpwK2Z5Q2lvS0l2YmtiYWFhNGl4aCtIbGptbU9ZNllVSVZoY3NmMWtFcTR0?=
 =?utf-8?B?N0pnNVF3RmluemxDVzJEa2VtTVZwdlJnYjNwYkw1SnZMSWVHYkdVRHVWSm94?=
 =?utf-8?B?WnhpcXdTdG9XRjRpNDRjajMvNm9KMWVSelloUHl5cDFOMFpScmVubUNUTEw1?=
 =?utf-8?B?Q2ExNzdlSGpPRWNHdTdzTlE0T0hid1VjSzh5cjZ2OWR4VTY1a0Nnb012WUZ1?=
 =?utf-8?B?Ym05bmJDTXFqcFUySFF4azQwcmtTUkJDT0l0MVBYaGtuQ05zQW0rQmJ2MlVq?=
 =?utf-8?B?ZHVpZThRSjJNOGZIR3VBd0tzaHYzYUhkRzhwdXhGQWRVeWxHRXh4VWRneHFT?=
 =?utf-8?B?eWUxTVgrbVQrMTdVaFJuYjhxRGs5TEtQWm54UVRaNDlMZkk5T3hqNjlXTHZa?=
 =?utf-8?B?ZTJ5L3JmQ2Z1MXB5M1l5Uy9Lc09ORm02Vld4YlRKc0VJRGpRRHNkS2tZczg0?=
 =?utf-8?B?VWlNNldONCtrNUIvaGErUGlPQzF1ejV6VUJaVHBLbHdmaE14bXJUYWtKdjAx?=
 =?utf-8?B?QWZPd080dUxZdUFiT2Y0WVM3ZGVKUFUzQWhJWG9TckdNalRHUHY4cVpJRVly?=
 =?utf-8?B?cVByUTBveFMra1V0YjRNaEsrZE1zZEFQSWw3cThpa0pHOU85S0ZVVFIzRTQ2?=
 =?utf-8?B?Z0Fqemd1K2ZYd093cWZha3dRT2NWNmtka0I3SjI1RFdpRDJXUzMzdFRYOHg2?=
 =?utf-8?B?bjJaYWhEZ0xBYnp0U2FFeTBDbVJuSjFybHl0OE1paXdMR2VEaEJmN3J3TkJm?=
 =?utf-8?B?WlNiTS9mRlkrTkk1QTUyRUtUYmdLZEVxVHd4WnlNU1RpbzlzV1dTKzE2TnNW?=
 =?utf-8?B?YkUwY3h5MEVNWXg3b1FDSEh5TkdFZk4yd1oyeEcwOE1yUDhiSnh3TjRJc0hz?=
 =?utf-8?B?ZGcybkJyQnQzMTlLZVoxb0ppV2RJbHRQcWF4SnVTTTNZRHZHY3g2eXJmd043?=
 =?utf-8?B?L2ttbWRQek9pUERwNkNMOFcwYndNS1RKNHo5bWd1VExVdFo4TVY4UjhHQVhl?=
 =?utf-8?B?NnMxNW0xZ28reTU5UUVNU1Zybm5CUE9mWW54aGE5K0hSbWxaWDVFNG82TzVB?=
 =?utf-8?B?cG1EajdmVVJQSEF2VDltd2dHUGYzNUhkaDE2enk5U2VlY003dWtPYVFwUzY0?=
 =?utf-8?B?d2RKSXdVa1BIODZxNTRLbysrWWRBZGY3L0dCMDdvZUZMM2xCV09oTC9VQmMx?=
 =?utf-8?B?SnRlYUFzU2hLSmcxR3Q5M2hSR0J6dTlTdmJPSUhYUW5nWS9uZnFjSklkaXRy?=
 =?utf-8?B?eGR3bURkRDhQNFZ3NHFUQWxFUUJQVFU5NDVTUnhUVjNNZFl3aUxheUVuNlRk?=
 =?utf-8?B?Z20yNTlBQnNzeGRGZ3FPbjN6aGlHb0h6NDJwTTQ1K2drQ1hIZG9vUk00amU0?=
 =?utf-8?B?VmFuZmlEeHpKMzhIMk9FUUI2M0xoOWV2d0N5ancyY25NQzEzams3VSswcHFD?=
 =?utf-8?B?cHpmejI4NlkyeGNQeUU3aFhGS25EcFZJUG0zL09zSnJVY08yc04xKzgrT1k4?=
 =?utf-8?B?Ky9ZSWJpamh2eEE1S1BzTkVBR2dTM2UzQ0Z4aXZoTE1FWUU3THJadz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7099CA0BD4DA0E4DB0F35E70D0411B6D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	sXijpiTgvU2EKWlzxuaJfxNQtXb9aq9HNqqWkz/IQCK8jeFy2w1HU8aOwYUCATm5s6pXzSuOpL/Wqsd5Z/7QHMgDrPypKvMiVjIWWGL/5DvQOMpfqgk0Y2zeDjOwUDzK1+qyCgkWZfjW4MR2Ofue/ibHVGn92Xha7vHgWhskPi/DhihTN+3px4ayjVmkQHYB61KxySSJ+6rwzevrFaz3SuDm3a8WSmhbm/a6a/60Sa8k30MSWrFvFooxpccV4UPBwlqXE75ERiYW6Kcd4C+O7GcXGw01Dg2aTVSMuoqr+N00s/BbDErkuGJMw+Z1xPglV+FgklWM/5cmo186M6wycg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aIDJiEUrem3Rnbp11Dmziibupu5Ra8HL7lrBmXLZxB56SE0glG18XsX38b/ypKTpJY3I6cubM/uwN7qNurmsPE4xVt62V7Bl0axR8zmMxBVujLIBVviQ49bM/bKXgko36KkuDaBDtZgbgLbKBW4rZfkNbMwRwfsaibmbM9o1Y21ieFwiR2w5CRj0a+cQDM6XlTdVs2IWrDHAMtBpeBQzYIn/SkiGX+TRzs5WhswH0CqUqvt04yXgk+9/T538sxbrtvlhf4SiZgnEL8p72zBHo4qIGH0arZxU6kfksojvXPFZcYMncrcVqj5f2k1QDYPUx4y9GP9RGrkbT8yaEivVkR4k6fYRkAROMIZsBAkRrfiHX9DYWPt1IS7MqwXV4ytNUQ48p9PccIg4OfZy3MupHRIigzaVprjQgXahcOqzVAv9HrhngIkCspSuFNzzvq4rViCKg/tBXm1gQTs5cPNWnaJ6JsO+F2l+PsBN3YEok8/WTqmrY6viFWvUj6P8XvpUsINy7Y369vSMkh7FVmqmDFl1y2sbrH2z2bSPcpEM/bjQmKFzx3W9tOS4yp1oqab9V3kJ3iBZdlu4jNB8Bi7Frco/OemKpsE+7dVJAfuAYMMgwXQkca5CC4y3BvE1UZ68yAk3VmescsuIoHyzCNYG4w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a8f74c-dbcb-432c-150c-08deb5f77b1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 22:39:26.0170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Inu+eY6pOswL6qRDNzzAvgQNmePy24quPUcoQNiifBdJp/hf+3QkVY5x7KLFOBrZELISVyRplcD/GLEvUP+2JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA5F0E981D
X-Proofpoint-GUID: ecbXXZVDZo7If8GbWCgxug6GG9rW4-Eh
X-Proofpoint-ORIG-GUID: ecbXXZVDZo7If8GbWCgxug6GG9rW4-Eh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDIyNiBTYWx0ZWRfXyudzQnATs74E
 KcqAxMs1tgB9vlT283PsZ//++yYWJfeKbAdlcGCNg3AwLE0+faf0GXaG8Zmj3Ns3CAPb+83QrT9
 sWzsYsK/Mr6/U312ED8hfa7Eb9gmH3B77Om9a+JwGUXTM7RJ5Yaal01+Z0voiW7lolLx/Z7zC8L
 hAJRzmeahrqFhS9SbCi0yJwPWH/guzcVADazStE15bmGjsZwU1gHNfES4XuBzt+WormwOLh7umP
 hiixJvJ0xxIZvFAd4ZqHbzscpGQx0L5VRWPYVvcZku0xN8AMR7KP15viKi5VRdAxIjREYqy9QK9
 NMrdq/JSXU2ZBxOdmS2mea1MUtXwxHsboX1gDPqeVlSyuW13bwk2YqdvzFWy7m1IK9KE0L8BR7c
 w1MbpFeJnla6aAirhfJB3Iub3YiVKtxWYFqbIaXhPDQ3QfwstvH0HmZMVRrQdu2EZNOXpJp41xg
 a7OjTLOPykAuMkC8Ncg==
X-Authority-Analysis: v=2.4 cv=B/uJFutM c=1 sm=1 tr=0 ts=6a0ce6a8 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=b39l5BzqGWVSCvltU3gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605130000 definitions=main-2605190226
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37742-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,synopsys.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8F16D585BF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBNYXkgMTgsIDIwMjYsIFBhbmRleSwgUmFkaGV5IFNoeWFtIHdyb3RlOg0KPiBPbiA1
LzE0LzIwMjYgNzowNCBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIE1vbiwgTWF5IDEx
LCAyMDI2LCBSYWRoZXkgU2h5YW0gUGFuZGV5IHdyb3RlOg0KPiA+ID4gUmVwbGFjZSBzZXBhcmF0
ZSByZXNldF9jb250cm9sX2Fzc2VydCgpIGFuZCByZXNldF9jb250cm9sX2RlYXNzZXJ0KCkgY2Fs
bHMNCj4gPiA+IHdpdGggcmVzZXRfY29udHJvbF9yZXNldCgpLCB3aGljaCBwdWxzZXMgdGhlIHJl
c2V0IGluIG9uZSBzdGVwLiBSZXBvcnQNCj4gPiA+IGZhaWx1cmVzIHdpdGggZGV2X2Vycl9wcm9i
ZSgpIGFuZCBhIHNpbmdsZSBtZXNzYWdlLiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gPiA+IA0K
PiA+IA0KPiA+IFRoZSBiZWhhdmlvciBvZiByZXNldF9jb250cm9sX3Jlc2V0KCkgaXMgYSBsaXR0
bGUgZGlmZmVyZW50LiBJIHdvdWxkbid0DQo+ID4gY2FsbCB0aGlzICJObyBmdW5jdGlvbmFsIGNo
YW5nZSIuIEhvd2V2ZXIsIEkgYXNzdW1lZCB0aGlzIHdhcyB0ZXN0ZWQuDQo+ID4gUGxlYXNlIHBy
b3ZpZGUgYSBwcm9wZXIgcmVhc29uIGZvciB0aGlzIGNoYW5nZSBpbiB0aGUgY2hhbmdlIGxvZy4N
Cj4gDQo+IEluIHRoZSBkd2MzLXhpbGlueCBjYXNlLCByZXNldF9jb250cm9sX3Jlc2V0KCkgcm91
dGVzIHRocm91Z2ggdGhlDQo+IHp5bnFtcCByZXNldCBkcml2ZXIgYW5kIGludm9rZXMgUE1fUkVT
RVRfQUNUSU9OX1BVTFNFLiBUaGlzIHRyaWdnZXJzDQo+IHRoZSBYaWxpbnggZmlybXdhcmUgcmVz
ZXQgaW1wbGVtZW50YXRpb24sIHdoaWNoIHBlcmZvcm1zIGJvdGggYXNzZXJ0DQo+IGFuZCBkZWFz
c2VydC4gRWZmZWN0aXZlbHksIHJlc2V0KCkgaXNzdWVzIGEgc2luZ2xlIFNNQyBjYWxsIGZvciBh
DQo+IHJlc2V0IHB1bHNlIGluc3RlYWQgb2Ygc2VwYXJhdGUgYXNzZXJ0IGFuZCBkZWFzc2VydCBj
YWxscyBhbmQgbW92ZXMNCj4gSVAgb3V0IG9mIHJlc2V0Lg0KPiANCj4gWWVzIHRoaXMgbmV3IHJl
c2V0IHNlcXVlbmNlIGlzIHZhbGlkYXRlZCBvbiBIVy4gSSB3aWxsIGluY2x1ZGUNCj4gYWJvdmUg
ZGVzY3JpcHRpb24gYW5kIHJlc3BpbiB2Mi4uDQo+IA0KDQpUaGFua3MhDQpUaGluaA==

