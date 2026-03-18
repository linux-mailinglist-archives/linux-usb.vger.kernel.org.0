Return-Path: <linux-usb+bounces-35003-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ItPBPv6uWlfQAIAu9opvQ
	(envelope-from <linux-usb+bounces-35003-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 02:08:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ADC2B4D9F
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 02:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 194B23094626
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 01:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A26422759C;
	Wed, 18 Mar 2026 01:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YO8RB9eW";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cydOoRmR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="C+Avo0eM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131DE63CB;
	Wed, 18 Mar 2026 01:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773796055; cv=fail; b=mweKJa366REiHNH/3nx/4FtXQhi3cgBTlA13QinUKEmqMiIhG2O6IgZVXet8hIzMt4CRZjfNASOma3ysOZaMwxXQ0VnkDR4OVpRsLBRS65vC8yGaSRzR9PcDQ06LTA3W3h8+xzpMC+/geMGVdGnhy/aVrr4iE3yXvC73ZqoG5oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773796055; c=relaxed/simple;
	bh=ARB/qNTrSOxrgBOmNj1QosMdcf8uPxne7bjDZEXkYwg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TPdq8IIvCm+ZOp3nEPbT1aff0FCT7E1HH4Ez3jsT390hd+HWyNyQCk4whgvpE44djU5j+OFhsnVg+UhPO8vxAo1C3C0KX3WsD5vku2Z/156cJFYZD1Gdqdg8hopw2evhLTaU/Iyiq8j38SCxZix8Ke10+thleYWmvosxfy+eCxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YO8RB9eW; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cydOoRmR; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=C+Avo0eM reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HLVSnk2203031;
	Tue, 17 Mar 2026 17:30:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ARB/qNTrSOxrgBOmNj1QosMdcf8uPxne7bjDZEXkYwg=; b=
	YO8RB9eWpxKcvn0X48Gv2ROCgr2mmGpNJuazZhIhGxCiW1tlf0BLCkQT98ofVdCY
	1sh2wTIYIy2lQGgrlhPSEODvNIeak3QYWvc2DF4axPpaLAky72SnXiqCP2ImurcS
	Y/mejrNktRFomWzpdyiVPaoB+7pxcq1DuC1pI9q8VewnXksON+rRE6e+GL0zOCgU
	dybeopyMIwHn1wSSb0LFhsEUiRar4HDsbzlENlOWqG/kfaIRDetbrND2h6WTCTGm
	IQUlxvHFtclC6B1uakEdZIQyshdr5aJCbwXs3ChViTqDDjDgRWGAFD7Qpc37vRi6
	41EmgJK4U16RKTzOjv8XfQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4cyaecucdr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 17:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773793808; bh=ARB/qNTrSOxrgBOmNj1QosMdcf8uPxne7bjDZEXkYwg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cydOoRmRg5vgsf2y3LlHYlxjUqtnD1pL/7XTBhjzjptwIt9q4VpqyY6KlBqFg53r/
	 hJP0vG6a06Rx4Dw+bgPhZdbt1oMJ6Ur37HAoiU0IBnmAYRQVV2BzxqR1xZCpLx3LsR
	 +Qc+U0F/Mbca7y9T72XrnzUO/QXY3kQ0ul98alSaeQrFf24JhfvEAgpVuJ1shGNdQP
	 A2tcOsQK1mXc7Zkqycn++GCSv5zVf/Ce2V5RQ/gd9XMkF00jkX1RYehhKGBuQRjZP1
	 jfbv1qvfbQ6X7vbZSaYKvGl7BB/2oBRehz/yFmclfyw/VIJwa2YWAnXvjc2M4uSZqn
	 eYIINSKFGy2Cg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AA46C401EE;
	Wed, 18 Mar 2026 00:30:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6D50AA0219;
	Wed, 18 Mar 2026 00:30:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=C+Avo0eM;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00102.outbound.protection.outlook.com [40.93.13.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A0A33404AC;
	Wed, 18 Mar 2026 00:30:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFdqUzmdeo7VsHJ20neJuQhECp4jLpwIQXztM9v2QGPYkqMHAAdC8+hMyEX6EyuICqAA8smYGZtRwdRz9/ftYPX26RDSFJmsIsBiy1hDNzbsBJ4dlQ6hIQhSnzqnTbywyC5lRyTYiMpaaDZEl8bPF3X5tL9eTKueJMJC4+N8eomQMKsMoyorDEAc1lIfsUnHfW9MAWxUU0b+HVObZ1s049s5PA/rXnbvIhfQZNfUXUfquPdL52X1c04EF2WbfMXl6jqFzv6VJxcK0sjg+fcUxKxS2s+Rnk69xtN9ja9nwV/7qc98UtWTceDi/npa34bYB+XLVQn+EoKynPQVPlIEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARB/qNTrSOxrgBOmNj1QosMdcf8uPxne7bjDZEXkYwg=;
 b=nodMxcsTR8TbqRasscfyyvCrNzMoRJ9bGTNefmhI1t7FQKiFe58eJXuTE+7Pzh612oXXP3I+fqAsRaqQWoKGGKey8ObKxTdIsQcZNfffx6WoEQSeQhK9acTHkEn6mB6aw45pOeLcX1miIHr3XRTIWnLwBOt0DYGrX4nMimidQlLgmLpTN1vZpPVpLAzCb7Atb5B3E2fU+GZni1fRY74BU99fPLbibHDOUcJVYdh/GOmR3ioXggacL2zj0Hqc4DgxWvg3Zo42k8huk3R29aYWpx24HhQzKdGfGkqDmELvkCEOAD6zqltKUc6x7pI3qEx6nfAEchNvJuncnN4TKi/2mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARB/qNTrSOxrgBOmNj1QosMdcf8uPxne7bjDZEXkYwg=;
 b=C+Avo0eMZHh9FC46px7XIL5mG7v0nuG7FXgiq75SqXs1fsC1n0t5xGmN+57RXlBmgUGVMUCNVSQPKr6YnhVwZSBrBlAEGbUqXq7yZz+8af6qJcPe5u4J+mhbZRocrYtQEs7bifo8DgyVNdjPqskCMVBXA3+Dl+jEIopsCdM4X/U=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8925.namprd12.prod.outlook.com (2603:10b6:a03:542::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Wed, 18 Mar
 2026 00:29:56 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 00:29:56 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ze Huang <huang.ze@linux.dev>, Yixun Lan <dlan@kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
Thread-Topic: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
Thread-Index: AQHctRr0ppGnJPsRE0yK8zk2BTHieLWzcneA
Date: Wed, 18 Mar 2026 00:29:56 +0000
Message-ID: <20260318002953.6gknb2jfveqyisop@synopsys.com>
References: <20260316080000.3130372-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260316080000.3130372-1-amadeus@jmu.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8925:EE_
x-ms-office365-filtering-correlation-id: 90dd270d-c1d7-47a7-b011-08de84857b4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 0E5YFwn2bGVfLjZoY29cD7eABkkJ3gjWhEeHbbQborJOHCzk9S0Ce819e2N7hiFKDi9uqAZmMoi9Gln6W8g+rBNMrhuwMskQx8SPuNIurTe245uKoiSXDtG0is9avn1c/yGObBVKDKMrg0Z66JdTzH7SVzb/w5mJDzzsZLu8NzBFQcgI1/jlBBsW0YC2vYBAIFGvHD9Iq+HdJlcwwiOiTWKiw7nBBynj9uyCnAKcA/R8fmR+7oLkYqEOJr7slWzoW6CRToCtEtU8eaEQZRbCKOPhqkuErHr61kWzgJ3EX2pJ7sSZ6xok1XUqqXycAQJd9iInCYtjSNsJTUIq5dHlD7YI81Eu2TPgoNa3w5RMDx1fBw9NQoUxjzCmQ+T/XLGWqJ7J/nyK4x2LhmSWdripRGrt37SNQlts0sqR911HcfX+VD2X1+Eci5XyBsLVLXjIoya15pzPLcPf/Moe3hDF0OTYRd7CM0a3MsVhXrJtl7XpICuFOKMHUtbxBygIquDWCoWPMBlsriX1nDgvJT2qiL9ld3MF6RgoxfQWOgBafo5vvfPge7NFwjWA81+YhPD8I/ay7+al8hX22Xy74ixsze+zY0tbeHqIO78z6H8TH9o0S7pveUp8ILG2GW9T607Bg9MQrzpWOiGf2kOSOwZXSKAP720ydn6/9jtCTOr7W7qr5S1lk4JU9o6ZRhaQfAC7ACNvnPEP/KbN0EP8eDiOwMfc9yn7XBT6vgOXsWuLQ9Kc216E9JmQxekfgh+fYWyO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0NGY0xVMjdVeTVaV2RZdDdZMkN2OTZ3ck1zalJ2ZHhjNlhzYkRRZkJBUFhy?=
 =?utf-8?B?aUxhNDRxYlpKRVRkUUk2a2RGRmIrelR5L2hrTitlbWxpMk01YVhhNDd5VUVF?=
 =?utf-8?B?d1lGeFYyYlUvWng3SUlVZkJsaktEbGdFWGEvbFByekNza0tVeGpnajNPR3V3?=
 =?utf-8?B?WkE5WjNwN2YwZDFlK2tOaTd4RHRqK2lJTCtLSHFZNzBTaG5BMUQvVE4zRXFM?=
 =?utf-8?B?UzFFS3VEeVNheWU5OThLM3FaMTN1dzY1RVVtSmJ5d3FiWVc2U3daVHNvUDlk?=
 =?utf-8?B?Q2puMlAwRS9GWFNvbURoWWxuZWpVU0NvVUpGQVdDTzlPeG1CMEpabThGMksx?=
 =?utf-8?B?ZjM1M0E4R0w5Z2tUYzBsaVhNUlc5U0NGMWZhYWk3MFIrR3g2ZTk0V2Raemdy?=
 =?utf-8?B?UWUzOVJkR0xKbjQ5cHp1M3AyaXQ0cDJpOEJuUFIzUlpldnIvYno1M2hlazdR?=
 =?utf-8?B?WnkvdCs4ZEd2WXk5VFlQQ0NYVG5JWnhvMmhCbG9jeUpnbHdIaGpCUkV2MDFO?=
 =?utf-8?B?UzNHK0g0M3dJYXNiY2NBZk85NElSU20yTkxWamVrVGtyTXpaSkxOUXRrNFNl?=
 =?utf-8?B?ZUZCV2dYTGJJL3ZPREZwQXpVUG1iUUxidFNtOFBEQkFsdGZFZksxbWNEeW9u?=
 =?utf-8?B?dHJvTm1xV3JBbzAzaTQ4b1E2OVIxL1pUQlEwTS9JdW5RaG1ubTRJNDY3ZkhF?=
 =?utf-8?B?NGhjMXFhWUpIRTZEbjdVS21xa04vWnU1QmRMQTJrR2QvZzR4aXpJa3BxRTJ2?=
 =?utf-8?B?bGNJbXpJSVNRTUgzZEZQbzE0ZTg5UUc2ODAwR0xNZlEzbnNQTUZCb2lmL1Vv?=
 =?utf-8?B?SHMyaEZJWUNwemc2VitUaUZEekw5bmJEV2lTeGIrNi83bE9MQWdpZXI5SkYr?=
 =?utf-8?B?QklPRjdlYXBJWE1rZkZhSHBoMTBGdkhxTkZKWWh4QmNIY3hVZGFvNlAwSHBi?=
 =?utf-8?B?QWE0azJmRzFCOXBqSGdPdW94U2gwVHZYZGRVQWNoRXAwNWx0Z2hNcVlaV25v?=
 =?utf-8?B?REU5WUF4L1pUdFdFSmhzS1Zwd0Z3WHZqN0xaSjZBOC83ckRtTWg2TUNZMHZn?=
 =?utf-8?B?VlVoU3l6cWFNYzJLclpnVGw5YlRJOENybEJtbnZQaHdKemQ4NzByeVV4bkhT?=
 =?utf-8?B?QVN6WTgvVkxMbWxaSWtWSEpBSG4xSmtDWXBsOTBjNWJJaXV6Qzg3VkpQZDFM?=
 =?utf-8?B?aEZsUTNCQm9WakVvWFdJQXZjVmVtOFVlb0QvTG1yWHpXaXRiSWh5UFU2bDZ5?=
 =?utf-8?B?WnZTQWJNaWhmZStDVk9HdFpDaE05Z1pEdjdrUlJYRjBmMEU2Y3JGV3RacWd3?=
 =?utf-8?B?eWc1bll4ZTVNY05CNGV0dnJZZDNQbE0xUFJFaUJRNUdFSkZVcGMrcUFMdmZq?=
 =?utf-8?B?MjJiZjJRUWhGQTc2SjZ4L0U4ZXlXMlphVi9obFM4QURhVitNdCs2dEJHblly?=
 =?utf-8?B?YVFSWjExR1A3OGRjYTRmSnJLUTNQT2g2N1RuRjdLYkNXWjFyRXVLWmVub21X?=
 =?utf-8?B?andLZVJMUks0NTVhVElQRVliTXpVeEh4OVBxdVQwWHR4YWpka0drb1N2S0Vs?=
 =?utf-8?B?cTVQZk9RVWxZZ1QrU2FDcG9qQ0MwMXNsTlFpbHRuaHZNVDdHb20vOCtvOUIx?=
 =?utf-8?B?dWF1T1hHVDFzMnlJbTlad2Flc3Zsb2VZMVJJdWY4eS9SRm1lN2NOTE9Vclcv?=
 =?utf-8?B?bXVQRmZocXkyS1JMWFlVV1R4SmtTRHFnb2JYV0pueGh5bXA5a0J1TnlKMjJw?=
 =?utf-8?B?NjM3cUdkakhlS0xOMzJNMmNMS2h6VnRMTzNyWDFlRzdzd3ppaFBLTm1wZ2x3?=
 =?utf-8?B?VjNGODlOYkYvWFJUQWdWVzM5c0FUczRONkE1bFNhemNETG9PaUFpSXVYdzli?=
 =?utf-8?B?THMrVTVzbWxzbHJQTmVrOTFYdjN3ckE0ZnRuNnYzT0R5SUYrTGFPUjR1bWV6?=
 =?utf-8?B?cTZNakJFNW9PR3JqS1BJSkMvc29EbUhURXRqZndvTnBCUkpsN2RXd0t2b29y?=
 =?utf-8?B?eklLc3o1K1JGdjRNS3NsWjA0UDhEQXVzZ1ZJYzE2NUtkdkc3NmFCbk9UVm9U?=
 =?utf-8?B?SXhwNVN1UmZxL295UHIxK2xGbE1TVXhOYnM1SVowdnJQNVFNWkcwU0x6QXFZ?=
 =?utf-8?B?eFJkT3RpcUNFcG5yamlLM0c4WVRXMHNwWG1oUEk3TENvWVBiOE9hSExYb0NZ?=
 =?utf-8?B?ODlvQzlrTXJSZ2F1WVdjdXpNL2U4SGcyUFEwSEhtZ2tUcDBKanBwM0tCbjBw?=
 =?utf-8?B?Sys5MjI2NCs5Zkoxc1BGYWpoais2THQwaWlUVlVYeDBEcGZVbjVldG02VUFH?=
 =?utf-8?B?c0E5MENha1AxN0R1K2k3RG9EVnVpRDhyOUhuVUVzSlk2aDRrZ256Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC9A44D31415E7448BE73C7DFFC3D31A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	twC+Gusi4O5QYLy1btCepNsvSgzTtlCCPAbDeRx7ZF7KM95sq3EBgSJIJSfanGf2cpYarZ+CDs1pnurgItCJ/9q8Emo43PdQPdbzQEQwn1ZBw2G+7A6CWAU3uBgX2y6YQSY7pnkJ3Rq33ePW7U7J4+RXnGEtOH8me6YHmfrL57hh4abr8+hDC+maKacu3zqCbAfnFUY2orG3LodjbmBlZWFQWO/MDAxaeUKi0S+b6q0mgFrbf64fhPWepTuGASDQzAtUzxecmDN04ciI8bcBsaBCJxgVNGdH+YFrc60yivfsrMCJsgiJ0B1zBxy2+AtKyTlKeS83KAy1pResmwEHcg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LRBxSfSyw5JKIgZ1Mz37GI0ORnDT9D1T4EBk/5EGQ2tI/ukdDI63ncodnTCdg39rV+IwxCKE54TMpXNqfsQoYtPrjFKDl345ZOE+h6jQ12nCMAvBzwsZFxmW62JvrTtRFpEhCy3JxhcWXhmbFVSLreeBNJLV1Fq/p3CwHHtdd//gRPfwZPiisVCPPetsy/8cPDSht81Qr3ioml7O1K1rSEz9mcr6qhBgis/qb1NAzxMRWLIBgZvNY33PDoGBHP+3TwxmgwU7c5/XczMWRtTD48Z6VPcr9I5G/pWoq13Tcmj2qnO1y+YZAmJrN857uLoIE6CFYbUYFOZrs5zt3EktrmUsSyDQHzsvhzb4m3NEufnwd2Z4kUfAEtVBbAk3xk27lBOU/XujD9QT8oU9Uqzy1YWiJMc/DN28bPQ44N6sOSc/NlgTo28+L5pnjHBmOOl8xZY5xTrD6oMyJ8ewp2cFyQNdOVNatLdQmwTfpdvRxYol4G8Fa0czwZHL1JaYr5Xj4M+JqgcjAbFvtrMa8G3U6igj4zJrvwuI2CJMzJxn5zYqhqXP6N2A9CR5SXzL4mhGyabw6d8Vmfv5Y6l0ILWMx6raw7r5JlSWrVltMvBzD9oSmDcLPiWf3Jw77AQX3uXbZFiwzEKKNbEErxtbJjyUlQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90dd270d-c1d7-47a7-b011-08de84857b4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 00:29:56.7186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4dwuoKcH4hBVszFu6t+IemtZtg9rqEfBKjCv8ic3Nv6T7V5GHWlaskLas+sT2nv33IOrU0i3osTR4zVGI8+OZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8925
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAwMiBTYWx0ZWRfX+ZxfGRKIoMYb
 yAi0zSzdkJnBP+WnW+bKvzNVQJPIvdmBoNVcyzeftMlyvS7tJu+boBPhP0J+V9CqyYNJvl3OeQ5
 wYk9X85i9+hYl0xDNE8mOgiCcpI81MCAOB9iMXDoFdqhwzIc+HFsPFB6yzg0psij495Ux5lGlof
 5aNq/rUTw/ZcviVsanNGnRBuUHaLAXd7/pd/fq5VVW7porHoYVFy3eoiTpC20jS5R4QV3hUdTnQ
 aFOdvRQwbKGDE4J3iPomRCZX3vDZMyPdvXyJid0UnM4PlX4KX0CsHy5SHSj1mrwADM4z2VlmtbW
 vZBT76xdQXAtdsuwts71g78UZEziQys4VI5srOrdlnOvlb6v+uGzCdYaxhM67zSAyCfFf+uTqVL
 1yDCfNuGzn3LtFrSJNotsX6hB+7aY6D4x8y2h3KsvMav4/lCsqZzVFC35emNqawX7SbelPoZyIZ
 6gbiFpSdfGRI50NrEcg==
X-Proofpoint-ORIG-GUID: a_QLwUDEzhmt5UR1Ae08ogLpcIHWjiTb
X-Authority-Analysis: v=2.4 cv=efUwvrEH c=1 sm=1 tr=0 ts=69b9f211 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=9AdMxfjQAAAA:20 a=lQR9YH99-W1lUZ23WugA:9 a=QEXdDO2ut3YA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: a_QLwUDEzhmt5UR1Ae08ogLpcIHWjiTb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1011 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603180002
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35003-lists,linux-usb=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,urldefense.com:url,jmu.edu.cn:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 69ADC2B4D9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBNYXIgMTYsIDIwMjYsIENodWt1biBQYW4gd3JvdGU6DQo+IFNvbWUgYm9hcmRzIHBy
b3ZpZGUgVVNCIFZCVVMgdGhyb3VnaCBhIGNvbnRyb2xsYWJsZSByZWd1bGF0b3IuIEFkZA0KDQpJ
ZiB3ZSBoYXZlIGEgc3BlY2lmaWMgdXNlciwgcGxlYXNlIGluY2x1ZGUgaXQgaW4gdGhlIGNoYW5n
ZSBsb2cuIEluIHRoaXMNCmNhc2UsIGl0IGxvb2tzIGxpa2Ugc3BhY2VtaXQgazEgYXMgbm90ZWQg
dW5kZXIgdGhlICItLS0iIGxpbmU/DQoNCj4gc3VwcG9ydCBmb3IgdGhlIG9wdGlvbmFsIHZidXMt
c3VwcGx5IHByb3BlcnR5IHNvIHRoZSByZWd1bGF0b3IgY2FuDQo+IGJlIHByb3Blcmx5IG1hbmFn
ZWQgaW5zdGVhZCBvZiBsZWZ0IGFsd2F5cy1vbi4gTm90ZSB0aGF0IHRoaXMgZG9lcw0KPiBub3Qg
YXBwbHkgdG8gVVNCIEh1YiBkb3duc3RyZWFtIHBvcnRzIHdpdGggZGlmZmVyZW50IFZCVVMgc3Vw
cGxpZXMuDQo+IA0KPiBUaGUgZW5hYmxlZCBhbmQgZGlzYWJsZWQgYWN0aW9ucyBvZiB0aGUgcmVn
dWxhdG9yIGFyZSBoYW5kbGVkDQo+IGF1dG9tYXRpY2FsbHkgYnkgZGV2bV9yZWd1bGF0b3JfZ2V0
X2VuYWJsZV9vcHRpb25hbCgpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2h1a3VuIFBhbiA8YW1h
ZGV1c0BqbXUuZWR1LmNuPg0KPiAtLS0NCj4gVGhlIHZidXMtc3VwcGx5IHByb3BlcnR5IGhhcyBi
ZWVuIGRlY2xhcmVkIGluIHNwYWNlbWl0LGsxLWR3YzMueWFtbA0KPiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVy
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc3BhY2VtaXQqMkNrMS1kd2Mz
LnlhbWwqTDcxX187SlNNISFBNEYyUjlHX3BnIWVTbTVHNWMxOXpsc0xLNURrRDZXZ1ExRWdBTC1t
bkhIZDkwa0xSRnpyZ01XdHM4ZDBkZmpLNUhnbFUtU0E0UkxwTGtnTUVjQTBaMkdnZnNSX2NCSm5u
dWIkIA0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYyB8IDUg
KysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMgYi9kcml2ZXJzL3VzYi9k
d2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gaW5kZXggZTg0Njg0NGUwMDIzLi44M2I0ZTRkNjli
YTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYw0K
PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gQEAgLTEyLDYg
KzEyLDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4
L3JlZ21hcC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L21mZC9zeXNjb24uaD4NCj4gKyNpbmNsdWRl
IDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4NCj4gICNpbmNsdWRlICJnbHVlLmgiDQo+ICAN
Cj4gICNkZWZpbmUgRUlDNzcwMF9IU1BfQlVTX0ZJTFRFUl9FTglCSVQoMCkNCj4gQEAgLTExMyw2
ICsxMTQsMTAgQEAgc3RhdGljIGludCBkd2MzX2dlbmVyaWNfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gIAlpZiAocmV0IDwgMCkNCj4gIAkJcmV0dXJuIGRldl9lcnJfcHJv
YmUoZGV2LCByZXQsICJmYWlsZWQgdG8gZ2V0IGNsb2Nrc1xuIik7DQo+ICANCj4gKwlyZXQgPSBk
ZXZtX3JlZ3VsYXRvcl9nZXRfZW5hYmxlX29wdGlvbmFsKGRldiwgInZidXMiKTsNCj4gKwlpZiAo
cmV0ICYmIHJldCAhPSAtRU5PREVWKQ0KPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJl
dCwgImZhaWxlZCB0byBlbmFibGUgVkJVU1xuIik7DQo+ICsNCg0KVGhlIG5hbWUgInZidXMiIGhl
cmUgbWF5YmUgY29uZnVzaW5nLiBUaGlzIHJlZ3VsYXRvciBwb3dlcnMgdGhlDQpjb250cm9sbGVy
IGNoaXAgYW5kIG5vdCBuZWNjZXNzYXJpbHkgdHVybmluZyBvbiBWQlVTIG9mIHRoZSBVU0IgYnVz
DQpwb3dlciBsaW5lLiBJcyB0aGVyZSBhIGNvbW1vbi9kaWZmZXJlbnQgbmFtZSBmb3IgcmVndWxh
dG9yIGlkPyBBdCBsZWFzdA0KZml4IHRoZSBlcnJvciBtZXNzYWdlLg0KDQpUaGFua3MsDQpUaGlu
aA0KDQo+ICAJZHdjM2ctPm51bV9jbG9ja3MgPSByZXQ7DQo+ICAJZHdjM2ctPmR3Yy5kZXYgPSBk
ZXY7DQo+ICAJcHJvYmVfZGF0YS5kd2MgPSAmZHdjM2ctPmR3YzsNCj4gLS0gDQo+IDIuMzQuMQ0K
PiA=

