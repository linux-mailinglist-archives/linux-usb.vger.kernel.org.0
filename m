Return-Path: <linux-usb+bounces-33226-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKy7DIGZimk8MQAAu9opvQ
	(envelope-from <linux-usb+bounces-33226-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 03:35:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CBC116598
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 03:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A53D3030777
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 02:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23FA2DFA5B;
	Tue, 10 Feb 2026 02:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ebUNboe3";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UKwUI6hD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OcmBZN9S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915F2765C4;
	Tue, 10 Feb 2026 02:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770690936; cv=fail; b=eTnu9rjXOE2HPRq3RX3b57dcYTbrWzyRZGCfO8Jc8icG0bp0jVNjcnAul5I9BTjekxsU297q26VVvUjJG8iw58vS/u3oXDMRBc53i3YcuXXGZhcajtSb4PRFe/YFTHunsA2uKSkSNobhlbuiseOlma7oXql8ttwO1vDu3kquYY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770690936; c=relaxed/simple;
	bh=VFqiB2bWSzRTxMr5nhtYqYprH65u0IwL8Lq10BwYsFo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=brL7Gxxi2tPm1g1Hd2Sr4Jqu/HNvkOQr+nwF0q9YJ0Sxf5bEdRWpnUMa2uonBJD6T4DNJWKiUYXtOBL77Y7v+h2HguBrhFh30w4UjHqZfpCoPz3L3DMQn2fLhc6nxb5p5XpsDZ0zsDoO9deDT6kJOexSgXfNXGo6NP3JbDukqe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ebUNboe3; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UKwUI6hD; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OcmBZN9S reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A1o1IJ1177874;
	Mon, 9 Feb 2026 18:34:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=VFqiB2bWSzRTxMr5nhtYqYprH65u0IwL8Lq10BwYsFo=; b=
	ebUNboe3tWIWjxZIWVStpx1Qz7p6e0DMPtwbldvrioLhgy9KZP37LU07BtIYbDq+
	2DDQObfuk/AX6QbS8qk31H1qJU1A7TA193bOkTiJiJZvDELkmBd5hH8KPnH7xldg
	WILXUgGcVJSueQ0wJAHjsXvq3nMqUrUp4JYaJIX/FJaRZNJqHnGIcObdqQ9THK+j
	9B5ijdHnPqdwZclh/rU0O+KilFSmN0LxFeQwNsnXUDyWZPBVgI2toS8IQUH48JzG
	NtL0bEnV2EXZbBF6xz2X1sScKu5b5rrXIyu6IL8AKTl2vC4zbUCuHhrdZdX7owTQ
	8mAoZASnBRmrVA+LT0oYMQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4c65h72gnu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 18:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1770690899; bh=VFqiB2bWSzRTxMr5nhtYqYprH65u0IwL8Lq10BwYsFo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=UKwUI6hDqli4ZWdg+bl9GPXRvE+w2Ie99x5ivRndzfo/a4H+QzuO38sn2P4T6odBo
	 VbzfOtq/evpI/KdPcLPTU0hcAQQwgGNjorsaRw4ZGgj3QOgj+ETf4c/hCKoUlGhA98
	 1xLRfwlcC0KYOIROGfW2dlxRRs0jtXC33dfrbb/rDgC67sYN0PlllqDjQrzZkZpJrx
	 3Zn8xRmmkKend/3e9L2IdWpKF6IgPi3KpEVqlSPwfMR+96/zpJv3ZJ1W5qOv5NYxa0
	 /J39EevRoGhCIWTzI9IH8XQhrV92oGRNeqWjR3jG29GfqiknVS/genHXMemV/dlrk7
	 /H+edKj4YAWQA==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8A497401CD;
	Tue, 10 Feb 2026 02:34:57 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1642FA0079;
	Tue, 10 Feb 2026 02:34:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OcmBZN9S;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00407.outbound.protection.outlook.com [40.93.13.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 59D9B401C3;
	Tue, 10 Feb 2026 02:34:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQQuAJUM7XMGJd9bBMk4QmLnhKMo9+ujE9veD2LQ1k5yBiZV4ng2gssNaWwXcFx4iUTEy5ckcTYYba77saPeClEKdPRr8Pd4piHGoIEkEkBc7AI55VxwuJmsoXwYqwoP2VQCNSXg1w4R67SsjHSAbE63IpPlExSKthKYGCTx4BJaYzrBPOzU5HsuUuw+Ci49Xp9V+SwnSh8rbtZBMbkUJKlXlCxeDr9ioat6BYYC5NJ3lMGZQ3Hnq6YMdjnCYLVo6biiljyXHIh+LrJQSr+ya5hduEITF+BGf+b3GWX34VYznO1nIb5jXUxqBfyEicR5hHE/84CVki8j4scxV2rdfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFqiB2bWSzRTxMr5nhtYqYprH65u0IwL8Lq10BwYsFo=;
 b=eg/owz28+ZyxmL+zwiAS4fYfcPV/FDk/d8iFLe94txeQnlWFiW9qU5hHJZt90DczsraQAtx8OHKiXluUhQNDDgt3uk80fWuRtNfFyiTWuzlOLb2pxbgi+YKvbMq64y6gtvTZGmeuk78Owv2GMNwCOPp7lWxqFjobLrMZ4enWB+ahQBkPdcWcqMNpmNfmr+aunhSk3d8WDHzdOWRYuFWJ9M8N/Wz2fL4TalzqhC16AC6Mlsj5gvfV5rA9ambV2W7vDyX70sy+H9Bq3mKgr8fMDLGyV35xKJQWTDJKQ9UKm0U5/5pT9x6glH2l2uFSQtkGTCsiMZLE3GO+iuC2Ym0kiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFqiB2bWSzRTxMr5nhtYqYprH65u0IwL8Lq10BwYsFo=;
 b=OcmBZN9S6NKORasMl+VSFxPNRjpkzo1yDoWf8qZE7o236sYTi7if1U+WSj+M0yzAJQ2kAZY0XT1sh6MK1B85Dm5rO1HCY78340mrbD8o6htTQPfMkE7oMuUD6+iMzWLHTcQWuazM0qP9blXsVy5cbuVrTmtr82bLu2aAOqoZ/gM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB7712.namprd12.prod.outlook.com (2603:10b6:208:420::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 02:34:50 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9542.009; Tue, 10 Feb 2026
 02:34:50 +0000
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
Subject: Re: [PATCH v3 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Thread-Topic: [PATCH v3 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Thread-Index: AQHcl1HXlfYcmk0gHU+3dIA31rXa+7V7PQIA
Date: Tue, 10 Feb 2026 02:34:50 +0000
Message-ID: <20260210023448.t626fz4xezpcoile@synopsys.com>
References:
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-3-ebd9b9b77049@nxp.com>
In-Reply-To:
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-3-ebd9b9b77049@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB7712:EE_
x-ms-office365-filtering-correlation-id: a2aac958-90f9-42e6-6e8e-08de684cf6d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?N3RYUWNOVE83THhteXFJN1ZZK0hNYU5DYTEvU3RPM1QvQVdVMWxnUzZvUVlZ?=
 =?utf-8?B?bTZPYk8yM3UvNURiV0RSa0xVa2xEalN6M09YSFRoUmVrSTZwUFAwS3I2SnA0?=
 =?utf-8?B?TExWWU5BNXlCaGVBd0tNQVVsVHFaS2FPYTdtb0k4RDJFUDdUSkFDSzVJSlFt?=
 =?utf-8?B?M1BtR1haMlR5L2JNd1Vrak9vOGs2dWZhMHRoVllwT09YRGhPOUs4QnFCdmRK?=
 =?utf-8?B?VmRndUZzUTdKa3VYWXhlMzlXdlNnREJZNTFUck9KNFlmRE83aUxjbDlhQWs4?=
 =?utf-8?B?SEN3YWtjY1RnR2o5Rkk3Ymp1ZzdZbDJCOEo1ME9aY2pmSGVUWklSZ0VkZkZT?=
 =?utf-8?B?RXJrS3JDNDRyMjZ0bVdqWnQwR25SZkpYMUVVWnhmc2tzZEhuclRHWXVGTHlM?=
 =?utf-8?B?QTJFWTFvTDI1bFFoY2pqcnRodCtkUUNPNkc2Um02cFVKa0Y3bG1YYXhhcTdx?=
 =?utf-8?B?d1owOUhjajQ5bWVCcUh4QXlMNHRFNzhFR3Q4YTRmbXFrL05BRlJCZGhmNWI3?=
 =?utf-8?B?WTRTeityL1VQTXR6S29jdUt1RGs2Y2NiWDFBY3FHMHNub0JtYUJhSkRjUXh1?=
 =?utf-8?B?eExaZGJma3dyN2d4ZUF0dThSUXBscFVhaFIrcmdXL0g4VW9QSWEzd3Q5TGhR?=
 =?utf-8?B?K2FNNVBiYjVnb0JmQjhUNzIxSE0xK2hRMVdNNGZtY0lDbjAxZXRLUlNJSTUy?=
 =?utf-8?B?dHZacXFvam9hbHlGWEtoZzhMdGxiVzhMbVdXRU5ldmtOaWQycWVzd3hkZkFt?=
 =?utf-8?B?a2dsSysrOTNDZlQ1U1ZySGt4cUtxK0k3WDNJakhsV2ViNitTZG4rVjArcGQw?=
 =?utf-8?B?TExVYWtWWGhyYkZ2SnNrME16VXpYZEJFTnV6UWx1WStKQWdiWlNQZWdTNkxE?=
 =?utf-8?B?RFJUNnpDMDdyQk1jdWxPdWM4aDZlbE1mYkRJaUpkenJBcVVGS3laQWRPYXNw?=
 =?utf-8?B?MDB2VVVkSDE0aUhtWGg4RFF6OEpxam93UWR3WVduMkpQVnVZdERUOXl3VWNq?=
 =?utf-8?B?NGlmSEwzT01iTnhFUG41QUJqcE1OeGp5VnhHZk0zMXdscHNQSGVwM2JwK05z?=
 =?utf-8?B?TVdjZnN1c3YwQ0psODgyOVBWQ1FFV1NuRHJ0YWdZVTM2TldMRXJ2RnpPOVVD?=
 =?utf-8?B?ZDRKQ1QzcFRUM0NqQ09NcFRVZlYxVTg4VGRwQmdtMXdpRDV3K08zdVQvNnJQ?=
 =?utf-8?B?UHJ6VDFpaUJFNXhDb2ovN3BUenMrN1liQ0pveitSd0JSVlRPSTR4aG9hcERF?=
 =?utf-8?B?TXdOTnEzdVVLYWJhK2tyclFDa1BIaE1qaG5TWWNOM21NNEk4ckFIdXFmRGt1?=
 =?utf-8?B?R1ZsZkJWNFYrVWRtTlo4NzF5aTdleFJxWkFUamJ0aGFJbHNZSXBPd2xuZVJu?=
 =?utf-8?B?c3ZhZGtDOXprMk5NZFMwOHA5NlRkLzBpeSswNkJ5WExkTTlYLyt4ajVma2Nn?=
 =?utf-8?B?Y3Q0TTAyUU5xRUtjR29VMEh5UjRhYUlGNlg0bzZLcVlwK1QzVW83VTJxNTEz?=
 =?utf-8?B?QVlNQ21CR1FoTHl1VDhuOUVvaHh1dkluNWhpNDh0WTNLSlJZaml5OUdHbnJW?=
 =?utf-8?B?SHV3Tkg4blNOQkc4M1RWWjBnbVE3ZzkzRGdVZWl6SEFTUFRoMFJaSG5wZDhR?=
 =?utf-8?B?TlRyYnB6S1JqZFRQQ0xMT1MvUE5qNmJ0NkU3TXNWdEpjbnBkWVJtQmhJblFX?=
 =?utf-8?B?dWZFR0FYeHNGdTJGc25pSjdUd2pQYTBmbW1RZWwxWlpmZmhKVEp1eU10TGtp?=
 =?utf-8?B?cGNranhERXJLWGtkd3F3Mjl1QjNYSVRMdXdoQWFSdnhvcjVUQnhBdkY3bFlZ?=
 =?utf-8?B?VFR6YXNRQmFsaHViZzlMZ1FNaXhJTCsyd0taKzdvZUR1RFFPY3VKdm9vUHpZ?=
 =?utf-8?B?S3NINmhYbGtOcmhpd3hsNjhVSkw2LzRvQTlQS25WbDk4U2s1MTUwOTM5MFBz?=
 =?utf-8?B?SGI0a3U3U0dTMUJRc2pSRnhvcVF5TkVUSUViQ2JzZGtONEI2UEN5V25jSWxq?=
 =?utf-8?B?djdpRTFhZHhkK0xQZTV6V3VzTmEwem5VZE9IUnVCa3IwZVlJdVRIeUJlVVdo?=
 =?utf-8?B?SHIxdVpjMmduYjdSYUxkOUtmSHdMWUpDOTcxeFVIUldyRFo2TVVyWk4xQWxI?=
 =?utf-8?B?MDhndURRdnBHS05qSmR5bTVMYlkxZ0NOeFNFcmxzcTBiajg5RWNCcVk0MC9S?=
 =?utf-8?Q?gbgttkv2rESlHqiRgiOtJBA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NlhyUU4yMnE5OU1YV2lFN2xRWmduaUcxQXFSQ2k2SlhyZDRXcDlnUnNGK2p0?=
 =?utf-8?B?KzNwUlhsMngvNVdUQXU0M29qaEdMYmxIU0c0WllGc2djU2x5YUlUeTlMUGxu?=
 =?utf-8?B?SGRrVjR4SElZNFhLN0Fwa052NVNFcDgzdmVhaC9nMC9PRklCY094dXlFK0FE?=
 =?utf-8?B?Yy9KaHRlL0tjQkd3ak5aVGhIYnUzQ3NucTBhb2E2S2cxc0JoZHp1cFhEQVF1?=
 =?utf-8?B?UmNxUDJ5WW9oT3dMckFqeWtKNWovZ1p5R1RSL05CTWcyWkVzRkgxMXA4UVZt?=
 =?utf-8?B?K3RFZXlEd2xjMC9tWjVIUCtJK0p1QXRBUm9mcDhta2pIMU52V3pBdWtLTGFL?=
 =?utf-8?B?V2pEQVk4djNTVzhqd3Y3di84Q01Ob3hIY1JmK3BHTXN6RFpYdE5teTRnYU1z?=
 =?utf-8?B?eE9ZMUFFaWFnVzNTTmlHL1V6ZFZpRnhUeUlKSjA0YUhIT2lKK2RNbVc1RjVJ?=
 =?utf-8?B?dzFRT09oRGFQM1dzVnA3enRPUkVxczA4Q0xMakZ6Y2pZalRlVEp5cVI4cTBo?=
 =?utf-8?B?aXpKeXgxUWl3Q3dQUCtRYUhyNm92bExQYTlWY1I1enZrZzhOQWd6dUs3aGtP?=
 =?utf-8?B?cGUwalp4cDg0QkdYbHJ3eGhYQ3RuRnVsYXVydWJLTDZsdDdaM1pQYnlPOURl?=
 =?utf-8?B?UmJLZk5HaFZTM2JKSFdXa0JTeHpERjNpZ05nQzRJcEtCWExPTVNaVXROaFFI?=
 =?utf-8?B?UjV0bE9GMlZMUnBpUUNmQ3hhRW1PV0Q3THVtY01Qa0pVZDVKWDdiaG9LdmFh?=
 =?utf-8?B?bHRVM3pQVEkrUkVOWDJEdHNFUVA1MHphTnFodEtOTDZ3aVhkV1U0TDcxcnF4?=
 =?utf-8?B?VlFTLzdXUDdFZE15c3d2UXBmTnNTTy8zMlFDRWZMRGFIQVVaZmlUM0tWOU9o?=
 =?utf-8?B?blVYUTZBL3RnaEpDOTdLOEZVT3dpbllrZ1BCbldBb1VqSkFNMmdmRUtuWHdL?=
 =?utf-8?B?M1RrN1V0OUpVY1VmSWFJZkVBeXlvR0J5ZCtzWi9iWkg0Wk5wODdmY3RBdjQw?=
 =?utf-8?B?UWcvMG5CN205M25jRGRnSDNFSlVJMGgwdHlYT2NWcm01Nis3WDRacW5wYk9N?=
 =?utf-8?B?WWRuUm1qSS95cEp5UmlQdTllYml4bWlQbkZSd3RhVm40VG50MzFIMWxHdC9q?=
 =?utf-8?B?a2xvd0R2YVAvUXM0YUwvQTlZMFBTblJEc1RjM2hmMW9ZbXMzc0hLRlpZN0o1?=
 =?utf-8?B?RXMzOGtTSFNYV2FXUllIeHUxa1FoM0VvWWZLdWttaGRhcUtCajRRUjAzcUo1?=
 =?utf-8?B?WWtmVmNPR2U3SUZRcUtBNkZ2NlBUMXd6MEJUOUVabnF5RmJqQjFCU2x2WldU?=
 =?utf-8?B?eVlWb2pobzR4d0FwbHhDZytjSG4xZllGeTVmMWhOYWxzZTViRUYrNmd2RXp0?=
 =?utf-8?B?blBNY3JZT3FQdTVQamozM0tNdDNKZHRkeUlBSGhodS9sSDhLcC9HYVhkaFlM?=
 =?utf-8?B?WDkwZ05QTElBemcvRmVFTEN0QXRoZ0UwVVluT0ozY1crMnBNVkkyVE9ZZTcv?=
 =?utf-8?B?ZmJYYXFqUXJzcURGZDh6OWtSNGV0OEtoYlhpNHdDbXMyOHByNG1zaVFFS2hF?=
 =?utf-8?B?Q2lEaWk4KytKR2M0blc3YmUzVzJpb3Q3V3lWeUh3Q2RrbUxiTkZmeUllcEwy?=
 =?utf-8?B?ZXZNSzVOS0EvRHkvQlNNS1VFSklkUDRUWlE0OUI5SlVMTCt3OU9zNU5IeWJR?=
 =?utf-8?B?Q1IrVlFnT2grd0lBUVRxanNScWV6VU0wRFFzc0tRK3hzWHhrNXdYRFpSWUpJ?=
 =?utf-8?B?TEpKdmZYMERxeWJoYlJvdS9VdVFQRitrQ2ZFaDJtdEE5SW5udTB6c2pZNnFG?=
 =?utf-8?B?bTg1Rmp2SXQvdjBoVnlZeU0vVnR0R2NoaytXc0tRT3FpUnZ2N1diS2VrWXY2?=
 =?utf-8?B?c0lyYzNjd2lIT3UwRTlHWW12Y3FHRHJhcU1ja28yYUJSNWJQU3VaTFZVazl2?=
 =?utf-8?B?UzYzcDJQYko1QTZXb1RWMTV2ajlqUW1nVm53S1hjbm8zc0lIM0lsVzREeUR6?=
 =?utf-8?B?N2ZDaDJEbEh2SjduTCtxbHhkNGhEczlmL05Qa21EUklXajAzN0puVENNWlp2?=
 =?utf-8?B?MlE3NS9FSDdIc1RkcGI1M04vYjd1MmVFVWVtRjQ3cWJYTnJ4SVhmOU54OFRC?=
 =?utf-8?B?TzZOUVBPMk5RYzZLOFZQajl6SVNiV052b3FRc0FrTitSNDZmSzBpU3hLN0Q4?=
 =?utf-8?B?blN3aCtndUhKVk5EcnhSOWMzZHJWOWdTd1o4TFZFVVhXeGl3bUVNWlR2M2Nr?=
 =?utf-8?B?MFpzQ0FUS2ovZ3psYS9lOEkyKzFCdU1mZk02YXFlNXBmczZrS0E2TDFCM013?=
 =?utf-8?B?MUlGakNHbGJ3eTh1WDZKK1BqbDUvUDJUZjhLeVZaR0Jxd3ZDNzh2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED59F8D3BCE15A4F8C90BDF739572B72@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7qq66YV2QVCUZvGY8mBLx0ZuhcU4AOoAZj0R2NOTYsDTpuff7btVDvJ9WtDdz0pYUtH+PXbX5qsVT77fwGhJvh5hMjeshfpDUgJE100F5FQ/TNPPe7wVbM56vjQ4rgvDbSL9gKY1BtSoUJ4MQFg5wn78Gl3ZggmRGcDqPtFslnE7ILhS3Tk+Y6+2U3wOKvo8OyjFThn3mrig4680OSfz5TOWnbrzKy61vAXY1C8We4UaoP2NcsR7Ryet9W9hXoxTRMA9Kpljx1PmHjBY+RqrSSimVHlE0F/zl8LSusJz6ChGFm/XG+5cy4bo1rhxZjUX5gXI7A3PV4xQhimDvSP4jW+azsQ/auidAkRk7HBzBpwaOeE9ZQk265jSzRBaqmbyoqSXio4b0+Ib3JwNBZUXoIyeFSMh8KbmqFxv2cYlg5i43uZb+a3mB5enCkkjWq0jqX5Cc51Kj7uoZD/AyRWCqHOgnnsotZzI4dipYSqnFuKXIe6+N+7nveEgFKXCjoxohjnfE1eTPkPpEqIxKe/CKvx1SgcyTcxpTSOlk1wrc41YGAuJHQv1EO0U4fCyUuCfeDlrYd5igI46N26hN1bbgT6XU1+5fKKLHnN4gtgY/sHc3FybSshhhcOK+D5ThFCkxP9AsrSTYAQ1lPv9qIzVHQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2aac958-90f9-42e6-6e8e-08de684cf6d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 02:34:50.0751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rgBwFZUt4Q/Uui/MzyWBnTt2i+zzu//vxIWfPAZDvXQkcPaoZvajhFzI8cPW8zXAhnC8V3nsR3XIheNwgaPoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7712
X-Proofpoint-GUID: psqotOr4NaW1Kh4KieZjAm8wszUBN8zX
X-Authority-Analysis: v=2.4 cv=JPU2csKb c=1 sm=1 tr=0 ts=698a9953 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=8AirrxEcAAAA:8 a=0zzpV54KjyTzDZOtiWwA:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: psqotOr4NaW1Kh4KieZjAm8wszUBN8zX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAyMCBTYWx0ZWRfX2u4zUIRFyTzI
 1C6ZomZ/ipBdI7naXzV07aT44wXgx/6G/rIJg7nj5pbwVWZGNrzQeKovI3LbY7NBn7Vfyxikarq
 7jWx7E+O5FqcWq5sPYJc2UF3DUgKbkJPJh8eTCbHi3WYOerU8AmzA+wrljwQsEdUloLqPCVyS64
 yN5GJ4Z2+MyyX5iM+xp9S4llZIizQSGFtL8WnuUMg1I5qTwa5QHFcDvfZcrYnUgst7aQFhfZMWE
 chi1i5i2bcu26mwLK89xoqGJGjFqNxUD2lcSNAq3f+GPC0TxB1qHXP8sta3Iz+sYWepOQUKbACy
 nJBIxbVgODmuZ72Za6QPaVKKm0+y0ytZsKxc6i8szMYzQZncFNIAg8qPaQXDQaeJ9C+yZmZO6d1
 ZJXrcjGiqGYWErpXWM7pZE0IXLJyvHWTW/0hPx3FmNkfq7xYE6Hk6X5t5ERfz1QrHsShxg7igw3
 j5RZ6m59fYCQuIdA6Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602100020
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33226-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,i.mx:url,nxp.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E4CBC116598
X-Rspamd-Action: no action

T24gRnJpLCBGZWIgMDYsIDIwMjYsIFh1IFlhbmcgd3JvdGU6DQo+IFRoZSBpLk1YIFVTQiBnbHVl
IGFuZCBEV0MzIGNvcmUgYXJlIGNsb3NlbHkgY291cGxlZC4gRGVzY3JpYmUgdGhlIGkuTVgNCj4g
VVNCIGJsb2NrIGluIGEgc2luZ2xlIGJsb2NrIHdpbGwgYnJpbmcgbW9yZSBiZW5lZml0cyB0aGFu
IGEgcGFyZW50LQ0KPiBjaGlsZCByZWxhdGlvbi4gVG8gc3VwcG9ydCB0aGUgZmxhdHRlbiBtb2Rl
bCBkZXZpY2V0cmVlLCBEV0MzIFVTQiBjb3JlDQo+IGRyaXZlciBhbHJlYWR5IHN1cHBvcnQgdG8g
ZGlyZWN0bHkgcmVnaXN0ZXIgYW5kIGluaXRpYWxpemUgdGhlIGNvcmUgaW4NCj4gZ2x1ZSBsYXll
ciB1c2luZyBvbmUgZGV2aWNlLiBBbmQgbWFueSBub3RpZmljYXRpb24gY2FuIGJlIHJlY2VpdmVk
IGluDQo+IGdsdWUgbGF5ZXIgdGltZWx5IGFuZCBwcm9wZXIgYWN0aW9ucyBjYW4gYmUgZXhlY3V0
ZWQgYWNjb3JkaW5nbHkuDQo+IA0KPiBUbyBhbGlnbiB3aXRoIG1haW5zdHJlYW0sIGludHJvZHVj
ZSBhIG5ldyBkcml2ZXIgdG8gc3VwcG9ydCBmbGF0dGVuIGR3YzMNCj4gZGV2aWNldHJlZSBtb2Rl
bCBmb3IgaS5NWCBTb2MuIEJlc2lkZXMgdGhpcyBkcml2ZXIgZGlzYWJsaW5nIHdha2V1cCBpcnEN
Cj4gd2hlbiBzeXN0ZW0gaXMgYWN0aXZlLCBubyBvdGhlciBmdW5jdGlvbiBjaGFuZ2UgaW4gdGhp
cyB2ZXJzaW9uIGNvbXBhcmVkDQo+IHRvIGR3YzMtaW14OG1wLmMNCg0KR29pbmcgZm9yd2FyZCwg
d2hhdCB3aWxsIGhhcHBlbiB0byB0aGUgbGVnYWN5IGRyaXZlcj8gQ2FuIHdlIG9ubHkgZXhwZWN0
DQptYWludGVuYW5jZSBmaXhlcyByYXRoZXIgdGhhbiBuZXcgZmVhdHVyZSBkZXZlbG9wbWVudD8g
U2hvdWxkIHdlDQpkb2N1bWVudCB0aGlzIHRyYW5zaXRpb24gcG9saWN5IGluIHRoZSBjb21taXQg
bWVzc2FnZT8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5j
b20+DQo+IA0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MzoNCj4gIC0gdXBkYXRlIGNvbXBhdGlibGUg
YXMgbnhwLGlteDhtcC1kd2MzDQo+IENoYW5nZXMgaW4gdjI6DQo+ICAtIGltcHJvdmUgY29tbWl0
IG1lc3NhZ2UNCj4gIC0gZml4IGNvZGUgc3R5bGUNCj4gIC0gYWRkIElSUUZfTk9fQVVUT0VODQo+
ICAtIHJlbW92ZSBwbV9ydW50aW1lXyogaW4gZHdjM19pbXhfcmVtb3ZlKCksIGR3YzNfY29yZV9y
ZW1vdmUoKQ0KPiAgICB3aWxsIGRvIHRoYXQNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL0tj
b25maWcgICAgfCAgMTIgKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvTWFrZWZpbGUgICB8ICAgMSAr
DQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14LmMgfCA0MjkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDQyIGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL0tjb25maWcgYi9k
cml2ZXJzL3VzYi9kd2MzL0tjb25maWcNCj4gaW5kZXggMjQwYjE1YmM1MmNiLi4xODE2OTcyN2E0
MTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvS2NvbmZpZw0KPiArKysgYi9kcml2
ZXJzL3VzYi9kd2MzL0tjb25maWcNCj4gQEAgLTE1MCw2ICsxNTAsMTggQEAgY29uZmlnIFVTQl9E
V0MzX0lNWDhNUA0KPiAgCSAgZnVuY3Rpb25hbGl0eS4NCj4gIAkgIFNheSAnWScgb3IgJ00nIGlm
IHlvdSBoYXZlIG9uZSBzdWNoIGRldmljZS4NCj4gIA0KPiArY29uZmlnIFVTQl9EV0MzX0lNWA0K
PiArCXRyaXN0YXRlICJOWFAgaU1YIFBsYXRmb3JtIg0KPiArCWRlcGVuZHMgb24gT0YgJiYgQ09N
TU9OX0NMSw0KPiArCWRlcGVuZHMgb24gKEFSQ0hfTVhDICYmIEFSTTY0KSB8fCBDT01QSUxFX1RF
U1QNCj4gKwlkZWZhdWx0IFVTQl9EV0MzDQo+ICsJaGVscA0KPiArCSAgTlhQIGlNWCBTb0MgdXNl
IERlc2lnbldhcmUgQ29yZSBJUCBmb3IgVVNCMi8zDQo+ICsJICBmdW5jdGlvbmFsaXR5Lg0KPiAr
CSAgVGhpcyBkcml2ZXIgYWxzbyBoYW5kbGVzIHRoZSB3YWtldXAgZmVhdHVyZSBvdXRzaWRlDQo+
ICsJICBvZiBEZXNpZ25XYXJlIENvcmUuDQo+ICsJICBTYXkgJ1knIG9yICdNJyBpZiB5b3UgaGF2
ZSBvbmUgc3VjaCBkZXZpY2UuDQo+ICsNCj4gIGNvbmZpZyBVU0JfRFdDM19YSUxJTlgNCj4gIAl0
cmlzdGF0ZSAiWGlsaW54IFBsYXRmb3JtcyINCj4gIAlkZXBlbmRzIG9uIChBUkNIX1pZTlFNUCB8
fCBDT01QSUxFX1RFU1QpICYmIE9GDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL01h
a2VmaWxlIGIvZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZQ0KPiBpbmRleCAwNzNiZWY1MzA5YjUu
LmYzNzk3MTE5NzIwMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZQ0K
PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxlDQo+IEBAIC01NSw2ICs1NSw3IEBAIG9i
ai0kKENPTkZJR19VU0JfRFdDM19TVCkJCSs9IGR3YzMtc3Qubw0KPiAgb2JqLSQoQ09ORklHX1VT
Ql9EV0MzX1FDT00pCQkrPSBkd2MzLXFjb20ubw0KPiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX1FD
T00pCQkrPSBkd2MzLXFjb20tbGVnYWN5Lm8NCj4gIG9iai0kKENPTkZJR19VU0JfRFdDM19JTVg4
TVApCQkrPSBkd2MzLWlteDhtcC5vDQo+ICtvYmotJChDT05GSUdfVVNCX0RXQzNfSU1YKQkJKz0g
ZHdjMy1pbXgubw0KPiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX1hJTElOWCkJCSs9IGR3YzMteGls
aW54Lm8NCj4gIG9iai0kKENPTkZJR19VU0JfRFdDM19PQ1RFT04pCQkrPSBkd2MzLW9jdGVvbi5v
DQo+ICBvYmotJChDT05GSUdfVVNCX0RXQzNfUlRLKQkJKz0gZHdjMy1ydGsubw0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2Mz
LWlteC5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uM2Ix
NTRkMDc1YmNmDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2Mz
LWlteC5jDQo+IEBAIC0wLDAgKzEsNDI5IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPiArLyoNCj4gKyAqIGR3YzMtaW14LmMgLSBOWFAgaS5NWCBTb2MgVVNCMyBT
cGVjaWZpYyBHbHVlIGxheWVyDQo+ICsgKg0KPiArICogQ29weXJpZ2h0IDIwMjYgTlhQDQo+ICsg
Ki8NCj4gKw0KPiArI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2lu
dGVycnVwdC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ICsjaW5jbHVkZSA8bGludXgv
a2VybmVsLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICsjaW5jbHVkZSA8bGlu
dXgvb2ZfcGxhdGZvcm0uaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4N
Cj4gKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ICsNCj4gKyNpbmNsdWRlICJjb3Jl
LmgiDQo+ICsjaW5jbHVkZSAiZ2x1ZS5oIg0KPiArDQo+ICsvKiBVU0Igd2FrZXVwIHJlZ2lzdGVy
cyAqLw0KPiArI2RlZmluZSBVU0JfV0FLRVVQX0NUUkwJCQkweDAwDQo+ICsNCj4gKy8qIEdsb2Jh
bCB3YWtldXAgaW50ZXJydXB0IGVuYWJsZSwgYWxzbyB1c2VkIHRvIGNsZWFyIGludGVycnVwdCAq
Lw0KPiArI2RlZmluZSBVU0JfV0FLRVVQX0VOCQkJQklUKDMxKQ0KPiArLyogV2FrZXVwIGZyb20g
Y29ubmVjdCBvciBkaXNjb25uZWN0LCBvbmx5IGZvciBzdXBlcnNwZWVkICovDQo+ICsjZGVmaW5l
IFVTQl9XQUtFVVBfU1NfQ09OTgkJQklUKDUpDQo+ICsvKiAwIHNlbGVjdCB2YnVzX3ZhbGlkLCAx
IHNlbGVjdCBzZXNzdmxkICovDQo+ICsjZGVmaW5lIFVTQl9XQUtFVVBfVkJVU19TUkNfU0VTU19W
QUwJQklUKDQpDQo+ICsvKiBFbmFibGUgc2lnbmFsIGZvciB3YWtlIHVwIGZyb20gdTMgc3RhdGUg
Ki8NCj4gKyNkZWZpbmUgVVNCX1dBS0VVUF9VM19FTgkJQklUKDMpDQo+ICsvKiBFbmFibGUgc2ln
bmFsIGZvciB3YWtlIHVwIGZyb20gaWQgY2hhbmdlICovDQo+ICsjZGVmaW5lIFVTQl9XQUtFVVBf
SURfRU4JCUJJVCgyKQ0KPiArLyogRW5hYmxlIHNpZ25hbCBmb3Igd2FrZSB1cCBmcm9tIHZidXMg
Y2hhbmdlICovDQo+ICsjZGVmaW5lCVVTQl9XQUtFVVBfVkJVU19FTgkJQklUKDEpDQo+ICsvKiBF
bmFibGUgc2lnbmFsIGZvciB3YWtlIHVwIGZyb20gZHAvZG0gY2hhbmdlICovDQo+ICsjZGVmaW5l
IFVTQl9XQUtFVVBfRFBETV9FTgkJQklUKDApDQo+ICsNCj4gKyNkZWZpbmUgVVNCX1dBS0VVUF9F
Tl9NQVNLCQlHRU5NQVNLKDUsIDApDQo+ICsNCj4gKy8qIFVTQiBnbHVlIHJlZ2lzdGVycyAqLw0K
PiArI2RlZmluZSBVU0JfQ1RSTDAJCTB4MDANCj4gKyNkZWZpbmUgVVNCX0NUUkwxCQkweDA0DQo+
ICsNCj4gKyNkZWZpbmUgVVNCX0NUUkwwX1BPUlRQV1JfRU4JQklUKDEyKSAvKiAxIC0gUFBDIGVu
YWJsZWQgKGRlZmF1bHQpICovDQo+ICsjZGVmaW5lIFVTQl9DVFJMMF9VU0IzX0ZJWEVECUJJVCgy
MikgLyogMSAtIFVTQjMgcGVybWFuZW50IGF0dGFjaGVkICovDQo+ICsjZGVmaW5lIFVTQl9DVFJM
MF9VU0IyX0ZJWEVECUJJVCgyMykgLyogMSAtIFVTQjIgcGVybWFuZW50IGF0dGFjaGVkICovDQo+
ICsNCj4gKyNkZWZpbmUgVVNCX0NUUkwxX09DX1BPTEFSSVRZCUJJVCgxNikgLyogMCAtIEhJR0gg
LyAxIC0gTE9XICovDQo+ICsjZGVmaW5lIFVTQl9DVFJMMV9QV1JfUE9MQVJJVFkJQklUKDE3KSAv
KiAwIC0gSElHSCAvIDEgLSBMT1cgKi8NCj4gKw0KPiArc3RydWN0IGR3YzNfaW14IHsNCj4gKwlz
dHJ1Y3QgZHdjMwlkd2M7DQo+ICsJc3RydWN0IGRldmljZQkqZGV2Ow0KPiArCXZvaWQgX19pb21l
bQkqYmxrY3RsX2Jhc2U7DQo+ICsJdm9pZCBfX2lvbWVtCSpnbHVlX2Jhc2U7DQo+ICsJc3RydWN0
IGNsawkqaHNpb19jbGs7DQo+ICsJc3RydWN0IGNsawkqc3VzcGVuZF9jbGs7DQo+ICsJaW50CQlp
cnE7DQo+ICsJYm9vbAkJcG1fc3VzcGVuZGVkOw0KPiArCWJvb2wJCXdha2V1cF9wZW5kaW5nOw0K
PiArfTsNCj4gKw0KPiArI2RlZmluZSB0b19kd2MzX2lteChkKSBjb250YWluZXJfb2YoKGQpLCBz
dHJ1Y3QgZHdjM19pbXgsIGR3YykNCj4gKw0KPiArc3RhdGljIHZvaWQgZHdjM19pbXhfY29uZmln
dXJlX2dsdWUoc3RydWN0IGR3YzNfaW14ICpkd2NfaW14KQ0KPiArew0KPiArCXN0cnVjdCBkZXZp
Y2UJKmRldiA9IGR3Y19pbXgtPmRldjsNCj4gKwl1MzIJCXZhbHVlOw0KPiArDQo+ICsJaWYgKCFk
d2NfaW14LT5nbHVlX2Jhc2UpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCXZhbHVlID0gcmVhZGwo
ZHdjX2lteC0+Z2x1ZV9iYXNlICsgVVNCX0NUUkwwKTsNCj4gKw0KPiArCWlmIChkZXZpY2VfcHJv
cGVydHlfcmVhZF9ib29sKGRldiwgImZzbCxwZXJtYW5lbnRseS1hdHRhY2hlZCIpKQ0KPiArCQl2
YWx1ZSB8PSBVU0JfQ1RSTDBfVVNCMl9GSVhFRCB8IFVTQl9DVFJMMF9VU0IzX0ZJWEVEOw0KPiAr
CWVsc2UNCj4gKwkJdmFsdWUgJj0gfihVU0JfQ1RSTDBfVVNCMl9GSVhFRCB8IFVTQl9DVFJMMF9V
U0IzX0ZJWEVEKTsNCj4gKw0KPiArCWlmIChkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwg
ImZzbCxkaXNhYmxlLXBvcnQtcG93ZXItY29udHJvbCIpKQ0KPiArCQl2YWx1ZSAmPSB+VVNCX0NU
UkwwX1BPUlRQV1JfRU47DQo+ICsJZWxzZQ0KPiArCQl2YWx1ZSB8PSBVU0JfQ1RSTDBfUE9SVFBX
Ul9FTjsNCj4gKw0KPiArCXdyaXRlbCh2YWx1ZSwgZHdjX2lteC0+Z2x1ZV9iYXNlICsgVVNCX0NU
UkwwKTsNCj4gKw0KPiArCXZhbHVlID0gcmVhZGwoZHdjX2lteC0+Z2x1ZV9iYXNlICsgVVNCX0NU
UkwxKTsNCj4gKwlpZiAoZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJmc2wsb3Zlci1j
dXJyZW50LWFjdGl2ZS1sb3ciKSkNCj4gKwkJdmFsdWUgfD0gVVNCX0NUUkwxX09DX1BPTEFSSVRZ
Ow0KPiArCWVsc2UNCj4gKwkJdmFsdWUgJj0gflVTQl9DVFJMMV9PQ19QT0xBUklUWTsNCj4gKw0K
PiArCWlmIChkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwgImZzbCxwb3dlci1hY3RpdmUt
bG93IikpDQo+ICsJCXZhbHVlIHw9IFVTQl9DVFJMMV9QV1JfUE9MQVJJVFk7DQo+ICsJZWxzZQ0K
PiArCQl2YWx1ZSAmPSB+VVNCX0NUUkwxX1BXUl9QT0xBUklUWTsNCj4gKw0KPiArCXdyaXRlbCh2
YWx1ZSwgZHdjX2lteC0+Z2x1ZV9iYXNlICsgVVNCX0NUUkwxKTsNCj4gK30NCj4gKw0KPiArc3Rh
dGljIHZvaWQgZHdjM19pbXhfd2FrZXVwX2VuYWJsZShzdHJ1Y3QgZHdjM19pbXggKmR3Y19pbXgs
IHBtX21lc3NhZ2VfdCBtc2cpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzMJKmR3YyA9ICZkd2NfaW14
LT5kd2M7DQo+ICsJdTMyCQl2YWw7DQo+ICsNCj4gKwl2YWwgPSByZWFkbChkd2NfaW14LT5ibGtj
dGxfYmFzZSArIFVTQl9XQUtFVVBfQ1RSTCk7DQo+ICsNCj4gKwlpZiAoZHdjLT5jdXJyZW50X2Ry
X3JvbGUgPT0gRFdDM19HQ1RMX1BSVENBUF9IT1NUICYmIGR3Yy0+eGhjaSkgew0KPiArCQl2YWwg
fD0gVVNCX1dBS0VVUF9FTiB8IFVTQl9XQUtFVVBfRFBETV9FTjsNCj4gKwkJaWYgKFBNU0dfSVNf
QVVUTyhtc2cpKQ0KPiArCQkJdmFsIHw9IFVTQl9XQUtFVVBfU1NfQ09OTiB8IFVTQl9XQUtFVVBf
VTNfRU47DQo+ICsJfSBlbHNlIHsNCj4gKwkJdmFsIHw9IFVTQl9XQUtFVVBfRU4gfCBVU0JfV0FL
RVVQX1ZCVVNfRU4gfA0KPiArCQkgICAgICAgVVNCX1dBS0VVUF9WQlVTX1NSQ19TRVNTX1ZBTDsN
Cj4gKwl9DQo+ICsNCj4gKwl3cml0ZWwodmFsLCBkd2NfaW14LT5ibGtjdGxfYmFzZSArIFVTQl9X
QUtFVVBfQ1RSTCk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGR3YzNfaW14X3dha2V1cF9k
aXNhYmxlKHN0cnVjdCBkd2MzX2lteCAqZHdjX2lteCkNCj4gK3sNCj4gKwl1MzIJdmFsOw0KPiAr
DQo+ICsJdmFsID0gcmVhZGwoZHdjX2lteC0+YmxrY3RsX2Jhc2UgKyBVU0JfV0FLRVVQX0NUUkwp
Ow0KPiArCXZhbCAmPSB+KFVTQl9XQUtFVVBfRU4gfCBVU0JfV0FLRVVQX0VOX01BU0spOw0KPiAr
CXdyaXRlbCh2YWwsIGR3Y19pbXgtPmJsa2N0bF9iYXNlICsgVVNCX1dBS0VVUF9DVFJMKTsNCj4g
K30NCj4gKw0KPiArc3RhdGljIGlycXJldHVybl90IGR3YzNfaW14X2ludGVycnVwdChpbnQgaXJx
LCB2b2lkICpkYXRhKQ0KPiArew0KPiArCXN0cnVjdCBkd2MzX2lteAkqZHdjX2lteCA9IGRhdGE7
DQo+ICsJc3RydWN0IGR3YzMJKmR3YyA9ICZkd2NfaW14LT5kd2M7DQo+ICsNCj4gKwlpZiAoIWR3
Y19pbXgtPnBtX3N1c3BlbmRlZCkNCj4gKwkJcmV0dXJuIElSUV9IQU5ETEVEOw0KPiArDQo+ICsJ
ZGlzYWJsZV9pcnFfbm9zeW5jKGR3Y19pbXgtPmlycSk7DQo+ICsJZHdjX2lteC0+d2FrZXVwX3Bl
bmRpbmcgPSB0cnVlOw0KPiArDQo+ICsJaWYgKGR3Yy0+Y3VycmVudF9kcl9yb2xlID09IERXQzNf
R0NUTF9QUlRDQVBfSE9TVCAmJiBkd2MtPnhoY2kpDQo+ICsJCXBtX3J1bnRpbWVfcmVzdW1lKCZk
d2MtPnhoY2ktPmRldik7DQo+ICsJZWxzZSBpZiAoZHdjLT5jdXJyZW50X2RyX3JvbGUgPT0gRFdD
M19HQ1RMX1BSVENBUF9ERVZJQ0UpDQo+ICsJCXBtX3J1bnRpbWVfZ2V0KGR3Yy0+ZGV2KTsNCj4g
Kw0KPiArCXJldHVybiBJUlFfSEFORExFRDsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgZHdj
M19pbXhfcHJlX3NldF9yb2xlKHN0cnVjdCBkd2MzICpkd2MsIGVudW0gdXNiX3JvbGUgcm9sZSkN
Cj4gK3sNCj4gKwlpZiAocm9sZSA9PSBVU0JfUk9MRV9IT1NUKQ0KPiArCQkvKg0KPiArCQkgKiBG
b3IgeGhjaSBob3N0LCB3ZSBuZWVkIGRpc2FibGUgZHdjIGNvcmUgYXV0bw0KPiArCQkgKiBzdXNw
ZW5kLCBiZWNhdXNlIGR1cmluZyB0aGlzIGF1dG8gc3VzcGVuZCBkZWxheSg1cyksDQo+ICsJCSAq
IHhoY2kgaG9zdCBSVU5fU1RPUCBpcyBjbGVhcmVkIGFuZCB3YWtldXAgaXMgbm90DQo+ICsJCSAq
IGVuYWJsZWQsIGlmIGRldmljZSBpcyBpbnNlcnRlZCwgeGhjaSBob3N0IGNhbid0DQo+ICsJCSAq
IHJlc3BvbnNlIHRoZSBjb25uZWN0aW9uLg0KPiArCQkgKi8NCj4gKwkJcG1fcnVudGltZV9kb250
X3VzZV9hdXRvc3VzcGVuZChkd2MtPmRldik7DQo+ICsJZWxzZQ0KPiArCQlwbV9ydW50aW1lX3Vz
ZV9hdXRvc3VzcGVuZChkd2MtPmRldik7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgZHdj
M19nbHVlX29wcyBkd2MzX2lteF9nbHVlX29wcyA9IHsNCj4gKwkucHJlX3NldF9yb2xlID0gZHdj
M19pbXhfcHJlX3NldF9yb2xlLA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBw
cm9wZXJ0eV9lbnRyeSBkd2MzX2lteF9wcm9wZXJ0aWVzW10gPSB7DQo+ICsJUFJPUEVSVFlfRU5U
UllfQk9PTCgieGhjaS1taXNzaW5nLWNhcy1xdWlyayIpLA0KPiArCVBST1BFUlRZX0VOVFJZX0JP
T0woInhoY2ktc2tpcC1waHktaW5pdC1xdWlyayIpLA0KPiArCXt9LA0KPiArfTsNCj4gKw0KPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBzb2Z0d2FyZV9ub2RlIGR3YzNfaW14X3N3bm9kZSA9IHsNCj4g
KwkucHJvcGVydGllcyA9IGR3YzNfaW14X3Byb3BlcnRpZXMsDQo+ICt9Ow0KPiArDQo+ICtzdGF0
aWMgaW50IGR3YzNfaW14X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICt7
DQo+ICsJc3RydWN0IGRldmljZQkJKmRldiA9ICZwZGV2LT5kZXY7DQo+ICsJc3RydWN0IGR3YzNf
aW14CQkqZHdjX2lteDsNCj4gKwlzdHJ1Y3QgZHdjMwkJKmR3YzsNCj4gKwlzdHJ1Y3QgcmVzb3Vy
Y2UJCSpyZXM7DQo+ICsJY29uc3QgY2hhcgkJKmlycV9uYW1lOw0KPiArCXN0cnVjdCBkd2MzX3By
b2JlX2RhdGEJcHJvYmVfZGF0YSA9IHt9Ow0KPiArCWludAkJCXJldCwgaXJxOw0KPiArDQo+ICsJ
ZHdjX2lteCA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZHdjX2lteCksIEdGUF9LRVJORUwp
Ow0KPiArCWlmICghZHdjX2lteCkNCj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ICsNCj4gKwlwbGF0
Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBkd2NfaW14KTsNCj4gKwlkd2NfaW14LT5kZXYgPSBkZXY7
DQo+ICsNCj4gKwlkd2NfaW14LT5ibGtjdGxfYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9y
ZXNvdXJjZV9ieW5hbWUocGRldiwgImJsa2N0bCIpOw0KPiArCWlmIChJU19FUlIoZHdjX2lteC0+
YmxrY3RsX2Jhc2UpKQ0KPiArCQlyZXR1cm4gUFRSX0VSUihkd2NfaW14LT5ibGtjdGxfYmFzZSk7
DQo+ICsNCj4gKwlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVT
T1VSQ0VfTUVNLCAiZ2x1ZSIpOw0KPiArCWlmICghcmVzKSB7DQo+ICsJCWRldl93YXJuKGRldiwg
IkJhc2UgYWRkcmVzcyBmb3IgZ2x1ZSBsYXllciBtaXNzaW5nXG4iKTsNCj4gKwl9IGVsc2Ugew0K
PiArCQlkd2NfaW14LT5nbHVlX2Jhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCByZXMp
Ow0KPiArCQlpZiAoSVNfRVJSKGR3Y19pbXgtPmdsdWVfYmFzZSkpDQo+ICsJCQlyZXR1cm4gUFRS
X0VSUihkd2NfaW14LT5nbHVlX2Jhc2UpOw0KPiArCX0NCj4gKw0KPiArCXJlcyA9IHBsYXRmb3Jt
X2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sICJjb3JlIik7DQo+ICsJ
aWYgKCFyZXMpDQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVOT0RFViwgIm1pc3Np
bmcgY29yZSBtZW1vcnkgcmVzb3VyY2VcbiIpOw0KPiArDQo+ICsJZHdjX2lteC0+aHNpb19jbGsg
PSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsICJoc2lvIik7DQo+ICsJaWYgKElTX0VSUihkd2Nf
aW14LT5oc2lvX2NsaykpDQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihk
d2NfaW14LT5oc2lvX2NsayksDQo+ICsJCQkJICAgICAiRmFpbGVkIHRvIGdldCBoc2lvIGNsa1xu
Iik7DQo+ICsNCj4gKwlkd2NfaW14LT5zdXNwZW5kX2NsayA9IGRldm1fY2xrX2dldF9lbmFibGVk
KGRldiwgInN1c3BlbmQiKTsNCj4gKwlpZiAoSVNfRVJSKGR3Y19pbXgtPnN1c3BlbmRfY2xrKSkN
Cj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGR3Y19pbXgtPnN1c3BlbmRf
Y2xrKSwNCj4gKwkJCQkgICAgICJGYWlsZWQgdG8gZ2V0IHN1c3BlbmQgY2xrXG4iKTsNCj4gKw0K
PiArCWlycSA9IHBsYXRmb3JtX2dldF9pcnFfYnluYW1lKHBkZXYsICJ3YWtldXAiKTsNCj4gKwlp
ZiAoaXJxIDwgMCkNCj4gKwkJcmV0dXJuIGlycTsNCj4gKwlkd2NfaW14LT5pcnEgPSBpcnE7DQo+
ICsNCj4gKwlpcnFfbmFtZSA9IGRldm1fa2FzcHJpbnRmKGRldiwgR0ZQX0tFUk5FTCwgIiVzOndh
a2V1cCIsIGRldl9uYW1lKGRldikpOw0KPiArCWlmICghaXJxX25hbWUpDQo+ICsJCXJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgLUVOT01FTSwgImZhaWxlZCB0byBjcmVhdGUgaXJxX25hbWVcbiIp
Ow0KPiArDQo+ICsJcmV0ID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycShkZXYsIGlycSwgTlVM
TCwgZHdjM19pbXhfaW50ZXJydXB0LA0KPiArCQkJCQlJUlFGX09ORVNIT1QgfCBJUlFGX05PX0FV
VE9FTiwNCj4gKwkJCQkJaXJxX25hbWUsIGR3Y19pbXgpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJl
dHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIHJlcXVlc3QgSVJRICMlZFxu
IiwgaXJxKTsNCj4gKw0KPiArCXJldCA9IGRldmljZV9hZGRfc29mdHdhcmVfbm9kZShkZXYsICZk
d2MzX2lteF9zd25vZGUpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2Jl
KGRldiwgcmV0LCAiZmFpbGVkIHRvIGFkZCBzb2Z0d2FyZSBub2RlXG4iKTsNCj4gKw0KPiArCWR3
YyA9ICZkd2NfaW14LT5kd2M7DQo+ICsJZHdjLT5kZXYgPSBkZXY7DQo+ICsJZHdjLT5nbHVlX29w
cyA9ICZkd2MzX2lteF9nbHVlX29wczsNCj4gKw0KPiArCXByb2JlX2RhdGEucmVzID0gcmVzOw0K
PiArCXByb2JlX2RhdGEuZHdjID0gZHdjOw0KPiArCXByb2JlX2RhdGEucHJvcGVydGllcyA9IERX
QzNfREVGQVVMVF9QUk9QRVJUSUVTOw0KPiArCXByb2JlX2RhdGEucHJvcGVydGllcy5jb3JlX21h
eV9sb3NlX3Bvd2VyID0gdHJ1ZTsNCj4gKw0KPiArCXJldCA9IGR3YzNfY29yZV9wcm9iZSgmcHJv
YmVfZGF0YSk7DQo+ICsJaWYgKHJldCkgew0KPiArCQlkZXZpY2VfcmVtb3ZlX3NvZnR3YXJlX25v
ZGUoZGV2KTsNCj4gKwkJcmV0dXJuIHJldDsNCj4gKwl9DQo+ICsNCj4gKwlkZXZpY2Vfc2V0X3dh
a2V1cF9jYXBhYmxlKGRldiwgdHJ1ZSk7DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0
YXRpYyB2b2lkIGR3YzNfaW14X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiArew0KPiArCXN0cnVjdCBkZXZpY2UJKmRldiA9ICZwZGV2LT5kZXY7DQo+ICsJc3RydWN0IGR3
YzMJKmR3YyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiArDQo+ICsJZHdjM19jb3JlX3JlbW92
ZShkd2MpOw0KPiArCWRldmljZV9yZW1vdmVfc29mdHdhcmVfbm9kZShkZXYpOw0KPiArfQ0KPiAr
DQo+ICtzdGF0aWMgdm9pZCBkd2MzX2lteF9zdXNwZW5kKHN0cnVjdCBkd2MzX2lteCAqZHdjX2lt
eCwgcG1fbWVzc2FnZV90IG1zZykNCj4gK3sNCj4gKwlpZiAoUE1TR19JU19BVVRPKG1zZykgfHwg
ZGV2aWNlX21heV93YWtldXAoZHdjX2lteC0+ZGV2KSkNCj4gKwkJZHdjM19pbXhfd2FrZXVwX2Vu
YWJsZShkd2NfaW14LCBtc2cpOw0KPiArDQo+ICsJZW5hYmxlX2lycShkd2NfaW14LT5pcnEpOw0K
PiArCWR3Y19pbXgtPnBtX3N1c3BlbmRlZCA9IHRydWU7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2
b2lkIGR3YzNfaW14X3Jlc3VtZShzdHJ1Y3QgZHdjM19pbXggKmR3Y19pbXgsIHBtX21lc3NhZ2Vf
dCBtc2cpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzMJKmR3YyA9ICZkd2NfaW14LT5kd2M7DQo+ICsN
Cj4gKwlkd2NfaW14LT5wbV9zdXNwZW5kZWQgPSBmYWxzZTsNCj4gKwlpZiAoIWR3Y19pbXgtPndh
a2V1cF9wZW5kaW5nKQ0KPiArCQlkaXNhYmxlX2lycV9ub3N5bmMoZHdjX2lteC0+aXJxKTsNCj4g
Kw0KPiArCWR3YzNfaW14X3dha2V1cF9kaXNhYmxlKGR3Y19pbXgpOw0KPiArDQo+ICsJLyogVXBv
biBwb3dlciBsb3NzIGFueSBwcmV2aW91cyBjb25maWd1cmF0aW9uIGlzIGxvc3QsIHJlc3RvcmUg
aXQgKi8NCj4gKwlkd2MzX2lteF9jb25maWd1cmVfZ2x1ZShkd2NfaW14KTsNCj4gKw0KPiArCWlm
IChkd2NfaW14LT53YWtldXBfcGVuZGluZykgew0KPiArCQlkd2NfaW14LT53YWtldXBfcGVuZGlu
ZyA9IGZhbHNlOw0KPiArCQlpZiAoZHdjLT5jdXJyZW50X2RyX3JvbGUgPT0gRFdDM19HQ1RMX1BS
VENBUF9ERVZJQ0UpDQo+ICsJCQlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChkd2MtPmRldik7
DQo+ICsJCWVsc2UNCj4gKwkJCS8qDQo+ICsJCQkgKiBBZGQgd2FpdCBmb3IgeGhjaSBzd2l0Y2gg
ZnJvbSBzdXNwZW5kDQo+ICsJCQkgKiBjbG9jayB0byBub3JtYWwgY2xvY2sgdG8gZGV0ZWN0IGNv
bm5lY3Rpb24uDQo+ICsJCQkgKi8NCj4gKwkJCXVzbGVlcF9yYW5nZSg5MDAwLCAxMDAwMCk7DQo+
ICsJfQ0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGR3YzNfaW14X3J1bnRpbWVfc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzMJKmR3YyA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOw0KPiArCXN0cnVjdCBkd2MzX2lteAkqZHdjX2lteCA9IHRvX2R3YzNfaW14
KGR3Yyk7DQo+ICsJaW50CQlyZXQ7DQo+ICsNCj4gKwlkZXZfZGJnKGRldiwgImF0ICVzXG4iLCBf
X2Z1bmNfXyk7DQoNClRoaXMgZGVidWcgbWVzc2FnZSBkb2Vzbid0IGZpdCBoZXJlLiBJdCBzaG91
bGQgb25seSBiZWxvbmdzIGR1cmluZw0KZGV2ZWxvcG1lbnQuDQoNCj4gKw0KPiArCXJldCA9IGR3
YzNfcnVudGltZV9zdXNwZW5kKGR3Yyk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsN
Cj4gKw0KPiArCWR3YzNfaW14X3N1c3BlbmQoZHdjX2lteCwgUE1TR19BVVRPX1NVU1BFTkQpOw0K
PiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGR3YzNfaW14X3J1bnRpbWVf
cmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3sNCj4gKwlzdHJ1Y3QgZHdjMwkqZHdjID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICsJc3RydWN0IGR3YzNfaW14CSpkd2NfaW14ID0gdG9f
ZHdjM19pbXgoZHdjKTsNCj4gKw0KPiArCWRldl9kYmcoZGV2LCAiYXQgJXNcbiIsIF9fZnVuY19f
KTsNCg0KU2FtZSBoZXJlLg0KDQo+ICsNCj4gKwlkd2MzX2lteF9yZXN1bWUoZHdjX2lteCwgUE1T
R19BVVRPX1JFU1VNRSk7DQo+ICsJcmV0dXJuIGR3YzNfcnVudGltZV9yZXN1bWUoZHdjKTsNCj4g
K30NCj4gKw0KPiArc3RhdGljIGludCBkd2MzX2lteF9ydW50aW1lX2lkbGUoc3RydWN0IGRldmlj
ZSAqZGV2KQ0KPiArew0KPiArCXJldHVybiBkd2MzX3J1bnRpbWVfaWRsZShkZXZfZ2V0X2RydmRh
dGEoZGV2KSk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgZHdjM19pbXhfcG1fc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzMJKmR3YyA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOw0KPiArCXN0cnVjdCBkd2MzX2lteCAqZHdjX2lteCA9IHRvX2R3YzNfaW14
KGR3Yyk7DQo+ICsJaW50CQlyZXQ7DQo+ICsNCj4gKwlkZXZfZGJnKGRldiwgImF0ICVzXG4iLCBf
X2Z1bmNfXyk7DQo+ICsNCg0KU2FtZSBoZXJlLg0KDQo+ICsJcmV0ID0gZHdjM19wbV9zdXNwZW5k
KGR3Yyk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCWR3YzNfaW14
X3N1c3BlbmQoZHdjX2lteCwgUE1TR19TVVNQRU5EKTsNCj4gKw0KPiArCWlmIChkZXZpY2VfbWF5
X3dha2V1cChkZXYpKSB7DQo+ICsJCWVuYWJsZV9pcnFfd2FrZShkd2NfaW14LT5pcnEpOw0KPiAr
CQlkZXZpY2Vfc2V0X291dF9iYW5kX3dha2V1cChkZXYpOw0KPiArCX0gZWxzZSB7DQo+ICsJCWNs
a19kaXNhYmxlX3VucHJlcGFyZShkd2NfaW14LT5zdXNwZW5kX2Nsayk7DQo+ICsJfQ0KPiArDQo+
ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGR3Y19pbXgtPmhzaW9fY2xrKTsNCj4gKw0KPiArCXJl
dHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGR3YzNfaW14X3BtX3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzMJKmR3YyA9IGRldl9nZXRfZHJ2
ZGF0YShkZXYpOw0KPiArCXN0cnVjdCBkd2MzX2lteCAqZHdjX2lteCA9IHRvX2R3YzNfaW14KGR3
Yyk7DQo+ICsJaW50CQlyZXQ7DQo+ICsNCj4gKwlkZXZfZGJnKGRldiwgImF0ICVzXG4iLCBfX2Z1
bmNfXyk7DQoNClNhbWUgaGVyZS4NCg0KPiArDQo+ICsJaWYgKGRldmljZV9tYXlfd2FrZXVwKGR3
Y19pbXgtPmRldikpIHsNCj4gKwkJZGlzYWJsZV9pcnFfd2FrZShkd2NfaW14LT5pcnEpOw0KPiAr
CX0gZWxzZSB7DQo+ICsJCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShkd2NfaW14LT5zdXNwZW5k
X2Nsayk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiAr
CXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShkd2NfaW14LT5oc2lvX2Nsayk7DQo+ICsJaWYgKHJl
dCkgew0KPiArCQljbGtfZGlzYWJsZV91bnByZXBhcmUoZHdjX2lteC0+c3VzcGVuZF9jbGspOw0K
PiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiArCWR3YzNfaW14X3Jlc3VtZShkd2NfaW14
LCBQTVNHX1JFU1VNRSk7DQo+ICsNCj4gKwlyZXQgPSBkd2MzX3BtX3Jlc3VtZShkd2MpOw0KPiAr
CWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4g
Kw0KPiArc3RhdGljIHZvaWQgZHdjM19pbXhfY29tcGxldGUoc3RydWN0IGRldmljZSAqZGV2KQ0K
PiArew0KPiArCWR3YzNfcG1fY29tcGxldGUoZGV2X2dldF9kcnZkYXRhKGRldikpOw0KPiArfQ0K
PiArDQo+ICtzdGF0aWMgaW50IGR3YzNfaW14X3ByZXBhcmUoc3RydWN0IGRldmljZSAqZGV2KQ0K
PiArew0KPiArCXJldHVybiBkd2MzX3BtX3ByZXBhcmUoZGV2X2dldF9kcnZkYXRhKGRldikpOw0K
PiArfQ0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgZHdjM19pbXhfZGV2
X3BtX29wcyA9IHsNCj4gKwlTWVNURU1fU0xFRVBfUE1fT1BTKGR3YzNfaW14X3BtX3N1c3BlbmQs
IGR3YzNfaW14X3BtX3Jlc3VtZSkNCj4gKwlSVU5USU1FX1BNX09QUyhkd2MzX2lteF9ydW50aW1l
X3N1c3BlbmQsIGR3YzNfaW14X3J1bnRpbWVfcmVzdW1lLA0KPiArCQkgICAgICAgZHdjM19pbXhf
cnVudGltZV9pZGxlKQ0KPiArCS5jb21wbGV0ZSA9IHBtX3NsZWVwX3B0cihkd2MzX2lteF9jb21w
bGV0ZSksDQo+ICsJLnByZXBhcmUgPSBwbV9zbGVlcF9wdHIoZHdjM19pbXhfcHJlcGFyZSksDQo+
ICt9Ow0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkd2MzX2lteF9v
Zl9tYXRjaFtdID0gew0KPiArCXsgLmNvbXBhdGlibGUgPSAibnhwLGlteDhtcC1kd2MzIiwgfSwN
Cj4gKwl7fSwNCj4gK307DQo+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkd2MzX2lteF9vZl9t
YXRjaCk7DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGR3YzNfaW14X2Ry
aXZlciA9IHsNCj4gKwkucHJvYmUJCT0gZHdjM19pbXhfcHJvYmUsDQo+ICsJLnJlbW92ZQkJPSBk
d2MzX2lteF9yZW1vdmUsDQo+ICsJLmRyaXZlcgkJPSB7DQo+ICsJCS5uYW1lCT0gImlteC1kd2Mz
IiwNCj4gKwkJLnBtCT0gcG1fcHRyKCZkd2MzX2lteF9kZXZfcG1fb3BzKSwNCj4gKwkJLm9mX21h
dGNoX3RhYmxlCT0gZHdjM19pbXhfb2ZfbWF0Y2gsDQo+ICsJfSwNCj4gK307DQo+ICsNCj4gK21v
ZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZHdjM19pbXhfZHJpdmVyKTsNCj4gKw0KPiArTU9EVUxFX0xJ
Q0VOU0UoIkdQTCIpOw0KPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJEZXNpZ25XYXJlIFVTQjMgaS5N
WCBHbHVlIExheWVyIik7DQo+IA0KPiAtLSANCj4gMi4zNC4xDQo+IA0KPiANCg0KQlIsDQpUaGlu
aA==

