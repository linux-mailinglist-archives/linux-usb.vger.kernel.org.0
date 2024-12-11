Return-Path: <linux-usb+bounces-18346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D754A9EC0D8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B122716420E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D4F23BE;
	Wed, 11 Dec 2024 00:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iRH7LeQu";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KnLFLqLc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DFQ2lhgx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6193C18EAD
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877203; cv=fail; b=oWcDBpQUqyCt5fkOWfP4ecMGs1SrQI6Wq2vpR+e/B7LnPKo70A4JZcumgOtuZeFC3Rlrn697LbpRDkZg1CHFOuNNcEIJWorkhLngwvmgoWVzmwingW0axSq4dokELU18ZOsz7YttJWGVg4guELMN462ooz4ua5bNKNLyNBF1DHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877203; c=relaxed/simple;
	bh=hhgsJK1AucYnM4yRAtrWSLv0gzRtCthd9LV1eqScwhU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kja+wYhmo81VJgUKqpK8/rlfbbAubZCb+hifJm4i3EDEPR4wYtVX2xWPAGz4ezOdxMbi9AraEhVeQ8Tq2xyUjr0uVz8yzcjppV5the8pFmNXTVv07IIEoCqPTgKGbFjNv80cBzQ4fFeFsVVamUKjMz0Dlw2Wy8xeLPzlRP0kmLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iRH7LeQu; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KnLFLqLc; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DFQ2lhgx reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAM93V0000676;
	Tue, 10 Dec 2024 16:33:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=iN8RUX5llM4FW3rGVHokEUaR7u7LUupB3r6FI8RwHl4=; b=iRH7LeQuV9Fv
	/11Nr+LDK+KNstjuUoeE8TgEyaKOfVCfdwvDte4RdC3MhlxJvvZ/4coUosFpXYAE
	QWK+kO6WckC9dBjYOflK6mRC80bIrbUEPHVeP9YVfRBG3ZROIqtG7nZR0HeFoOqn
	wNKeYNWCoLMR3WW/A3aVFfv/gqEPDMLT+QkgPYtBbF2TYOAsyNVBm2dWfTfZ+r3S
	yPPnqBZr3x3SXMqquFAnewXUWU8C1Nu/r8jM7bbb9dnCwstM57SaKoZR2J6QcBx1
	iGgEg07mNuZsJ86ktxAvRrU1W7Jq3U49ES3stUJXgeYZMURbpRXbwPoKbo899u38
	lWsNbWcIjg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 43cnvka180-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877196; bh=hhgsJK1AucYnM4yRAtrWSLv0gzRtCthd9LV1eqScwhU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KnLFLqLcNY3TQ94rOCmXUOwOufX/mvQk7/tomyfBa4njgFIuHRRoRRaiwKDb40HT6
	 ewVXE/rMjgZowP9IFodCjtR4urAl5eul5QhPa2MOJwZyZdeRRerTiY/KsEOw3nk8nx
	 G4VEMUBSt6effgnC2dcSFSTWSzwZjE14vXqpMuoIVLB0xoQrT7yNaywMwTu48vvKEU
	 wK8th/JkJYHTW5KURoVYWcTG43lrGOKjHyYhEsBEGbcri90FhJY/XzUsuH22pRVpQL
	 n1C2ey004HsYGydtqxsrrZ3uvHgHd63AzTux3twQeRfHSrGuIo0dMpL4kkXJhP6T3a
	 LIeeha1DE7/VQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A06A14024D;
	Wed, 11 Dec 2024 00:33:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6BD3FA0064;
	Wed, 11 Dec 2024 00:33:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DFQ2lhgx;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 29343405DB;
	Wed, 11 Dec 2024 00:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMyNSzEKr3b4Qc0jmII1xDqLXxHhruBgqNnArynmpcubWvlrXcbROgIiXLAjFEobSYVVVTVAolabJHMr7Ni8i63qgW86Gv/k52lx6mBq7GDHEQmCVwv8Nr0MTBoZr3lWjpCz+/ZCzVYsNwsrIPbt32v9LuEmzXfMiWqt+ktq8GWayZsCgbhX5YKwqNEJvomzo5Ox9qZhx8KODY3icapCIpHtHQp+JDg8nu4COvBEM2+0TXQGBTZSNqaPECq2JWXpVaK5MvtJiuzUsWwMznu2DnL5FIfpF3pRktnw48wZ5Hofcw5arL3DhzakfXzsdzMl7jAW1pkfKi2SUAa+N4766A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iN8RUX5llM4FW3rGVHokEUaR7u7LUupB3r6FI8RwHl4=;
 b=Bi1F7Z1EEaNvNlK31653sC3Ou2Yd8PC3q+KfoVr8a0kWDUhBpXOi2hPqa1b1/YyQm/0b5kvne1GDIuLcKzVWeRRfvna89Cq2+cg9cyrVcEKG9JG807n0AOayYyLpDfxLpF7Z4nD0uS2mQ7pdDrAjr5IbY74NxzUt++CaLEbDjl0uGdIa/a1Pxgi/0tExo1FEkDsjEE08cAWtJU6imCJuDE83d81IYuBMsEq5wE4YUB5dYYcopwummWcMR41KTumFlbwHZSZ3gT/kQpPBcOxTAL/gFBg2oismJeH/mGJql0VpNtIp8KmUBnUurxNeK7flsQrYBEsG+FRIzwJjbF89pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iN8RUX5llM4FW3rGVHokEUaR7u7LUupB3r6FI8RwHl4=;
 b=DFQ2lhgxvaZ/U+LamrQV5e+TOyGQ8YEBIMU148O5syIEFRchUqaqLkajqgJ/85a6xjenCtbmRritrc2yIezXC7S14o0kBVD84JaudLKdleNqqN3mh+VXi9tAeQXRHlmrhWb0+I1NJAGcKPLdKQF0+WizaIHd9GgLsVz4k1fsheg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:33:13 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:33:13 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 17/28] usb: gadget: f_tcm: Minor cleanup redundant code
Thread-Topic: [PATCH v3 17/28] usb: gadget: f_tcm: Minor cleanup redundant
 code
Thread-Index: AQHbS2RDr2FIXmW810yZfdHDp4Viuw==
Date: Wed, 11 Dec 2024 00:33:13 +0000
Message-ID:
 <2b2200a9022296f520e26f61ed6aaa6eb34d466f.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 4379efe4-3648-4029-6c23-08dd197b65be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?JAtEwIcM0cpoB9/xECL8f5rWr6n0G0dtUJ7F6Vs4NGjaWf4ctAY8smO9Jd?=
 =?iso-8859-1?Q?h4vLqrp1RXIx+w7pVTWVp6VxQZBGPPrTW+78cBa75nH0M0iO0eJO7RdVtZ?=
 =?iso-8859-1?Q?N40SPi8+2Wut+sUMeTclbVljKGawUFOJeb3bP51D3g7sbdxutB6iqz7n/j?=
 =?iso-8859-1?Q?ICaiuHVSbeZ8mAV37yZu8QoivgT9VUs7gdhwy0QCMF2MVcBRpJcNy2S+qB?=
 =?iso-8859-1?Q?Naej9yT1ybFL0CDWufnYFXU0YdBU3O/orESqdbH1r5fsjV+u0FvmpH29lj?=
 =?iso-8859-1?Q?erjiGIc2UbcBUueUPgpPe9zsvKpCZWLlatWZ9MRDhpA4WhVriooi9O1tMo?=
 =?iso-8859-1?Q?c5JOyXzJiiPjlNFNXSRYMGmch58dkUo6lcG3N5z3xQBiJOECK6NipW5CAP?=
 =?iso-8859-1?Q?8lRa7H6Wv0O2jh5UKipM7km8xqquwJdlaEmQ1KAikgD+LmrS3Nq2bnJVFU?=
 =?iso-8859-1?Q?eybr2+tEhnFz0AsG2hXd6SVPKf5PICDYm+9emzFviPkierH0sPhkoCfpWE?=
 =?iso-8859-1?Q?ziPPTC3pIuA5XJbn2o/pogJF4fcnuZZpw7VnSYbNHEXDpE0lVqzcR8ETZi?=
 =?iso-8859-1?Q?mukyxA7awkMpZw9z3eSXT1bbA7PQgRUtyzvGGouq52AcdY+WGhwu/o+FfP?=
 =?iso-8859-1?Q?UZp1KBnHKRXreNzmeLgN/9PRMNKCHfM/88Qpt1ELCZsmwNnTmVmlvWJ8uV?=
 =?iso-8859-1?Q?gUQynUz87agf8Ulr8HEs8Y35AdGwTp+QU9zy3wY5OJGxmTYr4fGcqk1Y64?=
 =?iso-8859-1?Q?Cgm9LlgyASQHJReYlUML7g74YsCceIIX7KXRQPALobAe+5O/2dIEanih+b?=
 =?iso-8859-1?Q?oSM0o/5J+OoU2MWKRe2M3oyTRU8o76hRkSsjwCo1HZSub0WtewMUFTc6/6?=
 =?iso-8859-1?Q?AyC6W77WUaRuH1AqWeO+Z8tRnP8CGq0jnOPpCY82EPS8DPIm27f8XgRBky?=
 =?iso-8859-1?Q?FPfe1nAn6UyAI78fo7qv5CPm0mTjIEVc3nnQU6r6t1JX8XihH3YB0r48GX?=
 =?iso-8859-1?Q?51YHy4SGsVN9FslGrlqQadmPu5QXOH6JSwSE3bfxVFOEDvfwnPa6tQXbDa?=
 =?iso-8859-1?Q?qRyxaq3EgZTvl+EbHCkdA4Ix9HGcJEWenu7A6Xy38MvFsJlpi4aKUhAX5r?=
 =?iso-8859-1?Q?aUSs+nWVN0KBM1v+MCZVtoA2f24WoTv6vs2toj5sSQxAwf0zyHTevExg/e?=
 =?iso-8859-1?Q?Bdm/Wf2CH733PLWGo6cRHhQg3EN3nmUqCm28ncOmxjhkjdicIZrrOdYfjI?=
 =?iso-8859-1?Q?+EfrSaM+gcEZ+oLLBg+UncYR0i8SENKCcLiXi0KOGOW8fw+4UnOaaa6gKC?=
 =?iso-8859-1?Q?JGA55XV77vXpW8JBr1D1lFDTqFnagUbz2VcmB9dL5pKolcngPREvC/9Fob?=
 =?iso-8859-1?Q?t0T0EBf7KB1LHNplw9xVL1poYjA/g8rfO9NwE2ptqCVP7bNhdtsiscSlNJ?=
 =?iso-8859-1?Q?39GRyyMaLOG4+W4XKwP0Qc7S2nOeCiXfPqgw3g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Jwjb6gBaXjpLkYbrm5RJhb1u/s5Qdiu15mESJTbXS66JsRp8FudCE8t1Ic?=
 =?iso-8859-1?Q?8jo6gC/JVMidiNuntaLV8//sfju92ouEzLmiHB4Oha+e9a6TA5g6uXJXpM?=
 =?iso-8859-1?Q?2hSFgiHeeSwGTMNlzQZdoXub+o+FFZRW8KdVwvUrrw+rqJHjQWSRidOjQ5?=
 =?iso-8859-1?Q?abqDZmy8iqIDt/ZkBhMJUjTI3pXO8NWQ/NkjrPJ6U05kuMjScPiNwqGI4z?=
 =?iso-8859-1?Q?/dreCU0WW4sxmlfMp6ZpunUpUB93VWTVZ3Kh/CtGotIyycKeJLCfkEcK8N?=
 =?iso-8859-1?Q?GtIcD8VHhd5gbfmaGuHHju/a6RvpVRPZCo62GhKGDQEiRYyN/hMJ2ts70d?=
 =?iso-8859-1?Q?Z8njUEEpXvNzM8aHI73x/82B26q48sp/3lPWe4JKjXMPlILcw8IKa9y2Eu?=
 =?iso-8859-1?Q?E0AQIuFZ3SL7++KSdkAeHgnZxN/iJfhL21STs5SzyT0ZbeW42JJfSsBpfo?=
 =?iso-8859-1?Q?v+ODIgz7AAIjbV/zEvyunonfdYWOIZ0uFZGmJewdKgvjQR5EK0B1TCd79D?=
 =?iso-8859-1?Q?NccK/uXzHb3bbNDnxawzR33DeDX8jkIkx3W3jdWYepgReJgrgfVKAE0aA5?=
 =?iso-8859-1?Q?VwMWqrYclVkVikYe9H26bEPt59NH4kto9WBHuzRUntr92mmaObbE127qk1?=
 =?iso-8859-1?Q?u5Aa23n/HJy5obKJMPL4F3i7n7IL4wrls4I0W5wR41/nOtp+sf+dRSPUVT?=
 =?iso-8859-1?Q?WaABKKLUs2EbVn/tq0XUBkfCg0aaZ9LddbsINAtkX7IwBxhhAQ9jaul4FQ?=
 =?iso-8859-1?Q?eQ6MZiZ30RSx19Agu308AN2pNovnynDD75MqWqdc3kgmjD3mhnme3M+jn/?=
 =?iso-8859-1?Q?aOmc0iuTAXT/GSNVdzAkwP8GcjaKF1oshlnJIgbU2DtiMBskp7bGiuNckI?=
 =?iso-8859-1?Q?r3QY9/iKcl7qdAckqZh6oV7mYXoE3z67Nr0ZUS6WKQkeYRCz4zaIx9s2WU?=
 =?iso-8859-1?Q?QzuuRmimEaZWFIwYwweayjE9uQbiqHCqvDXKXF2gKqAO7hapOKOE3Syuhq?=
 =?iso-8859-1?Q?DBFLyXR/IcoGo8JLNtJDT6k0UjdePBeMjDS3XoT/IgkYuH8nz/bvCy2Swj?=
 =?iso-8859-1?Q?d529TlPkeCx3tbWdeIq7rPHPEPeNEawg1WCBIdYvkk0DRLjBdtSlCDmD7R?=
 =?iso-8859-1?Q?LwoLUL9OnefG7UBDrQvB9XcddWVRs9tcUR/edAJcForKd/33NWKUdEw+KL?=
 =?iso-8859-1?Q?69c7/I3Wz37MNpmupg380oG74r9L4URNLSh1IzAcfW9GrYvGkq7vkp4guR?=
 =?iso-8859-1?Q?1p6FKQwX4bCh8HFyrfkGPSk93AXWQ6+2/YZ6SuAuynttYgNmw0VSxd4L04?=
 =?iso-8859-1?Q?yRU6dT9/YZWzd2Ca5o7LpvnD329JPPVo1udoZDSQ5Mm56wwHaTcEEO3DSa?=
 =?iso-8859-1?Q?WkGKJftfRURLoAR7k5DoLI7iW47+Wu+rukT7yUegskxyySoagGWJhZoEQy?=
 =?iso-8859-1?Q?9vsrPRY7sU3igCaVnzsA6I8ZbrCDwwLsrRN1IHJBDksA8hpenuQeatxoH8?=
 =?iso-8859-1?Q?tgQe9JSeS+U655POy0L2b7dkfYfxT+ofZazcEsgK1ABNiz5PQCpNwpiuAU?=
 =?iso-8859-1?Q?CXqclaJVj/d28JhP0MO09jFTjuQukreBv4jdf5VOvbjNFFhaDGQ9Q+JybU?=
 =?iso-8859-1?Q?7wZEf2JPxiFZSsaoOj2OA4xuh5xSTrK9nRFhKkyd21wDkADmF21X0qYA?=
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
	EcYzwUdKVKJ/GQkqOETJqgTOJWkDxydaNbMdwuBrRIErVtPZ+WeyaRTPKWCLv78Rjdnb15eh/A8RMLEPIvC9BOxWG2x7Jsw7ENJeC3BQZnRrF4LxSzt+UsBg3YOEd/EPMX0CH4jlNZp47SEgI29Bws31I8whnql1hKLXHAqn5WvylvzWm8+MfpyIajVtAOKV9KHNQEYCkhcxC20/bB4RULhluw85evz8HiGeNkYriFqWTcAYjd7JMr3ZodAYnQsTYnKL3oKY9T/Ey+z1b8hyY4lUwmUY86Hv+W4s7uoUV9QQ0Lx2o2uSKpTgJWYW4xfEAviZHd2uCNnFxZHWUQ8gtc81UIKRtm9ua70AvLy0i7FDsnvO7xyCTTHcxIPgpJC2hn8jANO+MIbNrO72C4hkiIeCVOeSMyjdq4o3vQWHMrMWncGLVjXoHbtCFAxB2iJgpObjBJ7AR+zfKZTylMfxDrtP2G7QDR7J3YJIQgANbJAMVDpCJK+onwBZTk29Ad8bNmAT17N/bqIEVrej1igcbDi5bCjIac3qbo9hz+GHJuDWvOH0JimIQK0OfVxsjJdl3k9LovhjElozVRL+sH7gxgsO/2yOYWY6LgeguFID5zU7vBAyeJZo6i3T+OX4MTAqxwMrWsdqoxqpg79PwsbzNg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4379efe4-3648-4029-6c23-08dd197b65be
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:33:13.4629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQ7BaSgq9lhUjD2tGtpr8vMT+DpBtFk0qCSp0zdH7x5rXGUwnOUNTEseC/SrAuT31BknRdJCBfACZe8TwZcupw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=fNPD3Yae c=1 sm=1 tr=0 ts=6758ddcd cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=yP90TZ__DNoWKlr3i04A:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: IUadUmxtmnXaZ3q-vP0RtLg3o8DNlh-z
X-Proofpoint-GUID: IUadUmxtmnXaZ3q-vP0RtLg3o8DNlh-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=989 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

The status request preparation is done in uasp_prepare_status(). Remove
duplicate code. No functional change here.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index 50c0703e8df6..696d34e04e7d 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -602,8 +602,6 @@ static int uasp_send_status_response(struct usbg_cmd *c=
md)
 	struct sense_iu *iu =3D &cmd->sense_iu;
=20
 	iu->tag =3D cpu_to_be16(cmd->tag);
-	stream->req_status->complete =3D uasp_status_data_cmpl;
-	stream->req_status->context =3D cmd;
 	cmd->fu =3D fu;
 	uasp_prepare_status(cmd);
 	return usb_ep_queue(fu->ep_status, stream->req_status, GFP_ATOMIC);
--=20
2.28.0

