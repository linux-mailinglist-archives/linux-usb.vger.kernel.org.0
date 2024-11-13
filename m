Return-Path: <linux-usb+bounces-17522-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB99C6637
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 01:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D443CB2B86F
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 00:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB13134A8;
	Wed, 13 Nov 2024 00:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hidglobal.com header.i=@hidglobal.com header.b="Od6H7GZW"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475E623A6
	for <linux-usb@vger.kernel.org>; Wed, 13 Nov 2024 00:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731457757; cv=fail; b=ap8hyjvVMiHIalwCpV/zcMaCQJhOqltygmt7IWqpd+Gjk7mtW/0CvijToqGSKGvkqN12iq6Db17nEP8XyomjMez2TK2w01UFARBw/bG9cEdezkxryYwY/ip4nK0pIWjKiNhrFQwlJBXSgdx0ajRCGjLLeTkoUIRBFM6YwA8yEZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731457757; c=relaxed/simple;
	bh=XNfkW6gUy5n4iG2BXDqxKFrWmPuXQ6Yoyv4q4JZf8aU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nTn9oifNUHQeWQUIiegYvV33fF9vdpRQ5M1rnec2F5Ph/a9ur41j1A3At4DptRNLGwpsDADYLH7LI1wgEGj3tI51XY33yUu7zMS9WCe5IC/ygk5fyrdjTzwzWsRHyjhTTvvbK0q0Er08jVzVW6hpajEixEqNgeIviTrTVcyZ7+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hidglobal.com; spf=pass smtp.mailfrom=hidglobal.com; dkim=pass (2048-bit key) header.d=hidglobal.com header.i=@hidglobal.com header.b=Od6H7GZW; arc=fail smtp.client-ip=40.107.20.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hidglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hidglobal.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIhRnralJYt4RaW5GOfngygGKjYtTfFD2be36Hm3Dj3daqvG4arQWOJkec1WEifjrXxw2MRIYe80wV/gtCaGHVGuqJIR9bo/jeJnlDcMnb/K916h7dUNXxH3UpdNLCyiqjMAyLva79XxwyTzA6r2q6acoqLKTWuf116VgemTiRpWNoRdIIIJ2tgi2ysT8ZYD+zef2UXh2bbditEhUBmRajt/dZSYrS+QLXiVb40sF/KeNWhN8BwvwfyQ7WgmPbOYRjJZ4zbVYhzu8U+tCnUrnn6RouA9EyUD5yxReAYBBkBXey2LbyZJ7mIPFJyzKyEjwoCBNR8SuHyqtQ4+eHSwcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNFR833Uz54OMR6nDRT9Mmk4uwICsWpz1qmDUpfiUcw=;
 b=Via8EE8fQcpaenVXg+Wnsb+F52nj6Z79Lh9ZgGcIzQES7GJkxhQyYXhbNzd74+V9aobj32sjfP/mrJDdVFvcCW39II3UZ24qxQEgPHh03+xazh3nDJl66h4PQNSEFOl7lWmWAQCNLFOiHknJ/BgCCLjgiitZQ9X6V5JPJQLqfwwFzyGgnr8mI+WMbPUpeuIyeFNHA7e1/0EEh39XiNk58RmU+MKcdMt03xEwd58zdS62Qa4VtsKEG3YMvZGuHwQ9udrnf32AV1X46gnJ9/GEh0dGOYDYBlhx0ZD3dClq2PRsDIe2Uxcgdy/Peibv1MKKRxUGT49ASAQ4DOIdCRS01w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hidglobal.com; dmarc=pass action=none
 header.from=hidglobal.com; dkim=pass header.d=hidglobal.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hidglobal.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNFR833Uz54OMR6nDRT9Mmk4uwICsWpz1qmDUpfiUcw=;
 b=Od6H7GZW0wMjZh31bbr7rHTpL8whGJXCiO+H2jUCVtYVn0MySjQcSq/CNMh9poTTM24ID/EdC2rQq8g6BwBexdSraPqnyUg291urzuKQvofHdNdh4a0ZObAQPZJMkByOBVe3kEXO7suvhuP59HeqIShABgM+GOq49bFeqHVY5trVFRuI/gVFC3MzGFW8ofrcrueQdIty1AK2lqiezPfoSLGPfF2zjftnj4xR2MadFPg4sjM+9x8clEPnQJDn86EmIrjv556QwVO8GU/YdGYofoohzxdTbBt+bwToxW3dEX1f+cYFF9lP/tbXO05Wqm/AkVxWDu7xj0mgo2+3CsLhxA==
Received: from AS8PR05MB8485.eurprd05.prod.outlook.com (2603:10a6:20b:3cb::12)
 by DU0PR05MB9261.eurprd05.prod.outlook.com (2603:10a6:10:35c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Wed, 13 Nov
 2024 00:29:08 +0000
Received: from AS8PR05MB8485.eurprd05.prod.outlook.com
 ([fe80::465f:2e65:bd01:4957]) by AS8PR05MB8485.eurprd05.prod.outlook.com
 ([fe80::465f:2e65:bd01:4957%6]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 00:29:07 +0000
From: "Vrastil, Michal" <michal.vrastil@hidglobal.com>
To: Elson Serrao <quic_eserrao@quicinc.com>, Greg KH <greg@kroah.com>
CC: "Vodicka, Michal" <michal.vodicka@hidglobal.com>, "balbi@kernel.org"
	<balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"stable@kernel.org" <stable@kernel.org>
Subject: RE: [EXT] Re: [PATCH] Revert "usb: gadget: composite: fix OS
 descriptors w_value
Thread-Topic: [EXT] Re: [PATCH] Revert "usb: gadget: composite: fix OS
 descriptors w_value
Thread-Index: AQHbA+aNCId6JjTJskmVJ1TZT1+WnrJV3meAgCDduwCAE4nYAIAqDrGAgABpM3A=
Date: Wed, 13 Nov 2024 00:29:07 +0000
Message-ID:
 <AS8PR05MB8485C49296958134F7155BC4905A2@AS8PR05MB8485.eurprd05.prod.outlook.com>
References:
 <AS8PR05MB10129E57ED13CF18746FC4BE18A9B2@AS8PR05MB10129.eurprd05.prod.outlook.com>
 <5f8cdcac-6927-429a-8ef5-0891c90e8efd@korsgaard.com>
 <2024100457-able-sake-47fd@gregkh>
 <9918669c-3bfd-4d42-93c4-218e9364b7cc@quicinc.com>
 <7bab2899-9150-4e8c-9a96-b1bbf20f4d61@quicinc.com>
In-Reply-To: <7bab2899-9150-4e8c-9a96-b1bbf20f4d61@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hidglobal.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR05MB8485:EE_|DU0PR05MB9261:EE_
x-ms-office365-filtering-correlation-id: 466255f4-708a-4122-d78e-08dd037a2f83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?iuac55cizKeU5P1cvYrMCRdk9RWBs5v2XlIyHAPZfsIJC/l68R1Je9bz+U?=
 =?iso-8859-2?Q?JPc8Wxz+kgPH9Qd/gKWoIKYsD8bD03Sj6eNPFYyWrC2ORebZwd0W6McTvc?=
 =?iso-8859-2?Q?upRDwO7Ix2dCrrqFPnHZu9oNBpgL//JhHFq+09wwwSw9TNll4qvJaExeeQ?=
 =?iso-8859-2?Q?tZurhc3YySU5m4N/H25/41cYTDU0ALoCRDH7J98i3ZwObP3SNqd7/6z9mi?=
 =?iso-8859-2?Q?b/7wrAKNqh79uuDYH5UjCc5faLfS892e9/uRLcNuNe7rOer8KgtLSaQH/P?=
 =?iso-8859-2?Q?R/jLBW1/uweLibW2bB0kGKudxHDPIObzWizRQwwPB040HAogZLrnVwi8qe?=
 =?iso-8859-2?Q?uAT6gRyqxKrj/ItLF2BT/FY5ueGMP0ROJjOubuV+RWPvRDBe+tCKIKgt8o?=
 =?iso-8859-2?Q?tDlZOmdJ6K3b3fajwuyeFTYZAFv4NyOEoWEp1kKJha2oWw4rOyVLloYACu?=
 =?iso-8859-2?Q?IILzO6XajtFtXC/goKrAERAajitJas0epyblZ3YjApuZOefSCUwqNkWXv7?=
 =?iso-8859-2?Q?dNDfr1GyguETrsbiGB3bQV/zNYfOOHkPRbIdJ6xhxt/yyHUcWo5WmCnkc/?=
 =?iso-8859-2?Q?Gqwb4OW00/L0KXIdGsnz8J+r/lXyn/TZmsIPUzbcgdWZQwNmfdG9jzUl9a?=
 =?iso-8859-2?Q?ueu+ykIYlhHJp2T/3s5z/frzZZaE2P0sZbHENEqxIZiDHTCNrB1lh6qeJy?=
 =?iso-8859-2?Q?CbDKJZtEkpK/PfCMJf+QqFtnsQH+W2bvjZ25dbcG15NDSIeltxlcv2dq/Z?=
 =?iso-8859-2?Q?pySlXV+gFMBJzeUGcbPbNjH1rlZq3rNuj5QVKIdmBS9zXfjzlTfcsVwmTO?=
 =?iso-8859-2?Q?fRiI2qynCyA/GBy77kw27hOZ2VmzlWgBdxvVEeNXeRCGSdIfKud7LcqnUz?=
 =?iso-8859-2?Q?gTz10Tc7Fln23v/ROtGRsBam+PJkFEAR/S5pPg6M+cOYFCAut9XRoICc+X?=
 =?iso-8859-2?Q?plHsBcgnJEooCKJmSsQp8W/Dd10APSIsqvNC1lu8n1WWX/WpVPpqfgNc4w?=
 =?iso-8859-2?Q?rPdKJEj9E0xNf8MAjXZt6LhOofA7GQolTeYL5BwSO/OzWSksDL6jSdcNnz?=
 =?iso-8859-2?Q?OI/kP7VcQQAOUk8ZQuxNWfu0151IsJeQ8/KRJpIPA6RqhSjwz24Xpr6Lgc?=
 =?iso-8859-2?Q?a32g5U8Iu6recx7oS+O5coKz6+xWL8Z/vRfs62HYPNPoY5/cR/hDAVTKCh?=
 =?iso-8859-2?Q?heMO1WDCc8KN8Q0JO0rF7Cr9mp4KcSwrLuTKaQW/XTovUfFjotyh79FAxT?=
 =?iso-8859-2?Q?h4BKFPqXJD7dkiws9Qf4dV6UiBTj7qUijKDZ+uuBipIv8KMf9mftbRiPE6?=
 =?iso-8859-2?Q?r3nt0MCFfIvHWvmAAA8aIHLDjT/DkZFzbuoYuaEBo7WZHYH5VauZ0f+Ygt?=
 =?iso-8859-2?Q?U/yCRU/yre?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR05MB8485.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?3ebjDXsvDZrNCzkEoI0O6HZ5myO+0czm9cVOCLepOfj7d9bBLwOyadAYD3?=
 =?iso-8859-2?Q?Z9mVJiRQrlXUjEJzKB9ULgfG+7CNRCKPBPX1fQiM3qUL/BwKkw1+vKeWvL?=
 =?iso-8859-2?Q?O2IwYGsVdwmhtWIfz3veYBQg5+FbhKBvYu3Vg3QAfwSqHE+Pcwvjmjjb/C?=
 =?iso-8859-2?Q?H1XYXwRfWYb+kQcx72rj8b9UFCGDp1zc6akW5qA5YJwp4dzGbwC3nHjhwu?=
 =?iso-8859-2?Q?6/zAMrudJ0OJqBdLW0DnnfBBTaZE7slWNuc8pgEQN879fabPhf52prVV0/?=
 =?iso-8859-2?Q?5n6kaf78hqf7CiJcMv18XFb97xzeY0jRHEI4ekwjlz8Km7Zar5PBjRD74u?=
 =?iso-8859-2?Q?Y0D8GMKd6RP8wp5qInIOQ7ALIkD9bU7Ep5DdDa7pzhznZ737iyuIvo5MT0?=
 =?iso-8859-2?Q?XocFYt8rt5ATW2BsmvNoxiXFbncY9+Zdwzxll0UpXo3Hti2lmTu1IqV0DX?=
 =?iso-8859-2?Q?x/a+r1bGqju3CBe1K4wGsd79SRslbpSWA0xATwG2UCJS0vNB/+EQFvOzFy?=
 =?iso-8859-2?Q?Q3gU+Hxnk8Jcx9ga2AjQg7JgG1Gdv5tf6tHb1EKzkQiK7rq4WXH2G1qyju?=
 =?iso-8859-2?Q?2If4qO2Qcxbm9AY59+XJ2oeT5TyNzfKxTAjXYtpZyUIX9PgQeLr3uxxx7A?=
 =?iso-8859-2?Q?bhIzsRbQvwh5H9to+2TIT6JTASs9naCMpF6OJqT1RSs94x17R3gMpgXJtc?=
 =?iso-8859-2?Q?9Ax7Bik4thXqkY8xtV2ya0VkOPywK8ShM6nij+nojsBHRrtbGIncPGKYt4?=
 =?iso-8859-2?Q?wR8poyks+Li0IDvHoC0NEjrSjlMllzUUyrwfu/5O6J4kdSfvSOgqRTBaOW?=
 =?iso-8859-2?Q?EWRBWwUzwgeZJ9CYzobjN0x88gIjDUdYJMePudfja5SUSDP22llBCx0gnU?=
 =?iso-8859-2?Q?+YKX3Lr66zaaaWe2AZR7Ily9wWywzItx8jOiX9MK5fYgqPHGy4CuZkiIKI?=
 =?iso-8859-2?Q?k3JWQ9QugGoh94fM09XT2dQFGMN3Iw+vjEMnvAD+uC4N7FrhftPPM9FmMJ?=
 =?iso-8859-2?Q?ebpEIP6p2k3+OM1PlcUUHWxAZBNJzIKgwJVB+kJ3XLCJWjEFIJiaJSUZcb?=
 =?iso-8859-2?Q?WzFbdU8gueY4rQVVQf8yUjfTPPq/ENfLt0MgnexfOVin7hHImVJAA55Voz?=
 =?iso-8859-2?Q?jJjbLq7e0Xj0568C1Tmg3pDKWkjr9Ufc0YnjlMlFq17opqVdXuSccLVc5U?=
 =?iso-8859-2?Q?D2wnSKxkOGKJhRQG7ZDU9xbAzDvjVaNGToloRC2oIbLoZHRPVqopelymm6?=
 =?iso-8859-2?Q?NaF/0f96D+3N15OsZJu0pelPIgR+sX6Ydjwtni6znP0raqhESVdMSYQN1z?=
 =?iso-8859-2?Q?26F8mBNJW5+mfM7JUN3WkuORIgv+1rgBw38HM7CxUnVtm1GwnrSumWE64E?=
 =?iso-8859-2?Q?YXkR5v35KRQxWe3Tg9uQ5ji5Nd6M/a0aAcFHOnlVB15r8KiV+g2hFU6yRH?=
 =?iso-8859-2?Q?xQg26c1KL8OpiuxXNHnWCXl44zeXJtbuRq1FT1HFpBa9ERv8/JU6qZk6d4?=
 =?iso-8859-2?Q?c6X0xhKSCyCeMbgVWs0Phpyu/hQb/+vpg0aVYr7yx5HQHy4HdDPHosuNr8?=
 =?iso-8859-2?Q?2wRT7eiUIJgc/1b2v51mYpvvUwlJXKzrivUJgdqX6GZdmeEqbUhVeA1lzx?=
 =?iso-8859-2?Q?xE6xFy4oRHAC3lNBtFy9zbn3JP8KFOS39b5Bp/yCzA07+CNjds4Cjnlw?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hidglobal.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR05MB8485.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466255f4-708a-4122-d78e-08dd037a2f83
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 00:29:07.3984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0bdc1c9-5148-4f86-ac40-edd976e1814c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8iOujl0/8eeWl7c2gZZddgbIfwD7umU9JIrhkYDYtHO1LFTkGmNW4SsO4L4bRWxgWo9+QGY7cayNIcupljJxOSRfZfS0SVBz/f+/okXPrzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR05MB9261

Hi Elso,
Yes, feel free to proceed with the updated patch. I was swamped by other wo=
rk and never got to finish this, unfortunately.
Thank you and best regards,

Michal Vra=B9til
Manager, Firmware Engineering, Extended Access Technologies, Biometric BU
Mobile: +420608977018
michal.vrastil@hidglobal.com

HID Czech s.r.o., Th=E1mova 183/11 , 186 00 Praha 8
www.hidglobal.com


-----Original Message-----
From: Elson Serrao <quic_eserrao@quicinc.com>=20
Sent: Tuesday, November 12, 2024 7:11 PM
To: Vrastil, Michal <michal.vrastil@hidglobal.com>; Greg KH <greg@kroah.com=
>
Cc: Vodicka, Michal <michal.vodicka@hidglobal.com>; balbi@kernel.org; linux=
-usb@vger.kernel.org; Vrastil, Michal <michal.vrastil@hidglobal.com>; stabl=
e@kernel.org
Subject: [EXT] Re: [PATCH] Revert "usb: gadget: composite: fix OS descripto=
rs w_value

[Some people who received this message don't often get email from quic_eser=
rao@quicinc.com. Learn why this is important at https://aka.ms/LearnAboutSe=
nderIdentification ]

CAUTION: This email is external. Do not click links or attachments that are=
 unexpected or from unknown senders. If unsure, click the Report Phishing B=
utton in Outlook.

On 10/16/2024 4:55 PM, Elson Serrao wrote:
>
>
> On 10/4/2024 6:33 AM, Greg KH wrote:
>> On Fri, Sep 13, 2024 at 05:39:21PM +0200, Peter Korsgaard wrote:
>>> On 9/11/24 03:32, Vodicka, Michal wrote:
>>>>> Hmm, very odd. How are you testing this on the host side?
>>>>
>>>> We just attach the device and check the registry values created by=20
>>>> OS for our device. As=20
>>>> HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_XXXX&PID_YYYY=
&MI_NN\<device_instance>\Device Parameters.
>>>> When it works our extended properties are created there.
>>>>
>>>> We check the communication using USB analyzer which clearly shows=20
>>>> wValue bytes are in opposite order than documented. This is SETUP=20
>>>> packet captured:
>>>>
>>>> Offset  0   1   2   3   4   5   6   7
>>>> 0x000   C1  A1  02  00  05  00  0A  00
>>>>
>>>> As you can see, this is interface request and out interface number=20
>>>> was
>>>> 2 which is in the low byte of wValue.
>>>
>>> OK, annoying. I am traveling for conferences this/next week so I=20
>>> cannot verify here, but presumably you are correct. Do you perhaps=20
>>> have a more complete capture you can share?
>>>
>>>
>>>>
>>>>> Could it be that you are running into the WinUSB bug described here:
>>>>
>>>> No. The mentioned bug is in wIndex and out problem is wValue. Also,=20
>>>> MSOS descriptors are read before WinUsb is even run.
>>>
>>> Ahh yes, indeed.
>>>
>>>
>>>> What Windows version were you using and have you used USB analyzer=20
>>>> to check the communication?
>>>
>>> It's been a while, but I believe Windows 10. In the end I ended up=20
>>> shuffling the interfaces around so the one with the MSOS descriptors=20
>>> was interface 0 for better compatibility, so it is possible that=20
>>> something went wrong with my interface !=3D 0 tests.
>>>
>>> If so, then I am fine with reverting, but we should probably add a=20
>>> comment explaining that the documentation is wrong.
>>
>> Ok, Michal, can you add some text tothe changelog and send a v2 for=20
>> this?
>>
>
> HI Michal
>
> I am facing a similar issue where the Windows host is unable to fetch OS =
descriptor from the device running v6.9 kernel with Android mainline. Teste=
d your patch and it fixes the issue.
>
> Host Machine: Windows10 22H2
> Composite device: NCM+Android Debugger (ADB)
> Issue: Windows host is unable to fetch the OS descriptor for ADB interfac=
e and hence ADB functionality is failing.
>
> Also checked the USB analyzer output and it shows wValue bytes in=20
> opposite order than documented i.e interface number is in the lower=20
> bytes (for Extended Properties OS Desc)
>

HI Michal,Greg

Since there has been no update for quite some time, would it be okay if I u=
pload v2 with the feedback given ? This bug is impacting ADB enumeration on=
 Qualcomm platforms, so would like to proceed with this fix.

Thanks
Elson

