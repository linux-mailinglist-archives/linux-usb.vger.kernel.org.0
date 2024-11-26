Return-Path: <linux-usb+bounces-17887-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3195E9D9F21
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 23:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5730285689
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 22:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590611DA632;
	Tue, 26 Nov 2024 22:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WtM20gS4";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KDpDUZPW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y8cBCPZM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8061DB377
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 22:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732659331; cv=fail; b=Y6REQhWT0SA76yjH0y289BdPdkDkbUOUBFxdfAnxRBA2c+nGrpnsqJGOdVjsKxyMlZKQ9+hk22rOneAslDt1ktfHqoxNax6SAMJpsGqWgvoNZa3SbEXs62GBJTqEEhMZKhox5TVMUZudiALwUkpKURAOQyo99TND7oI2WmGw0oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732659331; c=relaxed/simple;
	bh=hPhxJdTbQBDtq6PHPJd0eEuBAsyHAYFnD0/mu/zqcfw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o8h7cpokOW0nlcp4+XqQylhHO1M5+TcwY/d4A4zQlZVqe3CF/toSkHzP+Ts2nfqeCjNm3ZdXEAO4MAcjbV3n7eJvwYUWo3QI7tU/kdu8Ob6Yj4rZwZ3dMjJVwTOfPa0n7F7LV9rJPvn+IkSxfFf2N89frAnkFK3dqVEh6usq5XY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WtM20gS4; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KDpDUZPW; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Y8cBCPZM reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQL6cjq003495;
	Tue, 26 Nov 2024 14:15:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=hPhxJdTbQBDtq6PHPJd0eEuBAsyHAYFnD0/mu/zqcfw=; b=
	WtM20gS4MySGV10t02kH8/DZgbsD4AlLNQkMfYfWqdhabUtBQjFN/yjyXYgbi9ue
	N/T572YQAYM3cijALD1MCFGxe3nKh7o1uF04U0koWOGKVtWuS4p7ov5gb/X+DdYh
	b93r64Wi+pVO/ZEQrAyTWJMkqNRVieaRR6PV5zQhPFwfr7nEc3LUASDXSe7WJvIh
	79UkoHPjjkXWytiqWP4I3yctAaWvGv9EIpVpCGd8iCVGyW4PcDsCwgpPNkCVa1aB
	q8Lo8w67fTXMhQ5NR3UPAhGCadDpvwgRQSuXUQHoqGEX1Gxcyv+dJGEMQj86GM03
	o9OuxH72Gfy/6kwtG8LLFA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 433exthm8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 14:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1732659301; bh=hPhxJdTbQBDtq6PHPJd0eEuBAsyHAYFnD0/mu/zqcfw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KDpDUZPWdzF+BqA9Vmy+qJ3e9rh5pjxfEQHXeNKdMqIYQ9/+RKVNwTarTfFkMMuDr
	 xqM1Vh/SkNayZRkYKNGCOH50ZVXPMLeedNoxOByyC5FUQlGTFjsj+AUeSEfxRiYR8g
	 10EiugNtOLJuDguD0cZ3lBmP+IPk+wWxtUgZyQvnBZPNRdhZgS9JNhEwGQ9vuSWefz
	 KmIbBXsJ2+zVO+bzuimkhTzFTbiVxaerZKve+WBMzFEHx/4FRCDNPQcCBMQjLp9fhr
	 NEx037VNj86mvxiQJdGy1j8+WeKlNk3f2S/JKbOxavELFNcKJsV1isTKC2sPZUM2XJ
	 qrV/3LVbCGp4Q==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C8ED8401B7;
	Tue, 26 Nov 2024 22:14:59 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 12E40A005F;
	Tue, 26 Nov 2024 22:14:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Y8cBCPZM;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 82F1040137;
	Tue, 26 Nov 2024 22:14:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2JkHJWqCj7y3J0oNZOJ2leOB0lB2rQUmNZX2cGxVO5EhrZOAPYHhzFyBR6nDwYuEixHvdQ7A4dQbhXqbJja36yYd7wXBjVE/TDD23fTO1s9v2wYeaLhCv7zUqW359bTPNM5Pt7bSOOVpR+0dET0ZfJVfKNks0VpPZBQBxSx8AvGJEHUKxdM4GSq/YMZp21SyYL1hjlTuKh8gFFPH8lUJuMRr5WB+EULyLmqRkan+Yxmjqtk4vVI8j3vFDLwi8g5xPxsAw8nIS9MJ05JAKS2W2ZgIZE4b/cF+8qiIlhl4H2K3FHQy7AMRUQdwzM0Aczfnf3fr/MUqaGryxTL3oCO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPhxJdTbQBDtq6PHPJd0eEuBAsyHAYFnD0/mu/zqcfw=;
 b=tbtBnHgk2wGBEL1GulFsSxiG8f/JIPZnQJvB6T2YdTWQh8S6OKp/Y7eLci3M9ezf7m06KDcpEjUpyQ5HNT7TsDZMvbi1lTeXg7hXALM0ynr2dQG+6R/DCbHyDCXk93JRkdb6y29ccVIhzqsPPXSjNVrO9Yw6Mqe+tEpRoXY+wWnluJPTfMbdLM2tAD2O8aYbiqSq5lT54m5mFlyaW+ZsakSzS6jYVgzo7NWn8w058EV1fmr4Ju3NkUcpLh/c+etk22opxwfGdCAUb4efmne8YGQXsK3WRfLwl3+mwkYKNa8bIYqX2RUL0whTCtjIin8+b2Z28IkUsRGFEvUY73+HBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPhxJdTbQBDtq6PHPJd0eEuBAsyHAYFnD0/mu/zqcfw=;
 b=Y8cBCPZM5TnpZMf+Uii0iaOIPtqQFTsRDlmm+oEhunwpRHbb3xXHsrDnMYaQU2lrzYvc72myIVfwSNOs8gRj67G02zV2g8occYxtf2dfl9vS+JIeyIapIJHyFp55KySztBTPvHH996HxJYr5/h+5QV5nMswtdM/JCp5381M/aX4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW5PR12MB5600.namprd12.prod.outlook.com (2603:10b6:303:195::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 22:14:51 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 22:14:51 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH v2] usb: dwc3: imx8mp: fix software node kernel dump
Thread-Topic: [PATCH v2] usb: dwc3: imx8mp: fix software node kernel dump
Thread-Index: AQHbP7NRfwUDJiQk8EWeKU0qJneIILLKIc8A
Date: Tue, 26 Nov 2024 22:14:51 +0000
Message-ID: <20241126221448.ijikr3kohmvxpc3j@synopsys.com>
References: <20241126032841.2458338-1-xu.yang_2@nxp.com>
In-Reply-To: <20241126032841.2458338-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW5PR12MB5600:EE_
x-ms-office365-filtering-correlation-id: 599ba076-41e9-426a-dff6-08dd0e67bf5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NXFBdE9CcDNEQUxBLyszWWE4cGxxb0I2QWFvS29SU094ZStzbmlVaGo2c1pt?=
 =?utf-8?B?Ynd6dHVTQy9QL1ZmcnY2aU9vMTZQekJLV1hnUmdvdmxocVJyeXRuakZkNXR2?=
 =?utf-8?B?aU9jaU56VTN4SW10RDhJWVhPbDZVRzJtTzJrdUNoQkwzUGhLQ01TcndrQjVt?=
 =?utf-8?B?RU1xVEZraWUxZHhmdE0wUXhUWklQMVBoajY0ZlVQSDkwQXh5WGpEWUcvL2JO?=
 =?utf-8?B?RFhDeitkSU11bDJwZEh3KzRXSEpFTDNUTy81Mklmd3B5aloxbVc1M0dFb0Q1?=
 =?utf-8?B?U0dNL3Nqb0NPdHBGWnhidjVXZE52SmxBQ1JsanB0cWdJanpFalVsREt3R3JI?=
 =?utf-8?B?WU5zODdvbmlUOGIxK1VCSU9LVHVpeHU3M3crSEF3S2pua2RFSkFnVndEWWl2?=
 =?utf-8?B?MXZKVWVTL2dQSFprSk52YVhzSmtaNVZUQnpScDNTY2M0d1hPSjAwZWpSWVl1?=
 =?utf-8?B?bXYrNytsQ0hib2xpMDlPa3FmTGJuOEJ4eEFxK2JNSVFCSjUyK3hLaEI1NHZE?=
 =?utf-8?B?a01XMkJhbW5TRmpVRU93S3ZYeGxQQzVhRkFYOWlPVnU5MlkraVJUVmRvSlpn?=
 =?utf-8?B?aGgxWVhRaGd6UFBNUWZvd1hrVyt6eDBzZlJXK1d3M3NUOGpuQTVmRzZuYVlG?=
 =?utf-8?B?cm5JM0lQVHNpS3lQWklwTU9hTEErL1A0bUY2OTVKTTV6ZWlONythaWJpSEJv?=
 =?utf-8?B?a3JaMmVXMkswLy9uZHIzKzlBcE5sTUt6K1dEK2hlazRQR0tpUEtVUE8vOGtp?=
 =?utf-8?B?UnFjRklKdU16dW9GRzJwakZZMk5hZjc4WlkydzFVcTI3NDhNMTlvaXk2VTVD?=
 =?utf-8?B?Smo3ckg0ak5qZnh4aXNQVHVtbVRSelh5QlR0c080LzM1bytHR0xIemgxd0JH?=
 =?utf-8?B?MnAzRUpRKzN4andxNGdzdktTUDI5VkZBVjlXZXRzT1FmVERGSkpWYUNNdGV6?=
 =?utf-8?B?eXg5SWZSUEp4dWJyN1VodWdBcmhhWkdrZG1SeWZUTFFyUTM0RTEzdFJpWkFZ?=
 =?utf-8?B?QzA1MWtVZXJIQk9ISjl2VVFvdXV3SGRROUZieGViSmc5cU1pdzJRNDhkaE9L?=
 =?utf-8?B?Y05qajV5SXUrNHRDS2xsenpNUGlOeUJYSVJWRWJkTHB6eFQ4SlFlakR2QjlS?=
 =?utf-8?B?eC9jd3p2b3htOTBDWGcyQlBxbjFmY0FRenVYZ2VxNEtHdjlaVGpsVEtPL1Fs?=
 =?utf-8?B?STIvaVE3K1dKb3VHT1RzRTJRUXRGeFhEOFpVQWYrSkp3Q2lRWExYMGVDbkZE?=
 =?utf-8?B?ekFWZUtSbS9MNUFJZm1NWGhxUEV4ZU85dTI2bk40cXBaR2ZPc1FISHVTbXdE?=
 =?utf-8?B?NjllWG9hdjloM25GbTcyMi90cURwaENyQVRyYmMzNHg3NGtJbGtaSXBzOFIx?=
 =?utf-8?B?TWx3bWtOZzlFR0pCb2hKbzd1bU9EQndBakVlTENiOWljNVF6Z25EZFEzclFp?=
 =?utf-8?B?aEpSYmtNRWhoV0gxMUs1MjZ5U3NSLzVVSnlJeThZMlNmcE1KeTAwZGNBUXds?=
 =?utf-8?B?eWZHWk1wT0hYQnhzTUdvd1JnS014cldVbWlEd3ZOMVV2bGRXSXVFRENDWDQ2?=
 =?utf-8?B?YVNLV3ZtUXdvRnZUdHNWNVErZ21hVFNBZ0ZWR0Y3ZkEvU0tPSmJNdUltYTBl?=
 =?utf-8?B?ZzRJYWEwaTIzM24zeGp1cUhqYlc1WDh0eFJxcHhGeDVxRnpEL1BteHV6dlhn?=
 =?utf-8?B?Wi82cHBtaTM2QmdCc3BaNEZKS0Z3ZmVLaTFLSXB2Q1ZVWDdGdGs5dER1bHU5?=
 =?utf-8?B?cDFJbVJGZldBcmlIaHZDdFh2eVFEVldkdjN1Ym9pcGk4Y1hML0ZRL2c2OTNE?=
 =?utf-8?B?T2NoenZ0d3lLZjNncHBuZWY3elBFekNRSzY3VDl6RmFmbEZIbXo1OHVvTWdT?=
 =?utf-8?B?dTJrS2I4ZFRwS2RBbDNqb3pmNmRvamlmbnNQSnIxeWF1WEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WWpzWDl5U0krUHFTUllDSFJGUElUTnpTa3k1Uks3YlgxWTBYNEMrREF6aUZ3?=
 =?utf-8?B?bHB3eGtkajdyTUY1L3lwWlRTT1J0K0NVQTR0Y29tWjhSYUkwUXZXbW01U3Ja?=
 =?utf-8?B?dlU3Ym1aaHF4YVYxMXhvcWJGa2RSSnpNK3p6R1RwT0dMVWVVNTFaYUl1Nmxy?=
 =?utf-8?B?YllRZUFnTkxUVVlhdncvMGVNS2JkMFYrRGtDSXhSTkw5dm5MampHVnNZWDJV?=
 =?utf-8?B?N0g4QU94OEZPdFR5c1ZwUHJHb2I1M1h4eHkyd1diU2lCOXdWelFQSEZUU1g4?=
 =?utf-8?B?UjJoNVMvbGlMaUlmZy8yUHlBZUhSME42bFVaOHl0dWhxQWNERWZTd0gySW8w?=
 =?utf-8?B?ZStHSkZjK1M0OGdWciszZ1psb1VMOTdSTnNtbUFqQVNPYU9yUDE3Q2RQa0x2?=
 =?utf-8?B?MDc2bHdYRFE4bW5neC9WMWpFN1NUUGdyWGpMamZST0tHZ0Vhblk1VkhCOFkv?=
 =?utf-8?B?L0Z5Nml5a2txRk93SWNDdDlJWVhuTDhQMmtwNi9rbWRUckMxSGY4YllXTzVS?=
 =?utf-8?B?ZytOV0FPRmpVYVpURVNLb25oZThKOURnVXp3eUdsVitscHNKdmtLWGJEaXZi?=
 =?utf-8?B?b2g2T0dKWUMzeENob2JBYVVPdlZ4cjEzeitJMUF2eE5ZVmtCK0QrZzFwaVRa?=
 =?utf-8?B?YzEwdHQ0R0VDUmE5S0RNS1gvM2dQSVFIaE82YnFuOHYvMXFIZXZEMXJjU1lS?=
 =?utf-8?B?ZmRiQlpGbXBRS3BCYjFGaTRZUjlLV1U0SGdlMjloMDJZYnYxRWorK2d3K0cv?=
 =?utf-8?B?MFZSRXQyNjZsMUhMdkdhNkJ6cEQxRXR4dEE2aHAwMjA1bWJoTk5BYVZnSTcr?=
 =?utf-8?B?Zm5wVTBWbjdCTW9wem5mOVJRczhjSkdnMmdBWVJldWVTdGdaSzdIT0pMeGFR?=
 =?utf-8?B?SDE1RWJuZ1h5cTA5Ynl4VWNsd1Y3SnpIbG1kTnJUaU4xZ0ttVm1WOHlEUDlz?=
 =?utf-8?B?SjhwbjBHZlR3MngvNXlaR0hoRXkwYmhUd3lQOEFUd2s5ak04RGdsKy9Hb3c5?=
 =?utf-8?B?NXhIVWF4LzRTTjlEcFQxSk85c08yYjVYWmlTREdyLzRpY3NZOXBONk5YR1Jy?=
 =?utf-8?B?ci9uWUEyZ2h2Ui9oWldTRDVneU9zTktNMStwRXdsVDRkd3ZaaytMRUFtdDNj?=
 =?utf-8?B?b00vZHZDN3d0alVtakJwL1BhazdOdUdiaEJ0SnEyb0QzMENUTG9aMjE0Mkxz?=
 =?utf-8?B?Y1RBK3dwZm1JcTRCTUkwamhtb04vaE9jMUhGSlBzcm94QjZGM0o5S29xSmZr?=
 =?utf-8?B?U2YrWFF2UkdsVkcyY3lWQUlCRmM5VVAxYVVSK0pRRS85MnBoUTdCOFJPcENx?=
 =?utf-8?B?ZUxkcmZDVEFEWG5nWStZdXBQWGloUldSdlNBUlViZlBTU05QdWFEeDNTQzZB?=
 =?utf-8?B?cEZLSzVSQnpmdWg3QklLVms1Z2doWENsT0ZhNGZwUnNPTDBRNXlJelZvRkEv?=
 =?utf-8?B?dEl2VCtJck8xMjRWL3FYcnZkRmllSHJ2QVlzYmpzZWozb3JWQWpoRnh0dit1?=
 =?utf-8?B?VmFOSVJzclVmYzRCYlhrbnA1aE9sVDlhN2Ryc0MzSGNuK0svOG01RDJwVEEr?=
 =?utf-8?B?TU9IcnJtZXBjY2NONlBFUnlkTVFLbW1XMyt6QW5rcUtwaklFdGJ3Wml3RmJP?=
 =?utf-8?B?QlNKRHNvQXVyZ0hneW12azJWQ0VkRGNWaEVSRjB5dmFXWkpJaGl6cStia2Fx?=
 =?utf-8?B?UjlheE04VE1ocElZbkEwd1YwU1F0MHVEUG9TOEZ1UDBDcUVjSlM1eWxvMjBp?=
 =?utf-8?B?UGwrbkVocEJwYXRWQWFRQlJ2NksrYkFtVFEwMGpOV3N1Q1NpaGVjaFA5REtB?=
 =?utf-8?B?cDU4ajFQaTVZSDJUWmEybUFldDVITDhYcG9BWDZPbGg3KzFTODNGeHkxVjJr?=
 =?utf-8?B?ZlVnbDVvRHBqa1pIRWFxNEQ1MlFONnU5bTgzdCt6Ti90ZWVVdUM1eE1wN09K?=
 =?utf-8?B?Ry9VQkdDZ2x1NzNscGNXOExaUi9XOFE4a2tzU1FSV3Z3VWpLZi81cXhIQ2x3?=
 =?utf-8?B?VnlKbHFJQ1hFUThJcy9WMVRneEtWRVZSZkgvTFRnZndkdEppNGlXLzBUOHZH?=
 =?utf-8?B?dHp2ekh2VDd0U0dpTld6MVFzeWo0QkZIb1lzOHo5c0xndTI0c0lEZm90Snow?=
 =?utf-8?Q?jnHHureeXPQ5RPOUkEWBa9bhN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B03676402E022E42827CFF7EB194D797@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hlqX6gYSoyGuobqOvCGB9j1iWcyECVTmXiNbD9kSbZQEhJ869+QzS+Zr/MswQllPRW/DC9Rly8dJiPTTrwpQRlvABZbZdm+VvLabJDJBIY1dj4guBnXjGmUkrI1LCFTD138w8R5ch5I6WJMH8aQtkhpnF3el3QCfe47WoW9+5nZsiT6uUOz6s+0pwcR47+io69Gy8Ny5C0/nuQpXkuOTI04ElRCp0qB2++M0ckEKK8JgXvtrRHJ6lmly7rD9b0As3uH3U5IacRSbSHXCi3htfMnLyby/z7XVpVqoMDX9GwNbJeur0bBtBIR3EYRGLFHsN7IdAzp22x9TFuZS9gf6rrdGvZEu+aMKzcslFxz+Tz/THP6TxvDkx+lGoH0ezz7RYFIvT8pla1VaJbRdmUQiHX2JZKymYK3MEtD4EmqmqQkxy5/j6jX3eRstBcLGn6EtgimdIX6HCyFjZ/aLXjvEWbMNVQyromyOeS5W9x3jped6CBKlV5zqk3uDpAd6QY054lLyoMdWAhVOOchmoCJNZ7F3jjqhh53xVTxy/OuNlezh9p7bUm6pmhIhkduQa+7K8ryrMZD64m5tyRbBGdcrFvareqN9O3d3iuXGJ9ayW72T6TFZgdCTOJp5yXQjUcto5aNuU418A4Q2ayQJuyUzGA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 599ba076-41e9-426a-dff6-08dd0e67bf5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 22:14:51.1042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: asB7mYXq/TOF3c8MRRzP6wakfBEXjczYDUBeRYB1myu/T3fnFWIIUitSpMH0RlaBpI1QpJE6AYf6XQVOP0IyGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5600
X-Proofpoint-ORIG-GUID: 6HIvJMSgp42QAP-X9oZwB1SDIxyNoiBJ
X-Authority-Analysis: v=2.4 cv=Xcrbz555 c=1 sm=1 tr=0 ts=67464866 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=jIQo8A4GAAAA:8 a=n_s--3O6c8hfKUFyJ20A:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: 6HIvJMSgp42QAP-X9oZwB1SDIxyNoiBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 mlxscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=918 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411260177

T24gVHVlLCBOb3YgMjYsIDIwMjQsIFh1IFlhbmcgd3JvdGU6DQo+IFdoZW4gdW5iaW5kIGFuZCBi
aW5kIHRoZSBkZXZpY2UgYWdhaW4sIGtlcm5lbCB3aWxsIGR1bXAgYmVsb3cgd2FybmluZzoNCj4g
DQo+IFsgIDE3My45NzIxMzBdIHN5c2ZzOiBjYW5ub3QgY3JlYXRlIGR1cGxpY2F0ZSBmaWxlbmFt
ZSAnL2RldmljZXMvcGxhdGZvcm0vc29jLzRjMDEwMDEwLnVzYi9zb2Z0d2FyZV9ub2RlJw0KPiBb
ICAxNzMuOTgxNTY0XSBDUFU6IDIgVUlEOiAwIFBJRDogNTM2IENvbW06IHNoIE5vdCB0YWludGVk
IDYuMTIuMC1yYzYtMDYzNDQtZzJhZWQ3YzRhNWM1NiAjMTQ0DQo+IFsgIDE3My45ODk5MjNdIEhh
cmR3YXJlIG5hbWU6IE5YUCBpLk1YOTUgMTVYMTUgYm9hcmQgKERUKQ0KPiBbICAxNzMuOTk1MDYy
XSBDYWxsIHRyYWNlOg0KPiBbICAxNzMuOTk3NTA5XSAgZHVtcF9iYWNrdHJhY2UrMHg5MC8weGU4
DQo+IFsgIDE3NC4wMDExOTZdICBzaG93X3N0YWNrKzB4MTgvMHgyNA0KPiBbICAxNzQuMDA0NTI0
XSAgZHVtcF9zdGFja19sdmwrMHg3NC8weDhjDQo+IFsgIDE3NC4wMDgxOThdICBkdW1wX3N0YWNr
KzB4MTgvMHgyNA0KPiBbICAxNzQuMDExNTI2XSAgc3lzZnNfd2Fybl9kdXArMHg2NC8weDgwDQo+
IFsgIDE3NC4wMTUyMDFdICBzeXNmc19kb19jcmVhdGVfbGlua19zZCsweGYwLzB4ZjgNCj4gWyAg
MTc0LjAxOTY1Nl0gIHN5c2ZzX2NyZWF0ZV9saW5rKzB4MjAvMHg0MA0KPiBbICAxNzQuMDIzNTkw
XSAgc29mdHdhcmVfbm9kZV9ub3RpZnkrMHg5MC8weDEwMA0KPiBbICAxNzQuMDI3ODcyXSAgZGV2
aWNlX2NyZWF0ZV9tYW5hZ2VkX3NvZnR3YXJlX25vZGUrMHhlYy8weDEwOA0KPiAuLi4NCj4gDQo+
IFRoZSAnNGMwMTAwMTAudXNiJyBkZXZpY2UgaXMgYSBwbGF0Zm9ybSBkZXZpY2UgY3JlYXRlZCBk
dXJpbmcgdGhlIGluaXRjYWxsDQo+IGFuZCBpcyBuZXZlciByZW1vdmVkLCB3aGljaCBjYXVzZXMg
aXRzIGFzc29jaWF0ZWQgc29mdHdhcmUgbm9kZSB0byBwZXJzaXN0DQo+IGluZGVmaW5pdGVseS4N
Cj4gDQo+IFRoZSBleGlzdGluZyBkZXZpY2VfY3JlYXRlX21hbmFnZWRfc29mdHdhcmVfbm9kZSgp
IGRvZXMgbm90IHByb3ZpZGUgYQ0KPiBjb3JyZXNwb25kaW5nIHJlbW92YWwgZnVuY3Rpb24uDQo+
IA0KPiBSZXBsYWNlIGRldmljZV9jcmVhdGVfbWFuYWdlZF9zb2Z0d2FyZV9ub2RlKCkgd2l0aCB0
aGUNCj4gZGV2aWNlX2FkZF9zb2Z0d2FyZV9ub2RlKCkgYW5kIGRldmljZV9yZW1vdmVfc29mdHdh
cmVfbm9kZSgpIHBhaXIgdG8gZW5zdXJlDQo+IHByb3BlciBhZGRpdGlvbiBhbmQgcmVtb3ZhbCBv
ZiBzb2Z0d2FyZSBub2RlcywgYWRkcmVzc2luZyB0aGlzIGlzc3VlLg0KPiANCj4gRml4ZXM6IGE5
NDAwZjE5NzlhMCAoInVzYjogZHdjMzogaW14OG1wOiBhZGQgMiBzb2Z0d2FyZSBtYW5hZ2VkIHF1
aXJrIHByb3BlcnRpZXMgZm9yIGhvc3QgbW9kZSIpDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnDQo+IFJldmlld2VkLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+IA0KPiAtLS0NCj4gQ2hhbmdl
cyBpbiB2MjoNCj4gIC0gYWRkIGVycm9yIGhhbmRsaW5nIGFzIHN1Z2dlc3RlZCBieSBUaGluaCBO
Z3V5ZW4NCj4gIC0gbW9kaWZ5IGNvbW1pdCBtZXNzYWdlIGFzIHN1Z2dlc3RlZCBGcmFuaw0KPiAg
LSBhZGQgUmItdGFnDQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5jIHwg
MzAgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLWlteDhtcC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5j
DQo+IGluZGV4IDM1NjgxMmNiY2Q4OC4uM2VkYzVhY2E3NmY5IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2Mz
LWlteDhtcC5jDQo+IEBAIC0xMjksNiArMTI5LDE2IEBAIHN0YXRpYyB2b2lkIGR3YzNfaW14OG1w
X3dha2V1cF9kaXNhYmxlKHN0cnVjdCBkd2MzX2lteDhtcCAqZHdjM19pbXgpDQo+ICAJd3JpdGVs
KHZhbCwgZHdjM19pbXgtPmhzaW9fYmxrX2Jhc2UgKyBVU0JfV0FLRVVQX0NUUkwpOw0KPiAgfQ0K
PiAgDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHByb3BlcnR5X2VudHJ5IGR3YzNfaW14OG1wX3By
b3BlcnRpZXNbXSA9IHsNCj4gKwlQUk9QRVJUWV9FTlRSWV9CT09MKCJ4aGNpLW1pc3NpbmctY2Fz
LXF1aXJrIiksDQo+ICsJUFJPUEVSVFlfRU5UUllfQk9PTCgieGhjaS1za2lwLXBoeS1pbml0LXF1
aXJrIiksDQo+ICsJe30sDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNvZnR3
YXJlX25vZGUgZHdjM19pbXg4bXBfc3dub2RlID0gew0KPiArCS5wcm9wZXJ0aWVzID0gZHdjM19p
bXg4bXBfcHJvcGVydGllcywNCj4gK307DQo+ICsNCj4gIHN0YXRpYyBpcnFyZXR1cm5fdCBkd2Mz
X2lteDhtcF9pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqX2R3YzNfaW14KQ0KPiAgew0KPiAgCXN0
cnVjdCBkd2MzX2lteDhtcAkqZHdjM19pbXggPSBfZHdjM19pbXg7DQo+IEBAIC0xNDgsMTcgKzE1
OCw2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkd2MzX2lteDhtcF9pbnRlcnJ1cHQoaW50IGlycSwg
dm9pZCAqX2R3YzNfaW14KQ0KPiAgCXJldHVybiBJUlFfSEFORExFRDsNCj4gIH0NCj4gIA0KPiAt
c3RhdGljIGludCBkd2MzX2lteDhtcF9zZXRfc29mdHdhcmVfbm9kZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQo+IC17DQo+IC0Jc3RydWN0IHByb3BlcnR5X2VudHJ5IHByb3BzWzNdID0geyAwIH07DQo+
IC0JaW50IHByb3BfaWR4ID0gMDsNCj4gLQ0KPiAtCXByb3BzW3Byb3BfaWR4KytdID0gUFJPUEVS
VFlfRU5UUllfQk9PTCgieGhjaS1taXNzaW5nLWNhcy1xdWlyayIpOw0KPiAtCXByb3BzW3Byb3Bf
aWR4KytdID0gUFJPUEVSVFlfRU5UUllfQk9PTCgieGhjaS1za2lwLXBoeS1pbml0LXF1aXJrIik7
DQo+IC0NCj4gLQlyZXR1cm4gZGV2aWNlX2NyZWF0ZV9tYW5hZ2VkX3NvZnR3YXJlX25vZGUoZGV2
LCBwcm9wcywgTlVMTCk7DQo+IC19DQo+IC0NCj4gIHN0YXRpYyBpbnQgZHdjM19pbXg4bXBfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gIAlzdHJ1Y3QgZGV2aWNl
CQkqZGV2ID0gJnBkZXYtPmRldjsNCj4gQEAgLTIyMSwxNyArMjIwLDE3IEBAIHN0YXRpYyBpbnQg
ZHdjM19pbXg4bXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAo
ZXJyIDwgMCkNCj4gIAkJZ290byBkaXNhYmxlX3JwbTsNCj4gIA0KPiAtCWVyciA9IGR3YzNfaW14
OG1wX3NldF9zb2Z0d2FyZV9ub2RlKGRldik7DQo+ICsJZXJyID0gZGV2aWNlX2FkZF9zb2Z0d2Fy
ZV9ub2RlKGRldiwgJmR3YzNfaW14OG1wX3N3bm9kZSk7DQo+ICAJaWYgKGVycikgew0KPiAgCQll
cnIgPSAtRU5PREVWOw0KPiAtCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBjcmVhdGUgc29mdHdh
cmUgbm9kZVxuIik7DQo+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGFkZCBzb2Z0d2FyZSBu
b2RlXG4iKTsNCj4gIAkJZ290byBkaXNhYmxlX3JwbTsNCj4gIAl9DQo+ICANCj4gIAllcnIgPSBv
Zl9wbGF0Zm9ybV9wb3B1bGF0ZShub2RlLCBOVUxMLCBOVUxMLCBkZXYpOw0KPiAgCWlmIChlcnIp
IHsNCj4gIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIGNyZWF0ZSBkd2MzIGNvcmVc
biIpOw0KPiAtCQlnb3RvIGRpc2FibGVfcnBtOw0KPiArCQlnb3RvIHJlbW92ZV9zd25vZGU7DQo+
ICAJfQ0KPiAgDQo+ICAJZHdjM19pbXgtPmR3YzMgPSBvZl9maW5kX2RldmljZV9ieV9ub2RlKGR3
YzNfbnApOw0KPiBAQCAtMjU1LDYgKzI1NCw4IEBAIHN0YXRpYyBpbnQgZHdjM19pbXg4bXBfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIA0KPiAgZGVwb3B1bGF0ZToNCj4g
IAlvZl9wbGF0Zm9ybV9kZXBvcHVsYXRlKGRldik7DQo+ICtyZW1vdmVfc3dub2RlOg0KPiArCWRl
dmljZV9yZW1vdmVfc29mdHdhcmVfbm9kZShkZXYpOw0KPiAgZGlzYWJsZV9ycG06DQo+ICAJcG1f
cnVudGltZV9kaXNhYmxlKGRldik7DQo+ICAJcG1fcnVudGltZV9wdXRfbm9pZGxlKGRldik7DQo+
IEBAIC0yNjgsNiArMjY5LDcgQEAgc3RhdGljIHZvaWQgZHdjM19pbXg4bXBfcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICANCj4gIAlwbV9ydW50aW1lX2dldF9zeW5jKGRl
dik7DQo+ICAJb2ZfcGxhdGZvcm1fZGVwb3B1bGF0ZShkZXYpOw0KPiArCWRldmljZV9yZW1vdmVf
c29mdHdhcmVfbm9kZShkZXYpOw0KPiAgDQo+ICAJcG1fcnVudGltZV9kaXNhYmxlKGRldik7DQo+
ICAJcG1fcnVudGltZV9wdXRfbm9pZGxlKGRldik7DQo+IC0tIA0KPiAyLjM0LjENCj4gDQoNCkFj
a2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5r
cywNClRoaW5o

