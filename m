Return-Path: <linux-usb+bounces-12071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D74392B51E
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2024 12:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BC931C22F10
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2024 10:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92A7156250;
	Tue,  9 Jul 2024 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HQCAkkX2";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MGGflHVm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pV0NV85E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DB6156653
	for <linux-usb@vger.kernel.org>; Tue,  9 Jul 2024 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720520564; cv=fail; b=FFt9Pv5MHOV94PEHjFF1ip0f1lj2ut4gdq7FgcC9XhZxHUBdHFuybaN17VcwqLSd1zH7L7wuWDoh/UOZeeKLng/dA6tHQS1OA2rr6mM9ZBVDiKZSG08cgqxyk6qIO/iObyDR0n1xyiXC0aOPI1UCuSmadYo5P42UtOktcWX0Nu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720520564; c=relaxed/simple;
	bh=Pzj6G5oiPPfg1OwbCnnHXZPjpMI5w7+yzLpSU7clMqo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FGH7k6fJ4y2wGflKBUPGkKRuyiL4tmQWGEIb3Qbxc+GVMIn8BQJvRld2nJFuklsf6SeVh7bvCQs7RSfoklMhnCOBzjSLYKrc85prpG9UKeXdS8LbA97V1tcrYvfuYY/LwUM97r9RmPfhjY2/VjBEQT7jZYYUKpsvuBqOthAylXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HQCAkkX2; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MGGflHVm; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pV0NV85E reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46963WZR001533;
	Tue, 9 Jul 2024 03:22:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Pzj6G5oiPPfg1OwbCnnHXZPjpMI5w7+yzLpSU7clMqo=; b=
	HQCAkkX2PCQDzwH6WPGhjGpBATsPrs9zSYlOLfXd3XPAQexH8vs2u2FGJFImbm97
	tSqF4daN4j4TR1osGo6V0gM+LEwoN0mw4FBT6AUZOSvE8kZKS8dK3YdIDXBivcKf
	xKx9/P5H6BXt2UG6rOmpDlqw5tktOuZLhRzellElMNTS1c0ScUbmtnSZp0tiK3lJ
	MF2Bcm7eXqyFba9LAk7OmkzpOmG6o/ioFSdiDCvnRCFDM26B/EVhcyxttG4Mg3KA
	W9t7Tjpx0Lgmnhet4i21QrUX9qQRf0mrWUcsUAjuaskrPSs0aJy4Isx/gbiMVDg/
	nZx56lRXfazUn9eWhKbJTQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4074us2xxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 03:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1720520542; bh=Pzj6G5oiPPfg1OwbCnnHXZPjpMI5w7+yzLpSU7clMqo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MGGflHVm6k/HXKcfYA82JXcnOMdUPfr0U83ZNT1zVfPvpcoMn9NxtIOGtm36sJ5GJ
	 yIJROQofCvhySyQyxbDXvWxCR0wLQeqjfNighvvNFuCnraWtVoUIdUwyV6I4mAVHXU
	 1rn7y97avH5rHDlWZ7T+08FRv4WfgwijNEOmLu20xarkP7BPsgmfA/H3Q5KisEHG0S
	 YTtSjDr9oFVdPAEcUD6n/ZqSgXOMrMguC28vDHTnc3J7dXX8Os8DFuNTJ0irdpNHFJ
	 fqYJmlr6HZXxIqqTNWwEfrmOtzrOd+eUDoqo7BEr/tIpC8DEneaZFPrsCWYLhIMZ9M
	 LWOoUkXf0ER6w==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 87ED340561;
	Tue,  9 Jul 2024 10:22:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DD501A0079;
	Tue,  9 Jul 2024 10:22:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pV0NV85E;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 79B73401CA;
	Tue,  9 Jul 2024 10:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YB4xa62QCbl4JQXrVTgcCSCYMNtEXqzV902a/SNSuF++CnnTckd8vdGNxshrcjsEY/MhOBeC0WDOCqMDfiDjbhbkm8fk6ZisTaEMuAyq3+Q5KfV2M3ep2T4iNVGrVZfUsG64jgfDG8sSFZdFhDs2famF2IUcl2zGcbnN+hCOlmyRSC9dHSp1PQkuVob33VjaLw6TTkDgoIjohf+qhbSFuab8IXYR2Hbzqv6TEMxrsnwmKoOO96/vKTSDt9j1Nu+vVHSkS0Riga4PNVSMPmUTcFEjc2FIWaj7HOYCAmi/tn0LIhT2K5JAqQVItlHBvlIUOH+CzDyfzps8t2PTrTXvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pzj6G5oiPPfg1OwbCnnHXZPjpMI5w7+yzLpSU7clMqo=;
 b=c8GdoXbEVwf+fv8AYZh6m/OcJBxDoljmsKGlyv1cQWQkMXI3OI8Y8y+QgfGAtd+Fom1pr4uVGM5MrpV0bJ6zebwr0QmgPZHYjN/8lwz/HpSpRyws38WZ77nsfQAFvEE4LmwkONJiwVlfZis5Cx5D3ZD1+QOdvRE6d422Dtw/YpWBIJbK6v/P6+PNLKMW7rFuQ+EAlPgDJ6aLnB1LuTq97ULUmwV1/sUTFZ10GRABZ7oYjqmcY7HROOPH6PiF7x2+4ZRwltKdYFKnXjGE1x3/l113ktRp/g4jI9D9RQ3LsTP6x+apz50XzwXAW9MAOFGjqNEMLjFyrSWK26/7Dz+jag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pzj6G5oiPPfg1OwbCnnHXZPjpMI5w7+yzLpSU7clMqo=;
 b=pV0NV85Ek32eRvvzaFX2KK4nNQc51iKjEfSDtpyuRIZTk4SIXgLIkC0hhuhFUDWNqrVrP3qGPPmHGJZB9mTGAgfLchPwm2AfOfnpP/ktInI0WPoPf81Ni+HOr1q+5Fo2zoKohJku6H3zIznLNHHUW/J6zZO4sEwzNVppkXBJgd0=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by CH3PR12MB7666.namprd12.prod.outlook.com (2603:10b6:610:152::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 10:22:17 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd%5]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 10:22:17 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: add support for other Lantiq SoCs
Thread-Topic: [PATCH] usb: dwc2: add support for other Lantiq SoCs
Thread-Index: AQHa0YUrkgbcBM0uO0mayixXokSsBbHuMLKA
Date: Tue, 9 Jul 2024 10:22:17 +0000
Message-ID: <a0058bc4-59c0-4cfe-b177-7d41341e41ed@synopsys.com>
References: <20240708222054.2727789-1-hauke@hauke-m.de>
In-Reply-To: <20240708222054.2727789-1-hauke@hauke-m.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|CH3PR12MB7666:EE_
x-ms-office365-filtering-correlation-id: 563fa84c-6a8e-4232-a986-08dca0010232
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RWRsdWZ1dHpWK3VtallyeStGQXJTcmR5NWtKaGRvNGpjeGNmNkV4eXJxMXhK?=
 =?utf-8?B?M0lTc1FwZFNCTVY4RU5YVDR6NTltTW5DUk9UU1g3aS91eEpBckcwbElFZmk2?=
 =?utf-8?B?Uk1aeDlOTkhRdWlnM01yMFR3UjFMNy9GV2cxVWtpL2lRR3BRUFlxeHJIalFr?=
 =?utf-8?B?RWs5VEVHZjdlckx3aDVRREphZ05HZkdoeS9YbE82bnpMSXNwLzVlaVlYT0I2?=
 =?utf-8?B?QUJRRVZPa2tzTC9uNVd6SGE4VVp0L1VFd2daUEEvdjRGU0xKOWVwemVzaGdN?=
 =?utf-8?B?ejAvZGd1NFJzZHdGRlUxVldvNjU2VFFBRVVDS1ZnMXJOeFByeUF1ZEl4MnlY?=
 =?utf-8?B?R0lrcFNyRHB6RkM4NXhIWGZ6cWthSWk5SjVKOHVyc3ZEMkY3TlB5K0ZKclBP?=
 =?utf-8?B?a0VBUEV1N1d6LzRLYnBVOG5MQ0hpdjdzNGowYU1RRURaTyswR3JUWE9TOU1V?=
 =?utf-8?B?eWcwQmxqczZWWG85WXIvUWRhMjFOWm1GNVJsQ2dNQ1ByOFp0MzhzU1JScDdv?=
 =?utf-8?B?NWtQdEFlYkFUSXZFeXBFdUVlNXBFZnFwU2ZXMXRkbHQ3RDVjUlM4MmFVR3kr?=
 =?utf-8?B?Ym5iSyt1OGR2eFgyVmVaWWZYWjNCMGhvTm0zR3czV0Y4VnB6RGxqaGJ4KzNz?=
 =?utf-8?B?ZWFXblFnTkFsVDZ4QVFTUFY1NTVZUkd2VWUwM21MeVNiTHcwczdXZGxsOEhT?=
 =?utf-8?B?b01OaHVMUUpMQ1BWRXRwa0lqYjNOMERyNG1ZUk5YeUdQNFF2b0ZQNGl4NHBr?=
 =?utf-8?B?Zyt0VjRhQXhPYVRZdjJDNFI4NEw4dG9Uc1FDcVZhYTlZcXU0bGlyamhHM0p1?=
 =?utf-8?B?SzJDazdjT0JXWGlCSG9zY1VSZnZRUWk1dit4aDNhNFNvZEcxSUJTVGZuT1Z1?=
 =?utf-8?B?RVFJb2QwQmkveUpQWFJxRm9vVGNtQ0YyNG5oOHhLN2NNVGQ2Nmg4a2F1QmFC?=
 =?utf-8?B?ZjU2Wjc2WEJOMjJRdUNkd1J6MDE3b0M0NElibklEdGtNQjBHcENzN2RSRGhn?=
 =?utf-8?B?L09KcCtXUFF2VzBSbXZmUE9XTVNIelRaSFpoRE5RU05ST3YwMndCbTVHMzVC?=
 =?utf-8?B?NkRKU1lkZXlweFdkZzV6RHVUM3BMZzVrVmUvYXMvTWhkWDl0WC95TTlxR1o0?=
 =?utf-8?B?Y2tuSGIvcnhtMFovS2RYUW4zam9Xb2JLaTFvUW9FUW5leGxCSjFhUFNSV0Fn?=
 =?utf-8?B?K3NpMHArQ0dUTE84N2pDRDRNTlhCRjZjL1BGb1ZEbVVXRmptblNMTlRGSDM3?=
 =?utf-8?B?SnovUDVRZDBLQTRibXB2UmpKbU1zL2E3OE9RemJwMG5tdGsvYVZhbkJhSEZy?=
 =?utf-8?B?TUVLWGhEWElTNVQwWjhMWnJLQ0M2NHVYejZ6aVlVRURyTHRmOXg1ZzV1ZndC?=
 =?utf-8?B?cXgzNkZEeHp4KzhRM1NXMTNNUURyaUE2UGNFcEIxK2lSRUZsQXRncXA5bm0w?=
 =?utf-8?B?b3RMVzdhZmdLbkNMUkIvM3Z3b1NCUUgySFFweDl1ZzFnYzJTdndtNDRmbFZZ?=
 =?utf-8?B?N1d2Yll4bGtGYThrc3ZwSkZQVDV3RGlLazlGNEdOUTlsTzFsVnhJSnNrWHN1?=
 =?utf-8?B?Sjg5clZBd2RpaENsUEZFdWIyOVhBbXFFSnc1N2c0NWV4d3ZXQnFJTkpYR0Vm?=
 =?utf-8?B?MUs2ZnpSOVExMGVFWUY1a0szTERZUlBPZVdSZmpqN2RqK2ZYNEdSay8vUitJ?=
 =?utf-8?B?eityWVpHbUZ0eUZUMFZXci9STXhTb1MreFlBSHBSMGhZbzhFMXpqZjdyaEt6?=
 =?utf-8?B?ZGsyejBxWnEwUUMxR2FxaHBhNk52R1JBamt4ZG1lanZoNFpCZTRoWGlGdmNG?=
 =?utf-8?B?Qmh2YU1JQzdnR0QrQzgrYUZxQktpVVk5WXQvWjFwNzFsQy9oeEMwak5sQkE2?=
 =?utf-8?B?NGx2SVM0TUxUeEtpNUdoUjFnVUh1UmxpNzFxdnV6ODMzREE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZkUxREdJY0V3MkJwMm4zUXltMXVzNmRnOW9yM0N1UDU4RTJ1TnA4V3ZDa1dJ?=
 =?utf-8?B?WHpOdWd5ejFyQ2UzVFZ0allhWVljZ3J6YmJ3Y2pvV3dRc2VTcVdBTzlRVlNw?=
 =?utf-8?B?M3ByY29BVHBVREFWTDcvQWtTVWFCRHpySGVBREZpQWJkbitzc0pTRGw0cWRT?=
 =?utf-8?B?TlJ0ck45VTM2YXNySVNSRGdscnplbVhzd091WmhTSHRIckpPMlZ4dHJqS2dZ?=
 =?utf-8?B?M1UvS2QxY0ZmMUNCVEYzVmFwM1dCN2pENnVPOEs2TjR4UEY5ekdEalFhOVdP?=
 =?utf-8?B?U3pxelB1UXorMXBuWjFXK2IxcC9MZjRHRlFmMlVDSlAraDV3VDFucWtJM2RN?=
 =?utf-8?B?Nms5Sm9PTEpHUGR4ZkhyT054eGp0b25qRitLdHowSHF3RERvU0ZuTnVJa2N0?=
 =?utf-8?B?Vmd0NkNNS1J2T3B1RklvOFFtTDNCeGt5NkQ1ZFFzbzlBQ0hoR3h5bUQwYTBK?=
 =?utf-8?B?ZHVtdm5ydzlJY1lGRUtjRFJXRldXQzFCS1ZkMUd5K0tsVUNIWngxUkxSMkIx?=
 =?utf-8?B?VXN4b1pac1JRSUVzenNFMnFEQVJ0R1JaQjVla3VVcUVMd3BudGp2TjhuM0Vq?=
 =?utf-8?B?OW56ZkN3TldBbVUvdUdEVGgrQW9VUDRQT1MvMjR6R1l1dHdQKzZMbldnNEo4?=
 =?utf-8?B?NmRpRFpXeVhZN3NyUEN3MzUxTGpGWStGR1NTRy9OZUx2Mk84eThSM0lYN25Z?=
 =?utf-8?B?eEhwekJtNGZkQkFKd2p2cXZkSGVoSVhHRWMwOUpueFljNFBXSTdhUGErR1dj?=
 =?utf-8?B?UXNBbTdpekFLaWNpcTJ1eVRRNG14N01oVkh2WER6eUJoMVNuOG5Wd2ROS3Fq?=
 =?utf-8?B?RHo2Mm9XTzBlWUh5eStDazRsc2hHckx5cDl6N0QvdVNMTjZCeDVJaHFEWmth?=
 =?utf-8?B?WWlxa2pISjkvK1U1alRlVll5ZVlCVTcrSjlHRzU5dmRmMmRmRTJnd1RITnZE?=
 =?utf-8?B?NVNjZjZtZ0d5TjVuVjBhdC83MDkyNHpETDc4bEx5MzFya1ZkR3BSV0NQVTBa?=
 =?utf-8?B?Sm1vbkZzTTJITS8zWkVZL2Q4Zmh3bDVNS3BiZWUxcEwvRnhMaU4wZUYxTTNI?=
 =?utf-8?B?UUoyYWlxYnRTZCsxYzQwWWc1cWlmajJzUy9tbFkzSTBidlVUL25FV2ZNQ2tq?=
 =?utf-8?B?NkJGUlo1MmpLRGdDb2hRTUo5OE9ZWXptcmRKL2VFSWxjQzJFN1BjZkF4K0Ja?=
 =?utf-8?B?TjhXU1l2d0o5RVcvdmtUY1NhejQ5WWhHZWN1WjZTS3A1ZFFYcG1QWkZNSDIr?=
 =?utf-8?B?bHYwaU1OLzlZNnN5dmJOcTdzKytrUktJSEdmTnB5ZW5XL0NYNDdqNVlReXNE?=
 =?utf-8?B?bmVxaWx5Y25hWEtONXM1NFJxdmdhdUZWZ1VRV2tWNzcrZm13dDF1TmhkMnU1?=
 =?utf-8?B?TkxmcFFKTGxBRndpVWM3L2czbndFdWlpMmhUeGhxYXphNlM3NENGcEV0M3lU?=
 =?utf-8?B?alNmUzNvN0JxMTE3NTh5MzBLOU85c2w4OFBLRGwyVm5seDF6OEZ5eE82Nmdk?=
 =?utf-8?B?TEF5NE0yT3cyTkJKRit1bVlLdVZBRGtTaTNjRFlienJwdFVqRXpmMkJYTC9P?=
 =?utf-8?B?R1VoOHR5N2VMdFRVZlVrenBTZ0tFUDdRem5lOGRaYzJxaDFoNHdYSTM5MW45?=
 =?utf-8?B?R2NQU0lFRjdyZ3U1Mk0yQ3hXZ0tUWUpPWVpFZ2tCM0g1VlRDZHhoWVBWY2l6?=
 =?utf-8?B?ZyszYnpscWNld2RnNUtFS0ZKS0s5Si91Vjl5ZDBYQmRrdlBmcC9mNkhSTU5Q?=
 =?utf-8?B?NmxYdGZ1MC9NeDVUSkkwdkpoQk9SVkZGQXF5RmRSaUZxUEVyTkkvMGpta0FW?=
 =?utf-8?B?UTJhd3dLZ3dIaHN0M1k4Nk80bUtUelVIWlhiK1JaMWkyanpocWdCd3RrYytR?=
 =?utf-8?B?NCtPVjZoVFB0Q1NjUHVMMStwMjVHcFdXd0xxYjZQZHJ1Q3pHSEU0dXN2WFcx?=
 =?utf-8?B?dmxLMzZpanFmM0h1VCsrbmEwbjBaSE1vanVGYzNRV1VRL3Y4ZE1GUkdkdkdq?=
 =?utf-8?B?YnVZNFN3ckJNNHhYNmx3SnNvbHFaTTllY3dLWjJpaG1aWHJiSFdDcG94OUZa?=
 =?utf-8?B?cDVXcVhTNGw3U2RqREdHVG5makMrTStla29ZMVNGUm1sRklkSW40NldlajF1?=
 =?utf-8?Q?x3dzD/cmG3j2b3vL+2YDmNVze?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2C1160B5F2A484CA6F49DAE1C35BE77@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	atA5bj/y88h989mQAjegdzo2TYI6zRWTSirn83PJElL8sq1ifdLtQG1Su7SZbWjb176hSiMBcIUg7ZabfF6Zq2avho7Q6UbekoRVvYjyayvt33JfLejDw/bA7E0CscqyWlCtgXFtiD4JfQXHpkVbKuoHS5bfLuQrFm9Wfq+ZzfJ1M47PVd/8EmZYD752WOYl3NhCeVQCojZ2r77uCDdYhADAgVrzsclusyyXfzJv2mVZ+e02obbEQE3IrvVvNbOY/Acydxc26O4Kym/DBqn2f+Yjo1k20Os8XgqZ517fPye0K2gXv4ZcyuRjwxX7eIzZDkZPKdlXBYSUk+E1n60qQ6ZYNbrwt8bQ/BPPLZ9DkJXPX2ALQfhI4laZ04RVycPi19wQCdwfU4hbu3oDWIt1J+kXGix4Jf+yUXsG/Ir5VYdiXmnwVXO1yH9XhPk4pBbzkpvjCMMK45G/L9W3/rel5NCq04yOH/SJm5FU73aBjHiffEuv4BF4ZbCwUzWwivbYvgaVEF7PK/SGzPcoMGDnmTDNF1rdQ/dIHhtavPtCN3rYKLDCBmuyhTpN6mnk1YkepMot6P4Zup92zIacMu2zmOYWWy0j18Vqr8AGV0IwsDz29yC7/4zE2Qr7pSo7boLbzgP+NJe/E7qFsIkMndby7w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563fa84c-6a8e-4232-a986-08dca0010232
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 10:22:17.1438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QcSO7L7gumEvfftr9ibhkMkHQ7JNg6l0BUZH7LcA2sy0vSBvdAnKP/rzaj0eV4RY79yJxf4eiLGqum6ymHTvYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7666
X-Proofpoint-ORIG-GUID: VG6GkFnP4t9nhr0q4c3PYDNAytsWxH3L
X-Proofpoint-GUID: VG6GkFnP4t9nhr0q4c3PYDNAytsWxH3L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_01,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407090070

DQoNCk9uIDcvOS8yNCAwMjoyMCwgSGF1a2UgTWVocnRlbnMgd3JvdGU6DQo+IFRoZSBzaXplIG9m
IHRoZSBpbnRlcm5hbCBSQU0gb2YgdGhlIERlc2lnbldhcmUgVVNCIGNvbnRyb2xsZXIgY2hhbmdl
ZA0KPiBiZXR3ZWVuIHRoZSBkaWZmZXJlbnQgTGFudGlxIFNvQ3MuIFdlIGhhdmUgdGhlIGZvbGxv
d2luZyBzaXplczoNCj4gDQo+IEFtYXpvbiArIERhbnViZTogOCBLQnl0ZQ0KPiBBbWF6b24gU0Ug
KyBhcngxMDA6IDIgS0J5dGUNCj4geHJ4MjAwICsgeHJ4MzAwOiAyLjUgS0J5dGUNCj4gDQo+IEZv
ciBEYW51YmUgU29DIHdlIGRvIG5vdCBwcm92aWRlIHRoZSBwYXJhbXMgYW5kIGxldCB0aGUgZHJp
dmVyIGRlY2lkZQ0KPiB0byB1c2Ugc2FuZSBkZWZhdWx0cywgZm9yIHRoZSBBbWF6b24gU0UgYW5k
IGFyeDEwMCB3ZSB1c2Ugc21hbGwgZmlmb3MNCj4gYW5kIGZvciB0aGUgeHJ4MjAwIGFuZCB4cngz
MDAgU0NzIGEgbGl0dGxlIGJpdCBiaWdnZXIgcGVyaW9kaWMgZmlmby4NCj4gVGhlIGF1dG8gZGV0
ZWN0aW9uIG9mIG1heF90cmFuc2Zlcl9zaXplIGFuZCBtYXhfcGFja2V0X2NvdW50IHNob3VsZA0K
PiB3b3JrLCBzbyByZW1vdmUgaXQuDQo+IA0KPiBUaGlzIHBhdGNoIGlzIGluY2x1ZGVkIGluIE9w
ZW5XcnQgZm9yIG1hbnkgeWVhcnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIYXVrZSBNZWhydGVu
cyA8aGF1a2VAaGF1a2UtbS5kZT4NCg0KQWNrZWQtYnk6IE1pbmFzIEhhcnV0eXVueWFuIDxobWlu
YXNAc3lub3BzeXMuY29tPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMg
fCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
MjUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9kd2MyL3BhcmFtcy5jIGIvZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYw0KPiBpbmRl
eCA1YTE1MDBkMGJkZDkuLmE5MzdlYWRiYzliMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2Iv
ZHdjMi9wYXJhbXMuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5jDQo+IEBAIC0x
MzMsNyArMTMzLDE1IEBAIHN0YXRpYyB2b2lkIGR3YzJfc2V0X3JrX3BhcmFtcyhzdHJ1Y3QgZHdj
Ml9oc290ZyAqaHNvdGcpDQo+ICAgCXAtPm5vX2Nsb2NrX2dhdGluZyA9IHRydWU7DQo+ICAgfQ0K
PiAgIA0KPiAtc3RhdGljIHZvaWQgZHdjMl9zZXRfbHRxX3BhcmFtcyhzdHJ1Y3QgZHdjMl9oc290
ZyAqaHNvdGcpDQo+ICtzdGF0aWMgdm9pZCBkd2MyX3NldF9sdHFfZGFudWJlX3BhcmFtcyhzdHJ1
Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzJfY29yZV9wYXJhbXMg
KnAgPSAmaHNvdGctPnBhcmFtczsNCj4gKw0KPiArCXAtPm90Z19jYXBzLmhucF9zdXBwb3J0ID0g
ZmFsc2U7DQo+ICsJcC0+b3RnX2NhcHMuc3JwX3N1cHBvcnQgPSBmYWxzZTsNCj4gK30NCj4gKw0K
PiArc3RhdGljIHZvaWQgZHdjMl9zZXRfbHRxX2FzZV9wYXJhbXMoc3RydWN0IGR3YzJfaHNvdGcg
Kmhzb3RnKQ0KPiAgIHsNCj4gICAJc3RydWN0IGR3YzJfY29yZV9wYXJhbXMgKnAgPSAmaHNvdGct
PnBhcmFtczsNCj4gICANCj4gQEAgLTE0MiwxMiArMTUwLDIxIEBAIHN0YXRpYyB2b2lkIGR3YzJf
c2V0X2x0cV9wYXJhbXMoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnKQ0KPiAgIAlwLT5ob3N0X3J4
X2ZpZm9fc2l6ZSA9IDI4ODsNCj4gICAJcC0+aG9zdF9ucGVyaW9fdHhfZmlmb19zaXplID0gMTI4
Ow0KPiAgIAlwLT5ob3N0X3BlcmlvX3R4X2ZpZm9fc2l6ZSA9IDk2Ow0KPiAtCXAtPm1heF90cmFu
c2Zlcl9zaXplID0gNjU1MzU7DQo+IC0JcC0+bWF4X3BhY2tldF9jb3VudCA9IDUxMTsNCj4gICAJ
cC0+YWhiY2ZnID0gR0FIQkNGR19IQlNUTEVOX0lOQ1IxNiA8PA0KPiAgIAkJR0FIQkNGR19IQlNU
TEVOX1NISUZUOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyB2b2lkIGR3YzJfc2V0X2x0cV94cngy
MDBfcGFyYW1zKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCj4gK3sNCj4gKwlzdHJ1Y3QgZHdj
Ml9jb3JlX3BhcmFtcyAqcCA9ICZoc290Zy0+cGFyYW1zOw0KPiArDQo+ICsJcC0+b3RnX2NhcHMu
aG5wX3N1cHBvcnQgPSBmYWxzZTsNCj4gKwlwLT5vdGdfY2Fwcy5zcnBfc3VwcG9ydCA9IGZhbHNl
Ow0KPiArCXAtPmhvc3RfcnhfZmlmb19zaXplID0gMjg4Ow0KPiArCXAtPmhvc3RfbnBlcmlvX3R4
X2ZpZm9fc2l6ZSA9IDEyODsNCj4gKwlwLT5ob3N0X3BlcmlvX3R4X2ZpZm9fc2l6ZSA9IDEzNjsN
Cj4gK30NCj4gKw0KPiAgIHN0YXRpYyB2b2lkIGR3YzJfc2V0X2FtbG9naWNfcGFyYW1zKHN0cnVj
dCBkd2MyX2hzb3RnICpoc290ZykNCj4gICB7DQo+ICAgCXN0cnVjdCBkd2MyX2NvcmVfcGFyYW1z
ICpwID0gJmhzb3RnLT5wYXJhbXM7DQo+IEBAIC0yOTcsOCArMzE0LDExIEBAIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgZHdjMl9vZl9tYXRjaF90YWJsZVtdID0gew0KPiAgIAl7IC5jb21wYXRp
YmxlID0gImluZ2VuaWMseDE4MzAtb3RnIiwgLmRhdGEgPSBkd2MyX3NldF94MTYwMF9wYXJhbXMg
fSwNCj4gICAJeyAuY29tcGF0aWJsZSA9ICJpbmdlbmljLHgyMDAwLW90ZyIsIC5kYXRhID0gZHdj
Ml9zZXRfeDIwMDBfcGFyYW1zIH0sDQo+ICAgCXsgLmNvbXBhdGlibGUgPSAicm9ja2NoaXAscmsz
MDY2LXVzYiIsIC5kYXRhID0gZHdjMl9zZXRfcmtfcGFyYW1zIH0sDQo+IC0JeyAuY29tcGF0aWJs
ZSA9ICJsYW50aXEsYXJ4MTAwLXVzYiIsIC5kYXRhID0gZHdjMl9zZXRfbHRxX3BhcmFtcyB9LA0K
PiAtCXsgLmNvbXBhdGlibGUgPSAibGFudGlxLHhyeDIwMC11c2IiLCAuZGF0YSA9IGR3YzJfc2V0
X2x0cV9wYXJhbXMgfSwNCj4gKwl7IC5jb21wYXRpYmxlID0gImxhbnRpcSxkYW51YmUtdXNiIiwg
LmRhdGEgPSAmZHdjMl9zZXRfbHRxX2RhbnViZV9wYXJhbXMgfSwNCj4gKwl7IC5jb21wYXRpYmxl
ID0gImxhbnRpcSxhc2UtdXNiIiwgLmRhdGEgPSAmZHdjMl9zZXRfbHRxX2FzZV9wYXJhbXMgfSwN
Cj4gKwl7IC5jb21wYXRpYmxlID0gImxhbnRpcSxhcngxMDAtdXNiIiwgLmRhdGEgPSAmZHdjMl9z
ZXRfbHRxX2FzZV9wYXJhbXMgfSwNCj4gKwl7IC5jb21wYXRpYmxlID0gImxhbnRpcSx4cngyMDAt
dXNiIiwgLmRhdGEgPSAmZHdjMl9zZXRfbHRxX3hyeDIwMF9wYXJhbXMgfSwNCj4gKwl7IC5jb21w
YXRpYmxlID0gImxhbnRpcSx4cngzMDAtdXNiIiwgLmRhdGEgPSAmZHdjMl9zZXRfbHRxX3hyeDIw
MF9wYXJhbXMgfSwNCj4gICAJeyAuY29tcGF0aWJsZSA9ICJzbnBzLGR3YzIiIH0sDQo+ICAgCXsg
LmNvbXBhdGlibGUgPSAic2Ftc3VuZyxzM2M2NDAwLWhzb3RnIiwNCj4gICAJICAuZGF0YSA9IGR3
YzJfc2V0X3MzYzY0MDBfcGFyYW1zIH0s

