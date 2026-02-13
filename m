Return-Path: <linux-usb+bounces-33350-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKfYMJu2j2mpSwEAu9opvQ
	(envelope-from <linux-usb+bounces-33350-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 00:41:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36A13A085
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 00:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6032C303FFDD
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 23:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC19933D506;
	Fri, 13 Feb 2026 23:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PN+6sKEW";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Hs14ZGgE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qcOaj6eB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B28285C98;
	Fri, 13 Feb 2026 23:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771026069; cv=fail; b=UGhckjbplK31+cSU6ofc3nXUHhAqdksmV18I3OgCkqoCZemuNbaCdedLXaBJxfCxRxZrwBO3ixxloIjlux5uhP6G/hr4uCMO2sw8n9Qktqw2LMql3KH1WXrrrTYxcWDJrmEO0QMeLdhnghNFIQFH79Mv/ZaaSqK5zwTu7E0d3ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771026069; c=relaxed/simple;
	bh=/3CSLQnNxRIfEUN46tQxmQ/bTe08GSM5uW9yy+bN4gU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IxZVhPIhYzAFmHhxC4/dOPHWvmmtKgzj49P+B0RTpKINUrijTqGpT5U0KFZ3KVTg7/AkvIE7embClTpqcTO8qfcM7y/cQgh4UKsIsTI2akxJL8FmgrC68QKjRV4kgDHyxtuh+TkxmN3JS/6N4CYSxpE9WgGUyKu9wSTDDciytMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PN+6sKEW; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Hs14ZGgE; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qcOaj6eB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DLAnLR1490628;
	Fri, 13 Feb 2026 15:40:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=/3CSLQnNxRIfEUN46tQxmQ/bTe08GSM5uW9yy+bN4gU=; b=
	PN+6sKEWlScxmgRx7XMUdTetjsvNScqMT0xNsvBOp5ruLKk6AmcamuupMT2dog+c
	1W+v8AUcxme3igGoqA7tiEqTW1kvDY7GpjPYs7g+s0wZX6a9aUuiaOG5wUeNk4wJ
	Z9LFcazoO15dqv9LzoBJnxLvoMedlrrkHH/khYXueTD9b/uIK/1SV+pu5x1JJCsI
	YHKa/XvUbaXwyKglZyO6SmqJdrC72Df5NGfSLLDyh2YRLemYdTwdCfUfFsOJ+3/V
	y6lMbo+rN9EA2HcAU2sPMVIVBnfu2+GxIkLWiy6UP4vXLWVaS7buQhu43RJ0j7w1
	sNoipGpf9I4BR6p+TPde6A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4c9paqx967-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 15:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1771026031; bh=/3CSLQnNxRIfEUN46tQxmQ/bTe08GSM5uW9yy+bN4gU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Hs14ZGgELhzugqCLKAjSugmsVCE1o055mYWW2AjOi+18RLn74Mmb1ymjASHksOKr5
	 WXstjoBmjcSPHtisjaQD+4UiERujEe4IKektrj464Ln/xSPFWzFMT0NydXMvJFhMM6
	 siiPsRLzy9VLCb7pxZKES4HLgAhgiC1KEPcTO6fVtMXhhgzGEvEi9ibY62/owhHPUb
	 bpKU+FGWsya/+xX905fS7l9tRCelcK4NKTDPMPu0NUV32HEpI7e/X97IZplyk9Tpb1
	 uPOkUnSzRMekWcRHaReVpcVCW5LwSehTDSXVGH3KODSdsryzKVMhxH/cZoh4P+DlRu
	 k9pxp1oeHLBHQ==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 366ED401EF;
	Fri, 13 Feb 2026 23:40:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 7A9A4A0108;
	Fri, 13 Feb 2026 23:40:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qcOaj6eB;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00305.outbound.protection.outlook.com [40.93.12.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 483904021B;
	Fri, 13 Feb 2026 23:40:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcEW1sASzqCNCV+ZH44jXKpwAb+7mNJ68aL7Z/HaktNb9JdFxD1WiMZlwEjIDqBpqEnjqNh0/Tl07utIVJXiXpm1Jimu9AFWMBmnpUoU3DI2piUwZZqHwI0+9ct5xOYTsFT1W00aXJoG96vrqoZJBUJUdahfAl1DfYWYOctqxVCPGUtXJ+Fj5h24IepDua/HVggdzTzzZpUZeLxn9lEEKDG49qyeao4mG75bZcalNj520dVc8BNdz6qHhvntcItnfer/LwTmkuB/E/jBFarZE/7LES6vF9sQspTJFDPqdUMLhDHSUOBMQnZCWT6qq1faP0e08cX4uDhwa/jt57SooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3CSLQnNxRIfEUN46tQxmQ/bTe08GSM5uW9yy+bN4gU=;
 b=bwi9YXAi+3zJB5EOLMOKSKlyioYvLjdcx92YzMlG4WRhion4a8yZJeqOaB2aQUBBnTQtqsRVq2XJbgu1fqrk4+9WF8q3/TEEdIMpI0oM7xNhGeOClwbv1V91XFEDcP1c7YSzCAijCU78oOLW4kyFEQ7jagJ3kNFjaquAhHVa82cVby92HEdw7n9ba9B3L3EVa83bhX+WJeV+Rh1TXo2qD3XFX2uPJ9ofC+6i5rL+uDi4abgv45y93WMysU9zTpX4DwWaWUawvfLj+NyKi+9txMZzu2Fen8lATkLLG7x7XwPsE66yL49JSv4SGSLEnhBW87pwNgbH3afyKQR3o0nmGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3CSLQnNxRIfEUN46tQxmQ/bTe08GSM5uW9yy+bN4gU=;
 b=qcOaj6eBe1E8KUMMTmE6NWpMonLab/Yin8B9upj0PFRm44TxLwROo2oQL9ih84WN06BSrPz1xplMQAUglfK6eA+KAwtR9QDNjGbQjNOhk7QREjRLBg5Smog4ZRFrRgPdGMqMu380gQKT377ygUWtoh1TRzXCey9HccRHfY8B3MQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB7701.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 23:40:26 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9542.009; Fri, 13 Feb 2026
 23:40:26 +0000
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
Subject: Re: [PATCH v5 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Thread-Topic: [PATCH v5 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Thread-Index: AQHcnAN6DghDQ79LsUOzAZCku2ULkLWBTDeA
Date: Fri, 13 Feb 2026 23:40:26 +0000
Message-ID: <20260213234023.ikgr3nene22i4ff7@synopsys.com>
References:
 <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-0-ff04a75ce221@nxp.com>
 <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-3-ff04a75ce221@nxp.com>
In-Reply-To:
 <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-3-ff04a75ce221@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB7701:EE_
x-ms-office365-filtering-correlation-id: 8278d782-7257-46a6-8aa2-08de6b5943b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bE1JUUp4OXRBYnVvdkdnQkFWNWNhQmZKaFdDS0xaLy92WTVPem1FTENyM1lj?=
 =?utf-8?B?Qk1mNGN1Y21JV0VDd0xOQUpVbVh6eVM2bHJTUjVlTi9EMkppRnJWQmlJQlpv?=
 =?utf-8?B?SFRtYkhPY25wb2dWS0VnVGtDV01tWnhrM0hEWk9xQkFlbG80cDRiTFZiRDUz?=
 =?utf-8?B?VVg3blBNcndsQWpndmpkdHdteVNvdk9HbG1oS2JiRmx2YjcvQVJSSGZDMERN?=
 =?utf-8?B?eU1EeGJFNWdvd1puRmpXSi9TMHQwV2ZDNWMzZjN6Vkc3YWpaTTdlenRibFRG?=
 =?utf-8?B?QlN6ZjVUZEdXdzZza2d6cEJqM3hySVZIQXE4OFBCeC96aUVhNHZrd0pFSUdD?=
 =?utf-8?B?R3pZV2t2TGJlVzBKRDFHTlhTcHVEMUhwRFF1TUZBK3dzSDNjTGFJbzB3Nldn?=
 =?utf-8?B?VFhOOTg5VStDQkdVZk9lUFYrMmwySVFxSnJZeHhPOG9BSE9FM05Hc3dHK3Vq?=
 =?utf-8?B?WU51K3hCT0t6dndTUEMzbFlPc25Sa2pOWHhUaFRhaTVPMmYwTmg0Skx1Mkhr?=
 =?utf-8?B?d0ZHMXpSSTUvOVFCMnV0OU53K0ZYQlBCZENDYmRKOThBV1NCaHc0c0xxZE42?=
 =?utf-8?B?S1JGR081Tnp6RWVjcW0xMHI0dFdGMzlMUjl6dXErVmVpU2NId1R3MjNSWmhB?=
 =?utf-8?B?cWw1NGJ2WW1nc3ZDTXlVVE5QMjBPUDBERXdxbHZvZFpiMTBjYk43TDJCdHl3?=
 =?utf-8?B?Y0FHaHBHclFLRUs4dndKWDllR0xCWVUrdmhXaXUvbFlLSGdVbXExYThSbzBL?=
 =?utf-8?B?OEJGaFFqTGpOWGJncGNvWHpzTjJ1YmNpRE1KQmc4d3BUaVVFZjZmQ01lT0Zu?=
 =?utf-8?B?dm5xOEFqdHdEZkh1L1dJZ3lQenZmMmlWenJwMmM5L1VwR0I0THZzbVVZWmY2?=
 =?utf-8?B?ak4zQVpzVThBTklKMjRORnBhSmFEaitvNm9WbjVrOGhTOW1yNGhhakZzQU5l?=
 =?utf-8?B?Mjl2dTEwMmh5d1poQ29ndmY5b1BxSllnK3BGeVJ4eWY3SEJtcXNsNmpUS0c1?=
 =?utf-8?B?dXdLd2MvUVFHVkM0Umg2clgwLzJNQU9jUi9peWNNamRmOFJNbnNmSmFNUitY?=
 =?utf-8?B?NHZMWGljb0VZZzZQRGNqdEJsWUFrTHBWREJBY3R2eDk3L1RoMUZ5dnA0cUdE?=
 =?utf-8?B?aDJYanNWMmF1TEhzRGxoOWVFZ0dSc0RLbXphY2ZyZW0zSEpoc2RINHpXTkM2?=
 =?utf-8?B?bnU4WlBQaUg2a2ttSW9yb05JSkI3NkdXM0VPRXhlSm1TNUI3Ukh3VzdqTzFJ?=
 =?utf-8?B?WkhUMWJPMDFzYmJuRzc1TWJWZC82cTh1d1lnVUJnN0l0SWFhVGFRZkRPSWFY?=
 =?utf-8?B?RlM0ZnFwMUFVUy82TThoLzNsamp3ZDZDVXNyM3Z5NDUrUEZWYS9XaW1venZF?=
 =?utf-8?B?TXJIY0hoTWZiR1IwNDdMc3FqWVZsN2dZUVVCRy8yL2tXd0NXd1RQUE91UTdX?=
 =?utf-8?B?alBOTEVKRS9pWTVkSXZKOWRXeDNLSmE3MDd6QkdQOEdHZmxpd29wWHFlNFdh?=
 =?utf-8?B?K05EL3d2OXgybjlXWG5JRElzTWI1eDZJQ1BjZENyb2ZIdk9aZW51bU9ZbE1t?=
 =?utf-8?B?VndMZkJBNzRqaFFROEZwUDZLdEtLSFNGcEtpcGJkeHlYMGpJSDI4RkRRcXcr?=
 =?utf-8?B?VGI1S3YwVEdsSTdwdXVIVXg0dERxWml5U1NtQkRWRzJvZXJwSjA4dmZZT1lK?=
 =?utf-8?B?ODF4TTloN0EwdFJlZEpMcDhOdk4wMWlmd2hzY2lieTJteGFRRFlMdXVyZllt?=
 =?utf-8?B?b0FDZXpQN2hjeStFd0lLcTFDNlAwdmVmdEhYNFV0N3ZIeUtZRzNwZ2ozcERP?=
 =?utf-8?B?UW9wenkzT2ZhVzZ5R0JaTllBdjczNDNyOUYwZnJQN3lOY1NMczNFakNkNjhr?=
 =?utf-8?B?dlR2YzM0Q0Y5TDB4bnFyUjlocEVKWENqK2RkTE03MVBYclpjOEI1di9uTC9R?=
 =?utf-8?B?M1RacnluTXpFTTMrN3RoeWs2Y0pnZ0duV1k5amIwaGhSR2VQN0IwUnFqaDdF?=
 =?utf-8?B?WjdncXBNWldIMTl0SnhPK1RlMkRZNmQ3SEZHTEJ5d1VSaWpFbC9FdHoxcU9E?=
 =?utf-8?B?NUdNQzNtVFJUelBNMno4SkVkTnB4cGJ6L25PV3FMM0VrdEg5elVZN3lGN09w?=
 =?utf-8?B?VXJVNUZURHlkZjZGK0lEalFHZ2Q2RWt1U3JFalI5aWtmbFFoWFQyV2xXYWRn?=
 =?utf-8?Q?5GIsbt9cdcMnpMY/tdMt1SE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUt5Sm8xZGdBWTBpODhwZEcyV1pudVAyRThwUXVPTUxWMmcvaVYxQ0tBTldF?=
 =?utf-8?B?MG10akJocHoyOFJ3eEpMK094VytoWDNHUjNzaU1WVEVjVWQ3SUdpcnJzd2pL?=
 =?utf-8?B?OEloYU83VGtRSlY0SnhFMmNRbkNkczdFajJ4WlY3dWJiVkNBbGlrNmlweVA0?=
 =?utf-8?B?RFlzTDJCbDdmWmVNd2k4ZXhvMGxLRW9BTEY0YTVJNXhJSEI5bE5GQnRic3c5?=
 =?utf-8?B?RFcveUxHVVlFaWQ1T3k0VFpQcjlaTEdHYUZKaWtoVlgvR1VBYjJrYmZlUnB5?=
 =?utf-8?B?ZEU4Q3J1QkN2eWNGbTVDZmowRVdnQ1IvK1FrZzBodEk4Zy8xRjJvY2FEV1ZQ?=
 =?utf-8?B?TXRDcG9JRGFQMkxvK1Y3QXNxRlE3K0JFU2RVenY4U1dQcXJWV2NVV1hXdHVy?=
 =?utf-8?B?alVRL1R3WTNJZVFFbU9hcE0yeDhCTTREWGc3YytUcExkQTBFR0NNWlViNUkr?=
 =?utf-8?B?WkpmQ3VSZnlObEJyZFB0cm40SSswUy9yaTY0cjhYcWl4NldpRUpjVStURGNS?=
 =?utf-8?B?eStKWWQ0ay95VHdobUlySXV4azFKQThHcHU1NFkrTWpkamtFUUcya29KbThq?=
 =?utf-8?B?Rm5WcXdIR0xYVkhlRFV1ckM3Z1JvbmVxaHE0ZmtZcjczeTYzWTh6WUU1Zzlh?=
 =?utf-8?B?MTlWNUdhakMrRVI0Q1JVM0Q3U3ZlQTB5VzlxSXdselN6ODZVRmVJS1c0Yy9q?=
 =?utf-8?B?b1ZRVVlPRW9RN3Z3VFUwaXpXL05QelpmbGRBaXpId1R1aG0yQUUwUmVQR0sz?=
 =?utf-8?B?Wm5ZbHRpckd4M1k1Mktnc3o0R0RyOFh0M3ZwQ0ppdHRUNG8ydGhxU2pwMlc2?=
 =?utf-8?B?Vlk0TDY0cGNKR2VocW83TFhpRjFFZVdZd0U5ald6UHpBRzVyMHh1Ykg5QnE0?=
 =?utf-8?B?NkgrV2wwa25idE5oNGw1b0svZlJqSDJKRkdTeFlGTStWWG5FSmVJbG40TzlZ?=
 =?utf-8?B?azVadTl6NDlYbGZsRDBzYnlxeE5ISWZlM3YrZHdKT1pxWHlDMWExOXI3emVN?=
 =?utf-8?B?ZWlJSGpwYUEyc1BFaTNXTFl2TG9SQ0drY0dwUlVMUldaM1VqMU40YlRabFRk?=
 =?utf-8?B?VlhTek1uR2ZERjVHdFd3Z1c4ZENmcUV5N3h0UXFFblRlSlhBazJRNWpqejFV?=
 =?utf-8?B?NlJDSGJCSWJPTElaeHkrUHdvU2xMMTcvdjMwdzQxZ21uMVphUGV5c3RxVjhO?=
 =?utf-8?B?SmZuQ2NKbmYxNlB5MSs0NXVKZEsvOEtHRUhyc3NHNG4rQ2F6SzhKck0ySWJM?=
 =?utf-8?B?R0xaN3g5MWtGaDdFRmpXMjVKOGp4MkE2OXhWUDVQRTNocnBITkIrVG5jeTBk?=
 =?utf-8?B?TWZIU2xQZHR1a2xVU1FwcGlrM2FlME94T2EzaWZHMlJQbGN0a04rNThSSkVq?=
 =?utf-8?B?c1dreUtLdzVuZkZIWWdBMnR3NlVWQWJRM2RkdENpRFVHMmlmREo1dkgxQ3VK?=
 =?utf-8?B?OUM4RGN5d0YvQlVpOTFOTkNUUXJrM1VPNG8yVjA2VThqS3JwU3o0RVZhb3Zo?=
 =?utf-8?B?L0hGMkl0eDdXVFZOQmluTkY4aTA0clh3Lzh2U3IzZzhXOEZnbWQ3NDQvNjBS?=
 =?utf-8?B?L1h0NWVQeFUvSDNWRTZQV1VEQTRDU2tBSTlhTFdjQkdESitSOW9kdUhFTUVF?=
 =?utf-8?B?SUdnYlZGTitYWHkyNGJVbmJ6a2h0OXZVZThiK2VCK1RnWHBsNnBjYmt2ZjJk?=
 =?utf-8?B?TEhCR2Rab1AwYlQ0TVZnUjNHb2lWWEVPdjBYd3k2OGs0S1YxT1pLdm1YcWll?=
 =?utf-8?B?aDRWV0Q0MmtpK3MvY25Ba2dqeG9LcmF0QVQvUGd4RGV0T0RScmdUN0FMeVp2?=
 =?utf-8?B?S0JzVnB3SnE4MnZlODdnWlN0N1RhbGlrSXpmcWxsN3BmSElmcTd6SmpCRE5N?=
 =?utf-8?B?cm9TVFRtaTJhZy9iOHcrTFVsWU1Nd3NBNGJvbXFQR0JBK3hYTUhFMHJPc3N3?=
 =?utf-8?B?SGxsdU5QOEFBcXR0OUJsZlppU25JQnlsdlFPQk9KZE1NZG1HZFpaVGR0MUV4?=
 =?utf-8?B?Y2U2VEdVQlRMa0hDU0JPZDhPQ1dzTWhwVWdrNkgyRERaWEJya0V3NDFpYTFq?=
 =?utf-8?B?eUU1dEt0bDN4YTZQYXFuTTE3czZYWDR6ZEg4RTl1RlFOZk5GZ3duTzVaM0hF?=
 =?utf-8?B?ZmpySFZ6SVdZdWIrZEk5UGZ4eEZnamlQUFBhNHVRUGtrdUsxenlvRkJUcHFh?=
 =?utf-8?B?QzR5SFJCbTRrbTR1RkRuV3I1dUNSUTFHcmUvVmIvRWlaeGdWRmRTVFUrVllS?=
 =?utf-8?B?STBSSzc4VitlSndHZDEvcHJPNFdLRk5teG82ZXFtY0M5QW44bFhwUHlQcFBV?=
 =?utf-8?B?bmIvU1VJQ0dFUGFPVGxtbDF5WWhWSFNTYU5wbERNUFVqc0IxNW51UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A5C7973C5D84F42A90AF3F9EA7F5A9E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FGQ/2znP/Kn5qvkw9IHZ7NSAnGIEDoD9a/XP06XupfTJAlH2sLjjDIzkMbc9bcPiG3CThhdow9IWSh/aicWEEPUe1ryAB7t2czkVMMEWvqGsyafW/j4sl0ySUDAgRluWYfXqpwGCyom3b1gzzwqnXB08PDNRMREWvenwy5Z/Ci43jMO3x9lS4XOiKBkfCiHxPEmm/ZAuwFvlRNNzK6ZuB9IcZCdPSJK6nFE2Xpx2JScGlqzgcCTBWp508dT6oJtwJjou9ZpjL6DsXayFxH3zKjvIgoSFGLv+OwOx6aR7cSRAcqb1J8NUCqNXOMi95+Zty9uUOvdkxWURJTw4cg6VCXthegFebaS71WebRLrjSFqPwTCFIIXvs/uJ2wjAWM1Yio2wm5vBrbSD7VpyF9AbpRvOLfL6C6OVIFnKvyxsUJaecwxboXxBxoMwK4t3+U1UgbZK/QeYX5rtJCiyJntVtwXxY/XTeuMttAhIr2cdeXUUcX7GB7kWM5SXQFwiXuhlKQrigsPs9kF6lP4gKFX+mEIMM5WwnQEoxSTWIog3QccTM0X0xMDug0pAZPYNtyBLzDjgg5L32AcFM8ZOpRmkVGnFPcnFDs3+T551+DWyvJ3l9r0lt5sXdVOKxujXQvpEynvPcoBftYZQfxUGbO11jw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8278d782-7257-46a6-8aa2-08de6b5943b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 23:40:26.4665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LHoaW4DkcxOVcEs1YrYQ7/D9jflMAWgKpEu/l2JoIdSzWFgMNnC3d5sDZDLdrW/0m3UM10+G09uyzBwwBUX6+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE4MyBTYWx0ZWRfX2o62R6qjjz+w
 FUWGcS4ZuThL8ownDY5tDSUJfHuACkukIsNwmeRy4rSeuSQ3SIWfdti9ITsY+HpTS8Wk/e+c//G
 2YEJmR0pCJGfn32Eldz87ONWFXyrwRVrB191E3Vm3WLpOk6NdCoGN+6p5QvOx1MVogbKrfZmirM
 hu2g8EGCDUCD/K8Iiti+KexAulv8TDIL71+qf8Gd6Mya9H5HvbFmX9q07CpABZ5yIuYDG5sov2l
 +WecspvoFQ/EUJsFcko9dOilezpQTfKKqNtUxOPncfE/u3blGkqoK8RoZiHif37AnE+2temdzfB
 4v4QGl/xkIfK6ssBf+NN3XmIPOBdxjbRhImFuD2eHUqy+eeoE8XZbCaUMFid0HyRLZ1U5CEx3sa
 HXhOICg+NKi+/VwwKGF2yHZZ9A/JxJhRRBZ2ITV5rWDZapOYRFXQqC1YpLFKolKimejXdFSbV/b
 QUS9aVInll9X9AsRaxg==
X-Proofpoint-GUID: ING8MM2L7Kzw7cahSkWNXWIlrKmHFu_T
X-Proofpoint-ORIG-GUID: ING8MM2L7Kzw7cahSkWNXWIlrKmHFu_T
X-Authority-Analysis: v=2.4 cv=LpGfC3dc c=1 sm=1 tr=0 ts=698fb66f cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=8AirrxEcAAAA:8 a=jIQo8A4GAAAA:8 a=LshgB3L_jddeysPf_LIA:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_05,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602130183
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33350-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:mid,synopsys.com:dkim,synopsys.com:email,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,i.mx:url];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6F36A13A085
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMTIsIDIwMjYsIFh1IFlhbmcgd3JvdGU6DQo+IFRoZSBpLk1YIFVTQiBnbHVl
IGFuZCBEV0MzIGNvcmUgYXJlIGNsb3NlbHkgY291cGxlZC4gRGVzY3JpYmUgdGhlIGkuTVgNCj4g
VVNCIGJsb2NrIGluIGEgc2luZ2xlIGJsb2NrIHdpbGwgYnJpbmcgbW9yZSBiZW5lZml0cyB0aGFu
IGEgcGFyZW50LQ0KPiBjaGlsZCByZWxhdGlvbi4gVG8gc3VwcG9ydCB0aGUgZmxhdHRlbiBtb2Rl
bCBkZXZpY2V0cmVlLCBEV0MzIFVTQiBjb3JlDQo+IGRyaXZlciBhbHJlYWR5IHN1cHBvcnQgdG8g
ZGlyZWN0bHkgcmVnaXN0ZXIgYW5kIGluaXRpYWxpemUgdGhlIGNvcmUgaW4NCj4gZ2x1ZSBsYXll
ciB1c2luZyBvbmUgZGV2aWNlLiBBbmQgbWFueSBub3RpZmljYXRpb24gY2FuIGJlIHJlY2VpdmVk
IGluDQo+IGdsdWUgbGF5ZXIgdGltZWx5IGFuZCBwcm9wZXIgYWN0aW9ucyBjYW4gYmUgZXhlY3V0
ZWQgYWNjb3JkaW5nbHkuDQo+IA0KPiBUbyBhbGlnbiB3aXRoIG1haW5zdHJlYW0sIGludHJvZHVj
ZSBhIG5ldyBkcml2ZXIgdG8gc3VwcG9ydCBmbGF0dGVuIGR3YzMNCj4gZGV2aWNldHJlZSBtb2Rl
bCBmb3IgaS5NWCBTb2MuIEJlc2lkZXMgdGhpcyBkcml2ZXIgZGlzYWJsZXMgd2FrZXVwIGlycQ0K
PiB3aGVuIHN5c3RlbSBpcyBhY3RpdmUsIG5vIG90aGVyIGZ1bmN0aW9uIGNoYW5nZSBpbiB0aGlz
IHZlcnNpb24gY29tcGFyZWQNCj4gdG8gZHdjMy1pbXg4bXAuYy4gQWZ0ZXIgdGhpcyBuZXcgZHJp
dmVyIGlzIHNldHRsZWQsIG9ubHkgbWFpbnRlbmFuY2UNCj4gZml4ZXMgd2lsbCBiZSBhZGRlZCB0
byBkd2MzLWlteDhtcC5jLCBuZXcgZmVhdHVyZXMgd2lsbCBvbmx5IGJlIGFkZGVkDQo+IHRvIHRo
aXMgbmV3IGRyaXZlci4gT25jZSBhbGwgdXNlcnMgc3dpdGNoIHRvIHRoaXMgbmV3IG9uZSwgdGhl
IGxlZ2FjeQ0KPiBkcml2ZXIgd2lsbCBiZSByZW1vdmVkIGF0IHByb3BlciB0aW1lLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+IA0KPiAtLS0NCj4g
Q2hhbmdlcyBpbiB2NToNCj4gIC0gY29kZSBjaGFuZ2UgaW4gZ2x1ZS5oIGJ5IG1pc3Rha2UsIHJl
bW92ZWQgaXQNCj4gQ2hhbmdlcyBpbiB2NDoNCj4gIC0gYWRkIGR3YzNfaW14X2dldF9wcm9wZXJ0
eSgpIHRvIHBhcnNlIG9mIG5vZGUNCj4gIC0gYWRkIHNvbWUgZmxhZ3MNCj4gIC0gcmVtb3ZlIGRl
dl9kYmcoKQ0KPiAgLSBhZGQgbW9yZSBpbmZvIGluIGNvbW1pdCBtZXNzYWdlDQo+IENoYW5nZXMg
aW4gdjM6DQo+ICAtIHVwZGF0ZSBjb21wYXRpYmxlIGFzIG54cCxpbXg4bXAtZHdjMw0KPiBDaGFu
Z2VzIGluIHYyOg0KPiAgLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlDQo+ICAtIGZpeCBjb2RlIHN0
eWxlDQo+ICAtIGFkZCBJUlFGX05PX0FVVE9FTg0KPiAgLSByZW1vdmUgcG1fcnVudGltZV8qIGlu
IGR3YzNfaW14X3JlbW92ZSgpLCBkd2MzX2NvcmVfcmVtb3ZlKCkNCj4gICAgd2lsbCBkbyB0aGF0
DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9LY29uZmlnICAgIHwgIDEyICsrDQo+ICBkcml2
ZXJzL3VzYi9kd2MzL01ha2VmaWxlICAgfCAgIDEgKw0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2Mz
LWlteC5jIHwgNDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQ1NSBpbnNlcnRpb25zKCspDQo+IA0KDQpBY2tlZC1ieTog
VGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGlu
aA==

