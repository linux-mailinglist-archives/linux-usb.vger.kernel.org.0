Return-Path: <linux-usb+bounces-28265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8513BB8390B
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 10:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4916A3BF0E2
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 08:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8476A2FE044;
	Thu, 18 Sep 2025 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="KsRRVdsa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E6E2FDC3F
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758184778; cv=fail; b=Cga+iiz2JiI4A0TmDxLkV4M5JijY8GDVbim+mIumZ5nJr7c7HXPq4J8LgrJH4KQrh3EY3+Vr1ElNiZdhgYscqhGiXNjDCPMB4RBtOr5/RjvPny8faT3Yvof/QULSs0jn+E9XLfZ3ZQzN83S9lZJwOgAHgto6wPWZMQgoB0aQZO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758184778; c=relaxed/simple;
	bh=aTiobwCulPZbe4H3+Bek5N44ofGX94WPsQ87XTsv9PM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WVHHKtgIaEnerU2D9xfMbbQmHaNCQoNVWC4xmy1mRjE+2WySaD4nXOB6YkpSTEWz/MugWY5hIKdgNySEMLqgC/xCar3nP5qP9VDfYG6UjQ5DAY+v/+K5wMaEhlMp03UqPoXVP8TgalFKH7vaAgyheVuHIfKmd/+PEEgEFXn0Ejc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=KsRRVdsa; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I52jJq021466
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 08:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=aTiobwCulPZbe4H3+Bek5N44
	ofGX94WPsQ87XTsv9PM=; b=KsRRVdsa6I9QraW/eWFfbQ5g4R+sHpXGQBdOJfe1
	gFst7BBKNCXLMKJoH/05ukwA3X6NWkvWQ1iAxNRBIPZSjWXJgITQPLbp3nCzRi5n
	7DoMLnMFKjUamxN7Gn6BYkpphkqmuK85EzVnH7YaKGXw+HSDjGdg95WzKkPsCfr3
	7pxDbyjh2zvLvgFbYsVrzAsQV0QbmZ0V42pFX+VbkhYRh1tOAhjwwGkt0jc5qOuc
	MRY160LoFtIOmmSZMNKW98IRYlSUGGUVXlMAQBVVH9Ew0RxfziA6dP4aTBTS1uUo
	ya2cJHLVCEAEJjWuwlmY1ruM1adRb5NK6YItteEmTQyGHw==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 497kq6vpcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 08:39:32 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 94742800376
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 08:39:31 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 20:39:14 -1200
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 20:39:13 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 20:39:13 -1200
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (192.58.206.35)
 by edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 20:39:13 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+He2mWJps4EzotLKCbvCO1tUjPAfzTg5n/d/emQt53bPGd5hz2kzQnAN4aQ3x6gauh+LzE6MM+qOijvOSiUOgCQZKKro3RTD+fL6iOMIAh/FInfltyErouuHdsa4jjvD4Wi5TMX0QZiO/FVdmmeeS3pvKJW0nN9sqYKMXO485LXHfD1PcieDXV66YOKVp9cFjmkRteuHODU8paoSvbmv8tplJnPu72hc00oUd+zPxvvotGSAbS1FL3HAhNrjHSvRzaUVlsUC6v8QKnuzunQRo7nusEZRkqmfAT4o6JRvxJdMP3iIbiCpB4uspvXTe4OzyWQOvwKSO1IuMT7xepzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTiobwCulPZbe4H3+Bek5N44ofGX94WPsQ87XTsv9PM=;
 b=kcR8/RtOwI3hrCC4TPSL6CW4sREpKQli1WvplXc34TyulIN/45rg3jYnNyNJ/d9mRoRP2cdg2IfErNZwYCxwXkypqbh9s9PIi8fVoxCLsRE7z0vAyih4bYjjQGIvuDbhwF9iW/Ux70WTZ0cu0PlagpjSql1NA3XS5oZ1+lkmBiB5JgoSA6QYV8qAaEr1q57twFqJQu3Xr8TtzTWmZnponpSMv26PWb5raunhfgpvjqLu7bJgnZuCykdTfvjhswM9AdVizSnbZQYdBG+2D8XU8yMQlqzkN8A3u0LN+eMgnWJz+S19y+LzB8ZDQqLSZyzxJZ4V9vs5MJwqXl7Eua1O2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c5::19)
 by SJ0PR84MB1846.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:434::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 08:39:11 +0000
Received: from MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::23e6:7d13:8aaf:96d1]) by MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::23e6:7d13:8aaf:96d1%7]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 08:39:11 +0000
From: "Ko, Kang Jun" <kang-jun.ko@hpe.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: USB: urb error log during reboot on devices with multiple serial
 consoles (Linux Kernel version 5.15.71)
Thread-Topic: USB: urb error log during reboot on devices with multiple serial
 consoles (Linux Kernel version 5.15.71)
Thread-Index: AQHcKHen6J7H/BFX0keotto+hLxEyQ==
Date: Thu, 18 Sep 2025 08:39:11 +0000
Message-ID: <MW5PR84MB20830480C70129C188178130BD16A@MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR84MB2083:EE_|SJ0PR84MB1846:EE_
x-ms-office365-filtering-correlation-id: 24591aec-977a-4c6f-2306-08ddf68ed77b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?lEy2fJeri9KkLdP12X5hL5BVddL9Hdh9s68+vTZ8xmuE6J0O3w9/L4xwok?=
 =?iso-8859-1?Q?CnZ5Zc/aB7YxM0a7UDeXuXNb6iICJPvjBq4l2Vfb7otCjAG7mO09i8wyka?=
 =?iso-8859-1?Q?yQqKUnFckqR6v09vFZlyvfT9FxWz6YdNpS46ntnphSJdTDP3qFIeWTptlR?=
 =?iso-8859-1?Q?d9AtsRMQ4ilwf3Vpj4vhhH+lxOOlvTDm+wa2QJMS80sZxZBj2dQPmRihv5?=
 =?iso-8859-1?Q?FeRV26LAMFEjpAX2HXPAbLHg/qSQ4C/hhNYJj/xIrXwG3j4wP81ay4gtX5?=
 =?iso-8859-1?Q?/+87TL/WQ/aO0L2V3xV5uBc0nYiJTUumtuIjkCuUNs3zuiHZsSYCtIZZ7T?=
 =?iso-8859-1?Q?FIrzDQDqUswnc4DZ8iVup8af9VPKcnlK0etusY1y1IKktnnHEtDFLEJ3o5?=
 =?iso-8859-1?Q?R4g/p2upQbIIhY1702kmAEBB16ykmwtmx267RBJB+uxkjlZKo0wtFKtzJA?=
 =?iso-8859-1?Q?x8b42bR3OezQbbg6IQXCb0JF3a+sKw4ZqPMODJvPzbKAtoZlt1CYIsYc8a?=
 =?iso-8859-1?Q?ZEnUWCCbcKocpHfkq/k+TbcUYjrNEKis2GZQvRl5srtfbTgrXmxV3c+S9g?=
 =?iso-8859-1?Q?5GrA5pLPnrWWOp599407u5p6hi3+wBiXvqFsmB13XxK51UuWzNBsi1RPzL?=
 =?iso-8859-1?Q?qBSjxLZbHhj9yo4lt+pw+NTplqVklsYe4WnQS5kxb3V6hHByWJu4Pj+QIC?=
 =?iso-8859-1?Q?4fy+uWtR9Kmm3JXJYNxTtSYBD0cypt5v63VnUIBXjAALXztg0yspDVFivQ?=
 =?iso-8859-1?Q?bMxk5JRY5otNTvVrJYbKnxdwjVXGws7Hs1NlG720FlOhbs9nl5kQjNrIcn?=
 =?iso-8859-1?Q?9XbTuhp84l+Nbou1MYReNZQ6vatF0+MDrg+dj+yBmmfFn3Lh0cgcXeMP3v?=
 =?iso-8859-1?Q?+u/d95PbNJed6fwasSPfxnVTWLGU2er58QTW68Tcqq37XSXV9Js7gkMW12?=
 =?iso-8859-1?Q?u2ZzFTya+oZBsPz/IbUHqCUdtZpdQfOIVnCbW6rbsmh4Qtm2nZRoiS8J7r?=
 =?iso-8859-1?Q?O8A9nvMz9M5vMYKEe0o2QgyS31E72VWVtzTLLuqSRn9FXReeWYaSQjjDjc?=
 =?iso-8859-1?Q?2ebjzd23o1TjlEXfqp6E85wdsYwP/X5trP1a5J6B07b6INW6LirnaH9CVD?=
 =?iso-8859-1?Q?qSSCbACEk4WnvUBDEPrQY2rPMa++SWpbDMLHf6qGIYs+867flZoSKWCgvn?=
 =?iso-8859-1?Q?malvCmTP1BTK1ioGACHn3YWKYHn5Ibc3720VKocGHsSAfrZWyF8qEGM9qa?=
 =?iso-8859-1?Q?FqhQWy9n0nACnwEHcKEpZ5mCU4jB4+NB62kbqU5qh1sz1rrg+w4byl654n?=
 =?iso-8859-1?Q?sgAvzsepxHr7dCPkHnkS+lkBF7F1hsDfFjHrneftaVFBPgro6xOB7+Dw+x?=
 =?iso-8859-1?Q?oDKBtpvoF3wKEnZ8A2SbovDYz97+gijTWD96vf+T6Z21eupDds6EEhMaXa?=
 =?iso-8859-1?Q?QTCxaI3wHZdlN0L7iA+zZGXeY/hvvWBqCiIZetsKur7F3dF3FKju7LgREa?=
 =?iso-8859-1?Q?ZWkdXFLNSPrq9wvCGM1YWLpWPzKYbuCGrFuHSZQvbM9g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/YTNxwRTRvs1g22Q0CNVv24xmnVPOUaT+7ewRBjd22qB5ouzmdkiJaxi7u?=
 =?iso-8859-1?Q?UpxKU9GFIks45eomDmHWXtq+ct6Mn60gp0Um1TfHhTyDflxi3SIZxBc7Sb?=
 =?iso-8859-1?Q?3ufWnudSDFEZB0A/JmtVJXtwoNSI4cGGAUjRi3yOPIRxS822aGUpsV64vU?=
 =?iso-8859-1?Q?k+/CkKxhNnFk4JVWRhnVlHrvolGlaNlCHCu3cMNQQhQYEzLa6WqDEy1xab?=
 =?iso-8859-1?Q?YYacXZaXffMG+Ovv4C8t9MAvaYBYDAer9Y+cthLf62hyEzXutdjAdykzSH?=
 =?iso-8859-1?Q?zg+3f38aJIgTm6khh+5DUz57FrU2l+xxjim6TKGpTry3GJYbVd32ea6eIG?=
 =?iso-8859-1?Q?SgMRgpdSA1c4Yxtm8hD/i7D8EAvWeb8pSi5OKQyYrDPfH6WQK5kEXwXWda?=
 =?iso-8859-1?Q?JQCbJVvqjHB4Y3j8UOn3TB5s6sC1BYdchCxI9tq/Fpq2+yjDOVTtClrtPq?=
 =?iso-8859-1?Q?0u6xX3hw0gNzwMDjqia5dcDPvzwvzSoQvk7Hh9PQYQvcm+KpaqYtz4VUt9?=
 =?iso-8859-1?Q?qWU4clANe7Si6iwfCh2u0WPFEEhUJNz4tDZBdolqtkN8RSZm6qxpSOF6yD?=
 =?iso-8859-1?Q?CakQAaSmjdqNCky7pzhTblYFTfU1FMKiECHfU5rm2MPYqK6InZsBh2w0Zy?=
 =?iso-8859-1?Q?0B2cOsXwHSyMzwZFcn5VZVxS7pLo2ZeNrOG5ns+16b8JAlvyCB1/QRfU1H?=
 =?iso-8859-1?Q?KGwRFnPBymySLTMXDPjhef7IY8BnQCjZyT6qQNdJ4/88GTzxZHP4BjDnJ4?=
 =?iso-8859-1?Q?SwgYv1SsTGKbHToMk7de5wJEvWknk6zapF6g5ZXrdHnez/VdRGHTLlt8uD?=
 =?iso-8859-1?Q?lcdQWsLmdNBzoA1colAWT6IY7XRVNTYEQWThYl0yPqY8rMXcBEEi4RoVx9?=
 =?iso-8859-1?Q?UU2rcVZ9bqh7NN2b8hMZdNfeEq0o97P31vMAsQLUwp43f6fU+crFtOFlOu?=
 =?iso-8859-1?Q?b2msYjcTo2H2akpuwmTojPPEqmy6BkSqvcEHQtotEqUvOMgx/mv0QzQmdM?=
 =?iso-8859-1?Q?RZaWArdKZmAQqxXSF5ARZZAqpOUtX4IKem9vcVifKHk1VJ8hDpagKSdVS+?=
 =?iso-8859-1?Q?YajtdbbXdqaFP412UN4zZ5RTbW5Bgx7UgLKu2A9l5rlTaeboNqOqnTAXpP?=
 =?iso-8859-1?Q?k0JAx4u7jJARY9cJzu7UZV8saCi5gx5eDHtspvp5aW174tS5+6p2qhJIiX?=
 =?iso-8859-1?Q?kDA60huYGrgzqnqgnlK/SIngZANMUUGfpL7aEpW9SMCs5/Xw5ygUhd/DJM?=
 =?iso-8859-1?Q?TecJDaYjB73/NCoislhDJZnMfKfLHu4zp6wIcZEe978PBIu0zm55ZzXtA4?=
 =?iso-8859-1?Q?8kMpxCGjpt9LqWKEFEa97sfgk+40wOIuyK4TcatO3vSbj1EADGG9Ej6zgQ?=
 =?iso-8859-1?Q?K1occNzja8IQIeU243vxXqwTFG/WPlmpozTFY9mBJMT1HM6FgR70GfFVdP?=
 =?iso-8859-1?Q?ocKUnjnuZPnWi4dqPab717tN39jYolHVJjixy+4hbjrHxgVnMjVZVNCG7v?=
 =?iso-8859-1?Q?Buy1SmwAGbcUcEaqojx3eq8+k43+4o3fi4nUnOMpdY+0JvI9aF+za1hvpe?=
 =?iso-8859-1?Q?3CSiQC7hBnua0qz7Uh4LlCQ9mBOCGpKJqWSCrVxBg3y5npEbP3/tHXIgDs?=
 =?iso-8859-1?Q?DydHl/NF/YiVA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 24591aec-977a-4c6f-2306-08ddf68ed77b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 08:39:11.7341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGNAsAcYkumv9EqHJ4veSrh0iax+hEglFDBMYzf491rbWiQVqB/2hTrDGgoY8n6OwrktlyMTwQ2+jYvPjnmF3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1846
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=YogPR5YX c=1 sm=1 tr=0 ts=68cbc544 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=yJojWOMRYYMA:10
 a=mfx1_Ca0zSafkJl_FCwA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: EdDATsBt2ewkmEhwulglsMFFtrzkPSay
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDAxNyBTYWx0ZWRfX+FQVaZ9NtyyV
 mP1DRrgrp4JDTaYJa/1C1D7bseJijutsdhCtjgm70xfoGvhkPz/ZawRiKz0LRHwDBlxTzCdqJQM
 dE2hJYWZKu+xzcZJtcnua6vrAUPonU9owPOZsQ++7LDnaPE3nJfEhW6rRZvL8CxWyR/zAGShN5U
 G8rLdRc5yi0lZ+ScaSleoB1CLhXUTyDqOFAXo9658HNJhS+Es0AuSLpP8xRKzRSW6DEm9Qi0S1E
 XU3egp5H1SbUzAfwaDRFMMo22MG6f1GcpNDEH/SpdNQ534UQufKjHBajxC/eeh5SGYnLKt2jDZP
 nKRoPtq8pKhoS9yexn0O5aaF+b4TckmorRwkSC5pBGTqpCaT3h29keivrCuk1EzhGUKzB+UrfrB
 qI4AE5gN
X-Proofpoint-GUID: EdDATsBt2ewkmEhwulglsMFFtrzkPSay
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170017

Hello,=0A=
=0A=
I am reporting an USB related issue on the Linux Kernel version 5.15.71=0A=
Below is an error message that is seen in my dmesg log when my network swit=
ch goes into reboot. =0A=
=0A=
/****** Reboot log ******/=0A=
...=0A=
Reboot reason: Reboot requested by user=0A=
reboot: Restarting system=0A=
ftdi_sio ttyUSB0: usb_serial_generic_write_start - error submitting urb: -1=
9=0A=
...=0A=
/****** Reboot log ******/=0A=
=0A=
Summary:=0A=
Our network switch has two serial consoles attached to the system (one conn=
ected to the processor, one connected to FTDI chip).=0A=
When the switch goes into reboot, I can see (from the console connected to =
the processor) the above error message.=0A=
There is no functional problem in rebooting the switch but I would like to =
know if the error message is something intended by the Linux Kernel.=0A=
=0A=
Reproduction steps:=0A=
Attach two serial consoles to the system and reboot.=0A=
=0A=
Additional notes:=0A=
The serial drivers do not have a designated "shutdown" method so the driver=
 is still present when the kernel goes through the device_shutdown method w=
ithin the kernel_restart_prepare() function. The ftdi_sio serial driver con=
tinues to submit URB messages to the console when the console is already re=
moved from the system, which results in the error message.=0A=
=0A=
Conclusion:=0A=
Although this is not a functional issue and is not observed on systems with=
 one serial console attached, this error message can be seen 100% on reboot=
 on devices with multiple consoles. I would like to know if this error log =
is intended by design or if it is something that was not considered because=
 there is no functional issue.=0A=
=0A=
Thank you,=0A=
Jun Ko=0A=
=0A=

