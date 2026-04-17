Return-Path: <linux-usb+bounces-36301-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEqzALfI4mmR+QAAu9opvQ
	(envelope-from <linux-usb+bounces-36301-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 01:56:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 545E641F3CC
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 01:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A38EC307A5E7
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 23:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92DD37F011;
	Fri, 17 Apr 2026 23:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rWF0Rtmc";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TqwHt1ly";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mDxcPNxb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D861474CC;
	Fri, 17 Apr 2026 23:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776470075; cv=fail; b=c81tBm8ZBlAtUW5KVLyEPC2g0/ViNA9tfdBa5pKY07yQUXx7IHU2Pii1ll+duPiccrAMQaImK1oXXn0AHbFjutOOxphWeen8pKIjZE39v/umMx9rfcU4sFGynEeSsAnZAqzFlzdBGooocyQBR13VkhiZ9oZBXsAed5MGVrZ1o8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776470075; c=relaxed/simple;
	bh=/alXchkcI71RiXAgplAuxqn1kD0VALzoGVvtPptYr8g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SF8kgsAkQoJhd6aQyZVd55adRwLJ4FGrfvFEufTKqSMRtCeiNEFLIwJm9tFr9WGrLF8bNXzeLkPbISvsNf5zD9h/M3I4ln/ysq3uWB2JAws94xlUEzpsSibbBeFAxqGxGJRqt9itazw8d/MumwRkzsGc3GyCkSbvPtgkMAfizdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rWF0Rtmc; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TqwHt1ly; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mDxcPNxb reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HLfbZ1484140;
	Fri, 17 Apr 2026 16:53:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=/alXchkcI71RiXAgplAuxqn1kD0VALzoGVvtPptYr8g=; b=
	rWF0Rtmc1rgCsr28gR+/WsuRPTyU2yzIY1MG8C34bKLrfm1gQKcUW297w5BzXEt/
	wq7uXvZgdmUUPxIhsWHW8MgjkxweLc1wDralRdT0lViLw0b34tpinWzyd+IMTL5V
	iUZtuy35wel4U8ofZMoyk/mvdJG737/iJ9TIsvBDtyszIMeOH5Qs7wrU4tVx5kUS
	I9kiz7naEtuD1sYK81hSM4Je7f48isjNsN/QvMCiPOOJpinvEv1/o+AAImHXAhZM
	WEKrSuiNgZ/FzYbB4pgvZ92l3cAlPsUWgbpGR3PSW/2L4XG4vbzNstFbaB3aVuiN
	DCUmRXvsSwzTh843zU/2og==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4dkn1xk9a7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 16:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1776470032; bh=/alXchkcI71RiXAgplAuxqn1kD0VALzoGVvtPptYr8g=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=TqwHt1lytfTrwe+f8LVoucCrZtpTBKpjzCMm1gsoPSYqdv5r1iY1CY3G/tJ6rkH64
	 SRKyxExc75E3sFUENDARBzu3Kp5S7e4jqasSujKh9wRiMIaRKOgB9DC6uoDb3YuQMD
	 WXvVn7SDqaGkZ1+igKCPV9byXqynB34hUPQOPY1icosy2Htu237L+4sJxqQmv0Fa0D
	 mqE1k8cOvyfl4DiX7eQcaLg+hgBHmZLztA1R7bgG09X1rkh83YlQECK7x0+qmWqD03
	 u2bCdyZ4ySdHuF2Ij7leW9VeIlpcRLDAkU0ks1kaRAdopzriwD0fuLRl9ZAAC8jX03
	 3OrvQgv+W8Qlw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4BC7F4034A;
	Fri, 17 Apr 2026 23:53:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5D083A00E9;
	Fri, 17 Apr 2026 23:53:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=mDxcPNxb;
	dkim-atps=neutral
Received: from BL0PR07CU001.outbound.protection.outlook.com (mail-bl0pr07cu00104.outbound.protection.outlook.com [40.93.4.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E5DC340B1B;
	Fri, 17 Apr 2026 23:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n94QV7tv5iYZKrA/qulQ7McSTTAot06VAB2QVVPoGhdPBKZP2zMZwWt7g2smYDls5qK8Umoc0fk5GcasgrxkQVvbxFUNUqf4TWGdu0da2CfZ3UPbPIJ08ZtMRTRVq79g6v7lWYCTZRYu2P3en7+q7nxqB7lRdgaPel4yZqO3kfmKvtLSCnQkh5yw1XXc3jRDQyO6g/ESS3SEec6GxXSEa1pf4goUhU+iczlzoQYnTrsDp2CYtHus9QxWR1BUIk9N20i5Ih6wt5tB8pEtiAWYUpWIckttfio+sk00AC+6ZF3hPBdzv95EYPsV8glZ4VDYoegTwiNoAmna8aiCu1ewOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/alXchkcI71RiXAgplAuxqn1kD0VALzoGVvtPptYr8g=;
 b=yFSPmy+/GEXSwxcp8p7CxY0pdhV2aA0QuOHDdNAOul6YTc+pd1XjLXkczdg5UBswfoQndn77kEKNPAEpsqIvDAu/PFp2LLAf8qv+H918o5iNy27g7Khu+My8kFFO3Bl0t6Zc4Hy4Mohk6hwyPCKydVsux/RV5u9QHtIgiyTbxHBPvSqVApBcpv7z2HQPKv9UXX5qoMIxWDCNS7Q8m+w3rL4SQ9QW0Sz4wuKKdeX+FVi2EVIUhKisx0yyQkZP95ZDGy6EqCVzHqB+Cf8sCSJ+/vA7P8NcBezthL4HQTLz3oxQWri4P46WsOarlfkx6fXG8Fb1xo6gAirZgt/ez0QVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/alXchkcI71RiXAgplAuxqn1kD0VALzoGVvtPptYr8g=;
 b=mDxcPNxb/QT5YyO8isWqtzcFKA6jDGfMIMRlkFEWRvcYDQ18xQKm13sRmAiII4rcMUBE+oEtCpgvXP6WXmdef+AakPZLMAbjVqqHzgziA1Q8ipwwwYDvExEmEk0sTjehTdxZDqHIcWKPOBjS8gWxbPBadEsovvt9J/P5HA4f6yY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA3PR12MB7831.namprd12.prod.outlook.com (2603:10b6:806:311::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.48; Fri, 17 Apr
 2026 23:53:20 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 23:53:20 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH v2 3/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2
 controller support
Thread-Topic: [PATCH v2 3/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2
 controller support
Thread-Index: AQHcwHfvkbsurq92A0mBszGkTAdubbXkCcUA
Date: Fri, 17 Apr 2026 23:53:20 +0000
Message-ID: <20260417235314.m2adbtf7opyppf4e@synopsys.com>
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
 <20260330190304.1841593-4-radhey.shyam.pandey@amd.com>
In-Reply-To: <20260330190304.1841593-4-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA3PR12MB7831:EE_
x-ms-office365-filtering-correlation-id: 1f51e442-9180-4a06-7a24-08de9cdc8116
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 3SXrEtOg+Kfldz8+xr97+zRcMorSFdOVq+ex65zFMKQRBgO0eNGW+cNdZKuK0vnkNjdaXHBMt8wje6uAr3VHXEFj9zR6aiX7mer7SMfs+PRgGKvkRTBm5AMVfNXZrW3UxWzkOw57VpEfYZPB42bkFCdb69G7EfDMe20gSsFGd5jtRnVfmbrZkaHGWUXCdV71h0CDTKw3wsI9MlGVB0CPIzX/XadAHtP4hn6tIiyy+Wk2qVHNMW6nA7M2DoPZXHfBuN5exfpeqhzujDaki7bosBJnrWfH35vNZEmMIaScvbRUGF16BVO2IAOJy7JJf6JkJ7QSDUgJZO6suBl1A+eHJS4+4pzzRHTjNJHas8Uou9e7cHx/0Ii8gapq5WDE64GNMHqDw/LwzylnanE0rhWCBXgpKT8e3SHBFhx/tTmj+Uulb1hyEebBWEJFs/vSu0g/t2CWU2BzcYEHQrZdEj6N0WF0P9+173qUkXYPr6+5NIgV4cVM70Te4Eu8VU6eVQ/Bm9qWSlegTdhUEcEnNjrDvmxLNMNJ1khOuI7chXIkSDhDnEDXVvnjtOq+6gzvXHLCbTvFCpXkzvcXo3nYYNu0sjP1vAmyZGwq1gLenItcjo+UWGHSTRzfpsZ8absdWj34hEoJO0+v3gEV4631nCgxV2FzxqmkuRkkyi0RSzZ6gczXizlh0b5wE/2U1FHmnQQlhr4gxHFdhF3DIrjkNhv9nzvHPHtXBbHLgao1K9I34OHa7MyW66SHfgBb6oiJqUjcHJ6dTWImPOQFQx+OidSjGK0BPgRgWWVTEJylEznI1jM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mm03ZGFqbTVEaGtkOUJ3WWFOajZDWFRDUWZiL09zUlFYNFRjMlVTNUwxbWMv?=
 =?utf-8?B?SkQyU1JwZmZvck55NXVpdUQ2UlB0T1kyQUdtLzVHcE1MRDVZeXZaQ2hZclRp?=
 =?utf-8?B?WFBVVVFmNGhIVkNvaDZPellweER3WlF3K0J5Mk5HVTIrMTQrem5qKzZ5MjNv?=
 =?utf-8?B?ZXBNVU9YR0lsNDIrQ0ppNXRNUk0rUlpiSTd5WFFBMnhnSzNqWm1ad2xRNEZx?=
 =?utf-8?B?eHN1dzhkamZ2S0dWbmQ1Nmt1SkpjVEo5Ty8yMktYQVlXalJVV1RrcHJtUWxa?=
 =?utf-8?B?b2FOa2NEbUpRVzM5YzhtWEZVMkQ5U0JOam5mRUpDbkhldUtxN1RtNEpOdC9i?=
 =?utf-8?B?RU9iNVRpaWZqZkJtelVMcUlHYTR5NzBTQjUrZ3Fwa3VDTGNWd2ZJOExiRjJq?=
 =?utf-8?B?c2czTkg4a3NXaERZMlMrdDVaenVPR1VaZjBQT3h3Q0R0aG1NZ3NIMWVqVTNG?=
 =?utf-8?B?T3g4ZUJ3MU1IQ1JWMDVqNHFYMWZWeWxuc2NMZ3loUkI0T0U2TGVHeDdpN0xZ?=
 =?utf-8?B?bmNXbmJKQTJ0ZFBlZzF2ZVA4V0hHSUNRWmJQcG4xOFU5VGhYQnMzUkdaUS9B?=
 =?utf-8?B?TTdBV0xoZmlIVFdVTWdwZmVXWUFDeEI2Zjl4ZjNWQ0gxeHFxYkpWYjRkSHE0?=
 =?utf-8?B?M2w5RWF6YkhTZUczQSsyZUZKOHhtL2Z2a2hzOWVpZDA4WTk4V08yRm1VZjRr?=
 =?utf-8?B?RjlRSTJYMXgrR1RYSXBnY1JqQ25XVEVhcXUxOWNBQlJ2RUphOVUxaHVHVzQ2?=
 =?utf-8?B?L1hCZ1dQTy9WdzhwWTZqNXlZc2JvZnFydDNPbjhONWYxYXNpeFVGWnFvTXZs?=
 =?utf-8?B?NkxLNVM5TlZ2WC9xd0djVktiSkROSE9vVkRnN2NOc2dJeVB3ejBweWQxckhl?=
 =?utf-8?B?NTlZbUZEenVrb213bVBZL0ZTVnlXOFNDZ1RXdTRqdXBncGZ1YjBGWW9DOVhP?=
 =?utf-8?B?NytOZ0E3NHlia2wxRjkvdWhvRkY2VVlxaUl1VzAraUpRM3VJOTAzenhvVC9S?=
 =?utf-8?B?QWZObWJkM1p5Q25OR3lvQTdSMkVxZmFoQmNHUTJVdnlueW9mNEREN3EwWkx0?=
 =?utf-8?B?Q1ZqMEVzZm0zVWpLYnQ5WFlHUEFndFJuQWJnTmZiQnJhWkU2S2JXMExDSTFy?=
 =?utf-8?B?RTloWS9mSVVrR0t0T3BqeFd5SHNmemZ4UWxLYklhQnpUNEdaUEh3U29uY3hZ?=
 =?utf-8?B?QU5zanF6VHNoVk5TVHJhQjdNUlJDR0JFZHgzVjdlYXNEY1FONk9pOFJNSnAz?=
 =?utf-8?B?ZE5GSDhwY1F1ZUZJcW5GU2o0OFBESytVckZqMmpIaGVkR3N2dndTandVQ3J5?=
 =?utf-8?B?UFlWajg4bml1N1V2My9hOHBFNUtuMnZEQjBkMkMrOFczOS9YWVNXU01ld0Q0?=
 =?utf-8?B?MzF2WkxyUEFkTGxhZVdaY1FZWGd4WTRzck11Y1lTbGEweVpHMGgvclVWdHQ0?=
 =?utf-8?B?M0FwQTAvS1lMZXdvZU1BSzg5MnQwZ3NKNnRYN0hzak5mU3RKRHJZYmNTWWhv?=
 =?utf-8?B?M3llT1hRUkJSWnFHdWNtRVBHLzZndDZqSmxPRlN4Y2dycytuQ28wVS92ajY3?=
 =?utf-8?B?Y05GVmxpRkxaME1RZ1czUnUzQklSY0dIeGxTamY2SHczeUQvUklYc2hyU1BM?=
 =?utf-8?B?ejNjbkxPaVJWSGdsa3BNeGhCaU03SWhpck5SK3JlZmV1OUZOaXhHRE1PV2hh?=
 =?utf-8?B?Vmx3ajFjeEtqZkxLOWMzNlpZMnRCNkc4dW5DTHpkU1V1OGhsT0E0ZExFN2lp?=
 =?utf-8?B?NGwxZjNWck9TZU81VUxSSmI2NVUrcmVSM1dESUZsczlBcVNYdE9SdkpPUG9l?=
 =?utf-8?B?aGdZbVJiVzNjdHdNOVVsS3U4K0NBTnRlZFZSdGZlUzRpSUJkdmpzUjJXOGVw?=
 =?utf-8?B?RmhqdTVVNUJFTWxpZVZJc2EwWkZsdjZGeGNEMVBBdTBwMFJneGZVYmlUcE83?=
 =?utf-8?B?Z1NEamV1SjNnL3drVWdxRDYzTHdLOWRzZXZ2Q0hZRVN4YWRIWVViWHpyN3lh?=
 =?utf-8?B?bDZnV1hWYm9jamcyQXVzcXU4VlM3aDFtSEdYbmVYS1VKZklSZFVoZXFuKzg3?=
 =?utf-8?B?aEhpSDhWb0dtUXY4cWVrMWxHRWpHVmduNjE4S1IwejVHQmRLTjhmekZLa2Nw?=
 =?utf-8?B?SEJ1ejdYMktmTzlkQ1RvbWc5R3BWVHBnZStuVGUxK1J5bk9nVWVtUEl2TFJP?=
 =?utf-8?B?RTFrZWtKY21lamt4NEoySUpDcFFQd2h1MGVCcitXeDJKdk9vTy9sVTdVc01j?=
 =?utf-8?B?RVk5bklVSEUxcTZic3NiTnJWLzZVUDhkTjZkbHNPZVBjODRXZFlyekEzQldl?=
 =?utf-8?B?b0RoU0ZQdDkrZGw0MmRYWi8rd2Y1NHFhY295S3hSRnNlMU92aDRxUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B63AE3A0B8332242AF69E337DFAE64C7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	mY3T21r8B8yxUMIUI2LajDkl3ft27AXXnOGMjSCjgfgpISiKo1gfsK2P/ZBst1yPsFYbb/PRVB9gxdcASfuSFvMnu2zbSb6KLa6QchV9J/+ZBAqqCIk56qUxZtq8W3chPuBcyx7a1km3OJ1YRGSLJNC+ENGQknbYPm0AuoaurOFGEdnsT/GVm7jN6VjCeWP0dNoyo/ZMu3PtclEpA4DA1HUi6SKFxWoUIYp1nrDt5lfqDjGOvRfKIpcjK8myIB+DQ+bA0mGTeR7Jlr8mQOoPY50+JEYTj+xfbkHjSYDQ8BjbdUKST0hyN3NPCy4OgOTWo/Z908hi2tDRK7XF1Z7G+g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yYW9/oiL2F/ilvYaCZoX0E3k/ovS917va4cyEt7ovWf7PsJAn1DcYnPKEgXQB/vvlh25QEo+x4zxaMTXAG+aLq5Rin2EeGy5nWsD7C5H3I1f+p0MBEsBXf/NCawYfvWVTRrvd33H7g4GGRZ3zCtBRUkvS4O3gBlE9doiwU+tcbMphipP2NgEE5w+NfOfsWCoHOBLbH5SrkFxW7G1jXxxkpqsBmKO0FYca02DaOWbMgE1I9OMab8ZgZB8okNOo3gmUQ8eztTf3wmVuUdMr8gnnt0Qkwm9fCZXjmS9hesbCegBxEB+tpHMW4ruIyD+/HARuD6kwLzkxC5JFj5ps2LXiH99/ZY9ccPBb4wfm1j80BiixH4X75lrp0ExrVxeHgWyQPTz9HKhtMTs+3+6XqgrlZcNDACbhwXbjlwC9stPatH6rSIlpynV5Jwkl8VE3qfPZgpYSDoYjc2IjWheDE27VvFaLjSlzg3jvwn0F1ydlLIIQmesdQy13QKpdMRSqIQHGjif2U70HsvoLYU6O/FFNy9KLAoSpT9U369h52lltzBJc6iZSjDgyIOoAQ36cn3goO+DH5rzCeG2owgwjtQ2jSFlIrOOFP6Wc4v3TzLPN40iTOC1VfUDfRTKUNo3x2N/KrI2nCjovwO1dTStkJtWqw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f51e442-9180-4a06-7a24-08de9cdc8116
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 23:53:20.5256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hUMos0//swYB2n0+mi4rwIGeMkUVINAC48iVlCHK6zF5cgfzW/5qXAd0R7XqHWSPzx0wgV1hp9l5fr6palpo7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7831
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDI0MCBTYWx0ZWRfX095xqXlItT7j
 fm8gI1y4rDLign65+fHpFuKveIXEsL9v4AqF4zYwXQji9qp5uDwQyMugaXAg6K9i+Y35gT7/KCY
 AvmKnZ1G0zTZBVdExq+yOfVI0Yd6ggywvZhck6XFS62WRux0rQbN+WsMSwP0XNrP8wxfSq5a9rg
 uOzG8gSchncJMWv7C4kkRifjxt3wiLB0aCl0y3OPNAXzqpEZHCkTHYjsO283X7Q+vb5ckr2Y+9c
 xrR4k4W26bTuSR4eybjx6qbz7jc6bX39Dwhf0gUoS3KaQ4c9eTVSV6qswyizsZP70ZFQUghjXl3
 gfmOWKqr91Fgay8mZ/BtFp5sOxTzsSUfMy5hf6IkWTmVQI/+M7a2gE7JsygCiEDzkjC0fvQ+Ru1
 WyS6nllTiY9ryZU3tiVmJWUa3vHqnJ56/7d/UIBE3wFGkHOkuPRvAAkKwDyqma3LVnGz2Tn9SsQ
 YYjgG16bZFjsdv4agaQ==
X-Authority-Analysis: v=2.4 cv=Kd3idwYD c=1 sm=1 tr=0 ts=69e2c811 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=zd2uoN0lAAAA:8 a=E3cVb4IoRbYbcTbuVBkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: FnyqiTnsbwfuSl0N-SOtRJoVifkbwUPX
X-Proofpoint-GUID: FnyqiTnsbwfuSl0N-SOtRJoVifkbwUPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604070000 definitions=main-2604170240
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36301-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
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
X-Rspamd-Queue-Id: 545E641F3CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMzEsIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IE11bHRp
LW1lZGlhIGludGVncmF0ZWQgKE1NSSkgVVNCMy4yIERSRCBJUCBpcyB1c2IzLjEgZ2VuMiBjb250
cm9sbGVyDQo+IHdoaWNoIHN1cHBvcnQgZm9sbG93aW5nIHNwZWVkIFNTUCAoMTAtR2JwcyksIFN1
cGVyU3BlZWQoNS1HYnBzKSwNCj4gaGlnaC1zcGVlZCg0ODAtTWJwcyksIGZ1bGwtc3BlZWQoMTIt
TWJwcyksIGFuZCBsb3ctc3BlZWQoMS41LU1icHMpDQo+IG9wZXJhdGlvbiBtb2Rlcy4NCj4gDQo+
IFVTQjIgYW5kIFVTQjMgUEhZIHN1cHBvcnQgUGh5c2ljYWwgY29ubmVjdGl2aXR5IHZpYSB0aGUg
VHlwZS1DDQo+IGNvbm5lY3Rpdml0eS4gVGhlIE1NSSBVU0IgY29udHJvbGxlciBkb2VzIG5vdCBo
YXZlIGEgZGVkaWNhdGVkIHdyYXBwZXINCj4gcmVnaXN0ZXIgc3BhY2UsIHNvIGlvcmVtYXAgaXMg
c2tpcHBlZCB2aWEgdGhlIG1hcF9yZXNvdXJjZSBjb25maWcgZmxhZy4NCj4gDQo+IFRoZSBkcml2
ZXIgaGFuZGxlcyBjbG9jayBhbmQgcmVzZXQgaW5pdGlhbGl6YXRpb24uIEluIHRoaXMgaW5pdGlh
bA0KPiB2ZXJzaW9uIHR5cGVjIHJldmVyc2liaWxpdHkgaXMgbm90IGltcGxlbWVudGVkIGFuZCBp
dCBpcyBhc3N1bWVkIHRoYXQNCj4gVVNCMyBQSFkgVENBIG11eCBwcm9ncmFtbWluZyBpcyBkb25l
IGJ5IE1NSSBjb25maWd1cmF0aW9uIGRhdGEgb2JqZWN0DQo+IChDRE9zKSBhbmQgVEkgUEQgY29u
dHJvbGxlciBpcyBjb25maWd1cmVkIHVzaW5nIGV4dGVybmFsIHRpdmEgcHJvZ3JhbW1lcg0KPiBv
biBWRUszODUgZXZhbHVhdGlvbiBib2FyZC4NCj4gDQo+IFRlc3RlZCBob3N0IG1vZGUgd2l0aCBt
YXNzIHN0b3JhZ2UgZGV2aWNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUmFkaGV5IFNoeWFtIFBh
bmRleSA8cmFkaGV5LnNoeWFtLnBhbmRleUBhbWQuY29tPg0KPiAtLS0NCj4gLSBJbnRyb2R1Y2Ug
eGxueCx1c2Itc3lzY29uIHBoYW5kbGUgdG8gYWNjZXNzIFVESCBhZGRyZXNzIHNwYWNlDQo+ICAg
d2hpY2ggaXMgd3JhcHBlciBzdWJzeXN0ZW0gSVAgZm9yIFVTQiwgRFAgYW5kIEhEQ1AuDQoNCldo
ZXJlJ3MgeGxueCx1c2Itc3lzY29uIHBoYW5kbGU/DQoNCg0KDQo+IC0gU3BsaXQgY29uZmlnIHN0
cnVjdCByZWZhY3RvcmluZyBpbnRvIHNlcGFyYXRlIHBhdGNoICgyLzQpLg0KPiAtIFJlbW92ZSB1
bnVzZWQgcmVnbWFwL3N5c2NvbiBmaWVsZHMgYW5kIHBhcnNpbmcgY29kZTsgZGVmZXIgdG8NCj4g
ICBwYXRjaCB0aGF0IGZpcnN0IGNvbnN1bWVzIHRoZW0uDQo+IC0gRml4IGVycm9yIG1lc3NhZ2Ug
Y2FwaXRhbGl6YXRpb24gdG8gbG93ZXJjYXNlICgicmVzZXQiLCAiZGVhc3NlcnQiKS4NCj4gLS0t
DQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMgfCA1MCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMt
eGlsaW54LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMNCj4gaW5kZXggYmI1OWI1
NjcyNmU3Li5mMmRlZTI4YmRjNjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My14aWxpbnguYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMNCj4gQEAg
LTQ2LDYgKzQ2LDcgQEAgc3RydWN0IGR3YzNfeGxueDsNCj4gIA0KPiAgc3RydWN0IGR3YzNfeGxu
eF9jb25maWcgew0KPiAgCWludAkJCQkoKnBsdGZtX2luaXQpKHN0cnVjdCBkd2MzX3hsbnggKmRh
dGEpOw0KPiArCWJvb2wJCQkJbWFwX3Jlc291cmNlOw0KDQpQZXJoYXBzIHRoaXMgcHJvcGVydHkg
c2hvdWxkIGJlIGludmVyc2VkIHNpbmNlIHRoZSB2ZXJzYWwyIGlzIHVudXN1YWwNCnRoYXQgaXQg
ZG9lc24ndCBuZWVkIG1hcHBpbmcgb2YgcmVzb3VyY2UuIEhvdyBhYm91dCBub19tZW1fbWFwPw0K
DQo+ICB9Ow0KPiAgDQo+ICBzdHJ1Y3QgZHdjM194bG54IHsNCj4gQEAgLTkzLDYgKzk0LDI5IEBA
IHN0YXRpYyB2b2lkIGR3YzNfeGxueF9zZXRfY29oZXJlbmN5KHN0cnVjdCBkd2MzX3hsbnggKnBy
aXZfZGF0YSwgdTMyIGNvaGVyZW5jeV9vDQo+ICAJfQ0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgaW50
IGR3YzNfeGxueF9pbml0X3ZlcnNhbDIoc3RydWN0IGR3YzNfeGxueCAqcHJpdl9kYXRhKQ0KPiAr
ew0KPiArCXN0cnVjdCBkZXZpY2UJCSpkZXYgPSBwcml2X2RhdGEtPmRldjsNCj4gKwlzdHJ1Y3Qg
cmVzZXRfY29udHJvbAkqY3JzdDsNCj4gKwlpbnQJCQlyZXQ7DQo+ICsNCj4gKwljcnN0ID0gZGV2
bV9yZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmUoZGV2LCBOVUxMKTsNCj4gKwlp
ZiAoSVNfRVJSKGNyc3QpKQ0KPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIo
Y3JzdCksDQo+ICsJCQkJICAgICAiZmFpbGVkIHRvIGdldCByZXNldCBzaWduYWxcbiIpOw0KPiAr
DQo+ICsJLyogYXNzZXJ0IGFuZCBkZWFzc2VydCByZXNldCAqLw0KPiArCXJldCA9IHJlc2V0X2Nv
bnRyb2xfYXNzZXJ0KGNyc3QpOw0KPiArCWlmIChyZXQgPCAwKQ0KPiArCQlyZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byBhc3NlcnQgcmVzZXRcbiIpOw0KDQpBbnkgcmVx
dWlyZW1lbnQgb24gaG93IGxvbmcgdGhlIHJlc2V0IG5lZWRzIHRvIHN0YXkgYXNzZXJ0ZWQ/DQoN
Cj4gKw0KPiArCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoY3JzdCk7DQo+ICsJaWYgKHJl
dCA8IDApDQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIGRl
YXNzZXJ0IHJlc2V0XG4iKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICBzdGF0
aWMgaW50IGR3YzNfeGxueF9pbml0X3ZlcnNhbChzdHJ1Y3QgZHdjM194bG54ICpwcml2X2RhdGEp
DQo+ICB7DQo+ICAJc3RydWN0IGRldmljZQkJKmRldiA9IHByaXZfZGF0YS0+ZGV2Ow0KPiBAQCAt
MjUwLDEwICsyNzQsMTYgQEAgc3RhdGljIGludCBkd2MzX3hsbnhfaW5pdF96eW5xbXAoc3RydWN0
IGR3YzNfeGxueCAqcHJpdl9kYXRhKQ0KPiAgDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGR3YzNf
eGxueF9jb25maWcgenlucW1wX2NvbmZpZyA9IHsNCj4gIAkucGx0Zm1faW5pdCA9IGR3YzNfeGxu
eF9pbml0X3p5bnFtcCwNCj4gKwkubWFwX3Jlc291cmNlID0gdHJ1ZSwNCj4gIH07DQo+ICANCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdjM194bG54X2NvbmZpZyB2ZXJzYWxfY29uZmlnID0gew0K
PiAgCS5wbHRmbV9pbml0ID0gZHdjM194bG54X2luaXRfdmVyc2FsLA0KPiArCS5tYXBfcmVzb3Vy
Y2UgPSB0cnVlLA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkd2MzX3hsbnhf
Y29uZmlnIHZlcnNhbDJfY29uZmlnID0gew0KPiArCS5wbHRmbV9pbml0ID0gZHdjM194bG54X2lu
aXRfdmVyc2FsMiwNCj4gIH07DQo+ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIGR3YzNfeGxueF9vZl9tYXRjaFtdID0gew0KPiBAQCAtMjY1LDYgKzI5NSwxMCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkd2MzX3hsbnhfb2ZfbWF0Y2hbXSA9IHsNCj4g
IAkJLmNvbXBhdGlibGUgPSAieGxueCx2ZXJzYWwtZHdjMyIsDQo+ICAJCS5kYXRhID0gJnZlcnNh
bF9jb25maWcsDQo+ICAJfSwNCj4gKwl7DQo+ICsJCS5jb21wYXRpYmxlID0gInhsbngsdmVyc2Fs
Mi1tbWktZHdjMyIsDQo+ICsJCS5kYXRhID0gJnZlcnNhbDJfY29uZmlnLA0KPiArCX0sDQo+ICAJ
eyAvKiBTZW50aW5lbCAqLyB9DQo+ICB9Ow0KPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZHdj
M194bG54X29mX21hdGNoKTsNCj4gQEAgLTI5OSwxOSArMzMzLDIzIEBAIHN0YXRpYyBpbnQgZHdj
M194bG54X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJc3RydWN0IGR3
YzNfeGxueAkJKnByaXZfZGF0YTsNCj4gIAlzdHJ1Y3QgZGV2aWNlCQkJKmRldiA9ICZwZGV2LT5k
ZXY7DQo+ICAJc3RydWN0IGRldmljZV9ub2RlCQkqbnAgPSBkZXYtPm9mX25vZGU7DQo+IC0Jdm9p
ZCBfX2lvbWVtCQkJKnJlZ3M7DQo+ICAJaW50CQkJCXJldDsNCj4gIA0KPiAgCXByaXZfZGF0YSA9
IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqcHJpdl9kYXRhKSwgR0ZQX0tFUk5FTCk7DQo+ICAJ
aWYgKCFwcml2X2RhdGEpDQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiAgDQo+IC0JcmVncyA9IGRl
dm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsNCj4gLQlpZiAoSVNfRVJSKHJl
Z3MpKQ0KPiAtCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocmVncyksICJmYWls
ZWQgdG8gbWFwIHJlZ2lzdGVyc1xuIik7DQo+IC0NCj4gIAlwcml2X2RhdGEtPmR3YzNfY29uZmln
ID0gZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7DQo+IC0JcHJpdl9kYXRhLT5yZWdzID0gcmVn
czsNCj4gKw0KPiArCWlmIChwcml2X2RhdGEtPmR3YzNfY29uZmlnLT5tYXBfcmVzb3VyY2UpIHsN
Cj4gKwkJdm9pZCBfX2lvbWVtICpyZWdzOw0KPiArDQo+ICsJCXJlZ3MgPSBkZXZtX3BsYXRmb3Jt
X2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7DQo+ICsJCWlmIChJU19FUlIocmVncykpDQo+ICsJ
CQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocmVncyksDQo+ICsJCQkJCSAgICAg
ImZhaWxlZCB0byBtYXAgcmVnaXN0ZXJzXG4iKTsNCj4gKwkJcHJpdl9kYXRhLT5yZWdzID0gcmVn
czsNCj4gKwl9DQo+ICAJcHJpdl9kYXRhLT5kZXYgPSBkZXY7DQo+ICANCj4gIAlwbGF0Zm9ybV9z
ZXRfZHJ2ZGF0YShwZGV2LCBwcml2X2RhdGEpOw0KPiAtLSANCj4gMi40My4wDQo+IA0KDQpCUiwN
ClRoaW5o

