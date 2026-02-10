Return-Path: <linux-usb+bounces-33223-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD55CpF+imnVLAAAu9opvQ
	(envelope-from <linux-usb+bounces-33223-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 01:40:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C13E2115B6C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 01:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABB21301DE02
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 00:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5312472A5;
	Tue, 10 Feb 2026 00:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Il+WkzW0";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ax2A74bK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IicLk3k0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3735B23BF9B;
	Tue, 10 Feb 2026 00:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770684042; cv=fail; b=SnHYxwU+d38N0byRmdnBYHVyKV4d8fUsvF1NBZ3sDYCBdfpqB31zNaEbAhcbztkDA5ybA9ktzHuoaDVavxZ4yDtHUfkI7+wmohDKdyXQsXYdAlKjUQUWfWky4TYRw3jiTZsELDBVudxhD5YBZ30QXWMExBC3MACaQOw798wEZao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770684042; c=relaxed/simple;
	bh=fCYyrbaK53lT/C3gMZqevZ9m3qz3FfEdnipk0mFbv8c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MOtx5UtXR9tV9LtOFlxg5ReurOZigTD9LaZLI5IgnVsojJclBayTj4S2x2D9fx03IL5AmxDe/LTtZZ6f8Jzp/aFfj2PVS+KLqFkyyS4T7dyh6k03YoRZTEpsIhr1uv7fcBG4z6NlAQNDoWq6IWeq4OEAiiFop8LbbedcEQCbDWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Il+WkzW0; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ax2A74bK; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IicLk3k0 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Ikwiq1308801;
	Mon, 9 Feb 2026 16:39:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=fCYyrbaK53lT/C3gMZqevZ9m3qz3FfEdnipk0mFbv8c=; b=
	Il+WkzW0n7sJ47ulIQZmASFjuDtTabuw7iD3rG8dybxc8My4jXrqd/iKecSqwVBj
	bPjb6IQzK+luEwgAbk5HVlDed5IqDOhCZv2XMM828n73oIuMn9Jrfg/1iO+tvfY4
	SfR5eqFbySyhONb44uTBdDtiwiZ0+65gts1Juhq4sMiGEGbYtyudoCrgLI8ReEN6
	7i6eAQoIO1Xxt8fCFIt91+EXTsnjLVXa/7Rt1qy/66Nj4mKyQPbB1KbqvVi5tYhz
	d30WBQ2biwkeGtMBG1eN6ZH+5m7IANL2ypQfukN3kWQ2vGEg+WZXN5zrpVdRq9QM
	8OMDFqdTTrTXBoZ/XE6qvA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4c659pj4a3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 16:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1770683993; bh=fCYyrbaK53lT/C3gMZqevZ9m3qz3FfEdnipk0mFbv8c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Ax2A74bK3kdLNpvCtX4mxg1sJkc/V7vObCqAOqg8oEAD2BgY1qZTHo2qDfupMFG04
	 UJuzZxWByL96WT/2oubnksvH7ny8Js9DImaOZoWkTNpp2SjaB18urzDGIvtqDZZVXi
	 Q1BpPEQ5pQ+UclsH+os9aoDU/fyexwRN+02d/wgwi4c54TFRGXAsg5XC/waTJS8fJ3
	 IEtBrPglMWNdjcD8ODg+avNPCbWkrRtErrWg8bEajv9rBrw7nsV1Dfb1yOgveawlys
	 vJkMmqI4ADSNdaTJOSyIVMihwFCQk76VYo0SgLNd66yBjY43aIItmjdxHGx8U7tyyH
	 cZSD/aW6EsJSw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 76ECC4021B;
	Tue, 10 Feb 2026 00:39:51 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DF1AFA0079;
	Tue, 10 Feb 2026 00:39:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=IicLk3k0;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00604.outbound.protection.outlook.com [40.93.23.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9DDEE405A4;
	Tue, 10 Feb 2026 00:39:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXc43EIywEqWOawq/SqaUk7wwv7m50PrP6YgJETEOhAdg/jD6o2QVue+/sAiWjeOVRzivv/oxWSSOI2GllY4lMlIv8iYb5m8TcgWbAgS+w7eTupNKizU4O/zlLjKBjpjupDhC19KuUZVNjNSA0aVH7aGG6Xk1aqvyugWkquqvaaJiZwVE8jfnBOOzDuhKqX3zlP45P7qF+LxOAfR7rHwWlsVm5915b9qpkHcGDC9bX4iUnWI3WWQ5RPH8GtTCDgG+cXVOlREWJ3fb6QBP6uQHJQlg/6CcFfucAxjxE/Wop8jH6EPFWk8U1Og/Gz+HrVkAa0xsFkFlyg24hJim/3IKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCYyrbaK53lT/C3gMZqevZ9m3qz3FfEdnipk0mFbv8c=;
 b=ZR/aTzTQXQ9ZcDRQtXETEMCc0uewzdJkbuNepZp26IQW2HQx3EA8yXTus2FF/b1NcN1opJmyQxBnGe7Wz2LqxVyCPYTxdoCU3eQbB2CrxUS/W3xf+qLfYPRgPmcbjLfuVHZ9T0Jmgyd6tYjrHaqdV/Xxdl8MWITCIoXQiqwLrIiUSvMP+pmxevyAFZyvCVerKZMGUz5Is7n3DUs2W27TQPHOwkhTm5CNw4KltPggwjsWTpkrfC0fnUnPN7j2gqxz7nuB0Au9EX6EpNW8zzGQZYxKkO4G2qkCGFLBmFJMzCiTwXPxlG17+w0d/wYe3d96DrboXNR+cASxxtwsa6Vs9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCYyrbaK53lT/C3gMZqevZ9m3qz3FfEdnipk0mFbv8c=;
 b=IicLk3k0j4xIk27OsX8ndxiamMdUtOZLL9XKL5HL8JgWW5MzKhVnwHsMUmGGgESRvclIQBtjU4+3hN9YFZ2MIUMBJzQgZpgVzxhWzcKtwC757CmkOX+f8tbm5/cRDdUZ25YRTNp2QOgUaKC6sSZ+Z3FLWgH4P1r89c3VZUQ1gW0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB9736.namprd12.prod.outlook.com (2603:10b6:8:225::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 00:39:44 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9542.009; Tue, 10 Feb 2026
 00:39:44 +0000
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
Subject: Re: [PATCH v3 2/3] usb: dwc3: add needs_full_reinit flag
Thread-Topic: [PATCH v3 2/3] usb: dwc3: add needs_full_reinit flag
Thread-Index: AQHcl1HYhrcxYBkUPkWLRbHy1fVYjbV7HNkA
Date: Tue, 10 Feb 2026 00:39:43 +0000
Message-ID: <20260210003942.qzp4jupegbocsh4z@synopsys.com>
References:
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-2-ebd9b9b77049@nxp.com>
In-Reply-To:
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-2-ebd9b9b77049@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB9736:EE_
x-ms-office365-filtering-correlation-id: 5a07151e-97b2-48e6-c603-08de683ce277
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Tno4NjVRcTArZFUzMURPRG4yeXc1Q0oyd3VYRFZJcnhyb3RUSVMrbW4xMkts?=
 =?utf-8?B?T1JuTVovTlVyY1RRZFQvV04yaUZmTVYvL0dlSUNwMkMyRkdQRUlRc24wRHhM?=
 =?utf-8?B?aFdFRkpIc1lvNWFOT2hPOFVTVUZHRG9FelNvcnFUTTl6NnhNRUUxWFBLYTRQ?=
 =?utf-8?B?MEVxd1BISXQ1NGJhMzJYZFpQWTdKbnkyeGV3eHlkTlBvTjhQT3l0V0ROZ09a?=
 =?utf-8?B?VStNQ052V0ZOTnVXUnBDenB4MHd1eWw1aXBuTDlXT0p6YWNaUnRIMERTUnVG?=
 =?utf-8?B?cDgxaEhDSkdiRXJXK0l1aGhnZVEyZ1VMQ0VmdDBNdE5KQzNMMFdLNnRrd3lu?=
 =?utf-8?B?ZjZqc1BCaUlVRUVtdURrUFlUVGV0M1VQRWtYU2ZoUUZKQVVuZytLV1p6T1Mv?=
 =?utf-8?B?WGJob0p2RkNLT2p3S25xbVVJRlZNZzVUK1Bjc2VzbEROaTVoVGxmNk9WWVBL?=
 =?utf-8?B?V1RHb0ZEY2tCdS9IS2ZGMlAwN1NBNS9DVlBFTGdDMXlNdGpUeVdMSHNyRzYx?=
 =?utf-8?B?Q3hQYkVpNnM5bmh6ektnVytoMUVsdlZHSnZ0YkQ1UnJ1V2tFeVZmWUxNSEJx?=
 =?utf-8?B?dFJJb2VId3h3UkEzN2xKcUI1c3E1SDZQRVVPdXlKQ3YwbFVEakVaQVlIcEQw?=
 =?utf-8?B?Sk5ZdTFuTlUyeWZlcVpzV29IcXNhSHoyNGdiS2JKN0pNMHBHbTBsR05zckha?=
 =?utf-8?B?VzUvTmFJenoxdi9nelFiR3hJWVNOamlmQ1JVN1ZLWStzRzhkNEVBaFVOMERG?=
 =?utf-8?B?TVNTVWlNaU1SaG00ZmFCYzJsQk9vaDEvdnN6OUsrSFBnT1ZONFA3dkhzcnRj?=
 =?utf-8?B?R3ppUUE3eUdhOWhrNjJpRS90L0Q2L1NrWG5BTEUzTy9KU0gyT0xhbDVxdStw?=
 =?utf-8?B?NDZjMXZDQjlFVDJucjlGYnc2RHdZVVhRVUpKL1pVbjI0ZS80dHJTNWN5S21j?=
 =?utf-8?B?SDVQL3BOZVcxRkFlbkpCejNYMDZObG5Qb0w1aExTQ0ZudUcrNU9yaWZ2L2k5?=
 =?utf-8?B?cG92OFZ4Vm5aRFVPR1doL1ZZd2FxVVpPM0NvcXQ2MEppdkxtcEZXT0ZLQ0g2?=
 =?utf-8?B?WkpCWXNCd1VPWEtWQzN5ZmRSanhnYWwvQm5xbDlFUzhIYUZ2eUlFWE5PaXJt?=
 =?utf-8?B?T3JLK0xkbnZqS3Rqa0tZVlo0bnI0bzZwNFY3VlpaQzNKT3hkS0lGUVB3TFhC?=
 =?utf-8?B?cVJ6ekZ6QlZDb1lmNlFBOG1HQXAwSGpXeVJpSTJHZTdrQU9qbFhIcVh4VTda?=
 =?utf-8?B?RHFqYjFtMVM1ai9SVEV0bUF5bkJRRlJmWlQ3K3ZGZjdmUWlWY1FwWDhxaUlh?=
 =?utf-8?B?MmFKWVZ1cUJrWGRpZWZsaTV1MlFkbXZtMHZCZFhXMzNFT3ZBaUZhQVFvR054?=
 =?utf-8?B?MmRjSUJTK1J6aklWUWRZb1c3enRvWklmZXZGWVIrYnhUc3REUzJDVmtWYnQv?=
 =?utf-8?B?Y3RUOTJ5c3p3bzJ1QjJiR3FzL0hHQ1ZoVnBma0cxaU5JS1BDTkh1MktlbmZN?=
 =?utf-8?B?NVcybDdKNWl4a1ozSy9XazBPdGVyZXBWWUVtK2VKN2d0TTlxQTZUYWowbUlm?=
 =?utf-8?B?UWl1aCtXZmlqWGNERXU0RW9rTytXRVhxTDFtVmFLMzYyekEyaHdhNTRLN2t1?=
 =?utf-8?B?RlJGWURXNlZGL0YrOUZMQTFHTDlOaEIwSnV2OUNJUzlRWk1FUmFUUVpzWWNa?=
 =?utf-8?B?eFRaWFVpUloyK3J4Q012aXZQVHFaV3dWODN6Uk44Uk9kbVFkUWhvbzliUEFj?=
 =?utf-8?B?RVVZWG05ZWtFODd4eTZkQUkwSXZEMEVzUzdrb1NaMmVjVExQR0NjZGd0Yzd3?=
 =?utf-8?B?bzRzQUVvMHEwY2FlZTN1MGZJcFJ6QTNOZzN6QkN3azNvVkNJM0lKOU9rTWRx?=
 =?utf-8?B?ME1OTjZnUGdlRW5LM0RwaFNqc1FpRmwvenRyTmM0SlJzSC90dXpRSitETnYx?=
 =?utf-8?B?YW9VK1BOV2xQUGtxZjZOZW1wSXdVWkNqT1F1ZWhCSWlSRE0yWGJMS2MzUGVK?=
 =?utf-8?B?ZWR2VWZJSFgzQWZrVmdaT3oraTVSU2RQckkxcmlScWZIRFlMZ0lNTjhNNjYx?=
 =?utf-8?B?WDRiRkZhWUxOT2JZSnpqcXlhZHJFdWRpNDJEdzJwQmh1aU5SanVDaWlwenl3?=
 =?utf-8?B?VHd4bkIzNHFVcGhvTEk1bXBxS2MydlRudktYNUJNUjBrSmZLV0dQVkFkT3dI?=
 =?utf-8?Q?UN1a93M4cqZjIRufcGItC4M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bllXc0MrUU5VS3lqRVBnSmMzQ2M4ODFWRXI4bjFwaHUra1k0MHJZNXJzVXNF?=
 =?utf-8?B?OEVxYzdCaDZodENkR2Z0ajVibFU5SGhic2o4aE8xZDhDRWw2ZFV0UDUvRjhB?=
 =?utf-8?B?Q2dROW80YWc5dGtBWVF6cjgzeHpPaVAyMnZSbStqWVZCVWh0ZGkrT1cva3M4?=
 =?utf-8?B?SlBTOFpBS3Zqa1FhclgvOFdrcHFVRzgwNnN0bkNjdlYvUytnYktwWGVHUGQv?=
 =?utf-8?B?bWRUUmRYSGJUSWU3NEJyRWZNYlZqMmV0Q2pTOG5iRTRRZGJBZHV1cEJaS2py?=
 =?utf-8?B?Q0tCeVI1NVZQQnYrWndLb3l5UTdMT1d6bFp6dWZkbW1qOS96NSthZmtLMzM5?=
 =?utf-8?B?Z3ZZM1FDS29xcDN5dVcycUdVNzJjdFRBeVRiM3FyU01nYnp5M0ZkQlVFdW1o?=
 =?utf-8?B?T0VlMlJRaTV3aWsrU05MZDYzTFdGNzF3VmNmNGtaY1JYUGMwOUFZN3UrYWRY?=
 =?utf-8?B?NkxkYWJlT1BnT3FTa1hvRWtMTUdVMldwcDBxQmFnVFJnZXM3NVdaZ2ttQ2p6?=
 =?utf-8?B?bmVyNjhyVmZMdmMrbXMyMHh2NDRPRlNjaEJzTis1Szl4RFhzOUF1OVJzM2pW?=
 =?utf-8?B?N2k4UG5xS0Q1dWZZR1VyUHUvZUxGdWRQbVlwd1poR3Y4b3MwL2srS1o4STNa?=
 =?utf-8?B?YzVmL3RXZnhteVZ5ODRaZ3cxVXlqa2EyUW9lbDNLSGZ1S2ZMK3pleGI4ajJU?=
 =?utf-8?B?Tnk0N285YWpvYjRwL29HSHVIbzJIR3pqY3YvT1NaeHFLQUF0bG8yZnR1clY5?=
 =?utf-8?B?WFpjWGVTN2xrYTVUOTVPbHloZFZPSHZZUXVrSXFPakdqL1JsL2phZlVDMEk0?=
 =?utf-8?B?ekFtajVtcjZDSTYwTVpSM0hwY0tCTzhqVGhTeEkrRTR1cmZ0dEhicVZuaWdL?=
 =?utf-8?B?bjlSazVUTTZCYTAyT2tySENlYVQ3eFMyTWtNNW9iMjVlVy9ySmc1Ukl3L3Uw?=
 =?utf-8?B?em50RFJQK2t1Z1lMM1Q2a0JSeWJGZmVXUHBkR2xrUGR4ZW1rVjkybnkyMWFs?=
 =?utf-8?B?TFFEK0Z1SkYrUnN1cWNZYmN1Tkd5STNsZ3IydzljSW53aXZ6ck1qZzlqNkI4?=
 =?utf-8?B?S0tHSVJUTk5QUDR5NUJHdkpBWlBjUTdQKzVRZG95OENPUmJVeVVBSkZwby82?=
 =?utf-8?B?cGlQRm9PRno1cGJvRVdNTGl1cXhSV0Yvc0IxZHJRYUd1ZC9XSnROWXdLazd1?=
 =?utf-8?B?T25oUHlPU1ZiaUhhbjdZei84RE5Vd213cUQ3K2tZRWJCNk9YWkRSa2xUd3Ru?=
 =?utf-8?B?Z2dUWmFjVzFDaGtKek1oRzFjM3IyZlhGQ0ZLV0IxMHpJQUFCR2N0WFRybGZC?=
 =?utf-8?B?Wmp0RFlQeGVjdlFqV1JTTUR4WXpSWmppMUlyUWwzT0l2SlRzcVpJMU95TTBr?=
 =?utf-8?B?bEVkOUJEcU5XUkhSYXNpeExwOEhuRlpJQTdwNzljcU5RZ2F6d2kwRWFPeUMv?=
 =?utf-8?B?dHZXS2kxT3krSnZEdUZvbk1jdi9vUlprYUpsRWpINUM2eFg0RFBtOGtxL1Zi?=
 =?utf-8?B?VzFYU3VsQW9WYm9MWEV5WXd5dUpGQjlTNW9YbVgyNUw0K2xJZlRBN1BSaEpG?=
 =?utf-8?B?cm4yVjZZekUvODk1dW00NXMrYUxhY1JNUzZJTHNRaEZOYU5USitZN0c3NUp5?=
 =?utf-8?B?YzF0MUdSK1NZTVVSL1kwV3ZHSVZxOTllWWZqQ253cDdyRFJlV2lNRHZQa3I2?=
 =?utf-8?B?R0JtdlJCMmdMR3NLb1dxOW9RYUdsMnk3WG9Sa3RtdjJ3dDZTWnFkeWU3MXZu?=
 =?utf-8?B?SXNzdGdnNGVMWlFTMmVBeHBEMGlHbDY3YWl5NWVSRHRJcjNTdXBsZmhCZDZC?=
 =?utf-8?B?b3l5L2o0cFZWMkxNMjhtZkFyOEp1UTcxVkIwRHpZUDU1ajJkVUYvV2lvTjNX?=
 =?utf-8?B?d3FGMzVNTlh4UkNBdHkyOHl0YS9HQ2xRMk1aRzdWb3NxNVUwWlNXMmc3MGpE?=
 =?utf-8?B?L0JDK3htMW5qZ3dtRUk2UUxOelFmYmtrOUFXRlFTNDNwb0w5d0EzUVZ0Y1JT?=
 =?utf-8?B?MzcxblN6aDA2aHpOc1BPL0ZzS0lQZ1Zab1k0eDBMTGI4QXdXK2szUUNYbTls?=
 =?utf-8?B?Wmdvc0RQaC9GWGRsWmVlck9NNEZnN2xIQzdXdDhkdFdWc3A2NDRESWFDVTZT?=
 =?utf-8?B?UzVqODZwMDcwTmo4RytSYm96T1NKbTlpZHNhOWpGWHNsMzZsbWdaR05ickd1?=
 =?utf-8?B?SE53MUNpeWJZQmxyS2NtWkxUc3FJRGZJWkNKN3pLNjArU2xvdUtack1pbXZE?=
 =?utf-8?B?aldqcTdPdjNJUGY4YStRaTFtamhaVFFiM21KOStzWGpoelFXVi9YVGNTZ2E5?=
 =?utf-8?B?SGlPeWlIMHZobmFSYWoreWNLaVhYcXZvSGE4c2x1WVRncWFBYmkyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EAD83E1484E57468C93D1721AEFD4ED@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ac5tENDkI7ZIUjQdFpYcoLatwxGKhdiwqHJp//HxmTAN8ntLhkCGSoTh+mWZYENST8ERTBTw4l4zhQNKSoGr7gOb5j4kH99uESIthx3oszCb+kjqC6nASeSJmezG6fy0kXF2jYMl4yqfmq4l8SW3OdYLuOOwAmLlOGJ5H6Wz0Sq8shDXwZD8k+u4SgNQWCtB2nUVyfX1xtuuDw5QkEN9aD3TmZ37KlaYJOhqzo/glCRazIw8/030nuu542tbI3z5+SQqkNgChtQJUoqXjTyLYFCjX3xCyK1tY3ms1ZKQrC9R2WNR/B9JIVtXZXzfAMDC3I4t6Psmyc2zlGAweUKLT4LskdTC0/dYutTUdTIAEOWKQjobRbQ+pW03kREwk/FQo/gVl75K7EqFulxUOuW8K58bjJrTrXPRrPKiPR8OOmYhOV0MdqX4FSrrPYTe2uyqE/DvFPHEu+SJu8N3LmJUJFiruRqKJiA3Z1xgqgLhU1HTIKkpBMo6os3nydN7WNOFpdJXFhLzfN4sZK4FNMbY3FddahAp8kPP9Y51VFtVZv2tOJ8fFgVqWO01c55El20wRHTRX4vwmKQX4+V/8YHKQsrn9eCcU7SOX5hRb1s43PRX96oOZSYyqgbKJH2/yCR2aHtnmFDCTtbCD7jGl1b1Yw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a07151e-97b2-48e6-c603-08de683ce277
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 00:39:43.9620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4WMHUm0VYCWVPT7zU3pB7nWArcPGpAG2WVjHMFU+ZEUWSM2BXWZH4teFS7WMh97MtW17hVIGa4AxT01KAWcrlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9736
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAwMyBTYWx0ZWRfX/cWp7QQMZcUK
 7uW5n8ucyuOB+zdXq6Ya7cRQ5OcmxA2DtftzPUzSvlVvmCYYPpCBmUBZAvX/vytcpft+mD7mGsa
 GLXvOP4lIEWF7xAfqm8SOgYjxiic91P9Z8szy0aoENJByrP07v6AfEfCJ0BFI7dy2gKGI4c/YzM
 eAi5CsKNBGd51LXHPnLgpxmpjOuulbvEapuBfBTKs1TS+TynR40KpBcIPq57QuXdEKMQ5fGT2pu
 s1Za/dt6XAi3tw9dEoZ7gNFiKgyJKpn/bHl34Qice/k/K7GLeBsNHJK1KHl01s93tvm1UudQkBn
 zAkE6ejwL1UgoV4fqIgsSCoSY3RD6gsvp/Oq1R1pEQxnbpJ1kESAeRhE50YaoOjIRAN8/PUJ9w/
 Ve8Jsrpthaao4JjaZFCKt8k2+phIA3BrEMmo5civfdbN57VlRiYn+HLhGqkadcNWrE3XeUO759a
 f+4z/8IU5UnXfqpjlqg==
X-Proofpoint-GUID: rSZAP0ZBOmkKvFoHbtUce15Wj4cvWTPn
X-Authority-Analysis: v=2.4 cv=bv5BxUai c=1 sm=1 tr=0 ts=698a7e59 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=eYawGhs3SIQnt_gyWw0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: rSZAP0ZBOmkKvFoHbtUce15Wj4cvWTPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602100003
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33223-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:mid,synopsys.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C13E2115B6C
X-Rspamd-Action: no action

T24gRnJpLCBGZWIgMDYsIDIwMjYsIFh1IFlhbmcgd3JvdGU6DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9kd2MzL2dsdWUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvZ2x1ZS5oDQo+IGluZGV4IGRm
ODZlMTRjYjcwNi4uZDRlYTYzNWM5MmZiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2Mz
L2dsdWUuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dsdWUuaA0KPiBAQCAtMTIsOSArMTIs
MTIgQEANCj4gIC8qKg0KPiAgICogZHdjM19wcm9wZXJ0aWVzOiBEV0MzIGNvcmUgcHJvcGVydGll
cw0KPiAgICogQGdzYnVzY2ZnMF9yZXFpbmZvOiBWYWx1ZSB0byBiZSBwcm9ncmFtbWVkIGluIHRo
ZSBHU0JVU0NGRzAuUkVRSU5GTyBmaWVsZA0KPiArICogQGNvcmVfbWF5X2xvc2VfcG93ZXI6IGlu
ZGljYXRlIHRoZSBjb250cm9sbGVyIG1heSBub3QgcmVtYWluIHBvd2VyIGR1cmluZw0KPiArICoJ
CQkgc3lzdGVtIHBtDQo+ICAgKi8NCj4gIHN0cnVjdCBkd2MzX3Byb3BlcnRpZXMgew0KPiAgCXUz
MiBnc2J1c2NmZzBfcmVxaW5mbzsNCj4gKwlib29sIGNvcmVfbWF5X2xvc2VfcG93ZXI7DQoNCkNh
biB3ZSBrZWVwIHRoZSB0eXBlIGFuZCBuYW1pbmcgaGVyZSB0aGUgc2FtZSBuZWVkc19mdWxsX3Jl
aW5pdC4gSSdtDQpwbGFubmluZyB0byBjb25zb2xpZGF0ZSBhbGwgdGhlIHByb3BlcnRpZXMgdW5k
ZXIgdGhlIHNhbWUgc3RydWN0DQpkZWZpbml0aW9uIGluIHRoZSBmdXR1cmUgcmVmYWN0b3IuDQoN
ClRoYW5rcywNClRoaW5o

