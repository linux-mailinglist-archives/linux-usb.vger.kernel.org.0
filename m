Return-Path: <linux-usb+bounces-18339-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A719EC0CA
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 335662827B6
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A789CA4E;
	Wed, 11 Dec 2024 00:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dcJ1KICL";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PiA8ONTk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CZmb6flA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7811CAF
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877161; cv=fail; b=L3XHTatjPvf6Is+WwaSe0q4YtiB2JDlF2PD6FeCEcjwXvirIoqEAdNjPgPyKA98WBwH0E/8V4pLDbsaWww4lvNM+lcxut/l0vauKMpGjWPC1YerEmmhgcmviLr2uwXy1k8+abWVx+9zIEWhHztXudBuPVtceeAfW9ZCW9wZbdMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877161; c=relaxed/simple;
	bh=fAYeKuswwk8CWWN5neXlVnMxMswBcm8yoZfb0JX3JxA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j6hiwR8Iqi0g5v20zDcytvgy1N2xfGKymWDU0J96idMWFGuxKzFnlcRO9LaTeBh5B7Kv9i5buhL8iRfiiDA7A2TlHuTOHdl6Vv/wLIJ2hhlbcNqL6+G9oUusybOPHlNP5zSSOv7Kg+MkPpk8QBQld4/LcjmXHK78wDW1lmlSRGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dcJ1KICL; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PiA8ONTk; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CZmb6flA reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAM3rVb000519;
	Tue, 10 Dec 2024 16:32:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=Pn3Y5dWVLqyySaQTBEIxR7YkNlmL9LyJ79G08YFYd28=; b=dcJ1KICL+iCm
	+dBRb3ji4bCSWdmGbjST8obYLScoVi89WbcNbuGj7YzK27PMbSCXrQGt+FiHxWwb
	XouKsZKCjLHTfp15H9XZ2EL2SO2PpmmAsM7/lfD8hvNGQvrQ9QpWJ1Cy/NkJwuYd
	JDdRqf+3LkKvSpP0E/je6hEXhxl32uJ4Jmi/tckNiGl50L8bdbiPt/ju3cedRAFb
	HE9CXsXL/fLpkAuKMuXZ5h05qEjip71QF1TDBaXSu9WXvTpWu2AgWkbqu7pPjeFL
	dlg3x6wtwQbgdua+l+mYECFZG+3TK7oCM0eQJD6l/5vkv21+kMG+nHJPmOMk9FGr
	410OVvnpkw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 43cnvka156-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877154; bh=fAYeKuswwk8CWWN5neXlVnMxMswBcm8yoZfb0JX3JxA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=PiA8ONTkmzElsFyg+czUxn/Ycxu3O/kRgFs/82e6aotuT0cR3wmI8AOD8QzzoInMM
	 RU4qBOIdFxpvzzIz2FO5ZgZAFx6xhlYE39tgrgTzwUee+9kSPDAN4zdaZj6tzh5Ewl
	 cjOBKNGeNRZ2ychaakXKUBLGR9XvDoiH5dN8rNgpv/+9bkjPD99KhqH0bIIuRZ2DFu
	 lOTjk0aZ/m0URj8JWFEKc1QBV6VCdHkUp6Meog+ZqxY1DQJjPQ3nkid7B1i6Q76213
	 IK031Kjcujx4YF0jJ4SNsrf5crDIBJvYVKydn9GDEzdWovgG+ITp+OiTDAr6zGRkwg
	 TkpATIqWbExhA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8C27440126;
	Wed, 11 Dec 2024 00:32:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1AD3FA005E;
	Wed, 11 Dec 2024 00:32:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=CZmb6flA;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DCE95401EF;
	Wed, 11 Dec 2024 00:32:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLC+F33h3hY7zkNsuHF4UcVoUGr2jhE4NY94flPe8vAbgYjVs7fu+0MEwRM4aYdzmhcbbxOwc3Nj2m2cEnA70I6cc081MasptEnJhNStgsA9PEu5cpxAOu8irTQdjgE6jj1g3Wsega7xRHk8m69bTIpnWbeH1q3lL/7hOxJ5NdMOmZj6cKJgUpsxzCPF3ZgJ/qPXA5KAs0AjulGOkAG2Gljvsz6cu+e32yeYkdRcnEF1CSjbyUbWXAAd2wsKbaAaXe3Lmfq91sHpjTwnzOEJphcNH1cfqMwjUPDCKxfjoigjOctP7VdK9Lw6OEOUBwRDj4+BCbwS1x9L7HojEWZNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pn3Y5dWVLqyySaQTBEIxR7YkNlmL9LyJ79G08YFYd28=;
 b=RzraxKwq6k19WKPtK723efLSp33jYUfLPuBCW86KjjFYYL8+E2MC1hb19KTZSR4w/U5J/0fpHS+yrKaVRgMtfA/aBc9SA6mmOuzYp0GQi9uGrl7jpzl8m0DQGPiyTYFrMpEHBYxF4F792FcOCNe1PiNPuccS4FU3F40z8IDVGJ6V26GMMEJ0qMQ7TzYE77Ate1zuqbE5C9bt+Q7pfR7goL2+iDaEZjN0vCTjP5yba8ZNoaQRLFfzGFg4b96CglZJZsGdCsFg/uJ2ZpA1/QNoxqYdkn17nCg5kRJReNSJfaAi3SDKHCr0XcvH8imZmci1lOTTlei4NBv9JnZzftYmVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn3Y5dWVLqyySaQTBEIxR7YkNlmL9LyJ79G08YFYd28=;
 b=CZmb6flAcMKBOk7gbXPKrWvj2kpJSl30PCHMZX/YbVUNMoFtzExqcqTUCqnNSRF310gwJuc3jMWGhK5wwECi6N5f017Ekt0kcwAzXUlyDP99b/rx/QCG2PWlpFU8pjJOH21yvPXbBFVT2wuaVP3SNBdBzwSbuDzBv9l/DRFK2UM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB7691.namprd12.prod.outlook.com (2603:10b6:610:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 00:32:31 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:32:31 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 10/28] usb: gadget: f_tcm: Get stream by sbitmap number
Thread-Topic: [PATCH v3 10/28] usb: gadget: f_tcm: Get stream by sbitmap
 number
Thread-Index: AQHbS2Qq1ekOkVqun0y/WCDmHzhqTQ==
Date: Wed, 11 Dec 2024 00:32:31 +0000
Message-ID:
 <169f67261162c16342bc8543db93c259b05ead0b.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB7691:EE_
x-ms-office365-filtering-correlation-id: a176251a-9eef-4fb0-cffc-08dd197b4c9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iv/jt04l4N/dhQGXD0HVcRPveZ/fqy/ismf4zM2aVROni/ihaQOBsAYmqc?=
 =?iso-8859-1?Q?V9KUthQ4hcIsQ3PAcCI5X79moHHPzYCEZVPFThwDi1a5Y8/YuGdSBn49BU?=
 =?iso-8859-1?Q?Mb5Z5Sg/Kqi6ce3eSwQcO8kllcOe5VYlvFkdwqhnmGI9KD/8kCLULJwLRa?=
 =?iso-8859-1?Q?fUWV8FP/J+oXyoitmKIdKdkw5Ln65063d457dNO2DgQe+vV5T09pmESqEk?=
 =?iso-8859-1?Q?04dzO8o4SIvKRDPtFVcyVk4IYL3e0VllQozVscl84GWZuaKvkSxd/sdq7f?=
 =?iso-8859-1?Q?fXwzHUSnWK15jfNXazai3ifvXxoEx4tzROSoLwYOoLxrU18HeOummXU65o?=
 =?iso-8859-1?Q?aVjkvPMyYxPwXFoYvmjn4iwpX8tufpZgcGZ4m8rlR84jM3DnZBZ5xGh/I5?=
 =?iso-8859-1?Q?qixb3FL8XjYYR626RTmI3gGDgb8U0SnNNrcgsmQBZ3+WJuaAzscEHIPbLe?=
 =?iso-8859-1?Q?hgXRoUfr5q31puKUH1LUrWhNi+6chXbyV5zEK/xwgUaDNnBEIx0stPeA/O?=
 =?iso-8859-1?Q?U5fMjp3WhwYRQkXAVtYk8QjzTawDeBsC5LIDhRSnNmc1jiZrIryf/0OOa1?=
 =?iso-8859-1?Q?ytGNBC62+rlBvpTJKisc9nxNoyJVEXuyiIgm8AdplltF+aULkfN9grkqH3?=
 =?iso-8859-1?Q?4i5eOaOclCFZNKaCPJ0RhG7DRnwSU8qhoX8rnWzzn0yZXzSuCvch2V0yXh?=
 =?iso-8859-1?Q?6Z7aC+0hhJKQYUNunP1xPEak4WDFSwBRVjXwAgIUsfe7KZNn32JEkAe6Uk?=
 =?iso-8859-1?Q?STVvVvNpSqIZEgdsqNetc9Ao7EgrAB8fDjIkF41+TrNrWdZohpi0kVZiXK?=
 =?iso-8859-1?Q?No04ZNd1Aa5LVtnrSqEax8oeIh7/1PRNQNKkXKQe3lDLIUq7BnzwSfxGzF?=
 =?iso-8859-1?Q?HDh7bwh7ZzRl7T6l/uJFqnKWqqSmEJeDOl4twmzYXmq30L75wEGP0BWUVP?=
 =?iso-8859-1?Q?zn+vR18xVbJS4S9m0VCT22bjwPAadKEpjWJPiSYiIVgJtaWY5n9kLgSiMQ?=
 =?iso-8859-1?Q?vtHbpD5numZYmXorJLYiPgsdRjvQb+HFE/mTiZOHu5f3OPwgA7B3R5u5V/?=
 =?iso-8859-1?Q?feSllDFrAJ4ozZ7+4gX0FrJct48dYwXOiY2SvXfh09fx3/PSfthJwYNvDN?=
 =?iso-8859-1?Q?lLtkJkyZ6W+KJNuW01U4Iugj/WIhzP+xYIyrlBq9hfjb1ZPbDsJa0d29Aq?=
 =?iso-8859-1?Q?Pkft23rXBodMMZ2xdePlvRMfWLExqKFwk72tM3uP4FTarmfL0fmHZz5048?=
 =?iso-8859-1?Q?neEEdABpc5rD1bJWQduMdyNY6RDH+MsKRV5gCFtqqFwvrR7mtwcEZB1QHc?=
 =?iso-8859-1?Q?wfKCflT+vopLniAvRgg3aoMuHE8RtE6QVgflXLgMMahQDerwv6GiElF22M?=
 =?iso-8859-1?Q?7022499aX0IruTn0x5biSO2W64/ofvljFCAukxs6h3oCIEy/KRfjJV2FG8?=
 =?iso-8859-1?Q?YPRxT3Gb0mch/TLSf+ccuDKxvFaic8z+sFWVqA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qH9RTCV3QbwaNSPHOGZ7AsbB5UA0xaSEKaA6eTFplxzbp9w9NpvUmAnBO7?=
 =?iso-8859-1?Q?BzwcREbXwHOTjGwgWmV16likJDvPFJVe4QA/Hh33YHcg2W0XERozakkBP3?=
 =?iso-8859-1?Q?rd7naZDoQgCfekYAVZ0w/jcmPawBj10RdPUHGDC2/1gaqrUrYgZ4XYwxR0?=
 =?iso-8859-1?Q?XTkVaxR4vFgRA3P9m+V+BXM4svtFzp5vLllxkC5tq6wiCEcwG6hfggq4Se?=
 =?iso-8859-1?Q?Pz9cbLcJh+BPsj9eOwhAKaFISZqE0Rqcoj9SUpZUzRqz1COuDUCL52HXVx?=
 =?iso-8859-1?Q?+trTUp+DYeb7pUie2Vx0TbIXSBXaY5eIUEXKcsCEqRW2P/Yr3ozyxZACwM?=
 =?iso-8859-1?Q?Jt0KkGVX9hThr0PBxhtZCD7hlZWCFasx98IrGcHbCjQ6GaUAD6EaLUS+dJ?=
 =?iso-8859-1?Q?oJuzdy9vByxLuP4A+rCyD6kKPHFgnbol2S2XX9zf+Q/217KNMezO+9PMAu?=
 =?iso-8859-1?Q?1fwjf+LZixHC30031TwTYIKs3wyQSn2PgXutCWAPeu+8kjFo66E7u52/t7?=
 =?iso-8859-1?Q?87komvWu2vhYsU7IV/I7fmTfZJ8WRSriufozGGzAS37l2/LkljLDGdxLPC?=
 =?iso-8859-1?Q?/ByYolgl/vf58blBKEwD984FKWQ7NnAoi/Jcl3R96oVmH+929X7t4/72ZY?=
 =?iso-8859-1?Q?+vo3KXM0/JwQZW4LL+cMJr+LR6qpPIrqMBR2BomNb9hsej0PiOMUedfvNQ?=
 =?iso-8859-1?Q?ThKJteqyLXcUAcJJeRhel8ptc4zfnvCb/t2M3pnTocTpg64NJ9C/7+hDB7?=
 =?iso-8859-1?Q?bsUmQk77ZR+iPxNnqG/ZQ5h6xpw+x05jzVZUuC93+j8Q/A1tqoiatMpz6L?=
 =?iso-8859-1?Q?kwb16mdLrBmRae6CXiJ7CdwHwuo/5aeB1BKj6JXBuPevQ1dIdlFk1sDJXV?=
 =?iso-8859-1?Q?BkT2y6gxIPh9io4GxklMPIh+Df2eC/BJNBoeFdrsMSFlsCP147dLes/Air?=
 =?iso-8859-1?Q?pomVp1nHLd/hIAeoX07trY+LnBc7+LvgCdhbxfDemdqxAal4a9Wu3v33zJ?=
 =?iso-8859-1?Q?moAMRbe4qbs50HjhszYeRYs3OdOSq/sCI3UEZj8Cby4AiSgxVtdgKG/2gY?=
 =?iso-8859-1?Q?ch4bUQd93+QTrjKLAtgBtUqaDm2FoGkWA6wsXRWraidXiAA0m+BP82a/Ki?=
 =?iso-8859-1?Q?BRk6IL1MFGPwckWWLlo9hyhuSa/kn+iKToEB0VApGBJp1oIXbNfAJ/wo30?=
 =?iso-8859-1?Q?guqHzeenJe1nJ6nqJDpLTHJpUO+VvsZjfD4q8GnUTII8YQuv9CFmNjZhkc?=
 =?iso-8859-1?Q?zgd/gXYqRC21i5QzloCWmXdQIynOYeSjserts7JNZv72ENVgErU8zogscm?=
 =?iso-8859-1?Q?jfIuO43MVK6iypdgQAQGyabWPv4d35i8Wu82/oxZZUEpxa0lKROZH9JUPc?=
 =?iso-8859-1?Q?Q+s1E5J06AOMlAJvTLU+rcrDzv23g+GIzUJ8TzHmWkp66aOTiyGIuOSmaK?=
 =?iso-8859-1?Q?n0BLijIDsf4aZy/QjO2HbAAhLwJD0547U/+zgu5XJbZo75mmRxFopMqf9+?=
 =?iso-8859-1?Q?Uc9l2sYrv6UxvzOLwJgpmqhe3RkpwE+XvJp/gpHuDbyX+DPgUU0Ej2Bg4f?=
 =?iso-8859-1?Q?F6bTUpWBKc56+E22/hik4fG65LQiub5k+7lPwHWkXKiztus2yqJyImmmaW?=
 =?iso-8859-1?Q?G7zU9K1iyUJiirr8msqxYIRNcY6by5QZbDEFFwFIjUr9Vn6gAmOvOPGw?=
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
	/kH1IxmISgrr0KnGLA8aI2nWpL3ZFh63Up3vD9DVNY2elZI1f4xc3+Zxqj2K9Dh0EooZXExWrwhxlsEzI/DgtzXyMhehCmDTtuVbt/in9bVRdH6Ut5tIn2z9gRXlsK+t7zFy047Di86OLZHK5pRZTxDVW53UvX/MSLES6d3ff8HvAWVq8BJc0LvSSrbX1Xoy1Y1wn+UbK7TdDcbCTWm5mTdpQ5LidyxSWiHZgZW/mtYSMROV4CG7CyUQhtPIjU6wU6gxz35W5E4ZqHO91uwr5AF+NsuNSsq6BB9T9AdFMGYF+6R1vH2ktHFMfxJP68XZnAHiwP+dkuGy/HcTLHwUpK24mAXVg2gBJjiPerX8q6ogbCF4C+3nE1mNSmxkhlbstybZxfnGCI3rhOJLzE4efgsdgqtCElr93A/wxzaf5auED/aBiADkg6zVW0t7DBoc2plpy1vau242hRZHkYlssBDhFQDENhu4wNffESUjfXb53qz3p7d3m+rSHS2dGMn6RTJnoXzYsS/tggIfLQYgQhiJ+EX7X8A5lEI60t/gCa4RsJ8aa32c9ZsXRV7/EHXZf7wuTLxH+Y5tO3q7EISLrywLFcTFnHNUF5IFZHxX2KFM34o0B3trcP5Jm64U/S4fOUYRGu/XKXhYhBNjiVn2Xw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a176251a-9eef-4fb0-cffc-08dd197b4c9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:32:31.3305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2rzZjNHQhOw4RvIfMgtGI2tTmdkzuq44bR0wcU9IyaiCpsp+x2aYRBRYDqXyMQwrx8/3UcAvvkpUu+BDKa6SMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7691
X-Authority-Analysis: v=2.4 cv=fNPD3Yae c=1 sm=1 tr=0 ts=6758dda3 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=W-950U-e_TmYsRHEapIA:9 a=wPNLvfGTeEIA:10 a=VI-E8fl1FWJz5TsTLJMq:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: J3AuuaqicM7KJ-uTNZ7rRxciCblL5tL6
X-Proofpoint-GUID: J3AuuaqicM7KJ-uTNZ7rRxciCblL5tL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

We prepare same number of sbitmap as the number of streams. Use the
returned sbitmap number as index to the selected stream for a usbg_cmd.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 26 ++++++--------------------
 drivers/usb/gadget/function/tcm.h   |  1 -
 2 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index 1c93f07daa7b..a908bbd04b09 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -491,7 +491,7 @@ static int uasp_prepare_r_request(struct usbg_cmd *cmd)
 	struct se_cmd *se_cmd =3D &cmd->se_cmd;
 	struct f_uas *fu =3D cmd->fu;
 	struct usb_gadget *gadget =3D fuas_to_gadget(fu);
-	struct uas_stream *stream =3D cmd->stream;
+	struct uas_stream *stream =3D &fu->stream[se_cmd->map_tag];
=20
 	if (!gadget->sg_supported) {
 		cmd->data_buf =3D kmalloc(se_cmd->data_length, GFP_ATOMIC);
@@ -523,7 +523,7 @@ static void uasp_prepare_status(struct usbg_cmd *cmd)
 {
 	struct se_cmd *se_cmd =3D &cmd->se_cmd;
 	struct sense_iu *iu =3D &cmd->sense_iu;
-	struct uas_stream *stream =3D cmd->stream;
+	struct uas_stream *stream =3D &cmd->fu->stream[se_cmd->map_tag];
=20
 	cmd->state =3D UASP_QUEUE_COMMAND;
 	iu->iu_id =3D IU_ID_STATUS;
@@ -544,8 +544,8 @@ static void uasp_prepare_status(struct usbg_cmd *cmd)
 static void uasp_status_data_cmpl(struct usb_ep *ep, struct usb_request *r=
eq)
 {
 	struct usbg_cmd *cmd =3D req->context;
-	struct uas_stream *stream =3D cmd->stream;
 	struct f_uas *fu =3D cmd->fu;
+	struct uas_stream *stream =3D &fu->stream[cmd->se_cmd.map_tag];
 	int ret;
=20
 	if (req->status < 0)
@@ -595,7 +595,7 @@ static void uasp_status_data_cmpl(struct usb_ep *ep, st=
ruct usb_request *req)
 static int uasp_send_status_response(struct usbg_cmd *cmd)
 {
 	struct f_uas *fu =3D cmd->fu;
-	struct uas_stream *stream =3D cmd->stream;
+	struct uas_stream *stream =3D &fu->stream[cmd->se_cmd.map_tag];
 	struct sense_iu *iu =3D &cmd->sense_iu;
=20
 	iu->tag =3D cpu_to_be16(cmd->tag);
@@ -609,7 +609,7 @@ static int uasp_send_status_response(struct usbg_cmd *c=
md)
 static int uasp_send_read_response(struct usbg_cmd *cmd)
 {
 	struct f_uas *fu =3D cmd->fu;
-	struct uas_stream *stream =3D cmd->stream;
+	struct uas_stream *stream =3D &fu->stream[cmd->se_cmd.map_tag];
 	struct sense_iu *iu =3D &cmd->sense_iu;
 	int ret;
=20
@@ -653,7 +653,7 @@ static int uasp_send_write_request(struct usbg_cmd *cmd=
)
 {
 	struct f_uas *fu =3D cmd->fu;
 	struct se_cmd *se_cmd =3D &cmd->se_cmd;
-	struct uas_stream *stream =3D cmd->stream;
+	struct uas_stream *stream =3D &fu->stream[se_cmd->map_tag];
 	struct sense_iu *iu =3D &cmd->sense_iu;
 	int ret;
=20
@@ -1104,17 +1104,6 @@ static int usbg_submit_command(struct f_uas *fu,
 	}
 	memcpy(cmd->cmd_buf, cmd_iu->cdb, cmd_len);
=20
-	if (fu->flags & USBG_USE_STREAMS) {
-		if (cmd->tag > UASP_SS_EP_COMP_NUM_STREAMS)
-			goto err;
-		if (!cmd->tag)
-			cmd->stream =3D &fu->stream[0];
-		else
-			cmd->stream =3D &fu->stream[cmd->tag - 1];
-	} else {
-		cmd->stream =3D &fu->stream[0];
-	}
-
 	switch (cmd_iu->prio_attr & 0x7) {
 	case UAS_HEAD_TAG:
 		cmd->prio_attr =3D TCM_HEAD_TAG;
@@ -1140,9 +1129,6 @@ static int usbg_submit_command(struct f_uas *fu,
 	queue_work(tpg->workqueue, &cmd->work);
=20
 	return 0;
-err:
-	usbg_release_cmd(&cmd->se_cmd);
-	return -EINVAL;
 }
=20
 static void bot_cmd_work(struct work_struct *work)
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/functio=
n/tcm.h
index 385bc2cdefb6..cf469c19eaca 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -80,7 +80,6 @@ struct usbg_cmd {
 	u16 prio_attr;
 	struct sense_iu sense_iu;
 	enum uas_state state;
-	struct uas_stream *stream;
=20
 	/* BOT only */
 	__le32 bot_tag;
--=20
2.28.0

