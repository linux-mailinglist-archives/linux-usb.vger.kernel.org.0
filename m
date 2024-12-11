Return-Path: <linux-usb+bounces-18347-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C639EC0D9
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 016541641C8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C48175A5;
	Wed, 11 Dec 2024 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VLXb4GWw";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="G8nBt9bx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cEf/P7DB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74E5CA4E
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877210; cv=fail; b=Pxaft50LWeyiPZ9N6/F+egC9TcWMg2KAkRzkG76sxb1aVH1cmSl0WpW0ItAzSm5PQWgvx6nNoUuwL2Z/stgy+VmdBMRhgqmTY8cdiKnk7bmF2RiSwj1JenI59ahpGg8aVPJM+GyOR5UEsCXbz8MYwFHgk9goktfCAhxKMouXxWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877210; c=relaxed/simple;
	bh=Wuji6LT2OhYc0BxG1tvqdSfRboHVXVHkGAv7h5Cufrw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j3qYkCkPvIhraI6418V2OBe0hML5Hk9dP0wnuOyRwFOrjP3DOLWVbQLaV0GSTRxSSJbnNKauFGv5p2IAlgPiEKbyu6jtq4cXesMnsd6X0nmL5ygI74AHcuIJsXpTyXsQUFm9kDfvg1ueJU6HQFV3X9GgHzY8d0LavvPDrnaFt7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VLXb4GWw; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=G8nBt9bx; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cEf/P7DB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAM2nrY017323;
	Tue, 10 Dec 2024 16:33:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=o2XUnWvwqfaCpfgeNN9GdHQINg6fjBlV3tOJX4Wv6K4=; b=VLXb4GWwCyz2
	bddr/MfcNF+ZHcx0L+BNi+fuz0Mf3hFvEdPNSlsYtSdbiMrDoq/7v+u6km6RE9ZV
	uV7lSqd9cFQAJoslGAYtjCTi6QUkoJo+kGB323tvsuIRswlSVRcFXwWtWRmceCBq
	Oob8mSw7I5QgET+ruP3SbRipJixOClV+HqezTM+bghtQlUi2UqBAa7lrI9lo2584
	X24ZS/p5vnWY679EsqRRLSdws57L49V/B0alAuo2UN5+A25MY0f8dHG89u7kQa28
	v38dMlLESE5IrceDgrK4HB9E2waEH2QTF02wnJroJEMoMJQEskZ7Q0jBmM99cxoi
	6pjdgEp3Xw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cp60t13e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877203; bh=Wuji6LT2OhYc0BxG1tvqdSfRboHVXVHkGAv7h5Cufrw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=G8nBt9bxv+uHEnq1b219anqDLPrUwo01rz+1xpXv7QUl4cPUmzVdbf4k1D7vLT119
	 LBnAyHMPkhV09N+tAZ5nDXmmZz5BTQq1oBQW5Jd2/OXKj8pYuX9GvXDnq2bLW7yT6b
	 CZbr7vywlobD9II2rFsEIskuOpf3peXdvQ5aSozPSodXHpUZvVQIgfzvvpr3wEBXyI
	 8XzTrmrf9QwsPyxeA01yNvEYOcVkE01xUtYhLBgWKW2gl4aXKpkWrgTP7HwSyCv0h/
	 0vtOtdxSYPdz2Cb7NE6gyNMr8jbz9ukAEEHka0ZfoAd1z/Ys2REWi1Ccgf2wU3K7H/
	 FXjaTD3ZZIFlw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 68A2940126;
	Wed, 11 Dec 2024 00:33:23 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A3848A008F;
	Wed, 11 Dec 2024 00:33:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=cEf/P7DB;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7126B405DB;
	Wed, 11 Dec 2024 00:33:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCgJ/x2nJmCqSAhAWtz9g54XAHGyX49KWQdASkgNQikLK5lEWoLIf1mnUZFvfMYfmgN4dXcWYVkCFzIw5ZzCNMcCs0k21feTsKa4z14nXjxCDqJIIZlVz/OACUqLFXL6il960ZsDoXiNU+55veCsiamSBUb31Y8kB5GnJA0i4cKQ1DkMq8lmT2ZKs5rFkzQMURfFkTiq99il2hfPLOWKGeksyUP0DMSDXUU67W3qpqC9d+RiWwBOovMbw8q4ss2NP526r8jRbRbdJBkvRCSKqdXtMyGqSjgSm2jA1Q88A20JtrNLjrV4Wj4UmXLUCpkQOLfMdPF0vqR2VZIypVnlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2XUnWvwqfaCpfgeNN9GdHQINg6fjBlV3tOJX4Wv6K4=;
 b=mecg9rxfSkyem27utp2tJ1ri4LmbbqKwK7GrD7F3O3pACY0RUW7UkGzoifkqJa4PxD48nhsbO3LgRMZpzrgCtSHy1o66K2nvd0v6J4p0JBj0CwjLbXVRr1gQxemwRgiL1NXHfEWzdLYShjFtJVI1PsoI4a7pvqYwu+fGlFiOvG/LokJS4uTeXoJne9s7vvFNFeHTSD65g6200htOrX6xf8m0f5SdxYZvboOgkysziUO26C59eaS9jZgL1jFJDX2rSeQAiRiuDyU69fYOsVt75UOeOCwB7mm1whLzDDoUahTbHWvx5yBVNsHNbYYGE5E26HfykaawgaUEPXs6BAmvbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2XUnWvwqfaCpfgeNN9GdHQINg6fjBlV3tOJX4Wv6K4=;
 b=cEf/P7DBq9Q/Pyd0+nNa0ptnXAyiuLI5AuUgTLQ3ShTsPX0JBo/MBOnyqf+w0CEQzjfRqenAuJiMsCMjXildktg3VXYKYHIjpEEkO0wJOO/ABTph8gmydVQJeQG1jed8Zib7E/P4ZDQVfdD5HPyJT5lQvp9cj8Pyye9l6lMzdXY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:33:19 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:33:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 18/28] usb: gadget: f_tcm: Handle abort command
Thread-Topic: [PATCH v3 18/28] usb: gadget: f_tcm: Handle abort command
Thread-Index: AQHbS2RG8nGEvVWhYUear+K57kyW9g==
Date: Wed, 11 Dec 2024 00:33:19 +0000
Message-ID:
 <6d2a05f120a0384e36b5150b50eec53a0991f400.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: e8ec236a-01a4-4c5e-2ceb-08dd197b694d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1oa1uFOOHx9h+psGveFFZ1B3cOKXjIPLx9dQ1OeJPQYdbM6lciqL7ztGYy?=
 =?iso-8859-1?Q?4H0LOnBKD1TTZ4Zk33hV7ULT68g+2LBR1ZZGD6OiY0XiQLDwRrpiNztu5M?=
 =?iso-8859-1?Q?HjX+sZVFHX5wroFwT2meUYhD3KdiaP/brjt7dey0acGvmSSoExOEu3IcqR?=
 =?iso-8859-1?Q?eK/uFd3dkMrUkA4BlDmh42iaTmDAcbYvaEK3WDYUFhOZzVXevHq8BpC9ux?=
 =?iso-8859-1?Q?7Wvy1inM3+CUVyQpT+XRIvVPcDjhu+50QEpZ1IfyZeE8aKr3KZGWTFD9b3?=
 =?iso-8859-1?Q?ZMw1QnarKj4xSq9X4IDe70v2EcOP7Y+hcFx5nNR3qaiu9Tzr72G9PJswFC?=
 =?iso-8859-1?Q?PmRvPUY18z6YZzY1Vga33G2nslL7jZwYuxWTOthijJ3bsqXzjnpPhlGqav?=
 =?iso-8859-1?Q?wjQZfb0cPOTMXazEJlUbOiuYhDJyO8+jMlExFDrIvOtHedN9cEo/6f0tDV?=
 =?iso-8859-1?Q?srJVf8QD1PvIa9r/fwrrO+tStlol3E/w2TSBZ27Zr+MSgqMpe0Qbk/Kwnk?=
 =?iso-8859-1?Q?VGUMUc6tGeuirzwNdoNsryLAF7GJdooIsRIeirxBRqfwHjFpBmoVse0ZD2?=
 =?iso-8859-1?Q?1FZ8o4si4ZlKCLDYI+sDqsAI0byw5GOAMKCeTqBDyMLi5ZmQ/LQQ8nIf3i?=
 =?iso-8859-1?Q?75/n+QAXETg4ZrMiTKfu1H7kVrnv9W6cit3mGfKXLo1SlMu5mEdAbF3alX?=
 =?iso-8859-1?Q?nb9F7bNiPYe76/s9NPVZCMKIVSILXs1wSBfSbnX2aKqa+OzpWWTp17V0lE?=
 =?iso-8859-1?Q?0m3NLidsqerjcNw017Hi8ntlFbvyNrqobFyM4Dt0J2C8t5wD1bW0LM1wPi?=
 =?iso-8859-1?Q?OX2rIQ/L87GD+iDwF/2zvGW8o4UINJRAqRf6yOJ0zb0dMnpVV+DOnH7+ul?=
 =?iso-8859-1?Q?JhL7/cpzUWWPjtBQtm1di1dGB7i0aXoRf7lcOUYyzdeWalXKAtct5ZRvNV?=
 =?iso-8859-1?Q?eSO/kMitA87Hq09VD4WPHviJ0La4kuBw2UOz7Os24k4OlnY7VVEaaiiT7/?=
 =?iso-8859-1?Q?MtZg0DR9heFyKjzYVid7c7l5yDTBq0M+1f3T218Zi1fsv3vGGl8EdEZIk4?=
 =?iso-8859-1?Q?gGGdY7Cu19ZFl6+eQEI0WVZBKAdPxIJn27RY1vxAzTJXrQLFmOmy1gKX0/?=
 =?iso-8859-1?Q?7/F2XkiNswwBhn8Og1sE3qa45yVn7mC0S6BJFWai8Nl1vDRWMwqU4qEqIZ?=
 =?iso-8859-1?Q?I0kXz1am3ywWYQzXIrYSugG+qu1w8WPGyYJvbR+USjfuRaCPB6f1RwFJNo?=
 =?iso-8859-1?Q?Oa7N/3/JervqBWfzGRcX5DTf12rYK7cdvX8asqYePLiaxuNPOrP0IE0BF9?=
 =?iso-8859-1?Q?ujKefr95oTdOLHQDc6IYusndz94EdxP0MtXrwjv9bIgAtl8eh3E4xjhshR?=
 =?iso-8859-1?Q?I5s4tYIoNbMaYfPeLM6mW50QGF7/IiC+Ys04vIq/Tgwg0iAAHtCCNWZGhM?=
 =?iso-8859-1?Q?qZTGVyp2IQEbTcFL9DhJrYIk41TtpyjwwIjp6Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/fefm371Z3b0NDCg5TNRnG9HwXoHwdqLHzmijiElms0s92qh8LGYo//GUl?=
 =?iso-8859-1?Q?utbA6YRf7uVAw0nmSAOzwpV4oHUgr9uE32IOyw48kKiNDB7AaR6SM6fZvE?=
 =?iso-8859-1?Q?mbBOsSacqJE/YAvrPi7zy2XmqEXNJEl9cLK0E0eFYTNOuPdJe8MKTmGaWI?=
 =?iso-8859-1?Q?SspLlrmIV8un+gdV9TKMs6ye/yJbD9u91J9lFnuxPCT6OG34zERLiQT2+I?=
 =?iso-8859-1?Q?uKC02qkbLFIFwi7s9W3dqVavDzHJTc+oirTHW14LTV4pFBW/bRz4XUDCG4?=
 =?iso-8859-1?Q?gB/zTV23Si+7Vp2O1f6AX7QMhUzMbYI4vGzAbxTfZx9yBgkH2e0gLOwIp1?=
 =?iso-8859-1?Q?VwjVkzim+nO8aDZ0hbyt61Qor1spsAB3V1CAqOWOTL64QtNdfR6XojfRrs?=
 =?iso-8859-1?Q?ib5C8mx9qi0QJerERCye9067CFGS3lNBbuoj5VISYeqy98DRmg49Y13dR3?=
 =?iso-8859-1?Q?MbKvjT+l+lQYFxL5j9OXPZ4Wo1Uq4Bj5yYuuV4IS1JLFZ527cYbMluCMJ7?=
 =?iso-8859-1?Q?I9s11tkDrA0gJ//fgRIoZB+kejqVpVzrefCz3HAmhDMWZJf4EnA/zVnpZY?=
 =?iso-8859-1?Q?n8sjY3Yz5krT5Pwq5xGqriKWd1oiHw8RKbG/CknXiTBGfWyaCcQ3JgAlfP?=
 =?iso-8859-1?Q?yG4xYwON/7oZ15Uy7ks+5VOKOzKDNeJe1VIuxFJVNoGN/i/Kt8dgJnAvtw?=
 =?iso-8859-1?Q?c7fTJe3ZXekPZwiycS2rqJmb99C8Hu8kdnLdo+QRUWJ9KkJW+BjsqnV8Ol?=
 =?iso-8859-1?Q?/OAsgPnqXaZ+ODI3AStwFO3JZYcCQ94S741V5InopQyzSoVkjwY9IFnfvx?=
 =?iso-8859-1?Q?5JpSALqJnEI8DPXFnuLgJsvTx0wxu0lmk/dK/HmC3/FUNPD1b9HtoBVZiQ?=
 =?iso-8859-1?Q?Kaah7ClHs4SFgzBz7UZVeFEFwE3VJ/xgrP/oL0KGuIaAPq3tYZrb+oz0UZ?=
 =?iso-8859-1?Q?4RN3furYDZeBOr/AWKSVHcQmUC8yO46i3k9e669uCCOV3fYKTMxcoSRylo?=
 =?iso-8859-1?Q?S42hTQOU8QT+gRyvbJMA1xgIHaZVDPMkCMd2L9vymxfYCtRUNHNt5SwWR4?=
 =?iso-8859-1?Q?8Cded7nb6S0yKNsfNUmKEs+NJRdhG2fCuqWfPTh23gGU9WEq+b9TANThSH?=
 =?iso-8859-1?Q?RV1hUcGKGhC/LZp9mjBVJvBvt5CvHxfAB5FYigqiKPxqEw5l9ta8Rhyt1t?=
 =?iso-8859-1?Q?RWHC0p3b7CEwbKA8QJWmMZWyFAjm579UDXb107myEk+nW97xB8N1/hFrLQ?=
 =?iso-8859-1?Q?hTTUcmxpAMS5od0Ln1xPKiSex5pZz3UpyF3poIYMFpbFrntbGgPrvi0V4V?=
 =?iso-8859-1?Q?gpPZXHMFeiQMvvmmHBKoDkE7AwNkDdypZJFY78RgAw3660cH/JG6g9YOOZ?=
 =?iso-8859-1?Q?xnjcof7OdS61IjHfSF8HARZshXYbqH0JVzx1nGpuxPWjW4DAPZzWYr+YMY?=
 =?iso-8859-1?Q?i5p1tQf1eL66qRSMYIOivLnIm3wd2O2PwP6YK4e/ZCHXG3qkHXW4uTIt+T?=
 =?iso-8859-1?Q?FvdLrx83ibpYgTILyysO8V2o3Drr0jO2Te/vfjFYqYs1ZcEB7XcgMFGamN?=
 =?iso-8859-1?Q?aGAE9jVL/m8AtVzb/DYPzVxyfD9ngbiZmQq6irjOaMS6/tqNSHZlgBJCXi?=
 =?iso-8859-1?Q?QDvLmLkDYi/oeb363EfxM2sqWvAwDT9ugopKdr+zxCgNuiACg3Qw0h/g?=
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
	ffiC/6+smkCJDu+UtlXmv9m98SFKyvGzUkwwzfKKpjbb+gETuqNEO2tJPMWqimAUy2vNjP+eAIQ5QTCmG6u6X+fyk/APsKsgYFTcz7jGVRlbL5Wg305BJq6pwzgBdr4uTXRjogs+xhbe4MlVnqVkYZ2lKu5up/IDuCbJOKICXepLHyUw3MM11/mr8nutSCbdDgeEswZ+nfWS7yGW8YMLG8pusBrXoG9Elw/mITSH081ykl1WcjRR5qzMKYN41lVL8A1xOQ28BcP/xAGj25FW/rOKFuo6gHy35arvGW777H/CHeWzNo+zLcCGfp3oYQqdTrJ9l/mqEFBFZyzc7GvZTJ2rHWueEq1+xemeHNsnqxgZKaYR3oUwkUX0xBbC8qpV/hrS33QP1nVXK7rw/j3wowR4nItAyOU+31WEkHIm4eh7oS02PIkMM5Bjz18FnPzzG1Dy675SIn+FvIc+6ZwE6HtTRt+AI+pWcK+39333Eb553TUEzvnN8ofxiIHPF9c2yDyvzV3JqHk3OtdLBOqwn/4Cr9PgVlQbieYWpXMTzew5m3uhLf/JD4t8mYacqLBKAskWMjkFLM+Itje+MKmE0GRpodpX/pug7wt7B8mhY2iiJa6rnHfRQFsnSQxtymtZ+s0+rOGjqIQzpVBdMyR0cg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ec236a-01a4-4c5e-2ceb-08dd197b694d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:33:19.4275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fo2YVQQVu2UCtmtTpoGLNmXbOUKucjv7HHWdxlqrB4lOgjrVLUCwKMit5tBnRaF4diqDyod04j1nKq+pCXXhKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=Z9YWHGRA c=1 sm=1 tr=0 ts=6758ddd4 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=Shp3TScI-t8v02M12rUA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: 9blWPjtOuDl1mqdIK7W89BnOLM1qrPOU
X-Proofpoint-GUID: 9blWPjtOuDl1mqdIK7W89BnOLM1qrPOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=973 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

Implement usbg_aborted_task() to cancel aborted outstanding requests.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index 696d34e04e7d..2a74414c7fd1 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1257,6 +1257,24 @@ static void usbg_queue_tm_rsp(struct se_cmd *se_cmd)
=20
 static void usbg_aborted_task(struct se_cmd *se_cmd)
 {
+	struct usbg_cmd *cmd =3D container_of(se_cmd, struct usbg_cmd, se_cmd);
+	struct f_uas *fu =3D cmd->fu;
+	struct usb_gadget *gadget =3D fuas_to_gadget(fu);
+	struct uas_stream *stream =3D &fu->stream[se_cmd->map_tag];
+	int ret =3D 0;
+
+	if (stream->req_out->status =3D=3D -EINPROGRESS)
+		ret =3D usb_ep_dequeue(fu->ep_out, stream->req_out);
+	else if (stream->req_in->status =3D=3D -EINPROGRESS)
+		ret =3D usb_ep_dequeue(fu->ep_in, stream->req_in);
+	else if (stream->req_status->status =3D=3D -EINPROGRESS)
+		ret =3D usb_ep_dequeue(fu->ep_status, stream->req_status);
+
+	if (ret)
+		dev_err(&gadget->dev, "Failed to abort cmd tag %d, (%d)\n",
+			cmd->tag, ret);
+
+	cmd->state =3D UASP_QUEUE_COMMAND;
 }
=20
 static const char *usbg_check_wwn(const char *name)
--=20
2.28.0

