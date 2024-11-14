Return-Path: <linux-usb+bounces-17567-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B439C7FAC
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 02:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47BAC2819AA
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 01:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DFF1C3045;
	Thu, 14 Nov 2024 01:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VLRuEl9Y";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GzW3awP4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XnmbqLNV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A147A1BD4E2
	for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 01:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731546153; cv=fail; b=sVghIDL/CXn2RdZWz6VkimYMjNf7WclnXC0JaaLInCV8U3tS/GtDp9FkC3mRuQndvLoP3aRzdzCD3/G2C3SzZP1biOqjHoQ0YFPtRN2YKw/klRODzuuNQSDQzNKsT6Sd160sFDiq1yAUXrj+MXNtyuF0DI444vCnybjx/Afr9+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731546153; c=relaxed/simple;
	bh=FHTUUJ7qKEZA/q5TIky9WmrO6KJtNZEJrx1+RI4/bpM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pUMHho2hoN6a1ti3Qp9w21vB3x9yqfW6bjqvXQzFZXknkFULbKjm69MoLWCivTTc2ZvIz3WRxAhIo9gawfGqgz1IZXMoQDes6vrV23mza8IaVZztjZQ3t3gLdtXmYzisYTVgxRm4CB4KIc6fcQ2KDnZldxmZD4QNhnTlSkmNrjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VLRuEl9Y; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GzW3awP4; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XnmbqLNV reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADI8MjY025589;
	Wed, 13 Nov 2024 17:02:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=pCx4DzcQ1qvgYLFQfd70bRciH4JDFqV1FeqKAmaYRiQ=; b=VLRuEl9Ynmvn
	q23smoSdUxczOfuT/W3pJqqe8iCdIzz+KNx+S1aQqRApKiGohjLfrlGzxMs+fzO2
	O3hkRgeraw0z7sInHJoFYv4ISELl4pBVcEqj95KD7+EmAhNE/YftYfmoZEqXZ+eg
	UZwLzR/UAknZtCRegL6fAOIfz2tT3cIvCfUsgaIIDMIXg9ycn2+c7AMjtfu1rTSO
	N099YRiAic+V+ynEpm0uBR5++E4dlh08h7hr5BpYaHNhApbzYgb1JeMavfPOY5xK
	GeFzolsIS/XSFHJW88PTJSLTu3Wy/2ZUtwBUjAqm7Tjn+Q7pCdO7iqxvyHEGOdXK
	RONmxM4wTA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 42t78m26rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 17:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1731546148; bh=FHTUUJ7qKEZA/q5TIky9WmrO6KJtNZEJrx1+RI4/bpM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GzW3awP4faPQ07cuwPq0KtHrgZkLfS3/MqpLvRWwmPNQiK2Ltz3x3x8n0WkpNYUBD
	 +x6WwTvLlMT6/0bLHxO5vT1mGq/2nxqPcndxo7Nu9XWx0ay3x1I2gdjBzNuDzEpajX
	 LdML9S82aXTk3Hb7ZRaUVLYjEam9+2u44gExvySvOm4Mru+oL9jCtAg8X58HWzzPS/
	 Y7/w7aUSsCL61tO8vaPgV1DOZJ3kLutLlYqGtBBwuadoNDCR56Fqr18Wsw5HNdRHY8
	 2s2HUFRu78aeT6yiWPOOkfGmGv0/TFPL+/SBqhUaa8mkHry+a80GsWIsUqkZBLwsHf
	 GVPpjQ4KaIiXA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6CE1B40107;
	Thu, 14 Nov 2024 01:02:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 38FFCA006F;
	Thu, 14 Nov 2024 01:02:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=XnmbqLNV;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E1F9B4045D;
	Thu, 14 Nov 2024 01:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qc3urZxiro1V+qcVIx6diHIxcNGVPGihR0AHFq7y9/qlk+Ko9CBGBTyedO4lbyFiD/uUEEQXLhQLyG+FY8QK8QS2rlBzgGg1vwro7fznO74o/Gy+gBREZ1CXYriBd0Bd+oftmTT/IZcJ0v749LP0pwXpzmXYnv4DXFB62d5Zh/Mc5zMioO1VcQEHPEPLu3gDlR8XHzgPsh7Cwg1D4IsQqHTQgl5NLpkQtwd+4IYmoZpKoUNnKBUNgmHWUbivEt9jArchPO1EMy6pjLvr8YpilMAoGgiu8XsNmsmwGNyHMYbMqVT0a95AHWS4QSZ7mP6zOTLuxV6T2zeQCOSXPYswnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCx4DzcQ1qvgYLFQfd70bRciH4JDFqV1FeqKAmaYRiQ=;
 b=IJxspEx/4iW88c8UIqmrDGyi2SkCbP9pYdoGhrrYExSvYhBQCIwQh6GCrdun/EvUkblrEaz03rEyUDctjtRF0bO4tV0t2nEFb6KyuQhXrUT95H2sv0T2+7NLRvTRoM4NwRH638RU18qiqTC2ABREHlc/3HjUb0aoZPMpCbFTCqbYLjIx9yz/91rzS2ddGZtDYjZ9iuMkuOUzAnyMrLIXqoRWT8ysrJSzGHbY9MJgXz3cSJrcnBbV0qm3Q4369HKpTwmAlMw8SBJcXyxFmSsthlk5iidwLoM7ymFm20PjcpduIQw5aBscnUm5jA9SiY45T2vbL9A5bP2DOqGI1PWm4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCx4DzcQ1qvgYLFQfd70bRciH4JDFqV1FeqKAmaYRiQ=;
 b=XnmbqLNVfvXQdsNRT1+sBu+n4F52u8i+mDKXDPdyeRv3qd5bRCHSjcEKhPA/VYydJ1W7mQpaf37/jMazRnqClJ4eXSLqd+QQjGhsGdtHSCw+P/cleTkhlVia5+jaRw6HBTa6vMwgHLmK4A1T6lO2PagNMLVejivlOFr3/+Bas/k=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 01:02:24 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 01:02:24 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>
Subject: [PATCH 4/5] usb: dwc3: gadget: Cleanup SG handling
Thread-Topic: [PATCH 4/5] usb: dwc3: gadget: Cleanup SG handling
Thread-Index: AQHbNjDdzdsm46mJS0eT4Iz6c7PlNw==
Date: Thu, 14 Nov 2024 01:02:24 +0000
Message-ID:
 <96c7bf8f6b3e91e607d5b78ea51cb1d00c614eaf.1731545781.git.Thinh.Nguyen@synopsys.com>
References: <cover.1731545781.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1731545781.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA3PR12MB7950:EE_
x-ms-office365-filtering-correlation-id: a232daa4-4c20-438c-5dcc-08dd04480065
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YHFv+bAtYHXWbUhIZo2gX7rckrnHeHlfiIDAwydwPHd0lVcZ+BmS0Bwrx6?=
 =?iso-8859-1?Q?88ZAfTYnpg/M8oDYgJuMFoojlo28YcCcOSHlN6Bt3Krd/Ch7Kf+fgrl5S/?=
 =?iso-8859-1?Q?B1S7JHxPKtpaWmvndQok/qDB2LibmQWh/nvfBrcuqDR3jTj5hBD3wP7smf?=
 =?iso-8859-1?Q?6LTUNwzd1U69RGmV0aFDMMjQEnAcdMcrIk7gPI8dcxZPAzsOYs0F/H6fnZ?=
 =?iso-8859-1?Q?cwSKOUdCss7eTjc2idcq98Pf44wAE9e/nVoE1dy7NEgU1qBWw1w0AfYaP0?=
 =?iso-8859-1?Q?MXAeLW8pIvE18xXSftptj3p2X4tHFCDx/xOgv/aQ7CaN5d+w9+cPiX1oG4?=
 =?iso-8859-1?Q?phNK2s6G2Ee+W8UjOZKOG2D0tAmgSj+52m3aKKYydi4z0XqnaIAHzzlfXd?=
 =?iso-8859-1?Q?KYZ4MEICXcs4cAq3l75Ui5mNw+QiB70iN00q5bWFOosLgYIUZy/d9Ys8jS?=
 =?iso-8859-1?Q?KkF8TvzQMMQNh9JYqcY1BM9Z+Dd+sRRppvifYMw+Trk4/MHknl7A1YfwDE?=
 =?iso-8859-1?Q?gmO/4I1rPDG/hb0lo5RbODyXoQ1XBJeHO3XuF5QlBdHsxxGWgKcpc4w+6F?=
 =?iso-8859-1?Q?nZ2uBiQ7CaxfYrrSy6FZglUnwpOv0gSHZpmb4zpFxOvK9b3uaeamghLTWC?=
 =?iso-8859-1?Q?Fjt4u84EL5avY8tlH6v18xUZ1LCBmCDFzsDNkCC5pD6isnBMJFHnh9II0I?=
 =?iso-8859-1?Q?y8lLnJElyEySDqbVSmaGSJfpedv7zapc6ABTvWqF0ZvwjsWOXTQmkLl0C5?=
 =?iso-8859-1?Q?Q/TVA1gg2woMM142ZAjAmeDKwyNXe26rtabM4uCBJC6QTZ3qA3enHdbH9K?=
 =?iso-8859-1?Q?dUc4jQGt6LUAyfFPAUemKCSRnCGm+zzepvmlkzGrNc8XPNUrtq5WbKEIm7?=
 =?iso-8859-1?Q?ZY6C+tucu35FilE2UJDlU/mj7TKsNyiLpxCGrjMrlekoO1A/rWcm4yQC73?=
 =?iso-8859-1?Q?hU3xqLRaYHWSBVPKvFwh2WxogxVkyPtusDyjw/uvIkAIAsIL6NC5lKV8eo?=
 =?iso-8859-1?Q?7rRPcYZclY5+y9/RUyrA9faFrPDQ9Jkjn+T3sY1btvtTltOjsFFZju1OAb?=
 =?iso-8859-1?Q?Hppx384bf/RzmaLbUVpWTWeZnxlwCvbdYIwpXkMumEa/jYHRaQ7B+vCxxw?=
 =?iso-8859-1?Q?0ltrp900DiHzm//+lrdufNNUfiXOptmj/U2C0YAek3lWRkrfzjNsUQns7l?=
 =?iso-8859-1?Q?OLooayxwj8CtPsuPKAQHWCqdt2Cmf+mu1Bu26f0eT/22kFuXYgwcCFvskU?=
 =?iso-8859-1?Q?+dAIT3lyCSKt4tKufF2yKzBhkZ+fTJeKnkOh6ZPIvMap9X7Xfw8+2wC90/?=
 =?iso-8859-1?Q?eKPxbAkCSW7fFkEyyJ03mMOFheevgKA8tPBo0hCy/j0jFex6/tGu77aHsI?=
 =?iso-8859-1?Q?FQPu8CJc2l6D4jvyjsLzFW4YQjNjT1kyJqYcp43QDMfnG+I0GsGsM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2kBK5staA9RHlOIWtaq+3gtPqk5mjJKSw2XS7ZheChsyfyTK/wP7z9KXyM?=
 =?iso-8859-1?Q?zbqJ6zttH9w+lv9NYN38UbrVvpnIkVXXnoolw78F3HBiK0+N53Abmhqcym?=
 =?iso-8859-1?Q?8iaKnFEvEdqznoIL7SYvjcm1R9Z28KCvcvVQlTzFkEoTPmSQKw6C2sSHfY?=
 =?iso-8859-1?Q?rjxDYYZSAGXyFvOaksul9GqBi4GFbTDmLeBc77eU1GCs9Yhjn8rjJxhmel?=
 =?iso-8859-1?Q?cI4MrXMRkQQgB9qfu0J5Nw2ID4tsJ+3TAAxomEAeH2yMuuGDbljzigI6TN?=
 =?iso-8859-1?Q?kMLMJS1y3VtU76RZsVMHgc06y4yLgVWE1YMnR/szgFUJndCjUom1nfzPhB?=
 =?iso-8859-1?Q?iQMgHbp7sNZqd+hX4KPFUieyGDeUWnYtgEUiJyjuUPGtBIrsSYfyvkbZDF?=
 =?iso-8859-1?Q?qMxJNfCcYAOEiFULu6SIiH9xgzWuDsLDgOa5FuKCp26c0+Qmiv/oKKpbQp?=
 =?iso-8859-1?Q?eR64n/tH0OK3LZXTw3+7Gp4dZ/+uJAwcjtpd91Et2mZu+IyjT+7oXzjwp5?=
 =?iso-8859-1?Q?DqQCxA7TIlamf+2KE7PJk9q9TK6BD7G48poJlXlTukRRUeIAl9xcJnBIqF?=
 =?iso-8859-1?Q?78aSty/nBrKBF7qT8Y20r/V5nDKHuFqMCbeqLmvMk8AvpYK9c/e9vtsCG9?=
 =?iso-8859-1?Q?/YDv9xepe0rG4QPEAyl6xnZAQ5OFgjwtzvpzytWpctgWF6KtDVB5F3TmOe?=
 =?iso-8859-1?Q?ilq+h3yt/RRvKQkmEpPCxabTjDNAl7wYJTl9YRccBTjy5eH4l//GoeIDzk?=
 =?iso-8859-1?Q?7Rn7Ed8d/zhcDyBJFUGFZAWzjUZdrtQa5aJO9cTnEWqKp0c5Ygr+KAcaOy?=
 =?iso-8859-1?Q?l5vM8A0rXQwgAVclnXbcX8uqFt/RjUZ4hIacWvuHnq6Onmj8YUHSSSlj89?=
 =?iso-8859-1?Q?LTGC1QaMBFheLCR5unvt62n1laUI4WS6ArJbKez9zf70gqNrdktRlUCfdo?=
 =?iso-8859-1?Q?Jk725LljIGsS7EWXIHVYMMFlJlhrvtpqysvMYBgLevswpYAvKBxFT44j5D?=
 =?iso-8859-1?Q?mUxZbeYGqozNBj10bF4hMLu9fwjRuWwUCcTxXwUDDGYBmKBJ1Sve4lvk2U?=
 =?iso-8859-1?Q?RCLzw57uZKRBg1L8Z/BI7VPHD7EfUnuNv+7WHJmuKQYLOXndqeG/32G2Za?=
 =?iso-8859-1?Q?6B8rIyAXr6bFEJvEqm51/j0HotB4257XFYmGSBTbJ/KgEPXUN+KScMK280?=
 =?iso-8859-1?Q?VWP7pB0Az19TSU1L2O6ph+NCMkjX7wyUDms6ApmWuwpdv3MqpuLBV00b5j?=
 =?iso-8859-1?Q?crsLUosIL6C+L8mwgaVzTejZLGchwmazfBk1ScebGO9dkTswKnNmNRIwnn?=
 =?iso-8859-1?Q?9erkawLFIVBcWQLv9+qqudntkH4M7gJ+pETq5zHFxRWp8LKM1Kxh1Ire3y?=
 =?iso-8859-1?Q?JdFRpyz+OBrDb7cP/UAlrnuLNbTlhWdCcafJ9G3j4EhT30cPcwMFl013LR?=
 =?iso-8859-1?Q?G/o5a2EAMYlZVsfSZLos9au6ds0sap7I/silNC9dcCesezO6unP2ooZN5H?=
 =?iso-8859-1?Q?m0+rXD5AadhwhORTV2KFhKSObKpian69pneCbGcU/rCBr+FmRM3fSC5xOg?=
 =?iso-8859-1?Q?Y3cJ8WSP5JgV0aC5637hiN3Rdi/5nqW1/16iujHYHMFLSM3KpXvLOhu2xZ?=
 =?iso-8859-1?Q?o36oRdM01YbZXKxg7/KhkplOwycxaD1Hzc?=
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
	4/7l8tm1II9UYKHsGtVsLuWg1fg5ubMySc0ZyKeTPCP+inxjHpM5PJi+YkKPxYlNI+MNIJd7oM75iLG+WPooB7e5pSreeYB9+OAeajR7a9VYdP7Qf3OCWAcwz/csbRjhA3TeAH1iuNi0GupFOcEJkbuckQ1zhc8gwMUIo0uceaUx1lpgq/LhEam8qWjexTPeLw5v6IBj8APISL7oYEWmctPMZDXvtumQxFeTmUW8WfRJBxxDdhVmZPolSDO1fafIsXrIPgYDDHm1GKRKE2zOLK9QBMOvsNFP2NfUcvpsXvjZK5Se8zUygNrbyyPF1i0ticpJgpQ2W9XnuezKUAA8b/+sdZAVN8Tt8Du+sej7H43YutySrw18KpH9Eza8DZi4/rR21H49WffjpMewADyBI46AgqPlRTYIBlAXP4kp/htvLjHJhB0DOt9H0+XhcQRjtmhCIWZr30nEqWHw5o18J2mGriPZFsfVVyTr/j28cUuMGEfpOBges6XNVrMm3EKJwYdlSs2JG20I8ZeYOdTqIHpDACf5CiMaUXWN4PMsb62EXDRhtAqfv/a1Vqyso8hDLMoZNblcTZ+SgqC+r4nEYT/0o2xvjdkO6p5BTltMuiANqc3WR2XGD2n/+PNNMRJYLgMz8UkqO2qbQgfKftIe+Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a232daa4-4c20-438c-5dcc-08dd04480065
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 01:02:24.6767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9azI3k6Or2o2KD0fiIHyPWG1WJYRZIuSACld5Va8GBEcERkgJrMCTUoCOk4++dmP8MFc0YGlF3/HQSBdZfB9dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950
X-Proofpoint-ORIG-GUID: lYUxVgDzwscraqvXiDJNNkbgMeermTJ2
X-Authority-Analysis: v=2.4 cv=NPuH+F6g c=1 sm=1 tr=0 ts=67354c25 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=9dXq-v3q9CYHDsQcqtMA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: lYUxVgDzwscraqvXiDJNNkbgMeermTJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140005

The current logic in dwc3 driver is tracking req->num_queued_sgs and
req->sg. But they can be checked base on the num_pending_sgs and
num_trbs. They are redundant and can complicate the SG logic. Let's
remove them.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.h   |  3 ---
 drivers/usb/dwc3/gadget.c | 42 +++++++--------------------------------
 2 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 2dccd8fa7efd..aa09ccbf34a5 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -941,10 +941,8 @@ struct dwc3_hwparams {
  * @request: struct usb_request to be transferred
  * @list: a list_head used for request queueing
  * @dep: struct dwc3_ep owning this request
- * @sg: pointer to first incomplete sg
  * @start_sg: pointer to the sg which should be queued next
  * @num_pending_sgs: counter to pending sgs
- * @num_queued_sgs: counter to the number of sgs which already got queued
  * @remaining: amount of data remaining
  * @status: internal dwc3 request status tracking
  * @epnum: endpoint number to which this request refers
@@ -964,7 +962,6 @@ struct dwc3_request {
 	struct scatterlist	*start_sg;
=20
 	unsigned int		num_pending_sgs;
-	unsigned int		num_queued_sgs;
 	unsigned int		remaining;
=20
 	unsigned int		status;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 3a5a0d8be33c..687bb8cc4114 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1544,7 +1544,6 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 		if (!last_sg)
 			req->start_sg =3D sg_next(s);
=20
-		req->num_queued_sgs++;
 		req->num_pending_sgs--;
=20
 		/*
@@ -1625,9 +1624,7 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 		if (ret)
 			return ret;
=20
-		req->sg			=3D req->request.sg;
-		req->start_sg		=3D req->sg;
-		req->num_queued_sgs	=3D 0;
+		req->start_sg		=3D req->request.sg;
 		req->num_pending_sgs	=3D req->request.num_mapped_sgs;
=20
 		if (req->num_pending_sgs > 0) {
@@ -3472,20 +3469,16 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dwc=
3_ep *dep,
 		int status)
 {
 	struct dwc3_trb *trb;
-	struct scatterlist *sg =3D req->sg;
-	struct scatterlist *s;
-	unsigned int num_queued =3D req->num_queued_sgs;
+	unsigned int num_completed_trbs =3D req->num_trbs;
 	unsigned int i;
 	int ret =3D 0;
=20
-	for_each_sg(sg, s, num_queued, i) {
+	for (i =3D 0; i < num_completed_trbs; i++) {
 		trb =3D &dep->trb_pool[dep->trb_dequeue];
=20
-		req->sg =3D sg_next(s);
-		req->num_queued_sgs--;
-
 		ret =3D dwc3_gadget_ep_reclaim_completed_trb(dep, req,
-				trb, event, status, true);
+				trb, event, status,
+				!!(trb->ctrl & DWC3_TRB_CTRL_CHN));
 		if (ret)
 			break;
 	}
@@ -3493,19 +3486,9 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dwc3=
_ep *dep,
 	return ret;
 }
=20
-static int dwc3_gadget_ep_reclaim_trb_linear(struct dwc3_ep *dep,
-		struct dwc3_request *req, const struct dwc3_event_depevt *event,
-		int status)
-{
-	struct dwc3_trb *trb =3D &dep->trb_pool[dep->trb_dequeue];
-
-	return dwc3_gadget_ep_reclaim_completed_trb(dep, req, trb,
-			event, status, false);
-}
-
 static bool dwc3_gadget_ep_request_completed(struct dwc3_request *req)
 {
-	return req->num_pending_sgs =3D=3D 0 && req->num_queued_sgs =3D=3D 0;
+	return req->num_pending_sgs =3D=3D 0 && req->num_trbs =3D=3D 0;
 }
=20
 static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
@@ -3515,24 +3498,13 @@ static int dwc3_gadget_ep_cleanup_completed_request=
(struct dwc3_ep *dep,
 	int request_status;
 	int ret;
=20
-	if (req->request.num_mapped_sgs)
-		ret =3D dwc3_gadget_ep_reclaim_trb_sg(dep, req, event,
-				status);
-	else
-		ret =3D dwc3_gadget_ep_reclaim_trb_linear(dep, req, event,
-				status);
+	ret =3D dwc3_gadget_ep_reclaim_trb_sg(dep, req, event, status);
=20
 	req->request.actual =3D req->request.length - req->remaining;
=20
 	if (!dwc3_gadget_ep_request_completed(req))
 		goto out;
=20
-	if (req->needs_extra_trb) {
-		ret =3D dwc3_gadget_ep_reclaim_trb_linear(dep, req, event,
-				status);
-		req->needs_extra_trb =3D false;
-	}
-
 	/*
 	 * The event status only reflects the status of the TRB with IOC set.
 	 * For the requests that don't set interrupt on completion, the driver
--=20
2.28.0

