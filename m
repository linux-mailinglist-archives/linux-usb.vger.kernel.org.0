Return-Path: <linux-usb+bounces-33759-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDd1HN+aoGlVlAQAu9opvQ
	(envelope-from <linux-usb+bounces-33759-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 20:11:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1343A1AE37D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 20:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3262306BCC4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 19:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965E344CF5E;
	Thu, 26 Feb 2026 19:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KLb1KkMr";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ES0M+uZM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="feN62iLK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F36544B694
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772132724; cv=fail; b=sUmh7Vg2I6HUS8nIqOBhoD55MLHE2trxEbN1vWOpKL2ruU3h0NUv8ju8i072ulPggtEwMcGgO0Bg/Ya0OqWzz4kK8kbhnKvg0DsKZADY7d/skfUU7u1QSmIruU3lyRCe5kRSxDeTTAGnFL3KRsPmO7MdCDwYKP5BR12u0RbD8P4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772132724; c=relaxed/simple;
	bh=2Ut3YlwTEaNYkNTqWzIeUDLubv7rAalstgl51B+f3zg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RZ4NdG4QJI2ZeYYu6Lyeu9qhVY6DjoLruB43Pz2YUEhV7PwSCMnNUOQsWLEfkr4bSA6CAkwsOJIsyqfFOm9mv7aHjthIpTkBAphHYMTKogXt2Ad4J4JgfbLxPPY4cX+G/8hXr0/xM5EwcSoEFQrKyq1bfI9em1rUXdvD+UZpQ9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KLb1KkMr; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ES0M+uZM; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=feN62iLK reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QJ2IvN4176577;
	Thu, 26 Feb 2026 11:04:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=2Ut3YlwTEaNYkNTqWzIeUDLubv7rAalstgl51B+f3zg=; b=
	KLb1KkMrwpW7sHkuf8y3wbUrnTKiZXFz5vhQv++U1hiugwM0GG1fbulZohiYpquO
	UsiHuW2dBLDr4dsf4JspJuNtqmXq7Ef4irlNMd75AxAkmYh9aLjXfw//X28acUuB
	9S4qYy221y6riCATm4Y6Zni/fzT/WPBMBJF7T3RMdT7FuQWoEBq5Ovow/t4RAZrc
	AtTPgb3YMwUUkbdWMYg4/r+SEMDzqe6J6vjXlR9cYyuYUzX/6ToT27IUffJSAi5I
	PwbG8tR8jrTUlclpDWKW7PTYicpJMNVGeAThH9eTrQQhlSKndashRiBWJJPOV8FI
	bR0lqyivxsFZ9+N+jMEyBA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cjuysg0m2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 11:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772132683; bh=2Ut3YlwTEaNYkNTqWzIeUDLubv7rAalstgl51B+f3zg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ES0M+uZMW5FDh9jmWNaK2TF9KiqQTi2VPRFHKX5rPL2jNUKM0QySgPZX/qefWVYjO
	 T+OdR6mVnenaUTZyTahWY1x2BtsQ80+k4nvduxePgO4Le+wUYXYQuxX2+Zc668OXex
	 TpSquQboHKBJuiYuZDmtyRjG5JA0GcxvyM2L1ZVRQYSIxqiG/ENmkgOcbgPLKix5ld
	 alW+hHx5A0ivi5bfRtbE5c0ZvAQvEfhBgm94FW8jlxJeMp/4cYKTgApCJDBMJEWu8i
	 quvkzHaYfUGW6kXHNMXvnfuBcb1yIIwdF2d9P9m8kNct1Ssj5bk03cEzOrmGA/Mnge
	 p8PgRnMwp67XQ==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DC8C040721;
	Thu, 26 Feb 2026 19:04:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A30E4A016D;
	Thu, 26 Feb 2026 19:04:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=feN62iLK;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00106.outbound.protection.outlook.com [40.93.1.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 26E0D4068B;
	Thu, 26 Feb 2026 19:04:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCEoaWMQw3sDRZYDOj7I5s/Ai7dPFJFRPbSjiuCu1glJ2yIu84Y2sLLO6zgX/kQ/Pj4qggB5EIJeufLLJEVGLSHkGb4jpv8bxReHs33tEkG+sth/FuqA6El4UBLC+IzeBSWxiF+KE1Nfl+UjbRtMJpmRX+CKNV6n9dSEuIGUq5P+KCpnLWC3BUQW0eAERIbjbwcTUuI235IE7ZalwyqXsNe/S+57sWkKCZQQGRkgEvYYiZbio4Ag4ofZYfF1sJd/UyS2wrNn0DPtctVDN68pqf0yuvxJdJESEvc3b+J87GO80mQgp7J2x2kz5zcIzz6YYtJf/39feOa3EEoQHldkSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ut3YlwTEaNYkNTqWzIeUDLubv7rAalstgl51B+f3zg=;
 b=Fhc7bcuiBtZh8lrrhFKuOZkl6x8E9SImN6gb59wDvBx2LYzErZnoGgy5Ve6HGLi7PYzf/j1sPLExB7TWoTI2QzVyec77t7PoNNgLD4AkSXq9iQWRCSR2Nq/Bi2TgAMMGZDMNBkReKMjfCtnZvGPux0YyOX/oenglxZK/pBlGhS25awtYSGZp3rAQ8gSmkZ355VJQSTAnWTEd8TlIhXzWQyKkvmQvhhUQjanXBmvoLInUToUt1wSNaMY9rb8DexPfoehekPqYZ8JhL3J/xNmpedfi0kOslVLY6XDM0XspJAETXO0TBRlDS1FR9GE3IYHc60jchM9cEuIY1+9IyjLwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ut3YlwTEaNYkNTqWzIeUDLubv7rAalstgl51B+f3zg=;
 b=feN62iLKk4wBFUzhuOwVNtnviTLd4LhwCft6LAOzzYqdsbZCV1J2bul/DXcNPcgIyUvmvoFGXxDDgb3ij1AsbBYIpG3CCiUCOZpF1zYlGD5JxTxd6mLlxeqKN/c++JVkqyqM3BxVckKTWCXiErxoueRHhfFHfu3P9hKLJkPYIOU=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 19:04:38 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 19:04:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: dwc3: Add property to insert
 delay before TxValid.
Thread-Topic: [PATCH v2 2/2] dt-bindings: usb: dwc3: Add property to insert
 delay before TxValid.
Thread-Index: AQHcplcq5wKRsoiC/U2CZtBcYSUwL7WUzwiAgABZrACAADAYAA==
Date: Thu, 26 Feb 2026 19:04:38 +0000
Message-ID: <20260226190432.jq6c3gxwy6dydwpc@synopsys.com>
References: <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
 <20260225130323.24606-1-ingo.rohloff@lauterbach.com>
 <20260225130323.24606-3-ingo.rohloff@lauterbach.com>
 <9d59395b-ae39-40b3-af21-75468ec34cd8@kernel.org>
 <20260226171224.3ab6b68f@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260226171224.3ab6b68f@ingpc2.intern.lauterbach.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH2PR12MB4277:EE_
x-ms-office365-filtering-correlation-id: 737a777c-49dc-4028-5934-08de7569e3d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 tCiEcjEHWO+9+ggUt6mODb4af5fSEOY9YLUlBiSrrRxyyam0THdwXNwrozkr6nmxwiCwRlwrmXunnYAkknz1deL4p+uaPTbNGz6iqlmtSUAtAtV/pTErXRgc6gM9TFyFdGQXFyKLOyPVlPgRcHCUCGibaeVzhU1pq/7YHuXz+6RUDkMCg+8BIUlj4EY7/ISHw+eI8OedoOxQwmulrzUdQJ8nZp8/YCuBw25R0AgW16eKzmLCwmCn+Vx92nIbZsQazpwH/IKYAQv2xfoRNVW5SKCSyl5MaVtz02wMuJHA8lJTbxjxqIxJX+XaSmWrTLu1zERbLK7Bc2rK/s2VEzcNAOXPiLaLktLbxThvWx2xkNqnUgamNMicys1b8Ypphv82aOEPWHe5vNtuwSpoY3o7P7shFcHenzLLpmV8vQsFncmggRlX1LQGLoSsfQtJVKIVn/E8ZXHavkAmt/x2ZKktvO4Fa53jcWniwmksGZBaj44zjv5cTk3SdVYlFb9cAovjcLuD+yF5hZycowjcReiUw9B1oPc2d9Dm8pt8V5IEtXt9Vb65mt5ply0dSl2eRTxRqCD2YTHgCUuI+XBOBPGbyy0VU+KhG2A3ZgR7ut7LEsnPR9YQQSVB/WQStMF4d07gD6WtprqZ9dcGNk3SaekentGb9vKC0CNP/ypeXmy5oeFtUwgP7tCzqyzit/HXoIXXB4Ozj9QOQfZO0tKvhPLUSfOyAEjwW0F6mjnn6anbAKGSBnPkmSC4orlOd0Pwpeps
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QmxnWnpBZzF1bXUrOFMvckRiVjdwWTg1Q2xjK3c0Uno0cjB1a0c0bE1GSFBr?=
 =?utf-8?B?ZitkUmlLZVMzRldmdGRGbnlJSjdPZDRoVXROOTBvdzJHc2x6Y2x2UzZRK1Zr?=
 =?utf-8?B?d0tOczk2RnVHLzk0ckJ6aXp1bk5SYlI5MEd4YTdrbzcxdVoyazY1MVBXV0ly?=
 =?utf-8?B?S3JBV0tMemYvQ2FwTHM1enJNeHV3Rys5WkZyY2pYOFRQZ2wwa3pLdFRRTW9G?=
 =?utf-8?B?SGkwMXBqbjJBRkI0TTZrb00vazFrMVFkNzMvOHQwUzNZQzZBM3BaUjdHYzl2?=
 =?utf-8?B?UDBEZ2M2OUxCYnJUbkdtU0loTWhJaTdQNzZNeERYMXNLQmxreHpwalloQTV3?=
 =?utf-8?B?MisyODVBSXVTd3VpZHNtYUNyVnNkT2VyK0t1dXJEc1JGNDFBNE1EQzBMQ2lC?=
 =?utf-8?B?VW9lSzdMZWtCRWhsdmdXeWNkbW10dm5McElRSGRBL3JjSHpLUkVvVTJyeU9z?=
 =?utf-8?B?Z2ZXaHI0MER1cFFrb3NhK0ZaWU91cXVvZkw2RFFMYVpjSVoyMDFPNTNxSjZ4?=
 =?utf-8?B?MUNUaU1ndko1VTRjbWd2UWRuSU1LWU5vUmw1aHJuZ0l6cTFEdk9vbkkwQzZa?=
 =?utf-8?B?T1JybGFoMW9UR2hMS3FVcFZETkdzdUtkL3hlaGlPT1B2TlhVMjNOK1NLd2Mw?=
 =?utf-8?B?ZDJtSy9oY3pxY0tudS80Z0llNzVUM2pjSGZJeXJ5c21ZcDl0cmRDaUNHcS9J?=
 =?utf-8?B?a0NyRTdla0svMWtMNXduZUwzT1dKRTZWUGZxYWQ0WmZFYjhZSGN5NFBXNkU3?=
 =?utf-8?B?cy9HcnJDcDYzR3VwSVo0MTd1T3BydkFQZTFNcHUzTUZ0OUUrS1VRN0VhUnIy?=
 =?utf-8?B?QTYyV0N5cmJCeENFNlBUVXZ1Q3ZKZjRuNXhaTmVFQTYwTjJWelBsdys3MGd4?=
 =?utf-8?B?c1p0NGRRZUQyckZaLzdFVWJTSEt2SjYrbDZlTm9XNkg5cFNLZ2dQcEFsWHZH?=
 =?utf-8?B?MUhNQXBzZHM5ZytiMUVEQlBnMU5WLzBIYXZKT2FCQXQvYVBGczRSazlWQlgr?=
 =?utf-8?B?UEcyelFIMnFKM0VBREoyUFU0UlVtOFVaajFKeUk1MmtWWDZ1OGZHem80YTZZ?=
 =?utf-8?B?ZE5BY3QwbHB0OU1hSkI5YUx1S1pJMDVoOVE1L2xCUXdJZnh0RTY3UEtRaEw4?=
 =?utf-8?B?aTNLR2FvZTRrbVZTWCsyV1NOdVM2ajdwWEs0U29RSTFnckN0NXVreFBRWEtq?=
 =?utf-8?B?TlM2THBoWVJ2UEl4QVo2aTNSOGxhbGxweTJtdDM4SlRyNmZyQUF3dGc1NVpB?=
 =?utf-8?B?aXRUMkRjOU5rcVB0STVodXp5M202Lyt5R1g5SHN6N0tRWVFYcUpTM3RXaHRO?=
 =?utf-8?B?SXJ0dytHVDRtbGxwNmx4TUhad1FacmpSTTNac3ZEUHdvQ3VsWGZ2d21zblg3?=
 =?utf-8?B?UWVXelJhRk02VkIvM2NIQStLdmVLN2xqM01MMmE0UVN6SUFXeXRzOG4rbHJU?=
 =?utf-8?B?eTJxcitGSTA3Y3A0MkpiSzA1NXhDUHlqUnZoWW1GRERDdkdsRS9keU5HKzNP?=
 =?utf-8?B?VTlVSlMxQkZsK0ROWlBkK1BVUkJjWWc1WDlHNjZXQkJ4cy9WOU1FaSs5aFdR?=
 =?utf-8?B?NFFhRjVlMEdSdGVFOFJ5L3VPT3l1MUh2OXRSbWJDUEwxZXlrUHNEQ084N0lR?=
 =?utf-8?B?d095OHJhU2Jhd2U1VS9iYkVIMGY3TzgvTWhhamxySC9JUS8vL2wraVdSSm93?=
 =?utf-8?B?ZEdtWHUweFE5TzZEWEUvNjRQYUFCTFA3ZGhBcEQ3OHVYalh2VVJvQy9zSzFl?=
 =?utf-8?B?b08ycFlGUWxTdHpoNFc2WGQwSEFzS1N2SEZRT0UzSmhGS3dJZUYrV29XQXhF?=
 =?utf-8?B?aEhXWmZpbmFWbUZDelQvSWZSZDg5ZnlxZlA2N2lFbENqbE9Rc2xuQzkrQXQy?=
 =?utf-8?B?Tms1UGFxVHdKMzBFVzR0dWJZNXpTSGlRTG53VnNNMGxkSzFxYlMyU1FHeFFV?=
 =?utf-8?B?RWVOWDNyV1diZXhEZ3JoeWt5NEZDQmtnTXVlaEE3T3pSWnlDdE40NU9ucXRH?=
 =?utf-8?B?MVB3M3c1ZFl2T1YvMlZWbjdlNmFxWmtSUWpPTzZ3WmI1RysrNVlJZEs5cXNj?=
 =?utf-8?B?S1ZqN3hqcUpmdnp5cFlxYVQxMi9yc2E3eEh3TVN3dllocU8ybW5yS2JIZkJt?=
 =?utf-8?B?K3hTZXF4RWUyV3p0UjJER2t6OExZYUtFVWNMS3NONEZnV3VzcGU5aUdMTVQy?=
 =?utf-8?B?Y2RXb2ZLdWRIUVFGNHduS05BclRXdldDTllQa0VJbHlXN04ybnZiQUhOK3Vs?=
 =?utf-8?B?eVBoKzc0emJSWVROejh2VFhSVHpqRjZvc2tmUmVraTIrdk9ZRTdJWmNTc0hJ?=
 =?utf-8?B?UUlNUlZHNTQzUi9KbCs0S3JBSnVhbVVHcEFtQkpsVUN1d3MwOU0zdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76182F752A0F6F4BBD89C03D8FC1A76C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	V/pQ3jX2EGZcAWljX9qVg84T0AZtDL4YE8PbpZJifc2X3cpMKG6L5yrIMN4lsVEtEAB2zXVuT1nBxocn+9TeS7nHXrj6PGTPFIEox3biaGjq/nJUBw80kUnHF7O/VyG618HD7F6ZK2sZSV1JbU0lazOwn+LJw7Yete8vBbiLP6rTDVfiXPiArskDjjZol4aOcxBd1IrKypRQBrCtLNEXfV9snvZd6WOil4LTc1HBASEEGlTA2Se3keHZ8ieqipJTpGwxthi5tqtx0tLumV4LTmNIPzz1BQN+X2bziF5XpfbHYwS9zWBoa6rkW9ROaXh6MJtHFMSW6XX/sA1b/4ftRw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BaR5I4EUlUO5XZirRt+QsqTixG/OBtIfDjbClOyP9IhAGW8OcStsQ4QLcYvyCzHcEtWMS6qeG6iLqtYGSZjUC47IrdQvPjgQv3S5RiqqNrNacNbp1OzEl8SO2zXFtNoFTDQH5SWuxF9FB+FJVN9greEKJn+bF0AiVuNPCCYEPe+g07q+AiAJTPavi/5l6YkQG63lBljuyYYT/8bIZpqKqjEIO5/OH8XfyPXe9O+n8vAUhvNaG7Zl+y61sQNDRUh9PtM7HBCrncq8SwEwGH1GgTWaVJSuVN87RGE3sVP0P0OrLSz2GXnLA4Zdd23CRXeU2jo9mRN1chnCZ4TsrPkBTcCpPOayB48JBdQN6HJmERQV40zByw2EpL+RcBKnA7G6gmLsW4ynPun4V8iVOEqP8TJj4hIdupytdhRWgXafu4GvEmN7M57OnGQEm96ZuPg3UnEj/k0rFqDah6FbOeIDBa9+bhzDND+fSCF/LvfFVwPu2HzjSX57utF6wssmmgpdahFgNRFTTTMgMEi1rS36z/f3L99O5L68GJyV4RlIHieVOe3bKOd2D6F5qSQKLt+weJkhsYBXoYdyihWpD3N5jSN7g/UbGdAq+jEUF2NlFGLcMPweO/fl0aVapMCKx9zltnl7BgiOKMaKJ8fAcUkf/w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737a777c-49dc-4028-5934-08de7569e3d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 19:04:38.7680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9K09OTjGj2WT38El6+1Vl/kWtD0U+tekW3/M325+L4BxYSivCdriuz+wOB1xqZQsGJiThEbUL8XezElUmOn0qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE3MyBTYWx0ZWRfX+4f6EzON2kJu
 hRIeVG/UyPnhHSFmdBzJJhimK2X4JNmixZSU18LBH/WP38pfKHdOv6TCkvjcg6AYmsMulzuUDuA
 KCNEjIBg8OWIf85zkJje0sNU0sBEu0z65AW234PJ9ZZFueKO/8C7vhATgbOs2r31kaLrNaHalCO
 q6cPjtHTwq4hFhw29MEx9eMiBJmwnsyjMIwSQ5ZVAXOUQTHV/1WzIWdOAkL54yILu/8GACMfBBd
 W95ZiFFtPOYKinNqmHUYWYmNOo1WNuv3Ro+bcxSdv2EX+dtr/mHdxmylS8n9+2iMrwSfri35SBv
 Ow8yUDKN8pT7hmNVrAwrK1JVHjle9nCcG1NAsYBBCpGYmK/d3Tmq08czKsy/MobaMEE8dSo26Hq
 Q4C6cGcX/fGhWdwhO746mMcqcVH6rv/A6S7eehjT2iFX2JwpjX2E6cb+6LxxubdGNBT2iCnVUDZ
 twxR69UkTpOH1/ubmQg==
X-Proofpoint-GUID: Gh-0mpOfp5bpoomUg7iMo1l0HZQbUEov
X-Proofpoint-ORIG-GUID: Gh-0mpOfp5bpoomUg7iMo1l0HZQbUEov
X-Authority-Analysis: v=2.4 cv=eIUeTXp1 c=1 sm=1 tr=0 ts=69a0994c cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=XYAwZIGsAAAA:8 a=VwQbUJbxAAAA:8 a=oKJUcY6HKugKZEsw02EA:9 a=QEXdDO2ut3YA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 spamscore=0
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602260173
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33759-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,urldefense.com:url];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1343A1AE37D
X-Rspamd-Action: no action

SGkgSW5nbywNCg0KT24gVGh1LCBGZWIgMjYsIDIwMjYsIEluZ28gUm9obG9mZiB3cm90ZToNCj4g
SGVsbG8gS3J6eXN6dG9mLA0KPiANCj4gT24gVGh1LCAyNiBGZWIgMjAyNiAxMTo1MToyNyArMDEw
MA0KPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4g
PiBPbiAyNS8wMi8yMDI2IDE0OjAzLCBJbmdvIFJvaGxvZmYgd3JvdGU6DQo+ID4gPiBUaGUgTWlj
cm9jaGlwIFVTQjMzNDB4IFVMUEkgUEhZIHJlcXVpcmVzIGEgZGVsYXkgd2hlbiBzd2l0Y2hpbmcg
dG8gdGhlDQo+ID4gPiBoaWdoLXNwZWVkIHRyYW5zbWl0dGVyLiBTZWU6DQo+ID4gPiAgICAgaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly93dzEubWljcm9jaGlwLmNvbS9kb3dubG9h
ZHMvZW4vRGV2aWNlRG9jLzgwMDAwNjQ1QS5wZGZfXzshIUE0RjJSOUdfcGchWVJ6WmtMVFpyNUJo
aDU3RmlYbXlxN2U0d1ZQSFViWFpkZ0gzYTYyN08ya2J6cE9UUGl3XzFNS0djX3pENWNyOF9ZLXIx
aDVYdnlGTDljN1lSTk9iQWwtbG1VTmdTdVUkIA0KPiA+ID4gICAgIE1vZHVsZSAyICJEZXZpY2Ug
RW51bWVyYXRpb24gRmFpbHVyZSB3aXRoIExpbmsgSVAgU3lzdGVtcyIgIA0KPiA+IA0KPiA+IFNv
IHRoYXQncyBkZWR1Y2libGUgZnJvbSB0aGUgY29tcGF0aWJsZSBhbmQgeW91IGRvIG5vdCBuZWVk
IHRoaXMNCj4gPiBwcm9wZXJ0eSBhdCBhbGw/DQo+ID4gDQo+IA0KPiBUaGFua3MgZm9yIGdpdmlu
ZyBtZSBhIG5ldyBpZGVhIDotKQ0KPiANCj4gVGhlIHByb2JsZW0gaXMsIHRoYXQgdGhlIG9yaWdp
bmFsIGRldmljZSB0cmVlcyBwcm92aWRlZCBieSBYaWxpbnggZG8gbm90DQo+IG1lbnRpb24gdGhl
IGV4dGVybmFsIFVMUEkgUEhZIGF0IGFsbCwgd2hpY2ggbWVhbnMgSSBkbyBub3QgaGF2ZSBhDQo+
ICJjb21wYXRpYmxlIiBwcm9wZXJ0eSB0byBtYXRjaCB0by4NCj4gDQo+IEFkZGl0aW9uYWxseTog
VGhlIHBhdGNoIG9ubHkgd29ya3MgZm9yIHRoZSBEV0MzIGNvbnRyb2xsZXIsIGJlY2F1c2UgdGhp
cw0KPiBwYXJ0aWN1bGFyIFVTQiBjb250cm9sbGVyIGhhcyB0aGUgbmVjZXNzYXJ5IGhhcmR3YXJl
IHN1cHBvcnQgdG8gaW5zZXJ0IHRoZQ0KPiBuZWVkZWQgZGVsYXkuDQo+IE9mIGNvdXJzZSBvdGhl
ciBVU0IgY29udHJvbGxlcnMgbWlnaHQgbm90IGV2ZW4gbmVlZCB0aGlzIGZpeCBhdCBhbGwsDQo+
IGJlY2F1c2Ugb3RoZXIgY29udHJvbGxlcnMgbWlnaHQgYWx3YXlzIGhhdmUgdGhlIHJlcXVpcmVk
IGRlbGF5Lg0KPiANCj4gUmlnaHQgbm93IHRoZSBwYXRjaCBieSBtZSB1c2VzIGEgZGV2aWNlIHRy
ZWUgcHJvcGVydHkgdG8gdGVsbCB0aGUgRFdDMw0KPiBjb250cm9sbGVyIHRvIHNldCB0aGUgWENW
UkRMWSBiaXQgdG8gaW5zZXJ0IGEgZGVsYXkgKGNvbXBsZXRlbHkNCj4gYXV0b25vbW91c2x5IGRv
bmUgaW4gaGFyZHdhcmUpLg0KPiANCj4gV2hpY2ggbWVhbnM6IFRoZSBzeXN0ZW0gZGVzaWduZXIg
bmVlZHMgdG8ga25vdyBpZiB0aGlzIGlzIG5lY2Vzc2FyeSBvcg0KPiBub3QsIGRlcGVuZGluZyBv
biB0aGUgdXNlZCBVTFBJIFBIWS4gSWYgdGhlIGRlbGF5IGlzIG5lZWRlZCwgdGhlIHN5c3RlbQ0K
PiBkZXNpZ25lciB0aGVuIHNldHMgdGhlIGFjY29yZGluZyBkZXZpY2UgdHJlZSBwcm9wZXJ0eS4N
Cj4gDQo+IEkgc2VhcmNoZWQgb3RoZXIgZGV2aWNlIHRyZWVzLCBidXQgYWxtb3N0IG5vbmUgb2Yg
dGhlbSBoYXZlIGEgZGV2aWNlIHRyZWUNCj4gInVscGkiIG5vZGUuDQo+IA0KPiBUaGUgRFdDMyBj
b2RlIGRvZXMgY2FsbCB1bHBpX3JlZ2lzdGVyX2ludGVyZmFjZSgpIGFuZCB0aGlzIGZ1bmN0aW9u
IGRvZXMNCj4gbG9vayBmb3IgYW4gInVscGkiIGRldmljZSB0cmVlIG5vZGUgKHdoaWNoIGN1cnJl
bnRseSBkb2Vzbid0IGV4aXN0IGluIG15DQo+IGRldmljZSB0cmVlKS4NCj4gDQo+IEJ5IGluc2Vy
dGluZyBzdWNoIGEgZGV2aWNlIHRyZWUgbm9kZSwgSSBjYW4gYXQgbGVhc3QgbWFrZQ0KPiAiZHJp
dmVycy91c2IvY29tbW9uL3VscGkuYyIgcmVhZCBvdXQgdGhlIHZlbmRvciBhbmQgcHJvZHVjdCBJ
RCBvZiB0aGUgVUxQSQ0KPiBQSFkgdmlhIHVscGlfcmVhZF9pZCgpLg0KPiANCj4gVXNpbmcgdGhp
cyBwcm9kdWN0L3ZlbmRvciBJRCB0aGUgRFdDMyBjb250cm9sbGVyIGRyaXZlciBjb3VsZA0KPiBh
dXRvbWF0aWNhbGx5IHNldCB0aGUgWENWUkRMWSBiaXQgdG8gc3VwcG9ydCB0aGlzIHBhcnRpY3Vs
YXIgUEhZLg0KPiANCj4gVGhlIGNvbmRpdGlvbiBpczoNCj4gKiBJZiB5b3UgaGF2ZSBhIERXQzMg
Y29udHJvbGxlciwgd2hpY2ggdXNlcyBhbiBleHRlcm5hbCBVTFBJIFBIWQ0KPiAqIGFuZCB0aGUg
ZXh0ZXJuYWwgVUxQSSBQSFkgaXMgYSBNaWNyb2NoaXAgVVNCMzM0MCBjaGlwDQo+ICAgKGRldGVj
dGVkIHZpYSBWZW5kb3IvUHJvZHVjdCBJRCkNCj4gdGhlbiBzZXQgdGhlIFhDVlJETFkgYml0IGlu
IHRoZSBEV0MzIGNvbnRyb2xsZXIuDQo+IA0KPiBJIGFtIG5vdCBzdXJlIHdoYXQgdGhlIHJpZ2h0
IHdheSBpcyB0byBpbXBsZW1lbnQgdGhpcyBraW5kIG9mIGF1dG9tYWdpYw0KPiBhbmQgaWYgdGhp
cyBraW5kIG9mIGF1dG9tYWdpYyBpcyB3YW50ZWQgYXQgYWxsLg0KPiANCj4gQFRoaW5oOiBJIG5l
ZWQgc29tZSBhZHZpY2U6DQo+IA0KPiBTaG91bGQgdGhlIERXQzMgY29udHJvbGxlciByZWFsbHkg
bWF0Y2ggdG8gc3BlY2lmaWMNCj4gVUxQSSBWZW5kb3IvUHJvZHVjdCBJRHMgdG8gZGVjaWRlIGlm
IHRvIHNldCB0aGUgWENWUkRMWSBiaXQgb3Igbm90Pw0KPiANCj4gSG93IGRvZXMgdGhlIERXQzMg
Y29udHJvbGxlciBnZXQgYWNjZXNzIHRvIHRoZQ0KPiBVTFBJIFZlbmRvci9Qcm9kdWN0IElEIG9y
IHRvIHRoZSBpbmZvcm1hdGlvbiB0aGF0IHRoZSBYQ1ZSRExZIHNob3VsZCBiZQ0KPiBzZXQ/DQo+
IA0KPiBSZWFkaW5nIHRoZSBjb2RlIEkgdGhpbmsgYW4gYWx0ZXJuYXRpdmUgd2F5IG1pZ2h0IGJl
Og0KPiBJbXBsZW1lbnQgYSAic3RydWN0IHVscGlfZHJpdmVyIiBmb3IgdGhpcyBzcGVjaWZpYyBV
U0IzMzQwIFVMUEkgUEhZLg0KPiBNYWtlIHRoaXMgdWxwaV9kcml2ZXIgY3JlYXRlIGEgc29mdHdh
cmUgbm9kZSB0byB0ZWxsIHRoZSBEV0MzIGNvbnRyb2xsZXINCj4gdG8gc2V0IHRoZSBYQ1ZSRExZ
IGJpdC4NCj4gDQo+IERvZXMgdGhpcyBzb3VuZCBzZW5zaWJsZSBhdCBhbGw/DQo+IFRoaXMgc291
bmRzIGxpa2UgYSBsb3Qgb2Ygd29yayB0byBvbmx5IGZpeCB0aGlzIHBhcnRpY3VsYXIgY29tYmlu
YXRpb24NCj4gb2YgaGFyZHdhcmUuDQo+IA0KDQpBcyBub3RlZCBpbiBteSBwcmV2aW91cyBjb21t
ZW50IGluIHRoZSBzZXBhcmF0ZSB0aHJlYWQsIEkgc3VnZ2VzdGVkIHRvDQp1c2Ugc29mdHdhcmUg
bm9kZSBpbnN0ZWFkIG9mIGludHJvZHVjaW5nIGEgbmV3IGRldmljZXRyZWUgcHJvcGVydHkuDQpJ
dCB3aWxsIGJlIHNwZWNpZmljIHRvIHRoZSBTb0MuIGllLiB3aGV0aGVyIHRoZSBzb2Z0d2FyZSBu
b2RlIGZvciB0aGlzDQp3aWxsIGJlIGNyZWF0ZWQgd2lsbCBiZSBkZXBlbmRlbnQgb24gdGhlIHBs
YXRmb3JtIGNvbXBhdGlibGUgc3RyaW5nLg0KDQpJZGVhbGx5LCBpZiBzb21lb25lIGludHJvZHVj
ZXMgYSBuZXcgZHdjMyBwcm9wZXJ0eSwgdGhlcmUgc2hvdWxkIGJlIGENCnVzZXIgKHdpdGggYSBz
cGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZyBvciBJRCkgZm9yIHRoYXQgcHJvcGVydHkuDQoNCkJS
LA0KVGhpbmg=

