Return-Path: <linux-usb+bounces-18343-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 957AD9EC0D5
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFB001885E8B
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFF92451C7;
	Wed, 11 Dec 2024 00:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LvV2akBx";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Uw2IZSzG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OBhv+STA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C606C8494
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877185; cv=fail; b=Kzow9pSp34TpelIBwWVp2bUkk+RmrTfonq4K5O/09CowZ+oaCLVajo8RQi1akKsoEVod+P94jbNAZpWIow6XoJf3Sf0YV6lwlmVA/mtf41lM+Rwy2aN5Tz1o7PU7b54wp50BSoPW31fcOJjMs4Gx1N3r5gW1+OtZzSoQ/UnHZ00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877185; c=relaxed/simple;
	bh=0fx+SRMyzKxxo9CO5A76Ok9xSR5EnWE5hqDPm7nxU14=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lQ779wg79/aSu1SHHdFE2ZmfcJZdXk+5N0YyMa5diYVtFIo3vK8zF3I3N0CXpZ8IPIFxYOOpA4RX41CWBDgmJ8nTpqXrxK3/YBU66AyA3KyU2Opf345UDNHbE6j0+yMPWsO0EIrK9jxZ5jOqFh16Uw6Bbd91M7JvIExHoi2zOLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LvV2akBx; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Uw2IZSzG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OBhv+STA reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAMVk5v010832;
	Tue, 10 Dec 2024 16:32:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=8Bv1tBnG1SyZ8ix4xy59Ksw+STI4cVhg+BbSg/TVKq0=; b=LvV2akBxIbF0
	vCyhUihqkHfw4DECaPV73UZt4ibOhD+o7DvA3neFepIHrnjo8Eb25qxGOkSh5gTg
	SOs7rPYnSD5SHInf1gDk+vN+jUuPehjBwzbzFZ0VMZr93rt7R8icHr6OVLmmC7Db
	GHYZ/bbxmVgSzkYFF9y8aar7KTeZel1uDOftS3wsC1EDeGz6V2/ijJca+Jz6Ll7J
	ETJ4ZUR2xA9oCQum5snhaA0aUb7H65WDh+m4GncGlp4yHFe+KfhKj77HjioN3IcJ
	4mPc5NnkV+yBQGj9PrRcqIXQq2FOUfInXlNrC2z8/OtPH9T7LpyJTZqe2rI/i1eO
	MqS726839A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cpgb9pxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877178; bh=0fx+SRMyzKxxo9CO5A76Ok9xSR5EnWE5hqDPm7nxU14=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Uw2IZSzGe4ROXRmLLU7vkhMVl2Ic3JYoxL1O3vhGGo8/4IXE9U+fD6wovI95NWTuK
	 z++x7yWPpJbhhfhwMkvgziNi33d4LDDU3194Yf9jCgGmu6RBM+7uZ8p08NNs44mENA
	 CRxTC3e/zmAoM1/0NrndnT5BQRf7xYx6SctCSsGkN6uE333h4YnpzFcWoFHKPGLYop
	 XjGQdjLuEgl6mK9PVjURLDDlcBlHnY0H5/lI4Xc6rRs4onfiI78hCUiOSk59u7ZSCx
	 2pxbkyGqSmFnhmK+SJvJ1mhUjhhJ0m/b9XzOWo3wXxPU6Cl79Ee6oXhn7iy/zu/A9t
	 EUdNN/0kCRQeQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AE62940593;
	Wed, 11 Dec 2024 00:32:58 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 7EDD7A0068;
	Wed, 11 Dec 2024 00:32:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OBhv+STA;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 37F67401EF;
	Wed, 11 Dec 2024 00:32:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKDW6C71p5ZLYS/K4NrdqOMgUkMNiR/RTtD21hwbqh3JuSPdksYn1xwgWWGOqME7SOqYZnEc0DRqfzLQ7Mw73SiuxD7XOnGCbOywpsYIdzMc0fa6p92kittaCrsGTUx4izL4bRn5up3ko2iVGCuOX1r4/hotonfaG7VVdsH/2diCcVhaV0tSHZYQ+Ce/DYDGr4xeJWEmOqTrOUE71iyX0G9n5iPejuGDazSvfcBMhEkmikfptHIqeNa9o3qYSs2zI1MwyF7zFHegETAXBn/p8JLPv6cxxx19s9BKxjHXGSC9ykP781p+1mYQrDuRVl1kSxjnUW41i8WECI14LHRppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Bv1tBnG1SyZ8ix4xy59Ksw+STI4cVhg+BbSg/TVKq0=;
 b=ZVISBL1wBf8g60h4pP0zyAqQaLDDKBetYBmNJZoFKGqY5RDiL6PvaVDeoyYnWNZ29Af8BtjynXkUuL9NW3Tk8lmQwnD8eFJUX6t2l0Gn6Wrjy+I3epjO21klnFAXsj83d06r73ArCoeTq42j39VJIaIa55wC4uN+mWULPzScLASLhPIWksx6fDvTv7jIwpuYnXtdxgSrFpdZuIHl01hVKNpBdK1/g8ZOpbHpwcTpo6k/oEHacmhapZK4vrXYOeIoHTHM3CJEx7cOerNjPrhArF6esE3wHgZbJ5+Os68e7F4HN8yV2Gr9vnHoiQ+JkJpMieG4VLEd3R7U5tPZ8kLHCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Bv1tBnG1SyZ8ix4xy59Ksw+STI4cVhg+BbSg/TVKq0=;
 b=OBhv+STAPKicYf/ObypjL9JVBaqCsqisigtZhV4ifkuTBoTVXyPlLRAjNEJoDpwkB2dB0sGE+4rLGGSTt46U3YIdu2EV0fWQuWCxc4zh+41reJH6KYBndRrMVjIJxpzYRchqZRcL4P4rw5PI7/OMirfiMnyzPFWY1VgimoFAhOs=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:32:55 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:32:55 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 14/28] usb: gadget: f_tcm: Use extra number of commands
Thread-Topic: [PATCH v3 14/28] usb: gadget: f_tcm: Use extra number of
 commands
Thread-Index: AQHbS2Q4FnDID5Kh7USAYQZK7+RvqA==
Date: Wed, 11 Dec 2024 00:32:55 +0000
Message-ID:
 <256f2ec8f5e042ab692d9593144fa75f3d3ce94b.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: e31e769a-9b29-42ec-8e86-08dd197b5ae9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tykEZclPwwZ3B8Ga39muqaP6PKLv4GyDGy7Gif31Ck3/43vHNb7Fv69tS6?=
 =?iso-8859-1?Q?8SqyLMGInmUFSB46Pm3RqVIii73JR0pEoh6e3MDbulN98sYC/vfQN5cWP3?=
 =?iso-8859-1?Q?jd2jPFMty8+QQyXHhmAaiMg+axzWS2Humc/nsLChgbbFYcSuGJH5sIaUHg?=
 =?iso-8859-1?Q?f/KmcY5fT1QbOR2N0Clpn99bcj1AW3Q/stA3AjjI1AwX0PrZGcpYYVOFGx?=
 =?iso-8859-1?Q?cKtrtMzjwv64qaHB5R0dF3vAP9rpAsguhoBunwm8ZqTKMds9MS3C5XJUbM?=
 =?iso-8859-1?Q?neQzlsOXs9gYJvbD4vjnVf11brJpSqZINmsQ0IBvHoBnvw1AC+bPoA+EJt?=
 =?iso-8859-1?Q?zoRNbN7Au3BK1tsMCazrpj5a6bNqdyeUlwM67QH+0F6sJM6N7kb7phoUEY?=
 =?iso-8859-1?Q?+jrQelOw+PrUv2DQJJWdjLBKvX6kDvbwnxMw+KXb+jn0Cq4hJIGAi+IcGR?=
 =?iso-8859-1?Q?r3KGBri2mYEIUpudOMu5NJ2205AlXgq6FyDxQVxSzLeU7QaF+zWAzWbMUj?=
 =?iso-8859-1?Q?8uUfG7ld9m18zedy4OQFPebAA33u+D7NmwB0yAWLN5wpSfLCeUa0Ox8TL1?=
 =?iso-8859-1?Q?4Q1+dosMU3IH/2OaX7on/FmXP/AGuqgQbynO7oU7CAey21kpEjWE+VI+E8?=
 =?iso-8859-1?Q?05EKIDq7JTYG6wQO4AXMfFcYJRF4kkXUr2ZZ/G6Tpikp4Ny9992flqofHR?=
 =?iso-8859-1?Q?MAXeVwbdgVWwPuE/+hisGP/dJvIwcIQCSvpyHh9nU2yr6C97aDsOgYCKi7?=
 =?iso-8859-1?Q?Df4QpC3eGaQ5sJkScdpobihAvBgie7+kWMDZYbHZRU4V3VpaUOLaarPLXt?=
 =?iso-8859-1?Q?tzNXWgLQ6FdEllXD1rwBOmfn96PgnxUnNXw3+8zE4Tto8Xb9akoXWTKRv3?=
 =?iso-8859-1?Q?NEWBRErwNDvBfMqJ6bCQAqinZl22GgfACOiu9BDjg8ioMhMrVeNQ08xW5e?=
 =?iso-8859-1?Q?3uWc1CM7+l4eqJ5C2uin1lx+PBSbTHZRqQChw+kF3M6CXGc/RR+6NwTVi0?=
 =?iso-8859-1?Q?ML5fZsSYYKx5objom7j8tA8FLagQhy7inPK71/AfTAiUuBj/P2NKrwuO3e?=
 =?iso-8859-1?Q?SNLO6COrMru46YloyH04S5N5jBIoJpp34HLs06k6VvEGdTnMOtPsLb8tVb?=
 =?iso-8859-1?Q?ahgNPr4mzuKPjV8WvadGrr15sDVrPpDN0VJCn828KHOdBVsWwRkLBv3fhH?=
 =?iso-8859-1?Q?179cVt9md/ePVkwaDZJoie7kIQmGLmbT3vPit0VexFrwrDd3So2/CdI/Rm?=
 =?iso-8859-1?Q?J3Rr6AfhZefPoNCfgh5fpprxVnrZHDjyAWvOB6itME51+EIxb+Ej9kecgK?=
 =?iso-8859-1?Q?VOYambVWbJxr7mtmCPasNI4Mzi47BW3x9aRJoEl0aePdd77IbkLTVCYwqD?=
 =?iso-8859-1?Q?w+qVfaC6veQE3QIKr+mSu9Bn09Q5AYAxhelig9mbtQgqq2kwaob4DLiwWu?=
 =?iso-8859-1?Q?lHh2LsTo1Qr/ijpBRDSSN0tquoEyVz50GOLiag=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kiIu7/l6C1AONyN7un1ybctpxyE6oNX3Rfl4MkydcvWWpTzjvqsXh5Fqr/?=
 =?iso-8859-1?Q?wngibindXPy7dHhcpW/vZC0tUSgdCowJa3HVZT6K3PZZS9RclKB1F7fRKZ?=
 =?iso-8859-1?Q?BhuYpaZUKkDns9pS9A6eE5Zr3Shm8NSVD0dNrRGsWl1zEelYeTX8+FnfmC?=
 =?iso-8859-1?Q?/sLFhufGOI2LFs36w3xh76S8EhG/I+RV5rkcIgswbpoGbCI6eIk0t6iPRa?=
 =?iso-8859-1?Q?e/fXe8T7e1gIGbmj4SqfE5T3qAXZ/df1AxulPeIHMD5ia4mucVZa0LWxqp?=
 =?iso-8859-1?Q?lGSvwbVd2RKqNWKxnDMYdigwCUsDW81GADJKGld7i0mJWZsWkbhxSEUZM1?=
 =?iso-8859-1?Q?1jN1XQKuOIKDwyH7+QeaxdW6fa3+RePQbBbTL9pxxpdPQ3YqizDHHFtrB4?=
 =?iso-8859-1?Q?aF1zG64bgEFpfQczQwYdtbBUyEqCuABBAQHBCsUo2+wc1UQFWUj4AZPoxa?=
 =?iso-8859-1?Q?qljDDTWJR78ngC4x0Ef6U2IzPH4OpdC11dxpdpDiuu789HHuPCoIEoz5Te?=
 =?iso-8859-1?Q?LNOsF/F3l1jPb3EPvKx+vW68x8FaC1VL4DI0iZVCoNcwVxpypI5XcOj8Yk?=
 =?iso-8859-1?Q?OCFzCWgN6jcjGdVv4D2gBt7RrIKOCyeif+NAVcHa4/035hXsAAVg3TZgTa?=
 =?iso-8859-1?Q?wIGONoQ8xFC8MwmpHerDYhtkxgz9i8jFlU8wiA28uJw7cnQ6BCTmlkd63c?=
 =?iso-8859-1?Q?GOPcAVN2f9a7TlNbrSaOQ1YQfYNBQsdf8/3udzFQpuEDUYO/Zh1+5e/Ty/?=
 =?iso-8859-1?Q?0i4+E+Bcf8tCWHTX91Rw5Fnl0OPlmdEMiLFgwmosoRxar9yEf/sESSUuP5?=
 =?iso-8859-1?Q?vx64jkbmXKegKdZO7V03wA3pc9WI5+QCEyHpxCm5z+K2tmtzXJGh7HSaeo?=
 =?iso-8859-1?Q?8Igovq5fzT4N1SVQxEqzvcy6Cs22mzutOUG8XifKnCwkqT0dLjfDM+b/S0?=
 =?iso-8859-1?Q?MkxKOtluS75b1ywrdUA3gNUl1qvLlgT21+bocGMUE1JTszWRBJhJnUg+A4?=
 =?iso-8859-1?Q?W22rot5MYs5Q7s7T4ZNI0DvbYYj4RYtdjI6FlAOP3CDNxVisdgVrIigsMj?=
 =?iso-8859-1?Q?KippwPxtMXZ7KhKJ9yBgDmCpNW4m5T4bC28+f3EXPVFe14fG/wZTLiRHdB?=
 =?iso-8859-1?Q?VaxRLPFUHyoQQVnB/MA8npWNjXz9FntT+TcDYYgSdCvz2AN4I0QDLYwAvQ?=
 =?iso-8859-1?Q?c7RdzI56dcIA9VNxx8DSbzYantDAbGbYm3GKDu5xibn4DZcGa1y1fhnlzo?=
 =?iso-8859-1?Q?naCxWS15pk/CKZxVsy8lOHK3bMSPbEu7rU6nvp0q1WX2LtMoZtC6OPfh/u?=
 =?iso-8859-1?Q?3ZRw9AHrgG6RNluAtoa2vwYjYNsQF+W9Pgug8JS7kza1wJ36JF6MVV1P6e?=
 =?iso-8859-1?Q?8jOD3M25ErY29C5z4jWcysXGCWrea7akehu/3ziezMzkS1Orqn4dQdJ7g/?=
 =?iso-8859-1?Q?4i9782ykjofWKXpsnFMEezEvTSAK30cg4mKXYtC47HQqu/OzVG2sw6P5Et?=
 =?iso-8859-1?Q?IhHvPzjjw3uhxc7DC9Ax8d998n4Pz0WGEnbF7xUdT2UdxHrTle15fa9a3s?=
 =?iso-8859-1?Q?5L0N4zJ1SvxpWKtEqUCc1BJzaxFM5m8gXIz7R32sbK3fyo4jD7kh9CLNzd?=
 =?iso-8859-1?Q?vVNr3yoPhVdpgrSUsbVhoy5fYX3TFDXA8Xyq+yrQlPdu74+6ox1/MKrA?=
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
	ePNlvcnli4csyYgjZBC6pQwkX/43dpF5FAnEgKfvL5iwjf7doSNP3ZK8LdcTC1H+Hcdt/UEdrVJTg4nclx6J2nJfeqBHnu2j3yRHL0TyPL3kUjq6cEs8wXX+Hf20tsz0+mBuXyWHEuFY4x/gOJMuyELrZrUf1hIFHfIOcOad/91ewMTZYmuUu3eqvEP/DvZhqfU0bFbq2UkjHXqEXpdNpjX33Cigvrx9s0U7HmBi8LuOnt4hRNonpOP3n9QDoSrhQ+pCYJgZ5aCD4Pj2eRYt8BufbfyQFFk7TE6TRkzImEPbnAxwFSqkNnv5eYncStU8OaKp+rSivvEvG9VQI5bQZboAk3JSkppjTNq10LlUN0co95YrH50xtvyxAvyBRpPsBPSJeyYj2Xw2e6jgxfTuCSilVWbZbweDNH/VHxyxbzKeWngamFYcQJNSTflUPIc3U3+eVcr/dzVDsf+3XJqUt5A3cx2Oieaiw+3V1G3M2j03scoQi/3wklRsJLQTYp7yPX47elhus+CgcKq2cVKUnrhco/myzTDogV2L1yux82N99yidlbx5UjXmb9W6YcjKOW5ZV8OsJqMBCl8gCwHsr8Gs+vMYFHdbOcVAOkj4Izwa8LbKbAYKJC7B/WYbB/BwMUrzA0nlPHauOagZYMC60w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e31e769a-9b29-42ec-8e86-08dd197b5ae9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:32:55.2787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hr1oz6kC+sSn7BiR255gpB2pjiZqAtwmdYOiKOeT2PzxOVGpft6JpVNALcMO1rhLrP/MfUIfWP6js8JuJuTbKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=d+8PyQjE c=1 sm=1 tr=0 ts=6758ddbb cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=VNPyIQiSFAi4eIlpKKsA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: Zy8b348m1uQMQfhc9QTWBRXp7c-38hnC
X-Proofpoint-ORIG-GUID: Zy8b348m1uQMQfhc9QTWBRXp7c-38hnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=951 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

To properly respond to host sending more commands than the number of
streams the device advertises, the device needs to be able to reject the
command with a response. Allocate an extra request to handle 1 more
command than the number of streams.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/tcm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/functio=
n/tcm.h
index cd8d06419d5f..9d614a7f2ac0 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -16,7 +16,7 @@
 #define UASP_SS_EP_COMP_LOG_STREAMS 5
 #define UASP_SS_EP_COMP_NUM_STREAMS (1 << UASP_SS_EP_COMP_LOG_STREAMS)
=20
-#define USBG_NUM_CMDS		UASP_SS_EP_COMP_NUM_STREAMS
+#define USBG_NUM_CMDS		(UASP_SS_EP_COMP_NUM_STREAMS + 1)
=20
 enum {
 	USB_G_STR_INT_UAS =3D 0,
--=20
2.28.0

