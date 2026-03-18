Return-Path: <linux-usb+bounces-35006-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHjEKgn/uWlBQQIAu9opvQ
	(envelope-from <linux-usb+bounces-35006-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 02:25:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 123712B4F04
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 02:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D290030888F6
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 01:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE01423EA85;
	Wed, 18 Mar 2026 01:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iVj3JRoy";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RsJLpcue";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="G4Dtzf0c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3CDE55A;
	Wed, 18 Mar 2026 01:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773797121; cv=fail; b=YfXGDSyLAmA2+copu244AygfuA1d3yPNzmelRKRuI6mz8NNpvPAE3IoBDVYDxYoRZVSGIiAKgpEgoId/6PH5RLLRDyiViaKR9x0FSa1V0X1XXyQDVLbK1DIbzWB7JUhv+OcTjTQBdOp/L06I1VSudVM/17ew/GcA5CzAEdVWtck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773797121; c=relaxed/simple;
	bh=cqedIXKdzxEFodWSVLvMRNV7BOAqcTftkIPEq+i485g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qWVMHttkRw3WdCB+638zk98qdT9H1pq9Ts/zfAXE2597hnwc/QeCtj3O+E7pdKwrBmdfVzdef0iQtF70MK3JbFWxNuK9xRUuI2utC94xPbQ5z0nVN8Pab/2arp31mWn/hMS47XT+gcHfaz3e0bhyJkN6vCctTNfG9ZsX3BRMW50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iVj3JRoy; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RsJLpcue; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=G4Dtzf0c reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HLYqo81806001;
	Tue, 17 Mar 2026 18:24:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=cqedIXKdzxEFodWSVLvMRNV7BOAqcTftkIPEq+i485g=; b=
	iVj3JRoyxWknU9JhBtQBtMvl5HuEEBQty56bo7ts9XTYDFaXw834hmN+fYZelELe
	1bJHdpHxIqF3QLu7geohr/JDT67gROI66Upy29+TDCSeBhZ0z1xy8jJ5rATmpDCi
	gug4O65SNDYGvAH2SRv1KFSW/4DCKFJ+poqf4Q9GSV8jcKxRdgLP/E/CuTCtUrzP
	xnGgQiSf+wiIjgKAeMHZ5tphELGnyd226E3zTgWOnLcu7029TQiBn2IRWoYlJK6Y
	1BN1OZSU+4jL7iWQL+eUwiU2GvcdY0YMcvT7e0SpRd4ArJA5fFMf/db5IarU3MLD
	OD7wupPRpMud+pntw2zKCQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cy98hmnhx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 18:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773797075; bh=cqedIXKdzxEFodWSVLvMRNV7BOAqcTftkIPEq+i485g=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RsJLpcuebeEucSf3JFlVpTWPGBnJG6mQogc+VRX0+kv1BPA1ek8nERav9EoWqwRys
	 XhMh9fbnQAoeU4ZUKgeBLkonzDb+MN9xAOGbcGjtRLjPOULxXvMuWinupHx4V9EDaf
	 P3YfUHScUgADuz4hXbkV2ECCwFPJ8Y9azSJSw/ZtwRF4QuTrUb3VLUj7IhkxbkhFjB
	 QCsitm4Xwc8/3v8+wHDMLW81/13dpKTHZjco7Xb3ki8giCsiCsiEFywiFNaD4iRL1w
	 KPz5Pw5MJxQURy58e/K9+A4gfRAUb2etbd0TYwCahdd8xJqwF6Y4SOaKcjkqweCpEk
	 wy9vHnv8GznOg==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E4CAF401FA;
	Wed, 18 Mar 2026 01:24:33 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 74EDFA00A1;
	Wed, 18 Mar 2026 01:24:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=G4Dtzf0c;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00101.outbound.protection.outlook.com [40.93.1.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 72CED40359;
	Wed, 18 Mar 2026 01:24:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NL9GQ0b4+AbwThlr3tEVqYXvFchpDGQparyEydVOh4cuoPVUoVXRGOUVLDsdSQVrXaVH+FYwtZwH0GVGgOus7JF77VooCxc1n7qSisq5m5qMhUKPJs94WN/FkR2Fkz1CUQKTT31dU6627xsIiLKIpS20ScZPPSvpixaIUlYpMg+8RX1rfLpEs8xPqQJ+MTouBk39uB7ei0gFy88Jm+fLkkopSk6I8/RImndnAepsFchEh02rWCSzw/2s4juOCvVmg6aJfVdL19YrUsZj6S4i+bpFL+UwKBzwHbFWMeE7RDFW5RbiXVCIsRM+SW6/uQYLe1HuZfhlmZ5O5fGt5zfEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqedIXKdzxEFodWSVLvMRNV7BOAqcTftkIPEq+i485g=;
 b=Xc9yo2ksuOurvdAGQvQT/llywXFy5shdN+aV52mA7EmmITiIyKIyNVZ2LBjkR++Cz7MfBWGaI11K8GJj6G4sogFJ0u/equ7n3VHPCWunVxHFid2HolgsbI/b1AMMjO5AFwrazlWy7pBUxpvh9C9T/LUV2JTnfI/LPHqZrSyoNATPU0b0d1wE3vyJpJiSSA/lWTa6xEo3kOc8eAvsxEIbSSbAJxzl+7fmU68W9cSaXt+py/OJRriljzZF3dksX3uQOCvsE5bFfEsCU3JVjQty3l4R+VTz/EIGfxM87p0C1CypkJtz/jKcdbjrz1R4RuJ/rqQq2CUUkxyAMnZeZwU1qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqedIXKdzxEFodWSVLvMRNV7BOAqcTftkIPEq+i485g=;
 b=G4Dtzf0cHbVglUcqEqHuzqn1pk91QANB4lP40YL0guwx+afxey+YIBKV7GfZVNI2k33Mh1sFuqZ4VKkuPv4JwQU5HWvdDjC/ykXkrpY6UaQCrqua1PjwFUYSRfrOKeaTn+YBNE82FAGT2jJlyup2HzkbioWlK0/V6sul7WKBk+M=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Wed, 18 Mar
 2026 01:24:22 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 01:24:22 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Yixun Lan <dlan@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Junzhong Pan <junzhong.pan@spacemit.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] usb: dwc3: dwc3-generic-plat: spacemit: add support
 for K3 SoC
Thread-Topic: [PATCH 2/3] usb: dwc3: dwc3-generic-plat: spacemit: add support
 for K3 SoC
Thread-Index: AQHctgS/Lru4fyFIS0uHSVeVDL3wubWzf9uA
Date: Wed, 18 Mar 2026 01:24:22 +0000
Message-ID: <20260318012421.cbilkaj5vmrpmxif@synopsys.com>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-2-d89f59062ad4@kernel.org>
In-Reply-To: <20260317-02-k3-usb20-support-v1-2-d89f59062ad4@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8784:EE_
x-ms-office365-filtering-correlation-id: 8594a30a-bdbb-47b0-0b36-08de848d1612
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 f1aIyIfkjkQNKJaSVKN9bunZ/OH3BTFeC0IBwjT+L4gJuU2l9/qTDhrXIwCogTtvcd9CU9v0OixbHTA50DecbC/E+7HYfCGJDVcIcEnT/UuBrtTNGScXVq5FYbgukjVGLAJSKJycKNW5Ms4rBbj1JyGdbqFZ7IFNIYUqAlZjsjX0+8uNzEE2pIJcTzfg5MWIpOUsmDyTgTRQr5w+nf0qdysYjfirquINlenGnRjBFdMxcRHBAnz90e+/zsr4T/AaPpUbUUHUSfWICcLqRUNFWwREodpyTIF3arZ8QmH+8VCAsUcVHcrFM2v8AjXV93bteu0LckxS/KE3ejzV3Ey10A/Fp2tF2Zg/qcwivUQlhy9z2dwxoSqM0ctycvX2WLKFNnaDF0hmfPJISLpF4sAoLYt53yGqi1nne+aJuW31OTdmDClLYq+v77xvaCNK/pcCBTQDwKUAPR4J3JgK6o6FrvMckbJH3rZPAKbGYHXUqVFRRSYdEvM6pAl+CeRm8+eguOjSsSKXKrUETTZRaElCRPOmG1FPVN5yXdga2aHJH1qSSGVc93S4WezFf664r6cI3LBJxdrq4X23O1o+yvFatRakpODSpDXfPgB7rVxw3B4zUMm9yTc0zDu3rSew/wYii8PnpHC/ouTqmGTGtP1VtNz2SUapUGBtJZ+4vYS+AgcGV9EyNJuQd84zXBte91oA2q/am6kK9OMC4kTTfgSvNYYEHlV3FzyYSg80TgKWZFopkvQiT3DY86bjE9l3pQgYUR4lwQDJZh0GMKlRCPBW3GGknP+I/xpuYM69rMLZjYc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTl3QWVtS3N1TVFaSEd4UHNvRjFFUGovQWhJTys5REVIRmFmbmVvVUc2eDNz?=
 =?utf-8?B?OWRkWDQ1TnN0UDR0akYrL3ZaTGxVTSt4d0t0UkhlaUxKZkovbGRncjJheVB1?=
 =?utf-8?B?dFBtRncrQklHL3puZkx5VjE4RkN2SlluWjJuc1h5M1dSaEQzOSt1bWs0MmRV?=
 =?utf-8?B?TjZCNzFGZnd0OVJXSFozRjA2Zml5bGJsKzJZVzB2cG9LNlB1TjRyY1A1SDB3?=
 =?utf-8?B?TUlQZC81ajN1VUhIRkRKeGp5MFl6dlRQNkUvVVJpY0RHYjZybmU3bFFRaTZn?=
 =?utf-8?B?L040VUhxeUZSeWpTa0x2bS9WNEh0RHg4SjlIZktadmowZUV5M3FXelQ5Y1dm?=
 =?utf-8?B?NVc0aFZheG4vZ1doOUV4TUpNM0s3UzVXNjNIK2hVdHo0MUMzS0FsaDlmcVpH?=
 =?utf-8?B?NEhTZVFyK3R6ZVgzbGVMUmZWNjdwU2tMcDlqZnppMjNFUkRsR3ZoZlN4dzRj?=
 =?utf-8?B?U2JjaHRBdmNzaGFPeCtxWTEzSGVyL0UyU2UrVlo1SzVEU1BjbjN4dmh5SEo4?=
 =?utf-8?B?b2FyK1lIcWxvS1BERU5FRWpQNHQ3cSt1K04vdEFlWTZzNEN0U3ZjSGlyOThI?=
 =?utf-8?B?b0QxSFdtMzhuSzhadE5VRDZRZFZTTHdrZzgzMGYzakxGVGtTQzR4VVpBdWRM?=
 =?utf-8?B?K1lQdUd0a0xJWDNjTXZ2RklUV0lqRlI4Rkt4NFhVRmF3ZE80U2U0eEV1WGhG?=
 =?utf-8?B?SitaNFlVZVRQelJ2Qml4K3YvVjkvSzcvN1YvTjI3UVo2TWU4Ulg0Nmc3eWhE?=
 =?utf-8?B?R3hGaDNkTjVrWGc5M05ia1RQY3laTUdxUTZ1aFVUbHdZd1lqZjh3ZlRRblMw?=
 =?utf-8?B?c0F3emNVNkJZTkJOZVJjd1lxT0JZY1EzTXlLQURncnlaOWZVbVBhOW9mVVJN?=
 =?utf-8?B?YXl6MWEwQWdWZ2VkbTErdjhubHI3M1MwdVpZaGNJczgwaWFIMlZzYi9BbVF1?=
 =?utf-8?B?bjRqTnJlVko4ZlZJMmM5V3VVTElLQlMyRm9qV2haU01oV0ZzbTNCS205bUxv?=
 =?utf-8?B?Sk5TNUlhSm0vMzQwRmJIWjlLalkyMmNETGpJNkxvd2lZeUJsSVBsRDIrb0ll?=
 =?utf-8?B?c1kxRmYvaHBmQ2FCOG1kc21wVUlncTExdTYvRVJxUFJwQzN1ZWd6NS9Rbzh3?=
 =?utf-8?B?bkJyUk5GZUd6NDRRQVVrRXI0NVBRd1ZCcHZ0NlBDRW5CZk1jRm5RYktqWEts?=
 =?utf-8?B?V0ZlSCtaRWpQRno0b1RnNmo2Y2tzcGZ3NGg2aDZoNkw0MWtZZHRLWERTalcr?=
 =?utf-8?B?WnNBR2MwL2syQ0lvY2xaVURwZjZRbXRXaFhObUZEWmIwTE04YjRCeVY3a0pu?=
 =?utf-8?B?N0RGdnpDOFl2NjQ1U3ZQYTVFMU81YUNiaGU2UHlMTWlINjZCanZYUG42Kys0?=
 =?utf-8?B?L1hOMjNSWkY4alRFUGgxdFowOXEzTENFanVPRnJjZ2JUbXg3cURtSWgvbHZG?=
 =?utf-8?B?Tkt3UFJsS0d4SG41THc4ZmFYYzFwb3F5VldJNWpnUDlZUkV1WGxjc3AxTTNH?=
 =?utf-8?B?clRydGZEU0pKRHNnMVFZWGZrL2Z2SHIwdW54UjdpTGpJd3NKdmVjZkJ2SkRB?=
 =?utf-8?B?MzBMRFk1cmkzdHpSeHcxc1JkR1dkaGZxOThkMkVJUlRQTnZrRUxTK0RhZENy?=
 =?utf-8?B?ZEV6ejB0TjhKWitvdjJTUlovT0krRlU2a05XNHpLdTdxVGE3TEFNeTVObGZy?=
 =?utf-8?B?aXJ5bk9ZQmkzUnpkdmdFbklaTzlId0Yra3RWVCtzVVBtV0dYOTVUdkVXU3E3?=
 =?utf-8?B?cW40azJtY3dkSVlLRGM5a2VEc0pPNUVMZnVvSUl5N3pweGs3MTZsVVpRMVli?=
 =?utf-8?B?M2FsYTBZR0hIN1lCRWRTaisrY0pzTCtzOTJQUGI0elZnbldLZFh0VHBmTjg4?=
 =?utf-8?B?WStTazlSelIzVGx3b21ISDFiUE5lR2JwdFZHcHQwdmJYZjk3ckxIL0hZbzY2?=
 =?utf-8?B?c2gwdHFzSjczQ2xveGJsSjFubEo5ZnF1T1JGUDZvcm10VG9wSHBucTVpNldJ?=
 =?utf-8?B?WGFtN1dCRFlDcXh0Mjh5ZVBzOU1kMXJzVUQ2a1B3Rld4TXIyMU1BM2V5bU12?=
 =?utf-8?B?YXRFNFhzbCtHVUxWQktXZGFqd0ZBb3pLeEw4RFNyc0JvOXk0eWZzMUUvL2ND?=
 =?utf-8?B?eUlJdDIxbnhKVGpJdnJ5TDE4akoxYkFZZmtlQWZ0ZW8rT0l3bzQvSm9NL08r?=
 =?utf-8?B?am8wTUM3bFp0c3lWdFl2VnJCMWIzbDNMV0RCLysyRTFJdWR6Y3g3QjVCeHRr?=
 =?utf-8?B?VVE5UURnWDMwSldpOG1yb20zUGJjeUNMMDYzNlE0OGpvOFVaMEszTmt3d2lR?=
 =?utf-8?B?aUFXVUhPTHVOOG9YTUVybS9yUTBESU5Jekw0ZVk0RENySndvSzBxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22C7B65E0AD39C4FBF34C368F1B56F02@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	vjgIylFouwpz9US4eI65TIUpwENWoDAgJ6kcRlvNZ+HQZ9EKCdjjg8GLgggiPJ4jmQyuolzgxemRmsDiuQh1JLFx7WdUTbCz+qPhWw4/pVKPsKckyM5Z+EN4I8NcTu1b3fTDt+Zv7eK1lNuu/esXkiDFmvD1ygQIRfhLw6p60+PsX/Ncf+9VXEmq1jetBux23RmD4kIQqBSGTNhLegI9JhSaz5r54hcYp2uqfgW/p5Ff4yrxssvFgRnoXXBbHTVTbNtVHDiGaIUBY7tA9bbnB67hFGAwRsm1BGtQw1jZiM6FXAIDyfP5N6YaDeevtkj5w1ypxUBnazI804IdVnjCCg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gNx8jY+pq4Be/0VbgRmdnTdyXe2/CehNsYQRYb9T55YFi55LamLLP4BqnN4/nDOf4BZZF1rEB/IdJoGtLs9yM+CwhXlOX09Trbgj3MkMmsslxJB/lkWbaKjA8hqkfRbd1opWueGkRY/Xob5Dw5yCCOU80gnvA3jFOIqY+IVMxU1AjnBX5pzbFulATbyICzj9GgAjqESqylHZGS25NQwUm+ayj5ctzvorcK8AQf8A2w6XQvXOdx+BRGgqJDRuM79unAIQ501TwzPXYWMjhEWzj3U0rYXtb17IK0ZTHXDZZso9rwg+3TvPV3F14BbYBjeZvYFuN71egHSa33cLCeiHWBY0ueomxsOuaJiSX/IdXcuNUWGsmiK2ohzWwmUU6a3lwtyFQK52q8HGHzjYNJAMW0wpM2p1VVYm1c90V0HbzvRleB9Sw4Di5ifQ811hDFfbaFF8t1I6P7k55nvlgon0j3+lS13mjZIb+z1yx9qXawpk7X9ziv7Yr76KRfE945s1mAUVG8Jc/GsY4LRo52bDQAcMeIF0ej4FqZ17rz5M1l66Z0FayQxGzPIFSogvQTXmF60Y8jVdNLWrQpG27C0FtVF03T2wBYZnuwX1uiGvN+d9yRU7e6min95sgz+LVZ5vUE3k+x1JWkS0QFkk4iD4jA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8594a30a-bdbb-47b0-0b36-08de848d1612
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 01:24:22.8176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mw0cuOZqGz24mZsclxGbRnZsYVlpJb7g8/UwY/Ytp4f04O123uuXDtmJOEmx1qzVo7HeYYa2sHNFVsVr0aUDpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8784
X-Proofpoint-ORIG-GUID: 7qEMRI4ir-EAXDAXc7fghBlIIF5zlSYe
X-Proofpoint-GUID: 7qEMRI4ir-EAXDAXc7fghBlIIF5zlSYe
X-Authority-Analysis: v=2.4 cv=F5lat6hN c=1 sm=1 tr=0 ts=69b9fed4 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=dqQ8RcJgTzKgpIuyz7kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAxMCBTYWx0ZWRfX7o5gqbeG9BSO
 YRpa6dKNo1BvYqOn3kD1c0JPtjP+YM3DEkaAEgcvj1sVFsboUads7+jKmWpQnLgn+5zKv1A49Gd
 a/MP4RhlQDOv9Y13Kxa8JXi6yyYUq6sNSLyBMKbFpnJOkUA/UNRPLSCtnJWHMAV6/ZNFhKlDMhU
 Jy/TR/nBuMRMnEPvonqQ12evHUoqB3T0OPnkQWVOydO0TUDZxMs16ou2F9+SLlc1OA5pQ4i2gi7
 OhLU+zou6H4ktfxuA4FULB9xoZszXfO9lwSAdGcI1jF4/fNbtZ5tveS6ac+2on7WTPfitYjf1Uf
 jMxyk07XYMpR+TkiFg+UGA74m2HEO7NsczIlTvQGNWteg55Eo9FFtNJL8Zp/uBTdv5thE7DPr14
 qO5k6Y66eUyyruFGch3ECh9jDLZUHNW43nIOntggOgCrZHLTWGazVD/ioWckqV9VkjJEyX17Lv/
 gcXMQYnmrR/FjQbu2Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603180010
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35006-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:dkim,synopsys.com:email,synopsys.com:mid];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.dev,synopsys.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,esmil.dk,spacemit.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 123712B4F04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMTcsIDIwMjYsIFlpeHVuIExhbiB3cm90ZToNCj4gQWRkIHN1cHBvcnQgZm9y
IHRoZSBEV0MzIFVTQiBjb250cm9sbGVyIHdoaWNoIGZvdW5kIGluIFNwYWNlbWlUIEszIFNvQy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwub3JnPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYyB8IDEgKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMt
cGxhdC5jDQo+IGluZGV4IGU4NDY4NDRlMDAyMy4uMjgyMTk5NjhiOGIwIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gKysrIGIvZHJpdmVycy91
c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQo+IEBAIC0yMTIsNiArMjEyLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkd2MzX2dlbmVyaWNfY29uZmlnIGVpYzc3MDBfZHdjMyA9ICB7DQo+ICAN
Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3YzNfZ2VuZXJpY19vZl9tYXRj
aFtdID0gew0KPiAgCXsgLmNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEtZHdjMyIsIH0sDQo+ICsJ
eyAuY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMy1kd2MzIiwgfSwNCj4gIAl7IC5jb21wYXRpYmxl
ID0gImZzbCxsczEwMjhhLWR3YzMiLCAmZnNsX2xzMTAyOF9kd2MzfSwNCj4gIAl7IC5jb21wYXRp
YmxlID0gImVzd2luLGVpYzc3MDAtZHdjMyIsICZlaWM3NzAwX2R3YzN9LA0KPiAgCXsgLyogc2Vu
dGluZWwgKi8gfQ0KPiANCj4gLS0gDQo+IDIuNTMuMA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5n
dXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KQlIsDQpUaGluaA==

