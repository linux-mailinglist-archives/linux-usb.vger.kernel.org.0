Return-Path: <linux-usb+bounces-31518-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 711E4CC573A
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 00:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96F98301E93A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 23:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2EC337BAB;
	Tue, 16 Dec 2025 23:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YSJ3z9pT";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BjFH4vNd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ro52t4ez"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A335EAE7;
	Tue, 16 Dec 2025 23:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765927180; cv=fail; b=ES5SbkbkG6lWxa6AWl3mYSJHADTw5qPgTFR6PG1Crj7U81yQf1ETamb590nVWx4c7BB2w0YePtLRJPeaskYpCGEu/jOLnzkSpAE5UzL07ptmC6VVqMWf8MvhOtWYrfm+WZ/MdlPETgDxBd5AEBYx+2pTBKKCJnXbotkbPuyWxY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765927180; c=relaxed/simple;
	bh=4zv5vYUHuPIGsGP5oyGr3JE4BDybPKTms7VL4etqTG8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ERH/WvFfus03oWG6vS/jZK5VGiRdjicfpmrhAlwMke9JsTad7qU/xuiUFG4mYiTEXwI01c33GkHa8ry1SKcK1LR5xJdcQUva8R81Zq9WmVv0fmtaACpNytTv5EpUEvLVdPRCVjmjx/7lCBUpC1BqZPHYiQ6/m8xG5dDjW0pnoe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YSJ3z9pT; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BjFH4vNd; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ro52t4ez reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGLiwMG916420;
	Tue, 16 Dec 2025 15:19:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=4zv5vYUHuPIGsGP5oyGr3JE4BDybPKTms7VL4etqTG8=; b=
	YSJ3z9pT4kluX15tDmdHiZAl9BYkdwsPLwH5DaZD4oKFLoxWLcA1bzzouQGMChJN
	k72dvXe+od22euZb5vwmP9joV9OiJQdie3XFX3wy7CYrjvpwgYrayjlLskzAtEVl
	VYejD96SfDLhpN9CaPwOpzFzvu/yqcnW8Ctx5IqJOxrge1udQ6WBr7X+VWmFr0JE
	zHNke8SGSMWRGXeqX+W4INzeDXYCANwIbWPcs7EnVZgZmUaVKtpWSTWbBtrvub7j
	lBNiucfIxho4eeulAvyJvJT2XuT6srL3Wx2eTn0iBPmJkLETdCd45gg/FNYQvPyQ
	diYUXQp10gioE2b3tsaztQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4b39qkt9nh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1765927144; bh=4zv5vYUHuPIGsGP5oyGr3JE4BDybPKTms7VL4etqTG8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=BjFH4vNdylDXjgUWTi7zo4B85rJaYLtdaX0FiFleDpDTdH2HFqOEsBwZ0pPdAVrVo
	 RxxI4OeznDieSRu5J1IeJlUcthbO2qtVaRjaeTZ1QAfZNFrCwTHyhvRgBFr5e1HgUz
	 3VEDJe9QMSPUeVDvpnIMyI8tcvHNGIiIXt8e9E+ID7sKWLDa+5OkDWjtTroRuXvqVc
	 NX/KalQv2sjQTCp8UykpaKbkFnqsuXEjZfRQmS3Y9ipcVlyBt4YkvKosm8XqZzh0Wl
	 D4p/CE9axi9wUPUGSlYn71vuNymgmx2HplUZcfnhVWbx77GDTVfDQlLKKwVySykXBz
	 cybR1YDbvJQcA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F057940298;
	Tue, 16 Dec 2025 23:19:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 89B42A00C5;
	Tue, 16 Dec 2025 23:19:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ro52t4ez;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00105.outbound.protection.outlook.com [40.93.10.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8BB1E401D0;
	Tue, 16 Dec 2025 23:19:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBd5TfK3IjCknVUp2wTIwDhQcZrZQNpmcnFD7BOL22eqfsUEk+G0aioqxdEoZhqO4IwFHALrIBgEsdUUtaQWAtmiucu1lOCJpKlTyI/W1KZelGeH3Lb5r2M3tpYlUtHLNuynQbTUDI6+/iwP9rRu2XL+xUOILFHDUP0NQaA5MmQgC7R4bKL6wBDZSR0eZgFz6/2LDnoWedg3ciIih8u0zW7DqGRvH/GzjWO2123l4LIRz/f112rnm38xOKA6F5IVA9JTwE26W+DTJn3wylWZDswE8LUwWiKe+ujcJYezbsnGJwIDahCYehFnO7/49JelyXtK/tWWQU8oDKOYwPFiLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zv5vYUHuPIGsGP5oyGr3JE4BDybPKTms7VL4etqTG8=;
 b=CCQvSm/avfbiunH8W5fZu35Bb+Vx2jXd2QjbhBx+2w7FgIIyjfQjKqY5/AA6l7i2zHNroxNiZhe2LPeg5b8w/JRTXL6V2kxc6h6NWN4JOYsnisdZDrs0YJb7uJbIjfuP051bVOhsMLucIPthiiYgfXtoovfPdgOw6SbhgpPuJgRp49Dth9HIRhHx0cufg55Q17chbhsedAdgEck8RJhS50FaM60foaP8T6NJ/isexaYy/exj/bFvYcEyQY+hKus0ZHDBNKY8TuQTgEtE+Zi3s+cWa7jEs/2RupwumLM1+OTaYZrhjM5XSUSrz+4j7ONcTZkZxW5jjnMFbvnOqqWVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zv5vYUHuPIGsGP5oyGr3JE4BDybPKTms7VL4etqTG8=;
 b=Ro52t4ez9I5XaiOzGV4n0U/Z7ZMa3/Lp2fq/q6jfSNYbBBvJllvfdvpNANQsD1SlvoouH4BB2+UOoHOoCXWV8daCSeqFo5rJuNc+3EBSNOq462tvoU3sz7Gb6b7nMuJQ8qCWWqPXr3oeQDUCvSkz6kAwxmEVBbK99mGuGUfg6dE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA0PR12MB4383.namprd12.prod.outlook.com (2603:10b6:806:94::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 23:18:58 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 23:18:57 +0000
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
Subject: Re: [PATCH v2 1/3] usb: dwc3: drd: extend dwc3_pre_set_role() to
 extcon and otg usecase
Thread-Topic: [PATCH v2 1/3] usb: dwc3: drd: extend dwc3_pre_set_role() to
 extcon and otg usecase
Thread-Index: AQHcZZdKyzCkZQg5HkKMbPluoRNs3rUk+YQA
Date: Tue, 16 Dec 2025 23:18:57 +0000
Message-ID: <20251216231856.onmuj3dhqfgaxr7i@synopsys.com>
References: <20251205032942.2259671-1-xu.yang_2@nxp.com>
In-Reply-To: <20251205032942.2259671-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA0PR12MB4383:EE_
x-ms-office365-filtering-correlation-id: 41bc5b94-3602-4478-54ca-08de3cf97d44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZCtqa3RURWYzYnorNjhlcFI0WXM1ZDhTUEpLRFN0Sis4RFY2cG5TazJyVXdU?=
 =?utf-8?B?RnlkNjJiMm1DTnpBWjNmWTF6cFNkdEpmV0ZjakdDZjJyWjdXVERidXRZdE1E?=
 =?utf-8?B?ck81Z3cydWNUR1kxOXJvaC8xQjdjVFBkaVlwQWJaRlk4MDl4d2NaWFNzVDNa?=
 =?utf-8?B?Y084T2JBeDB2TUFGTkFoSnF3eFRtQkpvanI0ZEJ4Vk9tcjNjRW5GUnhXQnE0?=
 =?utf-8?B?UHVhb29GelZUaEo5TDJrZys1Ymk5Q2JUNEMxTS83MDZsQjdmaG9GWTVFOVNO?=
 =?utf-8?B?eVViOXc4WFRtQjV3NGFjYk5MaTc3NUozYjRvdlkrbld3Ukx6S1lhNFVaeUwx?=
 =?utf-8?B?V3R2OXFCSi9qci9QOVdhTTZ3VG01YW5aTHY3ZG1aZVNUUDRrSDlITUdGZWUv?=
 =?utf-8?B?K1JQN0RwWTdmUmI3Ui9IcWoraG96dDlaWHpSdTlXUnVPdjFmNGFvK1RyOXJS?=
 =?utf-8?B?cHpjZFdUVFdDYUZNdWo0TzJqNERETXJOcmtwSHcyVFQxNXF4TFA0Zy9Rb2Jh?=
 =?utf-8?B?T21jeGgrbkR4L0dyNzE5bU1zWFNPNlprOXFXYkpIbUhlNlIyeHFBeGU4L3NN?=
 =?utf-8?B?T3RoVVhjSmd3WHh5L2Y4SnRFY0k0am1DSUszS1h4cktISTVKQzZuWWIrUzZX?=
 =?utf-8?B?WU10dFNqcHJlcU9nNi9LazFUUUZlTDlKeklxNGpxQjNFbmFkVVNkZTZkNzAx?=
 =?utf-8?B?bGtJcmlJYmE4VU5qcUtoR2s4VHVOTkNrSklzVHRTdFM5Y2hJVHAvOUpFQmhm?=
 =?utf-8?B?MktkM0xiWHl4YVA4c0RjVnQ5bnl1c041a3NNRUVGQzdNbkVWd2xxdEF6ZWNX?=
 =?utf-8?B?cGttNW9qTW02OHFjZVRpN08vVTYxWkphdndjSklPUnNKRHpvZFRHd2d2TitM?=
 =?utf-8?B?ZzJHdDRMcDcvVnpuMkNVT3pyam9CZVZKdm54anpzSFVBb2lwWVI2M0hreURT?=
 =?utf-8?B?Mk91cmMvQmxyNUswcDZMWFRUUWswTUppckhRZGNaWGdmZlZFWFdoNnJ6WE1Z?=
 =?utf-8?B?emptMUgzMllLNHd1M0Z2aTNyZlF3TU1UODhjblZjemh5NHNueTNwcUpORDFt?=
 =?utf-8?B?UEliWnR2VDlLcE9GaGNzVThQQkhBc2s4endLRkJoWmxoQUxyVjBvTE9Jcmxq?=
 =?utf-8?B?ZkdtdTFwamJ1UHN6b2xmTWg2amQ5dXU4QWZXTkhRQ0lhY3lrMTBoTjBLZlZw?=
 =?utf-8?B?YStYcnBEdHpDU2FzMWdxbU0raFhRK3liVTNDQ2RCUCtMbXc4aFk2ZTU3T1hm?=
 =?utf-8?B?anpqMGVjY0ZwcG5MbnZ4ZzZWYXFFZHUzaHR4ei9pZnY3UjhsQndtdFlNUm5T?=
 =?utf-8?B?NDhKNDF1THcrbUd0aWMzMlNvd01kWWtYRjVZUi9qMDhaYkpDVVNtZWZGK1BQ?=
 =?utf-8?B?cGlpV1JpSitFcTFaUFZHOWl2dEFhWk4wamM3SUV1QUlFUVNtdHh0T1hMY21v?=
 =?utf-8?B?UUYzZHhFd3p1aU5xcnVCNG5iR1RjQnkwdWpFWlFYN2d2bm41UFIrTzdmeFBa?=
 =?utf-8?B?M2pobWtUcjlWWG9DR0V5Vng3NzlIK0dQdTZPd3F2SXdtcUg4MEZhRGN0dUcx?=
 =?utf-8?B?M1FhS2tXQWtpblFtV1NJQ0pQY0hpLytMdDBhUzR2a0k5di9Pako4Vk1FMXJJ?=
 =?utf-8?B?Y0JCak9QbWY3Qzc5LzlObzFNaDZVSHFaNTViOERJMEZMQkI2UUt2VWpLcVRz?=
 =?utf-8?B?VnRwMEZac1JuUmdYaGtQY2pSK2Y2a1FQSm1CZXc5QmY1aUo1VXlqVGRNMy9K?=
 =?utf-8?B?WjM5elBSMTNUUUhpaGdlcmpEdGo1MXZPSmtKTWJ0RFNHMEVQZ2Q5ckRRd3Bw?=
 =?utf-8?B?SVd3NktSK2pFSEJqSFliOStUTVhUR3E4Ky9WQXNiY0Z2R3VSU0RFTE4yR0tC?=
 =?utf-8?B?eE1VSk9kV1RSSVNvMXdNL2c0RXlYTU9VSWF1VWRndDdsOWNod294Y1pYZ3BP?=
 =?utf-8?B?QlVVeGg3KzF0enJOYzE4VFRVcFE2MUdUUXFWdlBtOW9pRnZKbUZ0L0FmelpT?=
 =?utf-8?B?L2VGanpnOTZSSjVPajVrWCswbm14cGxTbTFENHA4VXppRHBtdXBGK1h5VGpo?=
 =?utf-8?Q?3s9AD7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFRLc1VqaTU3NDRIaE8wdGVEM3VBcGdvZDMza0ZUaklsNlBab1ZBYUpFdzAw?=
 =?utf-8?B?OXV2UkpnVEtyLzZ4ZEJZUlMwU0NGQ3Iyak1kTVBmVUNiWkFibWYwZnVNSFBk?=
 =?utf-8?B?YUkrTTVjVkpCeUlGc3ZOUjNjYmtNeUNNOFk4V0FPR1VEOFByKzdDZVViUlll?=
 =?utf-8?B?SDBKa3krT0lDNFMzVDcxVzZ3WTFES28rM3FyNHhmVDJxazJrTUpkU2doNDM5?=
 =?utf-8?B?OXk2ZERVNkJJanlEVHIzRndIT3ZqVWFSOFJrUm0rRE1USEN6ekdMa01IYmFV?=
 =?utf-8?B?WTlFWnNlbHZJZW1jWEFVTTNxcmFzVW5vbHVqblp1eHIySmxmR2NPRlZHR3J6?=
 =?utf-8?B?eTFEUlhLV05CMWt4UFlsR3NjaG01bXNac2lsS050eFc0WE9ySTJDNG92dWtH?=
 =?utf-8?B?akx2SUQrWTdxOENYN1Z6WlM1WjZ4M1AyNXY2dTJQczcyNmV5V3NsSHJNSTZI?=
 =?utf-8?B?ZGVJeUk1c25TRzhUbk14VjZJNFRNcGZSV21pbklvbnBxc1lDVXRTRDREVENu?=
 =?utf-8?B?cFBvbHpoYnlQajRBTVlKM2V2dUFWdDBsY2VHeC9Pa0VkSWpZZUtqTFVlSWJp?=
 =?utf-8?B?bHdhYkk3TmtiZXNTQThNZkNaSmU5TTRYY3poVmF0WHlPaWluSzA1c1BBQURj?=
 =?utf-8?B?aElCTDB4MURlN0pJNllSZFNDNVVpM1BBUk5mVHdBUFlTeW5FZ3czSzB3THF1?=
 =?utf-8?B?akZEWFppWGhxSnIzYUJoRWJIeS9aa2VhbGVqV1hiSUVRbmk3UjcvTTZpWkNX?=
 =?utf-8?B?bDJiVmJvOENncFJkdUZqNUtIKzllZDFJc0ozVzYrcnoxZ1dqeTZQMnZqWlpY?=
 =?utf-8?B?QTVXNWRXNXE0R21QUTJyUGY1clRPZWVTMUVEWjMwSEdUOUJIVGdwdTRlQ1E3?=
 =?utf-8?B?KzY2K1JhOW1GN204dGgzYTBnUk92UHdhMHBjSUs5eVpGYUtHOHhxT21WcHJo?=
 =?utf-8?B?K1RpdVlmdUhta3NBNlZjdVZxODlzd3orU2t4dnN6S1RvNDRDTXR2dFdsNkF4?=
 =?utf-8?B?dlZLUnN0elFpUE9FOFFkeXhwT3JnMVRaSzZjV0g3anA3RElPN0t6RDhrYTQz?=
 =?utf-8?B?TXVDR09UdXpPaEo4VnNCb3BzNGlwMVM5akhqN3h2VTV4aW1GbXQ3dW4rUlJZ?=
 =?utf-8?B?VU9reXgwcUk3ak1SR1FDQ2ZmSEVHYWtaT2xvbFFoRnBPa3NnVjdUZ0VtMEh4?=
 =?utf-8?B?eG5zMmNBMjczZ2d0L2JTMTdHbVlmS0J2WUVyYVNjblAvcHdhVTZ1UW1XeFZs?=
 =?utf-8?B?Rm1YVjlSZncwZy91WEptT2l0QmZSLzNwUTkvMlBpR2N4aWNOaHRjTzR2c2Fi?=
 =?utf-8?B?OXU3VG9ySFJENkRXZmhvNXVFSFB5TVdKUWNHTkl6RmdTbWwvS3FqMHhPOGRI?=
 =?utf-8?B?cXRlc0lobm00bEUxc0s5YkZqMU42dFlHZ1h1UUpGVlVjODdiRmkxQzI4d3Vs?=
 =?utf-8?B?cTNyMy92cWxWSmxvRklUcGh3R2ZKbzFFdnVOZ1AyckdnV2QzSGxUVWRlUzhQ?=
 =?utf-8?B?eG1pNjhncTdMaitUTk1CSnk4d2dPTXVJZ0VsRVM0UkMyaENPWWR6VjgwMXoy?=
 =?utf-8?B?cFJWd3gvSXJFaHd2eWhTdHhZb2UxOFcwbzFlbGFzTW5nMTdSNmtKQ01QMFAv?=
 =?utf-8?B?Z2FVTkJwVXpmNDBFYU5nR2pwL3dkRDh4VFFwNHM2TER1Y1d2MkMrQXpBY2Vy?=
 =?utf-8?B?aU9waEJkVWlaWFpmSVQ2V0xsNEFtU1NOMTRiUGpTU2RMc28yRFhSMHhDV3Rv?=
 =?utf-8?B?UVBTSXBNZ2V0ZVAvV1MrU1lzZk5oTThPaThkM2hVODcrWXVrODdacXA0MTJ2?=
 =?utf-8?B?c0NrRHppaFlEb0VrWkVTNGI2dlhJbkFQMy9qQVVjbDFSRkdsazdkVmRiaEtn?=
 =?utf-8?B?T1JIYUNwZmtjWVEvMVJMS1VaWXdxL0p1c0lEbUVaNFdKK2p1RDcwdjBvcGxU?=
 =?utf-8?B?Yk04RW56Q1dOUUY1bm9IYlVmUSt2bmJPNFZ0S1NKVktNZjZHTHhnaW1ETGti?=
 =?utf-8?B?RWl3cWlabWlRYXRZREgxRHo1amxJVEoyV0VXd2pTUmttZVFlUWo5MG8ybXpa?=
 =?utf-8?B?UTVVc01GbXhESlBXdmI4TGNILzNoMTlNSTJnTzRDMmk5cGd5Wmc4Nnd3T01a?=
 =?utf-8?B?anVOeVRCNkw5azJUTCszcnA5d0x6aHJxRTJFUXF1L0dkQzZXZDErUmFiN1Fq?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE6A4B8F4F60AC408B64531F70B72FF3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PKp3sgxCEsmWgy0YUStYw8rNC6WivZZnZrm6Sl5MrO40h3z6uteln0b2Soyv+thTZpxVJZX4IeSAr7rcmELTiG9SzxeA/DmVl5sWk65KbTS/tNWPDz9l9+PAmXLMmyseaTdLZCkSOK+/KaQYKsB5PxMvvy+I/uAEbY5Fwh0iZGGRV5WAfe026bUWmy426vL/NuiNFd0Lc8zwNZz/tc/LZRFrxNXoT9qVMG3Tx5zdpjRrA0Bkbo8yR7kChlcbI6l8Tl29V3nJknDb+52TEL0nY7yKDKne+JrEgv/2D74B+gK06jRIjW1R2WowITbQqgj5QQap9lLEMfC5ep5KHHlaOJ5yB8c7hzlw7L161rEYEt05grh0/yVaKMw3tcshDyLhpquWN5craN7TN6t8fhuH/zl1+eKDUEBV6NVwlh9T6BWxV/LPm7eouwPdKlcI/sFifZUF0maenVzcazSlMMP3U6KG/o4CmPAzNKayvql19lvRdq6dlmfeHm4S39occZemCXkd4HbpnSPYUmklPlOfFwt6Teqrpvys59FUxX4REsv2fsc/9nuVpwtPUHLYA1AHZOyje2hmtxaafXmlKncFQzkxbSSrMabGKjH4FV4IDC25vYHiYYUOPdHqnYzyE+zeStxPlvEv9hiE5JnrDLWtqA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41bc5b94-3602-4478-54ca-08de3cf97d44
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 23:18:57.8885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: plvrjfO7n1hHciVcplUUPRdl2MCEjqRDbCjMrjCHCORAuQvQ/BrGsvA5yepCnQJ1URtv0dee65PTplasPmLiyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4383
X-Proofpoint-GUID: -BGOXAXy6JkDxViaFmBaxCgXr6RHKTI3
X-Proofpoint-ORIG-GUID: -BGOXAXy6JkDxViaFmBaxCgXr6RHKTI3
X-Authority-Analysis: v=2.4 cv=FYY6BZ+6 c=1 sm=1 tr=0 ts=6941e8e8 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=jIQo8A4GAAAA:8
 a=PnOrEwL628qg4IIo4mIA:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE5NyBTYWx0ZWRfX814deIM4UoQs
 4rKALxq19lrSiLy5btmxce+8Uevke2ZuDgQFExMFdtrQ3k9kY0flEi7VMojFTLUgO5Z26XfaQud
 e41VpSFBBKE+q+V+Tq9un0h0vz/FfinCcyAU9Ek2P4rV4fwElwBuAkdgkOsOG+8Sl41igcfeNtk
 xvDXuc1/r5hjqHpooR9K+WDFozX20OQuYoc0fp8wrWoOy4dC6uHwcY/Dm/9QBoYTFaNkm1A6udu
 Xuc5lgegE+tw0hbjTVrOeK1T8XcPWU8JJHDeIKkO/bA5ZkAufinSA041tGEgZbGgpqTsrJQXtW/
 xmdLM5KQBqOg9sUDo826Zv2vzKRE1uCsQ2vV6HpX+X2OAR1My9lB/nAk6taAnaarf4M5UjfnZgT
 cpAx1CZHjVuUIHdYmrFaLr6glRO/ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 adultscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512160197

T24gRnJpLCBEZWMgMDUsIDIwMjUsIFh1IFlhbmcgd3JvdGU6DQo+IENhbGwgZHdjM19wcmVfc2V0
X3JvbGUoKSB0byBzdXBwb3J0IGJvdGggZXh0Y29uIGFuZCBvdGcgdXNlY2FzZSwgc28gdGhhdA0K
PiB0aGUgZ2x1ZSBkcml2ZXIgY2FuIGRvIHByb3BlciBhY3Rpb24gaW4gY2FzZSBvZiByb2xlIGNo
YW5nZXMuDQo+IA0KPiBSZXZpZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+DQo+
IEFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPg0KPiANCj4gLS0tDQo+IENo
YW5nZXMgaW4gdjI6DQo+ICAtIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UNCj4gIC0gYWRkIFJiIGFu
ZCBBYiB0YWcNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2RyZC5jIHwgMTAgKysrKysrKy0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2RyZC5jIGIvZHJpdmVycy91c2IvZHdj
My9kcmQuYw0KPiBpbmRleCA1ODliYmViMjc0NTQuLjAzMWNmZDEyMzAwYSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy91c2IvZHdjMy9kcmQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2RyZC5j
DQo+IEBAIC0zODEsNiArMzgxLDcgQEAgdm9pZCBkd2MzX290Z191cGRhdGUoc3RydWN0IGR3YzMg
KmR3YywgYm9vbCBpZ25vcmVfaWRzdGF0dXMpDQo+ICAJCWR3YzNfb3RncmVnc19pbml0KGR3Yyk7
DQo+ICAJCWR3YzNfb3RnX2hvc3RfaW5pdChkd2MpOw0KPiAgCQlzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gKwkJZHdjM19wcmVfc2V0X3JvbGUoZHdjLCBVU0Jf
Uk9MRV9IT1NUKTsNCj4gIAkJcmV0ID0gZHdjM19ob3N0X2luaXQoZHdjKTsNCj4gIAkJaWYgKHJl
dCkgew0KPiAgCQkJZGV2X2Vycihkd2MtPmRldiwgImZhaWxlZCB0byBpbml0aWFsaXplIGhvc3Rc
biIpOw0KPiBAQCAtNDA2LDYgKzQwNyw3IEBAIHZvaWQgZHdjM19vdGdfdXBkYXRlKHN0cnVjdCBk
d2MzICpkd2MsIGJvb2wgaWdub3JlX2lkc3RhdHVzKQ0KPiAgCQkJb3RnX3NldF92YnVzKGR3Yy0+
dXNiMl9waHktPm90ZywgZmFsc2UpOw0KPiAgCQlpZiAoZHdjLT51c2IyX2dlbmVyaWNfcGh5WzBd
KQ0KPiAgCQkJcGh5X3NldF9tb2RlKGR3Yy0+dXNiMl9nZW5lcmljX3BoeVswXSwgUEhZX01PREVf
VVNCX0RFVklDRSk7DQo+ICsJCWR3YzNfcHJlX3NldF9yb2xlKGR3YywgVVNCX1JPTEVfREVWSUNF
KTsNCj4gIAkJcmV0ID0gZHdjM19nYWRnZXRfaW5pdChkd2MpOw0KPiAgCQlpZiAocmV0KQ0KPiAg
CQkJZGV2X2Vycihkd2MtPmRldiwgImZhaWxlZCB0byBpbml0aWFsaXplIHBlcmlwaGVyYWxcbiIp
Ow0KPiBAQCAtNDMzLDEwICs0MzUsMTIgQEAgc3RhdGljIGludCBkd2MzX2RyZF9ub3RpZmllcihz
dHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLA0KPiAgCQkJICAgICB1bnNpZ25lZCBsb25nIGV2ZW50
LCB2b2lkICpwdHIpDQo+ICB7DQo+ICAJc3RydWN0IGR3YzMgKmR3YyA9IGNvbnRhaW5lcl9vZihu
Yiwgc3RydWN0IGR3YzMsIGVkZXZfbmIpOw0KPiArCXUzMiBtb2RlID0gZXZlbnQgPyBEV0MzX0dD
VExfUFJUQ0FQX0hPU1QgOiBEV0MzX0dDVExfUFJUQ0FQX0RFVklDRTsNCj4gKwllbnVtIHVzYl9y
b2xlIHJvbGUgPSBtb2RlID09IERXQzNfR0NUTF9QUlRDQVBfSE9TVCA/DQo+ICsJCQkJICAgICBV
U0JfUk9MRV9IT1NUIDogVVNCX1JPTEVfREVWSUNFOw0KPiAgDQo+IC0JZHdjM19zZXRfbW9kZShk
d2MsIGV2ZW50ID8NCj4gLQkJICAgICAgRFdDM19HQ1RMX1BSVENBUF9IT1NUIDoNCj4gLQkJICAg
ICAgRFdDM19HQ1RMX1BSVENBUF9ERVZJQ0UpOw0KPiArCWR3YzNfcHJlX3NldF9yb2xlKGR3Yywg
cm9sZSk7DQo+ICsJZHdjM19zZXRfbW9kZShkd2MsIG1vZGUpOw0KPiAgDQo+ICAJcmV0dXJuIE5P
VElGWV9ET05FOw0KPiAgfQ0KPiAtLSANCj4gMi4zNC4xDQo+IA0KDQpUaGlzIHBhdGNoIHNlcmll
cyBzaG91bGQgYmUgdjMuDQoNCkJSLA0KVGhpbmg=

