Return-Path: <linux-usb+bounces-35005-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGn1KLT9uWnZQAIAu9opvQ
	(envelope-from <linux-usb+bounces-35005-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 02:19:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 070D02B4E97
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 02:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C49C304DF15
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 01:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C6323C4F3;
	Wed, 18 Mar 2026 01:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WdnGLBpZ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cfZqbWzx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="udRzXO7x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885D321423C;
	Wed, 18 Mar 2026 01:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773796735; cv=fail; b=fDqCdfnmhwzxchKIxomRN7DUo0EujoruffI23CEdZHXWevLJnrOBcL2BMlL526kmabjNGSzKQkzAqF44CymZoh2qZAKOsT49p/317Oq8P8TK13qTIcvcW2x09H7mfHvl5pocS+t6zB8RHYWprkYri5E9WI6bSW0saV6poU0XkMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773796735; c=relaxed/simple;
	bh=RBzeZYmwnPBPT3v63U7a9dnfQ80lvvzwBS43YmHV4co=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EKw+rnZccRylh6RZ6vCiK8yrA99lmTLxEgl847P40vnJp1HmGZ5QM/fcC2huW6VF4BpZT4Vu5ZTE4jo0jZ/vwkzmo9LzkJfqNMmwaCi9vWqDVmE8qIitNAMfdEv5MGDJzAoWINN+uDksVns6pG/WHLozwrdnXzQqBJYjGvwA4ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WdnGLBpZ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cfZqbWzx; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=udRzXO7x reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HLT7Ii2203030;
	Tue, 17 Mar 2026 18:18:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=RBzeZYmwnPBPT3v63U7a9dnfQ80lvvzwBS43YmHV4co=; b=
	WdnGLBpZvuyS6OShiozDsScuCkgoUfYpJpheUKw08SDaTFqk+E22PoFha23fc3C3
	J8EF0r5W1j3kOxoIR1MJ88St9beKI0Q9KGzr2UjprX7LXsH1/AkSCj9B6w6Lk443
	vP2tnYdxN1YuQyoOweiMPDP5ApNkXHHPiOR79JxHI7zrziKrpy3Bh2GZkqxPvDeF
	2OHgSIfCRuoROAPv9jtgF/an28IsnEWZho0dAdLnqE+bat0OFmGbxpzlkhcz8qFV
	T8TTvaV8Ae+dqRL/RM1Kr82Og3Y5zmgItsFwBrLGS5fpyY6weTk1HpoddbOcord0
	K5N79+jto5rfc+3cndQnyA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4cyaecun3d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 18:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773796719; bh=RBzeZYmwnPBPT3v63U7a9dnfQ80lvvzwBS43YmHV4co=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cfZqbWzxQsXt2wYIRNlVfciSd1UkGmy7p5D8o9XVsyDiCnzcmgCeez1TrXIaATH61
	 A0IB7eqKtymBS17mb96yYduJDMIUcAvqFxxIY4lZygyLWyiudle5UNXcIPkOazCOmj
	 eD94wYD6JhAZplbtFhp2sWxrmGf3kYZMgcU9NB4b+5OsMkMYHoBI7U4UaiAMnfjz9K
	 scFjpZe7x6Ru6dybwMPq41baiYN/5ifF172dZZ4tOyKGE0rGlrnsFHP8ZtqIzVhLbY
	 ScNWY5utUXFKTTTIEqsCtgT1vaivBlA6WRgQ3IAaL3oGKDPwWjISINoHILLORaP8eV
	 /lZrM4mEcqD8Q==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 60AAC4013B;
	Wed, 18 Mar 2026 01:18:39 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C9AC3A01F5;
	Wed, 18 Mar 2026 01:18:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=udRzXO7x;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00104.outbound.protection.outlook.com [40.93.13.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9CA87401C8;
	Wed, 18 Mar 2026 01:18:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtgIQ9EE1e38JAMTzzwoAtb5CWcEzVBbBUz56MZC7eo1aBJ6LEEM3VysRwEyxBqDjj81JI43nlaruWKjv4uJxcuREbaH7DOOH1t4uQ06nXNA8T8jUyLwnGG2n9nlekgoQCISBB9QPOSWC4zDtRADKD5uq2CwiqxaZxFdlmPzXerNipvzK0xMc3qKBJBAMOxFIo+xyvu6UwDEJDJikheoBS8JuMcOX8Fk76UoX3cAVLbvYt3TSjjfLmaG3Ss+m6y/uiPP62cVDSyL9BTtbaf5p1JieGcDagamHWmYRiY9grdj/XLq+/ToGT9wFHIXt23jggxxzrR9Z50XWOFaEZMP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBzeZYmwnPBPT3v63U7a9dnfQ80lvvzwBS43YmHV4co=;
 b=EFbMLRQzQXTmxemMnJcf0+j5gxwjB0tS67O1tPfmCNWRVqHbIdKsmW0FwRcIHJnqsg/k2Rx9GijxZ6mloxkaJIJN7L0s/t5PnjKauYEEaXq3lUrDiQ5LhrrLj3rbt1YZnikoiGwoFh/CzsqJCiWMfMycby+fOpQdM1z/w6hKONTccQdjEs5Jb5YBE5nBv64tyGAyVsIbZ6pSLO3zBplkF3j4CT9jTKl0R5XAXHdtpdDSyTWrX+ddV7hsb8qprhekhCN3pcnv97R0gCdW5pyARkC3L74ufBBAKuEfgJ32pG/h08W7HwFD5zEbt9JL8sbZDF3qhOALWkKYOd4KJ5iBEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBzeZYmwnPBPT3v63U7a9dnfQ80lvvzwBS43YmHV4co=;
 b=udRzXO7xP1U19is/qBchxwZu0pNXmqovSshvwzwyRbdSDRBrunb1IflpGT3x+U+V5hnHQNNbm2bkW7VBWPqIJFGMbUykS1PtpljVJcShvEu+QWGbynZfHsfnC6rPoYmxE/ly9pWtrRJ+B6xGXLt9QrdD+s8LajmK5Vs6bMWr0I0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Wed, 18 Mar
 2026 01:18:29 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 01:18:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH] usb: dwc3: imx: avoid calling imx suspend/resume
 callbacks twice
Thread-Topic: [PATCH] usb: dwc3: imx: avoid calling imx suspend/resume
 callbacks twice
Thread-Index: AQHctbqywEv4devUkkGqrI02OwYkKrWzfsoA
Date: Wed, 18 Mar 2026 01:18:29 +0000
Message-ID: <20260318011828.u6cems56afut5hoz@synopsys.com>
References: <20260317030546.1665206-1-xu.yang_2@nxp.com>
In-Reply-To: <20260317030546.1665206-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8784:EE_
x-ms-office365-filtering-correlation-id: 57938ee2-c412-4a05-1268-08de848c4374
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 cck0l+CGzTzj1KNWoDroKEOYKAQPYEp/XnhMrydMUVjriYoHmOVPuSgdhbeBYjH3nWUzZ1YHubSWpNhvXiXD61A9Hdaxf6M+GTPS1kQZpqTTezMSDEu850pTA8HGZLK/cq3YDlBtSWE3lcUEJAFUpTU4zJTZOTDq81eGLOsCjBN0VH/agpbSFElSuIylvMc4naz3Ig9cgkLK8wFbwEduZ+84qqHVuGfn6cGdkDFyisqQOSlfCJgJRCT435TsfDM8bTGKOSg3/5I7X0OOhLf3PxEaYDxSzkSQxvQ5FAMqWXbHE/yz8uk8vlHXpN5PuANeQTCSCAUUWTjQTo14tMPvnrYxcNv1jlDZf5+5B8KhDvV3EI1Y/a8iLYrnOdsGQsj7cG7khLeKAOIgnntIyWuhVqqoPw2ZweSbl6FsgxBqO8SZ7BTIyJ3NwBtvT7ebcumCCXnTr4yIB1M7fa+ORobFL5R1jIkWI1h2cwV/vI7kYmLtNRuVzHh9q7xu016UhUxt8QFCK58KLJOKhtyMNwOn9aAIqGxBKz9ZEK8yW64TzsV0YH0DX/Gv5vj0DA8yLnHuo7mk/p7F/u/D6/S9/TLDXFiDdyxEWq4sDckcnlgp6gIcg1Lsb7SCmAawLzicQxar4xcw5CMnYbmQ/DyAimmxqWMaIjzWEzVMk94VAt2DSLXfe3VQWgIkFwr2cBW8MxFjAncjeiESi4nolzUGZ/xoUc6km6ER6vIoBFPamJI1+sSj7XGBdoig8Ji6BU2cR9NTwWdHz+lrdXYMSwF584jNlfpVdHF+dIa30MG3D0W+APM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TjIwb09Eck1SYllXaE1wQ0xMSldFSE12YWE3dEZ0cEY0dmY0UjAyTGdHZFgz?=
 =?utf-8?B?dXpDRkQ4dnZmbm5LNWh5Zk4rcVN1bFFEVHdTcFJtalFKRVpkT2dmTjZjbENG?=
 =?utf-8?B?R2NOSlFCQVIrUXRzUXFIeko3bVhybTFFYWFlR3BaS1Y4TlI5azJFckFUT0o5?=
 =?utf-8?B?U0lPOUg3TVBKTStiRjlHcWVCNm41SERBV3lTZ3gzSGN5UjZCQnFEMVBTWlVG?=
 =?utf-8?B?ZVFTS25XaUo3T1ljMDhLT1FjZmNFcllIdTNWa0FzL05MM2h3NWZpbmYyeGMv?=
 =?utf-8?B?U0o3VTgrbDhPNTdmaXVqN3lKYm56T2RCb3hyMzVYc0YwQUh5V0NqTWpoSVpL?=
 =?utf-8?B?MHJqNm5IWkltVHM5Q0JKSm5reTkySTBLZ2RvSnNKdU5jMHFsVXdhREtGbXhn?=
 =?utf-8?B?VTNjbGhQT0RlUjZ5WWQ0QS9GM1hxRG0wcUMwRXN3ajFYd2U4NytpWThtNXdr?=
 =?utf-8?B?N2NHTThlaHdjaHAvVk4zQmRjc1N5RFQxR1p1aWNSd1RQQmlFZjNuMm5ya0Fn?=
 =?utf-8?B?akVpRFNQR3M1M2NWUTJYNjNhMVJXVXZreFpUWGtqeGwzWHNKU00rNW9qN3F5?=
 =?utf-8?B?Zkw3bGVwcFh0aFd2OXQ3M0JyUXE3ZXNWK0VzMUxGOUdmWlYrMXAwOXRYOFVM?=
 =?utf-8?B?L2xiTXRTWUNSREM3S3RGWDUySTV6LzRNUlA3OFpyTzVIdWYvQTdYSDRncVRO?=
 =?utf-8?B?UnNuajdEK1FCQjhPUzFNR2ZPekwya1ZJQXlSSjFRK0szVDJzbHJEWkZGQ3pp?=
 =?utf-8?B?cG5NT3lkdkZWazRvUlJvWlIvYzBvbjZQbmQ5Z0Zyd1ZCL25KeHN2eGdHcHRx?=
 =?utf-8?B?TjVZSlQxb2R3SWZzdlNnNDMzTU5OOVV1TW9WaXdPVFlPcmxZTTFDTFZ2SE14?=
 =?utf-8?B?bzY1TGEyTzdTUklvbXRCUjZPNERpVlFRNVRYTC9LcjBCYTVtR09MY3ZMVDRO?=
 =?utf-8?B?bzYrSHlrYzRCSThOZlIrK2VPZ2VEMHVaME9mZ1hPOFZJTXdlN2dUYWgxRUIw?=
 =?utf-8?B?REJMUWZxbnFhc0lLS0RRWkthTEhRMmpOeVpHS2pkZ1hjbTlNMW5Oa2hxV0FM?=
 =?utf-8?B?Vk04QVBHbkk2OXBDUjRreDdKdzhvR005VC9VUXJoL1gvdTI2NzZSUDlPWjdu?=
 =?utf-8?B?alVwZi9JTDdveVIrUDQwYUJpNkxnMlFrL09TbjZ0bjdRU3k0ZVVFakJQWnFz?=
 =?utf-8?B?S0VESzJDeWsxYXJ3SEtwNG9IdlFod2M4VkRlQ0VHRFlmRGY1QzJNNG5qdmx3?=
 =?utf-8?B?ejJKQjY4RXh3amMxcStEdVg3b3RPU1BDSWJQQzZtRC9KMW1GMHVKampYcGhK?=
 =?utf-8?B?OEN2MHJqNkZWUUdCRGNLT2F2bWRjbDV1Qm5wMVFkVVFHVlZQejMraWNhVUdN?=
 =?utf-8?B?UXVPSXFwM3cyejRxaUczcGxqWW9iV1J6VlczQmJJTnNiNVhWeEZ3cXIwQ1RO?=
 =?utf-8?B?Slk1Z3UxWnJMeU9DQjZWQkFHOXdCM3laRC9tbXJEOWJLenVNenczT2R3eGIw?=
 =?utf-8?B?alZsUFk0d0dpRWY4KzZrN2xjNFUxNDc4YzlVV0NUQXIrOWtkQytQRGtDNUJZ?=
 =?utf-8?B?UlZtekx6ZStYWlJwNnJ5V3RhbG9lOUVJeERwQkJ5SjVWejJyczd2ZGFMMUxB?=
 =?utf-8?B?cXlsZ3Z2TFNqaWhjMm9KeVZnR1lrQWt5M01XOW9VYUxDSVNNYUZ5Rk14Qk5Z?=
 =?utf-8?B?UXNRT0IyNlhPN0FJODFOdGVKZ3liT2R5VzdjSTNTZnZValpyUWZpUmtWY0dP?=
 =?utf-8?B?d29uMTQ5MUpCYkhEajlvenBRTER2NU5scXFDR2o1VEkwRHpGcmhzcVFzczhm?=
 =?utf-8?B?NHFCOXp4MThaNGx1QnpXU3BUMHR0MHcvMk1jRDV0Wk1vWWJBUktvdUFRTHY3?=
 =?utf-8?B?aXd2R3pJcW5LRmo1OUh4RTFpaGJhQ0NzUEpueG1ublVvQTZJODJwdEdaTm9q?=
 =?utf-8?B?U04rME5xQlRacHlneExwSkNQSDFsbDl5amJrNUd2ZHZBRDduT2FwWmJBQ0Vp?=
 =?utf-8?B?ZHlhcngrYmpic2xHVG5VdW9ENldUUDdndmFXblgwd3lBNkcyZlQ0VTIvN21s?=
 =?utf-8?B?MlNUUFh5VElOamlOekJBa2pjKzFVNzc2YS9hZzZSb09XWXphYXVIWkFuUGRW?=
 =?utf-8?B?bWgzNTZYYTdMUnJNNkZHUDl5VmpyMjIySllXNWw5eGZaQW1aNE1Ud0M4SmVY?=
 =?utf-8?B?d200Mld4UkVtNGFuWG9PbmZFZHNhRWdmVDJXYWpaTXVGU3pENUdCWGkrT2lP?=
 =?utf-8?B?T2xoM1dhV3dyeXJQRW1hdmZ0Y29DZjcvYVowOTRtTlo2YVg1aUhkdGhsNG5I?=
 =?utf-8?B?Rjl2dzV4bFJrOUkvMXlqTmFGS2I3VFRQQlhnWXB1c1QxZ00yNmx2Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8ADF28F7A4AD54482E0CD6EF88CAD6A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	CxBA1DXyb/eUkPZ/TWnMF72qPTx51Fkzg2bmR1rBBk34nAYpvJw53ODcOIZfhU3xD+PElC3cPf3Mk+fOYJtxMt9JuzGSPXxdOundmG8mgqJITETawnlntrB5aD7PBC1X+6Fz9EoL43qvQSoKyz3m1ThqCMiuMpLx4AeRJrR4GOhI2LnYciPefj1SqaQvk/ZHAN2sUDt4AAMq+qmQBVfSQCFZdwEwuUwq640j778J9kynSG2162Gubk3HRCUmLVOtqdYHxGIvvD0cEDa00Zu2nWOTGlL6hdRKGf5qbw4JKH5HRasZo+oUmHqYX/XwdfPHBFijDgjZSaHFR1e/iTNrHA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DuwkGk741kxcS+ibQZohN8jOYPSU4V+N4E3QGk3B+ciyQy3d+/vN7rZECyi/F63P7hbnVeMugtab+Oksqx5ORhQinx76uiIuwSBCa6Eo9IKT8PJ5zNFKVoS3Fc0vXfvdI7UbdoloetBbXgNad88AUjmAb8qpFe7DMoCz/DaOOoYoRv0Y2QNWsV23RvRULDMy2GbvYEHqIv85KVA2ATFa+io+iVvqhRkeYG8N89PThi614cpCfZ9PUFm3G+ZIr9vjHeS6XZebDcz6XYy98+FZv40DIigHQOCqUA6zRDzQgywEj/Bv2jYvLbjeDwfslLl8fnVaSsOAeA8z7sLmo2z9PXEDyEM1d/I6nB3Yb3azk4C3ZvXDXxIe3xxavuD7Z6MFHQL/U5tK6tjOP7deezmNYGvcg8GLWt0wAmQIBZWG36tEdK4pdUCXyvRkD4VCIIeHMtyUOjuqL3Ek1MLpgVMcVbDoSW9HB3ruxOvUprPJ+R0CS6eqpw/UhTbSTCWj3m7EuI9geT9CBUY4sttsZbhH/KkGc5MwCMaL00GbMFjID3qrONCedaC/JlGthseRABBq9DuWu86FsL3iNozeeH4X4gJLUzQJHY7J0APLV37naLfiMylA1Ok0OsCeUt2fvxVyjWn1lfm1MKRQ+5EWkgAbsQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57938ee2-c412-4a05-1268-08de848c4374
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 01:18:29.5056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KUOnORflHEEqsPi5vCvJeI7KW45Gq1TJDxQkMveKQpkHjxuULo5e3d1pnIYCjJ3UIuDVcW0ixDwA4kg0pWqMQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8784
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAwOSBTYWx0ZWRfX3oLW2A/W44CT
 n6lREECyzCW7fc+LwMHzTLOELDzP/eFkujdzDGeiRi4h/mt+FbafHiswM739jhzORKb3GXvrDFl
 1toyYtClpm50WRShoUNDUtHBq1Mv5SRv8NNS0tfJ/mab65Bn5fxCNzEf7rLyUi+9yuvFO8Ti9f9
 +pgKtn/tmz/Y2/9ngFY88LmvXg/OIUULiRII6L8vTEedd2lATPyxA6Ycijk2aczKYeAu0viknpp
 z99rcNUfquy82JHP84dZPl9dWflX3LbSQQuhxORR5ZcEOhQFhVf0oXB0oucnlX9leGlOJn236vk
 /R+qM54p4hBrv8XXNdcO9UFELog37lmT15iWhl+ULMzejY5h2X4tL8vDdQ1yAXKPjB/fTnzaZfS
 wA+MxZViW1wkCkfAExNJwaaxpJU4KVDpsZ8NjTbdQYPhCLV5p9AOARZcc+ObKdI2NxtI5fRUbUw
 3Ovx6DW/P4/MC0kU8AQ==
X-Proofpoint-ORIG-GUID: 2lIEFF8S5iuTvIs9KOy3jBUload_pB90
X-Authority-Analysis: v=2.4 cv=efUwvrEH c=1 sm=1 tr=0 ts=69b9fd70 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=jIQo8A4GAAAA:8 a=jeBhB9CnjA_aDbEVMfwA:9
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 2lIEFF8S5iuTvIs9KOy3jBUload_pB90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603180009
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[bounces-35005-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:dkim,synopsys.com:email,synopsys.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,linuxfoundation.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 070D02B4E97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMTcsIDIwMjYsIFh1IFlhbmcgd3JvdGU6DQo+IElmIGEgcnVudGltZSBzdXNw
ZW5kIGlzIGV4ZWN1dGVkIGZvbGxvd2VkIGJ5IGEgc3lzdGVtIHN1c3BlbmQsIHRoZSBkcml2ZXIN
Cj4gbWF5IGludm9rZSBkd2MzX2lteF9zdXNwZW5kKCkgdHdpY2UsIHdoaWNoIGNhdXNlcyBlbmFi
bGVfaXJxKCkgdG8gYmUNCj4gY2FsbGVkIHR3aWNlIGFzIHdlbGwuIFRoaXMgbGVhZHMgdG8gYW4g
dW5iYWxhbmNlZCBJUlEgc3RhdGUgYW5kIG1heQ0KPiB0cmlnZ2VyIHdhcm5pbmdzIG9yIG1hbGZ1
bmN0aW9uLiBQcmV2ZW50IHRoaXMgYnkgY2hlY2tpbmcgdGhlIHBtX3N1c3BlbmRlZA0KPiBmbGFn
IGJlZm9yZSBydW5uaW5nIHRoZSBpbXggc3VzcGVuZC9yZXN1bWUgcGF0aC4NCj4gDQo+IEZpeGVz
OiA3NmZjOTQ1MmE2YmYgKCJ1c2I6IGR3YzM6IGludHJvZHVjZSBmbGF0dGVuIG1vZGVsIGRyaXZl
ciBvZiBpLk1YIFNvYyIpDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1v
ZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNi
L2R3YzMvZHdjMy1pbXguYyB8IDYgKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteC5jIGIv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteC5jDQo+IGluZGV4IDMwMzcwOGY3ZDc5YS4uOTczYTQ4
NmI1NDRkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14LmMNCj4gKysr
IGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteC5jDQo+IEBAIC0yODgsNiArMjg4LDkgQEAgc3Rh
dGljIHZvaWQgZHdjM19pbXhfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ICANCj4gIHN0YXRpYyB2b2lkIGR3YzNfaW14X3N1c3BlbmQoc3RydWN0IGR3YzNfaW14ICpkd2Nf
aW14LCBwbV9tZXNzYWdlX3QgbXNnKQ0KPiAgew0KPiArCWlmIChkd2NfaW14LT5wbV9zdXNwZW5k
ZWQpDQo+ICsJCXJldHVybjsNCj4gKw0KPiAgCWlmIChQTVNHX0lTX0FVVE8obXNnKSB8fCBkZXZp
Y2VfbWF5X3dha2V1cChkd2NfaW14LT5kZXYpKQ0KPiAgCQlkd2MzX2lteF93YWtldXBfZW5hYmxl
KGR3Y19pbXgsIG1zZyk7DQo+ICANCj4gQEAgLTI5OSw2ICszMDIsOSBAQCBzdGF0aWMgdm9pZCBk
d2MzX2lteF9yZXN1bWUoc3RydWN0IGR3YzNfaW14ICpkd2NfaW14LCBwbV9tZXNzYWdlX3QgbXNn
KQ0KPiAgew0KPiAgCXN0cnVjdCBkd2MzCSpkd2MgPSAmZHdjX2lteC0+ZHdjOw0KPiAgDQo+ICsJ
aWYgKCFkd2NfaW14LT5wbV9zdXNwZW5kZWQpDQo+ICsJCXJldHVybjsNCj4gKw0KPiAgCWR3Y19p
bXgtPnBtX3N1c3BlbmRlZCA9IGZhbHNlOw0KPiAgCWlmICghZHdjX2lteC0+d2FrZXVwX3BlbmRp
bmcpDQo+ICAJCWRpc2FibGVfaXJxX25vc3luYyhkd2NfaW14LT5pcnEpOw0KPiAtLSANCj4gMi4z
NC4xDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMu
Y29tPg0KDQpCUiwNClRoaW5o

