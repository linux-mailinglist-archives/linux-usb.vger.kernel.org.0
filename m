Return-Path: <linux-usb+bounces-17842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E91099D8C32
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 19:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A0CAB2441B
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 18:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A971B87ED;
	Mon, 25 Nov 2024 18:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jXKUrEdg";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eCg3jqTH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UmDHxVD4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC54F1B3943
	for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2024 18:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732559278; cv=fail; b=p6Gce5YDGXGqvYjU9uzdSy92funlFhlNGC4LauJlzG9adE5Ykfbz9AOGgrcb84vHk2QAVAtaTolXFRxNF/lE16FrxuKDzqRmuK8Z9eRZbIPvxYADKWiRG4YZ3D4WqC5Fbhfae2vYf7Kfh6ps+mYAuHzpnYdf0L5INhCkRxwe1P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732559278; c=relaxed/simple;
	bh=OFcgw1Qrdwk4eS57QzpX08YjPS+js9IMOsjBJPGxgZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Stc8+feUdoxCwDTtdP5tmR2s3F8qT2+bTLOC0uHvg/FLoYiMr97Iqe7+z8Rfm5YG21D9YPTo5GYkGFTJnLzYb1NMS4bxhO6SDBnv+qg1uWQBRJc9chtslt7MG5xL8iYPzRme5/9nhaR9sLeYPV4S4iAU4aIxrOAXQHMmgO42tgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jXKUrEdg; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eCg3jqTH; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UmDHxVD4 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APDrOBc008539;
	Mon, 25 Nov 2024 10:27:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=OFcgw1Qrdwk4eS57QzpX08YjPS+js9IMOsjBJPGxgZs=; b=
	jXKUrEdgAxAWtI7x7puB+8Z42vTrsJc2bxpBnrHqzsYlaASmGHwumxtGSCcn9ePp
	cvesz8FuyyTJFFrQqfK671Uwm7A3mLl+at8aA46y3wdD056VIhuntGoVBf6Uxpx9
	6vecnOd04OOM9mV9Axb0sGmyWZgAw5DclYqOLraCgJI8sE04NF7X8bGEDYJ2ew8j
	oRkEMivyM3BfkhD1gkwcxbeeIQqesgXRHpqjBapM1k19p9ltrGSQyz7YNJZ5bSo6
	z9LAMrX8XQlrz++8YRtN8l2C5GwyP9EkmZFOihe989JqHhX30GKA1Yf2t1KfnfHR
	WrHvllCDW4ShxJRKJLa3bQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 434ge5v8n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1732559250; bh=OFcgw1Qrdwk4eS57QzpX08YjPS+js9IMOsjBJPGxgZs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=eCg3jqTH/C3QNiMVD9lQvKZPB59KxOGqcQhfYZBNzA7dMur+wU+caEijTgyZX8nAj
	 ahXQZQLMr8DmrYmCQvbfvXeolBmg/j+8qo3noDozG3V397X0ipU7mMSbRaKY20cmId
	 SYCIIRwim1QkTLuedOM//I+5L/j05mCoJW6f3eumsWmRFFUQgQEvsMwUMElkySSVfu
	 kF6dT8N+DILrQ97/C8MCpG1O/TJXs/4TBSGRof6ntgZ/Kfl1p9EL+yEVx4gjTesuUG
	 qaVEw08qxG/KWB1VPXKd5Kv8DbiSiLQ33H460BLsqXkFn13TJ8yhrltBggbmmOOHQa
	 5NwOmuK0WqvUA==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6D14A40126;
	Mon, 25 Nov 2024 18:27:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C73F1A0080;
	Mon, 25 Nov 2024 18:27:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=UmDHxVD4;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7D653405DA;
	Mon, 25 Nov 2024 18:27:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMY+JHStgtYXuGuhVPjBp2ylRyLFQxcsNtxHMyE0vbYPjIQ6h+FpeLmIHyReQIigssxKXzgC6Nvc/Mi9nKtfpP8x/W7UCwMPL/fsFt7y5bgnyLRsyz7ZHpKgmDGuFVDnt6nwUwmD8/hH41G41LcIE/LUJ/7etOWNrAhzFV8GYA0jtEe4GI5v3HlUCNiOcW5fdaqBKD+qYqg2oyl/4KhL6YTWiTzRampOrOL6uoQ3O/8lMv3LNRpymvwcYj1LuJGr2O+zrkiR8/3JVFTZhC8QU/IrYQr27c03onEk5rkrFic1uS0LlqoZc5hrN56f+gZoAbzzudbda5xK//VDCgsUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFcgw1Qrdwk4eS57QzpX08YjPS+js9IMOsjBJPGxgZs=;
 b=hBtjqeoByjkAR0WO/pAdpBn9Hx1VAmYTb8UwGaGieZDHi43q9rx2JvFBYHp4qBWhiqWA63Y1Q5f9w/S3vbVMqmGro/do6MxaXEKK93zPaasDhCrmW64g0/ApWwbYCm/epBaHzcxg0tx3gKPmW/nl0sYpJkYRbDrs8USo8VIuAVW93bwHLd3+FDqZjXxQaE7mlyy7RcdMT5EAfMzaa77kR/xzyEbu4EXHpwVsa19TZS/+b5SzyUCR1k46fIj/jCjPp7FDQSsiuNVsBqcsCQdhexE3EYa1fylfsFP4/Cepz2c+iYbjbA321ZoIulKbwp831gcPeJEykW1bxigRL8d1ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFcgw1Qrdwk4eS57QzpX08YjPS+js9IMOsjBJPGxgZs=;
 b=UmDHxVD42oQ6j3tqLYy/jGKbjhn4BJ90CfLPMTqmCwlKPelJk9s4W6Xd/04aLCjnOLJs3CHXINrgMpDine00M7LswjGz2wKuHvUCDl4Q9/6FEfa8DTbXHiKet+Nc2s6nc+FW8nyAOtI8NIKk8A6OXiQ42j4sbaCTgutbjbLItgM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH2PR12MB4309.namprd12.prod.outlook.com (2603:10b6:610:a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 18:27:23 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 18:27:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH] usb: dwc3: imx8mp: fix software node kernel dump
Thread-Topic: [PATCH] usb: dwc3: imx8mp: fix software node kernel dump
Thread-Index: AQHbPyJCQzRy2PWW70aU4s17lNcpFrLIURMA
Date: Mon, 25 Nov 2024 18:27:23 +0000
Message-ID: <20241125182724.vqw4wp7gkom2i2mf@synopsys.com>
References: <20241125101017.2398904-1-xu.yang_2@nxp.com>
In-Reply-To: <20241125101017.2398904-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH2PR12MB4309:EE_
x-ms-office365-filtering-correlation-id: 2ad294b0-fa72-4ec6-07a5-08dd0d7ece60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NGFiRlE2aTQwVitBQ2ZLWmNzMzlTVndoQ0tRdTFmeUVjdTBBejFuNXZJQ25S?=
 =?utf-8?B?REpzOTFaSTBHN3pIOWRZSFpjbmlJTUlCZy9tNDJQSll1aHpGVWhuYndmQm15?=
 =?utf-8?B?VkZ4S2kwbjZMOGlaMkRFckt4aTdIeEtFTnlhcTZScE8zdzc3RkxqOHUwdVdh?=
 =?utf-8?B?U0w4ZTRnbjFEcjc1c3NaSk42d1RXTzV3MFdDbDBsQUJlcTlLcmxjMEhRWjZT?=
 =?utf-8?B?ZVNtS3RWRDVYMXFsN1g5bTBTdkZiK3VaenF2WDlxTytoOWVPaW83VHgxTTl3?=
 =?utf-8?B?VEx2c1RxRUpSYk4rT3ViazNHYTZjdUtnVkUxZ2RacmNMdUJYWDFudERrQkdS?=
 =?utf-8?B?SWYxcWJqZWFwMnFPbEhnUXhPRnAyWG16VU5neFNNdzVUTkwydUgrN0NPZG1Q?=
 =?utf-8?B?QnlLbFBnc3Q4bmVFRGIxZG5vamlyY05jTFBqK2JZVE9paTEvT2hkNkdQaFhp?=
 =?utf-8?B?QldYWWRRdy9tYjVMd2RTRHZWM1NxVHRRK214YUdjUCsxVFVjd1FZckV0VjJj?=
 =?utf-8?B?aXJBenNXL2dpaW5WV0g1WmU3WStub3dpUUtqcjZHK05hM1FCd3IzYkFzKzZm?=
 =?utf-8?B?K2hpMXpSeVJRT2lkOHVMTERUU2VqemVnS3VTK2RSTmpkajFZdklDcEVPMm5X?=
 =?utf-8?B?VlA0S1NIRDMvUUNzZ3ZZYXAxZVJDRm9IbW9HQkNQemFnR3FtdUt3SGR2QTRS?=
 =?utf-8?B?REYyd3ZTSE50Y1NSbCtHTStQNEhFY0x5Uk1aOEo1cEQ3bEtJdTJmZjErSlAx?=
 =?utf-8?B?cmdrbkxRV1B3NHprKzA0L3R0VlNxSFpvVVFEaThwZlNaZEF4c0hIMWVPTlBY?=
 =?utf-8?B?aWVoYklGUHJBTkY0c2lZc002eDQxeHRCeXVYQ0U2cjU1cDJNdXpRQWZvbnpU?=
 =?utf-8?B?RGxXbUVqcW5mSGNxSkFhZDNUNmovRWxlY29RdS9aWXpUSTE0VnpRZ1g1Mm1a?=
 =?utf-8?B?bXViY3hXbUlVeUNoOW53di9LYW4zMFJtVFpOYXRmRVFLUTZwd3VBZ2M1clNL?=
 =?utf-8?B?ODBZT0YvL2FmaFNrL2svRUgzM0JNU2dKbFVGUGQxVWc4SXFsa3gvUWp3cHUv?=
 =?utf-8?B?QkxBNWlrTXU1WUJucXFLSGU3b3BlQzhJQXBOQjJOSE9BS0pza01WS3BLclZy?=
 =?utf-8?B?R3RQVkNFRFpOSWFSemw3b0V2UVdMdEdZb2EvYzA1WDBLVGN3N0xUVVpqajdt?=
 =?utf-8?B?TEU2THRhYkY4Nm5GS3d2OW9tM1ZiZjVHOVJEUkhwSytJRUpYVXJSZEFaL0xr?=
 =?utf-8?B?enczTVc5QW41dlV2b0dtRWlFTXUrbVNrU1NPYTU2MFFUTmZuYVpZVGhrYTNK?=
 =?utf-8?B?ckV2S2lWbG5XTHB6Z3RNL0tVSTErUmVERktWVzUxSEhaaWlqSlRYRFZreTJI?=
 =?utf-8?B?UVR6M3ZJWWc4TkU2RzVqNGRaVVp2dnNxVm5pK0NKYUhCRFJkQ1UzeWo2OFJt?=
 =?utf-8?B?NDJhRUxvUERSOUZJUTVuSjRhYnFka0ppQnltVTBCa2Y3WnlJckFaLy9ROGE2?=
 =?utf-8?B?bnVrT1k3emtLU2hYNmxJMWQ0RkxxRElqT2RiOUdGV0xVeEFjT1JGMzErYWN1?=
 =?utf-8?B?bzZqU0c5aXFxdXN0RStvZ1VxdS8rN2ZJSGp5YkMwb1hpdm8xclJnVW9VVnMr?=
 =?utf-8?B?RW9OZXdsNjZXTStYNFpjUG1kU0FYQjNuVERCK04yUmdGMGhjQ0Jyc1VLUjRC?=
 =?utf-8?B?VStONEo3VWV1ZDl1Y25YWEU0OXgvd3JOdjdkV21CVGt1WXdGNEFjc0dUSDRB?=
 =?utf-8?B?OEJLWUMxcTBsZWo5Ui9IZXZ1NjlrRlJQanJtZ3Q4TEx1dXROeHBwemc3VGlF?=
 =?utf-8?B?eHNSL3NhWGV1KzVPckhNaWZpRU9KNVJkREFYelZnZUNqMHBUYWdKM3IxaG5r?=
 =?utf-8?B?OXVoWFVWYVVWNHpFMEtvU0dZT3g0QU5vV2FZN3Z3Y2ttemc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bzJFTElGczdFcjk3eCtFZEFpZkVnOVBiWUtZaXMrUlBLUHFzSFQrZTlQYk5k?=
 =?utf-8?B?bFViazBiMEV6MmpMc1FiY09xQ1ZDVks3V0FXc1NVUGk5RStEUjhleW82Tzlz?=
 =?utf-8?B?NStGUGpmUDc4akNURU9LZXNSUUVLYk1BdFNkWkQrZ0pKNkdVMXBBWHRMRWR6?=
 =?utf-8?B?b2tsVCs4cktnWjF6TXc0MVRuVjdRUGZoeEZkbmE1UDh0NWtKNFQ5d1o0Y3Jx?=
 =?utf-8?B?Wjc0N3hibmFXRVNrY01tbEJZQ3MwWU9qekQ1ZVFrQ1owWmFHOHRtS0xIVGlt?=
 =?utf-8?B?dG9nNmpaMUVGbzRQRHFvZ2dycEtKRUtic0Y4bTRaUHBKM2ZjNFdiSFJmV00r?=
 =?utf-8?B?OWpHZWdWTUR4aktsMmQ1NUh1di9naE4rYkY3MExHNDVZcEhld2xVcVI4dHcy?=
 =?utf-8?B?eUdvZ0oyMDdka3grMlBFZWs3MnlPWDQ3WU5LWDZGRmNrc0V5NllGWnFXcTFz?=
 =?utf-8?B?UUgrLzN2ZGxoZTFjWW1zZjZlcURaK2hiMktUdk0wK1JhWWJuc2k5MGs1bG1h?=
 =?utf-8?B?d2xIMmlwT1Z5OWJ3blgySnB1dmtzNWpEQzFlNnMyTncvckVNQWZTdjdoU3A0?=
 =?utf-8?B?aFY1ZWJxUkZtUFpNZjF2bVVyczNDbTNXRS9MZnJWNXR6Nlk2VjBOUmlBY2px?=
 =?utf-8?B?TnBsT1FCdjlkKzdJQUdUL3FFWitadlhRa2tLY21tdzhsTkNwOEwrV3I1US95?=
 =?utf-8?B?MGNPOElIV1o4ejhTN0hGWXc1cVNsSHZmT3RqMEdvU3FMUVRLeFNJa1VyNEpm?=
 =?utf-8?B?ZWpLUjF6MjAzcE1ha2txWGtFQ3VQWmtDbHE5R0Roc1QvTVZROFVXQUh1ZVdT?=
 =?utf-8?B?V1R3OS90ZHV6Qi9DbDVqL2dDaUVoSFE4djc3c0M4VUtVVm5hTVovTXFwTXha?=
 =?utf-8?B?RjB3djE4WXJkYnNINXA1cFhOYUJEZVJocC9SbU5XaE45QUVaMWhoMmMvUUpm?=
 =?utf-8?B?dlE4Qnl5d211cWpJVlVyRk56SFRoZjNrdjBudWl0Q0tTYVMwcEpBdU55ZmM4?=
 =?utf-8?B?cjVCUHNzOTIyNU1KbnEybWhxUm16UVc4eGV6NjNtQ2Z2N1hDSS9rQ2ZQUFJJ?=
 =?utf-8?B?b2tvc1h5RlY0ZUhPT1UwU0cxeVAyV3RKaDljakJnMHYybkJ2NjY1OHV6bjd2?=
 =?utf-8?B?cEJianQ2QWZHMEo2eVlEWEhDOXFmMUtyQ1pGc2Q2cU9xZlZ6N1V3dnlPYkYv?=
 =?utf-8?B?VjVidEpmTVN3Ujh0UlRrNmdGQWRSRi9VWFpTdmlzaEtPcGo0a3NrbUJKdUw1?=
 =?utf-8?B?WVVSTUxoVzJmbTVpUGYySzhmMXkyVmNKNUMxaituK3VEL1hLQmNuYm13WEx5?=
 =?utf-8?B?SE9DNURpZkR2MGxPWUR1eHZVajdDSVJmb1dvSmt6OXdlcjZRSlZBTTF2VEMw?=
 =?utf-8?B?SDlPZVE0Vlp5V3c5SDl3amN4ZTJXL3FZUDk0UXNTM3dPTnVvcU56bTBWamx6?=
 =?utf-8?B?c2NtTDdFNUgzNkdDNGJDUGU2Z2k1L0d5MitvQi9GNW5BUnpuLzBPUEtNcUNy?=
 =?utf-8?B?cGdPYmVzWEFCOVZDeG05QVR0SnNUcXVGdVdlMGxWMnBzR1FsRzErZXpHZG1u?=
 =?utf-8?B?VEdCbnREOVo3OFc5TlZSd0VkUllOS1pXcDdMTFR4Ujl3ZW43YWxKSi9MQlh3?=
 =?utf-8?B?REFPTWNZeU5CeURmTXg5N3NjSDBRRllZMFdndGFhQ1MrNXlQR1lTdDFlbmtn?=
 =?utf-8?B?TEJuNU5ES1huMk9lc3NLVVRDZG9DMit3N0c4NUE4Mm1TR0dyUjVOemY0SmtH?=
 =?utf-8?B?WnFjOWJGZ2hOWElUVGtTU09oUW1JcWsyaytCaE9yMk9mazBxMWpuRCtPNlZy?=
 =?utf-8?B?a2tDOEtEYkh3SHV5VnYyQTVPV2orb0pUTUt4YlE3ZTFsNUttQUFwTk5sQmdC?=
 =?utf-8?B?RnhIMzY3VkZaMUhDMWUvN2Vqano2MnQ3NEpSbTJmNUE2NTk3WFpBMUpLVGlO?=
 =?utf-8?B?TDB1NEJUWHVWNi8wckhiVmZTQXJ3ZEdPWVJBN082UUo5c3lJdTlGV2hZaUlL?=
 =?utf-8?B?Qm5oMXo1QjVacXZGVGlaa1B2ZUUxSW9NRVBCVkc2aDNQM3hxS3VJZ3hTT2h0?=
 =?utf-8?B?K2xjVTVFdUZ0TldpZWRlekM1ZmV4RUVPUnZXOHdyWEFGdG1GMS9TNWx3WUJ0?=
 =?utf-8?B?TWFMU0VmS3ZGS1VuTjg0RCsxaFBYdncySldsS0tDekRzRHFhMkN3b3c2RHYr?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B83CFEB5AA39541AA1ED4F106F9DB2B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RFW1zqBiIxciyDzErGy6Sf0LE97Z2Qd6Dc9sP6Ca1G6x2eg4arvxq7pDDD29YnnCdV+9b9mWkac8H3mltFM2WEZcaZnVBl38Hq4T77ChQB8aDlU93WlZaiYg0FiJJMkClcw6WFBGzbojVrYlfNIwJi5Fhga4R4sEIgYWZE0F4t9JdUtRNnrXLZCnh7Jxsiyl9MnAdGvqeyo0nz5stesilslsuYKGfKl5yeUz1FUSIuAKRQDyMRrVXAGKqGj6PrmnVzUvNWf1VPIj/rwrLRIrO8iq49lJ76bidfYygU+uyTpDLgzAX2CVJaBaoN5KAwBdiOEdxh3Inr4J/M9nZQfGqloRf2EUy74UuC0ffDHtJzCt+lyHDQ3DOGKF5d/7rhjdJ+hv+HCmHr4dJFl8tlQY0HzdmVZIjYjWg+anVuergmEdUhOgDokpBY8ko06wsAekHM7esCWtYdygMQk54paDeUPqL26ETmC19ue+m/JofFOnSKAUy75g9F1sR2GRzgK2StlTT5aRHMRGhzBbEBnYMfgLz70OAdf3d5fgm9N6ZVjKmFNZJ/ms6sf/wfXhEH07aN6XDCeaRSLD0U/Jp5JK+UAntQR5+BCynjTef8B/iXTuZN6SD43j3A2+RwCA+sMonZrPTTdN9TbdCqnVC9CL3w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad294b0-fa72-4ec6-07a5-08dd0d7ece60
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 18:27:23.5364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TIw/xLelYjsbkfqA8Jtj/rvSLLQIjZwZ/sW/XRB0OmrIG0QbY1uzFSoAzpbtkXuJhEwrL95VZUY366rZtW1SPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4309
X-Proofpoint-GUID: HxN3K6rUyTFIp4s8XIcFpXwqasA6FLz7
X-Proofpoint-ORIG-GUID: HxN3K6rUyTFIp4s8XIcFpXwqasA6FLz7
X-Authority-Analysis: v=2.4 cv=F80FdbhN c=1 sm=1 tr=0 ts=6744c193 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=kEAYqIWXjuYQ-G0W3ecA:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 spamscore=0 impostorscore=0 mlxscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 mlxlogscore=750 malwarescore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250153

T24gTW9uLCBOb3YgMjUsIDIwMjQsIFh1IFlhbmcgd3JvdGU6DQo+IFdoZW4gdW5iaW5kIGFuZCBi
aW5kIHRoZSBkZXZpY2UgYWdhaW4sIGtlcm5lbCB3aWxsIGR1bXAgYmVsb3cgd2FybmluZzoNCj4g
DQo+IFsgIDE3My45NzIxMzBdIHN5c2ZzOiBjYW5ub3QgY3JlYXRlIGR1cGxpY2F0ZSBmaWxlbmFt
ZSAnL2RldmljZXMvcGxhdGZvcm0vc29jLzRjMDEwMDEwLnVzYi9zb2Z0d2FyZV9ub2RlJw0KPiBb
ICAxNzMuOTgxNTY0XSBDUFU6IDIgVUlEOiAwIFBJRDogNTM2IENvbW06IHNoIE5vdCB0YWludGVk
IDYuMTIuMC1yYzYtMDYzNDQtZzJhZWQ3YzRhNWM1NiAjMTQ0DQo+IFsgIDE3My45ODk5MjNdIEhh
cmR3YXJlIG5hbWU6IE5YUCBpLk1YOTUgMTVYMTUgYm9hcmQgKERUKQ0KPiBbICAxNzMuOTk1MDYy
XSBDYWxsIHRyYWNlOg0KPiBbICAxNzMuOTk3NTA5XSAgZHVtcF9iYWNrdHJhY2UrMHg5MC8weGU4
DQo+IFsgIDE3NC4wMDExOTZdICBzaG93X3N0YWNrKzB4MTgvMHgyNA0KPiBbICAxNzQuMDA0NTI0
XSAgZHVtcF9zdGFja19sdmwrMHg3NC8weDhjDQo+IFsgIDE3NC4wMDgxOThdICBkdW1wX3N0YWNr
KzB4MTgvMHgyNA0KPiBbICAxNzQuMDExNTI2XSAgc3lzZnNfd2Fybl9kdXArMHg2NC8weDgwDQo+
IFsgIDE3NC4wMTUyMDFdICBzeXNmc19kb19jcmVhdGVfbGlua19zZCsweGYwLzB4ZjgNCj4gWyAg
MTc0LjAxOTY1Nl0gIHN5c2ZzX2NyZWF0ZV9saW5rKzB4MjAvMHg0MA0KPiBbICAxNzQuMDIzNTkw
XSAgc29mdHdhcmVfbm9kZV9ub3RpZnkrMHg5MC8weDEwMA0KPiBbICAxNzQuMDI3ODcyXSAgZGV2
aWNlX2NyZWF0ZV9tYW5hZ2VkX3NvZnR3YXJlX25vZGUrMHhlYy8weDEwOA0KPiAuLi4NCj4gDQo+
IFRoZSByb290IGNhdXNlIGlzIHRoZSAnNGMwMTAwMTAudXNiJyBkZXZpY2UgaXMgYSBwbGF0Zm9y
bSBkZXZpY2Ugd2hpY2ggaXMNCj4gY3JlYXRlZCBkdXJpbmcgaW5pdGNhbGwgYW5kIGl0IHdpbGwg
bmV2ZXIgYmUgcmVtb3ZlZC4gU28gdGhlIHNvZnR3YXJlIG5vZGUNCj4gd2lsbCBuZXZlciBiZSBy
ZW1vdmVkIHRvbyBldmVuIHVzaW5nIGRldmljZV9jcmVhdGVfbWFuYWdlZF9zb2Z0d2FyZV9ub2Rl
KCkuDQo+IFRoaXMgd2lsbCB1c2UgZGV2aWNlX2FkZC9yZW1vdmVfc29mdHdhcmVfbm9kZSgpIHRv
IGltcHJvdmUgdGhlIGxvZ2ljLg0KPiANCj4gRml4ZXM6IGE5NDAwZjE5NzlhMCAoInVzYjogZHdj
MzogaW14OG1wOiBhZGQgMiBzb2Z0d2FyZSBtYW5hZ2VkIHF1aXJrIHByb3BlcnRpZXMgZm9yIGhv
c3QgbW9kZSIpDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6
IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1pbXg4bXAuYyB8IDI2ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5jIGIvZHJpdmVycy91c2IvZHdjMy9k
d2MzLWlteDhtcC5jDQo+IGluZGV4IDM1NjgxMmNiY2Q4OC4uZWRkNTQ0YzZlMWMxIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gKysrIGIvZHJpdmVycy91
c2IvZHdjMy9kd2MzLWlteDhtcC5jDQo+IEBAIC0xMjksNiArMTI5LDE2IEBAIHN0YXRpYyB2b2lk
IGR3YzNfaW14OG1wX3dha2V1cF9kaXNhYmxlKHN0cnVjdCBkd2MzX2lteDhtcCAqZHdjM19pbXgp
DQo+ICAJd3JpdGVsKHZhbCwgZHdjM19pbXgtPmhzaW9fYmxrX2Jhc2UgKyBVU0JfV0FLRVVQX0NU
UkwpOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHByb3BlcnR5X2VudHJ5IGR3
YzNfaW14OG1wX3Byb3BlcnRpZXNbXSA9IHsNCj4gKwlQUk9QRVJUWV9FTlRSWV9CT09MKCJ4aGNp
LW1pc3NpbmctY2FzLXF1aXJrIiksDQo+ICsJUFJPUEVSVFlfRU5UUllfQk9PTCgieGhjaS1za2lw
LXBoeS1pbml0LXF1aXJrIiksDQo+ICsJe30sDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IHNvZnR3YXJlX25vZGUgZHdjM19pbXg4bXBfc3dub2RlID0gew0KPiArCS5wcm9wZXJ0
aWVzID0gZHdjM19pbXg4bXBfcHJvcGVydGllcywNCj4gK307DQo+ICsNCj4gIHN0YXRpYyBpcnFy
ZXR1cm5fdCBkd2MzX2lteDhtcF9pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqX2R3YzNfaW14KQ0K
PiAgew0KPiAgCXN0cnVjdCBkd2MzX2lteDhtcAkqZHdjM19pbXggPSBfZHdjM19pbXg7DQo+IEBA
IC0xNDgsMTcgKzE1OCw2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkd2MzX2lteDhtcF9pbnRlcnJ1
cHQoaW50IGlycSwgdm9pZCAqX2R3YzNfaW14KQ0KPiAgCXJldHVybiBJUlFfSEFORExFRDsNCj4g
IH0NCj4gIA0KPiAtc3RhdGljIGludCBkd2MzX2lteDhtcF9zZXRfc29mdHdhcmVfbm9kZShzdHJ1
Y3QgZGV2aWNlICpkZXYpDQo+IC17DQo+IC0Jc3RydWN0IHByb3BlcnR5X2VudHJ5IHByb3BzWzNd
ID0geyAwIH07DQo+IC0JaW50IHByb3BfaWR4ID0gMDsNCj4gLQ0KPiAtCXByb3BzW3Byb3BfaWR4
KytdID0gUFJPUEVSVFlfRU5UUllfQk9PTCgieGhjaS1taXNzaW5nLWNhcy1xdWlyayIpOw0KPiAt
CXByb3BzW3Byb3BfaWR4KytdID0gUFJPUEVSVFlfRU5UUllfQk9PTCgieGhjaS1za2lwLXBoeS1p
bml0LXF1aXJrIik7DQo+IC0NCj4gLQlyZXR1cm4gZGV2aWNlX2NyZWF0ZV9tYW5hZ2VkX3NvZnR3
YXJlX25vZGUoZGV2LCBwcm9wcywgTlVMTCk7DQo+IC19DQo+IC0NCj4gIHN0YXRpYyBpbnQgZHdj
M19pbXg4bXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gIAlz
dHJ1Y3QgZGV2aWNlCQkqZGV2ID0gJnBkZXYtPmRldjsNCj4gQEAgLTIyMSwxMCArMjIwLDEwIEBA
IHN0YXRpYyBpbnQgZHdjM19pbXg4bXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gIAlpZiAoZXJyIDwgMCkNCj4gIAkJZ290byBkaXNhYmxlX3JwbTsNCj4gIA0KPiAtCWVy
ciA9IGR3YzNfaW14OG1wX3NldF9zb2Z0d2FyZV9ub2RlKGRldik7DQo+ICsJZXJyID0gZGV2aWNl
X2FkZF9zb2Z0d2FyZV9ub2RlKGRldiwgJmR3YzNfaW14OG1wX3N3bm9kZSk7DQoNCllvdSBuZWVk
IHRvIGNoZWNrIGFsbCB0aGUgZmFpbCBjYXNlcyBhZnRlciB0aGlzIHRvIHByb3Blcmx5IHJlbW92
ZSB0aGUNCnNvZnR3YXJlIG5vZGUuDQoNCkJSLA0KVGhpbmgNCg0KPiAgCWlmIChlcnIpIHsNCj4g
IAkJZXJyID0gLUVOT0RFVjsNCj4gLQkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gY3JlYXRlIHNv
ZnR3YXJlIG5vZGVcbiIpOw0KPiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBhZGQgc29mdHdh
cmUgbm9kZVxuIik7DQo+ICAJCWdvdG8gZGlzYWJsZV9ycG07DQo+ICAJfQ0KPiAgDQo+IEBAIC0y
NjgsNiArMjY3LDcgQEAgc3RhdGljIHZvaWQgZHdjM19pbXg4bXBfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICANCj4gIAlwbV9ydW50aW1lX2dldF9zeW5jKGRldik7DQo+
ICAJb2ZfcGxhdGZvcm1fZGVwb3B1bGF0ZShkZXYpOw0KPiArCWRldmljZV9yZW1vdmVfc29mdHdh
cmVfbm9kZShkZXYpOw0KPiAgDQo+ICAJcG1fcnVudGltZV9kaXNhYmxlKGRldik7DQo+ICAJcG1f
cnVudGltZV9wdXRfbm9pZGxlKGRldik7DQo+IC0tIA0KPiAyLjM0LjENCj4g

