Return-Path: <linux-usb+bounces-33056-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aALCGZSmgmmVXQMAu9opvQ
	(envelope-from <linux-usb+bounces-33056-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 02:53:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12027E0937
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 02:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7326B305E9C5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 01:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AA1288514;
	Wed,  4 Feb 2026 01:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CUbs3ekp";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L1PrbGPt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="t5v6Ao4s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894E428850E;
	Wed,  4 Feb 2026 01:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770169996; cv=fail; b=s5LTOa/DDVvP/bvKhaDToq2HuV0vI6VpgvFm5IZDK0W1XpOEqHuESX3/L510Z+1L2Two0CX2019DsjL1pRNxumgyIVCjpXl/4d2g/iVYxffP4h02Yo+CBodhPZI+FT9/1Fp7m3TYNj/fpAWdiE7JyjOFLzQQx7lx+5PZop/azN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770169996; c=relaxed/simple;
	bh=fud2o/fnGCohATft3rIsYJ/wOJnIwSxcfatmKdmrLvM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Li+ox9KCN+AkR/asygDHCbnDN/Z9XxNcPVdTfjiKAp1HlgRa1gXqVdP1/UAJ5DLQUeWrj4EaQ2/Sk81LHlmLqQXM/5bmY1Y6uoXnU/rjKGOjW/lIBheV85U6dI+76XZtHoWg+TUPhzpXe8tRSHTp057fiy/oR26KAK7pLwlMepM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CUbs3ekp; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=L1PrbGPt; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=t5v6Ao4s reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Kvsmn3916178;
	Tue, 3 Feb 2026 17:52:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=fud2o/fnGCohATft3rIsYJ/wOJnIwSxcfatmKdmrLvM=; b=
	CUbs3ekp5bslj+6eqnnS52glrQHVxv66cuFaRA5AfuLbKfB5l16Agepy5WHuyJoW
	IHE2jWc5UXWHRllB2JsUwnFSDGn1bGnwgkThuoHEBOX37Omte8KLA5RRyuWeoJ3M
	1VZGJxaXSa+iRyjztvleT8i+AVu4k1FhsRioOsgOlV55gwyG5j7cgLe9WLMUuAO0
	59bJO/r8jOohJ32YKqnsNLm1pyiK3lDa8mBymK2lt8ky8t6dBUTy+DHJLhgLvaxd
	ig+fjgF4wqmaBLUjXbrZGSii5csdtfQhy409FXNQ49sVQGq+Nqre8MHj+2nhPhL9
	IXCFOQToclV397vRKCSLMg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4c37b8ny2c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 17:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1770169944; bh=fud2o/fnGCohATft3rIsYJ/wOJnIwSxcfatmKdmrLvM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=L1PrbGPt55S8oL1ocII3SKPGxC32PMXWAKPEGNL8jbktySk5Y1sendrs0qCEhgM7A
	 +SydNIeXBALHh5Qzv/72kLxpuqdC76Gnsg+fK/I8EL61cJ0sH4cCWvi2+ab1WFzmDw
	 SMhT7tb9D9G2nwAQ5jDL+2bPRmbX8qSQIi87Q492Vjza+rUCDHxjp4HjweYE5LwEYE
	 PmgpN6NJACOa//kqy0SjUuke0wN32bdnSqu8YuHCkZfvZ/y2JBkKuXfUtVodDpVOIM
	 k6gpJWB9z+TD1Sair7Q9wS+jBaLLTEFL/0r3lacI6IPSzHllDAGUG4ySOpOn8/RQsq
	 OK/l0sz80cn5g==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D18D3402B2;
	Wed,  4 Feb 2026 01:52:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 368CFA005A;
	Wed,  4 Feb 2026 01:52:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=t5v6Ao4s;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00306.outbound.protection.outlook.com [40.93.1.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1466F40545;
	Wed,  4 Feb 2026 01:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgiu9lGnnF79XfTlmoGWTCCDYmwVogCm5+zg+bQpp8BIYtSy2L1ieoQaj2U3lofjokJHKgKy1ZR+ZfgZG5oaB+K9nxgKtwt2sZBVnVkj7MYh9ONs3y24uLB0q8Oo/Z3ug2frsQ7camely5R4PG8UziXmEq6KS1armsV3kOmwc4O09tzfBvALXRrkX4vWvjOW+ivISAjiF2Ogc6BO+m2NKn5vIb0uq5n6//J2F1utfjjc8z/jo0itV8biXV29fUjDcHorRpT0RdSs9HiIggAVf8hqkBx/tZLRI6shN8xAd730YOKMmkLytH9BGqDSMvHFLCKmOF9g0Xb5aA06EI//AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fud2o/fnGCohATft3rIsYJ/wOJnIwSxcfatmKdmrLvM=;
 b=GOBarsBwc3HMANICLnTlo+X3d0YHIAcgTomIZmkyRGiksl15bz3tloF+l3RdVYOYGzPYS0yu0HRSghGMm7ZBGUjUJ9WXDqVvNuCRmSO+XtAry77l22bUjDwGM/j5B/GOhHLu6ZOH3SFlsjZwHdKyGBeM2zakjdW9qLoQ8iuUBFXcJ0OvFwpIwJ2j1wrokrFwWniJIgNd+NIcmjxLSRdJYROU1gbAg1iWD3wL/L68lZ92UvWThYQC49MQv4u7AvK/0kNStE/QhyaR1F0cIJCaArUuNP96u2Pr8H3ETPsUplNGAXBrhEXcaDOmCLuae4ffYV5vmoe0YX13mzZur2JPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fud2o/fnGCohATft3rIsYJ/wOJnIwSxcfatmKdmrLvM=;
 b=t5v6Ao4sNhHlR2U2g1XkhJ+uI3XkkaO6iIzbp9zjPjpyggwTtQ3LU9H0qNQ4PzLy6dec9xkjynVFE+y7wWhhlrBPBZi0oB8lh3yTan3QNnQyfUduGd/ndT+ElwJavucsZkZL94T0VT8sd+1ayfC9t9xMTXnd7N5kpBlJnpSo96U=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB8163.namprd12.prod.outlook.com (2603:10b6:806:332::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 01:52:15 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9542.009; Wed, 4 Feb 2026
 01:52:15 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Peng Fan <peng.fan@oss.nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Xu Yang <xu.yang_2@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
        Li Jun <jun.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] usb: dwc3: add may_lose_power flag
Thread-Topic: [PATCH 2/3] usb: dwc3: add may_lose_power flag
Thread-Index: AQHclC5uLPRmrVy2RUu/Unb73tjpp7VwHnGAgAAOtgCAAZw5AA==
Date: Wed, 4 Feb 2026 01:52:15 +0000
Message-ID: <20260204015208.rpgp623pj37nldbm@synopsys.com>
References:
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-2-c44a5e919380@nxp.com>
 <20260203002405.5wxsceuc47m6hrud@synopsys.com> <aYFMfPeeQusS1UR4@shlinux89>
In-Reply-To: <aYFMfPeeQusS1UR4@shlinux89>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB8163:EE_
x-ms-office365-filtering-correlation-id: 221dcdcf-5e4d-4a62-0b05-08de63900587
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MFBkaUJBOElBdlRad2NBMFIyQUZSYU13ZmhlSnRzL0NDd1VLdHlkWG5JRW44?=
 =?utf-8?B?d1pJTXptdE5VWHBXdy9Zd0FDeTdaQ0RMdFVBVWtVUzZWKzNicVEzWHlVOGtn?=
 =?utf-8?B?cHZuM3pBS2t6cHZvOW82L1hPRmVVODFYUC81d3lyK0F2UlYxdXhCODZRei9t?=
 =?utf-8?B?cjdvemdtVDV5UU5GTHVaY1kwU05jSEd3Q2ZJbnk0ekFUQVNqTnVZN1dSeWRu?=
 =?utf-8?B?YkFyaEllOWVDWWNtMzhod0VURngySUxUcnF6aWxtZDQzZnd0d1Jwa25US05R?=
 =?utf-8?B?N1BNeG9xSWZxNmtHUlpGQTRDRHhxMGhybUFRT2dWSDRaYkZhTmpmcDIvamJB?=
 =?utf-8?B?ejR5TWU1M1NIZkNpWThWS05nYTBuM2tteEhMazhCQmo3M0Q0M1JpWGVvRndh?=
 =?utf-8?B?TnhPNS9Lb2NQNHFoWDdHQXpBZDY1OFFHM1h4M2REZFdzbi9aZW9xZENicXZo?=
 =?utf-8?B?K2RvemMvbElQUUdsZVJQUGlacCtFSDQ1dmNKZTBLOVpJL3hkRi9telVQRTgx?=
 =?utf-8?B?K0paRVpPU0RPNlBYYlArell0L1NnK08vQko0R0crSzBuSkxVZnhVdDF2b1lZ?=
 =?utf-8?B?Zit0TVhmcmQ3Z2ZuTG9DUEYvOWFmbmNpV3k2N0Y5ZnVuYVEwbDAxMnFNaVp3?=
 =?utf-8?B?eml3SE9zNVZNdFpIWEkxT3A4am1ZZHJLYk9WUHNiUDJsdjcyNG5EbEEzcUgr?=
 =?utf-8?B?S0V2Y3l1WXRSRzhWU2pobTlnWEZnVW82V1IyY1ozZEYwdmJHdCtRbFdrdGVG?=
 =?utf-8?B?aEFKNVBsc1ZpR1JUQU1rNkNRamFmREFSN0Fxajhjclhjd3cyRnNSZ3hIOVRD?=
 =?utf-8?B?aGZmSDZybmdJNkpydFRuM1NPbnFZd1BmNU5Wb2VSTlVjNTYxZzlNSDA1QjZB?=
 =?utf-8?B?TWtBRHZoR1M2L2Q2dDVJY1pCREQrNFduUlJkS0ZmbVpPbGorQ2l4TjV0SFZu?=
 =?utf-8?B?eGZWWWVOQVRiZnFnNWoyZkVDYXR4ZEt4SlFlMUYxM1VYRXcvclhadW1wcEVl?=
 =?utf-8?B?eHB6RG91T05SREU2a1dvYVZXV0p3TkxJUVVEM013emdQUmp4bzliYVlFaTFi?=
 =?utf-8?B?bXRzWGdBeFEyMUx3TFQ4d2JQNzlXc2NuQTVaNmtuVTYwTXMwOUpDY3hWTkdu?=
 =?utf-8?B?NDk0QVdncEM4UFhONGdyVFR0SWd4R1NwRVBUbnNIcHBXQ05RSjZXK3N5WGdB?=
 =?utf-8?B?enZxaFVGWmdWWFpEVjhGQm1hektpTitWQ1pwUEFEaUF1cjVNY1MzOUdxdCtU?=
 =?utf-8?B?Ni9XeE55c2F4SEYxUXhSRG5pNmRpcmcrZENueGdJZzBWT3dEalJXbVJpY2dq?=
 =?utf-8?B?eXhtZTNHSmZDR09oRG01R2VicGdTd0dHeUJCN0EranVPNXlCQlhjd1ByL3B1?=
 =?utf-8?B?Kys5WmltTUcrNDNsS2xiTlRzemRRc2FLQnByNTFLYWxXNUJ2cmZxTUVLaDAy?=
 =?utf-8?B?QSs1RTFucEZBSjZNODdSZWwxdHRDZmJucjhENWNTaUQ4RWFZdEFoM0F5KytJ?=
 =?utf-8?B?a2k4cVpjcVp2SmUwQzl5SGlYbjVtODY3Yzh0WmpqTDBYNmdRVGhWQXVxYmds?=
 =?utf-8?B?a1NxMFI0dDF0WXh2YmFpZXNVMi9DblpKWkYxWXlXMDVvNUpQRGdFZ1ZWSVpw?=
 =?utf-8?B?SXFuYnFVMWxYR0ZlZEFiTlZBdHBKWjg0bDJRSWhzYVdzWmcwbkRKNi9BMGZJ?=
 =?utf-8?B?eG0vU3ZEb1ZNN1Y5eU9pbzVOOWI1WmlsTlYvZjVnYm4zZzZvNjNScDZuZFNx?=
 =?utf-8?B?UmpKLzNic2kxS1FNbElGb01MRWFmODNrVHNQSTZVZUtEU1VjbnFPazlKb2cw?=
 =?utf-8?B?cmp2NkNSSzRLSEhjMElsNjRVdFpOOTkwNVpBbmt3azg2QThvdnFUSlhIZ0M2?=
 =?utf-8?B?QTlOSDhhMDlYVDdYTEN5TmRSMHJVZnJPNGFjS1Bmdkg3QmZwUTkyd0ZkTnNs?=
 =?utf-8?B?empKVCtYQWlOOWlWa2dkM0ExVmNQaVZMMEZnU0RXUUVVOVhvRmg4SjZMK3kw?=
 =?utf-8?B?ZU5MNDdSdk80ZGFha3BUcGJ4a0NDYTFJWGptbndoU2ZxdzlVcEIrNlc3V3JT?=
 =?utf-8?B?WlZVK09CSU9pa3QwTUtrVXhyWWYvTytXQWora1lLakZjRWVIeVF1ckJMTDhC?=
 =?utf-8?B?Y1hvL1UyQ2pyM1RGdDF4YmF1dmpQdVM3a3I1NnJVdUgyZEpHcS9XRVhjbWNj?=
 =?utf-8?Q?7ykvLXPQTlwL+wMH3VXHaHY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emRXOU9lT3FvRVZRdUF2dXI2TThHTGVia3Q2aThWZmRvSXJGOGlTMlNZQVNJ?=
 =?utf-8?B?Vm5nTFFNb21ldFhwelV3aWhJdk5ZL1llK2RqWHhQV0dWdHpFeW52NCttMnFW?=
 =?utf-8?B?KzR4UUVZRDdoN3NoQUVPVmpFcmhudFlnUWJOb1MvdmJSeU9IUVkzcXpHUEpo?=
 =?utf-8?B?cHlLeWhzOVEvVENaK01FTThraUI5ZnJubnJXWWhBK0dxOGtNS0lMaXNUOUpj?=
 =?utf-8?B?QXdSOFh6YnhsN1VOOXNoQ3hYSlErNDhSV0VvSmt6QVJsU2tnQm9RckdiSWdO?=
 =?utf-8?B?YnVaNVN6VmF0QXFaZ0R3MUxEbjU4OTMyT2k3K0plbzRadmdmdUpWYzdTYWNp?=
 =?utf-8?B?MXpiMTIweS9WZVVtWitTVnRVdEZlT1VlZkdBUFZDUnpLUE1EbEUyODJCS21N?=
 =?utf-8?B?OE1jL3RzYTlyK0xXemxpWGloRFE4aEZhRW9vT2pFc0NsNFdtcXBLQjRseEQr?=
 =?utf-8?B?ZEFPNzA5blBlYkJDM2UybndwYXEzckh0dWd6TXMxK0pyWWVrS1BZa2NFNDRI?=
 =?utf-8?B?YmlMdEluM0VmVFVjMWJ4bHFvMFREb3ZRcTI1QU9xVkgxU281L2JHc0R5Ris4?=
 =?utf-8?B?LzJMN2lFczRHTGJBMGJlbGh6RjZwT0xvOXpoNmdCb2FNSExaUDVCSlkrNlhL?=
 =?utf-8?B?bnhEQWRpV0Y4OXNTc2lQblkrZnB0ZldKeUVHZHg4OXFKbkhyNVN4YTQ4YUFu?=
 =?utf-8?B?LzlqYTdDWmNPSmNxdEp3d2ZJcVRucU9JczhleFhmSHBHTmgzVUI4bEtpSmk3?=
 =?utf-8?B?VUZ0eG1IZmZZYit1NElxaDJFamRWd1RWOU1vMm9OMHA4QUwrUEx5M29hQkhC?=
 =?utf-8?B?RXZxc2EyV3dWdnNHOU15V2ljdXRPTmlRMFFDajhTM3RZcU1GNmIxZVdWZUhx?=
 =?utf-8?B?WEYyWHVCdFAzV056cFp4NlRPRXhsbER2OTNUQnFLVmROaEMwVk5KL3dXRUIz?=
 =?utf-8?B?ck5EU2N3RWp2a0xYTUVTcUFLbktUM2dIWGpFT2FpVXhSb3RXaVFiaTVBNzN2?=
 =?utf-8?B?eUhIbXZoRzFrUTY4MWVkT3JtSGZRM3puL0lGUy9veWV0TlRma0RUS0RDWDJj?=
 =?utf-8?B?bjRDclQwNy80bHUybjVZVFBDQkpSL3RHVVd4ZHMwanpoN1JxYTlRS1AyRWR2?=
 =?utf-8?B?dFJBSkhvS2RmWjYzT0dSR0lwS2kyTGJrc2c4SytDeTBSRmFqYUNXK2VLMEVH?=
 =?utf-8?B?UWJRcXFHb08zb29nWjJYd0RkL2w5VG1BaktkQlNMejlFRkxpbi95U0ZnMFRX?=
 =?utf-8?B?RFVCQ2lhQnNJQ2g1Z1l1RDlCSzZmTXdaeEhaMzBCUXN1MXVjV0ZpY2lqMm1V?=
 =?utf-8?B?RzYwODlZVVNUbTBjcVo4S3BoSzREcjdkSDA0Rld4T3pEdHQwQzdYSE8ycUhv?=
 =?utf-8?B?QnBjS3hPOTJKb056VEpQM0YrSHFiajFud25OQWN4bjlxMlZVeWxxb0Rra3ZW?=
 =?utf-8?B?Y29GY3dGRkFPZWx5QmNXTW02Q2RIenZHTHJ3Y1dENVNyVU5YVVk0aUZoeWJD?=
 =?utf-8?B?clExRGxmMUFnY1ZrMWViUWE4Z2E1WlU5L1IrNDlUbEYxU2I2MzBTTDV2Z2Rk?=
 =?utf-8?B?N1JsUlB2TWt6VHFIamkxenpHMkRHbjBvMEtOU3NlN0NSSHREOUpiemxNd0FS?=
 =?utf-8?B?ZThaM1NrZVdwWW1lYlpudU1YM1hYRmpRTjJiRWgwUWhybkNOSm1vWk1vYldn?=
 =?utf-8?B?U0NpOUllVUFXbU5LbnBxb1h5Nm5qaEtZK0RWQXM4ZEo1WjJuaDZQcXh1QlVV?=
 =?utf-8?B?am95Z21wUmRoWUVnRmhtZUxiYjZjc1I3bFgzTzFUVVZKRmFZT0FJMDh1TVRP?=
 =?utf-8?B?Z2F2T0pSdDFiUHBOTmg5M3R0ZTh0MVBTNHFlVDVucFFGZkYwTHZ5Z05zanJB?=
 =?utf-8?B?RHJmV25WblRxMmJVcW5uOThmOWxaeVpUTkl6YnB1dTBxWVY2VjBIaGF1L3pC?=
 =?utf-8?B?Y2ZFRCtyckdWM2JKL1c2djB1RFRHTXcrbjBObWxQMUovTUFJN1lObFNzNmVI?=
 =?utf-8?B?Wk12OXJpYWRacjhXZGEyNUhTcDlwQjNRZzJXSGJxUVdlcUp5ZFlkTlZ5a3Jp?=
 =?utf-8?B?aExLbHlCcStkVUhUT1YyWGpWeFlBTXgrd1ZRN1NtN3M0MTFyZ0ZNaExWY0lL?=
 =?utf-8?B?dmdjTzRuMW5VdHpLNC9GZzZ2K1NlbktpV3VyZmpEVm1sZnZ1TFVnc3FrRlR6?=
 =?utf-8?B?cktaTnhDT0lLN3NpZFQxTFlKYlBoU2kzUVk0MDQ0djdOMTNGQ0Z6U2dRV2V6?=
 =?utf-8?B?amlZVVpWS0pVVFZwL2FvS0ZBc3dCSGw0SWhVbWZUT0UwcWtLSWF4dUFURFYv?=
 =?utf-8?B?d21JZDFPbEVWZ0trZWRlRC82TjZHOGYvMG1ydkFzeWZXbkZnUGIyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EBA2E9D85F3EF4B9A23BB682E5173A0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2Dwou8Y8mtG1cpkn/+l/wof8fNON5G5DYnm2sOYNLwBmg26RIMFdJASyc45rSKYA7PPmIZLUbhYiPjsELzdTMk68lJAbIV4VB7BH/N5DR+blo2W0jSlj9JUGUSHiRssQ9Kr/KsULa1VCVQduz21F570Vk7VSEZ8i4zKPptHzeGRSAciCYFI4gxdYyCgFWIR0lEmMFt0zsnrwtHK6xEodXyKr95GFs6HNh0BbLMj9LR9pUfZEHSuJ5SgI9DQKf9jq+jR2Wn70ACo1wMG20TKno7KrjttiSa+DEwL3MzDuPovfGEh5LabFFC9xdB37mGHqDn/8cKHGyk82iIZKsudLtUzhNgjE7NS4omAmxxVDAKpNicNV/TZoQoOFJvNFYbe4cxykkVgZUX5Tds/JoSJ6eYICoCLiodXXbhAqBdSK7TU/LXy/L9ewN/d9+uxF9FCMSm8bL3uqeGw+mYiR90Mip7jDx11QTVvEYMVcW8CzFUenxPF75aWwSXZh4d/GzzIn5xo28jppU32INRcrRjC12nheWrkHYUR50l3SqCnkcb4rEvgSOTMbDpuS9gEJlpz6Bzzh7fLfHH4+/FDDxME+k0Z/AGHUWchrTmTsvk3A19LyxkKXpHOmB+k57Y4+dvnQCpLinjJycb6nalBUsuq7dw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221dcdcf-5e4d-4a62-0b05-08de63900587
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 01:52:15.1969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9OEIYrVOMjdbJTpvdOjOtZRLqXhSFDl9wPBYs2FCApcf54UFKubz2EArRQ+fdvA0NicOhvV46l3io/I5qZgJ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8163
X-Proofpoint-GUID: lWsocrReOKIKQ7Ta87RvsUSfmNfuYuOW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxMSBTYWx0ZWRfX9OuEV0Maf4rp
 s0+iRO56/E/HOhzzCHiE+u+hMh//6WnyGkJpzbkz5v3yExbg6pe4AexxT64c8S6m7C/s+dz8LYR
 W2/BgcJVOSDex/iiZK9SkhynZp79R32VJjpdlyAj4OZOsLYOwz5K9vgzVbK27wXeLe2Wm2Pv85f
 FknA/ulPwX2ckLur//rowQdcmLsftsKow6wPlGza+bryfWwmaTEBEyQmCRp4dcWOUaEa3XTMfZA
 8X40KFvQQhyyygQz1opJBWxUTt8IzSvdQaKj1p3JWSjlGWXPgeBuzGKHncWtdcW4g2sikr5FLAJ
 yM2vTPGqKmxLv7B/8JgCBocR2GaBoDAXhCvLsIfq+O/hFitaFsTsaMkQNF/82dNPHDM3KipV2M+
 9kPikv2KnXJk7FqmZSDVsUv7fxc1yktvhAEZIicXC0xmDaPa4+x//SMiIl6KNyiMOWbgswO4rXx
 5SWAs2XMgByChnJu/QQ==
X-Authority-Analysis: v=2.4 cv=Zprg6t7G c=1 sm=1 tr=0 ts=6982a658 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=lx-QMRaLxsjcIW9idW4A:9
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: lWsocrReOKIKQ7Ta87RvsUSfmNfuYuOW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 phishscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602040011
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33056-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,nxp.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 12027E0937
X-Rspamd-Action: no action

T24gVHVlLCBGZWIgMDMsIDIwMjYsIFBlbmcgRmFuIHdyb3RlOg0KPiBPbiBUdWUsIEZlYiAwMywg
MjAyNiBhdCAxMjoyNDowOEFNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID5PbiBNb24s
IEZlYiAwMiwgMjAyNiwgWHUgWWFuZyB3cm90ZToNCj4gPj4gVGhlIGN1cnJlbnQgZGVzaWduIGFz
c3VtZXMgdGhhdCB0aGUgY29udHJvbGxlciByZW1haW5zIHBvd2VyZWQNCj4gPj4gd2hlbiB3YWtl
dXAgaXMgZW5hYmxlZC4gSG93ZXZlciwgc29tZSBTb0NzIHByb3ZpZGUgd2FrZXVwDQo+ID4+IGNh
cGFiaWxpdHkgZXZlbiB3aGVuIHRoZSBjb250cm9sbGVyIGl0c2VsZiBpcyBwb3dlcmVkIGRvd24s
IHVzaW5nDQo+ID4+IHNlcGFyYXRlIGRlZGljYXRlZCB3YWtldXAgbG9naWMuIFRoaXMgYWxsb3dz
IGFkZGl0aW9uYWwgcG93ZXINCj4gPj4gc2F2aW5ncywgYnV0IHJlcXVpcmVzIHRoZSBjb250cm9s
bGVyIHRvIGJlIGZ1bGx5IHJl4oCRaW5pdGlhbGl6ZWQNCj4gPj4gYWZ0ZXIgc3lzdGVtIHJlc3Vt
ZS4NCj4gPj4gDQo+ID4+IFRvIHN1cHBvcnQgdGhlc2UgU29DcywgaW50cm9kdWNlIGEgZmxhZyB0
byB0cmFjayB0aGUgY29udHJvbGxlcuKAmXMNCj4gPj4gcG93ZXIgc3RhdGUgYW5kIHVzZSBpdCB0
aHJvdWdob3V0IHRoZSBzdXNwZW5kL3Jlc3VtZSBmbG93Lg0KPiA+PiANCj4gPj4gU2lnbmVkLW9m
Zi1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmMgfCA5ICsrKysrKystLQ0KPiA+PiAgZHJpdmVycy91c2IvZHdjMy9j
b3JlLmggfCAyICsrDQo+ID4+ICBkcml2ZXJzL3VzYi9kd2MzL2dsdWUuaCB8IDMgKysrDQo+ID4+
ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+
IA0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuYw0KPiA+PiBpbmRleCBjMDdmZmU4MmM4NTA0OTM2NGMzOGM3YmExNTJhYWIw
ZmY3NjRkOTVlLi45ZDQzMjZkYTVlYzc2NjlmYTcxNDcwN2ZiMjQ1NTY3MjNjYWI1MWI4IDEwMDY0
NA0KPiA+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+PiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYw0KPiA+PiBAQCAtMjMxNCw2ICsyMzE0LDkgQEAgaW50IGR3YzNfY29y
ZV9wcm9iZShjb25zdCBzdHJ1Y3QgZHdjM19wcm9iZV9kYXRhICpkYXRhKQ0KPiA+PiAgCQkJZ290
byBlcnJfZXhpdF9kZWJ1Z2ZzOw0KPiA+PiAgCX0NCj4gPj4gIA0KPiA+PiArCWlmIChkYXRhLT5j
b3JlX21heV9sb3NlX3Bvd2VyKQ0KPiA+DQo+ID5DYW4gdGhpcyBiZSBwYXNzZWQgZG93biBhcyBw
YXJ0IG9mIHRoZSBkd2MzX3Byb3BlcnRpZXMgd2l0aGluIHRoZQ0KPiA+cHJvYmVfZGF0YT8gSSdt
IHRyeWluZyB0byBjb25zb2xpZGF0ZSBhbGwgdGhlIGR3YzMgcHJvcGVydGllcyB0byBvbmUNCj4g
PnBsYWNlLg0KPiA+DQo+ID4+ICsJCWR3Yy0+bWF5X2xvc2VfcG93ZXIgPSB0cnVlOw0KPiA+PiAr
DQo+ID4+ICAJcG1fcnVudGltZV9wdXQoZGV2KTsNCj4gPj4gIA0KPiA+PiAgCWRtYV9zZXRfbWF4
X3NlZ19zaXplKGRldiwgVUlOVF9NQVgpOw0KPiA+PiBAQCAtMjQ2Miw3ICsyNDY1LDggQEAgc3Rh
dGljIGludCBkd2MzX3N1c3BlbmRfY29tbW9uKHN0cnVjdCBkd2MzICpkd2MsIHBtX21lc3NhZ2Vf
dCBtc2cpDQo+ID4+ICAJCWR3YzNfY29yZV9leGl0KGR3Yyk7DQo+ID4+ICAJCWJyZWFrOw0KPiA+
PiAgCWNhc2UgRFdDM19HQ1RMX1BSVENBUF9IT1NUOg0KPiA+PiAtCQlpZiAoIVBNU0dfSVNfQVVU
Tyhtc2cpICYmICFkZXZpY2VfbWF5X3dha2V1cChkd2MtPmRldikpIHsNCj4gPj4gKwkJaWYgKCFQ
TVNHX0lTX0FVVE8obXNnKSAmJg0KPiA+PiArCQkgICAgKCFkZXZpY2VfbWF5X3dha2V1cChkd2Mt
PmRldikgfHwgZHdjLT5tYXlfbG9zZV9wb3dlcikpIHsNCj4gPj4gIAkJCWR3YzNfY29yZV9leGl0
KGR3Yyk7DQo+ID4+ICAJCQlicmVhazsNCj4gPj4gIAkJfQ0KPiA+PiBAQCAtMjUyNSw3ICsyNTI5
LDggQEAgc3RhdGljIGludCBkd2MzX3Jlc3VtZV9jb21tb24oc3RydWN0IGR3YzMgKmR3YywgcG1f
bWVzc2FnZV90IG1zZykNCj4gPj4gIAkJZHdjM19nYWRnZXRfcmVzdW1lKGR3Yyk7DQo+ID4+ICAJ
CWJyZWFrOw0KPiA+PiAgCWNhc2UgRFdDM19HQ1RMX1BSVENBUF9IT1NUOg0KPiA+PiAtCQlpZiAo
IVBNU0dfSVNfQVVUTyhtc2cpICYmICFkZXZpY2VfbWF5X3dha2V1cChkd2MtPmRldikpIHsNCj4g
Pj4gKwkJaWYgKCFQTVNHX0lTX0FVVE8obXNnKSAmJg0KPiA+PiArCQkgICAgKCFkZXZpY2VfbWF5
X3dha2V1cChkd2MtPmRldikgfHwgZHdjLT5tYXlfbG9zZV9wb3dlcikpIHsNCj4gPj4gIAkJCXJl
dCA9IGR3YzNfY29yZV9pbml0X2Zvcl9yZXN1bWUoZHdjKTsNCj4gPj4gIAkJCWlmIChyZXQpDQo+
ID4+ICAJCQkJcmV0dXJuIHJldDsNCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gPj4gaW5kZXggMDhjYzZmMmI1YzIz
NjMxYTc1MmM3N2ZkNzM5NGU1ODc2YzkyOWYwYS4uNWIxMzU4ZjM2NDkwYTAwMWJjOWU2ODEzOTIy
NGY3YmU3MGE1Nzk5NSAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgN
Cj4gPj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gPj4gQEAgLTExMTcsNiArMTEx
Nyw3IEBAIHN0cnVjdCBkd2MzX2dsdWVfb3BzIHsNCj4gPj4gICAqIEB1c2IzX2xwbV9jYXBhYmxl
OiBzZXQgaWYgaGFkcndhcmUgc3VwcG9ydHMgTGluayBQb3dlciBNYW5hZ2VtZW50DQo+ID4+ICAg
KiBAdXNiMl9scG1fZGlzYWJsZTogc2V0IHRvIGRpc2FibGUgdXNiMiBscG0gZm9yIGhvc3QNCj4g
Pj4gICAqIEB1c2IyX2dhZGdldF9scG1fZGlzYWJsZTogc2V0IHRvIGRpc2FibGUgdXNiMiBscG0g
Zm9yIGdhZGdldA0KPiA+PiArICogQG1heV9sb3NlX3Bvd2VyOiBzZXQgdG8gaW5kaWNhdGUgdGhl
IGNvcmUgbWF5IGxvc2UgcG93ZXIgZHVyaW5nIHBtIHN1c3BlbmQNCj4gPj4gICAqIEBkaXNhYmxl
X3NjcmFtYmxlX3F1aXJrOiBzZXQgaWYgd2UgZW5hYmxlIHRoZSBkaXNhYmxlIHNjcmFtYmxlIHF1
aXJrDQo+ID4+ICAgKiBAdTJleGl0X2xmcHNfcXVpcms6IHNldCBpZiB3ZSBlbmFibGUgdTJleGl0
IGxmcHMgcXVpcmsNCj4gPj4gICAqIEB1MnNzX2lucDNfcXVpcms6IHNldCBpZiB3ZSBlbmFibGUg
UDMgT0sgZm9yIFUyL1NTIEluYWN0aXZlIHF1aXJrDQo+ID4+IEBAIC0xMzY5LDYgKzEzNzAsNyBA
QCBzdHJ1Y3QgZHdjMyB7DQo+ID4+ICAJdW5zaWduZWQJCXVzYjNfbHBtX2NhcGFibGU6MTsNCj4g
Pj4gIAl1bnNpZ25lZAkJdXNiMl9scG1fZGlzYWJsZToxOw0KPiA+PiAgCXVuc2lnbmVkCQl1c2Iy
X2dhZGdldF9scG1fZGlzYWJsZToxOw0KPiA+PiArCXVuc2lnbmVkCQltYXlfbG9zZV9wb3dlcjox
Ow0KPiA+DQo+ID5UaGlzIG5hbWUgc291bmRzIGxpa2UgYSBxdWlyayBvZiBhIGJyb2tlbiBTb0Mu
DQo+ID4NCj4gPlBlcmhhcHMgcmVuYW1lIHRoaXMgdG8gc29tZXRoaW5nIHN1Y2ggYXMgcG93ZXJf
bG9zdF9vbl9zdXNwZW5kIG9yDQo+ID5uZWVkc19mdWxsX3JlaW5pdD8NCj4gDQo+IEhvdyBhYm91
dCBvdXRfYmFuZF93YWtldXA/DQo+IA0KDQpJTUhPLCBpdCdzIG5vdCBhcyBjbGVhci4gSXQgZG9l
c24ndCBkZXNjcmliZSB0aGUgcHJvYmxlbSBvciB0aGUgYWN0aW9uDQp0byB0YWtlLiBDYW4gd2Ug
dXNlIG5lZWRzX2Z1bGxfcmVpbml0Pw0KDQpUaGFua3MsDQpUaGluaA==

