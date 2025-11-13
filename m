Return-Path: <linux-usb+bounces-30501-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 68061C5A58B
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 23:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C9B534AF46
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 22:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B8D2E7624;
	Thu, 13 Nov 2025 22:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ndgvuUEU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VkV7y5xz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="P6CVh9Fi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B362D9786;
	Thu, 13 Nov 2025 22:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763073560; cv=fail; b=jfF28Nlv9k2Y+H5KxoQTruybmlNcmhd/GCe2Angdf3QKu1phIJtBhxf37spJa14q8lOW6zgaH2z5Je3TpVFlB6sL+6pxmbttG/Du5iakA8YQYmCrF2iLqew8CFZm6eaQu3yInkIoi2km9uBYz32KDUgJGwmBj40t9ec0hXp1PXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763073560; c=relaxed/simple;
	bh=oRksU6OzwhDNorbmfbd68BaPYA+wB/+SrRPHJOcwnQA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VaK3prL25GHMoKO9ZQpq7eQ2nzkUH26CzQ99vHF8KyS/uTbwg4ZIMZspPlo0HNQ90xP4o1OOm7rxD124fiyMel4ro6+9BePw/+DQ36bcGVWT5IFg6ofxEpilGWupcwAIjZml7dFpDkdP9//0Ta4KV9JU/jOCSW70J5XqLpZikOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ndgvuUEU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VkV7y5xz; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=P6CVh9Fi reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMZEJ62681330;
	Thu, 13 Nov 2025 14:37:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=oRksU6OzwhDNorbmfbd68BaPYA+wB/+SrRPHJOcwnQA=; b=
	ndgvuUEUsP3e6sw7gSIXiqZevR1Q93gR62Qh+ogBVaVT6OrNVEJCzv04NIOW3UAF
	vSXUszFsWSJh/dZ1w+uvYZ6E/V+HURCF9WYRTvbo6LjfNMwDgUjXLsRQCAq+kBCl
	qlePMzdcTUkARll7XzLM93paju1NqH9YvdlATMVjI/GGR/aS2OO68zMunq0pxDO1
	q+8uT9LES3gNXMN5oyjARVP0J2rOrwieM1oYDk2cISjkY/9i+nws4ozNS66QbOF1
	yMs/e4EalIDfZFSmhqlCXGhyg1B4rxxLfs3I0NlyqTsNTVtNaSLOuqkDDz//Oj3w
	ZNwGkz2jmfxnzUBXXwIU5w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4adr8eg0b7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 14:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1763073468; bh=oRksU6OzwhDNorbmfbd68BaPYA+wB/+SrRPHJOcwnQA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VkV7y5xzECNLZW79NIhi9DKWQiiO+yUwziQsv2RYfcnQpm89+ymUlaYNxfW50i5ys
	 iS1agSG62oODKwgbuJX4JSXrsLzuVZyyquQUurs+FlozHdI9gNyho919WDVKLzhItv
	 VjPqVFIDi0zm3Mu5SpPPxPBiItEHBOzIPAGPX4HFfHI6I/OIeiSh37XOJffB6o9TTb
	 nmglUhoYCKhSfFA2yxltMeyhKHKQr8v730vRrvpD2lEkkX6oZJy3lVm919/NH5onbe
	 O+1QLMroaagtMSUDYKpgY4C8C/v+f5EtxPrrAuhylX63PiC7jroQ4Gyd1BK7DNXffu
	 Q7zEw4zdZ2krQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 423CC40A8D;
	Thu, 13 Nov 2025 22:37:47 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DDC1AA006E;
	Thu, 13 Nov 2025 22:37:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=P6CVh9Fi;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00105.outbound.protection.outlook.com [40.93.13.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9EAB0407C1;
	Thu, 13 Nov 2025 22:37:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQVl6DC36hx3PYZhr7qYICqgZMdOSrjld+k51jmvu1hVf8BEOmL5LoNivgMs2KcoASJUVJWkduhRL6QWZoty4jLAzxsfQlhwPNa55Wsvv89FceWX6DwG4SDK/t6k0esXd6FdYwQkAUMixDnfLpmOrfOmXAefM3UChi/eMbGl0eHNNKDBiOZY7ny1FVt0d0S17+RfSpfGbkB4/EOV7E2LTNmaE7OvIzyV2thx4Iz/IP5Xy5eBJ2ProEXb35872r0zaLL2+fp+GE0Dy7OmjtlW+kZH3osRx5Daw+4foVGYhVprVmBzEnRTGzGIUWEOGFV/46A6WF86r1gyUANUBam7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRksU6OzwhDNorbmfbd68BaPYA+wB/+SrRPHJOcwnQA=;
 b=u+hw3oQBLfWFj8MfyYCJNNCF8IqYTUZseyJzyGA54lC+VB+IvN+wh2HAH37mHdgykV0hBTvibQ/YbEtIjy3JWkRFYCcmLFaowyfigX1JUpkYl9dsQvD9dxAmWKCCcDJs9ZRWu9rcB2MP/cam4su95l/jaHajU19RE4oHLjiv1bgzFG8elKgdqhGu6prRKw0cmyTWPQWrPpx2QsSTegQwOxaoyQxl74o9NBwtL+6UIFBf90nsoig7B85ZjKJxyr/Hj9R5kPnAPC+wb91I6tETOfToDkwBMkErEbmefwp+Ru8jL2gaWxOaREzexridQPaSZrKd6WaKjTTsrpq8LKu3QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRksU6OzwhDNorbmfbd68BaPYA+wB/+SrRPHJOcwnQA=;
 b=P6CVh9FijoEg3zzsozA2HjZmHXOGxgFoP/IN8r4KPrDaVcw8H2IhqSk90dHk3JyTxqxWrssnAkY5JrBrP7FSvVwaU/X1C9Oj/e6i97kJ4tu3zZZgx91B+FnONbE/tIqA36MfX6ut7pUh6Jo7ZhEPNnFGakg1XfkditbWtwQ/sR0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ5PPFFA661D690.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9ab) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 22:37:41 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 22:37:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH 1/2] usb: dwc3: drd: extend dwc3_pre_set_role() to extcon
 and otg usecase
Thread-Topic: [PATCH 1/2] usb: dwc3: drd: extend dwc3_pre_set_role() to extcon
 and otg usecase
Thread-Index: AQHcTigJpKze7+QaUkqYlMyAGbIJhLTxP+uA
Date: Thu, 13 Nov 2025 22:37:40 +0000
Message-ID: <20251113223739.akelb3tke24gpjpq@synopsys.com>
References: <20251105074504.1427926-1-xu.yang_2@nxp.com>
In-Reply-To: <20251105074504.1427926-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ5PPFFA661D690:EE_
x-ms-office365-filtering-correlation-id: 9ff40301-49a0-4f14-778c-08de2305413c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V0l4UFJNdlhXK0ZaSjNaVnhFb1JKVjhteEhCRnpveitLaGlvZGdNdEk3TTBT?=
 =?utf-8?B?ei9HU1lWUW92WW1CZ2k0ajU0RU1qVTdTa2xzSEE0Vy9icEVoRjdvc21PdmxF?=
 =?utf-8?B?M0NaNis0aFBwRklMdnd4VitUa1FWeWR2K3VaNkk5ZzR3bHJrZ2cyM3ljVlRO?=
 =?utf-8?B?SlpvWU1QN2ovT1RQK0d1Q3dQM0xMVHRFSmp1dDhJMDdpS3lYKzRiaFJrM0Yw?=
 =?utf-8?B?T1FLT2ZyaWZxa2JLVk9mZ0k4a2laTVdLTkE1czhscmwvbnV4UXFvN3hkcUFM?=
 =?utf-8?B?MVhheGxuS0hZTFdPcDNLWWJNRjZyU1dFMDZ0bDYzZlgrZ05IcnRQZXBwbXlE?=
 =?utf-8?B?M2dTMkkwMlZ2cTErTjdqUzdaYWZ2TXRHWHJjZkFNTGI3d0RiTmtsQmVTWWJO?=
 =?utf-8?B?V283RFEzRjdUR05vcSttVitXbExTenkzL2JUUzh4ZDY3THJCL1dpeS94UGU0?=
 =?utf-8?B?S1NNdzR2WmtET1lONlBxaEpUdTA5SHFpNlFvaDY3ZkdXZ1dzQ0tJLzF1cXpH?=
 =?utf-8?B?L2cxNytkVXNwcUVISE1Oemk0MHZvZ3JWbmVoZTBZWkkwUlo0OTBXM3laVUNZ?=
 =?utf-8?B?VGJ3Q3BDRTU5WncxcXdQL1NmSFVjbUpvbUMxOS9sV0dqbllLUEszUG16SElO?=
 =?utf-8?B?TzhsckxSUEtSaEdhZGhMWWFSM0RCOGRCdkk4ck5ONHVZRUhneVRITEF4emNV?=
 =?utf-8?B?VExKeENhRWM2K3E3VEZRZnBaaUhpTXM4RldFbDN0VTJTMVc1dURuOE9XZ3J5?=
 =?utf-8?B?UWx4dm5sMzdZTUZjTUxtWURWa0VJc1hjbGg3Q0Y5R1k1Lyt5NFRjd0ZJaWpm?=
 =?utf-8?B?SHNxajJIVHZFcVEvVUY5UXNmUmQyZUpER2wxQldERUJsRENCZU9mS0cyTEtF?=
 =?utf-8?B?Vi9QOFM3TlpzM2RFcWtKeitBaTFFSCsxSlJVa1Jtci9taVpGekRRL3V1UU1D?=
 =?utf-8?B?TUJLQVZ5ZmNuemwwWmFnaTlVMERHK1VSUlZrTlhzd2FFWVY0VmRBUk1BTFBp?=
 =?utf-8?B?RFBMU1ovSS9HQitqQWVvZFFXWW9KaFBGbHBhUlZoVThxVG9YWUZ3aUtHeTh0?=
 =?utf-8?B?U2ZZVzBsYXFvQ0R4SEtva0YyRlc1VzNGVEs2RHRVNmZvdjJvNlpyaVpDSGtJ?=
 =?utf-8?B?QjlWUlppNkpBcE4zV0dHV3Z3SXFaZG1tSmRKWERvb2xRMEp5dmNhaEM0dE1C?=
 =?utf-8?B?ZFF6MzlSQVBMSlZLUUxoUGZmRkxTWHJyMWtIWTA1TjRLZ1hjMlJ3bzlPbUxL?=
 =?utf-8?B?SXpwSG52WFg1Y2oxK1pndXJ2bk1Sb052UDRYejlXV09DNm51N2szOEk1NXNh?=
 =?utf-8?B?WUcwdVJXMlgwc2hXYy92MjhVcTB0MUw0WGYxUlFTQ3NpOEFIZE9BOVVyS2VB?=
 =?utf-8?B?akZkcHl4SVRQcE5rSTJYUDVrdW9mSlFYUlV5ZC9XQmRLVTNyL2JHTDVBUUtr?=
 =?utf-8?B?WG16d3UzZXl1RnllRDR3NGN1ZUJsL3VOcHV2OVIvQUlEQkZveG84dUplTGtP?=
 =?utf-8?B?Z25SY1kwME5qbDRKZXp6MUNPRW9acHc4cXdkYldIOUVSZEhycHJWekI5ZERT?=
 =?utf-8?B?TDAyaEpUNmRESzdoZ2ZLcitNd0NQWFpyZGRQU3dWUyt1MjBtaWw0YnBlQVRi?=
 =?utf-8?B?aDRNTXoxeTh6dll6TXdPMnNZcmJKNDV4UmlHK2dhaGpPd1NnWnQ4VGFKTkdj?=
 =?utf-8?B?RmFTYnpMU3NkeW5ESVVTd3QyQUI3cndkdVZSamlLQ1M3OUNLTmdZdHVFNWRz?=
 =?utf-8?B?ME5WcklGM2tYRkJQblVONTYwS3J0OEgvRWYvWjRFYVNtQW9DbXZ4V3Zpbncx?=
 =?utf-8?B?R0hLWk5abmJPWFVqVkdXM2dLcVp0RHdMSEhic3Y3NnEvakRVS2M4eDhJVVdj?=
 =?utf-8?B?OUpsN25QbVdCTy9LMDN3TjhGS3ZYRXp0MVFxdmNmT3JoVlNyWk1Cb3ovMFF2?=
 =?utf-8?B?ME0vTE11Z0I1aWppcURLMElQR2JTMk5QY0hCVzVWSk5oaVNoc1BVTVc4Rktv?=
 =?utf-8?B?TTF4MU9HdE9Zbkxqd0NNSFR5Tkh4M3Q1cmFxSEJQNlMzWlpLeXZSb01jbGdY?=
 =?utf-8?Q?wc8LdN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTZlanVqOFJkZ0k0Y29VZ1NrZzEvaVNxTCtNcGQyNUNXTTZsMWV1RGFYRU94?=
 =?utf-8?B?UHRDVXVlWjBJTS9XVWxrRmpQQnVnZmFkRmxMbjU2SExJQkhaaW94Y3FIWXVT?=
 =?utf-8?B?bDdyM0l0WkVnYXc5RG42YzVWWEVyMGRhajNUZEFmM1RFQjk0TFUvMzloNnhu?=
 =?utf-8?B?dEl6U3RieURZZ2xwVGkyQjdJQkpMM2JXUGFjcTFSWjZ6YkUrT2tJN2w1VmYx?=
 =?utf-8?B?ZWVkMnY4VmkyemxJL1F1czVtcEdlMWdraGRvNHFNcTFlRS9ham1qMTlkVXVX?=
 =?utf-8?B?NG5wcnNWTWIyR1M0U3djY01WWW9hWHlEcXEvbDhHOTFsMVgwVENCbHdBNnJR?=
 =?utf-8?B?eC9tNHF2VXpRbFZ3RmNmTzlUYXdaRFV5SjJtUnNMRjhROFNQejZiSm5QMUNK?=
 =?utf-8?B?Zm9jUWwzcUlOVDFEdXRTYTBHV2N0amxyampxbHlsc2Uvc3JGaHYvUThML2l0?=
 =?utf-8?B?cm12YVNVdXkvRWVhQlFlc3hPczVkeDArcmlTQ1hBb1g4WEo3NjVITUcwbWI2?=
 =?utf-8?B?V0ZzeU9wdFkxS0w2TDZ2aXZzU3MrQmpsMVRmdWdsR2s4WFBVdy8zV1E3NnVU?=
 =?utf-8?B?OW81ZHdSYUVxamQvQzZpSkVwWG9vZUJIeG0zcktTQU9rMWd5Q0JSUlVUblpG?=
 =?utf-8?B?aFZXRnRPL3NlMmVaTkdRUk55QXlyZG1tR0hlbm84RUw2a2VpSElDREZBNmFu?=
 =?utf-8?B?UXlRU1BQaDZqVi9MdDBTbERZRU94cGZQYk4za21sU2gwYVBUcUp2YzNrYmdL?=
 =?utf-8?B?QjdTNGk5UXYzRSsvL2xpZ1JkZDlNem1EZjdjN2puVWluQ1NOV040YVAzVFFu?=
 =?utf-8?B?WSs1dWx3ZUpmM21OSi9NWEVUT1BNNHJFeE1TRGo4MkY3aC9SMDhzT1pLUkFT?=
 =?utf-8?B?VGh3ZXdxVlZsYW80dzZPVTZpVm1IajEyMktObnlvelRHMi9ZUGNSbUFLRHlp?=
 =?utf-8?B?aVJLTHR0ZGJWVU1nRFRPR0ZrVHlwZklDdndXRStwWk1SQy9KVEVIWFd5cWtw?=
 =?utf-8?B?MG0wUTVYcmV0ZFhmbkdweEZ2T0FTK1FjYWhoc09vRGgvaDc2UG9Rai9XbjNz?=
 =?utf-8?B?ZCtvM1BQTGpWL1BmVEFTRmdWa0w4K2hSaVhlUHVhVEpXdm5IQ0JCVThLK2Nm?=
 =?utf-8?B?RjlWbWNNcVpHU29CM0V0d0JmNEJzS0JzZlBmK2xnWXV3K0luRnpOOWFQREpo?=
 =?utf-8?B?ZHUwcVQ4UVBOYUoyZXo2NzUvbjc3ZUtNQWZvcXAxRXlGZU5oZXhTNEFSRHM0?=
 =?utf-8?B?QlNzbzYwN3pMVnppSXBCWmh2YU4veklyVjFJZ3MwbC9zNWNkMk9LRUppNFJZ?=
 =?utf-8?B?dnpJTERGS1RwQTdFUGZWOUVsTFovTWVIZlRTdk5TNTdLSVhSa1hKR1E5R3Nw?=
 =?utf-8?B?cDMvcG1DTXlPbXFRTDlHRVR1VjBOWWJ2emErMWVyU2lTa1hDZmhpaFFueUpK?=
 =?utf-8?B?elNXMmtXSmw5YUhiS1NIcnQ0Vld4b3V1cHpHZWtpckpnWkdTVFZDVUpHTVlv?=
 =?utf-8?B?TWZ4Um9aWkNTcVgzbHpGa2FpTDVRNm1PRkFrVTBmTGFxMjd5RFphcDM0Sno1?=
 =?utf-8?B?R3NsMVh6eGlKYW1RMjhoL0FTNG9ZTlhvT0ROQWF3dStLc2l3L21VakFReHBQ?=
 =?utf-8?B?TUdYcGIvYnZuQlRNZVpqVHJLT0Jibk5lR1RLZ2pUNGplM1IvVjlyem5KR2dR?=
 =?utf-8?B?blZKRU5pTlJ4d0svNS8rK3VhVytuQk94VVRkaTRjN0F6Y09hSTVMa3BQcU5i?=
 =?utf-8?B?ekZGK0paVVB2N3JQYkhVTWNQTjlXUkpZZ0VySGdVM3NhNXJyUWVMS3M0aW94?=
 =?utf-8?B?Y0tMcTgyN3pnOHV1SGtPekZ2SGJVNnVZTWJwOVZGUEl4VFV2QjFQenQ0eHU3?=
 =?utf-8?B?U0ozU2JETWRCTmhkT0RCR0k1NFcrRnA5Wmw1d3N4c3hNQS94Q0JoeXFnNEk5?=
 =?utf-8?B?V1lwT256M096RnBOSjRQcHNTUDFVS3BybGlSc3JWT0d5L2FPWEFlY092S25i?=
 =?utf-8?B?UjlsVytHQTZxUlBTUXFZM0ZpVjdPeGtCd2JYazk3MzR2T1BBeTZWSUtiTG1w?=
 =?utf-8?B?WTkrSytodWx3L2dEdUlpS01OcW1LVWNibG1LRUFBRHRXemRCMHRqT3pSNDY1?=
 =?utf-8?Q?HiMTtcA/9pfSpm5wbSIRbA2T0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9731E254FA271249AEB711C9B92E3491@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m2123ABRq6TvIjRr9KK4ttnhqkhL/MHkVEmTkGyeqvWrSO9m+aczdvsogHhyJTrN9TglARZsHSH71dmWuhvVjYzeGslhz1s6y4YfPQK79+Tw5uEG3lJSMs3P3WC+RytYHI/aHC5bVFcwZKAKJCh2/b7i5wxQJiiQbPJuep5eqextiPU4hUOJdXk1Mb//ajWEeBR8Vrm/sqbPEkVcPfOcQqza0IpMPa1Vhld/oHAhxYjf8Sxue0ml+sAozYAC+UvY7hZ+ELMkHrigTUFz8XF043zxhWUll8U9dFVRTsnJH+5KoWQp7/Y+YFETuObQjQrHy70WulccvB/6yL20oqYJ5YdK9ahTVD+S0WFtTvoS1GDdWTMptcFCEgkV+ms8GYN1Xqza5L4rn2jz5VKXfOA4LH+hdZZ3rX23Wf0FP/1C5MzHla8TL5aoUtz0WfXgp/CqewJQ4+UC0mO5TRAgftlLFBkkU1Piud9AwrVxRDKrZ7mIn6IEmJUHnVUrgadeYc43PmDXWmEpoa06HtjG417hkCdQgP7IHPK3bLcFujPjUvzhTUPAMALnlUcf90GFaKIRCP47X5TOQAHCWCBWpaGN2jUzTNioESLyo0ShMjjlpgKLb76/qhazCuiFhYjezHQHgcsSblxy69sBCrJ+53awuw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff40301-49a0-4f14-778c-08de2305413c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 22:37:40.8817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NYA5jHzrvJqAYb2dCThSrG2POTEVaVjOIOfeAv1FhaHf/TMDGwHyw+0G+1Pfw+5+a3YNfv76s4RYk+crqyBfWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFFA661D690
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE3OCBTYWx0ZWRfX2V7hKVbrCpFE
 5GmlkEZR1N5ql/YsQ3jrwIkiAguA9F8BHtypXf7Hzbdy1AuCS8nokbtxpcHOoyL4KVGUY036DVF
 3k7AKBQ7inO7aVE1EcbifMfiwmBm8KjEYj6Den3am0Sy/hf961X+izvXt13yNMRLAlXrmVhOBnn
 6N2Ax79wUnniUylrTE2WwBSiZRQSYBQKBObPYo2qN0El5Yqa/YSkXsoX9PPy3+C4ULUzxuEZHuf
 EZv7ZFWMRMt+EH+/V9dEikaCtHmm6s9rI8aipgweHxRh+eDtDw3kpSM0S3KNXZZ0L8V+0v+9ZKP
 jdcS5Ps5+WkoVa/BQIDd3q0VVDTnmlDQxIG/o8jVg==
X-Proofpoint-ORIG-GUID: -nQd-6Whu7Yj4vCKBIoO602hrhcfflR7
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69165dbd cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=jIQo8A4GAAAA:8
 a=qq3VwpCDb1NAyEX0o-gA:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: -nQd-6Whu7Yj4vCKBIoO602hrhcfflR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130178

T24gV2VkLCBOb3YgMDUsIDIwMjUsIFh1IFlhbmcgd3JvdGU6DQo+IEV4dGVuZCBkd2MzX3ByZV9z
ZXRfcm9sZSgpIHRvIGV4dGNvbiBhbmQgb3RnIHVzZWNhc2UsIHNvIHRoYXQgdGhlIGdsdWUNCj4g
ZHJpdmVyIGNhbiBkbyBwcm9wZXIgYWN0aW9uIGluIGNhc2Ugb2Ygcm9sZSBjaGFuZ2VzLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy91c2IvZHdjMy9kcmQuYyB8IDEwICsrKysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9kcmQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHJkLmMNCj4gaW5kZXggNTg5
YmJlYjI3NDU0Li4wMzFjZmQxMjMwMGEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMv
ZHJkLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kcmQuYw0KPiBAQCAtMzgxLDYgKzM4MSw3
IEBAIHZvaWQgZHdjM19vdGdfdXBkYXRlKHN0cnVjdCBkd2MzICpkd2MsIGJvb2wgaWdub3JlX2lk
c3RhdHVzKQ0KPiAgCQlkd2MzX290Z3JlZ3NfaW5pdChkd2MpOw0KPiAgCQlkd2MzX290Z19ob3N0
X2luaXQoZHdjKTsNCj4gIAkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFn
cyk7DQo+ICsJCWR3YzNfcHJlX3NldF9yb2xlKGR3YywgVVNCX1JPTEVfSE9TVCk7DQo+ICAJCXJl
dCA9IGR3YzNfaG9zdF9pbml0KGR3Yyk7DQo+ICAJCWlmIChyZXQpIHsNCj4gIAkJCWRldl9lcnIo
ZHdjLT5kZXYsICJmYWlsZWQgdG8gaW5pdGlhbGl6ZSBob3N0XG4iKTsNCj4gQEAgLTQwNiw2ICs0
MDcsNyBAQCB2b2lkIGR3YzNfb3RnX3VwZGF0ZShzdHJ1Y3QgZHdjMyAqZHdjLCBib29sIGlnbm9y
ZV9pZHN0YXR1cykNCj4gIAkJCW90Z19zZXRfdmJ1cyhkd2MtPnVzYjJfcGh5LT5vdGcsIGZhbHNl
KTsNCj4gIAkJaWYgKGR3Yy0+dXNiMl9nZW5lcmljX3BoeVswXSkNCj4gIAkJCXBoeV9zZXRfbW9k
ZShkd2MtPnVzYjJfZ2VuZXJpY19waHlbMF0sIFBIWV9NT0RFX1VTQl9ERVZJQ0UpOw0KPiArCQlk
d2MzX3ByZV9zZXRfcm9sZShkd2MsIFVTQl9ST0xFX0RFVklDRSk7DQo+ICAJCXJldCA9IGR3YzNf
Z2FkZ2V0X2luaXQoZHdjKTsNCj4gIAkJaWYgKHJldCkNCj4gIAkJCWRldl9lcnIoZHdjLT5kZXYs
ICJmYWlsZWQgdG8gaW5pdGlhbGl6ZSBwZXJpcGhlcmFsXG4iKTsNCj4gQEAgLTQzMywxMCArNDM1
LDEyIEBAIHN0YXRpYyBpbnQgZHdjM19kcmRfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2Nr
ICpuYiwNCj4gIAkJCSAgICAgdW5zaWduZWQgbG9uZyBldmVudCwgdm9pZCAqcHRyKQ0KPiAgew0K
PiAgCXN0cnVjdCBkd2MzICpkd2MgPSBjb250YWluZXJfb2YobmIsIHN0cnVjdCBkd2MzLCBlZGV2
X25iKTsNCj4gKwl1MzIgbW9kZSA9IGV2ZW50ID8gRFdDM19HQ1RMX1BSVENBUF9IT1NUIDogRFdD
M19HQ1RMX1BSVENBUF9ERVZJQ0U7DQo+ICsJZW51bSB1c2Jfcm9sZSByb2xlID0gbW9kZSA9PSBE
V0MzX0dDVExfUFJUQ0FQX0hPU1QgPw0KPiArCQkJCSAgICAgVVNCX1JPTEVfSE9TVCA6IFVTQl9S
T0xFX0RFVklDRTsNCj4gIA0KPiAtCWR3YzNfc2V0X21vZGUoZHdjLCBldmVudCA/DQo+IC0JCSAg
ICAgIERXQzNfR0NUTF9QUlRDQVBfSE9TVCA6DQo+IC0JCSAgICAgIERXQzNfR0NUTF9QUlRDQVBf
REVWSUNFKTsNCj4gKwlkd2MzX3ByZV9zZXRfcm9sZShkd2MsIHJvbGUpOw0KPiArCWR3YzNfc2V0
X21vZGUoZHdjLCBtb2RlKTsNCj4gIA0KPiAgCXJldHVybiBOT1RJRllfRE9ORTsNCj4gIH0NCj4g
LS0gDQo+IDIuMzQuMQ0KPiANCg0KSSBkb24ndCBsaWtlIGhvdyB0aGUgdGVybmFyeSBvcGVyYXRv
ciBpcyB1c2VkIGhlcmUgYW5kIGhvdyB3ZSd2ZSBkb25lIGl0DQpwcmV2aW91c2x5LCBlc3BlY2lh
bGx5IHdoZW4gd2UncmUgdHJlYXRpbmcgdGhlIGV2ZW50IGFzIGlmIGl0J3MgYQ0KYm9vbGVhbi4N
Cg0KUmVnYXJkbGVzcywgaXQncyBhIG1pbm9yIG5pdC4NCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXll
biA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KQlIsDQpUaGluaA==

