Return-Path: <linux-usb+bounces-9541-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF398ABFBB
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 17:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6E93281741
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 15:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360B018E1A;
	Sun, 21 Apr 2024 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="PdNbUN+s";
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="IaZEJFSA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0068d901.pphosted.com (mx0a-0068d901.pphosted.com [205.220.168.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CDE199B8
	for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2024 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714096; cv=fail; b=M+mHZIII1L0DZ1unVAP6xV9JmlfKk0YNVMwaVHFWPDTiJB8+zzrj+ew3bbNTOg62jyQeYq4bkX+G/2hlUiq+WMUekka4uVoIpdUYM8O8hDfsKriYE9XmeDM3J7X/NJBZlq1/7OyR0j+RktZTsUr6tfzyk1ycSVbdPzTYUsvnwYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714096; c=relaxed/simple;
	bh=+z1g3neX55rlHisLEwW2qFpWjE5YExu5nDXzd82FxWw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L2SKNfLThhvpmiJiWq9Uz9xUPJfeWscHFC6IN567lPxRQA2QiksQaPNJhBFpq0tWyg9OiwRvOs/UG/JqxIrdvNzzOFTij5tYu6wOHeZgOiIkTCTU8BLauH+9p9jfM+jcAqv9JHkMXLKPReXFSjzwTbY86MYj43qsotwpkWLfqw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com; spf=pass smtp.mailfrom=biamp.com; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=PdNbUN+s; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=IaZEJFSA; arc=fail smtp.client-ip=205.220.168.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biamp.com
Received: from pps.filterd (m0278264.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43LFK2qt015080;
	Sun, 21 Apr 2024 08:41:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	proofpoint; bh=kY7cMsdAha9trRfQtMYe5NTo9V0c3z3V15P5X1C5TUg=; b=P
	dNbUN+symoeAUfmmZqBhDKgJbts5vjWRfe/fW98SUvLq0oIVjZPtTquDXXj6YX4Z
	u06+pRPLAjVahRDsrFDFw2EKwn1WR/IApKQ/RbqRg1EePfTUBH1cfXNzjtclR8JB
	xP4HBlz8ivPaHs5NcsMy3VJQp6kl3FgEGrrs+iEABhiTQxiakY08aScRnymplfnx
	4S0W3ceS1hnA30Y74/+rfAnGwSfma5s6upTROLUQrzwuksK+kA8TFy4CYLgMwa2Y
	VIAUYBM7RbhNHegncCVzRyQQ7maDGPfc0wls23iFvKIb8zzcCRSGKvzHAi93ngSl
	VlLQjyf8VUUz6jnH1WHCg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xmcrg0grq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 21 Apr 2024 08:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFaR1bS4tVVPw4Xz7UYyC5LVAg9TaS2+hnfM77C0oq+p53Z7JtdfOLWPMLf7LcLH2RS1dUZLc+cqnAP1WemEQuA2MhGC+5z/44n1x8VS5UX9VaUHltFjkUBtS664xpCK2HYy7LbwzgVaCuoMQLa3Ma1Ath6/37+P/tfphpqqigBQsv0ImY/UL5hN96RUhrqz0JT5f7h8GjlkMx3WoVd5FS/8DhQAQzn9E/C8zJjui1g1Kw+qwGRT172Pb0dL0yikOXXFiI9fLzf01FD1v4bLZaE78mx+dGZ5KJs3PUtZISko2emRseJih+IZfj9RUi/7/aFD9gD7Kt5lxhlJpjUx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kY7cMsdAha9trRfQtMYe5NTo9V0c3z3V15P5X1C5TUg=;
 b=EaoMtwM3oBrmZVR+VPTj4+YOdRkOAPPN4yF/+/x/4oR6FxJ/PHKrQrOaQV62z42d3yLR6bjVR4fMPu8t7uQHPqcFRqTuifwzbhb1n/rhEg1LuX6YdwEuP+6WgVo6azmIo3rmqgMaJGXiEM9F3yp/Mdadshgms0sPVe35ZwYPCFPuTkAHqq1TmN9I8Al/83XiSDH9fkx3xT1vL06EuFmcHBL+46uScLfiplthGsU1fmAn4gAfJV9Zf7+JPZSfDxezWicffrXGMvkqS7uv3+xJ/64V3kD7jt85IOSImxxTq8rKbyIjmRV1qr2hthmXEhoRWlNY6x5iAcOEt17RoMObOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kY7cMsdAha9trRfQtMYe5NTo9V0c3z3V15P5X1C5TUg=;
 b=IaZEJFSA4t0ElSGMblgxHckxB3EIBzP5lAZJNliCwfO6VqkjZQ3SmvuKZxlS+XXtR/tuDPpOhF8WwuMHs/JEPTIlX2ahZwG0AIkG+R8Bv+VpxsTi68nRNaXWbhe0ypJ0JkYSx3eakTLXUwc5o3oUEOPwyCEaLIuGdHAdFHZdim9F5kSrkgxCLLBUIGvJ4MGc9Rp899HI4HILB2ZWBw+WEkb1gZ8UmbpCD4Xy/4XKLPfvF4V+1lusyzYfCjC2/3142yCyA9I5Vu91+e7HAF7YcUEJAAB2CxWHZq5QZbb2NsHHPYgiQETYvTQL6Cr15GTghegZeMICpHYWWUWapNThBQ==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by DM6PR17MB4060.namprd17.prod.outlook.com (2603:10b6:5:25f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Sun, 21 Apr
 2024 15:41:23 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7472.044; Sun, 21 Apr 2024
 15:41:23 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_uac1: Expose all string descriptors
 through configfs.
Thread-Topic: [PATCH] usb: gadget: f_uac1: Expose all string descriptors
 through configfs.
Thread-Index: AQHakpdDOzPwEwW1akqDe4n7OahRWLFyhLwAgABXcXM=
Date: Sun, 21 Apr 2024 15:41:23 +0000
Message-ID: 
 <CO1PR17MB5419329D1584AD5AED65C703E1132@CO1PR17MB5419.namprd17.prod.outlook.com>
References: 
 <CO1PR17MB54198F836C3ED1B4FA5F14A9E10D2@CO1PR17MB5419.namprd17.prod.outlook.com>
 <2024042131-bonded-flaring-c579@gregkh>
In-Reply-To: <2024042131-bonded-flaring-c579@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|DM6PR17MB4060:EE_
x-ms-office365-filtering-correlation-id: 0151afa9-97bb-4f86-48af-08dc62197f87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?E3X+4WKQr4tqCEy03RC4PPwkYqtmDSqplqC7WDoqIHHfXlCl/YuDBrKb2h?=
 =?iso-8859-1?Q?8VM4hsNH9Hg/MeYP3pCsKR0pXzDWczsCq8daMkg3VGTXoKbvaa6h1+gicM?=
 =?iso-8859-1?Q?QVyq3hmlS1w8gTM1HkNgHyqrXSsGAvof37d5lrPj/byhd30GqEeKajWcF6?=
 =?iso-8859-1?Q?5FA3rUGYj092ukatRwGzht682qJAU+lgqLCvKLbRrFCpGmypj8VxMSdqXG?=
 =?iso-8859-1?Q?Bn/FEE2RuylPW5rBVeGfBpdrNmK5725JLlXA5MDML5mNSYmM0E6L4z/Unt?=
 =?iso-8859-1?Q?eTHsRGBE0xC8FOLmgt7bSCKxLdkOU6GQwOFX0oMaxV450T+lPTloh+DONv?=
 =?iso-8859-1?Q?1fJKSPeQ8Z1ThwPNydXoIkKonOWtzu1SIyqysscoj1FZKTfd+bg6h2zqKN?=
 =?iso-8859-1?Q?bnE6fhnZVGHlmy68oNlJJy6K3yJJjSHEfwntEpoT4fwLwTcGSPuCzVbx/O?=
 =?iso-8859-1?Q?x/QtAvjOWna1vOAoMQ1omIyt+kFgqXfXyYPCIztJKdYli2azLtNN2GaJDS?=
 =?iso-8859-1?Q?tv+GN6+AD3GJpYGdmkKXO0mxYyvmF2c6hThx5P9dgGtx9g4R/JBKdAZrh4?=
 =?iso-8859-1?Q?PUYp/qEDH1m7Lj4//63xv0yKAybnbgWSNRxUAaeyIDUTXEalnjiskI/oqm?=
 =?iso-8859-1?Q?nF2zv5eyq35fK0i6C1dRXv+XN8Hr6ZPw8mon5FtMIEwEW++tt7eKKXBimr?=
 =?iso-8859-1?Q?NA5fZ1nhrT/a4UA2ZQksXiBBw3pO0EginOPGH0AHpPoh/QcjcOlPRea+n2?=
 =?iso-8859-1?Q?giW7q/MgwVOidijh0e4kWBi56ffdYJy1ehCq5B6jIMHGFnYCUA6xTbydjp?=
 =?iso-8859-1?Q?feOi4V7xKLs2xcL11uTju2xQGYoMScPhMmvUH4fxo5hNxSrxR26vN9U4GQ?=
 =?iso-8859-1?Q?JBVt2ihSW50GPoHPateZodNJfO+vWSYnyq5gHNfAi2OZISHHp9paHfI9HW?=
 =?iso-8859-1?Q?+78eb8loR3122xOCpr4CBu/Y5nD5zEvsh8OqcO/F7rZrAPN6fOV+/LpVIf?=
 =?iso-8859-1?Q?s6afoE80WgU13q/nMQk0QM6Bmg4xAT27SenG20dk8vPR26VorJ+AF4233U?=
 =?iso-8859-1?Q?1sqF1QKV+oh4ME+ltp59l2qRNblvHRS2rkEtKzlL2R9MccIPx6Bq7bLC0G?=
 =?iso-8859-1?Q?ddAJUK/DG6L7IjgZvFNRXAP+gHLCL2Bw/pTBS+U2AQildBFOun711iduRm?=
 =?iso-8859-1?Q?w/GGMNh9mZXbe+06JzUtqRfoDUoXihzpZfvzKm88+3YOOPx7LCx1RTwE66?=
 =?iso-8859-1?Q?l7m9i3Na5zxGZ96TIA2V4G345bSQN+xHHzJe/4NnXHxAFm6VebBVRx+gs3?=
 =?iso-8859-1?Q?RcXp0abMN7EA4tTuUes7dn/vrxCAtl+BCBmoYwGnyd8+cJsdLfs3/bXCAF?=
 =?iso-8859-1?Q?pW0AovL759k3d1k0Eo4VaHSl6woEhG3g=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?f6BeFPKL8KKHeOzlPYd9yhkZP2Eg7AzZ/Q+fHUdt0D3sTxFWnkNobFhF/r?=
 =?iso-8859-1?Q?ukYGz1pwPKJRPFfr1KTzNOSLpx/DT7yrafXV5sIr8lHn1Dt0Zyu5BEm+Ks?=
 =?iso-8859-1?Q?rFzscpZTeRUIanDTB3RkOAl/L9JwxKDXlCHLZlS54yBBjy3q7dzmAQrXtM?=
 =?iso-8859-1?Q?70KRb5Vv+ZhpDysPZBKjv0WsdSTrKVQkanh4kIERte59R8gvaT+ASDbsHp?=
 =?iso-8859-1?Q?DaeXZrx2ppw1OppcoQlS70KH5pGyruW2xiW9ARDuFx70gwmyxzpRhTFcjq?=
 =?iso-8859-1?Q?ZFY6HQHUJOiWo4dZiEgxmAP/tqF0U0Pcg3RIaeVgOa9enln2ZWUhOj6+Tr?=
 =?iso-8859-1?Q?oUt5yjxGr5G3i2Fg/dDcjEB8wd4ZHIZgGRpRTwv0R+J91ZWlmiFNYMhJmC?=
 =?iso-8859-1?Q?CH4iE4YfBuN06xVHojfZ/Gub3rCJf3TbBaJKY2vEmUH5ETSjR+11RikD1d?=
 =?iso-8859-1?Q?glg2sGg9KRzI/TnEWe7ETyplq9reCCMjPryEaHGy4XEKiMUNqBxaFVQJnd?=
 =?iso-8859-1?Q?IilzBDZx3FmWPUkQ3wvEkJx1fyUXqFX9DqPRJCoRlFddjGO731aBkT8U0S?=
 =?iso-8859-1?Q?o3/mUuwBsK4j3O7A8Ma/I5qCAkeo+a2YNOoF/AXjtiMZo1ddFMAO3vp2+r?=
 =?iso-8859-1?Q?ivjJBvndHdmG18/YmMComV5+i5nA7Egp0rGhpPkqI7JR2LOxFeEeNHLS1D?=
 =?iso-8859-1?Q?0gDtBhDHrq8EJg7Sy4mxxHwchsynr8RUjMFdKTG3ig4uOjHQ2TIb9RQ7PT?=
 =?iso-8859-1?Q?kn3y6HJEJliANk9TamzoM5oPnSqeSVAQ3F0zB+a8wOFCxgPDL0ULChs1U6?=
 =?iso-8859-1?Q?i7GIW5x3DN4tr8haKQS50cVxJ/iAI64foR4O4C/qn1pQasUZbsX/3u2e07?=
 =?iso-8859-1?Q?YcC6OE8sgmqUorSIDebwWnXDfxE5EO96LH7HFVrKX3c0oe+NfRg1gMAD1G?=
 =?iso-8859-1?Q?2hqgAqLO2Z2bVWG7AOJ2pLB5+KGKIeWJi4YlA8mT4vWCOjRVa+QkgZJyQ+?=
 =?iso-8859-1?Q?SNZ1KIft5DOCxlReaEVbxb/E4jyQLNWFEybydp2a0kET6HBULszsqutpzT?=
 =?iso-8859-1?Q?iQTfdZucFCf9nQDXI1uVxz+tLZgQdrc0yn2MNQSyh3H3cBQ4vMdR3xFxqE?=
 =?iso-8859-1?Q?2p6LcC7JKkrZG+p79i/B8+cZ/64dGB65yHxb/m98rbws+gc6NUHaJFow2G?=
 =?iso-8859-1?Q?oS6Rgo/wC95aZ0w3MbiREDnIrmRJJOBMtLpWTwM5yu7vYEIykf28XunlHq?=
 =?iso-8859-1?Q?rasoGKZZc0Yqo055VMdt/sgvvhalkPRiu1jysj0tOKu/1hJsFHh3tdYNU2?=
 =?iso-8859-1?Q?J97Rw0M+jNzvuHs9+HTM/UphMUz5LBe/my+HKvGclKm8TRE60pHzyuTs2X?=
 =?iso-8859-1?Q?dKPZ5/Kze3D9mBsvQdAkSlgLQ8gxH3V5JcGKvZjr23OOQIO3vB9ro1oB8p?=
 =?iso-8859-1?Q?ZKItFqaIMQMSzr9z08QFOzVNcOOP8Abc147vpO3+tKf/BKCKoHWhUw2nIY?=
 =?iso-8859-1?Q?qNZeVfhubJzvSzdCiQMh6/GCuvkF1eomP1wBGpk1asHTwYrL3RT/KMR9FR?=
 =?iso-8859-1?Q?bnnI60zl7ZrRpVV9Wxp7eFdu+KrNPm5RBC+F4QdlwI/BaY64ub2gGk9W7E?=
 =?iso-8859-1?Q?eega1HAtaHIYz0+4n1eTemedncISSkimxw?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: biamp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR17MB5419.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0151afa9-97bb-4f86-48af-08dc62197f87
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2024 15:41:23.2807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rtd82yXSfPT7vQc2jkE9mskxxCOd86oy9W0xiIkaxS6WZxh5TBbxlxY+lwcrYqVTxJfK0gvx1M1J6EAtEP7E7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR17MB4060
X-Proofpoint-ORIG-GUID: pKiBGksQuVVKGyFYZQZA0Y8_sQ07EPqv
X-Proofpoint-GUID: pKiBGksQuVVKGyFYZQZA0Y8_sQ07EPqv

=0A=
> Any specific reason you didn't cc: the maintainer here?=A0 Or the=0A=
> developers who touched the file last?=A0 scripts/get_maintainer.pl is you=
r=0A=
> friend :)=0A=
=0A=
Thanks for the script reference. I looked in MAINTAINERS and didn't see one=
 for the file(s) I am patching. As luck would have it, the first person on =
the list is you :). I will  CC the emails from the script in the future. I =
am struggling a bit with our Outlook 365 server as it doesn't allow SMTP ma=
il with any kind of basic authentication so I am unable to directly use git=
 send-email.=0A=
=0A=
> >=0A=
> > diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/=
function/f_uac1.c=0A=
> > index 7de74a3dd392..100169d6dca7 100644=0A=
> > --- a/drivers/usb/gadget/function/f_uac1.c=0A=
> > +++ b/drivers/usb/gadget/function/f_uac1.c=0A=
> > @@ -377,24 +377,10 @@ enum {=0A=
> >=A0=A0=A0=A0=A0=A0=A0 STR_AS_OUT_IF_ALT1,=0A=
> >=A0=A0=A0=A0=A0=A0=A0 STR_AS_IN_IF_ALT0,=0A=
> >=A0=A0=A0=A0=A0=A0=A0 STR_AS_IN_IF_ALT1,=0A=
> > +=A0=A0=A0=A0 NUM_STR_DESCRIPTORS,=0A=
>=0A=
> Does this require a change to the Documentation/ABI/ files as well?=0A=
=0A=
I will add the additional configfs strings to Documentation/ABI/testing/con=
figfs-usb-gadget-uac1 and Documentation/usb/gadget-testing.rst=0A=
Are you aware of any other documentation that I might need to update? Those=
 are the ones I've found so far.=0A=
=0A=
 -- Chris Wulff=

