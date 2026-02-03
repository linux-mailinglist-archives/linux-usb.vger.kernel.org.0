Return-Path: <linux-usb+bounces-33017-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Fy8NVtAgWl6FAMAu9opvQ
	(envelope-from <linux-usb+bounces-33017-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 01:24:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 221F6D2F18
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 01:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 587F8301BA79
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 00:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8097A1A4F3C;
	Tue,  3 Feb 2026 00:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IRi9cDNd";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RJCKwAMc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="km5KgQ3K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9382F872;
	Tue,  3 Feb 2026 00:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078292; cv=fail; b=OyoTvzWCUtTmjbcO0hLsSVgQDl8cMJBzyKFz6DRPWcdKBWdBcsi90A4TThxjrTpTGm3Lidz9bC+0KCOtL7djzWGjwl5Ap2b/lMhRrHUI2mIT4eE+tCwl/YLvosMArdTKt+y2HbXU3Y50mqh/VTTXh+a+/KcYa7t0zXDZRf+a6WU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078292; c=relaxed/simple;
	bh=yzu1rw0ridqDVEEha5je30F549tmzx97EHjp0ntj1lo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DDz3QG+oeCfooondXAJwnOgQywzFcO0pCgbneRd87N4btJH5yin9XrXauMhIvFMImSHl/Md7iQo7Vv5wbAc6I4Bxrh76an1Yw9RfF3I/jHK/lnL+7eIHNGt5CObMhnx8zcO7+68dbz476aN9fnUHH0nn6StHcJxvps6A+TPY9+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IRi9cDNd; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RJCKwAMc; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=km5KgQ3K reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612LsmBn2680423;
	Mon, 2 Feb 2026 16:24:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=yzu1rw0ridqDVEEha5je30F549tmzx97EHjp0ntj1lo=; b=
	IRi9cDNdXDR17FX8ZswvDx5y3jgWg15MQl4LNZg16a7UROcwO3UV+qvFJAXRVuvm
	UYrZLgcSLFEaD1oXPVKCbi9TWT0clpTACiPasMJmrZM56mz55278s1P9Cpz/QOY9
	tQ4lpGvl8dNZ37+/LnKjgMarQDWCAm2popDmT+5b5ffQyO6ufVVYLRWkq6aILqL+
	7ALuoTPHg4Yla7ngSuCR6sSRjuCKb/64c0KZf2IR8iyY4XHbSXRuMHKHQPHwvy0U
	vNZf5Yg5U8X3feurkPEBRdpABykOymIExSrHxN+P/VASFBZBog+qCDjXfnUltEds
	HgEfGKLfa8+dn+6FtnxO1g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4c1hhxsh2u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 16:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1770078260; bh=yzu1rw0ridqDVEEha5je30F549tmzx97EHjp0ntj1lo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RJCKwAMc2+T8+/WGEYVeB2lOAr3vNmyXGgWrmfpiWYCdmuV5v7aniPsDCtCUC8Dfw
	 XNCBsf+1C3HgjljZ+ZLZLrlp1Wiqdf8Sr7QW960ly8XeYZYL0wyIgjwFkBdBBRFrC6
	 XwoVKkAGoe3lbvnPs7zFCfBuDefN5jWqp4ZUXrvC9xWjEfXOtreajJi74pJ7IuZirS
	 tzroSJBKDrknVtjLHlGKqYfXl/MtFxKQKL7TfMO/mp0hnc1/Il99VOOMzeCIuEptjO
	 oFBzFndUvzZRJnvDrBPRIpHr4P2qUIV7g/FBptKJUej2Dr++9Y6P2RVUALlKWauvcc
	 n/VluorFeSyzQ==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7845440B8E;
	Tue,  3 Feb 2026 00:24:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B1D98A0072;
	Tue,  3 Feb 2026 00:24:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=km5KgQ3K;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00305.outbound.protection.outlook.com [40.93.12.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7574022036D;
	Tue,  3 Feb 2026 00:24:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRISAwdftQgO7S8JnZqaOGlkq+dYYJDZlIPYGavOaFXd2h8+l1zZAbx7h1mI9UiDW6hMXydWs4RHkzGNTi5XoqJ33gjwsem3AApt7W9yRImSGwh9CfA4aOak6DSH6lColj5uzCkbCeVY3qatVlNGmvLBT5d4T0jIeUHesXtmOOIi1X52IuePpUL17YKdZEsYbJTcZp+Hd13coM8H7ufxXirl+CHRDviheUldwAd2Cq3IGqtiMsNP3fx4myCQfO2d/4oI5lNQJxWhfpl/yzh1pnCr0bdtrBGaH9+U0O0AM9SyrX+T3CnecIJkZzdjRXXoC6cw6iDBxTd/o9e/Iw4lRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzu1rw0ridqDVEEha5je30F549tmzx97EHjp0ntj1lo=;
 b=OZk4WDmUFCaBmRYQWzAEaRRQpZsQLL3dNh97nR/Aroja19nEP17IXl15AYdjcJYCEQsvtpFKcMCROLLYp8AGY3sQqg5PzWsQBf9k4QFyjae38g3VAoc7Oksu5WNyjCqToCzddc16l4AOiXmC/jtbZSLqo1j3icfC6pLJ2QHLynnvcf+3kJ8vDZ9sAdJcH4YWNmeKgYGb5uGnUbbtwphhWOZ8TN00TkxoRDwlrPyXxfTT4DHOEkun0QrXDsLQvSqdejds+CfYYFhZ9BONyEqzBu6znlcAlrtuFt/NNJ3MxspppsHxjtz7riuspOvPSzegov/JIcZUG4/eYyOGGQ6NXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzu1rw0ridqDVEEha5je30F549tmzx97EHjp0ntj1lo=;
 b=km5KgQ3KjQCU6onuP4UMR5B2lMjTubgL7xF8SiUzW6EI78OcxZgB3GX59LYStZik2CllPcbGAJQzaXyiahGWr5eXuFhY+nJabZJRqKQ4StqJe6OZE7C/LZMCN/R1yVHBbUkwhevc0jq0TjBcorgmXt8OwuZactRtHG4cG7ggELs=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BN7PPFEE0F400A9.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 00:24:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9542.009; Tue, 3 Feb 2026
 00:24:08 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
        Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] usb: dwc3: add may_lose_power flag
Thread-Topic: [PATCH 2/3] usb: dwc3: add may_lose_power flag
Thread-Index: AQHclC5uLPRmrVy2RUu/Unb73tjpp7VwHnGA
Date: Tue, 3 Feb 2026 00:24:08 +0000
Message-ID: <20260203002405.5wxsceuc47m6hrud@synopsys.com>
References:
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-2-c44a5e919380@nxp.com>
In-Reply-To:
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-2-c44a5e919380@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BN7PPFEE0F400A9:EE_
x-ms-office365-filtering-correlation-id: 74105d78-0ff1-41ba-8543-08de62ba8c0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?R0RmaDVONnZiV2dmZXJrZ1BvR2JtZ2puMHdrVjloRkxHMENadlE2UDY1QTBq?=
 =?utf-8?B?RExjb2ZsL29nTHhRWjFEQTBZU25TOXNYNGRBY3QvT1FRR0ZvaCtCMzZuT3VG?=
 =?utf-8?B?S242RnNIWEppVlF5azB0U3hvSVFiMkhrWnBQL2lBVWlRV0ZkL0t4WTB6dmQy?=
 =?utf-8?B?Vlhmb0hCeEdQNFhUSzBBdWZLdkNWVUZBbDl4K1dyVDJheWppTEpaTmJXeXV4?=
 =?utf-8?B?SzNyVDN2Ykt1Sm1XRU9ncnIxZWtrKy9tMjhqQWlUWCtBZVoyejJVRndFaHJI?=
 =?utf-8?B?eU1zbHJINlNDZG4xRS9wT3oyQ1JRSFZSNE9vbzNkNW9TbEp2SEZkYWVmRE8r?=
 =?utf-8?B?Y3dINTJoLy9vU1JXYWpIbXVBdHhlQkN4S3pCU0dsM1dOaVhMQUl3NHdrQ29U?=
 =?utf-8?B?c3lKS1Y3dlF2UHlSM3Q2eHBXbWJYU2crT216eGdCbXlQeE9XaEtZRzRvYVhq?=
 =?utf-8?B?STBYekcvNEJ5RXBycEp5MGd3VjhRNmdjVmkrTXkyTVFmNkk4OHJDNXNiS1FJ?=
 =?utf-8?B?cExBd1NoTXZ4T0QzOVNKY3JGY1ZmMGVYbFZsTmU1bkNPQkpWK0lrUk85TkhW?=
 =?utf-8?B?RVJGZ1BDZ1ZRcVlxRE0wcGpES08vLzc5cUY1N1NNZXBJdTdaMTN3MnhCRlZQ?=
 =?utf-8?B?RjRucGdpRkM0Q2JEM0VJUlFaL3JGeHpoQXRFQTFqa2R4UlNtUGhhUUg0aTMx?=
 =?utf-8?B?NTVmbWVwYW9uNmRmMmVWOUVGRWVuUnU4YnhTTWZMdlYvR2pUbTNKNUZMOGlE?=
 =?utf-8?B?cW1KVExXYU5JOUwybzRHYm0relZ3N29hdWJmd2JlYmZRSmwwWTgxZEpObEtq?=
 =?utf-8?B?S3VSUjNvSWFUZ0QvendPRFFZTTVwNW10ZWJVcVd3MnFJQVV0NHBJWjJpR044?=
 =?utf-8?B?cC9yZEtldmkzUFhvUVJmYjNIalBCVktqckY2SXY0YWVIWG95YXJTaW0yakt5?=
 =?utf-8?B?TmVORkhFekpkRlBFMElIZFAxY04rclJlaE04MVFNaG9QRmhGbkZSNW9SQ3hF?=
 =?utf-8?B?eHhFOWxiTC9GRktMZFJXL3VnZjhWVHdvWHl4Z0tGcWJuU1AwSlBmQUZNdm9Q?=
 =?utf-8?B?bTZ0aS9sbHRhTXVzTjlpUTdwM1doQ0Nzd1kzeTVmRFdQWVRQZXJlNUpDWWJN?=
 =?utf-8?B?MU1ROGZ5eENBNzlzRjBnMFBKTlQ4U0E4RnY1ZnhiNFIzYjlBRzhrcmxFM3kr?=
 =?utf-8?B?OGU5TjBIZnRPTlZxZmZmeXVSaWVRQ1lodytUWDlIL3VJc0E0MEpWbE9VdytZ?=
 =?utf-8?B?OHpMdklJZVQ4UHM0SjVDZHVLSlRUMG1NWkdFeVYrbmxDdU1zeGxKSDRtWGpa?=
 =?utf-8?B?S1I0VnI1N3NOVC9icVBPbWhKb1pNTWVmV3FOeXVZYXlxTjBUbmk5T0RPU3pr?=
 =?utf-8?B?S3NTUG1rdU1BU2lEODZoVTZOa1kvRUVzNlorSFZsQjQ2S1NTUk5IQ3kxeGRT?=
 =?utf-8?B?OUtZdXBBaW5TaHhrWTRmTS95S3hIcyszaW1md0tBelJ1a2FCeHdOUG50MUVG?=
 =?utf-8?B?QXdLb0k3cVNETUI3SHdhbWZEUlJOQmtyTzQzcURmWUw3WGZjazhHMGpRYU5x?=
 =?utf-8?B?dHBMVjRtdEVQZEZVNWxlM2YyRDc1N3BNNHhKeDB3V3RGcFFGeFdoSGE5Wnlh?=
 =?utf-8?B?WDZKTjBBWGZHdnhPQTdFZTNLOWltdHFBUGxaRUdPaDFLRWFpZVFsZVhESUlp?=
 =?utf-8?B?VEkxai9NQTJIMlMyaDJMb3dYQTltSFNoVTZwZGhjeDM3MUhhZWdvTzZuMS9p?=
 =?utf-8?B?U1FYVnRYMWp4RDkwODdBMDFFK3FWakk1aHEyOFRna0FVVUtIN3BtSUlqU0Rl?=
 =?utf-8?B?ZGp2U1Zod1dJM3N4MXl5NlZqRVNUSHVKNmhSalZSUWo2dEdIUkVqMmpOa3o2?=
 =?utf-8?B?b096M0ZVOXIvem5BdmYxRHhLV3ZOOHhtYlVRbmZRUC9RWU5yZTNBdXRpYyt2?=
 =?utf-8?B?TXllQ1FjQUhnMXhkWTB1MzRHZVBFSXhUOVlZNDV5OHFwc2ZRVlNpbDVzSk0r?=
 =?utf-8?B?MDlKL3hwelNSQkR3WERNOVcxQ0NNQ3hmZWpRaTNGUjZSMGR6RFY2cmR2MUlo?=
 =?utf-8?B?bWs3V0w2UGhXZWxCckxKalhoZ2tBNFRLN2hRVzJ4K2tuQTg0UzdKVi9hVU92?=
 =?utf-8?B?eG9WQTd1Z0szak9hNTRaN040clNCWk1OMis0L2lFZ0h0eUc4L2o4N2ZydkR1?=
 =?utf-8?Q?IFVea4nufeAaymKOEuhzNC4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0JjM3FDRjVOVmVIL2w4VDFFQ3c2ZDJMeHFXQm5yeE9VWENQby9VWUROb0FY?=
 =?utf-8?B?Q1loSlVWM0RkUUJ2Mys5L0J4cXVRY240K285WnIwTG9CVVR1TDFFbERQRkEx?=
 =?utf-8?B?Nmp0cGxKdW8rUEplUFJXYnM5cVVKM2w4M05jSmdiVHhtTlJZdnJWNzdOM3lz?=
 =?utf-8?B?TjlEaldlczRsdTY2RCtYWml3VTNCT2pRWkJ5bnlTN2gvRFNQMkR3b1pWTkRo?=
 =?utf-8?B?QjhpaHg4azE5QzhFNWpvUUxBM3dXNXRKSzczQURLUGtOYU0vOGRsWXlFR1Qx?=
 =?utf-8?B?SDRlOHBKSjJpb29INW4vUm9hYjJaVDBLRStoKysvK1dFcHY4S0ZyS0haT09s?=
 =?utf-8?B?b3lzc2Exc1d2U0U3ZVRMeHdkZFhDOXd6NnlFTFJ4R3dCYXl4ei8zOFo1Qkw1?=
 =?utf-8?B?ZjFQUEZhVmhhbFRhL2FGZWFldjNUMjZiRk8xc3BWRnNTZU5rblFpSWJnU2pC?=
 =?utf-8?B?WVhubnNQMTZpQ2xNbDZ0ZjFnZVFaZXcxY2kwRDI1dGRHUEVZVmxyaTFENnNQ?=
 =?utf-8?B?eDRrTDFvV0JnSmRBMnNWS2xEU1BGaTlqODZQaCtmUG01dFdqWnVhakRLRTZI?=
 =?utf-8?B?UEZydnh4V3g5dkVUVi9pMTgyZGxjaDFMRkdyTGJWZzI5bkZKM0lPMzBxVEpC?=
 =?utf-8?B?QThhSXR6WHVEL2V4Y3lwb0F1dkdLWFFEeHdDSTdsN1E5d3dwbnhCbGJ3ejQ5?=
 =?utf-8?B?WlFZc09ybXJJVGhseDhqRjJTb000eDZRekdLTHVQUXR1V0RyeFFCaTRodENZ?=
 =?utf-8?B?dU9pSkV4UmR6TUNFWmJBNW4wRExsZWJ6ZGNlbXQ5dFFlN2M5bGVGVE5EQ0Mv?=
 =?utf-8?B?RVVtU09VaUZpUnJWWWJjVU1uUWR2Yk9sWXBiVnBhSitHeEFwQ3dlY1YxK2RV?=
 =?utf-8?B?cVIvTDNxY3VtaGo2NFJiYlBvK2ZycHNpKzlHSXc0SUg2dW9aR0p6TWlMTHkv?=
 =?utf-8?B?NWxmbEhiRHpsbjJ6Q01ESkZpRDBzaktkV1drOU53c0VJN3VmRjBZWjBKclRx?=
 =?utf-8?B?eUx6QTF1UW1DMDVURGVpVW5jQW9BL3dRL1FNOU5LV3BYalJveFB3elYycHFI?=
 =?utf-8?B?MWQ5dTI0MVNZQzFMOURCbjlzYW1rYmk2a09nblpVM2dEbk5jR0RwSnhXREh6?=
 =?utf-8?B?UXlOMEJxQU9ZN0dQY2hSSlhidXFkSTNQR1gzdFR6ajhvYkJDTTNEVEZ0QTY5?=
 =?utf-8?B?R1lCd3ZlRklXNVI5MUMra0tCZk5sVmREY1U1UDIvMDRya3lacjlrZU5oYUo2?=
 =?utf-8?B?ZkJNejlOS2JITlo2MEVWb1ZRYjgyT1VaRDVlWmZyaEx6WG9HTnV2MVJFSEo3?=
 =?utf-8?B?TS81VWh2cktVS0x4K295WUhzQ0dvYnVoUmRBdnNVKzU2QUEyY3R3dkV1VmlQ?=
 =?utf-8?B?eWE3bVNQVDVoQXdnUTREcDVUb3dHcVJDSWsvSUxiSHM5K290NUtkNWhXbmM4?=
 =?utf-8?B?clpjS04xcm1nV2gxM1lGcHFwTlB0UHBjejh3Nm9ZS1MybEtXOHM1dEVGWlRr?=
 =?utf-8?B?cDNVbnV2Nk5GdVZ2Q0gxcERmU29mRUJKQ2pLZEI4NzRGVkdpaUhSL0lQanpO?=
 =?utf-8?B?eEdTRmhKTnVRQ2hHYnZ4TFc4Q2tRbjNia2crQU5uKzlzMG94cTNBNXRCclV3?=
 =?utf-8?B?dDhYUml1ZXFOZkZwQ0FmalIyT1ZrMkNVUmR3SG9aV3o4RDBNVEg1OUNxVDk4?=
 =?utf-8?B?SWxXV0k5a1V5RFlBV1JaNlBtSnptbG1jcFU2K21CTlI4N2xzWi9KTVZ0Mk95?=
 =?utf-8?B?TE1MK2haZ2o5WldQR09mLzJwd2tQN1hzUjBPMWNTNWNmVldTM3RTaUVaakNm?=
 =?utf-8?B?TXhuT09JL3U2dm9vSGh4ajBaSGg2MHp3OXpXTkxUcE5weWd2NFBxSnVTUGNN?=
 =?utf-8?B?SFpZa2ZwK0tTU0UzdlU0RzZyRG5UM0Y1dC9LKzRLRkw0YUNMeEgydklzVE43?=
 =?utf-8?B?aDF6WCtTV1hsa0Z1cUdnekphVytmNGw0V2F5anN2YVpQNjBRRHhFL3NXRHFD?=
 =?utf-8?B?cTRDWms2M2VNd212ZFFEN000UWxhcEYyMUMwUlpSS1MwSkR4TVdid1Radnlq?=
 =?utf-8?B?L1RBTXI4cWsvTHh6UjBQWlNUN1Nuei8vYS9oY2lLcDVjNGc1WjBPRHJqQkRk?=
 =?utf-8?B?OEc5THJCSzV6U2FYQWg5YkErSmJ2d2gyV2Rlc1lkOHc0ampudis5VUR6VXEx?=
 =?utf-8?B?WElpUzFZN1pTcU1xNE5hVklkZmFBbC9EVWp4NkZMcm5qdGRnYWJLUGJuSFNE?=
 =?utf-8?B?V2ZTdEUzenM5ckFielZxS2I1SlB1THVodVhPM3ZOUXFoU0VrNDBnM3JRQXVL?=
 =?utf-8?B?bXRwSGhXRE1RR1ZSTWFrZmRnaVVZR2p0dUdYUXdoVllSTU4vRGpqZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B53711D634C7443AFCA2AE7730B2887@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fdrsHpJ7EWpTg34WGTFPNcXzEql2+R2yKGMJ2j0qGyjSbhToDXcd5sjji+rRp+7kChIPrTzWqYdRDQDtS7yBcalLeewlT1VROqamYIiobTxU0sYW8W/oNntZEiQ6TUPY+BuMtKI+kr9dA0hUmJ6jO7JzDU3PCxMaQSpq1EHLoLG4O6+f4lV4N/2zMNRB+tgZsMHFJOkvnYjG9zFd+FRRxM+7wHAGZDc+QgN0ZmTlloFGl4gx4EN2EQprkQsp0S+AvId6qEhVVdTFJ98F0sWaHI0ZCACj8Ib12ioSgE+Gg/1p6DJ0FGgeb49WrZr5yIWYowRCOy++fuh/14/zuVUIQg+51vOLLJi4TEp+q69Fi76+69ZRt1GA9HDpmo9kqVKqPSgMQkxdMGei3HPI7I17SX8CUcgqjlGglCQzbWHov7plKZCMQdM7T/uArLrPyusm2GF8EUyC2Txvoi4yT6mxVN7qpGpvHaPf77VJbuK1H+gJ2OIuBfhV0kGOxyGLOGwWUbBCYSxre/vcJQ5oCtHPZLlRTMQdwWKEX+xSflzuXCfy5KVbaCExx14iQGqBykLp0Rv2nuhYNfiCN51VKLX8QZxlKI5cOgn0vLsSFGQ2G4M88yBv6dcAILdPrbSUFNnhh7iJ1nwEYZxjjKmFMS5QXA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74105d78-0ff1-41ba-8543-08de62ba8c0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 00:24:08.5876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uU4jJxz12YGe6WhoYRP7iDVZjYw/CXCNmkWURSbWY3HCMKiCF38Devl8Kf5enyAW5SNtvOl5JQmTXIcY2evMuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFEE0F400A9
X-Authority-Analysis: v=2.4 cv=CNInnBrD c=1 sm=1 tr=0 ts=69814034 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=1l_MfTk1mS4DZgI9Y3wA:9
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: rWWGxBDZ-JkCS5rsPFSn6G65jhmMVB0w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAwMSBTYWx0ZWRfX/spJaULeKifz
 F3IumLqCj+NieFVHRI8GROQ2/ULeOMqjjW6U4imh2BYKX9iqzJjWE9m+qna5B8CCINHfAU4nK7B
 Tr2VZx/KHnzjyH+v9cdmH8t8YTx7cd2NyChbY8/6T0WKklm6vPbfVsFsOr+2p9cHdy/c+0i7enG
 Djxt+G11LyturYojK0/mY7icv6KIZv9yEIO/0NuzEmPKp4m+ennsjTRr9ll2BhRqq54yGSzc++i
 sdGXk6Zw+HhCbPsxBno0DF2eQIOGguBSwWs9AT41LH7ZxnA1uqiuYIPNWmeQ7T0a2VXH5Ow7YgL
 Z5QBIr+GONTkBuQfl0efCc5dT7LT/ng2TME+Mm8/CajbT+CywK7JRvj7w5R0zqWgxCMK1h0hjSe
 TuRiP2G+nqqsBzoFuYbMg56AHOh2/3NUWEHCtbSA/Ef19ZpcAfO2MSezeAzY20nnWprt4WmWkBf
 xJ8wd4qLjKiIlr8jmfA==
X-Proofpoint-ORIG-GUID: rWWGxBDZ-JkCS5rsPFSn6G65jhmMVB0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602030001
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33017-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,synopsys.com:mid,synopsys.com:dkim];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 221F6D2F18
X-Rspamd-Action: no action

T24gTW9uLCBGZWIgMDIsIDIwMjYsIFh1IFlhbmcgd3JvdGU6DQo+IFRoZSBjdXJyZW50IGRlc2ln
biBhc3N1bWVzIHRoYXQgdGhlIGNvbnRyb2xsZXIgcmVtYWlucyBwb3dlcmVkDQo+IHdoZW4gd2Fr
ZXVwIGlzIGVuYWJsZWQuIEhvd2V2ZXIsIHNvbWUgU29DcyBwcm92aWRlIHdha2V1cA0KPiBjYXBh
YmlsaXR5IGV2ZW4gd2hlbiB0aGUgY29udHJvbGxlciBpdHNlbGYgaXMgcG93ZXJlZCBkb3duLCB1
c2luZw0KPiBzZXBhcmF0ZSBkZWRpY2F0ZWQgd2FrZXVwIGxvZ2ljLiBUaGlzIGFsbG93cyBhZGRp
dGlvbmFsIHBvd2VyDQo+IHNhdmluZ3MsIGJ1dCByZXF1aXJlcyB0aGUgY29udHJvbGxlciB0byBi
ZSBmdWxseSByZeKAkWluaXRpYWxpemVkDQo+IGFmdGVyIHN5c3RlbSByZXN1bWUuDQo+IA0KPiBU
byBzdXBwb3J0IHRoZXNlIFNvQ3MsIGludHJvZHVjZSBhIGZsYWcgdG8gdHJhY2sgdGhlIGNvbnRy
b2xsZXLigJlzDQo+IHBvd2VyIHN0YXRlIGFuZCB1c2UgaXQgdGhyb3VnaG91dCB0aGUgc3VzcGVu
ZC9yZXN1bWUgZmxvdy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBu
eHAuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgOSArKysrKysrLS0N
Cj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oIHwgMiArKw0KPiAgZHJpdmVycy91c2IvZHdjMy9n
bHVlLmggfCAzICsrKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggYzA3ZmZlODJjODUwNDkzNjRjMzhjN2Jh
MTUyYWFiMGZmNzY0ZDk1ZS4uOWQ0MzI2ZGE1ZWM3NjY5ZmE3MTQ3MDdmYjI0NTU2NzIzY2FiNTFi
OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTIzMTQsNiArMjMxNCw5IEBAIGludCBkd2MzX2NvcmVf
cHJvYmUoY29uc3Qgc3RydWN0IGR3YzNfcHJvYmVfZGF0YSAqZGF0YSkNCj4gIAkJCWdvdG8gZXJy
X2V4aXRfZGVidWdmczsNCj4gIAl9DQo+ICANCj4gKwlpZiAoZGF0YS0+Y29yZV9tYXlfbG9zZV9w
b3dlcikNCg0KQ2FuIHRoaXMgYmUgcGFzc2VkIGRvd24gYXMgcGFydCBvZiB0aGUgZHdjM19wcm9w
ZXJ0aWVzIHdpdGhpbiB0aGUNCnByb2JlX2RhdGE/IEknbSB0cnlpbmcgdG8gY29uc29saWRhdGUg
YWxsIHRoZSBkd2MzIHByb3BlcnRpZXMgdG8gb25lDQpwbGFjZS4NCg0KPiArCQlkd2MtPm1heV9s
b3NlX3Bvd2VyID0gdHJ1ZTsNCj4gKw0KPiAgCXBtX3J1bnRpbWVfcHV0KGRldik7DQo+ICANCj4g
IAlkbWFfc2V0X21heF9zZWdfc2l6ZShkZXYsIFVJTlRfTUFYKTsNCj4gQEAgLTI0NjIsNyArMjQ2
NSw4IEBAIHN0YXRpYyBpbnQgZHdjM19zdXNwZW5kX2NvbW1vbihzdHJ1Y3QgZHdjMyAqZHdjLCBw
bV9tZXNzYWdlX3QgbXNnKQ0KPiAgCQlkd2MzX2NvcmVfZXhpdChkd2MpOw0KPiAgCQlicmVhazsN
Cj4gIAljYXNlIERXQzNfR0NUTF9QUlRDQVBfSE9TVDoNCj4gLQkJaWYgKCFQTVNHX0lTX0FVVE8o
bXNnKSAmJiAhZGV2aWNlX21heV93YWtldXAoZHdjLT5kZXYpKSB7DQo+ICsJCWlmICghUE1TR19J
U19BVVRPKG1zZykgJiYNCj4gKwkJICAgICghZGV2aWNlX21heV93YWtldXAoZHdjLT5kZXYpIHx8
IGR3Yy0+bWF5X2xvc2VfcG93ZXIpKSB7DQo+ICAJCQlkd2MzX2NvcmVfZXhpdChkd2MpOw0KPiAg
CQkJYnJlYWs7DQo+ICAJCX0NCj4gQEAgLTI1MjUsNyArMjUyOSw4IEBAIHN0YXRpYyBpbnQgZHdj
M19yZXN1bWVfY29tbW9uKHN0cnVjdCBkd2MzICpkd2MsIHBtX21lc3NhZ2VfdCBtc2cpDQo+ICAJ
CWR3YzNfZ2FkZ2V0X3Jlc3VtZShkd2MpOw0KPiAgCQlicmVhazsNCj4gIAljYXNlIERXQzNfR0NU
TF9QUlRDQVBfSE9TVDoNCj4gLQkJaWYgKCFQTVNHX0lTX0FVVE8obXNnKSAmJiAhZGV2aWNlX21h
eV93YWtldXAoZHdjLT5kZXYpKSB7DQo+ICsJCWlmICghUE1TR19JU19BVVRPKG1zZykgJiYNCj4g
KwkJICAgICghZGV2aWNlX21heV93YWtldXAoZHdjLT5kZXYpIHx8IGR3Yy0+bWF5X2xvc2VfcG93
ZXIpKSB7DQo+ICAJCQlyZXQgPSBkd2MzX2NvcmVfaW5pdF9mb3JfcmVzdW1lKGR3Yyk7DQo+ICAJ
CQlpZiAocmV0KQ0KPiAgCQkJCXJldHVybiByZXQ7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IGluZGV4IDA4Y2M2ZjJi
NWMyMzYzMWE3NTJjNzdmZDczOTRlNTg3NmM5MjlmMGEuLjViMTM1OGYzNjQ5MGEwMDFiYzllNjgx
MzkyMjRmN2JlNzBhNTc5OTUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5o
DQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IEBAIC0xMTE3LDYgKzExMTcsNyBA
QCBzdHJ1Y3QgZHdjM19nbHVlX29wcyB7DQo+ICAgKiBAdXNiM19scG1fY2FwYWJsZTogc2V0IGlm
IGhhZHJ3YXJlIHN1cHBvcnRzIExpbmsgUG93ZXIgTWFuYWdlbWVudA0KPiAgICogQHVzYjJfbHBt
X2Rpc2FibGU6IHNldCB0byBkaXNhYmxlIHVzYjIgbHBtIGZvciBob3N0DQo+ICAgKiBAdXNiMl9n
YWRnZXRfbHBtX2Rpc2FibGU6IHNldCB0byBkaXNhYmxlIHVzYjIgbHBtIGZvciBnYWRnZXQNCj4g
KyAqIEBtYXlfbG9zZV9wb3dlcjogc2V0IHRvIGluZGljYXRlIHRoZSBjb3JlIG1heSBsb3NlIHBv
d2VyIGR1cmluZyBwbSBzdXNwZW5kDQo+ICAgKiBAZGlzYWJsZV9zY3JhbWJsZV9xdWlyazogc2V0
IGlmIHdlIGVuYWJsZSB0aGUgZGlzYWJsZSBzY3JhbWJsZSBxdWlyaw0KPiAgICogQHUyZXhpdF9s
ZnBzX3F1aXJrOiBzZXQgaWYgd2UgZW5hYmxlIHUyZXhpdCBsZnBzIHF1aXJrDQo+ICAgKiBAdTJz
c19pbnAzX3F1aXJrOiBzZXQgaWYgd2UgZW5hYmxlIFAzIE9LIGZvciBVMi9TUyBJbmFjdGl2ZSBx
dWlyaw0KPiBAQCAtMTM2OSw2ICsxMzcwLDcgQEAgc3RydWN0IGR3YzMgew0KPiAgCXVuc2lnbmVk
CQl1c2IzX2xwbV9jYXBhYmxlOjE7DQo+ICAJdW5zaWduZWQJCXVzYjJfbHBtX2Rpc2FibGU6MTsN
Cj4gIAl1bnNpZ25lZAkJdXNiMl9nYWRnZXRfbHBtX2Rpc2FibGU6MTsNCj4gKwl1bnNpZ25lZAkJ
bWF5X2xvc2VfcG93ZXI6MTsNCg0KVGhpcyBuYW1lIHNvdW5kcyBsaWtlIGEgcXVpcmsgb2YgYSBi
cm9rZW4gU29DLg0KDQpQZXJoYXBzIHJlbmFtZSB0aGlzIHRvIHNvbWV0aGluZyBzdWNoIGFzIHBv
d2VyX2xvc3Rfb25fc3VzcGVuZCBvcg0KbmVlZHNfZnVsbF9yZWluaXQ/DQoNCkJSLA0KVGhpbmgN
Cg0KPiAgDQo+ICAJdW5zaWduZWQJCWRpc2FibGVfc2NyYW1ibGVfcXVpcms6MTsNCj4gIAl1bnNp
Z25lZAkJdTJleGl0X2xmcHNfcXVpcms6MTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvZ2x1ZS5oIGIvZHJpdmVycy91c2IvZHdjMy9nbHVlLmgNCj4gaW5kZXggZGY4NmUxNGNiNzA2
Y2E1MDkyMDY2NzdmNjQ0ZGEyYTcyMjViMWIyNi4uYjQyOGE5ZjRhMzI2MjVlNzMzMWY4NDkyYTQw
OGY3YzIwYzkxNTgyNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nbHVlLmgNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9nbHVlLmgNCj4gQEAgLTI5LDYgKzI5LDggQEAgc3RydWN0
IGR3YzNfcHJvcGVydGllcyB7DQo+ICAgKgkJYmUgaWdub3JlZCBieSB0aGUgRFdDMyBjb3JlLCBh
cyB0aGV5IGFyZSBtYW5hZ2VkIGJ5IHRoZSBnbHVlDQo+ICAgKiBAc2tpcF9jb3JlX2luaXRfbW9k
ZTogU2tpcCB0aGUgZmluaWFsIGluaXRpYWxpemF0aW9uIG9mIHRoZSB0YXJnZXQgbW9kZSwgYXMN
Cj4gICAqCQlpdCBtdXN0IGJlIG1hbmFnZWQgYnkgdGhlIGdsdWUNCj4gKyAqIEBjb3JlX21heV9s
b3NlX3Bvd2VyOiBpbmRpY2F0ZSB0aGUgY29udHJvbGxlciBtYXkgbm90IHJlbWFpbiBwb3dlciBk
dXJpbmcNCj4gKyAqCQlzeXN0ZW0gc3VzcGVuZC9yZXN1bWUNCj4gICAqIEBwcm9wZXJ0aWVzOiBk
d2MzIHNvZnR3YXJlIG1hbmFnZSBwcm9wZXJ0aWVzDQo+ICAgKi8NCj4gIHN0cnVjdCBkd2MzX3By
b2JlX2RhdGEgew0KPiBAQCAtMzYsNiArMzgsNyBAQCBzdHJ1Y3QgZHdjM19wcm9iZV9kYXRhIHsN
Cj4gIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gIAlib29sIGlnbm9yZV9jbG9ja3NfYW5kX3Jl
c2V0czsNCj4gIAlib29sIHNraXBfY29yZV9pbml0X21vZGU7DQo+ICsJYm9vbCBjb3JlX21heV9s
b3NlX3Bvd2VyOw0KPiAgCXN0cnVjdCBkd2MzX3Byb3BlcnRpZXMgcHJvcGVydGllczsNCj4gIH07
DQo+ICANCj4gDQo+IC0tIA0KPiAyLjM0LjENCj4g

