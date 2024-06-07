Return-Path: <linux-usb+bounces-11035-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB55900E41
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2024 00:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80EF9B22085
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 22:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F43155A46;
	Fri,  7 Jun 2024 22:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rzm/EMY5";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ipaP6xFy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KbtP/X+U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7BA18C3B
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 22:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717801066; cv=fail; b=N+Oob9CDjv/2Dd5NEJG2BWFjpokz7yuHWpJy7NfJQJkb2mruxNWL4809y2x252924I/inVZHSfXuIgCIL4nDBaGUzAPC87wVdxFLnh56Kb06XP+KKeEQC6OEOLhxRzkAz4pHgH4fwz4jUMI6aV1giOLEFkHvYDVGiaoAxH3HNlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717801066; c=relaxed/simple;
	bh=frsw7uVWc4/6dWL9J3f/f9MZO1bQJJ1lRlGdBjRVchQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RYXZUS7WNu6tv2KQqx9waa5gh3TSw8Y13iqqJzsmFNFWQorlGZKHPp45H2RP6K9R8DH21L+SNniIfJpX7hYlepOJP5qNH1aBzdL5tAv5MkVjQObvwOQXs9dIG1LvQZO4rYPbOrB82na/jsZDB74TtN8I86fB3FnWoYErke9mpQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rzm/EMY5; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ipaP6xFy; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KbtP/X+U reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457LaVrr008405;
	Fri, 7 Jun 2024 15:57:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=frsw7uVWc4/6dWL9J3f/f9MZO1bQJJ1lRlGdBjRVchQ=; b=
	rzm/EMY58theuwDbmJw8uHQTe1cyiGXm1jPrqhwEzqczKxG5diz0R885I+YDW6vx
	h9BT/E2BE8SFjeFqVhD3uL5yE4e0iHzEm/UpR9pzyBAEYCpxFbpKF9medrWQG3bU
	Q7PSssgJfqqQVlZQm+tXmtL/43UVJDzDqecpiGBYgk1zyZEszyoXQeB9xYDUGKHF
	g8BpPEL/K0vMpkV8xn3H3b8UDrMea+obNYYzVYqoK0TWUp4AAJoqUVOYEeQFC9ah
	hrcijOL5kBM+pRCkri83m90vw463+aQdSB+8JmU983f1M7JFAoyCsFmEbyxQ/f20
	c5zyL6SH3URK6r7Y8fR7Vw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3yg2njwm0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 15:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1717801060; bh=frsw7uVWc4/6dWL9J3f/f9MZO1bQJJ1lRlGdBjRVchQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ipaP6xFy0cLTP5augCVZU1XoKV96VHAqis7oR3Y3sCfwK/cd1XL/cBZ//xv2Hz2qF
	 BQX/3g70E3D6SUSb+gnxLkx/p+rOIpiMWV8lS/j42NiNvnxd6j6pdHPwAPDqBL4Nex
	 2yhakaCwoimJpAbPRKDC81AiQwfRDWC50XT0EMmzKxVC1GW3+Csccw9QG7eaqGcdXE
	 fDnr0uQKqS7Tw2/aesEWD8N04Q20tS7qgHsLiY1eqZDIgyFanweZdFv9LnlSiEo3xo
	 2X9Q3TK4YKsdSeBMkSCdHYGje2COXT1dYOVGzEYVmDCiyX93EyP8ZvSAuGb8IkgYBK
	 v6WVEuGX62+Nw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 26E6E40453;
	Fri,  7 Jun 2024 22:57:40 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DE89DA00AC;
	Fri,  7 Jun 2024 22:57:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=KbtP/X+U;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 477D540363;
	Fri,  7 Jun 2024 22:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LX5fI3+CNLuUesNmU2tjRg2qR5VcdUklotc3MEm/B3xfIJTzu/OdGtbKwcgNK2iksptWx8KO9wqYvLiWEaNjlg3++9DIYvGz5m2u2a8Q+2hualqEGQZrSsQmqKR62QSllZtns0g/ZLvZCTxlO8J1sroub4mJmFZedRvvl+jmAD3ZzEG+bFFSDFMTD38LC74mMJBTXyfH6L5kkCfkxLo1xOSDQ3IvM9nr7IuZjR2N8JlnNhtduYVpYPMqyEgOhoEOMsBVcoGbfeycjelzXS88qLwNXzPN4CTWADh0LOq++Gx7AQr0XyamMLjzZKiHF2abwI4Mbp0CueiiO43WaWB8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frsw7uVWc4/6dWL9J3f/f9MZO1bQJJ1lRlGdBjRVchQ=;
 b=SDVQKIQjMykZ9G0Njxp02WzIJZ0HkbbE7rWJeluzk7cqyuOPPb/OgOEjjBte/TQGDMFHZwia/XrvhhVcPSYOm3FB6o0YJ9Sh41+HWumtKFi6AqV3yFgB4wm/JQilSakKlQyfi/RTiyd9AOdJqbdOS2Nqn5ENnZf8yGrxclW+VCC04ficueSpRHEDSaxrfx7ikNNUxmbaFBEp1wzGQ7fB0BG2XqA6XCeCOMwHzCy3vJO+R5hZJz3WwFfp9p8Liz3XDv2PcFbXskuXk6lgjKZ0q7idMihu5oJhK5TmriCviDNfCjdsH76EeoTbf6GOOmWJ5H2xP47Ao6r7DrYWZx27yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frsw7uVWc4/6dWL9J3f/f9MZO1bQJJ1lRlGdBjRVchQ=;
 b=KbtP/X+UH8DPveUgQrPkHrbeNw24R26XH973YefAVGgydfhSJZiqhOJKrsIQDHT58w02Mt1yv9vurjg8MqufW54GedyLRxXfK4KI8vCWctKRmgyA2wX4/G/70O+RXrWvbxVhUW6WXEqi82SFf7/Vq24OlZHoxkQ9l3HS2JF5xpE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ1PR12MB6146.namprd12.prod.outlook.com (2603:10b6:a03:45b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Fri, 7 Jun
 2024 22:57:34 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 22:57:33 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Topic: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Index: 
 AQHatbfXThCMnoxt4kuSB1VpY3Td2rG2ym4AgABJugCAASgMAIABAuCAgACmR4CAAPbwAIAAVn2AgACkcgCAARl9gA==
Date: Fri, 7 Jun 2024 22:57:33 +0000
Message-ID: <20240607225731.2d24p4as4x7mrfaf@synopsys.com>
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.c5f44c79-75b2-43c1-a791-806fe8b693cd@emailsignatures365.codetwo.com>
 <20240603131304.233403-1-mike.looijmans@topic.nl>
 <20240604010256.4dxamwvcjxug6xfb@synopsys.com>
 <0fceefc4-2b3c-41a4-a6ac-d0b6dbacc1f7@topic.nl>
 <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
 <023d03d8-ef52-41e5-be9b-d75be49c615c@topic.nl>
 <20240606002805.bziyz3y4bcysdysv@synopsys.com>
 <d4322992-8aa4-4eb7-b7f6-63b1b706ad7a@topic.nl>
 <20240606202127.6gdk6v3jevrmoyzk@synopsys.com>
 <a630f365-7a7b-46e9-b5a4-9b150f31d74f@topic.nl>
In-Reply-To: <a630f365-7a7b-46e9-b5a4-9b150f31d74f@topic.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ1PR12MB6146:EE_
x-ms-office365-filtering-correlation-id: 31099cb4-aea4-4d09-60a4-08dc874537dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OVo0LzlGMktaVmFjMC9aZGVNandCVi9iRlYvanVNVUlydXBvelRTYmx1eGRp?=
 =?utf-8?B?MFhOMGt0V0lMV3VwWnd6ZTFsY2hYaURpK0tCdkxwSGxVbGl4NUxSQU5FVFFv?=
 =?utf-8?B?Lzh6UnJwYXd2QXZZUStHRnVtYzFrbG1qYzA2ZithNnRlQTJaYkswV2NQZ0lm?=
 =?utf-8?B?cEdUN0J0Zm4wZVlUVVl1U3pFQXdRNGhVZmFEK1VqVFVrUDArR29PS0hWY0xu?=
 =?utf-8?B?d0FaQ2VxWDZEa1NIR1Q0WktTZDZuVVNGb2d4TnZwQWlDNm9CMldHZnU0UnZ0?=
 =?utf-8?B?bjVYTW9ZcmlkZXBhWVVRWEFOSjRkcFUyak1UMFI5aFpCeUI2RUc0TkY4enUr?=
 =?utf-8?B?VXJ1MkduMnMyVHRuWjNIZVUwcTZQQ1FzNHVPWFBhZlZPRWNJSkZBWlpQR1E5?=
 =?utf-8?B?Y3hwTU1DOXJzQWlVV05UZ3RBMUlvZXE1clZTYzB3WlB0OWMzd3cwR1ZTMXZJ?=
 =?utf-8?B?NEpBbit2UmxpeGJ6TnNieGpNNHFnamk0Ykh4R2M1LzJXL1A5b0ZxZHAvQzRE?=
 =?utf-8?B?SFphb1FPWFlqb0hVYTZsd1F2bzk1cXhRTEtucTBrZW53ZDdQeHkyK1ZiVVM1?=
 =?utf-8?B?OUNYdnNUMGRqQTNBK1Y3b21XbUlRazFZcHZIRkg2VGoybjdDS0s5dGZmTk1t?=
 =?utf-8?B?TnU2ZVMxSlExYmJsOERrN3VwUGxsQ2VQTGkwaUtkbVdnWVVjd1RSZVpKRC9T?=
 =?utf-8?B?bUU1VEgybEZTSFZ3V1Zua0Q4bnlUaGZxRmJnVllidHZTcUh3TVd2bW50WmZi?=
 =?utf-8?B?ajl2UU5rVzBWekdEZWh1WWNHaUhWbmp4QkZNb3JGbTBIbk1FZWZLdkd3bG5G?=
 =?utf-8?B?NlYrZXZVUjlZQXF5eEFTbTgyc1dObm9HaXNaV0R3RTVsMDEwVE1KU2czTlJG?=
 =?utf-8?B?cVhwNWZkbk9WTHhXUnZ4ZkhOL3NKbEZVRXlCVnUwMTFyOGVtOFVyVjE2U2J0?=
 =?utf-8?B?bUZCclVGanJwRlpJN0NMTmtTMURVdzdkaFNDSWxaT1BDNlZJVm5xdWxZN2hj?=
 =?utf-8?B?REYvWnFTRXhZYnRjR0hFQlVMNHk2MnZUZmFLY2ZjK3daVGxvTkdrMFV4dTZ5?=
 =?utf-8?B?d1RNWXFORWFDMU4wV1Vqcnl5MTRucmtqYXJESzMvdEc5VHIwTCtpck9PekJ2?=
 =?utf-8?B?UCs3VnFncmlzaXlmZlVyNGcwd1hEQkVTVCtMeUp5Z3ZORzBvK09OYUZHazVl?=
 =?utf-8?B?Sm92Sm94RCsxU2x6OWtiMU9VUUU0YlNJdGhzcm1VUWNjTE5TV2JWK1VLdURU?=
 =?utf-8?B?aW9GUjV4ZlVpbEpkRUczYm5yNUxmMllQUHpTWnREMFJQQllobmphL2tIK2Mr?=
 =?utf-8?B?NU5kcXNsT0RtWGNsd2NVcTYrL3FHSWQxRzdNSTNPWndaYng3VmUzV1lUUGtO?=
 =?utf-8?B?RVh5OWptd0EwM2ppVUt6K2pQNDFRSk5IT1orQ09CY3VUd2YxdDZvOE4zWTBW?=
 =?utf-8?B?eTBRaFNOS1U4RTVBdHBjMmgzcFVNZnlSTGwyY2Q3djJLZjUzZ1IwVUVIZzR4?=
 =?utf-8?B?Y2RONzRiOTNRaVBQNDhET2UxUzc4T0RRdzNldnpyT1V6QXJjZ3N3Ujh2aHVQ?=
 =?utf-8?B?UlBZSS9CSWNIdHArekNLY0hHd1FEWDh6RWtkZDRWeEppWUhuWWFRQTZQdTlh?=
 =?utf-8?B?S1RXZ3NwVDR5eDlEa3k1dHIwQTVHVTY3OEdaZGpRRnZoaUJvZWZyUTEzWE1B?=
 =?utf-8?B?Z3FxY2h0ZUl2V1pBdjhlSjkxSlhEcEJBTXlMQjAzQzJwYnF1ZDFWaWllTlVO?=
 =?utf-8?Q?LGCpDbofkNgpJcbKCO9tBd23eeXy82na+kvoEn3?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MGVTckoxUTQxVklMVmduYm10cjg0TjlkWkV3amF1cjg0T0ZmSEN5UFBLWER4?=
 =?utf-8?B?SHcwcnhCYVNBQkFKakVsSkQ2ZllPYlJ2Vk5OQUg0L3YzR3FudUsxdEFwMUM3?=
 =?utf-8?B?eHYyTDVEdUV3TDBHR3FROW9RdjdodnNGcHA2TkdpZ042OUltaDVES3NZUVJS?=
 =?utf-8?B?Z2c4MFp1dUFNMHJjYnNDajR3amFWVDZlVjBVSGRmSzhiQThFOXNzZnBTNnhx?=
 =?utf-8?B?c0FyamprQ2J1RThua3JSZDBPbDBzc2pRaDROOG9XVGJPSlJPbDROcTdPd1V3?=
 =?utf-8?B?THlZSnFsR1dCM0FUSzlUaDlRVXN1M2M0VjRveWltenp1WW82OXhxdVR6RzFZ?=
 =?utf-8?B?N1drQ1RoU25HUk9oWTE3azMyOTUwaDZLc2VqVnRDRWw2ZE1IcXBpYW9sYnFh?=
 =?utf-8?B?WFRpZW8xbXhWMjB4WXMvTWl6MHVQeWFCZEdyajIvcW9LSHVYRmxyT1dtQ0R0?=
 =?utf-8?B?eWJST0lqYXNVNmFCNHVDOFJoVDNIak5uWkNuc21LVWN0eDRKbG5rek5EOUNv?=
 =?utf-8?B?RmI0NjRqaDV2SHRLK2J3WXFFZ0VTczJzK2RDQjVFdmJhNUZUWGtvZklDdVlI?=
 =?utf-8?B?YVM3US8zNFFEcFloOVNzY1dGU2JTekcyc213b3Z5V0IyV2xIVjhkTThvdklq?=
 =?utf-8?B?RCtaVThZZ0JtWFpSV0RNcE5oYnY2cXhrS2VjZWVOL2loSGJBdlNreHBBeFZM?=
 =?utf-8?B?NTdzeHlJYktlWks3aTZZUXlPU0dnRjlleTQrc2gwNW12ZlZMSHZrdWIvZ0ky?=
 =?utf-8?B?L1MyTCtNMVd6UU1rNlFEY3FVdEtyL3pqZ2hmbm1IVEVhOHJ1b0hnaDBkOWFX?=
 =?utf-8?B?TlBGOXZQcmJjZ2VXY01RckxlZjJ4L1kvL0FLcEtHWWlzZzVDWlNOclZYNG5E?=
 =?utf-8?B?OUxSbzRpN1R3bExidUZseitRQjFCUlNFSis3R285ZVV1eTlVbGFZMTljMG1U?=
 =?utf-8?B?NWZoK2I3L2Q2Skk3S1R2cloveVZINDJ6amRTdVBSZldWdjEvaUJYa1RmTVBH?=
 =?utf-8?B?VWtjVFFvbG85RWc3VWNtWGc0ekRVdHpYa3NIYmlyL2RkUmx0aTh4YnNWekhX?=
 =?utf-8?B?bVFMcC9TRFRiOW9BSjNGWVdLRVFTeEVsUCtEc2s4NGhWcGMvYWhHTmRFZ1Ax?=
 =?utf-8?B?MnlWdmtKMld4cFF6bzRUTjlSVlpHL2xvWWdZaHo2UTI1amNiVTFCR3FDbXlx?=
 =?utf-8?B?WmlUY081T0I5OUM4RWVyZVlFekhYTFVFS1BuNG9RSUNuVDZtSUNicGc4UGhV?=
 =?utf-8?B?QlQ2R2xYTmxXYUFQL3czSDVtQS9WVU5iVkkrUkx0VG9URkVkTVI0RHdwcnVZ?=
 =?utf-8?B?bmk2REhLOURIMFVPYW90NlBOR0NObVpYNFlDR2tsM0tqMU1nbStuRGlpNEIv?=
 =?utf-8?B?Sk93WGJrNERLSFZnN08rLzZGSytGbTBvc2ZTdG1qS3VqY3h6Q2tJenMvY2lM?=
 =?utf-8?B?Y3Y0SmdqL0xJUlNseFc4VUJuM3VWQ2VSbzVaMmR1L2ZiQy9nUUhMK2R6NWxr?=
 =?utf-8?B?OGFSMlZnalFwYVVKVEIrUW1Ic0YwTlhMMVBHLzN4R05UUG1xSW5UYVF5UFFy?=
 =?utf-8?B?VnFMNVVxVlcvb3JSSU9mSjgwR0lmNVA0dnFiVzVCSUZIMzg3RFhqOEkxV2Y0?=
 =?utf-8?B?Z1FtTUdhTlJ0ek45Y0d6Yk1iMWhLZ3JueGN5QnVaeTRwdEgwUXpEWGtQcC9x?=
 =?utf-8?B?enhGaDREOEdoVXFPYjZJK1ZvWTY0NE5FNnEzazFVZXBvTDdyVUh1UWdPZHo5?=
 =?utf-8?B?WFAxV0NPTDZuUHpxVnB3Y1I1a1hHTG8xdDJ0MXlNZ2x4a2lRL1pXcnYvSTVL?=
 =?utf-8?B?OFltaHpzbTlkZnNkYzZYdGlQb0VNSEUrY2d4U2pDcHU2S2JzbEpuV29hM1g2?=
 =?utf-8?B?aTNoeFZTL0RlNWovaEF0YTZIRE9aTEhZalRFVzhIanppMnFiVXBtM2Yxb1lU?=
 =?utf-8?B?RS95Zms4MVZIdTZiUnhseFFmRXpFYllHL0NEMXFSZG8xMVFZS2JGOVduQitj?=
 =?utf-8?B?R2lSTWUvUkNlUmRaMmxpdm1ValB4VXYvZGk2VWVQdkVmMGk0amRFdW5ncG1n?=
 =?utf-8?B?Tmp5a21VNWlFS2RUNFdzQlc4czVVSXlpM1RSeVpiMUl4SEt3UDM1b0tvb3BV?=
 =?utf-8?B?Y3JLU0FWR3gxS3l2VHNaYW1yN1lyTHZ5TGV0WnBnbmpqM09lc0UrMGVWUjZN?=
 =?utf-8?B?Umc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7843EB908B6664CA0D83992615CE5F8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	dCWZJqVDyzl9jvFh9V59c4kkQIvpkw8/4+sW8kn7LAZZx6MdWgh7T/8UXSrNG1QmUaIgTK9E1BxyDflK+jo+wc0y5UCDnca22kHAP1JXxMu1g4W99Ek6HbpX6uz6BA3tUz2cUG5Yb4fWSGyjndYCzmH+bZAlDui8To1NLl5Ttv7WN/jLDB1vvt7xnZU5h85y/am1rspzcRZEDNBKKlRrByrn0L9hVhtQfvNjyYIO3tZU3e0r27VpMB3H748lUjbZLyfD/OOUnvAPslRE9xqsJYoSESRCq2hHxk6S2DwBadLtA04YO9KlbnKQnrr62Xy8khBEYkvbi7Fd8UTJjet3SaJFZc5X5Cc2qAeHFCsbOGGdj/vXv1QO7O5woBdOelre5m81Be16yYH3vfpYmF2wt555Ab/26I/JolXRip9hMRfn61Wps+JDdZ/KYVZB+Vc8IRDhtdRHUyTTEaR5eZugzTXucyp4aYuXgNU+7Vg01450Rwl7E4QBrQU213xPmsC2+zptjleEIR11Gl0FJvnzi4a9XbnBNrcSH0Px+YpwbL5E56v3GvGiXv6AeCB23aqHhRIWP6Ip0n9O01l2d3g7LbUqgrq/fI/RQ+LeDkTQjBqooVcApviTzf+tgfJB753Rr6Gzz4AF3VoDF510tAzWSg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31099cb4-aea4-4d09-60a4-08dc874537dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 22:57:33.9107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aKbCXQX/8i39MNKcL8jxq8W5+r5tzlEvtvsumWQ8X6JqplrEixu7yxkuhjy02c9tJLLIjdfWb8ll9TUupnVroQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6146
X-Proofpoint-GUID: nozOV1OI2XMAoGfN16xAV66FfkiEZnsh
X-Proofpoint-ORIG-GUID: nozOV1OI2XMAoGfN16xAV66FfkiEZnsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_15,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 mlxlogscore=850
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406070171

T24gRnJpLCBKdW4gMDcsIDIwMjQsIE1pa2UgTG9vaWptYW5zIHdyb3RlOg0KPiBPbiAwNi0wNi0y
MDI0IDIyOjIxLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1LCBKdW4gMDYsIDIwMjQs
IE1pa2UgTG9vaWptYW5zIHdyb3RlOg0KPiA+ID4gT24gMDYtMDYtMjAyNCAwMjoyOCwgVGhpbmgg
Tmd1eWVuIHdyb3RlOg0KPiA+ID4gPiBPbiBXZWQsIEp1biAwNSwgMjAyNCwgTWlrZSBMb29pam1h
bnMgd3JvdGU6DQo+ID4gPiA+ID4gT24gMDUtMDYtMjAyNCAwMTowNiwgVGhpbmggTmd1eWVuIHdy
b3RlOg0KPiA+ID4gPiA+ID4gSGksDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IE9uIFR1ZSwg
SnVuIDA0LCAyMDI0LCBNaWtlIExvb2lqbWFucyB3cm90ZToNCj4gPiA+ID4gPiA+ID4gT24gMDQt
MDYtMjAyNCAwMzowMywgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IEhpLA0K
PiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IE9uIE1vbiwgSnVuIDAzLCAyMDI0LCBN
aWtlIExvb2lqbWFucyB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+IFdoZW4gZGlzY29ubmVjdGlu
ZyB0aGUgVVNCIGNhYmxlIG9uIGFuIExTMTAyOCBkZXZpY2UsIG5vdGhpbmcgaGFwcGVucw0KPiA+
ID4gPiA+ID4gPiA+ID4gaW4gdXNlcnNwYWNlLCB3aGljaCBrZWVwcyB0aGlua2luZyBldmVyeXRo
aW5nIGlzIHN0aWxsIHVwIGFuZCBydW5uaW5nLg0KPiA+ID4gPiA+ID4gPiA+ID4gVHVybnMgb3V0
IHRoYXQgdGhlIERXQzMgY29udHJvbGxlciBvbmx5IHNlbmRzIERXQzNfREVWSUNFX0VWRU5UX1NV
U1BFTkQNCj4gPiA+ID4gPiA+ID4gPiA+IGluIHRoYXQgY2FzZSwgYW5kIG5vdCBhIERXQzNfREVW
SUNFX0VWRU5UX0RJU0NPTk5FQ1QgYXMgb25lIHdvdWxkDQo+ID4gPiA+ID4gPiA+ID4gPiBleHBl
Y3QuIEFzIGEgcmVzdWx0LCBzeXNmcyBhdHRyaWJ1dGUgInN0YXRlIiByZW1haW5zICJjb25maWd1
cmVkIg0KPiA+ID4gPiA+ID4gPiA+ID4gdW50aWwgc29tZXRoaW5nIHJlc2V0cyBpdC4NCj4gPiA+
ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gRm9yd2FyZCB0aGUgInN1c3BlbmRlZCIg
c3RhdGUgdG8gc3lzZnMsIHNvIHRoYXQgdGhlICJzdGF0ZSIgYXQgbGVhc3QNCj4gPiA+ID4gPiA+
ID4gPiA+IGNoYW5nZXMgaW50byAic3VzcGVuZGVkIiB3aGVuIG9uZSByZW1vdmVzIHRoZSBjYWJs
ZSwgYW5kIGhlbmNlIGFsc28NCj4gPiA+ID4gPiA+ID4gPiA+IG1hdGNoZXMgdGhlIGdhZGdldCdz
IHN0YXRlIHdoZW4gcmVhbGx5IHN1c3BlbmRlZC4NCj4gPiA+ID4gPiA+ID4gPiBPbiBkaXNjb25u
ZWN0aW9uLCBkaWQgeW91IHNlZSBkaXNjb25uZWN0IGludGVycnVwdD8gSWYgc28sIGl0IHNob3Vs
ZA0KPiA+ID4gPiA+ID4gPiA+IHRyYW5zaXRpb24gdG8gVVNCX1NUQVRFX05PQVRUQUNIRUQuIFRo
aXMgY2hhbmdlIGRvZXNuJ3Qgc2VlbSB0byBkaXJlY3RseQ0KPiA+ID4gPiA+ID4gPiA+IGFkZHJl
c3MgeW91ciBpc3N1ZS4gQ2FuIHlvdSBwcm92aWRlIHRoZSBkcml2ZXIgdHJhY2Vwb2ludHM/DQo+
ID4gPiA+ID4gPiA+IFRoZSBkZXZpY2UgZG9lc24ndCBpc3N1ZSBhIGRpc2Nvbm5lY3QgZXZlbnQs
IEkgZGlkbid0IGhhdmUgdHJhY2luZyBlbmFibGVkDQo+ID4gPiA+ID4gPiA+IGluIHRoZSBrZXJu
ZWwgYnV0IGFkZGVkIHNvbWUgZGV2X2luZm8oKSBjYWxscyB0byBkZXRlcm1pbmUgd2hhdCB3YXMg
Z29pbmcNCj4gPiA+ID4gPiA+ID4gb24uIEFkZGVkIHRoaXMgdG8gZHdjM19wcm9jZXNzX2V2ZW50
X2VudHJ5KCk6DQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBkZXZfaW5mbyhkd2MtPmRl
diwgImV2ZW50OiAweCV4IHR5cGU9MHgleCIsIGV2ZW50LT5yYXcsIGV2ZW50LT50eXBlLnR5cGUp
Ow0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gV2hlbiBkaXNjb25uZWN0aW5nIHRoZSBj
YWJsZSBmcm9tIHRoZSBob3N0LCBJIHNlZSB0aGlzOg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+ID4gW8KgwqAgNTAuODQxNDExXSBkd2MzIDMxMTAwMDAudXNiOiBldmVudDogMHg2MDg0IHR5
cGU9MHg0Mg0KPiA+ID4gPiA+ID4gPiBbwqDCoCA1MC44NDE0NTddIGR3YzMgMzExMDAwMC51c2I6
IGV2ZW50OiAweDQwODYgdHlwZT0weDQzDQo+ID4gPiA+ID4gPiA+IFvCoMKgIDUwLjg0MTQ5NF0g
ZHdjMyAzMTEwMDAwLnVzYjogZXZlbnQ6IDB4NjA4NCB0eXBlPTB4NDINCj4gPiA+ID4gPiA+ID4g
W8KgwqAgNTAuODQxNTM0XSBkd2MzIDMxMTAwMDAudXNiOiBldmVudDogMHg0MDg2IHR5cGU9MHg0
Mw0KPiA+ID4gPiA+ID4gPiBbwqDCoCA1MC44NDE1NzFdIGR3YzMgMzExMDAwMC51c2I6IGV2ZW50
OiAweDQwODYgdHlwZT0weDQzDQo+ID4gPiA+ID4gPiA+IFvCoMKgIDUyLjY1MDk5MF0gZHdjMyAz
MTEwMDAwLnVzYjogZXZlbnQ6IDB4MzA2MDEgdHlwZT0weDANCj4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+IFRoZSAiMHg0MDg2IiBhbmQgIjB4NjA4NCIgbWVzc2FnZXMgYXJlIGVuZHBvaW50
IGV2ZW50cyB0aGF0IG9jY3VyIGFsbCB0aGUNCj4gPiA+ID4gPiA+ID4gdGltZSB3aGlsZSBjb25u
ZWN0ZWQuIFRoZSBsYXN0IGV2ZW50IGlzIHRoZSAic3VzcGVuZCIgb25lLiBBZnRlciB0aGF0LCB0
b3RhbA0KPiA+ID4gPiA+ID4gPiBzaWxlbmNlLg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
ID4gSWYgeW91IG5lZWQgdHJhY2VzLCBwbGVhc2UgcG9pbnQgbWUgdG8gYSBkZXNjcmlwdGlvbiBv
biBob3cgdG8gb2J0YWluIHRoZW0uDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IExldCBtZSBrbm93IGlmIHlvdSBydW4gaW50byBpc3N1ZXMgZm9sbG93aW5nIHRo
aXMgaW5zdHJ1Y3Rpb25zIHRvDQo+ID4gPiA+ID4gPiBjYXB0dXJlIHRoZSB0cmFjZXBvaW50czoN
Cj4gPiA+ID4gPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2RvY3Mua2Vy
bmVsLm9yZy9kcml2ZXItYXBpL3VzYi9kd2MzLmh0bWwqcmVxdWlyZWQtaW5mb3JtYXRpb25fXztJ
dyEhQTRGMlI5R19wZyFiYWhmamlsNUhFVXEtZk9IQXdEZnVzdXRMSkNMb2duZnlMSFRGTGlTbFZ1
Wm90cHI5OVhCR2c3bkIwelJSbk5GX00xcHFFS2NWYTRLeE5Kd2gzX0YyZFpXd1ZLVGtVWSQNCj4g
PiA+ID4gPiBJJ3ZlIGF0dGFjaGVkIHRoZSB0cmFjZXMgYXMgYSB0YXJiYWxsLiBIb3BlIGl0IHN1
cnZpdmVzLg0KPiA+ID4gPiBHb3QgdGhlbS4gVGhhbmtzLg0KPiA+ID4gPiANCj4gPiA+ID4gPiBB
dCB0aGUgc3RhcnQsIHRoZSBVU0IgaXMgdXAgYW5kIHJ1bm5pbmcgKGFuZCBkb2luZyBldGhlcm5l
dCttYXNzIHN0b3JhZ2UpLiBJDQo+ID4gPiA+ID4gc2F2ZWQgdGhlIHRyYWNlIGFmdGVyIHB1bGxp
bmcgdGhlIFVTQiBjYWJsZS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gICBGcm9tIHRoZSBjYXB0dXJl
LCB3ZSBjYW4gc2VlIHRoYXQgdGhlcmUncyBubyBzeXN0ZW0gc3VzcGVuZCwgc28gdGhlcmUncw0K
PiA+ID4gPiBubyBzb2Z0LWRpc2Nvbm5lY3QuDQo+ID4gPiA+IA0KPiA+ID4gPiBCYXNlIG9uIHRo
ZSBzdXNwZW5kIGV2ZW50LCB5b3UncmUgcnVubmluZyBpbiB1c2IyIHNwZWVkIChpZ25vcmUgdGhl
DQo+ID4gPiA+IGluY29ycmVjdCBVMyBzdGF0ZSwgc2hvdWxkIGJlIEwyKToNCj4gPiA+ID4gDQo+
ID4gPiA+IAlpcnEvOTQtZHdjMy02MzEgICAgIFswMDBdIEQuLjEuICAgMTQ5LjEzOTI5MDogZHdj
M19ldmVudDogZXZlbnQgKDAwMDMwNjAxKTogU3VzcGVuZCBbVTNdDQo+ID4gPiA+IA0KPiA+ID4g
PiBUaGUgRFNUUyBmcm9tIHRoZSByZWdkdW1wIGluZGljYXRlZCB0aGF0IHlvdSdyZSBzdGlsbCBp
biBMMiBkZXNwaXRlDQo+ID4gPiA+IGRpc2Nvbm5lY3RlZC4gTG9va3MgbGlrZSB0aGUgcGh5IHdh
cyB1bmFibGUgdG8gZGV0ZWN0IGFuZCB3YWtldXAgZnJvbQ0KPiA+ID4gPiB0aGUgZGlzY29ubmVj
dGlvbiB0byBub3RpZnkgdGhlIGNvbnRyb2xsZXIuDQo+ID4gPiA+IA0KPiA+ID4gPiBDYW4geW91
IGV4cGVyaW1lbnQgd2l0aCBzZXR0aW5nICJzbnBzLGRpc191Ml9zdXNwaHlfcXVpcmsiIHRvIGRp
c2FibGUNCj4gPiA+ID4gdXNiMiBwaHkgc3VzcGVuZC4NCj4gPiA+IEFkZGluZyBzbnBzLGRpc191
Ml9zdXNwaHlfcXVpcmsgZG9lc24ndCBtYWtlIGEgZGlmZmVyZW5jZSwgYmVoYXZpb3IgaXMNCj4g
PiA+IGlkZW50aWNhbC4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiA+IERvZXMgeW91ciBkZXZpY2Ug
c3VwcG9ydCBTdXBlclNwZWVkPyBJZiBzbywgZG8geW91IG9ic2VydmUgdGhlIHNhbWUNCj4gPiA+
ID4gYmVoYXZpb3Igd2hpbGUgb3BlcmF0aW5nIGluIFN1cGVyU3BlZWQ/DQo+ID4gPiBKdXN0IGNo
ZWNrZWQsIHN0aWxsIGNvbm5lY3RzIHdpdGggc3VwZXJzcGVlZC4gV2hhdCBsZWQgeW91IHRvIHRo
aW5rIGl0IHdhcw0KPiA+ID4gb25seSBoaWdoIHNwZWVkPw0KPiA+ID4gDQo+ID4gQml0KDQpIG9m
IGV2ZW50IGluZm8gKDAwMDMpIGZyb20gZGV2aWNlIGV2ZW50IHZhbHVlICgwMDAzMDYwMSkgaW5k
aWNhdGVzDQo+ID4gdXNiMiBzcGVlZC4NCj4gPiANCj4gPiBSZWdpc3RlciBEU1RTIGZpZWxkIDI6
MCBpbmRpY2F0ZXMgZnVsbHNwZWVkLiBFdmVuIHRob3VnaCB0aGlzIHdhcw0KPiA+IGNhcHR1cmVk
IGFmdGVyIGRpc2Nvbm5lY3Rpb24sIHRoZSBsaW5rc3RhdGUgZGlkIG5vdCBjaGFuZ2UsIHdoaWNo
IGxlZCBtZQ0KPiA+IHRvIHRoaW5rIHRoYXQgdGhlIGNvbm5lY3RlZCBzcGVlZCBkaWQgbm90IGNo
YW5nZSB0byBFcy5EaXNhYmxlIGVpdGhlci4NCj4gPiANCj4gPiA+IERvIHlvdSB3YW50IG1lIHRv
IHNlbmQgbmV3IHRyYWNlcz8NCj4gPiA+IA0KPiA+IENhbiB5b3UgYWxzbyB0cnkgdG8gZGlzYWJs
ZSB1c2IzIHBoeSBzdXNwZW5kIHdpdGgNCj4gPiAic25wcyxkaXNfdTNfc3VzcGh5X3F1aXJrIiBp
ZiB5b3UgdGhpbmsgaXQncyBjb25uZWN0ZWQgaW4gU3VwZXJTcGVlZD8NCj4gDQo+IEFkZGVkIHRo
aXMgdG8gdGhlIGRldmljZXRyZWUsIGJ1dCBhbHNvIG5vIGNoYW5nZSBpbiBiZWhhdmlvci4NCj4g
DQo+IA0KPiA+IFBsZWFzZSBjYXB0dXJlIHRoZSB0cmFjZXMgYWdhaW4gaWYgaXQncyBvcGVyYXRp
bmcgaW4gU3VwZXJTcGVlZC4NCj4gDQo+IEkndmUgYXR0YWNoZWQgbmV3IHRyYWNlcy4gQ29ubmVj
dGVkIGF0IHN1cGVyc3BlZWQgKGhvc3QgcmVwb3J0cyAic3VwZXJzcGVlZCINCj4gaW4gaXRzIGRt
ZXNnIGxvZywgYW5kIHRoZSByZWFsIGRhdGEgdHJhbnNmZXIgc3BlZWQgaXMgd2F5IGFib3ZlIGhp
Z2hzcGVlZCkNCj4gDQo+IEkgYWRkZWQgcmVnaXN0ZXIgZHVtcHMgYmVmb3JlIGFuZCBhZnRlciB0
aGUgZGlzY29ubmVjdC4NCj4gDQoNClRoYW5rcyBmb3IgdGhlIHRyYWNlLiBJdCdzIGluZGVlZCBv
cGVyYXRpbmcgaW4gU3VwZXJTcGVlZCBpbiB0aGUNCmNvbm5lY3RlZCByZWdkdW1wLiBIb3dldmVy
LCB0aGUgR1VTQjNQSVBFQ1RMLlNVU1BFTkRFTkFCTEUgaXMgc3RpbGwgc2V0Lg0KQ2FuIHlvdSBk
b3VibGUgY2hlY2sgaWYgeW91IHByb3Blcmx5IHNldCB0aGUgInNucHMsZGlzX3UzX3N1c3BoeV9x
dWlyayI/DQoNClRoYW5rcywNClRoaW5o

