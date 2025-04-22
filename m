Return-Path: <linux-usb+bounces-23284-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A89EAA95EC7
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 09:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F7DD3A4C7B
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 06:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962A1235BFB;
	Tue, 22 Apr 2025 07:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="g4MXN/Sd";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="M+b5mx5w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SWJUDBca"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70896230273
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 07:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305211; cv=fail; b=uz78xCIpJwJZsXc7MOGsE/ieJ2ZmviEQap12cPnsNYqeptZM1RZ89eGD8YxFBEzTAqK8HExlnz6aqw5/S9mlsLMgaa3erZpsOXn5/RugDSuGSwt4OqRXeT2/PdO4HI5asH7HJqgDE4JeXir4YTDoylYFo1H0XJmdHfRA9eWYZtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305211; c=relaxed/simple;
	bh=qBYrCu73JHMfEpsCgIhgqC4p4dgc9Mr04wFqZhIC6yg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ONzPfCqJjSV0eMhu2lwXRdNV+jMkPa8v0O44nWrSXwNB5SJoJGntjHEDK7XV/rsmi5tKD+TMN1WVvxLFkxL4WdIBzwUq3WWWt6uc9gasogjSqjUng3VAMjOXwVCwjvX5RVvUI4ly9EcJy7hLaMFnFY1AwY4+ASbRCA0bOMMcnvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=g4MXN/Sd; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=M+b5mx5w; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SWJUDBca reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M0m3Vh017695;
	Tue, 22 Apr 2025 00:00:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfptdkimsnps; bh=AlhfnUQMkEpRKcSbOC4
	jdc6FU0CpYFFEmN7EtwoZyB4=; b=g4MXN/SdHDTyhdpUzHe5XNV6aRU99uWYo7V
	Ld6JdCgYY6fc9UciD+gjoh6IZqkMRZJuxsvEeKDS685QJ92gOa/9erX5i4Bkd+PU
	vkO9n4NsB+reD/hHZ2/telsUbP31y555xsKpJ3fQkFl6ajQQw48IodiY/ySfMmM2
	nlrgYh1Y4cxbxEqYen3nGSl2nRkS/37pVAyO2Q8UxrzuiAdPBX5I0uNKR5bAuLuf
	oVEy1xQGbnFx+kMm35qNfSu+kL+Tkv3tRfpfkWxYebIIHZhs6WqX05mbP72IIQww
	sp5MA60NZrvN1LyqZaSx0jLbf2AowFh6Uy3DWmXXTxlWoLiuH+Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 464arvhr8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 00:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1745305199; bh=qBYrCu73JHMfEpsCgIhgqC4p4dgc9Mr04wFqZhIC6yg=;
	h=From:To:CC:Subject:Date:From;
	b=M+b5mx5w0ybl+Zs95k5d9b7QRy/nuuujfYZ6ggW5p35H4ayJMNd7+UIP7Z2mqx/NK
	 /qnEiqQekSulXr9I6UzCbz/hUNPmM29WPlzDL/L+UNIi3W+9MP3InmqfBkMLE08kHT
	 CsqPv1vTfD2bwXNCY4jIwN2Iv9U38ZQDQ3swmE2RpnaXuIK2EFeemdsQFHvQshJAuq
	 rxCE0CqluVPeua3W4A2kHruTv4dE8HPVuQ8+yO/G+trYNquDAewfND9moHwrW+yJuw
	 rMwOQDBeQxQkmIDvIh6shso8/UrUGClHhBFm86Rc5Ukn77SC7nbHF2SxDmTjB6nGBX
	 76/4zdb4vvhGw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E1A7740131;
	Tue, 22 Apr 2025 06:59:58 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6C3EFA0076;
	Tue, 22 Apr 2025 06:59:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=SWJUDBca;
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2048.outbound.protection.outlook.com [104.47.57.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A5B1540218;
	Tue, 22 Apr 2025 06:59:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yat3CpYn0cbz+3xY6X4C57kTXyImUjQx/K89pAdtJDM3YRoY2XMVgV2/v4aSaM9GYbml/NKaDKd9YFimNWYazywuOZpEzvlZRKDcXBJYS4YTBI16gJ/zFmf5ziQgy/XyCjl0jAb2hjQVi5BqKXohM/HLbsPZltJYyOAbASiP+EM3RkrCCmnjueQHBKrvUbHY7D8Fips15QBtdiZXprCjXldEnU97Q9DPOxl2kQSVt/GWWsh21VRQNx7ALydzJdJ+Zz6y7WLb2OdvX2J/UBQxZeG42BUCAWE9LpDt1FUjalM3zAtn/T19z5qkW0D1EkF1/hGLm2VRkjaVQspEFRrpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlhfnUQMkEpRKcSbOC4jdc6FU0CpYFFEmN7EtwoZyB4=;
 b=h3cMrS/C/3pEfmrY+6FNxJs93Ei5SpriA6Usuqiz47eyPviUPU9G+eAxYmdLr0Ub97salNg44Fuq7Mpkkx7SzgOEY/NQltVm9CaKBr9qhCelOrugl0ZnCK66Hp93FXepUnOCl/57xToWsq3c2Vrn4kYgcbTZ9oqEdA74JCWLaSky07ksxBeXf2qiG/Lf9h54F/gUGe3EIZOXcB6A1AfcbtWBAuracMO0io/jWlK657rOmr/z4n5rmhPKe7MHmU7QKPsLhkKFZw5ztmhXxPQ7fg24AYQuLMk3UwcGzNwtggAkO8fNxRrYx62gRbb6VM9LzLcH0dPZITJ/+CReokE3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlhfnUQMkEpRKcSbOC4jdc6FU0CpYFFEmN7EtwoZyB4=;
 b=SWJUDBcaLn1hz2ZrfQs2n053fvgY13sb3ktcufV+QkIzuVl5bU8bt0JRKt6Dt2BNUdq7Ib0u/Gwr82Bgdmil4Rp4wSS8EzVV8vzKdSG4tO/jioEep8vEtP4eYysJJ4rXA+XPoO0JbLqUGTI7hXiwDfkMv7ZhYqu6xANAEQ8QeE8=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SJ2PR12MB9115.namprd12.prod.outlook.com (2603:10b6:a03:55c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 06:59:55 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd%6]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 06:59:54 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>
Subject: [PATCH] usb: dwc2: gadget: Fix enter to hibernation for UTMI+ PHY
Thread-Topic: [PATCH] usb: dwc2: gadget: Fix enter to hibernation for UTMI+
 PHY
Thread-Index: AQHbs1Qm81R2YPJ0REmViHn5QofO9Q==
Date: Tue, 22 Apr 2025 06:59:54 +0000
Message-ID:
 <ebb0ddd4b18be292e98a25ccbdf74802ba8d77c5.1744021784.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SJ2PR12MB9115:EE_
x-ms-office365-filtering-correlation-id: e055205f-e158-4c2e-56b3-08dd816b4945
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kQSH2yEp2qfEAz9pCBlW8zNh2nwVPjkHGXpiL+/L+7Bu4mSB8ic2If43uF?=
 =?iso-8859-1?Q?DCyS9iE8ZeaHQkwZv93J6J0g64ZTX/M4YDzBIyt5yyoctNcvh5spvgokJ5?=
 =?iso-8859-1?Q?LPxipD5sZyGlyHwBu1apMQ7EN/zoXXno9QOZHvcAPqKNNRE53SYyrpoc70?=
 =?iso-8859-1?Q?YtFg3T7lOWCDFkhl41oaQNJbjHhimuBKTnIdL0HHdBMeElPz0TSV5ITvLH?=
 =?iso-8859-1?Q?sg504Pf7Vuqs75mLuSt45JdNsQZwmzFRuhUVxzBG4xVVvzBjdqBN2b5TIn?=
 =?iso-8859-1?Q?8f1JfqpkRgh45lh4D+CBnFkpdgX4uYZ6W65rsMo8ehSqGnbr6KESuGCYF8?=
 =?iso-8859-1?Q?jYppuMSTfdSuE1MP7EanydmWI+fpQDnMBsmG0f4NFTIhWxOEahgDt1jxMv?=
 =?iso-8859-1?Q?9bZBOyDFt0BbEHUzqhiFICtSgQ/+ct/TNDj/YK1jWGfKWJ8OwNojpgZLbx?=
 =?iso-8859-1?Q?s0+b8PFX0ZamnHK8tQhTP60TDnX/3Y+fbIUBns+f1Xh9Hxpe7CWLa3HAdK?=
 =?iso-8859-1?Q?umn8yqVZTcv5VUlZWLda0IzT351BLZYwWEPCmWpE3HRxjgZJi4kHnO/+yz?=
 =?iso-8859-1?Q?6bNWohjGP+ZhqlLq51s6YeW2e6UNgchpDdZ1lp0Uh+Hb6T0TF5rGSE6tZ7?=
 =?iso-8859-1?Q?F3IGAiK3SSpPW8m8Fq4VOEt3GxCs0PIuxES5TBL6pY4YQ0AkmcazG5SuMF?=
 =?iso-8859-1?Q?EDJPzU+uSWlSiJ+dabpFMfPqmEzkkdu96eXBJV/0tGuYor9CITdX6y86A8?=
 =?iso-8859-1?Q?VpUj6ZQzeiS1jSBeczQBH6Wc6VTpXy99hyL8tVrDzQzx3hor+qBSLCJEJd?=
 =?iso-8859-1?Q?Fz8sULUiyY4cMbL9x7FTcDGDFR3Qunx5U8sbnReuuIR/BnG1qxKGHILfZ9?=
 =?iso-8859-1?Q?IgYk5pdgdrsUWjrD2vnkjOq7b4INDxAOlJiYRNy/3XDZHcvbsbUZCL7/jZ?=
 =?iso-8859-1?Q?Q+pqQ1uhyymAbePpp76T6TD3TNx/7yuzL2/nOR2gNF43M0yEk9OhknpYT6?=
 =?iso-8859-1?Q?7eVBG7bTFTODKVrT68o6Q0mhXGy/S/aif5vI3N6jaIKfFcKrxCiHGQ62R4?=
 =?iso-8859-1?Q?gU/PetvZvSISxMYsux+tq6FLX28mB/umqFwZAmLznX7qxNEDSUCUIiqwcj?=
 =?iso-8859-1?Q?sVgauBp5NgpbWaxd45O9uvqWUFDm6/SW+xpnXXtOS4a5/zA6euWpp8z/xJ?=
 =?iso-8859-1?Q?TvfkohkxJitc8x0Ff8/uS7AmedwBNCJkkhaKg8JKze+ZVcCWgMU17OxoEz?=
 =?iso-8859-1?Q?V4V78Dmg0Bz7Xgxw3lhFRBdKFSry9VSG0ew7cXY71Yte6o0+AlpYtN7j4l?=
 =?iso-8859-1?Q?JdCcH7buuBpewsq0rYxl9Jh6AYrGNU0DveYeL7vLGKwJ+yFSDULFkesCLW?=
 =?iso-8859-1?Q?UTSf0FA+G/uRDMtCfKxyiXMh3IVUueQDPmkdXSChUa0PnloU3wXubfrY/V?=
 =?iso-8859-1?Q?Gy3Y22xreT32or3173OQwslbvC8UB8Buw43pXagUITiQ9649UODnRzajSU?=
 =?iso-8859-1?Q?fVBb9DqvDKcexuLwV9Rm8splwFbI0aop/g+IF/iqz5duYS5s4AvUkRDVOY?=
 =?iso-8859-1?Q?5oIrR8I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?56yKW31VFpFbgkvfLm9KRTXFGz2H/RrqYht8edxBSteRofBhdxCDyLVNjx?=
 =?iso-8859-1?Q?H0k2Td/ad5C1reMM0OV6CDEtruo/vkQTocH7AiVO1FsuTdmKdSbuVWaGlQ?=
 =?iso-8859-1?Q?T+B4rcf7lgOwRYLFVOf6BL/VLeMdke8wWB3OficasBb/UeesMdQkbPhSeD?=
 =?iso-8859-1?Q?+QXd+XzzLPa24nXQVC0JIOnjLhzCkI4LTygVh+wnJiX0N/Yp21JemviQ7c?=
 =?iso-8859-1?Q?xQfgnte4IcSGR1GzeBX9/8U5OzQCfb81ZSt+s90mZP5J/kjGceKjecFmES?=
 =?iso-8859-1?Q?G19h9fbUQPbW2LdR8omwiTSv1Rp8scMtxtTM+nKc2c6qMUonAgTLgXkcXZ?=
 =?iso-8859-1?Q?bC7OF4Nz9CSh6YozmVcMkZ/VzzYo2qynjuWFXYhiF4XxysKWUlnOhqPdxr?=
 =?iso-8859-1?Q?dWbEIu9hK3bPy0qIdBDa5L+yrIYcq2rrxwfoO5te4QonCp3E3zOMkxgR7F?=
 =?iso-8859-1?Q?UruaJE1Q/c/zJ+6PIy6hPCfUxk8uMIYiptL91/zgmpVJ9dFzdm9UL3oIMO?=
 =?iso-8859-1?Q?NXwX/ZSG87WuIqmkyCG1ZsQyeaGDfCoubVTmX0O6NhEiX8PQHgSQflgr7B?=
 =?iso-8859-1?Q?jNuxQjTStq4QHgFX5rKt6yuUN+Z3fQ0/I6x/qzgajMzmQK3e6Fd6ia398A?=
 =?iso-8859-1?Q?toRr6RFgJ0yu0tASVSCwGYCmqAUlHXzvYBYgtgiVQiR/eq6tx8iv2lNhO5?=
 =?iso-8859-1?Q?muHxrWzCxTa9mIoi1uuB+j+hvx0R8i/ZwDG5jrc6BlXd3UIqrBcg6hJo/8?=
 =?iso-8859-1?Q?lhf414YvSdKZ/b+x/DBh/dSwArvsgPfA4pGct1x7xs5GSkTYQIttXuX/AQ?=
 =?iso-8859-1?Q?KpcNPYN7CeeojRDE0o3FeVcsldD42XwwaAnVa087SMqtoqL0uAhBPHbS2p?=
 =?iso-8859-1?Q?yxUpcn7/um4wUvMijveMv6dFJrpdvuCHkJdTqwJa4jq2Lpa5Zu7lasFlUV?=
 =?iso-8859-1?Q?ny4XrbPDYF9yoZuif+VDl+gzze6TOmxl7/fg6n7X+rnuiJNVOlcdm3eBKO?=
 =?iso-8859-1?Q?7eprUT3ELFAgCUNRsHHWPET2eVx8vQGFgM7yTJAjKe/Yzql2OuG+lGXHWm?=
 =?iso-8859-1?Q?HBJw9UvgLxyc0dTpvtEFQ2XnMgCCd75tM6GofKCFB/S/FH3uS/UY+Mb857?=
 =?iso-8859-1?Q?mG03vHHUCSfGp/BacBHTCkSAEmUWbrIjdbNWsDvjaSsMuW9zo/qmerqINZ?=
 =?iso-8859-1?Q?8PfDJN0LCEjkJuqTaFO6CcSmcSZRhk27xA0zl0F82WESblVi7xzwZJJ3Il?=
 =?iso-8859-1?Q?+NReywJuTbtNSXa2d21vZBQ0MHAA+w9Cgroap7x4Dut2aIytXDCHBruoor?=
 =?iso-8859-1?Q?xYus3HXZSi6HZBUytwe7/d9871MF1eQQYpdQ1XZIRSG9P1xCrMFliM8tbX?=
 =?iso-8859-1?Q?FBWr8gNnWdcdKi7/96+DXNi52fLfPsyOdLgroX+vI9sEbexZhOr6izeKLj?=
 =?iso-8859-1?Q?6fXvTaoT8JcfQeuAVM0kjT3lsCjvvaD+m+NrwFArw5xVsZhYbddUbUWJ75?=
 =?iso-8859-1?Q?Yk3SnoIm256FZmgQ4bwssj+YWwWhN4lROJPhpKrtoQ+A66P1Y1qqPkZh9h?=
 =?iso-8859-1?Q?3VhkzrRHYfcqtfO71kAapFc9XaiZvxjgz1c946wN/UJ+9jpavP2JSE45tM?=
 =?iso-8859-1?Q?xb0vnSAEzRLbZOUlJiI/hOEwK5M1ELasYh?=
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
	2BtZmnSS2fPyHCI5tUvpB6J1n8dEu4KT1UhWihczrpifgApVRxKgCt7nWw7jR4OjvSUQCNaguJoaz8iYo1yXXwvVDTvINUAY9ARdj3ZxNnIXCRn8kSteo47WwVq1aycuhN1CDDzXuD0io9LRaBiZtnpk5T/dVz1ndqvKiUVKJH2gJgSPUFBu75692yjqixIR59qleOQMmC4wkg9/BTTJCccJU/J659x1/klA8cWL4mameePjoRD4vwdX7V0XDX+VI9LCiFrpdIsQ4bwGmc0l9Y18VaFEtnmmM69nEnvDBkzHUNekp6N1B+wQo/PdtAZ28r1dHCO2/MFnsqDj9GbeYuWMOmhM9bx3gTsZUQ0ad8WWLgMRxOtIWnAi/ehaq9FKvkhoDxQ8w3fxnpAiRBHUNgC5SrMqe/ghtHJZ0Rnwto3f1VdTf2RdDcio52a90aY8xSabfoAwzDLf87goZJIg5hXhzbwqBsaAsfhHUfBYLgW+JSQ7o5NnJNxvLBhmL2UIKxBEdvzqkbWXRyBZiXCSREmcFvbyKLbxzFWoF/Nai01j2LgUOheDYcPOIgw0/m3lWGl+lN4BOcbZAwIDW8rbjGCcPElrTfg/YFPnSwhMrmlo1yhaHwTo0LzVywlrEX29z3M78gxVlUUH+ZvCTdZVQw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e055205f-e158-4c2e-56b3-08dd816b4945
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 06:59:54.7117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BOq0BUkB35WViRPv5h4NdHs04hhkum02dcMG49xdjPXrzmS/flKnW++xL0oxFSWzEwWT1i8hOVVzgztil8byWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9115
X-Proofpoint-ORIG-GUID: 0B4XLqeraNTEI_PYsRAuz8BDL5gZbIe-
X-Authority-Analysis: v=2.4 cv=L/odQ/T8 c=1 sm=1 tr=0 ts=68073e70 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=1nkadCgX71emagpZ3AIA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: 0B4XLqeraNTEI_PYsRAuz8BDL5gZbIe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_03,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxlogscore=788 impostorscore=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504220052

For UTMI+ PHY, according to programming guide, first should be set
PMUACTV bit then STOPPCLK bit. Otherwise, when the device issues
Remote Wakeup, then host notices disconnect instead.
For ULPI PHY, above mentioned bits must be set in reversed order:
STOPPCLK then PMUACTV.

Fixes: 4483ef3c1685 ("usb: dwc2: Add hibernation updates for ULPI PHY")
Reported-by: Tomasz Mon <tomasz.mon@nordicsemi.no>
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/gadget.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index e7bf9cc635be..be6b792e9a7d 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -5345,20 +5345,33 @@ int dwc2_gadget_enter_hibernation(struct dwc2_hsotg=
 *hsotg)
 	if (gusbcfg & GUSBCFG_ULPI_UTMI_SEL) {
 		/* ULPI interface */
 		gpwrdn |=3D GPWRDN_ULPI_LATCH_EN_DURING_HIB_ENTRY;
-	}
-	dwc2_writel(hsotg, gpwrdn, GPWRDN);
-	udelay(10);
+		dwc2_writel(hsotg, gpwrdn, GPWRDN);
+		udelay(10);
=20
-	/* Suspend the Phy Clock */
-	pcgcctl =3D dwc2_readl(hsotg, PCGCTL);
-	pcgcctl |=3D PCGCTL_STOPPCLK;
-	dwc2_writel(hsotg, pcgcctl, PCGCTL);
-	udelay(10);
+		pcgcctl =3D dwc2_readl(hsotg, PCGCTL);
+		pcgcctl |=3D PCGCTL_STOPPCLK;
+		dwc2_writel(hsotg, pcgcctl, PCGCTL);
+		udelay(10);
=20
-	gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
-	gpwrdn |=3D GPWRDN_PMUACTV;
-	dwc2_writel(hsotg, gpwrdn, GPWRDN);
-	udelay(10);
+		gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
+		gpwrdn |=3D GPWRDN_PMUACTV;
+		dwc2_writel(hsotg, gpwrdn, GPWRDN);
+		udelay(10);
+	} else {
+		/* UTMI+ Interface */
+		dwc2_writel(hsotg, gpwrdn, GPWRDN);
+		udelay(10);
+
+		gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
+		gpwrdn |=3D GPWRDN_PMUACTV;
+		dwc2_writel(hsotg, gpwrdn, GPWRDN);
+		udelay(10);
+
+		pcgcctl =3D dwc2_readl(hsotg, PCGCTL);
+		pcgcctl |=3D PCGCTL_STOPPCLK;
+		dwc2_writel(hsotg, pcgcctl, PCGCTL);
+		udelay(10);
+	}
=20
 	/* Set flag to indicate that we are in hibernation */
 	hsotg->hibernated =3D 1;

base-commit: 12393996c1b28cd944465d2f55500ca84399a7f1
--=20
2.41.0


