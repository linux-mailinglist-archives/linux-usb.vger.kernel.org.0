Return-Path: <linux-usb+bounces-19801-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA99A2032D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 03:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EF7218862EA
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 02:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF4718CBEC;
	Tue, 28 Jan 2025 02:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jzRpMFML";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QkhEwTko";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UJ0hIq1i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF898189BB5;
	Tue, 28 Jan 2025 02:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738032013; cv=fail; b=hTCNZ8LyutnKEuE2436dNgwhJ9NcIu0Wv0gzm3qs0Ayx9/Awo04yu7u1n5w2lfMPNcPput9FZj3LCxfuwoJD7WmJmHLGWJK/fXw+yeh5qAYubZYE66+RIAVksUqQb2QuLfvbbqfFcn6wrbyD5if2S2nPRNdDg/BFp00/DLvPS+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738032013; c=relaxed/simple;
	bh=lBLTetqbqLUKcARj/Bo8A7Fzqt6BsUbOjCq/lD30ycc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hqf69djxOE9meEV7dNPxOLQtjX/HcLrJmZEcgH386+Uhg5oNOArdBba6XZpEhOK/COn8MvQ/3rpBUPExzdeea2g1o1dXuTouZZ58K4tZBZyp8JVlC8CvB6jKstasHQ7T4laZfeNllNyY70Rjq5Ve5bSceUxHDfYsBYwE/TAz/EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jzRpMFML; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QkhEwTko; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UJ0hIq1i reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RMMi0A031973;
	Mon, 27 Jan 2025 18:39:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=lBLTetqbqLUKcARj/Bo8A7Fzqt6BsUbOjCq/lD30ycc=; b=
	jzRpMFMLX91khjOZfq3sz71HK4j+OHafwAQEbEcyqyhmmkzVw4nqoX8M5s49WmUz
	pSD77X0DjdqeJFLgwONZf+TqjSSN/fnUWm/1lq62lp8jIbOdc9KeoQceptV9Uocw
	+vghzbeIZTAETsN6bEUBFyI6EHFPkMX6PJYmSQwBqKMC4ynAaErtpP3P181cxTCI
	CWG8G1R4xNnOmK50m+MVSO9EU7KPx9+x4y/5+wenJK/8L+B8tSW5xFZ2U+gp6N0w
	f1JflP3nAAJr+4KHVxZ4eWN1nw2VPbj+jn91Mxsd8CS1/q5q1hcMP82+VZ+gosZw
	1VYUvyOZp7fm14Q+24H1ww==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44ejvtrrxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 18:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738031997; bh=lBLTetqbqLUKcARj/Bo8A7Fzqt6BsUbOjCq/lD30ycc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QkhEwTkotiMm8TKrfCwyMQJZNF0Hy4Z4WBpvdyW1/4yS14/tfrCOjvZMattoNEZId
	 n7XuqvskJ5/iaUBx87hakVNoclw/FI/IsIOIBC0LDSfLGgAYJqzq+p/F8b5IR6etB+
	 C7RbORMNVHV3YQQLv1mRPbsO+SFGQk4e0wikLUvWu0AaxOLSOmokpcvLsZip1RERlE
	 9ofxpq6rNhQp9yLFz0HcYSNEZLozWek7J6rSa9THzuH8b9MEc5906rn1ri4ZJF43Bu
	 9lhQMS0+wF348gZq0y2oDxYtdvFs1UeSxmwkSGA0h3gzdRswzHKMJeSFesEt7utL+b
	 oxHU6FRluOOVQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 26A5E401F8;
	Tue, 28 Jan 2025 02:39:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A63A7A008D;
	Tue, 28 Jan 2025 02:39:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=UJ0hIq1i;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A5E6F40112;
	Tue, 28 Jan 2025 02:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDTtDSdB7tBvRBSVzXwDopq3XJwTsETLZxeXqMoL9e5FfX/+rHw2skUYhlML4mdtmir8/Mkki/idwzStmvXSKnsL+BsK7GFZ0A7krS0eyJ/oBkC7WB1bYDX8M8V0U6wXfJp4td87FYgqkjdgWDrGCU8LWdzbB3KQczCNTxk4rW4jX138CbeQjC2AtZqhiq2Lr5MTkoz+IW9F3Bl3JiEAs28Vgqz03m6XSJYWojR5MQ29aXI5aVzB3TGGhYyNGDiNNV+cR4QrX7KtLerPoCfA4GuTwUCO5o7FKR8A6dgHylVB7hZAO88agA4GJ067lTu4/fwcpzvmjC3+0hduLdJddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBLTetqbqLUKcARj/Bo8A7Fzqt6BsUbOjCq/lD30ycc=;
 b=svGIZxEhLu5B1VsajOcT45jjtnD15itT8KOldgjtEjhhkW5DweGUFQikm+FZSQ+xLg4IGD6DRH3SoYMN68elHNUkqDvjKXHpRjcCJplOlin14CG9ENiVfEhijJckfuKkkQb2QMXs2hQiFdy3ry8eQMWIRumZVSOaMk3JBmA0tcQBXYe0c5+BV1e6NIrvblmLZiwdJDEv5iXGKdFuG7eBDVCPf3mx/Zu8MbtlNKb8sudizVVmgnq80V4aRlK5/CrYNjmmeqr4QCA2Kzso7auOgaseX5K0GoxmdqTG0lQT7NMVbrz4abDK4zEDfJIJIrYy2b6Er2d0F3nKAyHlMIizQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBLTetqbqLUKcARj/Bo8A7Fzqt6BsUbOjCq/lD30ycc=;
 b=UJ0hIq1iAX2Tu0yTiEMK5YDHpjsN9GnoCDGTr6pxEcmkaJHoFGMrsgax8+TKs+hN2xue02r4Rx6xi53rsmZG0z0FyR0yP+EKMAixwsxUBTUbSm1nyuOlnNjMyAhZB8IHIS4ShnD/ITr2RUXcAMXoaff6FvNoztQV0imotKDTNPA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 02:39:50 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 02:39:50 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 2/3] usb: dwc3: gadget: Add support for
 snps,reserved-endpoints property
Thread-Topic: [PATCH v1 2/3] usb: dwc3: gadget: Add support for
 snps,reserved-endpoints property
Thread-Index: AQHbaC0cpC84VeNkokazhZuYFimpJ7MaDjKAgADp6wCABxWwgIABA12AgAh6QYA=
Date: Tue, 28 Jan 2025 02:39:50 +0000
Message-ID: <20250128023943.spxp7sv354iusrkt@synopsys.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-3-andriy.shevchenko@linux.intel.com>
 <20250116233507.sifqs5u3rixoz4lw@synopsys.com>
 <Z4pb5CTS5n5wtJ7d@smile.fi.intel.com>
 <20250122014347.fc3ntfkl7cismjxd@synopsys.com>
 <Z5Em5bvAwu8QgRo8@smile.fi.intel.com>
In-Reply-To: <Z5Em5bvAwu8QgRo8@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SN7PR12MB6838:EE_
x-ms-office365-filtering-correlation-id: 7f642f80-2eb9-4b35-ef81-08dd3f4509b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VGN6aFZKdjRTUGlxTjkwTHJXS3NPZ096UzRWOUptM2IxRVpwajBtTEhHSC9F?=
 =?utf-8?B?QzBIRUJUSkdNdDlzMkJjZUZwdmV2QjNmSGIyRml2YkUvTGY1RFJOWkRMQm5W?=
 =?utf-8?B?ZE1EVm1xTXFpZG5QWldnWDQ1V1VxcUtqY2c4cXp6WUdSVjZUNjJUSW43bExH?=
 =?utf-8?B?M3p5SDFVQ1BDZ3FhY2EyeVYwZGhydkpBeElUd3Y4TlpsS3M3UE9GZGVNMEdx?=
 =?utf-8?B?cnNmc3czZUR5dEtPcmxWNi9iYzRJZWY0YlFNeHo2bnVWZkNCM2o5aUcyZTdv?=
 =?utf-8?B?OWpuSldiQ2VFYWtRSFN2T3hkWmR0R0FtZzBXMGYwS01rakZhTVlQNGRwU0ky?=
 =?utf-8?B?alJUeDZFdHMyR0ZxOFp2MktoMXdHYTBiZ28zTW5WaEZjWG1MUDA1YVgyd2RI?=
 =?utf-8?B?MUdKVjhKS29zeEFMUnBYc2gvcFJFUU5OcXZjNGJDNGh2UDJERFhHZWZ6Z25i?=
 =?utf-8?B?dURRR09qQ1ArNUxDS3QwK3QyYWllZXRoZGJTQTVsTjBIRzhKdGVDUVJCNXBQ?=
 =?utf-8?B?SHUyUnppRE5TREpvUzV6czlwSzd6czdlQWJVNXhEUUZ4dGxoQWQ1dU81NlFU?=
 =?utf-8?B?c1NMczJ0bmRDcGFWTDJ5NlBUajF1bDZ0eFdoZjFGQlE1aURWa3lUTzl3VWdE?=
 =?utf-8?B?T1pJQUxYVURRa2pKYmRZLzlxUktINGZzcjdDNGNXQnJ4MVJBa0grZU0wbTVB?=
 =?utf-8?B?R082L2lQRVRwQitqNDJFS3d6WnJDOFJzaHFwM0xOTmZLWmlidEc2YU9QK1NH?=
 =?utf-8?B?Qm5PNlVrOWVRbk9pR1o3ZEoxL1pEMXd2ZWphWFdxQjVJSTFBSGlHSlVRWXlq?=
 =?utf-8?B?M1VMRm5jNnZSR2NOYkNncCtjejErRUxBV2VKaWVKcmNPN04vcE9VSE5tVWxT?=
 =?utf-8?B?R09MVWkxR2FJWFE1aTQySFZQWkRpdnBvdnpIcmVZRFJKY2hScktlVmxxbEo3?=
 =?utf-8?B?clgxUk51WmdobFpDK1ZBR2w2bFM2N051Wi9tNFFlNk5hSCtPeEVWVGFIMmNt?=
 =?utf-8?B?S1RKemh4NjZnaWJZSjB0V1lLdU1JQnlDYW9jdm83U1dYamJNSEJURFdTU00v?=
 =?utf-8?B?VmRtdXlTQUFLMk4xcWNwWkx6QXdlYUNFWUVGN1FwY29DQzYwQTdEQnZDWmZ5?=
 =?utf-8?B?QU1VRXVHaEVNWlFrRkkwWnU1NGwyTG8xT2xrSWJTV2tKWjRBYyttelVySUtP?=
 =?utf-8?B?d2xpeTRPcWVYd0Z0ZWJTN2dHVlM3MHJaeDNVV2ljejBFeWUrb1ZKK1E0TndX?=
 =?utf-8?B?bkVSWG1CWUwxdkIwTUd4bGNXNXUxVWVEOUY1N2R0c0s2OE5RRjcyZjJCNkJ1?=
 =?utf-8?B?WEZNaDZodkd5SXFyQmh3dWRnaTJKTFlpSEM2QTExT2pZS3lFNEY5YTFoZHor?=
 =?utf-8?B?aHJGc0g2amRoNnZFaGE3VWpRaENHRWpuUFpzRGpmQlExY09qeEVScS9aNTcx?=
 =?utf-8?B?K1htNWFyUHVJeXZFeFV1bzMzOVpqNDlEdVFFcjhZOFd6MUpsLzBwWjZyZndz?=
 =?utf-8?B?cExjTklNWEhsSTFSV0NsajM5bE8rclRsT0hoRG1aRVNTbmxkNWZVMnowOFVR?=
 =?utf-8?B?aVNHY0h5MnUxMzh2NkdCc1RGcnA2MVU5MFcwdEdVcG1xdGRWVW1NemRiVVNZ?=
 =?utf-8?B?Zkh5SndVSnR6VDRKd0gvM3YxY2lqZkJ2MFdxbjBram42cVQrUjJVS2JhbEtW?=
 =?utf-8?B?SGdOWjhnWCsrUjNJalRhMW9uWlZOb3lTbWdDNmRRVHVBb3FiWWN1R09NUlBC?=
 =?utf-8?B?WWwyZ2JqdFJYVEVJSFRBWm02SU90YlVaSTZoOXhPd3lGRUdCZUhyWjlnWDdl?=
 =?utf-8?B?V3pDOXRvd1ozc04xRkZkWm05ajgzdUVHRmV6amV6a2h6ZVBDMXFqWFZJTnFU?=
 =?utf-8?B?Z1AxaU1SaFVxelYxR2ZHVUJVVUJ4clM2SjdoY2pwY2ZlU2NXQ1ZDQkJuSkdB?=
 =?utf-8?Q?Q8QjUOEB2A4AUDpRhLMoER5yemtBPtpL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T25XaTBSWlJ1ZGJrK0ZLVG45OG10Zm9ZclhqNnBDdUR5VlJpc3pGZlg5NXBN?=
 =?utf-8?B?bEtKZXRaSzJadnpRVFFCbFNMRGwyZWdDYmkwTENzTE9mZ24rV3Z0cHo4eVdk?=
 =?utf-8?B?WWpnOU5teHhiVGxSQk9MYXIvcmdNbzhzQ0hoRUlQUXZXSDl5Y0VLbU52WEhU?=
 =?utf-8?B?dEZUWXZBRStlSVg3TDdrU3ZvQTBVL1pydnQyK3Yyamp2KzQ0NUdTOVdhMmZE?=
 =?utf-8?B?ekFlT3U1M2RBeUZJOGhMbFBWQTMzdU9kVHM2VmVmQ3IwVUlsU2dGTTNRbFdk?=
 =?utf-8?B?dUJxQ3hhRU1GZVlOYkxDUVVIeUJwNnlZY2p5eXp6Ym5oVkJHamtJS1VYL3Fk?=
 =?utf-8?B?T0dMSG10R3RwVXdHeXZVRGxSZ0FJbW1RcGVCaTg3K3ljUUdUUCtLME9oZTdK?=
 =?utf-8?B?L2xMZk9JUCsxeGZjeUxTNzA4amcwQzV3Q0ZFTVZwNGVMS095UG9iQmQrMWVV?=
 =?utf-8?B?bmRzblFnVlpHb1ovbWR2Z0FnUUpuZFFjak5jNzNpZklCRXJwT1RmZ0hPUE42?=
 =?utf-8?B?eVpMcFNjcnFJMGxOZWV2UFg1bHdyZTdGUDNxVUtBOTBsZnozTzg5Y2xPZDFH?=
 =?utf-8?B?dEduU1ZpTmU2QmxNSm1abjBQWjNtb3ZiQTdEQUQ2SDRRbEkrbExCaE9HbWtC?=
 =?utf-8?B?V1NyaGNtQlFoNFdYYjcxS2puK0VoSlkyTFdNLzRzNE5od0dyalBCaGI0dmVo?=
 =?utf-8?B?cmNpUm1NcENyYlBXaEl5TTFRTUl0WU5zMzB4SDllK0NJN2lFNHBzVFJQYkxh?=
 =?utf-8?B?ZGNsVjh4Z1lBRHJiY2JWQmI4c2RzNnNBMGFDNXZhdklXQ0tJT2pMWUJGYm1R?=
 =?utf-8?B?NWEwKzMwOGxHS2xCSktob0dRRmNnNlFLUlB5KzZPYVFIL0h5R05IeXJKZUtM?=
 =?utf-8?B?aktJNEhOVzdraUliaEdJZTA3RkNnekEvcEJPTEcrMEZOMkhLNXNxUExtemYr?=
 =?utf-8?B?eU83cDFYRHBNRUtRVTVQNnI2THQ5UHllWXhTVDVVS2tkOVJ4bEpabzFnTnJD?=
 =?utf-8?B?TGhNcU5PY0JxLzlRK1lRQ1RyY2xCV213Q01IWVNQWndvS2V0L0JOOG1wakw0?=
 =?utf-8?B?eXdSakJnSHhpRUJKWU5JMktERkdTZE5jMUw2aUpkZldiNWVLSG1tbWN2NjBE?=
 =?utf-8?B?cCtLVmtrSE50c0VtNTY3RWFwK0tVeEVIK2F0MWhXeFluRFVySFViS29RZlU2?=
 =?utf-8?B?OG5Ba2JXRVo2OGFnUUJLOFVRa1dZa2pqa3ZYdGxwb2cyZ2ZBMGl3bzB3aWcv?=
 =?utf-8?B?bDRXTXViY01JUEhrRGdFckZkY3dMalFOMzJhYTV0NXNwMjg4QXpXTGRMaGVr?=
 =?utf-8?B?Z2Z6N0NBQTIwUGhpZWcyWVNrTHRiQ0pybnRZRkpvOWE2UFlCSnBydys0Zk5P?=
 =?utf-8?B?RFIxL1UxTlNGSXIvOGpjcXFMN2pLWE5PaE5FZDl6SE9FOWlxTStGU1B1R0lN?=
 =?utf-8?B?RWtFbE1mYkhjc2NiazlSWEdrVzBYVzZja3hXNEovSjJoVUVPb01acE5QR1dN?=
 =?utf-8?B?QUYzWk82UkY4YkYrbGh6RnVPbERrR1ZtWWxPUHJHaGp6QWZLRFBDRVM3ek1W?=
 =?utf-8?B?MEpkQm9PaGYrMkh6T010UXB1VTYva2xEWWo3bjVhV0R6b0xaMlQ0T204L2VT?=
 =?utf-8?B?cVU5dEp4Tnc1SUFIaWRnQmpKdjkvTS92bm1HZEJ6MWdHdmJHcnA4cVVOSmQz?=
 =?utf-8?B?UUg0M2twOTdKMjl6NWR3M3luekhvTUtXS3dIOGd1b3JsbFpoRHMxT2RJMlda?=
 =?utf-8?B?UHVrNlBrVlovMmdYTHVILzlzbWxoQVFWa2xCVCtaN3Jla2FDVVgyLytsYzB5?=
 =?utf-8?B?dW93S3czQW92T1N5OGtFSlJnUkRRQ2JaQUEyWTIyNGh1SUhSMFdRSGRTMEcr?=
 =?utf-8?B?czhVNkxnV3JiVEdDdUlhbkI2VzNESmZZNXZvRkFOTjBPUnN1M3JwRXhML0RR?=
 =?utf-8?B?YjMxdTZLQU9FM0RHZWFxaEtRWGFCaW1GS0V2Q1QvR1N4S0Z4RnhhOUd5OXRy?=
 =?utf-8?B?NkhQUUJkUDhqSjNNTzg0VHVkZEJ1M3RLTkJ2U1M2YmZKbmhidEFOT215dDBx?=
 =?utf-8?B?L3NaYTArbFR6WmhrM0c3dXIyVk5JS24xU1lSbE9IZEVjOVgxWW5sQW1oRWhZ?=
 =?utf-8?Q?Wgvh4cA9yGVmu/Y2RVF/A1VKz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8750C6FADCC704B98005FFC904E7A2C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XNfv1WVaa1xydznXrAxC7bH25UwgGlBYuszRF7BzmFFRTyFb1dV3xq3XOAYtNt/s6N7DgqjGeBZyJKEnr4Lc9s5cKSmN+PnFHKY8LjmeCRyyoFTkOnI92TdXZmUGv9LmuE0LGrwNNz/Mu+AQjU2zpaWQFCMCVZakZP/1mpNmW44yCfUvLzqgGJLxV6424dgt5EnNq9bUoctR/mIYplNvz1wcwVT+RTjft2j6xaZP+TNJhiH9HJDx4S8d22pCGArG/KWW0FTyLxJwkHKRxfel8D4zZMxN6sw6n3PggQ1dQ6+8GZwfFfcnAUPCAYqod6hwn5T6yv3J4ni1YxxrmDZ6jC2mAwHA2n9no6Q41VG6FCZG9cHZmYserq0ghwEUYGrIHgJUpSCE6vJVxyq5DBtwaXBVyxxXOfm70T6NEhuZYfHpPaJPPa6WIlmauRI7N7JzaqENu3HMt6DoRgcvrlE6QMfDfe8NbnwImDYrPujKI0TfCIaI+hpd1TZi7FLhr7+LVdm9pmMbzd8G8WRgiAYky3hc+4w8dPI1rZsMI354JCrnGQDxIXPWQDQMFcS1b+gvzfY6xaW4OhQ3HcR99NWNdgDB9r/luFy8EKRE/4DimYfGF/kArUzDNpkywUBsj35DUs2cvgopjq72EZsX/6JSXw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f642f80-2eb9-4b35-ef81-08dd3f4509b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 02:39:50.4652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y5nzyFjqvb+Qf7ZlVgZQtiKsspPOkAdfxnTQIGa0AuMNkvJemdUveXB0fVEZ4SckdppcQJ2CNtHFl4ogb4gE0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838
X-Authority-Analysis: v=2.4 cv=GpW4+l1C c=1 sm=1 tr=0 ts=6798437d cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=KSCX6fQqaUxJMffJPPsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: qpFfBwmBmcpfIk3XyWvrs_G066lNrHWX
X-Proofpoint-GUID: qpFfBwmBmcpfIk3XyWvrs_G066lNrHWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_12,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 suspectscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280017

T24gV2VkLCBKYW4gMjIsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gV2VkLCBK
YW4gMjIsIDIwMjUgYXQgMDE6NDQ6MDJBTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
IE9uIEZyaSwgSmFuIDE3LCAyMDI1LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+ID4gPiBPbiBU
aHUsIEphbiAxNiwgMjAyNSBhdCAxMTozNToxOVBNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6
DQo+ID4gPiA+IE9uIFRodSwgSmFuIDE2LCAyMDI1LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+
IA0KPiAuLi4NCj4gDQo+ID4gPiA+ID4gIAlmb3IgKGVwbnVtID0gMDsgZXBudW0gPCB0b3RhbDsg
ZXBudW0rKykgew0KPiA+ID4gPiA+IC0JCWludAkJCXJldDsNCj4gPiA+ID4gPiArCQlmb3IgKG51
bSA9IDA7IG51bSA8IGNvdW50OyBudW0rKykgew0KPiA+ID4gPiA+ICsJCQlpZiAoZXBudW0gPT0g
ZXBzW251bV0pDQo+ID4gPiA+ID4gKwkJCQlicmVhazsNCj4gPiA+ID4gPiArCQl9DQo+ID4gPiA+
ID4gKwkJaWYgKG51bSA8IGNvdW50KQ0KPiA+ID4gPiA+ICsJCQljb250aW51ZTsNCj4gPiA+ID4g
DQo+ID4gPiA+IFlvdSBjYW4gcHJvYmFibHkgcmV3cml0ZSB0aGlzIGxvZ2ljIGJldHRlci4NCj4g
PiA+IA0KPiA+ID4gQW55IHN1Z2dlc3Rpb25zPw0KPiA+ID4gDQo+ID4gPiBUaGFua3MgZm9yIHRo
ZSByZXZpZXchDQo+ID4gDQo+ID4gRnJvbSB0aGUgZmlyc3QgbG9vaywgaXMgdGhlIGxpc3Qgc29y
dGVkPyBJZiBzbywgeW91IGRvbid0IG5lZWQgYW5vdGhlcg0KPiA+IGZvci1sb29wLg0KPiANCj4g
RXZlbiBpZiBpdCdzIHNvcnRlZCBpdCdzIG5vdCAxOjEgbWFwcGVkIGJ5IGluZGljZXMuIEkgZG8g
bm90IHVuZGVyc3RhbmQgaG93IHdlDQo+IGNhbiBhdm9pZCB0aGUgc2Vjb25kIGxvb3AuIFRoZSBv
bmx5IHBvc3NpYmlsaXR5IGlzIGluZGVlZCB0byBzb3J0IHRoZSBsaXN0IGFuZA0KPiBzcGFyc2Ug
aXQgaW4gYWNjb3JkYW5jZSB0byB0aGUgZW5kcG9pbnQgbnVtYmVycywgYnV0IGlmIHdlIGFyZSBn
b2luZyB0aGlzIHdheSwNCj4gaXQncyBtdWNoIGVhc2llciB0byBzd2l0Y2ggdG8gYml0bWFwIGFu
ZCB0aGUgcmVzcGVjdGl2ZSBiaXRvcHMuDQoNCklmIGl0J3Mgc29ydGVkLCBpdCBjYW4gYmUgc29t
ZXRoaW5nIGxpa2UgdGhpcy4gSnVzdCBhIHF1aWNrIGxvZ2ljIGFuZCBub3QgdGVzdGVkOg0KDQpu
dW0gPSAwDQpmb3IgKGVwbnVtID0gMDsgZXBudW0gPCB0b3RhbDsgZXBudW0rKykgew0KCWlmIChu
dW0gPCBjb3VudCAmJiBlcG51bSA9PSBlcHNbbnVtXSkgew0KCQludW0rKzsNCgkJY29udGludWU7
DQoJfQ0KDQoJLi4uDQp9DQoNCj4gDQo+ID4gQWxzbywgd2UgbG9vcCBvdmVyIHRoZSBudW1iZXIg
b2YgZW5kcG9pbnRzIHRocm91Z2hvdXQgdGhlIGRyaXZlciwgYnV0DQo+ID4geW91IG9ubHkgc2tp
cCBpdCBoZXJlIGR1cmluZyBpbml0LiBQbGVhc2UgZG91YmxlIGNoZWNrIGZvciBpbnZhbGlkDQo+
ID4gYWNjZXNzaW5nIG9mIGVuZHBvaW50cyBpbiBvdGhlciBwbGFjZXMuDQo+ID4gDQo+ID4gUGVy
aGFwcyBzZXQgdGhlIGR3Yy0+ZXBzW3Jlc2VydmVkX2VwXSB0byBFUlJfUFRSKC1FSU5WQUwpIG9y
IHNvbWV0aGluZw0KPiA+IHdoZW4geW91IHBhcnNlIHRoZSByZXNlcnZlZCBlbmRwb2ludHMgc28g
eW91IGNhbiBza2lwIHRoZW0gaW4geW91ciBsb29wLg0KPiANCj4gTm90ZSwgdGhpcyBpcyBvbmx5
IGZvciBVREMsIGluIFVTQiBob3N0IHRoZXNlIGFyZSBva2F5IHRvIGJlIHVzZWQuDQo+IERvZXMg
eW91ciBzdWdnZXN0aW9uIGltcGx5IHRoYXQ/DQo+IA0KDQpOby4gV2UgdHJhY2sgdGhlIHRvdGFs
IG51bV9lcHMgaW4gZHdjLT5udW1fZXBzLiBUaGVuIHdlIGRvIGZvci1sb29wIHRvDQpkd2MtPmVw
c1tpXSBhbmQgYWNjZXNzIHRoZSBlbmRwb2ludC4gT2Z0ZW4gd2UgY2hlY2sgaWYgdGhlIGVuZHBv
aW50IGlzDQpOVUxMIGJlZm9yZSBhY2Nlc3NpbmcgZHdjLT5lcHNbaV0uIEhvd2V2ZXIsIHdlIGRv
bid0IGRvIGl0IGV2ZXJ5d2hlcmUuDQpTbyBJIGFzayBmb3IgeW91IHRvIHJldmlldyB0byBtYWtl
IHN1cmUgdGhhdCB0aGlzIGNoYW5nZSBkb2Vzbid0IGJyZWFrDQplbHNld2hlcmUgd2hlcmUgd2Ug
bWF5IHRyeSB0byBhY2Nlc3MgZHdjLT5lcHNbaV0gdG8gYW4gdW5pbml0IGVuZHBvaW50DQooTm90
ZSBJIHNlZSBhdCBsZWFzdCAxIHBsYWNlIGUuZy4gZHdjM19nYWRnZXRfY2xlYXJfdHhfZmlmb3Mg
dGhhdCBtYXkNCmJyZWFrKQ0KDQpCUiwNClRoaW5o

