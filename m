Return-Path: <linux-usb+bounces-14605-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8D96ABC1
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 00:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCA9E1C23EB6
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 22:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AFB1D9D65;
	Tue,  3 Sep 2024 22:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="B6cjlSiU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="av1FoEpi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NHJmJD8X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E282E1D88C6
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 22:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401267; cv=fail; b=dT33jzDWUPupIrYHGex+yWn2YwQuvAF+fahZ0A5NfyksnrJkyrEx1dvJ5ddLPnY5iG1AJBGAun/cdbP3VvA8FuL90/q00O0gtz9vj215cY1Fd3EGqCGdDtbHGaKmirtBsITMfiSeoT+aIjhonstWUUMEF21zDRMU/xO+kY7sxPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401267; c=relaxed/simple;
	bh=92oF5C4LGzqsVx+hBMrzel26x/EmMQ32bLGpN1r+Dmg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VtSk7A29mFpMN1zjxuoT/1M+otb363MBJeoKRDY2AmaHG3rgho/+Hoso70kXkYI69XAYI2BB4xz7HIdp+8jw+ViUN2ry3ZgeKANloVzae8xj1GOyutecWoZf2nkedcFhrEZUSaLtSIQnEFIHw6xCDG5j5xYeuieYr6sLFxIDxCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=B6cjlSiU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=av1FoEpi; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NHJmJD8X reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483LYLOn001411;
	Tue, 3 Sep 2024 15:06:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=92oF5C4LGzqsVx+hBMrzel26x/EmMQ32bLGpN1r+Dmg=; b=
	B6cjlSiUZ1uxGfuvOLywaizFPUnsdx5/7qXc16tPRs5wXVXsbMpif7RC4f3RwXuI
	rTogUurmZtB9hHe2Ag2jDEI6BAeq/k+My3Rnse8ABrd989lE11GTqXPjttPNvpex
	Zd0cePlt413VtFfHo1QpzfQRShlF3f2TwDuUNPPxdkn/lAdJnaGgoGTTGHYo+sHa
	2XL+BUBngYvZV8JUMxmO+IvgRGMqdmAOd5JFN+6bRxQq5+5BZeOIdppvvYIogmwj
	0vyuXXjknR1kyXX6+cnI4ANFzMwCoFgarwffaR8/pKbb/agrXGTM8sD6L5pIHkCB
	yVF57LW1sWt5f7it66fAdw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 41c26pw5c7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 15:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1725401173; bh=92oF5C4LGzqsVx+hBMrzel26x/EmMQ32bLGpN1r+Dmg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=av1FoEpiyEzLZgctgltB3VQBt6Pw+oq8tfr1R7X5Eiyh6EBm96UpZgMOPeJGvq7ue
	 1842MOZbh10ZG7hveYIJrFBJ9XM3/09BDgUJrP4QPd9tle/W2LNDgT7nSxqbm8e/Z0
	 4N22Ay9Q7NfG8xJlgl+1wn/jMKWo4klGpjUIGzVBiYY6vK99lNPVprsbpf5OCQqHkw
	 pSw4v8tzH7LYP6ie1VIwPypW5tCAisbSZ3wsCEHDlUAlQlMWA2ZsgkE6bvUWWQZcr/
	 h55NBWD2IHWAuh+d8u14PG4wdhLTZ6t2XXsN2IiIaByhCqq9xTFWmHg0AHNj1mAXaJ
	 E9idQmNT80mGA==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6482E404CF;
	Tue,  3 Sep 2024 22:06:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 97F22A0265;
	Tue,  3 Sep 2024 22:06:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NHJmJD8X;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4C27240147;
	Tue,  3 Sep 2024 22:06:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qws/iLAYqsNN2eB8gv+0WFYstZODa7r0tYi9P+07Cv/QlRTLD29HuzBGJHaA12ppar+V1yF6nwSdQFpEZdCUvh8BjfwVdlVYbxI6OPvtwr/lkqq8XpQj6Na/blzwd1wPpG60I1YXEydhKk4pr9+bO6Tmg5h9u2emx9IY7jwqeumzvrjUpf3RZmTFBCVl31MnyWFvzj+tzh4VXcpjvZuzb+MANT5BZeIBd5XX7HJhivcosyJUApKTNum1IAV+eEvAdVkm06jQ4v+5n/4AT96IWA3VqyDD/lPFh3JPVo3pn98G5GTf/gYpfdTDeQGa+JvzMJou2tawE21klNIS3OizbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92oF5C4LGzqsVx+hBMrzel26x/EmMQ32bLGpN1r+Dmg=;
 b=Yc72hcVl8GE9OlcXjMojRwJ5eUItrsJ+GaA38LhRWqQhrtuDA0nj6b9jXoco1WFrxdXBGuqGJrmaxBk0X/QuMlv6vqVSh+Z32MullAoN7le5QIM1DaeAgF5figA/8Pj3k7KRni9TmyW576T4UlI3SFUgW33/lPIVZEXBx48H1evCryQdx+wGLwXMq+NM3Sck10bwgls4iaM7y7bNds0sucQGy3vLHQEd0Mv+vksY//iRU7BFQU8BVZOsoWXnynt7j0lphMIiHwxI0lyIk0bvxv4DVT6IWO5MWd0CISowuaHso2oQ9spTYEEu372WAEs+6jLWCH29h0rp/VTSBQu4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92oF5C4LGzqsVx+hBMrzel26x/EmMQ32bLGpN1r+Dmg=;
 b=NHJmJD8XOexfOkNIY5HrC3BYPkR5mE3zIBO6/cz1R2sD4S6eCyiF0IYz/5MGvYZOKjknpY9Rs2cYWD1N9WiIOl1hrhJpJNic/xbOK6ShowU7KzRw0fw2WmVYt8NQTx0wF9BXtr3Poe6njzsGMx1X5OM7aZ1UlSAnKCqpY7mgzsA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CYXPR12MB9426.namprd12.prod.outlook.com (2603:10b6:930:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Tue, 3 Sep
 2024 22:06:05 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 22:06:05 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Zhang Zekun <zhangzekun11@huawei.com>
CC: "patchwork@huawei.com" <patchwork@huawei.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "vz@mleia.com" <vz@mleia.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/2] usb: dwc3: Use helper function devm_clk_get_enabled()
Thread-Topic: [PATCH 1/2] usb: dwc3: Use helper function
 devm_clk_get_enabled()
Thread-Index: AQHa/TXLIWvqjVV1cEKGXJ06Tds4VLJGoHEA
Date: Tue, 3 Sep 2024 22:06:05 +0000
Message-ID: <20240903220548.um62gpjhvrnfqprw@synopsys.com>
References: <20240902123020.29267-1-zhangzekun11@huawei.com>
 <20240902123020.29267-2-zhangzekun11@huawei.com>
In-Reply-To: <20240902123020.29267-2-zhangzekun11@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CYXPR12MB9426:EE_
x-ms-office365-filtering-correlation-id: abad30d0-41e2-4b38-9412-08dccc649b1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NVRzYndNZ1ZaWERhY01TdUFJOVY4OGxKRGRqQVhMU2xvS1dlUURuV25Gd1JR?=
 =?utf-8?B?cWl3QVBma3k5dS9MOVU5OHJuRnZjOXBwQWQzK1hyUlBLUGw5SzZ1VnFYR3Rv?=
 =?utf-8?B?ZGw1U2Q1YndKeExBd29PNjJycFo1WmRNYStMcDVGaUtCSTlkdlBvUUdKdlg4?=
 =?utf-8?B?OU9BeXBSVUVJa1NtRjVCcGpTbUVxUWg1ODVNbDZMK1FTS0RYSy8yR1FjbzJo?=
 =?utf-8?B?b3hIdERySEtjWEpsTE44azRqMTVHRGQzNCtvNmNJUkRibzB1S3dXSjJtazJW?=
 =?utf-8?B?ckNpVC9yeVJYQkk1M3VjWDVtRUU0L0tYM0cyUlkvamNSa01CdnkrbGd6dlBs?=
 =?utf-8?B?RjM1ci9aQ2RGTGlqcjFyOG1INWRGMWZ4YUVXWENzbHV1Ukh0UDRyQ0tJQ0l1?=
 =?utf-8?B?ZGF2S3d1RG8rT0pkOUZBcDgwRkJnZkVCdXdlTVNiSHVlb2x6cHExbDltL2lp?=
 =?utf-8?B?d2xBdHE2eWJ4aU5pU0ltQVlQSkJlajcyb2NpeUNNbnUvZWJ0UzhCV1V1bzJM?=
 =?utf-8?B?OEdDczVKMk5aUzJrQ00wME5INGhCTFluQWU4SlROVHlvUDM4dWh4aXNQaGVZ?=
 =?utf-8?B?MTNwZUFuZ0VvRnNveEdtUExvUTVYTGNBVjY3ZXo4WXhEQ3g2NkhVY1ZyMldK?=
 =?utf-8?B?RmxkTUdHODl6a2hZZDJYWTI4VjlFNm1CYUlSdEdLd0tmbGlMSkxEVEZ4UFhx?=
 =?utf-8?B?Sm9Ed1NvdDFpMjB5dGViUEE4cXhIZ2F2Tm85MU5GcnB0MGxNODZWS3dzVThS?=
 =?utf-8?B?U1hPS0t0aFcyWjZsMmdWc3NYVDB4OUVKVU8zM2Jlb2U4WFc3Y1U4eWFXNVlu?=
 =?utf-8?B?aXV4U2hpNEFNcnprR3dzSmswa2RqL2FEQ2RlNDBZbFJHWit1UzkxaDdJQW5E?=
 =?utf-8?B?SFl2dk9sdG1CY09zWlJ1ZGNvZVRRRWxSdzJFMWM2T1BDY3dZSmVLWkNFMDVi?=
 =?utf-8?B?bklKSFB1MmorM2tEVWZJWmZEYzNmTElPYlRxcVU2REdEWU9WcTdRQmRhMkI3?=
 =?utf-8?B?bE9mVHB3ZEw1dU42aE1ZS00xTm1QSnBhSWExWm9xZEc5blcyd3hGTWU2Skxt?=
 =?utf-8?B?WnkzZmMweVgrajZ2YlU3YkE2ZU5SazdHaHVGV2ZzTmJWUUZNUUJpUHVCZXRF?=
 =?utf-8?B?YnNqSmFmdHluNGpYYUdwSE9KUjJ3Z2RMdjNXSmhyamJ0OHRvZFIydjc5VzdT?=
 =?utf-8?B?SnZoYmV1RDFpVk9FTUJFZGkvWVZJTUVPcmtpS3dabFN6YXlENlgrQytHc2I5?=
 =?utf-8?B?ZnBjaEJjcUMyejlKOFVqTUJxOFdSaU5hMzlnNERiNGpGY0tMSEVWUVNrb2x5?=
 =?utf-8?B?S2Z5MDdtUXd5WGxOTlYwUXJvV1lyMWt4eG4wU01DRGlUMjZXdHZwNTREYlVF?=
 =?utf-8?B?NFFKMldycGdFeWhSMlV6SXRMRlREZVZINk9sRDllTHpwTTJKQnkyTU1LeGhu?=
 =?utf-8?B?ZFJLVGtVaTdJRXNFZWdNT2h2TnVrYnVQbEdhUlNSbmJJV0Fsc2tOYUgyQVNS?=
 =?utf-8?B?MEpqdWREa3hBUUsyOURSaEhBTTFCV3VhMXVnU3BKdmdPZERHSWF5RkpZalg0?=
 =?utf-8?B?R1kxTE9iZjU1ckVNMjlUdWp0RVdiZFRRVGkrZkNFcjFndG9DbDRhR1BxNlFF?=
 =?utf-8?B?YTBqZzlwL05jUFR1RXZKY3pMbnZQMGFsRkM5S0hwZHJNam1XdzlvR1pFZUJa?=
 =?utf-8?B?NUQzaGkwaVB1R2w3aDJTbER0TitOUWlmbUw2Z3NQR0QrRHVKMXR0NWxUNHc4?=
 =?utf-8?B?QmxNSUFha3BqVUw1SlRrWFF5T2hpMUtZQi9kdmRobHMzM2FnMUEyVk5WRFEx?=
 =?utf-8?B?cG8yMmRVaHN4bkhyVHRhZ0pJb1JSeVBaOENxTkRzMWZZYWM2aFU3dE4rTlM2?=
 =?utf-8?B?dVAvQkgrWmlqUmU4OGdTdm5MNnhhcXpuOTFRY1R0ZHVSR3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QTRVNmtPY252bWtBNWdlMXNjMWpXREJIeTduK0gwTW9tTWZjY3hrdWoybXhG?=
 =?utf-8?B?WHBBK3d3bThmWmxWbVkyRWV6K01iejVlSEU1OXVhbFJjaTNRQkk4QzgrbENr?=
 =?utf-8?B?VTJxdi9NQzdhZlcvMENmTk13eWVGNE9OOXJTUk1Gbm8wWG1DTlFQZzZRdUNh?=
 =?utf-8?B?cndEV0xwa0dITVZyVHExNWxLM0tURnNhN2hYQy9oZCtrazlaM1I5eVA0UUdX?=
 =?utf-8?B?eXlLeUJ3d3FIa1lnMWI5TGZNalhEZXFQWFByazJpWmUyaDRMemcrdzB2NjZx?=
 =?utf-8?B?QXZLSEw1dG9YNGlHT2FQc2hVY3R0RllSQWhjOVFVcFFWYWhHUW5zSU5NUEkv?=
 =?utf-8?B?NU5OM1BkbWI0cU50Mm5tdnRFYlNmTUNIWFM3VklScURaa1ZFT2dEcXZLYjJy?=
 =?utf-8?B?d2NTSkxTTGhkMytVTFQwTTYvbWdhem5tOFFoTUxtV3RWelZFS0tFNzBzRHhD?=
 =?utf-8?B?a1J1c2dIU1VFbEYzUlduWmIxT3UwQTdHNVcxV203Qi8rSVFSdVFjZnRIOEFU?=
 =?utf-8?B?aXJiUDVvSEZWQkJmRWhKMnRuQWJiRXMyUDlGVncrOE1QUUhkZW9KcU9aYVFF?=
 =?utf-8?B?QXBqQmxlVFZSMUJzeWYwODhMMG9jdDVmT3NZeDZEZzN3cVZXN29UTHE4NXN6?=
 =?utf-8?B?U2tzcW4zeUg1a003dlVMaXg5T3pFaHBBY2VaUmJtdVJwanQ0Nkhjd0dMN2Jk?=
 =?utf-8?B?RmdZUHgzQkJBVm50MFhQYnhYZW1ITW9sQ2VmTnp0ekE0ZHh4SXRBMDArM09l?=
 =?utf-8?B?amxsUFp5dW1qMzVhTEkwcm5ncUx5Sll2Mnhsa0xDMjArbnlRdDVVMEludllh?=
 =?utf-8?B?YU8vNWtGaHo4dnA3M3luUnhtZEplTm11MDk2dHBSRkswcjFtWDJUS1ByT2No?=
 =?utf-8?B?LzJsRDN5OWpLdTNrS296ZnNuSGFsaGJBRU5oaUgwaDhWWUcraFViZ1c4dHJk?=
 =?utf-8?B?ZkR5SVdkMk5WSE5SQ3FGN3YydXovZXlqdHBYQ1J6dUtCK0d4TUNTN1F4Z0RJ?=
 =?utf-8?B?NEgxa2VuZndZY0ZnVm1mbnpsUGVlWXYzRTRsVmtCb2txOEg5N1hraExQKzd4?=
 =?utf-8?B?VFkzUFovb2tkT2dVbEc5dVE3OEpuMm90NkY3OWxqcVVzYzZVVGJnM1c0Rm9y?=
 =?utf-8?B?U0w4N0oxTFVjOXlMQ1RrN3VQVW44eWdtQ3FaQ2V3SlV2K205VFE2QlhGa1py?=
 =?utf-8?B?L1lBSkxZMVpPOUgrZ2NaeVlNQVRsM3lxR2lSQ3VWK0NTREpFTjNIZTNodHI4?=
 =?utf-8?B?NjAvM0xseXUxVjNVSnBVdGhydFE4N0lndFBOeElMazVhc0JpYlNXek5JbllH?=
 =?utf-8?B?TWszU1pEL3Zjd3hRUEhoenZkZFM3akZrVnpVcFhocEY3ZnJ6bHhpTmEvdUdK?=
 =?utf-8?B?REc5YWtGak1kampTYWhBZTBGSkRJSnpjN3d5YkdWazNWcTJ2VGdCc3hTc21m?=
 =?utf-8?B?QkRxeDZZb1dVNW1pR0JINitIK0dmN3Rxb25oU2RMcHh1eDVvYTRSQ3QyN0hK?=
 =?utf-8?B?UU9kTTBGZWxIek81Vk5NTnRoSWd1bGJPbUhVbDM0OXVpaGk4ZzdvbCttUkhw?=
 =?utf-8?B?MFBwZFRsZU9ZQlZIYzZydGRucDRxL2xCL3NPcmx4ZkRLTnlFOU03T2R4TEFH?=
 =?utf-8?B?ZmkwWnNYRXVFRllGazdUQnNaSCs1aE1VT2RkUk5EYnlUSUFXM3M0RVJhNGN3?=
 =?utf-8?B?M2wzdDRETHdVQnI2TjE0Y0p5cUZLZXJhcmpGZDhVY0x5dnhBTmdYdVdFeXVD?=
 =?utf-8?B?MXYwQTBrTGd5NFZtd1FpZ0Y4czRrNndkaUMrTm40L2F3R1VneEg1UXRFVkg3?=
 =?utf-8?B?KzlYTm5pNksrdzlaMUlwKzBTVnB3cXBSaFRpWG56eWRsdDRKWXpBRjVwUnRG?=
 =?utf-8?B?bGtoM3VNSFFCTWt5bEZqOG9NNVZBQ3BkalNLZW81bkZ0SFVYUCtLRXBxeG9v?=
 =?utf-8?B?d2szeGcySlpYQ2RtOW5sL2JNU0NHOW9URVFRWmpndmcxaENhMWd0emNEWVRr?=
 =?utf-8?B?MjkyVnlBU2YrOFp3VFEya1ExM3l5b0lDTFhwODVLTnJRRW5JT2s4ZUU3TFJV?=
 =?utf-8?B?SEx4NDN1b21tcVdLQllhZXBjdGc1czZyemRsdmo4MklTYmFqOWdNdWkzelRM?=
 =?utf-8?Q?oEJ3qof4Iqi1Ds3ZRGWZ5HdpD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2F48C53A7C9C649967CDA59D127870D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ab870L3SJb+d7ZcuAAbK2b0OutwRwcgK32pIxIZMoD8ZevuY9JDfYbjCBBz/ZvH5CKbiHAqWA/HchvARhyNJH8vr/r1+efvgumlGT5Pw74tGJ8uJ5eFSmEGniCBtyAVVYvGRmd9HiArPlGmlyqzU3+3QDW/vd3yW3zV1AhJEXSWGAhH8swr/gl/juHG0vojT2rK4cSbglo/MzOUnLM3NB9NxNZX2JBfa3QOU28vtxi70Dy/+BSHY0E95CUXELY07aVaEQbeQQIYRWbZj4Vi0PJcU6IAu4dInAYoqbr2aHA5UtI3qFrHdtI93uflWPRLhZ1SppvKar1U633nF+K/pIM7V1Q28lKi3bEv3AGa3Fec/iOnWR8F+PpYqLs60pT/NyGmuLiXEkH01YNcseSQJSmQMVQsgpew/DjJhqz4weyUlIwX6ZrHq4qPZZ1+dKQHS0tq2eKu/EP4WbvUjCn2zYmC27d6zvglMAA0YJE4LiXviR9YoTvElfJ14hpr1fnM2sWzZJ7Mnt2rEvQwBefbiILyYijKO6Qx6ovBK5vwCa4zg8CvR4nRjd2dIsyrKx33ZeI0MbtvU08iuVV3RBdNSyC2xc4LBcK54FSUn5l556oE8Py08V4FhRfiIgHdgifvP/CH2lz2Cv4KPjfWQbBTLrA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abad30d0-41e2-4b38-9412-08dccc649b1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 22:06:05.0388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7gXMQDN6Jqs+xrGzhc78hFCH9wFET10855O1ckLa3morH7+m4QRZevVxirWtOstrefkJl28AeT7Mymca0666mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9426
X-Proofpoint-GUID: o6pUvjUTRyhNSIhmylDIv_zFuMzioyhm
X-Proofpoint-ORIG-GUID: o6pUvjUTRyhNSIhmylDIv_zFuMzioyhm
X-Authority-Analysis: v=2.4 cv=X9YAK3Te c=1 sm=1 tr=0 ts=66d78855 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=nEwiWwFL_bsA:10
 a=qPHU084jO2kA:10 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=-3aGT-0fjD-ST9cmWuIA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409030177

T24gTW9uLCBTZXAgMDIsIDIwMjQsIFpoYW5nIFpla3VuIHdyb3RlOg0KPiBkZXZtX2Nsa19nZXQo
KSBhbmQgY2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FuIGJlIHJlcGxhY2VkIGJ5IGhlbHBlcg0KPiBm
dW5jdGlvbiBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpLiBMZXQncyB1c2UgZGV2bV9jbGtfZ2V0X2Vu
YWJsZWQoKSB0bw0KPiBzaW1wbGlmeSBjb2RlIGFuZCBhdm9pZCBjYWxsaW5nIGNsa19kaXNhYmxl
X3VucHJlcGFyZSgpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhhbmcgWmVrdW4gPHpoYW5nemVr
dW4xMUBodWF3ZWkuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAu
YyB8IDQ3ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMt
aW14OG1wLmMNCj4gaW5kZXggMzkyZmExMjMyNzg4Li5hN2U1ZWU3OTdhZTcgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9k
d2MzL2R3YzMtaW14OG1wLmMNCj4gQEAgLTE3OCwzNyArMTc4LDIwIEBAIHN0YXRpYyBpbnQgZHdj
M19pbXg4bXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAkJCXJldHVy
biBQVFJfRVJSKGR3YzNfaW14LT5nbHVlX2Jhc2UpOw0KPiAgCX0NCj4gIA0KPiAtCWR3YzNfaW14
LT5oc2lvX2NsayA9IGRldm1fY2xrX2dldChkZXYsICJoc2lvIik7DQo+IC0JaWYgKElTX0VSUihk
d2MzX2lteC0+aHNpb19jbGspKSB7DQo+IC0JCWVyciA9IFBUUl9FUlIoZHdjM19pbXgtPmhzaW9f
Y2xrKTsNCj4gLQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGhzaW8gY2xrLCBlcnI9JWRc
biIsIGVycik7DQo+IC0JCXJldHVybiBlcnI7DQo+IC0JfQ0KPiArCWR3YzNfaW14LT5oc2lvX2Ns
ayA9IGRldm1fY2xrX2dldF9lbmFibGVkKGRldiwgImhzaW8iKTsNCj4gKwlpZiAoSVNfRVJSKGR3
YzNfaW14LT5oc2lvX2NsaykpDQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VS
Uihkd2MzX2lteC0+aHNpb19jbGspLA0KPiArCQkJCSAgICAgIkZhaWxlZCB0byBnZXQgYW5kIGVu
YWJsZSBoc2lvIGNsa1xuIik7DQo+ICANCj4gLQllcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUoZHdj
M19pbXgtPmhzaW9fY2xrKTsNCj4gLQlpZiAoZXJyKSB7DQo+IC0JCWRldl9lcnIoZGV2LCAiRmFp
bGVkIHRvIGVuYWJsZSBoc2lvIGNsaywgZXJyPSVkXG4iLCBlcnIpOw0KPiAtCQlyZXR1cm4gZXJy
Ow0KPiAtCX0NCj4gLQ0KPiAtCWR3YzNfaW14LT5zdXNwZW5kX2NsayA9IGRldm1fY2xrX2dldChk
ZXYsICJzdXNwZW5kIik7DQo+IC0JaWYgKElTX0VSUihkd2MzX2lteC0+c3VzcGVuZF9jbGspKSB7
DQo+IC0JCWVyciA9IFBUUl9FUlIoZHdjM19pbXgtPnN1c3BlbmRfY2xrKTsNCj4gLQkJZGV2X2Vy
cihkZXYsICJGYWlsZWQgdG8gZ2V0IHN1c3BlbmQgY2xrLCBlcnI9JWRcbiIsIGVycik7DQo+IC0J
CWdvdG8gZGlzYWJsZV9oc2lvX2NsazsNCj4gLQl9DQo+IC0NCj4gLQllcnIgPSBjbGtfcHJlcGFy
ZV9lbmFibGUoZHdjM19pbXgtPnN1c3BlbmRfY2xrKTsNCj4gLQlpZiAoZXJyKSB7DQo+IC0JCWRl
dl9lcnIoZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSBzdXNwZW5kIGNsaywgZXJyPSVkXG4iLCBlcnIp
Ow0KPiAtCQlnb3RvIGRpc2FibGVfaHNpb19jbGs7DQo+IC0JfQ0KPiArCWR3YzNfaW14LT5zdXNw
ZW5kX2NsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKGRldiwgInN1c3BlbmQiKTsNCj4gKwlpZiAo
SVNfRVJSKGR3YzNfaW14LT5zdXNwZW5kX2NsaykpDQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2Jl
KGRldiwgUFRSX0VSUihkd2MzX2lteC0+c3VzcGVuZF9jbGspLA0KPiArCQkJCSAgICAgIkZhaWxl
ZCB0byBnZXQgYW5kIGVuYWJsZSBzdXNwZW5kIGNsa1xuIik7DQo+ICANCj4gIAlpcnEgPSBwbGF0
Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiAtCWlmIChpcnEgPCAwKSB7DQo+IC0JCWVyciA9IGly
cTsNCj4gLQkJZ290byBkaXNhYmxlX2Nsa3M7DQo+IC0JfQ0KPiArCWlmIChpcnEgPCAwKQ0KPiAr
CQlyZXR1cm4gaXJxOw0KPiArDQo+ICAJZHdjM19pbXgtPmlycSA9IGlycTsNCj4gIA0KPiAgCWlt
eDhtcF9jb25maWd1cmVfZ2x1ZShkd2MzX2lteCk7DQo+IEBAIC0yNTksMjUgKzI0MiwxNyBAQCBz
dGF0aWMgaW50IGR3YzNfaW14OG1wX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ICBkaXNhYmxlX3JwbToNCj4gIAlwbV9ydW50aW1lX2Rpc2FibGUoZGV2KTsNCj4gIAlwbV9y
dW50aW1lX3B1dF9ub2lkbGUoZGV2KTsNCj4gLWRpc2FibGVfY2xrczoNCj4gLQljbGtfZGlzYWJs
ZV91bnByZXBhcmUoZHdjM19pbXgtPnN1c3BlbmRfY2xrKTsNCj4gLWRpc2FibGVfaHNpb19jbGs6
DQo+IC0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGR3YzNfaW14LT5oc2lvX2Nsayk7DQo+ICANCj4g
IAlyZXR1cm4gZXJyOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgdm9pZCBkd2MzX2lteDhtcF9yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gLQlzdHJ1Y3QgZHdjM19p
bXg4bXAgKmR3YzNfaW14ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ICAJc3RydWN0
IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gIA0KPiAgCXBtX3J1bnRpbWVfZ2V0X3N5bmMo
ZGV2KTsNCj4gIAlvZl9wbGF0Zm9ybV9kZXBvcHVsYXRlKGRldik7DQo+ICANCj4gLQljbGtfZGlz
YWJsZV91bnByZXBhcmUoZHdjM19pbXgtPnN1c3BlbmRfY2xrKTsNCj4gLQljbGtfZGlzYWJsZV91
bnByZXBhcmUoZHdjM19pbXgtPmhzaW9fY2xrKTsNCj4gLQ0KPiAgCXBtX3J1bnRpbWVfZGlzYWJs
ZShkZXYpOw0KPiAgCXBtX3J1bnRpbWVfcHV0X25vaWRsZShkZXYpOw0KPiAgfQ0KPiAtLSANCj4g
Mi4xNy4xDQo+IA0KDQpLcnp5c3p0b2YgS296bG93c2tpIGFscmVhZHkgc3VibWl0dGVkIHNvbWUg
Y2xlYW51cCByZWxhdGVkIHRvIHRoaXM6DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11
c2IvMjAyNDA4MjcwMTI2NTEuajJjaHFibGtqaGEydmVuZUBzeW5vcHN5cy5jb20vVC8jdQ0KDQpC
UiwNClRoaW5o

