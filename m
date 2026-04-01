Return-Path: <linux-usb+bounces-35816-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICkHLdyizWl9fgYAu9opvQ
	(envelope-from <linux-usb+bounces-35816-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 00:57:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC99238125E
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 00:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DAB19300C552
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 22:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DEB3859D5;
	Wed,  1 Apr 2026 22:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ln31ufD5";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Pr197mnT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Q1brzlCC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5E33CA4A6;
	Wed,  1 Apr 2026 22:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775084154; cv=fail; b=BpExyAVbxyFtxXkEWFYJPzFIVL4NPPjk3alC0LkUG+2ivgf0MpfTlOU4sSXwWQ99goy3NrFUqQLZ6yFFbHKBt5/m0WJEnESZpVAMl5bv0rtsHLrhZ6ZTTb/i9baL0dthNwN1etH5GYYp9ZZl1Pm8qca9kQOlTKBgDPmB9Q4LyqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775084154; c=relaxed/simple;
	bh=ok69Vu59CrFi0yK/6lms4bJEela4H54qrUT6f6Y6C1E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qNlKylxfNdK4N92VHX9ExmIYTOWzumPl7NRNh0ERxEEumCXD2XHjpLSmsewbhKZWjyvXZJc3DzWUWmtgFfsFIWbvsISc8tTSy4xhtTSnoVOxRrl60S4aJcmCrpv8TUWlzlnUHKZfSd35UFrunncuv9HzJRTcF4afRUkhBMKZwPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ln31ufD5; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Pr197mnT; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Q1brzlCC reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631J6QgF4042814;
	Wed, 1 Apr 2026 15:55:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ok69Vu59CrFi0yK/6lms4bJEela4H54qrUT6f6Y6C1E=; b=
	Ln31ufD5Vf8ATorxVtvbVvxV3/H+k+UtiaPvPER4cq5B9L+BXPPaTQQvAvTtxlHk
	ifh1efOzxiFD2beXyFGll+MhsPFPRjf2AIvYtYPozoFS7Hoiv8x3g9cfHXGyRg1r
	ePnUxBxGV5DunfxCRWG7jzjSLotAHe2gAlO8E9UuWPkfTaLpOUQL5Vxj2QpuhfBR
	4qr42lTp6JNyGV2NHiUeu55Hscq6yknjSrq28NTHJ6bXv+j1Gpn4FkpaF/R8JR20
	W6W+jK7at9Pjm4QHhMXji5vt3Jg1wcTT12XOI1WNhueQB2Q5hjL683FbqC6xeOwS
	2NFyzVNhsLBDhIq6sCY1cw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4d9607jwr3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Apr 2026 15:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1775084120; bh=ok69Vu59CrFi0yK/6lms4bJEela4H54qrUT6f6Y6C1E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Pr197mnTqIT9TWmuYp4u7G+yRebFeKftMVHwGT/UD39bZ9Lil1HGZeJSAvaLkeGDU
	 ho/ttf2Jq8fEui1Y4EAQm6cYvegCrAJc73IsGjJaedsWypJ2tUhGi7wf3IFzl8VBKL
	 Fws4Hps9tH8QvM4KAHgslRzxaNR6fpcZBn4LdoUR0IOLt0LUZ8E8/TJP6TcP3sY8KL
	 73PX8W1YRx/zbXCpNNxNVmw0f9niqVJlTCYBikN/ShjWjrB4Xs0+9lrzPB2OeBs5ik
	 zLcnunIyobEwju7HWV6On6/CSBEdrcz65+skTHP4hFs9cJVad1//0N1x43UP5Nyfsr
	 3jQFOPj3p6Emw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7C4394041D;
	Wed,  1 Apr 2026 22:55:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0700CA006F;
	Wed,  1 Apr 2026 22:55:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Q1brzlCC;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00404.outbound.protection.outlook.com [40.93.13.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id AD36940130;
	Wed,  1 Apr 2026 22:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnhRuzRT39t5DAmS3SUEt0V+Q7c6N220xeUkMxrkDgXr6tLh74QM1/v8ZVVYRHDCChy9bAN21KPJrBTgv4Cv5hP086x6yaTRbXcbtt9fKLoBmoO3LTVySLjmAIX34RJLsOTpv2vmzxbobKQKnowK6vvYcXz9UsV+dNlMX7okQDOyl65n/eDSAZSFOMQNzs4r6r87MxX27r42i2Dsl0zcxJ0nr4ollnKZqwtsedTRLkfxuW649YO9Fp+AOKt8Ja9luTQ2EFV07ugxEIF/27J6g77m0nqx94buo9A1EmxNb/pNBdwAjWF4aip+cOaP2mwRmnan5LOa9UHcBKbk7/MiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ok69Vu59CrFi0yK/6lms4bJEela4H54qrUT6f6Y6C1E=;
 b=WGfhBW/4HSa1S/GFQCtxdJthQT6oZMtYEZRMev4w2E7p99G3A59tUck02+Fa0orrOPf5aCJg5J4+hpI0UGfT/WY2Px3/QhvYEaYPhyLmDcaOk625X3nj90R7+cnYHUXwCt0nkM/JN0S71+T6nu9e/XdjPB4+sFMeqlggddsww2G75zbMaIQtREbs65KMLa7Kp8fzPUU7AzGzEBgU/JvW6keq5YztlCAlLcKeb59Uwwsa2mbCT6FQR8lQi9E/obYN3AHhuoriPzrlRbM4Ndn76Hrj6l7eqKplNsEJy3DB76GYKXJQ8qqLbnFwuLZ7UeFowN8qTLh6NJxgbia+hjRgHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ok69Vu59CrFi0yK/6lms4bJEela4H54qrUT6f6Y6C1E=;
 b=Q1brzlCCk06rVOefpIsCAD6lnbWMeM4hfvQxjWYBnJGZK+rUiZEn/DrEtoZUM0eSZLfVMVwYK4Ew9NHG+4mPDaJBHJ+InQ5VM57x+sYUDcV3uUjZkp50yIHCkZdreD/GSX5Y5KS02bl+BzU9gw8ATnC/jPbImTPm78M/mnz2d3U=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM6PR12MB4386.namprd12.prod.outlook.com (2603:10b6:5:28f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 1 Apr
 2026 22:55:05 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.017; Wed, 1 Apr 2026
 22:55:05 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: imx8mp: fix memory leak on probe failure path
Thread-Topic: [PATCH] usb: dwc3: imx8mp: fix memory leak on probe failure path
Thread-Index: AQHcwd6Kbpfc4Ywt/0qiOaJ6i4yMg7XK0WgA
Date: Wed, 1 Apr 2026 22:55:05 +0000
Message-ID: <20260401225502.24r6375pfzq4x3d2@synopsys.com>
References: <20260401134938.686748-1-xiaolei.wang@windriver.com>
In-Reply-To: <20260401134938.686748-1-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM6PR12MB4386:EE_
x-ms-office365-filtering-correlation-id: 4e0a855e-e9bd-4cff-a48a-08de9041b756
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 uX1ST+Y+wSecUKtLqP153NRldqLTv9hysKOagYB0FgTzL7gt+tNo4HgA52VcDE9LhK03tq66XwuZEutu5WOt0AnZ6wTcTBrblhzIRdgQ/1HF4GUV7KoRqt3NLyWCymE/EMw8FIP9rdi+JPaVgL4NUBy36NmoAhvKECAKAYqznoHDBLid2LgNP/sO3Gk97YAdlnh+yv1hmvcyIpq905WbyKjnOd5+pxCDztLZhQuYO3ttPWO8hG6hGjTBajYjPRhpWZjDl1ynJKuqJckAQlHHjxBJ/Oqj/EnRqoXEBq/LYUF9E5HoC00m9CNm5YWOT83NFkxAALMeR39ZmlRSg08iWaSfivoXoWkZRyb3sa+whX0KMtLJXdw0nwZorDbu4Gd8RY/qAHadbScxBTn/TP8MiE7kpzbAmOKcghaljZpBUCJdNdH4r8ukngCq+1pmIIT2oV/O51wCI0GFhHBHVDlSa+W0zRRgSPROT30U5snFtWkqBYrzsn/f5tXBrQAA75hDuArxDMeOBeJQUvjKhTdRxU3lvy8HsWHSbPU0UL+oIiXF1IeomeVN/DkVz2JY8TQrmSDv3vxDWbRq6hpjZkQxI+JMv4baZF2p2u5hMOqUiPkHHeh/ho0HOH7QYP5Awm8wPMmAlLzlNoeQhtiwDkVXcBISSkN0pqCJ1uxBRBh32jcTl8GH6i85cfEEMlaM6YI4szE+cHWkTr4tdJRDWBAerR6Rn+lvPadzjSFasmw4ABhWVPvcq9jJrHJPS4N9FWcGhZDJ7Sn3O45FVwPUfAZZc6RGCnenr7GnHTsimccawms=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVczOEs0ZlViS09WTzFxdExpeVh6VWw5VHk2SU1pRWJzKzAvdVEraEtzckxu?=
 =?utf-8?B?alU2UUw5U2UyRUhld2UzTmh0aUNEUm9ERVF0YVJScXdsaVFMdVAxMGIvaWx2?=
 =?utf-8?B?d3Y1V2RMdUdMd2NJOTh3YUdRemhOS1RxOTJTdElzcEMrU0pLaFdxUEVQdmQ5?=
 =?utf-8?B?aFRNeDM1ZlkvOHhBRzV5UWQ1UHRobHBzK1hRamRtaFQ5cjFuYTBBa3ZFNE5B?=
 =?utf-8?B?TWpzcjlmWThxSUJZMGF6bmo2R1hsenQ2UXhrM3FHb0t1OVg0SVhiMzBpS0ww?=
 =?utf-8?B?WmkyUktWdmdxVTQ1TXJPTUNGZ2l3aTRpN01talF5bS8xK3QwcGxwdU9ZWXRN?=
 =?utf-8?B?aEJGUFR5K3VTS0JWSHd6SWRMbHlLTFFnK3p2U0ZFS2lVcFRFV1M5czd5WDVD?=
 =?utf-8?B?RHB2Q1gzMnBTSlpWNlI0aUxVQlBPOUU3ekpqMkd1T0VtRTUyVUIybU9qU1Bn?=
 =?utf-8?B?SE5iaEVwOVErWng4UFhXdld1eTZVb1RyMWEyNWJnYlVzZlVnVmJac1lRMkJF?=
 =?utf-8?B?YU1rQkN4ODlIT0ZId2pTWjhRd2tkWWVzSGtFaWxhZUxzVVBTaGxHcWJGTHh3?=
 =?utf-8?B?VnhseG5GMWxKUU14dlJnYnhHMGdpYUx3Z254dVRvVmIxRnFvdm9LcmNCaUZW?=
 =?utf-8?B?VTVtdk5VbjRDOVFVZjlaM0VVdUo4MlVTblFhWThFTDJKU1JXNmN2Sk0vSEZx?=
 =?utf-8?B?aUlrbE1YM2pxL01XQ2FKUnVERVRUWExBdXhmYVAxRFd4V0p6RE9yeHBkaTlW?=
 =?utf-8?B?U053YVkxMkxEUTloNWUxc2JoWXdpRkdrcjR1L2ppeGtOZk1WR1l1Z2JCNzRX?=
 =?utf-8?B?UUkyckR4RG1HTzAreUtxbU9reElLT1prWHlyNmgrVEJhUzJrbzh4ckNSbWpO?=
 =?utf-8?B?UGNYQ2owTTE1UzV5dVExc2pxK2wzdDNmVnVPeHV0emhkalZyb3R0MEplMWh6?=
 =?utf-8?B?eG1QaEFjbkZDdmhlRGcwQTdUYjFqN2l5V0E0dVlOUThsNm5vakNkNm16RUZC?=
 =?utf-8?B?SE1QdXN6bnVGUWJmUUxUR0xKcnRncTJGS0hKMmtoSVpnbWpENURQdm53ektk?=
 =?utf-8?B?bUNuQnI4T3NIVzhTMStlem9NVDh0N0lrOWE1Q2ViZjF5MW5UdFU2RjFoMnZR?=
 =?utf-8?B?RlBLRU1wNEtoc1JNdlo5STF4end1em03ZXVNalZ2YVBRZWNPL3hXZlJiZWlv?=
 =?utf-8?B?QkVka29rTjhlSW1VOW5pVTVacDNkNmlFKzRuWThBZEtzQkEzN0R5bk1FZ1Q4?=
 =?utf-8?B?RTliT1pKdWVsTXF4VnE0WXFlcXNKTFZUY3UySWZyZjJoZVI3azNoMFVBSytI?=
 =?utf-8?B?SnZpcys0SmV2ZDZBUE84YnRHZllWbkdOSHozeUg3d2lPWHcxaU16cDAxWDB2?=
 =?utf-8?B?YmtVcTF0empoem41eEN3Q1hzRTROQXdUYnVCUTc5RWVLM1QrdlNUMnZ4UndT?=
 =?utf-8?B?UWJIQXpqUER1eW1VTGVzcE9odEpRYUE4Nk5UVVBCdGRqL0Vha3IrVDBLd2Q0?=
 =?utf-8?B?SFNDeTZEalB5bXduaklaOHg3VEQ1bE5kVm5kTW04Zk80cFlOSGhIZ0EvOHZB?=
 =?utf-8?B?YTRYT0h1c3kwMVVlZG5lQUxMMnpBaW1hUDFCb2J0T1RnWUk2T1BobjlJOFA3?=
 =?utf-8?B?d3lhY0xEK2JkbU9ybXBTOUJhVDJEcW43TjBFR3ZsVFdnUlZCTWVjWHgrY3o5?=
 =?utf-8?B?MjdVUmRxaVZSdlU4ODJBR3Rkcy9PWE0zV3Z6YmZEcHBKWkt5QnpjYUZzTjFo?=
 =?utf-8?B?d0JZcHh4WGowYXFvYng5UEkvUzJyUStMNEpRSWZ2dlM2dEV2VVdETUw4SmR4?=
 =?utf-8?B?cGFRSXVJQVBJMFZxcWZsblpTcEM2eUh3M3lmL2dtYUExd0FuUlJmUEcvNm9Y?=
 =?utf-8?B?UGg2V1ByT1dpSEt2aU52VzlwVmRUeHlHakhmSnF6ck9TclVSbktjTGduYUpL?=
 =?utf-8?B?ckFObVF6QUpYd1N2T3MwVlVveXBwbmt4THdvUmZ4TWJJNjRZa2hHZkVuc2Mv?=
 =?utf-8?B?ZU9uMEI3L3hMUjlHczFEWGNnSm05ajNsZWFPNktSMXVQcWtSOVJmR3B2OHBn?=
 =?utf-8?B?MWNBSTVVSmVxSVBlU3pVRWxDa0hiazZjdEhCa1oySkRlcllRUCtPSHBBbTg3?=
 =?utf-8?B?Zm9Yc2dKQzVnN3d1em9nMUswdU5laWZoTG9qaEk4ZW1rRzhCNmxxaTVuYysz?=
 =?utf-8?B?WU45c2xWSXU5eDBDSXFTMXdxYjd1ZnpWc3F4d3p5QlYwMThNaTZaMkFtU0Yw?=
 =?utf-8?B?U1l1anAvd3RLRVl1dlJ3VnJwK2trd3ZWdnNsMklleUJ3c1VhREI4bFF2MjFX?=
 =?utf-8?B?a2tBR1NMcS85YUNvZWhuQjVrdTlzcmVTSGJSMGJrQWh1K1VnV1dJQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B8BB38F27DAEA47B7C92CC0C24A0765@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	XB4NLcfWIXAC5nnq2CQe70qZ+yAbHcqc9h2ihSq/P421urWibOcXSm1c6FMkh1wn70aZEEvsNjhvCT9l89yBWOU0eUODv4dCoLWl9Fp3GKx207motQYdsWrq1JirAssJCEsI2zF21ITlSW6AOH3tzURycxH+CJ11LPTzPfqSZeEzt3NOQU+AtZi1NAk4A8lPeb3XdtyCgixEVYETCc6civxSa2bAW14/d9pq63uSO/3UvP013zYLjWj0Sp4i5O+TfTrQqyXBxPTRsVxZlGo2EiZ/t6yO1znb6FlHDhscXPI3x08sa0PlXtl6Uwx2QgShSo3a74uJ9vIyVYszVinTUw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YqdfsGfCcUoSEe6RD3qHACO2XSTp2vhozlUBHS8Ple2bOO9Np1G6GPxPk7JeRDqjy+ZuQIBrfISuLhPURH/oAXvDMrc/NkBVYkY3DYDgUcqVn8vJPfvjwdxXxC6fl6IJnUX+KGzy0oa9BhgqrljAgi4DNP3cVljJhCfkrjnThasnciPePSYyDdC2bf5nwqP/i2KzQ54qXr/Xt0FpnNlF6Qt3KX+D76cF5NA1HQ9Gw1+3QtC1lTvEFW+FT2oTIk78tzWl8KWLa1/mm06w9oFFmj3cV4sbSXYt0g1sI0Wb1qu3ETAWV9uxzP53EL/TFSkQasZAaYksXyGg6Wznasi3piYnY2q+CkZiBXYkJ/vJBLlBaU5GShzjqsKA6vnkX4JEmJmh3Oh24KVgDUFlvXqy5QVqM5mehOH9IPhhz1bPYDU5iF2k+QcHtATiFMAg9alFO6L/5Ba6MwhqzpJnl0bPZ47At+fKptNBp0/e0za5UHErhkf/3TExlNpd8ciOio5yWBLOtwJJCD8vcH+TfBZ51QQCVMeXyGqtHfDQH0yyG8/9DKtLncODBRlBmRszqF2Kfm5l11mWa7G4IR+5F5f9BqAqNNuX8ju41kGz6APX1+WLWBRPxN6RIoBBjoq3oG0+DgHdZg9UriYXhLlZy/oYkw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0a855e-e9bd-4cff-a48a-08de9041b756
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 22:55:05.6242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2F7gA0Mifk55+Rul6YyF+VHe+K8ZiOcmwigN77rMXhB9S4DqGeu4iSyunvp4tVmk+PF5iRYqLLYb6INiRgUoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4386
X-Authority-Analysis: v=2.4 cv=VsMuwu2n c=1 sm=1 tr=0 ts=69cda259 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=t7CeM3EgAAAA:8 a=jIQo8A4GAAAA:8 a=LWh_P6xjKBPA3-etFAMA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 21vOf7Jj4gupXSSF8qdevYfjS_BwZGA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDIxNiBTYWx0ZWRfX881dvLuL5iGb
 S7dgeGeGkkWE3kz5e/sUB2N09LPTt9g1VOfcUPeNYUltPv5VVGTKWsuO4g5mh9GY4gww/ni4aGK
 TXHAqpdMvhNFz1FbgbhHjyUCOLJhZFOcUEGUYECAh0Ogae7qnd9GHeIL54jRp0ORqEAj1gRifAA
 LDaqjWJR55iwvVnJ1fQ+549j5hmw3ois9r+mU+5zBCF4sTl9zD6JGcRxFUi18nL0tot0cpr2tq8
 /PDFrjWB95G1OZ/0RVM3gXEYDoph/n6uE9BasKP/KwjCamZ4owKcKQsdqS7gsSUKdAQ5gQf7+ek
 2joJduLpWLO9wdSNYUq8BVqEqYStr1AX/+rZJgP9nBajJaN40eOyfjOioUtXdkTeHGTGI6axEAJ
 7ZpnByKCMMVUfHO58FHK0nu93KK78w4ozgtciRcLoCESYKOslWCVDXimd59iPJ8+D6rxt9Jpgsc
 ykK+wZhSAtFhnowHNIg==
X-Proofpoint-GUID: 21vOf7Jj4gupXSSF8qdevYfjS_BwZGA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_05,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 clxscore=1011
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2604010216
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35816-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,synopsys.com:dkim,synopsys.com:email,synopsys.com:mid,windriver.com:email];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,linuxfoundation.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BC99238125E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBBcHIgMDEsIDIwMjYsIFhpYW9sZWkgV2FuZyB3cm90ZToNCj4gV2hlbiBwbGF0Zm9y
bV9nZXRfZHJ2ZGF0YSgpIHJldHVybnMgTlVMTCBhbmQgcHJvYmUgZGVmZXJzLCB0aGUgZXJyb3IN
Cj4gcGF0aCBqdW1wcyB0byB0aGUgJ2RlcG9wdWxhdGUnIGxhYmVsLCBza2lwcGluZyBwdXRfZGV2
aWNlKCkgZm9yIHRoZQ0KPiByZWZlcmVuY2UgYWNxdWlyZWQgYnkgb2ZfZmluZF9kZXZpY2VfYnlf
bm9kZSgpLiBUaGlzIGV4dHJhIHJlZmVyZW5jZQ0KPiBwcmV2ZW50cyB0aGUgY2hpbGQgcGxhdGZv
cm0gZGV2aWNlIGZyb20gYmVpbmcgZnJlZWQgd2hlbg0KPiBvZl9wbGF0Zm9ybV9kZXBvcHVsYXRl
KCkgaXMgY2FsbGVkLCByZXN1bHRpbmcgaW4gbWVtb3J5IGxlYWtzIHJlcG9ydGVkDQo+IGJ5IGtt
ZW1sZWFrOg0KPiANCj4gICB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjAwMDBjOTJjMTQ4MCAo
c2l6ZSA2NCk6DQo+ICAgICBjb21tICJrd29ya2VyL3UxNjoyIiwgcGlkIDUwLCBqaWZmaWVzIDQy
OTQ4OTU3ODkNCj4gICAgIGJhY2t0cmFjZSAoY3JjIDQ5ZDUwN2QwKToNCj4gICAgICAga21lbWxl
YWtfYWxsb2MrMHgzNC8weDQwDQo+ICAgICAgIF9fa21hbGxvY19ub3Byb2YrMHg0MzAvMHg2NzAN
Cj4gICAgICAgb2ZfZGV2aWNlX2FsbG9jKzB4ZWMvMHgyNmMNCj4gICAgICAgb2ZfcGxhdGZvcm1f
ZGV2aWNlX2NyZWF0ZV9wZGF0YSsweDYwLzB4MWYwDQo+ICAgICAgIG9mX3BsYXRmb3JtX2J1c19j
cmVhdGUrMHgyOTAvMHg2MTANCj4gICAgICAgb2ZfcGxhdGZvcm1fcG9wdWxhdGUrMHg3NC8weDEx
OA0KPiAgICAgICBkd2MzX2lteDhtcF9wcm9iZSsweDIyOC8weDczNA0KPiANCj4gRml4ZXM6IDg2
NzY3NjI1ZjUyNSAoInVzYjogZHdjMzogaW14OG1wOiBkaXNhYmxlIGF1dG8gc3VzcGVuZCBmb3Ig
aG9zdCByb2xlIikNCj4gU2lnbmVkLW9mZi1ieTogWGlhb2xlaSBXYW5nIDx4aWFvbGVpLndhbmdA
d2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMg
fCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gaW5kZXggYjNkNzI1MmJkOTEwLi4xY2Y5NjU0
MGI2NmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiAr
KysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gQEAgLTI2Myw3ICsyNjMsNyBA
QCBzdGF0aWMgaW50IGR3YzNfaW14OG1wX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICAJZHdjMyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKGR3YzNfaW14LT5kd2MzX3BkZXYp
Ow0KPiAgCWlmICghZHdjMykgew0KPiAgCQllcnIgPSBkZXZfZXJyX3Byb2JlKGRldiwgLUVQUk9C
RV9ERUZFUiwgImZhaWxlZCB0byBnZXQgZHdjMyBwbGF0Zm9ybSBkYXRhXG4iKTsNCj4gLQkJZ290
byBkZXBvcHVsYXRlOw0KPiArCQlnb3RvIHB1dF9kd2MzOw0KPiAgCX0NCj4gIA0KPiAgCWR3YzMt
PmdsdWVfb3BzID0gJmR3YzNfaW14X2dsdWVfb3BzOw0KPiAtLSANCj4gMi40My4wDQo+IA0KDQpU
aGFua3MgZm9yIHRoZSBjYXRjaC4NCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1
eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=

