Return-Path: <linux-usb+bounces-31083-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F42CC99A30
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 01:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FF993A49E9
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 00:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA118479;
	Tue,  2 Dec 2025 00:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Pg5zimpa";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="j93Q/BHF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cX+zjj4y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50E11397;
	Tue,  2 Dec 2025 00:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764633679; cv=fail; b=HPu1lwcfd5BvyylZFxUtI8LgKth38pf+EIBBphVTyRWhiZb0MgzfB9yebRmPZ+TP5xZv9rrTKN4Vg+p+o0oI33JnhxZ2twhRbJK/hbqqR4LTzgm4Uyr35aHU4PMNXtYEI6SvbMDRCd2NFmjNIfoE8DtI9DIa4V6txy1wifxzhzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764633679; c=relaxed/simple;
	bh=c7PXgMptEe/uacwb1p73z5nqKzKjJnQ3Igm5Tigz4QA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lS5Yi7rQLR0EDlLAOpx2he43Tag9/qFu/oZ8OV3lC3GOz7rWfhoDnGMXO3e9hPf/5q5EH9GuMb+gNqmNvaDxsP2TXZvRBaAdTexCIKFX4FRpMget/HXaSiXi8o5Rll141dcT2X7PkKeiHuLdL7VFoRDnJRQ7oPTzQIxSC69qxP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Pg5zimpa; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=j93Q/BHF; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cX+zjj4y reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1NasNu3990419;
	Mon, 1 Dec 2025 16:00:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=c7PXgMptEe/uacwb1p73z5nqKzKjJnQ3Igm5Tigz4QA=; b=
	Pg5zimpa+sjmxUDnXSDw2TGPoGDy038Uyb/K/7eQaLfrVLov4+CWQekyOAUmykPJ
	g+F7rAhQkbaMkbLWjB5nCCmNR500I7fENy1q/ikcdYIQFwsvowl3qLDGtWHDcboa
	TwK3ux6Dyfw4QsZKLAM/lwz6tLBt2Y+uw0yJjst0GlGLjZS1Z7RolS5LUU7dwHl5
	EClXT7Sd85kHKoIfvplVB11/iUXRQJVVUcPeEok1ZSD47hSA5/hTFhw6MLL7BWQI
	MWF/x28uiHFkDXptYPeOyNzdyifO/XXKy3L6MZAM18mYohuuS6wSCXC52apbrv1p
	zWRSLAbQPqzWawubV2qiFQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4as7ygubtw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 16:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1764633635; bh=c7PXgMptEe/uacwb1p73z5nqKzKjJnQ3Igm5Tigz4QA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=j93Q/BHFN1itWbb/0Dy8aVmOwzWnKmA4Mjy7uIRSq8aH2RsUYT1Zwbo0XHFC231t+
	 a8B7JJbPxgz+WJD35UgajVU8Uk/LoKZIeOVKTCjdbvOMB+RrmljPwQcETLnQfGslnq
	 iomnXWAdukdZ7Wru0hQD1uTNGGa51H1G1vp1YP3p/1lvgBESqDmqcHaZYafb+6uWHc
	 TerSR/8gscREWgfSeqQSKvCjw38ldqzaRppR71aYYhErMyeokRRBH8GKM1wHQFG0zN
	 HcmuBlRDd+/drIQiH/r1nyg/2YvRcnF1QiS8cxrBWTwLS3RlMULe9qoahL729FC/M9
	 UP7137D1BGnSg==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AF27240140;
	Tue,  2 Dec 2025 00:00:33 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 004BFA0070;
	Tue,  2 Dec 2025 00:00:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=cX+zjj4y;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00406.outbound.protection.outlook.com [40.93.13.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0369F22044A;
	Tue,  2 Dec 2025 00:00:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZ4CXqsrp5y51pONhzm8GDEe4iJ3ZzUuAo0wyV7X87WRRIxhNI/3hWabJS9HMGc2Y1kAAfq4hJeW3rdTH8QX88WC0voDTONmekpXqjdyOFaaqwz2fcqzoWNrikECxSPDzcSgSAlDcFSwewHPnOYOTQQ93zPgcxAC1Qy6HBn3stcfx3SW8LCJeJuGUWmTmQqn9E1UhrIWDv+8F4DB6ZNufImzJlNOZwQH9gTteOMRLSlwXa9bsb5ry2Hkjwq3dlm89WqYtnk4zzzHeHNFxrcIIrcQ0a2CQNXh7AnG9KnVpEJQ86KBbtUmQbKDm/aMlSsi94n5YCjuR2HQrnNy3Calig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7PXgMptEe/uacwb1p73z5nqKzKjJnQ3Igm5Tigz4QA=;
 b=zSaijC1wFYLL9L6UsKvjqhFYLHV29aJzBDYXB66T0Bo8jGL16wUC/UTJken8FLI5hiepdoI5bqO5ueiKU5CPBlGUD3xo33iZDcy2+E/v2EA0b2kijDaoef2278lo+hIi5ivWYFJVLzVE+VpcMrkaG2PyKqIh3oN9ef3fg0x2P5tLHEo+dz9zEO4n3wSsB2ZaOUQK+nn7zNpBvsXPBWM5nejYMyKHtujkKL/t3NzE9NutgORzIBpMVezw6N9dxwDc7mMZLCbg7Umb4XOJ/xW2d74mQxAGn7zsBOucIrC22905ye1kvV/ehIjr3EMOq/GMbjLxyBe9ogtSVhdz3I/y2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7PXgMptEe/uacwb1p73z5nqKzKjJnQ3Igm5Tigz4QA=;
 b=cX+zjj4yt6fdsdDAFf7Ev5A3bijvzKiqxadnuUtmaYCZazJP3wQ652RhIqirhvKbvIxeXtmgim2MUeF4IBmfyJLae3hrQ/M7GxejTRMNpI/X3tgxRWUfCJxFnqj3lOFXV6of2h3oAddxFkWV6yY6MpQxPIkj0B+xDi737l+ceI0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH1PPFDB1826343.namprd12.prod.outlook.com (2603:10b6:61f:fc00::628) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 00:00:17 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 00:00:16 +0000
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
Subject: Re: [PATCH 2/2] usb: dwc3: imx8mp: disable auto suspend for host role
Thread-Topic: [PATCH 2/2] usb: dwc3: imx8mp: disable auto suspend for host
 role
Thread-Index: AQHcTigLFJc1f1uJi02/Qj90wUqLQbTxR8CAgAUyT4CABee4AIAGvIKAgAqCqoA=
Date: Tue, 2 Dec 2025 00:00:16 +0000
Message-ID: <20251202000013.qnv3nkhyr7gtlu6n@synopsys.com>
References: <20251105074504.1427926-1-xu.yang_2@nxp.com>
 <20251105074504.1427926-2-xu.yang_2@nxp.com>
 <20251113230541.wbzt6xbine5gdmpp@synopsys.com>
 <7kpf7gnftumdwdowutryjz73nkap4vp3cfisrigt6def4f36vg@ijlj2eqwzsip>
 <20251121003742.q54ouezxhghmpwgn@synopsys.com>
 <bj6hroepwqflz5z3wabxacfhxltt2u6x274gd5v66rihosy3my@pzgq2e4v45fx>
In-Reply-To: <bj6hroepwqflz5z3wabxacfhxltt2u6x274gd5v66rihosy3my@pzgq2e4v45fx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH1PPFDB1826343:EE_
x-ms-office365-filtering-correlation-id: 0ab2adb8-4869-4211-fc54-08de3135c65e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?by8rdTRyQlM0VTJ1THFaVTJkWjJidzZuU0JRS3RWaGpqbmVhMnpCTFc2dTRa?=
 =?utf-8?B?MXFDSkpFNXkwWi9LQUFidzl4Y0hXWGRYV2o5bU8yQUVrazZKdzB5dEZJeXlW?=
 =?utf-8?B?VSsxVVkvTzdpdjk0MWllY3FsbUZyOFJTbjlGQU5hWHZ5YzRqYkt2MnZYbk5E?=
 =?utf-8?B?K0djVXk0Vy96Y1RlVGxFYlg2cm1sSVMvRFdidE4rS1kxeHNqNHVzdmoxanA2?=
 =?utf-8?B?N2tIODBxNkcrb3ZCVGFnRXpHcGVXZE81V2FhaVgvY3cvNUFSejc0YlY3NzJB?=
 =?utf-8?B?WlU1anRsR3NIRlg2QUlCM0x2azZ0czc0dE1XNW11dkJoZGVBWlpNSWFnVnJT?=
 =?utf-8?B?TzFFWlVaR2I4dWVBeU9ua0dXcWlMOFBzRTE1RGhPNEowekh2d0dqZVQ0aHph?=
 =?utf-8?B?eDRoeXp0NmVIRUp1Q2NaM29VMFlSbzI3RC9nckthdjV2WEtqNi9OTUlxTEdo?=
 =?utf-8?B?TnFQNUpNYnlKcmkvb3lqaGF6WnA4ZVNiakRveit2UUxvMGhlZGhiMGtHaTY1?=
 =?utf-8?B?TjJXZ0NKcHBwWUNXa0d5V0ZHRzdmNVB5YTV3MEQzNW45aWVURmMrLzZUekl1?=
 =?utf-8?B?VzViOXNXL0ZWd1lYc2RUVlpyVG5GL3ovU0p5MzVGWDZTZm9Rd0J4SXpQMk95?=
 =?utf-8?B?QVBFemo2RkIrL0FPRVpBMk4rWU04OEpWcGhjR0VCT0xmSkgzQ2NySEE2TUNz?=
 =?utf-8?B?MDlBQ3FVOHdsR3YzaDg5TmVPeHlKTmZNai9aTmhKdU1QYStrV2h2WFp4SmxB?=
 =?utf-8?B?enNTdVo2cmlKVy9kdGpCMTdjdVZVUlVReko5QzlhZTEzV3Jabm9yN2pOcEls?=
 =?utf-8?B?NFZqZEdaRW9QT29Ba3paUG04cnRnZTFMNWFpdlJZYmtiR2R0emtxRnI4ckIr?=
 =?utf-8?B?VzMvWjhNbDhxY3FFZTAyUFhSRFFGdUlNVzNDa0kvQlZleUYvcHFFb0RiK29m?=
 =?utf-8?B?Y3d5M3V3UFZkc2tDcU1hTHNkVndqMjZaa0RObEdERG1vY0NIcUtJUDlLQTdR?=
 =?utf-8?B?Y2NNR1NDNnArdFdPb1dOS2NUVVlhbDlhdStGZGRKVXBtWUdTU3JOdVl6cENW?=
 =?utf-8?B?MUJEUnVNMDFmUEtzZVJhTlo2QldTTE9Xc01YUFJOUWNrSWVOWllTQVdOUWZm?=
 =?utf-8?B?c3gxbDVtYjc4ZFNSZGJ0aS9TcmRKUUhiNC9WU002N1FMVzY1OGJLUkJhSUNI?=
 =?utf-8?B?bGVKQ0NkOTJvb1poVFZma0NqdzROTnc0RE1vT0tSSGVVYVowVDZGeHZjZEJN?=
 =?utf-8?B?dFNzcURyWUVDLzZTaGRvNlFUTElMYklQZXFKM3BtVlczY1lSOXRWN2lzNVhx?=
 =?utf-8?B?Z0pkdHNkamcxdEdqUWVPcGY2R0hySTRCK2tVa28vdC9TbEprVE8wbnVEQU1Q?=
 =?utf-8?B?SElBVWtQNGV1bVdUTlJmdW1yZHJ1V1d2V0ZzM2t1ZHdWQldHZ3RwbjBYbE1r?=
 =?utf-8?B?ckxBY2lYYjI2cHZWQ0lCeEplNXBrZTYvVCtMUlVSVnJ3amY3THRMWGx5blcr?=
 =?utf-8?B?QUJLK3BFaml0RklPVU5ZNUo4TEloWmtIb3ZOelh0NHVqZ0xzN1dqVTYzRjNV?=
 =?utf-8?B?dnpFZHliaktyQ3lzY0lHQy9qUWlZbzIrdUhwaVdsWCsrbUVYVTQ5V2ZSRmUr?=
 =?utf-8?B?ODlKNkZIMnFvVFMzeGFJT2k1VExYU01hc1RUMjVVOTA2WXByVS9vU053UXNy?=
 =?utf-8?B?cmZDWitDUExqcXk1N3NFQ3I3a1dPS3dITUtMeHJSdWJxWk9SL3phR2FKc01Z?=
 =?utf-8?B?Uy93c25jeHp2RmlhdklEdUhzQVJQeDdJWG41ZXJ2R0t3KzFWRnVGZ2k3TFZS?=
 =?utf-8?B?UGtQVU9Dc282cWx6c1NkK28wbFBWM1NuWXdjNWNIQWlvZGxHNDdWeG9QK1Vx?=
 =?utf-8?B?d2F2dkxDdjNtQzB5cFAxZEkySkE1NTJlK1h1eDBiUTFJbWloYXJTU1JLZ00w?=
 =?utf-8?B?RWFGT2dMTXJmZ3ZzSzZjSlV4WEhTdnI5bTVseDVDYUUvN3BnMU5iYnEvSTlG?=
 =?utf-8?B?bGcySzJ5Zm8vNU1tYjM2TUh4Y2FCaGVoZ0JFcDE4UWRxZHRwNGs2a29FYUJE?=
 =?utf-8?Q?fqMjbD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGFrdjU1eXJPcnp3MkRGWUM4K2I5d2dZR1NBSjYxUHRzUUNOUk1XSU81Qmhv?=
 =?utf-8?B?d2NCYlhRTm5ESDFoNElDd3BaRjNaaEc1cExSOFVIWDlrd05wcWM4b3VMOTJt?=
 =?utf-8?B?M24zdURhSWxNMmRvalN0V01PRkVGOENoV3dxTHNsUE0rUmtqSVorb3I0NEsr?=
 =?utf-8?B?SFVRUWl4c2RSaHNsTmxGbTFJMWJJdFJXaUwrc1ZhZ1lRcGpYVGNMTG5ZajUz?=
 =?utf-8?B?Sm5sTWxrTGloVThtNmhENG5nSndYM0Z1SVBUckl2MnA1VFlaK2J3YnNnMVdY?=
 =?utf-8?B?em5jODdlZk56cFZDSGJ3QnFMcDdQK2UrNmVHNXpINkkzNzJ5L3J2MHg4ak1k?=
 =?utf-8?B?VFhCbFB1aUdJRkxXVGgrRk1GR2Q3MU9yNEFvcmxtU2l2b0FkdklDUm1SN1dH?=
 =?utf-8?B?MkVIU3NnbHNYUE0ySDRBRkM1dG9DNHF0bGJWWDE1T3psa1ZKYmlkanJUdVMz?=
 =?utf-8?B?Wnd2eXBFcyt6ZW9Cend3U1gwdy9CZTlCV1NZb2dUUWY3U1ZoRW1hUUJFaWhM?=
 =?utf-8?B?ai9lcWdmZnNYWWhIQmR3N1ErRmlLVnY4NCtueWNaVTR2QXBZVkFhZkp4cjBI?=
 =?utf-8?B?QXpKVlZtQ0puZHBNV3NnUXQ5WUpSSEF1WUVKNUtDUlRSRHVBY1VJeDVQd3gw?=
 =?utf-8?B?UUhzWlZvWTRoV3I5NUdaczdIcGx3b0Y2aTVxM0lBTHMwQ0toRUVtM0I2ajFq?=
 =?utf-8?B?Sy9KRTJkYzMyeTFsOVY3aTJyYlZFaTdiVzVMTDZCbWJSalYrTjNNSFQ1Vmxl?=
 =?utf-8?B?RW5ackdBQ1piZ1gxTHBTZWk1WUV5SG1tS1I3SUxvMkZ4K0I3NmhHL201dmhN?=
 =?utf-8?B?VWMza2RoZzlSRFJBdjNZSmc2Z2RrYzF0MVlGcFJ6aXhQNXpCNUdYR0RBTzRs?=
 =?utf-8?B?RFJ5Q1ozTmJ6S2VWZHJwTHNVbFcxSzFGQUExV3RGekw3VkJqV0Q5a2xndWpL?=
 =?utf-8?B?Qm4rWmdDUnlzQTVFTXZyd0ZQbWowZTN5Zmk3Q1pDMlFyN3J0cjlvMlBKWDRU?=
 =?utf-8?B?MitsbFUzOFNCQ2xhS3BLbjIwdzlzd1pmUTdaRjJYUGRFM3c1M1NydWNLakdm?=
 =?utf-8?B?V1czV3V6TXFjcm5vRkh0NUlJaVhXcmdnTXN3MVVkbTdMc3RvNWk4U1hWd2RJ?=
 =?utf-8?B?YnlOLytWbWJmUHU5YWtBdUF4ci9vU1NaOU5vaTlsaStVVSt5c3J0dnhObTFh?=
 =?utf-8?B?NnRaM3ZnT0Z5VjhDbVQrV25HZENuSlVPZlIvczBuMnlLZmJNcW1ZSTVCajZW?=
 =?utf-8?B?YWtFOUt2ejBOQ2JSVnM0eHVqTFptTWdpall1WGRyNGRsMUo5Q2laenBjSVdL?=
 =?utf-8?B?Uk9RRzdBN1J2eS9CZXR0V3BpWFFMNzVJVFhIME15b3cxNlpYRmt2b1c1Kzdz?=
 =?utf-8?B?SVZYK0czcTJXaHRMcy9JVDBBMlNhL2lML09vSXlEenhCZExUK3Q2MzNYV0oy?=
 =?utf-8?B?YTNaeTY1aks1UHVKNk1id1VvQnlzSEZ4YXJhR3VnRUNZdnNEUWh0cVNaVEtk?=
 =?utf-8?B?NGgrMFpwNm5FSElEbDExSmhvNXRTaTliZ1NGYXUyRTJCdVZMeHF1QWQxMG5l?=
 =?utf-8?B?Si9DKy9mS3BNYk1SSG5QZHZJRDhBazgwUXBUZGx5RjBzUnlpRlpMMTNscGVw?=
 =?utf-8?B?N1BqdnVudkxqNXhscEJ5QkJITGdVYUJrNWpjaDVmTkJxczNSQ2VGeGpTUWFE?=
 =?utf-8?B?ZTZ0M1F0a3JFK2Z4WXpQMk0vR0lqUm4vb3UxWlovQWRCYStzaVRtUSt1eXB1?=
 =?utf-8?B?ajEyZFZKWlpqYTdHcU1sT0xFL2ZrZUNHZCtPbHFWdUhieEowWHBuYkFyRW9F?=
 =?utf-8?B?NWpERnYwVk9teDFCcTU2eGFyeTJwUmxPSmp4a2FBNlNoVFZQM1Jma3pjaTFX?=
 =?utf-8?B?Rnk5NTV3aFRJNjlDNE9TNE16RkpwWHNHdGdrQkpFUkVaOUhZbjVTWDJQS3o1?=
 =?utf-8?B?NTA3bG12M213L0dEbDJsOXM4b0htVzNEaDlITGtpVnhCUWJ4QVZyMGFLV0lq?=
 =?utf-8?B?Tm92UkNXcUNEZU9BVkkwQSs0b1Z0OTVjK2dZUndOSmVYNWJEYXUvYk95ck5J?=
 =?utf-8?B?UFA2R3lBTHVaeFR2YzhJQzJxZ0hzZmM3OUNzd2p5OEc1RmtWVnJ6cUxQZGcw?=
 =?utf-8?Q?sLG9oqf1uGlNrUnzR4damNa2M?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <72B69D879AE69148BDAA001304AA71E8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kebz1dyPiwxeFgaaeirzdMmiGJ+t9iGIfXX/xQP3Lk1Waini1C6NOf0Ys5FGKKNfINGyp51Ep1ct1wodegfwf3d2Rw8DTH0SZH6wz8lP/o9dUpH4u1y34GvJl8k1nF82bZJGIPpIa7WonHXzynLuoqFaQtkHppAGL76Qq6wc46TSk8wis5ES+U0vqSiykxOMRh2ZrUi5GcXQCrfrg75KuLzWu8ppPDXjvKQbsslAR8yIrZXEM7Dr26dg90Ljv804tKPOAbTzwMb0EnObH5LYKIod4wuS9jKA60HTpziIgdZbDQ8uQwolwfrpqQAneQG6iBkIK7zvI7UB9oBjvkvcQJQ1n5pEWs8Sl+v7MuXN8hNt3SEkE/3oTqq7Bfx/yvcmE0Zev+gKawXJUN7HFn7syk7xDojVVUGIkYV0E6axTTriVH2tdoUtSSCmgdl/4PbOmeQ4CYTKfh8jWsrwG/K4gVIVlgX95DBenhCIgUCnDgU32dyFXZUXmTpd6EPkNu7F6ygxwHyBkTKHp3D1DSr35VWXxYRtDJvm8bAp0n4+iQwec7Kpbav3ZxJl544MG0/hIeoDDjlek7CPoOASbTnu62gYRS8Jr6yuF9SlJ45O+oipaKlvxzsWihDzHhZ+LWzpgvQRu4WSaFl5xfcXPl+Cng==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab2adb8-4869-4211-fc54-08de3135c65e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 00:00:16.3750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E516Cr7/9v00HuTgy5Q14e9C6xN/xipIvJpVBQiBzJKDSnzsNYa2RuXDtow3cGc1a7aipi7KZjru3ckmD55x+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDB1826343
X-Proofpoint-ORIG-GUID: 7p_hRChv5C5QBdxxuL9eH0P1YP6eC69q
X-Authority-Analysis: v=2.4 cv=AvrjHe9P c=1 sm=1 tr=0 ts=692e2c24 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=Yafn8mGKEeD-cc-aOdgA:9
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 7p_hRChv5C5QBdxxuL9eH0P1YP6eC69q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE5MyBTYWx0ZWRfX/dvrGSCWDnc0
 s4qRZPLb0/lwhDcPh5+F4/0+eIPhxIEjPBdJM0Q7WRMRRaYixsDVubPzBiwFYdCWOWG6Vr9arH2
 1YDj5jKLMg+B4FVDoR/26ijG9+hlUdrT1Q14baJDcsFExA0U0RGUUkfLAILcZubDxs4moUYBTEj
 ZmTuKLYgg15/zIJ1mrCq7a+OAsOJNdI+PhZWRs7y2Z+LvmWORfNrpt+WZl2bgrZo2UHAhxUtMfG
 5iO59aQ0cQebNfnTyD3+C4uuwkcHWObHg9k0JfufA9NOMf4SaEkS59kpeVx6qfJ1IEgxfXLK119
 mff6Ht+M21GJSfIjQZlfdeuBKa9N0gP7D37N4ZufaA8flJj8U0gZn/xS/9SwVUej0QVPxWj4/jZ
 XfkvPHnXjyCnemBq0a+O1XfE1uRRIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512010193

T24gVHVlLCBOb3YgMjUsIDIwMjUsIFh1IFlhbmcgd3JvdGU6DQo+IE9uIEZyaSwgTm92IDIxLCAy
MDI1IGF0IDEyOjM3OjQ3QU0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBNb24s
IE5vdiAxNywgMjAyNSwgWHUgWWFuZyB3cm90ZToNCj4gPiA+IE9uIFRodSwgTm92IDEzLCAyMDI1
IGF0IDExOjA1OjQzUE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiA+ID4gT24gV2Vk
LCBOb3YgMDUsIDIwMjUsIFh1IFlhbmcgd3JvdGU6DQo+ID4gPiA+ID4gRG8gZHdjMyBjb3JlIGF1
dG8gc3VzcGVuZCBlbmFibGUgZm9yIGRldmljZSBhbmQgZGlzYWJsZSBmb3IgaG9zdA0KPiA+ID4g
PiA+ICwgdGhpcyBjYW4gbWFrZSBzdXJlIGR3YzMgY29yZSBkZXZpY2UgYXV0byBzdXNwZW5kIHNl
dHRpbmcgaXMNCj4gPiA+ID4gPiBjb3JyZWN0IGFsbCB0aGUgdGltZSwgdGhlIGJhY2tncm91bmQg
b2YgZGlzYWJsZSBkd2MzIGNvcmUgZGV2aWNlDQo+ID4gPiA+ID4gYXV0byBzdXNwZW5kIGlzIHRv
IG1ha2UgaXRzIHBhcmVudCBkZXZpY2Ugc3VzcGVuZCBpbW1lZGlhdGVseQ0KPiA+ID4gPiA+IChz
byB3YWtldXAgZW5hYmxlIGNhbiBiZSBlbmFibGVkKSBhZnRlciB4aGNpLXBsYXQgZGV2aWNlIHN1
c3BlbmRlZCwNCj4gPiA+ID4gPiBmb3IgZGV2aWNlIG1vZGUsIHdlIGtlZXAgdGhlIGR3YzMgY29y
ZSBkZXZpY2UgYXV0byBzdXNwZW5kIGlzIHRvDQo+ID4gPiA+ID4gZ2l2ZSBzb21lIHdhaXQgZm9y
IGdhZGdldCB0byBiZSBlbnVtZXJhdGVkLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4g
PiA+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMgfCAzMSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25z
KCspDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1pbXg4bXAuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiA+ID4gPiA+
IGluZGV4IGJjZTZhZjgyZjU0Yy4uODBhNDMxY2I2ZmVkIDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBh
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiA+ID4gPiA+IEBAIC0xNTgsMTEgKzE1OCwzMSBAQCBz
dGF0aWMgaXJxcmV0dXJuX3QgZHdjM19pbXg4bXBfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKl9k
d2MzX2lteCkNCj4gPiA+ID4gPiAgCXJldHVybiBJUlFfSEFORExFRDsNCj4gPiA+ID4gPiAgfQ0K
PiA+ID4gPiA+ICANCj4gPiA+ID4gPiArc3RhdGljIHZvaWQgZHdjM19pbXhfcHJlX3NldF9yb2xl
KHN0cnVjdCBkd2MzICpkd2MsIGVudW0gdXNiX3JvbGUgcm9sZSkNCj4gPiA+ID4gPiArew0KPiA+
ID4gPiA+ICsJaWYgKHJvbGUgPT0gVVNCX1JPTEVfSE9TVCkNCj4gPiA+ID4gPiArCQkvKg0KPiA+
ID4gPiA+ICsJCSAqIEZvciB4aGNpIGhvc3QsIHdlIG5lZWQgZGlzYWJsZSBkd2MgY29yZSBhdXRv
DQo+ID4gPiA+ID4gKwkJICogc3VzcGVuZCwgYmVjYXVzZSBkdXJpbmcgdGhpcyBhdXRvIHN1c3Bl
bmQgZGVsYXkoNXMpLA0KPiA+ID4gPiA+ICsJCSAqIHhoY2kgaG9zdCBSVU5fU1RPUCBpcyBjbGVh
cmVkIGFuZCB3YWtldXAgaXMgbm90DQo+ID4gPiA+ID4gKwkJICogZW5hYmxlZCwgaWYgZGV2aWNl
IGlzIGluc2VydGVkLCB4aGNpIGhvc3QgY2FuJ3QNCj4gPiA+ID4gPiArCQkgKiByZXNwb25zZSB0
aGUgY29ubmVjdGlvbi4NCj4gPiA+ID4gPiArCQkgKi8NCj4gPiA+ID4gPiArCQlwbV9ydW50aW1l
X2RvbnRfdXNlX2F1dG9zdXNwZW5kKGR3Yy0+ZGV2KTsNCj4gPiA+ID4gPiArCWVsc2UNCj4gPiA+
ID4gPiArCQlwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZChkd2MtPmRldik7DQo+ID4gPiA+IA0K
PiA+ID4gPiBXb3VsZCB0aGlzIG92ZXJyaWRlIHRoZSB1c2VyIHNldHRpbmcgZXZlcnl0aW1lIHRo
ZXJlJ3MgYSByb2xlIHN3aXRjaD8NCj4gPiA+IA0KPiA+ID4gRnJvbSB3aGF0IEkga25vdywgdGhl
IHVzZXIgY2FuJ3QgY29udHJvbCB3aGV0aGVyIHRvIGVuYWJsZSBvciBkaXNhYmxlDQo+ID4gPiBh
dXRvc3VzcGVuZCBmZWF0dXJlLiBTbyB0aGVyZSBzaG91bGQgYmUgbm8gb3ZlcnJpZGluZyBwcm9i
bGVtLiBXaGVuDQo+ID4gPiB1c2VyIGNoYW5nZSBhdXRvc3VzcGVuZF9kZWxheV9tcywgdGhlIGRl
bGF5IHNldHRpbmcgd2lsbCBiZSBrZXB0DQo+ID4gPiBldmVyeXRpbWUgdGhlcmUncyBhIHJvbGUg
c3dpdGNoLg0KPiA+IA0KPiA+IFNob3VsZCB3ZSBzZXQgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVz
eSgpPw0KPiANCj4gSSB0aGluayB3ZSBuZWVkbid0IGV4cGxpY2l0bHkgY2FsbCBwbV9ydW50aW1l
X21hcmtfbGFzdF9idXN5KCkuDQo+IFNpbmNlIGNvbW1pdCAiMDgwNzFlNjRjYjY0IFBNOiBydW50
aW1lOiBNYXJrIGxhc3QgYnVzeSBzdGFtcCBpbiBwbV9ydW50aW1lX2F1dG9zdXNwZW5kKCkiLA0K
PiBwbV9ydW50aW1lX2F1dG9zdXNwZW5kKCkgd2lsbCBkbyB0aGF0IHRoaW5nIGF1dG9tYXRpY2Fs
bHkgb25jZSBkd2MzIGRldmljZSBpcyBpZGxlLg0KDQpPay4NCg0KPiANCj4gPiANCj4gPiBBbHNv
LCBpZiBwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZCgpIGlzIHNldCwgbWFrZSBzdXJlIHRvIHVu
d2luZCB3aXRoDQo+ID4gcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZCgpIG9uIHJlbW92
ZS4NCj4gPiANCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gPiArfQ0KPiA+ID4gPiA+ICsNCj4g
PiA+ID4gPiArc3RydWN0IGR3YzNfZ2x1ZV9vcHMgZHdjM19pbXhfZ2x1ZV9vcHMgPSB7DQo+ID4g
PiA+ID4gKwkucHJlX3NldF9yb2xlICAgPSBkd2MzX2lteF9wcmVfc2V0X3JvbGUsDQo+ID4gPiA+
ID4gK307DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICBzdGF0aWMgaW50IGR3YzNfaW14OG1wX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiA+ID4gIHsNCj4gPiA+ID4g
PiAgCXN0cnVjdCBkZXZpY2UJCSpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ID4gPiA+ICAJc3RydWN0
IGRldmljZV9ub2RlCSpub2RlID0gZGV2LT5vZl9ub2RlOw0KPiA+ID4gPiA+ICAJc3RydWN0IGR3
YzNfaW14OG1wCSpkd2MzX2lteDsNCj4gPiA+ID4gPiArCXN0cnVjdCBkd2MzCQkqZHdjMzsNCj4g
PiA+ID4gPiAgCXN0cnVjdCByZXNvdXJjZQkJKnJlczsNCj4gPiA+ID4gPiAgCWludAkJCWVyciwg
aXJxOw0KPiA+ID4gPiA+ICANCj4gPiA+ID4gPiBAQCAtMjQwLDYgKzI2MCwxNyBAQCBzdGF0aWMg
aW50IGR3YzNfaW14OG1wX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4g
PiA+ID4gIAkJZ290byBkZXBvcHVsYXRlOw0KPiA+ID4gPiA+ICAJfQ0KPiA+ID4gPiA+ICANCj4g
PiA+ID4gPiArCWR3YzMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkd2MzX2lteC0+ZHdjMyk7DQo+
ID4gPiA+IA0KPiA+ID4gPiBJdCdzIGNvbmZ1c2luZyBob3cgZHdjM19pbXgtPmR3YzMgaXMgYWxz
byBuYW1lZCBkd2MzLi4uDQo+ID4gPiANCj4gPiA+IEkgd2lsbCByZW5hbWUgaXQgbGF0ZXIuDQo+
ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+ID4gKwlpZiAoIWR3YzMpIHsNCj4gPiA+ID4gPiArCQll
cnIgPSBkZXZfZXJyX3Byb2JlKGRldiwgLUVQUk9CRV9ERUZFUiwgImZhaWxlZCB0byBnZXQgZHdj
MyBwbGF0Zm9ybSBkYXRhXG4iKTsNCj4gPiA+ID4gPiArCQlnb3RvIGRlcG9wdWxhdGU7DQo+ID4g
PiA+ID4gKwl9DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsJZHdjMy0+Z2x1ZV9vcHMgPSAmZHdj
M19pbXhfZ2x1ZV9vcHM7DQo+ID4gPiA+IA0KPiA+ID4gPiBJZiB5b3Ugd2FudCB0byB1c2UgZ2x1
ZV9vcHMsIHBsZWFzZSB1c2UgdGhlIG5ldyBmbGF0dGVuIG1vZGVsLiBJDQo+ID4gPiA+IGRvbid0
IHdhbnQgZHdjMyB0byBiZSBpbml0aWFsaXplZCBhZ2FpbiBhZnRlciBvZl9wbGF0Zm9ybV9wb3B1
bGF0ZSgpLg0KPiA+ID4gDQo+ID4gPiBJIHVuZGVyc3RhbmQgdGhlIG5ldyBmbGF0dGVuIG1vZGVs
IGlzIGEgbW9yZSBzdWl0YWJsZSB3YXkuIENvbnNpZGVyaW5nIHRoYXQNCj4gPiA+IG1hbnkgaS5N
WCBkZXZpY2VzIGFyZSB1c2luZyB0aGlzIGxlZ2FjeSB1bmZsYXR0ZW4gbW9kZWwsIGRvIHlvdSBt
aW5kIGFsbG93DQo+ID4gPiB0aGlzIGNoYW5nZSBmaXJzdGx5IGFuZCB3ZSB3aWxsIHN3aXRjaCB0
byB0aGUgbmV3IGZsYXR0ZW4gbW9kZWwgaW4gdGhlIGZ1dHVyZT8NCj4gPiA+IA0KPiA+IA0KPiA+
IERvIHlvdSBoYXZlIHBsYW5zIGZvciB0aGlzIHRyYW5zaXRpb24/IFBlcmhhcHMgdGhpcyBpcyBh
IGdvb2QgdGltZSB0bw0KPiA+IGluaXRpYXRlIHRoZSBwcm9jZXNzIHNvIHRvIGF2b2lkIGhhdmlu
ZyBhbmQgbWFpbnRhaW5pbmcgdGhpcyBpbXByb3Blcg0KPiA+IGNvZGUgd2hpbGUgd2Ugc3RpbGwg
ZG9uJ3QgaGF2ZSBpdCB5ZXQuDQo+IA0KPiBPSy4gSXQncyBhIHRyZW5kIHRvIHVzZSBuZXcgZmxh
dHRlbiBtb2RlbC4gSSBkbyBoYXZlIHBsYW4gZm9yIGl0LiBJJ2xsDQo+IHByZXBhcmUgZm9yIGl0
IGxhdGVyLg0KPiANCg0KT2suIENhbiB3ZSBhZGQgYSBub3RlIHRoYXQgdGhpcyBpcyBhIHRlbXBv
cmFyeSBzb2x1dGlvbiB1bnRpbCB3ZSBzd2l0Y2gNCnRvIHVzaW5nIHRoZSBuZXcgbW9kZWwgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpUaGFua3MsDQpUaGluaA==

