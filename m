Return-Path: <linux-usb+bounces-18336-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E2E9EC0C7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EED6281652
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFAB8494;
	Wed, 11 Dec 2024 00:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QE609wo7";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F4wo2ghV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vGH4q6yW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893972451C9
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877143; cv=fail; b=VtWlOLpi+fk9f7PqXmnW2a0ASWc0/D+iGcBG2kX349WJReVIjP/04SJK41qJzYnwNJXCpleBG3m6M4CV9qjlj67Gn9DJ3jNzQTOLHi8S1IKyRJhHhAnHn4C+mtqVWZ0nOGGFAOp4/UNZG2+06V4mjbS906NKdD9rFq7SnZFlMsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877143; c=relaxed/simple;
	bh=6Ie8dfeBWuAM2l32hk+mtFAWUAyQ8/FR/emhPqGQrQw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LDCglm/5dBS9XGmcbDssqoM3L76gHolIVqof4fNry/IHlbhbeoSwrqqVcAJCCSaUUJuydiEDSztGS7oDZHH48s5ENFI0LEJwzsoxiyXuXnb4PTSK4Dt73i/uw71XA1RoJxAx0TaR+62kPh7NH6sbT8MRUZyAyEdSz6cSb1tOmbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QE609wo7; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=F4wo2ghV; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vGH4q6yW reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAM3qEC017428;
	Tue, 10 Dec 2024 16:32:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=7TMpmx8LT6zFJ/hHcI0RxmgtuPD0HGNsfDlrXczEJfE=; b=QE609wo7kYus
	ITtpqKffxSaNlRBw6tf+CyGNKMoBs/VyJbaK5GDb5fLUJdsRJuKwcQeUdqAIy6yb
	MVKgGBxrwBWjm7uYFIyTOZvQnDHjsgQpRmv925RWfJMTOw0xBs6hpWrR222+yO+X
	CmvXSJFWsic80JQ1+1NWlJDHwqzYPEa9MQ4pe6ZxfubhbPtvwlcswSmtLAUinpiF
	hnYGzBJ2NhxizsAhIw0XG7u7YXupUNWW++lD05OvHP4ElpSxOG2B7Rng7zlEHUAK
	GW2CvGFUpyrV6fqV0bJ6+A6lr+Pq7MInNAVOBKeqrszrm0KbFTzevnVvtnKRdYzx
	iDgXbOA82g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cp60t0x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877136; bh=6Ie8dfeBWuAM2l32hk+mtFAWUAyQ8/FR/emhPqGQrQw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=F4wo2ghV7+DKBLNAQcD1329BMTKFhpvuMAE8dahbgnKvlq0vBjMY0whuUOIF91pj4
	 n9NiO8U0HHpBk0i56D4hh6fR/fy9f/f+hMq+rHHpFeN7dJ7QnLETIKFIddDpVYAbqd
	 5ZAOFXE6157IRc4Om/5cIIn1OfOCbZ3Hp3PZJivi9nctaUWpwcG1iZrqhV9vi6xaCp
	 44mH+nTj5sHclbc4snr9EKUi48b1oi8gMacRX++T4f2BkGG5dOXJJKgrUD4L3xurKo
	 LYA6xaR9vD+DUrHDQ+1eWmlc+imsDMlQhaqaSzD0mrGuIBM0Zy/O387Z6GvXmlbpuE
	 81NWV8+2ZGEDg==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 984184024D;
	Wed, 11 Dec 2024 00:32:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 59018A0082;
	Wed, 11 Dec 2024 00:32:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=vGH4q6yW;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 141F54035D;
	Wed, 11 Dec 2024 00:32:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHFV0xrcL5SpY+wH5VXOrykHVPQQGAHGe6MNbd0G3Jw5Zb1+O7s+BJ7/D0vhhVx9/G5C8BgdNasTIP1ZDxluzoOVZ1Yc0ahCw7k4pNCpkZaXfAp9L+zAr0mq8HdWSQlI23sD0Wrpv/Z+OHnOL0RplczJXFvfKNnPkMZS0n6/vdbwWVGe1JH+E5kVQB/nWO5FI1FSubL9YN48Is297LlQnbi3Eh/dm0Y9xykvbIA9f9/MChLmnSUHduOH4drnRNbcS5znUfhcqVbg2vl4ZLBcxVQauy14svX59L4hdh6X5S+BpnRy7m1SZ0fyXZgmgQ83t0PXQHgzYiBzq54nIibs5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TMpmx8LT6zFJ/hHcI0RxmgtuPD0HGNsfDlrXczEJfE=;
 b=qWwAo6Lo6EKjUq6acHriRUi4X+NhBnIvgeYnEcOJjFnTGoQBbbMDMoIEIleAoSW0tmUjDnMx++7YiE5BR9q2nPJ9f19fmUPtG/nBVpCRNMMwd8CjvLsXrvcR5tM9sO8qBg5WzSe6FcLyleiqeQqDU9dYCQE5uEQMozZbif3rYW+MxSu3xAqqN70eH0IcUA3RYRj+hkUNZpgPHLyJlRkIFcoxgfdCNmP8mUduerD1R5ZzkWs+SPpw3Aw4AVTZm39Or6dqbmNVjnvKDpOGfdpcNBDqtCWCEJJ0jdV2w3je7AcesB/FY2AO8PWj/FBYnZOnn/qGignJ0iHDaf9MvMLISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TMpmx8LT6zFJ/hHcI0RxmgtuPD0HGNsfDlrXczEJfE=;
 b=vGH4q6yWlhoSbEH8W/EhXDHc6EFfFX3bwPwMtBpfi0byEaVwo4RLYgiXtmrEKb3MZ5Y1lPNKxW1Y5dVBE1JDjmQrqNCd6Pnt99MI8O1qQt4ewH9pg6GYaJOkfPQwwiLmDQukoLZPAl2NZDUmJgJPJo+p6NDZL2BJhasG2u9xfrc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB7691.namprd12.prod.outlook.com (2603:10b6:610:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 00:32:13 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:32:13 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 07/28] usb: gadget: f_tcm: Increase stream count
Thread-Topic: [PATCH v3 07/28] usb: gadget: f_tcm: Increase stream count
Thread-Index: AQHbS2Qf/Izf1MXWEUWZC5i51S0H8A==
Date: Wed, 11 Dec 2024 00:32:13 +0000
Message-ID:
 <23bf7f5cb04da691fd6ba0a77babee9ad3195f44.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB7691:EE_
x-ms-office365-filtering-correlation-id: ef5b6357-b608-4fad-1831-08dd197b41e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iHLyZktMvsrq3OQFOVVRhzJKMxXNSShLSi+Fg+nQvvlQlhfgbwlapOENaX?=
 =?iso-8859-1?Q?mc+1Ue1HlFy3Fj+K0r/+w6jzMNbOqnv7NTjn9kz7A+ldICpnpR2DDFkWXT?=
 =?iso-8859-1?Q?SyL+ZP4MGID8u++yqGG0XPIJHhS62WEWHaKEJZ/dzaragbPxoT0BHYMWsn?=
 =?iso-8859-1?Q?34kMcvptSYMBdQEgl2ac7uPmifhaw6C7lItF908mEmt7LQQBkRvEMf8ooF?=
 =?iso-8859-1?Q?fV+XYyJ+XLnl+oVBZPRC5xU7uwJAexA8T5pYZGOo56q6u4jyO57+FycQBB?=
 =?iso-8859-1?Q?L2t+3RGI+8i9MShRT81qY1P9AU3eP7MGCs5GUi2Y3fRN3a/V3x5D14vkiG?=
 =?iso-8859-1?Q?fvhHM86e7wrrU+IYOZJqnLfGLeyjwaHZrVE5jpxqhSqqu6qhsCt3NYqByb?=
 =?iso-8859-1?Q?MwqAqjE6K4JSDbYEXzyUhyF/pyjgZyY8fCIQ+AuEIsl7eZdrQWKyKi/ry8?=
 =?iso-8859-1?Q?X4lxLol3OSxtSY1uWAtyjxnzrPlvZQXWHTmE0txjjYB7ECOhwP1g2TKCxe?=
 =?iso-8859-1?Q?1aXJag4kG9i3VbLvRzKAdaI4eHv1gNCUtIzLBa34wDjcNvV6PZQKEa8Kuw?=
 =?iso-8859-1?Q?VFqsXfOGDxhJ32knD7yTNgRbWQ0CCsoigMveF+vyzbbxSPRmCctlrLYUe9?=
 =?iso-8859-1?Q?YovscSsXRaGBBqfIVEusyxeFQ8T1356o3WhYa5SxFTH28QIxHp4Aozrd2T?=
 =?iso-8859-1?Q?qcMdywIEQdBhtcCxtUHb5XyfF9tpDq6EVejVEJqGsPzdzPHW+Kw1nf9T13?=
 =?iso-8859-1?Q?oG6AJfNR7VRlmy+61bXYPCNYCfYeWClu6haDNDLF7dMVuKi4WwSF/9pWZr?=
 =?iso-8859-1?Q?iQ1phBqlVS+V0Jg3aSXSJag7tGVK8VXBX8RtSlgOe5RFncka7yj5UwmnU/?=
 =?iso-8859-1?Q?FdwqBxNlZUlbVpzRyLrvGL7F0kvKTaDl0ZQNwj0ZouhxXROnLmOMYn1kf0?=
 =?iso-8859-1?Q?QjlsdWTc9XhTDoxWE3RV2bfEdp1AE0/uv82C3TbOm6DfRgzzt3T+ychR6l?=
 =?iso-8859-1?Q?+7/DTmhBRtn0X/8bsFzZxY7a+dhdxBl0NBwCllHA8lGoYd9PuMgssLHIla?=
 =?iso-8859-1?Q?ekX7Yzr1+XQeqP8M90J3yXDdr526i2nduhH4rsDQVjMWfHylXW0b93w9hV?=
 =?iso-8859-1?Q?BNyjfcZVJOP2KFxHsVJmPxr2mEN3xWl40tShVDoPt1t2iH/2nLQbI76VOu?=
 =?iso-8859-1?Q?byRlyMOfmXdm9YUprZ09HFLe93uGOZTD27Ea5OxHl03lmsbuAUoaHxCVOS?=
 =?iso-8859-1?Q?PICbWPQaqWRqdLrn5WYHKYFA8o9Z0jTym2h+gSDcj8YqCU5NrxZHzx6h3D?=
 =?iso-8859-1?Q?EWRicfwGCNZWrT+8TWT/tshEyHXdxyj0TtJSPYBrQxIamvUZVxrDXrB0Ir?=
 =?iso-8859-1?Q?ZNX8NTz8AtNO88QHt5clX+IAlEmAQL/u4EQp7JGpglx/sS0f8zCrBHm6u3?=
 =?iso-8859-1?Q?ld5izGGJ12CI+hpTt/NVvYYirclXghf8oaR4ew=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hI7u72meD1F5oPt1DYWvO0oKTigAUSvTqqzzf1TxERg190gJidaGWbcbMz?=
 =?iso-8859-1?Q?n8Nvp3mjBIjVOCDF3jTgdzkbidu38MDw8DDGgEi0DKGCINb3JFfmZ1rDv+?=
 =?iso-8859-1?Q?/TUfySyxx2zrE1OSg6zU7+vpQH678qcu493RLT7sgt0MQVpU+Rt6xzliUx?=
 =?iso-8859-1?Q?jajJVJHpORrL5jPXXV306ECp8KHMxSM2fE5RS/IODDnRKMM4EmOsReU2aZ?=
 =?iso-8859-1?Q?GZi4e79MahgG8KCiqXoeS3uLQPtm/LzFxAiaPIqAJErW6ROqpEri0mcKR3?=
 =?iso-8859-1?Q?UmmNMifrk1Olff3WdV8p76azJsyTq3pzp0Y3DpHzpDFgHzvWtc9iW6k/9C?=
 =?iso-8859-1?Q?pL+21QKXoFYLjDUkeFsgBgZ6ukhJRet7UCgw+f6Z85PQ3fN7c01ggL8pEq?=
 =?iso-8859-1?Q?o4/Axv021rIblCdnd8NyfZG/aDECKQD2oansX3QkOhp43p1ncQBk+YGW3O?=
 =?iso-8859-1?Q?BBIWNPeGMs4F8UIF89fhl9eNCvFQ8KdgBrJkJyDgK9ycxYHuP3x3lXy2O4?=
 =?iso-8859-1?Q?DZcE3HnDNag7/H4vUCk1F56PqfvYS9GryaMyLkUtbf9svYMlXTDp8XnAJz?=
 =?iso-8859-1?Q?8sthc9O54CAg/R+P/2gdASOwRMIfYQPnt6GLSnjrEhZOLgxl2KERBlpGXD?=
 =?iso-8859-1?Q?16my9aZZ0JXKmn7MLiVfAWgImYI0xXcGOh9ZvW6Y/DK2cEMeR97npnyxle?=
 =?iso-8859-1?Q?bqkYLhtdJ/kyUvbdpigXriq8QX2LnnkHoNAZs2PycaAPg49XCruS/oAfn1?=
 =?iso-8859-1?Q?1d6rnosJ/mo9z8RohykF7jyji8ChSQ1al3lQG9N4BrO0LP8zyv79YjL8Rj?=
 =?iso-8859-1?Q?yMtVvXTHT+QA/p2qd0/gfFHqxwo124xtNfUADf8jopPFB6AqSFvaMs4uCQ?=
 =?iso-8859-1?Q?ug0DzLdL2bjFlLOIiFW23bQVaHKC8k++3J8RZIAoDKVkqEbt1n60Um57hE?=
 =?iso-8859-1?Q?gp/beH+GBLZaEN9O4fo3WEMqFt2dHetoCOIOMDwcp/WuqwrsBc4zxUBxRR?=
 =?iso-8859-1?Q?3Uc5ZmWfEULlg/0MzpnKCmzBuezULfqUWD/ysDJT/R8NHAuHE7FgXwIVlx?=
 =?iso-8859-1?Q?4wONG7NVZDPKpnplBslJIz9Y8xlDQfREfAKspZAyMH5QO2u9COQ+JNLyKp?=
 =?iso-8859-1?Q?U0GHKTCdXQ+Km3lUt7UuvjSRG4/y8DrZiPTNHChQNGgGLjE2Ptwq+v0GIs?=
 =?iso-8859-1?Q?bZvV+95Gp6gBGn8F6Tnn5Pd4MrWJQNU09CPfBZ6oIA7Lo7eoyOkoOEten4?=
 =?iso-8859-1?Q?jpmAt++DFRHy26/4JrabGe3Btzd5rOARA1AXWV2EZ6zz4S5Z1hr6rNDzeY?=
 =?iso-8859-1?Q?uSPC0aHDux7z1iXm08+x0B57DnS7A8T0erCQr5KQ5cOjQTEhVftLNnDPWn?=
 =?iso-8859-1?Q?+vkoJoVAx8VQw1IybHl/3jsQFZTR/fVEIx+o7EiWZKH2MDGq/uVGOOye3G?=
 =?iso-8859-1?Q?Dx22oI3jhS5VozzPYnwjRm9itIxmltm05m/19xoEOh9ElSZkr5uu+2wuES?=
 =?iso-8859-1?Q?SIvudlRBXAOLc9u1yC2jD5R1hqFgQYLjB6TJr+ySmZDBL7LIKuN3lObHKL?=
 =?iso-8859-1?Q?eAt8yuFgPef/wUhD3LPuaDrUbAgkVGy7B+v9gh0FUlUH8Ra4iu+t2pCZj8?=
 =?iso-8859-1?Q?NNsj3hLMX1zNx9D4wz4zD51ZG12KZZfR9/axAHA8ywLSxoA36sFMdHyA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8ytCEs8ShykJpdElvNGUPhF9H63mPLo8zq6JyxDdOFU/23emmY1RfLLQw6hwPluGQYhmSCG1ArFTQ6AwNaZzQl9Lf5RSqElYN3/nTX+gcFqagPQs5U+6lSz6in0w6iS5sYcl0PQPHTghgXgUsRBLEo9vW+Td4UPSI29O1zaXke/hjwkdBe+fGkHdfUHBvLocC/8rpkpkTVkCF4MTGZOYISo1WuTNZJ9lhhinIhbT9zbAWYqVhy2mVRNwGr8tBXYjjGekH94qQLEqohggOCGQpEHcpV832eGFD+wKuA9yYpmh0Eg7gZXu/3vFRwlDN6mTWppMlzxRKr4RyXpQ/3toZxyt++m7Gp1TyLS18NYq15kQrlzpl7l/FDpKruugpa6/1H/lFWdFXmSyRP3yFuau/OJ9mESv/gkvu/q+wP3Nk1l9G1hcFwzmZ27VA6TbV73ZvT9Qzn4KgBttJlp4krKYuNe43asVc1D0b/O5VUwoma9Nc8+THlPts8GRa/Cbqd99P4M8O6ASYBLmZcLL+wfERhkP1prodqrjDj1+9BpL+7TLwhxrPo/BbMbFn5NIWFpNaYnLHpI9y4dzFD8elrE2LCA9eoP88HbW0El6RtkXTyopTAoqK0sjWukdmmCfzBnEVaI2z8su19QGC2RxCBb/dQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5b6357-b608-4fad-1831-08dd197b41e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:32:13.3287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /P+2xRrzQdOE5ZTjVgyaEeiH5qSYyeDEgs2VKbQJ4iQqKN1VhZhbln+k+4ts7LfON/1vqHTUMir0N3/+eRr+Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7691
X-Authority-Analysis: v=2.4 cv=Z9YWHGRA c=1 sm=1 tr=0 ts=6758dd91 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=cVNrvySLM83yx2NHRmcA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: EQDCyGyFcbQPRnskVJ87Y6h0Tvww4X8u
X-Proofpoint-GUID: EQDCyGyFcbQPRnskVJ87Y6h0Tvww4X8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=872 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

Some old builds of Microsoft Windows 10 UASP class driver reject UASP
device with stream count of 2^4. To keep compatibility with both Linux
and Windows, let's increase the stream count to 2^5. Also, internal
tests show that stream count of 2^5 increases performance slightly.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/tcm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/functio=
n/tcm.h
index 3cd565794ad7..6cb05dcd19ff 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -13,7 +13,7 @@
 #define USBG_NAMELEN 32
=20
 #define fuas_to_gadget(f)	(f->function.config->cdev->gadget)
-#define UASP_SS_EP_COMP_LOG_STREAMS 4
+#define UASP_SS_EP_COMP_LOG_STREAMS 5
 #define UASP_SS_EP_COMP_NUM_STREAMS (1 << UASP_SS_EP_COMP_LOG_STREAMS)
=20
 enum {
--=20
2.28.0

