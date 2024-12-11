Return-Path: <linux-usb+bounces-18363-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D469EC0EF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD3621644B0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3632D1E535;
	Wed, 11 Dec 2024 00:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GvWUavv9";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="k50iAmuP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dJpZehZe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0971CF96
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877270; cv=fail; b=X8qUcvIPPRzY8fhjLnDfLghbq4BJ4MCiw20QMHvbSWtTkOyJRks3TO0v7nuNZ2umcx3RZG3gZXitQS+V7nuSWeBBTl03fqfb1ilw2Trgz5/mCl2IcokoXVqdr2SUvcbC+XY/192lK3WJqcKmQ1GxZ4TCGGEw5DDaJ+tocg3xnng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877270; c=relaxed/simple;
	bh=lIznTCoEIJkzpfgBe1i2JrPO1IyBOZOAI6NFXLkn094=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EavvwT8fk88mwePke5P/WPlVYcgqgtXiVwQGY5FXnp3EMFsJbm5kcO8troDEeaAgegZjW1oaLHlh/w/W5EAiYmjVPFICuuMGveHucyLN/qKdN0f2Go4VLpxM1CahWnPqjXZde0XVGRufdjDOP4qp17sEV7fr8GGFZRq4IKGBaRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GvWUavv9; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=k50iAmuP; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dJpZehZe reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BALFNFd000621;
	Tue, 10 Dec 2024 16:34:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=eF7AdIpJilRWnqukgEa9PaTfHSbUOTS/C+GNnaZ4/aA=; b=GvWUavv9+N0i
	oKEtWReVsVqlZlleYkc88jrlOo5lYZDdxWoEj+mcavpV2HbL2MAVY1CeWhE6HOsz
	+/P2KfzCmUEX/qCdDdfEsMOXzuAXZS+RyVtVVmO/powSysWDEepDhFilJ0SquA8/
	P7TCl+Aki1sHzjXSsIw/0nrTuW7SZmE4KwPZZmNOYBQQ7+6ZpnsE411lRuMoz9Vv
	hq6zITIAhirWFvbOyDFA7SNoR0likfkkhjtZkEqPhPFYdwIkrMBhJQ9XdNPne2DB
	is9K0DGRlOyi7sWm12p2LQvLEC4aF1plxUwCYy8IuSHlzeaT0aquTQt4yXMIey8a
	9z8vsvkvAw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 43cnvka1d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877264; bh=lIznTCoEIJkzpfgBe1i2JrPO1IyBOZOAI6NFXLkn094=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=k50iAmuPupqnBEDk3cBr2PBdJpzGQEYumXr4zSCdstyY6vx5hsjTPnTu7+pL7QiuE
	 1NdlrKmxXeWuT6aJ1n1YOez/bhJTUULf82yQ70RcxDISf8+aFwn1x83NbTt1Po8sYr
	 x5bNugy7vY71MKr2DAgKzq2I14pxbdEe1+hM7mo5srbAw7eXniFr+b9WYVBV5dNVn8
	 9sHG1i8pk/16KGBFdczsFERzdvieoPXRoKxMlWJm2lKBKuBlCB5BBFfqPoYLJcK/+o
	 HHYi1aqhUmPSRA1ovyxhRFzg1rifX5pE6fyvpjO4JtqIZe6N+e2cm+I15si8EUlkjE
	 lJ7RpH7S3R93w==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5EFFD401F2;
	Wed, 11 Dec 2024 00:34:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0C3ECA005E;
	Wed, 11 Dec 2024 00:34:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dJpZehZe;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A54EA404CF;
	Wed, 11 Dec 2024 00:34:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjujbtdBnrV6r8y02SM7Fbijofn8HYB/PFizemo0QKM7/33fWqWYZz7pjk/+kayLOinOHNZXiqBSAA7BAksew0/kyCTAKhYxZMNH6d8j1OIJLVc+v1fQUxcq5DfF4738EFhdMvb5UvBc2XZmwiyuMCrLAxCv2ZQrSLcYWDdol8M6z/q5kREA2vYPIla/AiV55kgbDWSmH3y0b4j0BCxFE2q0Q9GUwf0+ezPKCWU4mM6eGaIqHKaV4pSonPMixN3skNh6QSGubOPA6uAsFt0EROujSrMX05kn+ujTdtQuOJzunmuSFiov+vu3nFGp/MTkwpeLBUOXUzI16XKE0XcPrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eF7AdIpJilRWnqukgEa9PaTfHSbUOTS/C+GNnaZ4/aA=;
 b=ScN/4Xt6EGbS2zcgTYx0PVstGHGyOXZlpv+8MAeTaInaQTs4FHrHqkp1L3b5BD0borhOXfSNMpnTnYrYf345GxlhfPt5yiqbwnjtDPP7SOyNWlMrnWwtj7XDwt8oEfr9DZkDpVtNZaJC7TL9vlqi2EntpqCe0K+d0tt51wZVEvxg3++wWR1Vg0+kvWFpkfdtQz5Nre8gRuUNllutv+L5MXD49x3666lOpd0EkN/Ivb2utUhKHLkrcLxtJnnQYjy2ilAmPqYJb/GVpdSTIWAbTIwMgiWjnWp4waXxeo0nCKUcgL1WTZU9GiEBao8TZZk8UdAGpVpLgKuh3zi4VFSnPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eF7AdIpJilRWnqukgEa9PaTfHSbUOTS/C+GNnaZ4/aA=;
 b=dJpZehZejQ7vST3TKIZ2ad17LbN/+cePbGGxDxNfHLCFcJGzvaKI6NcZGR6PJZCJEsCB3mLtupRxxLDOkfOuL0xlyGb5KnKOL84PWp0tZrLQX6qsHMWQwrfdwgJN56RiwgAuvQRN/cMcB/136FpEnQ6xD5XQrGn0QolYo/WtvHk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:34:21 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:34:21 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 28/28] usb: gadget: f_tcm: Refactor goto check_condition
Thread-Topic: [PATCH v3 28/28] usb: gadget: f_tcm: Refactor goto
 check_condition
Thread-Index: AQHbS2RrD6OM9L5Az0eXkpJxO9GO4g==
Date: Wed, 11 Dec 2024 00:34:20 +0000
Message-ID:
 <8442364f51f2788d2a191997581a8eda7a143272.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 78b72ba0-af44-45f0-de2b-08dd197b8df7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?mgjHqzMcNTCGWOTQTetdZQACeMyMGrJG4bcPOYzoAZK1rAFIe6Rw2iNDGb?=
 =?iso-8859-1?Q?4Ce5LMz93o/pnU+qcqLjeuX1aZjs+0khS6PsyV/73ymU/n1q2qhTGYsaXf?=
 =?iso-8859-1?Q?188ozcxNo0ZsrbaBom5dcFrKXRoNEoKBXu5+6EgvbT/QK9aZrb8bgNUPiZ?=
 =?iso-8859-1?Q?S2s4NQQARWFU143QMUvRXBbO9MsUBYLiF9DrffBjDAWF/S0JOrBWBiu4x+?=
 =?iso-8859-1?Q?0yHlwBonhh1+VlwV4ZScUsOiIt5DrAwJTGWKNkaHCUu/7tDLUTqa1xpIfE?=
 =?iso-8859-1?Q?xB0vZeoOhvTcoWdTslpfZYobrcuPyPHZOG4f1zW5qvt+FO0NpijPWWdxOA?=
 =?iso-8859-1?Q?9AaryUuGi9MmbVxt9r19ioOY+Js2ivWIPmsfRP/kLjC7ZJND4cHR1l7r3X?=
 =?iso-8859-1?Q?iVuihw7AxUgRjW1/MlyayRRjla8tlr82g/Wj0kwHxrRDIeFzf7A1+/GwS1?=
 =?iso-8859-1?Q?8GmZP8dFRujbxF1gqXZOVygEJpjTnCs7vPHWFPrOTKw/wGPeagxQdAzI34?=
 =?iso-8859-1?Q?C0jmQVc568x4+DpQ8b3/hmcDXanZpH2LdwiYFDPtjRF8ZWBHLZ9j/inUKx?=
 =?iso-8859-1?Q?poazJbi894Zl4NVXXl2XKM2g3gJD2kZqh0QmvaLWcvLl2qHphpu7SbP2P/?=
 =?iso-8859-1?Q?SU7+IN8Ayqyg/UUmmvIyEn4KJTHGGA0t/s6MUsx4VjlUht/+kDXq+AGBoK?=
 =?iso-8859-1?Q?7hX7fnxZ1NgqrR72Of2A7SsKPniClhcNt+gpQqjVoeNeZZ7vuD6NnsdG5d?=
 =?iso-8859-1?Q?fTugDmUipGegeSSUA4YHBGvKavs4yiRpGT37tIftkIpayCqVlxJuW6nhZV?=
 =?iso-8859-1?Q?uwVPa1u9G2x2EHZozKnuifUcrtTJA3u5n/KGeWRPYQ7f7lTuHe8bau6dc/?=
 =?iso-8859-1?Q?puG+zkCjaGdWeybD8y3aUece8zM8RkkyrCTCXRUqEPkYCe+wxfRM/rczPu?=
 =?iso-8859-1?Q?4l1bp/KgM0NSm1FZ5Qaf6lSfCxiJqkJ17N4TW5mR2U7mnj7CC7NTjvVMRE?=
 =?iso-8859-1?Q?haWotIjlP82OuYZQcd7xaCje8x95RmfDqIwfw4hIeNqQT27htDXVYRIiAg?=
 =?iso-8859-1?Q?a5lV5tQxNwc3JT+gaxrtuLC1I4o+Zad8EmzkD+OzWtQf/5nmWSck3njQvp?=
 =?iso-8859-1?Q?7ovWuGtsf0EKSqhmu/rmXNGFH5fNtw6d7/ZNH4fyaM/7AFEZvot04I6Kck?=
 =?iso-8859-1?Q?yocvwaGLtpUYG9LqS4eP2mCVsLacveuJxupCEoCPTnBjCUx5/eDLcT741y?=
 =?iso-8859-1?Q?rYXPrdpqNBmqWYyWiT9/sorYdFOHEgbgHLAQSjZ32QYgp83xzp0pEqlyQp?=
 =?iso-8859-1?Q?C9Wh2+g3vBtcEydPz1PyyLJwiLQ6T9VapwS+7xJoHgoc4K3gjSSUclB19d?=
 =?iso-8859-1?Q?RB1I6qO6SKJp5t+xPXdPLSeIkK7dV7zpLbevSiiS7GzzyeW7S3A552mEFH?=
 =?iso-8859-1?Q?oAxTp3iPaWpnG1vKD0Ok8hRJYB+6EHuRl8J4rQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RkWqPjmIlta21Ai/P1yEijQG7PogOzFJ6HJNSH/24lOFcLTPLCGoD36FzC?=
 =?iso-8859-1?Q?lkS2fiGXId9l+FNB3qF0x08mTGMy2tz0UE2KQ3uR+hREW5Jm2peT7+PF/R?=
 =?iso-8859-1?Q?gsisPKf5C+JSoJMsC1RCBPa3WL6eO1SxU2pkh2YRg7jkjKH/Av2nJeMZWy?=
 =?iso-8859-1?Q?v1ttoeK82Iuqywjno4IEjOujdjXUIv+HGAv0RlfTOxPZC4TJ0/ONqgXvGH?=
 =?iso-8859-1?Q?w8NxzfDVaOAKtz3XrzaxTNXF64D3+Z0FytCX2yTJN9ISD/W9/ztjy1iX8q?=
 =?iso-8859-1?Q?azUlmSJplHJXekRIF0ulIcl2++NJBmx24LB6H9XiFpimZOjwObvG1FTC5e?=
 =?iso-8859-1?Q?SYov/6q2sTzERks+6vLca0Nb+9d99nMXapCTo5bQ0J2kzvtl3gg7WXALXs?=
 =?iso-8859-1?Q?pUmn3KVooSBJU6E6gJ0w+ycVTqRU5hdu92U8gjh3hdgpJ3aokmuaVBc6k+?=
 =?iso-8859-1?Q?XO6l4K3V9SahfJ3GgMoTZ2jJl8QtFmH2CIRSNFIVex1RkcbeRhtAOkl40s?=
 =?iso-8859-1?Q?rsWsxJnsKfrOXFzFsg/ilaOvQVtbPZ3KK12FfE85yuC8YxPpYEsqPDq1v5?=
 =?iso-8859-1?Q?ZLPhxc7aVmltTH2uyu1TxW2YRUR1R5q5R3qsI4hAGEEclpyIpTf/IUpqcL?=
 =?iso-8859-1?Q?tldnxjKMYOdeuaaUUXqag0d1a43dOa3iEkuQQvh+EcVHru46NYkmEvsIe3?=
 =?iso-8859-1?Q?YBs4kRlNs9zWQjhhAuMcQeQyOPZSPF5efIrSh1GOnBUN/oUYVEP50U2ouq?=
 =?iso-8859-1?Q?9ckkbDU3XeBMrt5Q6eBNyuzamdj7iMsZre/beDq8WdfpR4G9cUKQ3Tb0jT?=
 =?iso-8859-1?Q?kqR6JmOz6Ses21WN3hoia6nBKSokWsvTd50AYy1J6nw+InVbSVIGSe5gv8?=
 =?iso-8859-1?Q?U4lknxd3V69s9zCMGbzUCUWzUtWLW76aCeqTbH646r6AU3HT6QMgCGfG8f?=
 =?iso-8859-1?Q?eVklklhR0schZ6k9sITv18z88qSRdTM7g+r/A4LDTt7/LeoNnvehxXNNiL?=
 =?iso-8859-1?Q?KtgsDFPSVle8GZg5ummg0e3GJ11aVDcx5AK7VNIjJqbz7qzcTnvH5jQDoL?=
 =?iso-8859-1?Q?2LhYO0lmrlQHWPzDzQjAzkLRm+GbTahXaNzx3EGIUVMLyiFNgkkNkfU3nn?=
 =?iso-8859-1?Q?aAdJ0MFOboKP/HwC8RxMQYpHlDAhDW1kbWRK10nYlA/ywz+DIJu1diVS08?=
 =?iso-8859-1?Q?aJckJGzqWKNklMqGHtsZPeiUnUqPTVJr6nMqny4AEM+AnicQeQK2yshYAg?=
 =?iso-8859-1?Q?Y4ASAz70CF3NuHuVaG3qn+rFLemlBhJDpZYJQsFdlvfZ6LobZ3brqTGrxH?=
 =?iso-8859-1?Q?wOSjKrnvwY9ytZx7x+C1q56/I6eq/dSY5xgriwnhlro0Jur/nG2no94rHz?=
 =?iso-8859-1?Q?4h90mbfFgbs3sui4CWUsrSziGGIm47AJFgYHw96s5B2FZ61UEQwgPTPwAe?=
 =?iso-8859-1?Q?SAiq+mBQO88eYnCJlLFFmMbAQbocGTJ9CZGWpdJZBWMlACb1HYgLl315VL?=
 =?iso-8859-1?Q?7qkOM88PweSS4TvwmeyaDcwLVAw3j6isUH/IZePZa8mW6DH0u4qPSE6ejc?=
 =?iso-8859-1?Q?lXH3Uft414NLv21swunCWZozHwkEgTdkzrP2XEvRXY6N8xndda+n5HUMYK?=
 =?iso-8859-1?Q?4ovKXtMneymF33xxSv5DBB+JxeW9Tr97QB0AHPE87DuiZITnnUi5p8iw?=
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
	gNnCbjQnKv6QIknkSrSYKVYeoVsAyf2tPXZLz91YMGzwik5C9XYl3NNTwbwOfa3u8/GYaCFr2VlK04XIKa6GPLQ51m00yScYGZH3ijY1wWtas6tgVCkDH9yJBAPoFmI1LSf+HxRHPH8aiMZ+QBeyh0nU1mxeb5/kl8X/sAsr7UEcPf+Kfcei+NFWDKN3YRnYMZRYpwh21R1lZ1LlrtBvlO3E3K4TMMlec16YDL3plNvyUfs75MUla44VBbimCPHtSBz3N9vxIVTtsi6C9ZrWmpALZ5sDIafScYhwOe/grV/9vTwJb1E3zn+qu3se911QLe+l1AquCk5by9AYVDnkInUw7ndzIkR935yYOdm74QDKtCHBPQieZAWdh7eM0ZsTS63ISRTnlelyf1dAFjRkm4O6ZbYrYn+tNPp6uyfj5GT1TeeM+A7yTuKrAn7aASN6sAzBOIntBeTew5KHYMZ0c5I+5etYY9hFsi7mt6VzcVNntQGvlcvqFOYK/hmot5kVDB3zRXG/jPryQFlOnZOS4gBsq8sLy6M53seROX6BXUB6Y5Cp3P6rlXMdRm8csS9YqkyiVVAWuofw/PeCepO7tUCE/5IL8oO8SkwScYpC6+tqxmKgWQn1QWw6rIrT7QcFsUTYjEGjWQkqJodG2NEeLA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b72ba0-af44-45f0-de2b-08dd197b8df7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:34:20.9802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V0CRt3TOVWyO+Bs8XUnrz+l55BcHDrpq8hhTXXLnp+e1V1tBb8/KMODcPk1GwRhn5fwp6/aF8pM1Osp2C9TWBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=fNPD3Yae c=1 sm=1 tr=0 ts=6758de11 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=Y8aRv1srGp9X5m9hZioA:9 a=wPNLvfGTeEIA:10 a=EEFIF99-17FBX5V1_l-D:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: kEMSI4M19t97bzhwZKDdoV7wJibX9TjV
X-Proofpoint-GUID: kEMSI4M19t97bzhwZKDdoV7wJibX9TjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

Move the command initialization before the check_condition to after the
goto statement for a cleaner look. No functional change here.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index 72e7d4558eef..5a2e1237f85c 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1223,14 +1223,8 @@ static void usbg_submit_cmd(struct usbg_cmd *cmd)
 	tpg =3D cmd->fu->tpg;
 	tv_nexus =3D tpg->tpg_nexus;
 	dir =3D get_cmd_dir(cmd->cmd_buf);
-	if (dir < 0) {
-		__target_init_cmd(se_cmd,
-				  tv_nexus->tvn_se_sess->se_tpg->se_tpg_tfo,
-				  tv_nexus->tvn_se_sess, cmd->data_len, DMA_NONE,
-				  cmd->prio_attr, cmd->sense_iu.sense,
-				  cmd->unpacked_lun, NULL);
+	if (dir < 0)
 		goto out;
-	}
=20
 	target_submit_cmd(se_cmd, tv_nexus->tvn_se_sess, cmd->cmd_buf,
 			  cmd->sense_iu.sense, cmd->unpacked_lun, 0,
@@ -1239,6 +1233,11 @@ static void usbg_submit_cmd(struct usbg_cmd *cmd)
 	return;
=20
 out:
+	__target_init_cmd(se_cmd,
+			  tv_nexus->tvn_se_sess->se_tpg->se_tpg_tfo,
+			  tv_nexus->tvn_se_sess, cmd->data_len, DMA_NONE,
+			  cmd->prio_attr, cmd->sense_iu.sense,
+			  cmd->unpacked_lun, NULL);
 	transport_send_check_condition_and_sense(se_cmd,
 			TCM_UNSUPPORTED_SCSI_OPCODE, 0);
 }
@@ -1484,14 +1483,8 @@ static void bot_cmd_work(struct work_struct *work)
 	tpg =3D cmd->fu->tpg;
 	tv_nexus =3D tpg->tpg_nexus;
 	dir =3D get_cmd_dir(cmd->cmd_buf);
-	if (dir < 0) {
-		__target_init_cmd(se_cmd,
-				  tv_nexus->tvn_se_sess->se_tpg->se_tpg_tfo,
-				  tv_nexus->tvn_se_sess, cmd->data_len, DMA_NONE,
-				  cmd->prio_attr, cmd->sense_iu.sense,
-				  cmd->unpacked_lun, NULL);
+	if (dir < 0)
 		goto out;
-	}
=20
 	target_submit_cmd(se_cmd, tv_nexus->tvn_se_sess,
 			  cmd->cmd_buf, cmd->sense_iu.sense, cmd->unpacked_lun,
@@ -1499,6 +1492,11 @@ static void bot_cmd_work(struct work_struct *work)
 	return;
=20
 out:
+	__target_init_cmd(se_cmd,
+			  tv_nexus->tvn_se_sess->se_tpg->se_tpg_tfo,
+			  tv_nexus->tvn_se_sess, cmd->data_len, DMA_NONE,
+			  cmd->prio_attr, cmd->sense_iu.sense,
+			  cmd->unpacked_lun, NULL);
 	transport_send_check_condition_and_sense(se_cmd,
 				TCM_UNSUPPORTED_SCSI_OPCODE, 0);
 }
--=20
2.28.0

