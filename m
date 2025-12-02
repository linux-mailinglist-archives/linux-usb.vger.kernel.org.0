Return-Path: <linux-usb+bounces-31098-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D22C9ABBF
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 09:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 72CDD345B21
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 08:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE196306485;
	Tue,  2 Dec 2025 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d4H4iPth"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179FF2F691B;
	Tue,  2 Dec 2025 08:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764665077; cv=fail; b=tqaQG8uTXZp+XNP/yzUI7JkPsZ/zVw0tWEPcux3YHZaEBISM4x5r/oWY4sByaQF2J2RgucilZDZHM0b+6lgW+lE8IQropOWmaEP1ka4eJ3myRBn2y9PvzschhDkZUv+EP8pBQeNfZdAffrIc8rZNOuSfsrVvQcNvART6dFIjq9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764665077; c=relaxed/simple;
	bh=tWFpQXTYj3hfXoeyoDqOVMiM2HDCqzWxVmnbKw/Lfws=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MOVVQu1WAU1EpCM4ZVqek5qyMhN3eoQDDZTMmcr//f7P0e4QkojW2Knq4MZ2R6MN4XrHwG1VBj4aK/8b+OxSe6vft5pMPRi8Gu5SZ0TZh+QfLZMemc9Z/Bm8Xip39x0ggFyB+8oZV3ThiAEK7bZZCUtw9zdaFQCfqcMWId7R348=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d4H4iPth; arc=fail smtp.client-ip=40.107.159.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlMiBzYPMfiMWwiibSIJ9RtwjDMeOfGhJSJpRRHYYm09FfiZYzKbk73cUlNTdAH66jdaV1Q2TSJlCXqDzHviii1xDFxB5S+zj+lBb92/hOTDNhJUsZU9H/tG8BLR7EZb/MJhY2fFPiS84ZL/gCohtpk1bGbkemqf7mq0Ria7LxLAJPZcvx7Q8lObODaDUAVgqCqmpRmJl90lyxQZBPqjwEheOSDep+zYRCayKWZi3GJ0GfqFQeUoBSfo6Waj51GlPJvfdD/fxtnmtBf6jmQ7VpVM3DboVOlKfiur/jPI0vfB5wib6863W8gjGqKCBy+I0m3A7OIQlQXtTqfIzELOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G222D73j4oj4qA4yXlSzURqUhKwkcbkfAgmAYUWKSj4=;
 b=P0mfhewcgCdHRRJHmAbOkO/2Mz/zrI7QAUri8cw2RlFM2Hv/CeRLhbWkImHRieYkbNzgDWbsEDBw0EU7XWORypq75ctX2x1uM0o4AxcnjFiQ0lo32IRGnB5nKuirxRzSgjATyWHe4JjOS4Y7JHYV/Hdzq2d9BMLasxpYuudYB9lz6bAtJYxc1KvKDddkAUe6EH9Tfd35PS3YK/9ovyb/Js+NQK5RoERg/BEPKrJmv/+sKRaa6n1Gdqz3RK/z8GtsikcT2T/Sd9C8mfkbEps5hfbhpUTS5lP+PhFLHoR51NdebZGrIa8W9Efe9uszvA5O+Q9c/ILbs75EH2HjEYNtkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G222D73j4oj4qA4yXlSzURqUhKwkcbkfAgmAYUWKSj4=;
 b=d4H4iPthYPS9v01Fw8ASWrJj2xEM4hYiONtkUOiHnBOm4v6dHUSVgjqGqPLTqggjonnazaiFto4587svHhrfdGTS7TIIUu6MPjEcgIiYD8b357PX/fkhmtHxA5B0GJMB7voSRUdVVIcCv7jayiS5DzPMrIN8NgjCkhtQrq9Fg2Axlzk+EJG4ucwM5e5oYftmHjt9mfcalM7xR6Wp3qBB5jBEnwoyUc/C8MLmGb2Hdi72Pwhff0yOJI3Zm/FOSz5hW5RiGcS2IxfNmYEr1JlFyD7QDJKSppCrDuagMp5HeDRyAsDnHM7LgseudFU1yQQ18xJcYb9IDhJ4+WhFJAqwAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com (2603:10a6:10:366::7) by
 MRWPR04MB11489.eurprd04.prod.outlook.com (2603:10a6:501:78::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Tue, 2 Dec 2025 08:44:29 +0000
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c]) by DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:44:29 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux@roeck-us.net
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com,
	imx@lists.linux.dev
Subject: [PATCH] usb: typec: tcpm: make kthread worker freezable
Date: Tue,  2 Dec 2025 16:45:24 +0800
Message-Id: <20251202084524.208045-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To DB9SPRMB0022.eurprd04.prod.outlook.com
 (2603:10a6:10:366::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9SPRMB0022:EE_|MRWPR04MB11489:EE_
X-MS-Office365-Filtering-Correlation-Id: 218fcdbb-bbd6-4c41-41fa-08de317f018c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T2Il2zTYk3ycYMCLofGW/ugHTYDE/WA/juZyubaZ5Xn6uwQLKFaemIQjh1No?=
 =?us-ascii?Q?QPWX9kawoAghCBqPAQMBxHkUEfxuzJ7BQhRppRbAwLF2EuWhLh6UpnBN2axb?=
 =?us-ascii?Q?wWOwq4LaxGLGDu7r51Di+1i1qDm/akoRZD3rSf3b0mo7sjeqZ95ZFHppfute?=
 =?us-ascii?Q?MQnmKOSrX6z8ton2JjyMig7AVQ0JvjYRh/dKMdSdxQ4OwKTbLvnIfvM/ujsT?=
 =?us-ascii?Q?qGZhj+qSgDJpkGncvvOwa+OMyXqR/Q4BIP8D0UOcCKOmJl23EuduJV5fb425?=
 =?us-ascii?Q?bDolDsxumOGOZdYDUxYRUGo6tfPSBJmXkyCdWUQ1Ygw7zaWF0U5aZ+HanaVr?=
 =?us-ascii?Q?03v/OlAHnYJq6QIdcLqBN4/37p/+lG46OvesRa/e9fluA8/Fg7qMg1RWz8UY?=
 =?us-ascii?Q?jNo6HB/7k4ojJ+dDQTAjctWVNNR37FP7ciLjriYUyIOo+2s83YggufbnZYmf?=
 =?us-ascii?Q?eolKrO5BxxI7UNS+T3aYA+khdFvGic8zKVX6ou9uvduZf6TcP72sm6T3c60v?=
 =?us-ascii?Q?DFSgsZ+XCmDDQb/lzuv2wp8KLnyQD1305e6mZ98Rscz8nSDjeqzrOqOpDaLX?=
 =?us-ascii?Q?2UonpuYlf1QRJS5NgofLg5wYukE9aUEwtGfXS2OCn2uSalnQo1RF0sMf1otK?=
 =?us-ascii?Q?N9ucoOIqVbdQtWU02dDovZINsXHdcsxESFBfPgLK6XcFz3VUYCFmmIcSUv8p?=
 =?us-ascii?Q?Sn9MeYZa3VoHSv6Vb3r0wB2MaWUbGbG6R/G3kOFxg9aFw62v5e3f9GHnYQdu?=
 =?us-ascii?Q?Q/Hakk6gqCR9mJAS42ugR1euW61S+VHtuRPWOhc2N7Eo/WqHa9tSziqgUvIK?=
 =?us-ascii?Q?0vDq+9beDqET/aneMy1TM7r4Z8v1m51JDzsYXtnTgMYkBS5kn5KGUpK8Runr?=
 =?us-ascii?Q?fNDrLPDu9LkB7Lnzecy+xhhdzVC3b0xqQ8XVNw9KOywEtECfgYXeW2YO2qE5?=
 =?us-ascii?Q?lKETx31dm4iPpjTKa9DYmeVp5ECo4Fnc4NqMmN+oNolH0z4G7URRUmx9hdkL?=
 =?us-ascii?Q?KS7T/t1LoCJNk6ArSCVuewz18CT3xwSVO3TF7JL4SccUSpd7JDKZZjSolEvX?=
 =?us-ascii?Q?ng0kAC2PNk18X14HP5itBbws5uRS3edBz29usjCqYpJnW0BzKKRz1F+1iq/H?=
 =?us-ascii?Q?4ahDBSMJ7JT8wdt1vHUkJb1yrSwP3rTa5+zqP6V6rqtTGknk0noAif5cXEBF?=
 =?us-ascii?Q?uChwOcHZbpkBY3hIZ5Kf2PMUR0Dmd6+JT1GxlZqFcksrt4HZLsmzIHg8NEWk?=
 =?us-ascii?Q?MN96onyKCNQJuGzlM1rzsLLvh5+6r532is7CnHh4p6XrABXp2eiNU6Xzerjq?=
 =?us-ascii?Q?q1t79aSXotbOLUlEPQXf3wch4+C6RkDVWNR6wJke1rYyKlobakHiPke1D2kg?=
 =?us-ascii?Q?q8J8hkoDj0j02Vei6QaeaxDD5vG333+APQH2Icvq5GFtzS9107LlCHkg3/uY?=
 =?us-ascii?Q?3ShLp4gYCcjv3iZKqDyHlC6h6Z9YOBHNu73vcd9CA/foLF8Yyoyl47tTSV+D?=
 =?us-ascii?Q?6kelgzjBg65QDDk7bSBBTdDTdv9uVdm8Ib0V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9SPRMB0022.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uebs6o61jEgf5iKJgEalIN+Sp2jesBC+KAU2NqJVzTyZnUgGZs/Wq0IdC7O8?=
 =?us-ascii?Q?MdxoQr9QJmMUlRQmgLEcZdHSj6oV28lWScSAwFqGq+W2osevbhvSTRixLXMg?=
 =?us-ascii?Q?7nxsufZomgYMUVN4bA+F2Mpce93yttJKjoSnjm3UeIL4pmSJv/bmAlp7HUqL?=
 =?us-ascii?Q?3LRuTGPwGF3kTJQYjroUtECXS/TFWKY8ZioYOTc2c+IpgWdxTZ3fL7i0vsR/?=
 =?us-ascii?Q?viiu2DmWWdPSZZWdQMNfh/a2yq6F2sKiAcxOF5FLUx2DAXrOCmv+EmSnAmi9?=
 =?us-ascii?Q?M8UMjVj+BAVG1CmXlsYu5s98sHeB0UpwwPvd8X+gVmHImMKz/6R1Pfpr53tk?=
 =?us-ascii?Q?xwVrW75v/YPitDNVQT6PFr9E3Op4UFvMe9mvC1Rhsf3BFZCPcbIq9NDnLTaW?=
 =?us-ascii?Q?B+ZC1XpXKlfxLiBCVGn+zLdI0nci0eSkcSd17nyYKzci0ybA3WDdgHWvo8WQ?=
 =?us-ascii?Q?cpt4Mzf86vADajdnHV5oedhwUF564+HiXhWtm6Ib91EPMj6bWukjoX2gRKqe?=
 =?us-ascii?Q?QmnygyG5yxNb5rHZ92YbQIFG7DzY/VmLzpAWPcLBnJcJNkjlbFo7ZB9UkcKF?=
 =?us-ascii?Q?Un4qt27Qad8aajmQK4Z79lJ7ZXVAM1Xo3CFleZTWhCbiLRMnFDHm463niBU2?=
 =?us-ascii?Q?B3YTjTy8RvjECFXLvBT4Id9MoyBntONMW95TdwFwAjGSU8lztF1y2UKMg/Iq?=
 =?us-ascii?Q?dA6O7wLGqkciAz4XeHsj2pToQre0vMOj57RrwWyZW9zun+wwCgJd2j5d8Bgo?=
 =?us-ascii?Q?/i1/cgErtXyllDpCffpECD1i9qWTCPYL96ZoVkKjUhIbvjWUOnBQKgRjOdff?=
 =?us-ascii?Q?MrYm0BTm8d41duwZyJr7MXYx+UyrLgwySZyw9IMRasFLZmJ+FqSY64w5vK7a?=
 =?us-ascii?Q?I2OZlYcCgK+7YBXfuRsvV/3lDRHcsdATr7aJykCCkCa8eqZ3uQnhkdVEq8u5?=
 =?us-ascii?Q?5N0qklUAd/3wpjJYLIjX3tyY7MTC8yhsEDT3y2c/RGzke72RhZwUOakTOIGl?=
 =?us-ascii?Q?DMdwnjtw6zdxbDPHU7x9K+XFS28Rx1JERLxdNX3w1tg5Z7ZyVWbPXxixyJbT?=
 =?us-ascii?Q?rsD+IBC09Hd/VoI4NBpMORQ1IS2NbK6QJZO8H59at5fyR6incIw0LqU8YV42?=
 =?us-ascii?Q?ynLgyZheW6qPzJQQa3V1VyxkDiJNgOYZg55i/ki5SrWGpiEx2Xsu1qGNeKMe?=
 =?us-ascii?Q?EhUgRjHN13K+VlLd/Y8EiKSnrM46pp7oqvwQDO1qxqJNIOAQ5v/K+r7/LeZt?=
 =?us-ascii?Q?p1WQ2GE65HprmHJup8smYC+NVvg36CY8MitWTsxvJ5YAHTen3U2s8NJhX4/h?=
 =?us-ascii?Q?3D07TDWQNbZeL6FMLw58K898koicv+EOZfbHOCk+CJbOz281HHwsfrmH7MzB?=
 =?us-ascii?Q?vmk+gMjsk6peLLx1g/ZrQ8RplWRd/BDE8iNxm1gf++j9luHSS1MkdpD2SxjN?=
 =?us-ascii?Q?zHROt6ZRaZ75iFftie0U7A0R2NWmiyeQHSdHUYySWDvbUWTapMaAxATeOWXi?=
 =?us-ascii?Q?BABBWZ2Rn0IAsyAR8KlJEIEKXk/6W38G4jW02mA/imjtC/2c2IQbOp42licK?=
 =?us-ascii?Q?SSI35E4TnS21s6075e+4NQeoafNwxTC4hzyZpKQx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218fcdbb-bbd6-4c41-41fa-08de317f018c
X-MS-Exchange-CrossTenant-AuthSource: DB9SPRMB0022.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:44:29.2414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvKt7LOflH1y1YPaOup+HqwV7YYZun79dGn9SdKuBZ9at8abLJbV+LC/HRjlluUz7KgDnP3Bmout7lVnu3iMqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11489

It's observed that tcpm kthread worker may execute some works at the
very end of system suspend or the very beginning of system resume stage.
The kthread work itself won't bring any issues, but if it access some
HW resource during this period, the system may hung there because almost
all of the resources are inaccessible at this point.

Take below kernel dump as example, if the source port hasn't finished
sending Source Capabilities message when system enters into suspend, it
will continue do the thing as long as it gets scheduled. However, the i2c
resource is inaccessible before system resume. Then the system is hung.

Fix it by making kthread worker freezable.

$ echo mem > /sys/power/state
[   37.605215] PM: suspend entry (deep)
[   37.616067] Filesystems sync: 0.007 seconds
[   37.633106] Freezing user space processes
[   37.639444] Freezing user space processes completed (elapsed 0.001 seconds)
[   37.646496] OOM killer disabled.
[   37.649745] Freezing remaining freezable tasks
[   37.655695] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[   37.689794] fec 5b040000.ethernet eth0: Link is Down
[   37.713391] PM: suspend devices took 0.052 seconds
[   37.741175] Disabling non-boot CPUs ...
[   37.747120] psci: CPU5 killed (polled 0 ms)
[   37.754129] psci: CPU4 killed (polled 0 ms)
[   37.762217] psci: CPU3 killed (polled 0 ms)
[   37.770037] psci: CPU2 killed (polled 0 ms)
[   37.776936] psci: CPU1 killed (polled 4 ms)
[   37.782481] Enabling non-boot CPUs ...
[   37.787991] Detected VIPT I-cache on CPU1
[   37.788043] GICv3: CPU1: found redistributor 1 region 0:0x0000000051b20000
[   37.788093] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[   37.789587] CPU1 is up
[   37.810632] Detected VIPT I-cache on CPU2
[   37.810661] GICv3: CPU2: found redistributor 2 region 0:0x0000000051b40000
[   37.810689] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
[   37.811714] CPU2 is up
[   37.833013] Detected VIPT I-cache on CPU3
[   37.833042] GICv3: CPU3: found redistributor 3 region 0:0x0000000051b60000
[   37.833071] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
[   37.834201] CPU3 is up
[   37.856437] Detected PIPT I-cache on CPU4
[   37.856469] GICv3: CPU4: found redistributor 100 region 0:0x0000000051b80000
[   37.856501] CPU4: Booted secondary processor 0x0000000100 [0x410fd082]
[   37.857651] CPU4 is up
[   37.872890] SError Interrupt on CPU2, code 0x00000000bf000002 -- SError
[   37.872902] CPU: 2 UID: 0 PID: 147 Comm: 2-0051 Tainted: G   M                6.18.0-rc7-06207-gee9dedcfd432-dirty #396 PREEMPT
[   37.872912] Tainted: [M]=MACHINE_CHECK
[   37.872915] Hardware name: Freescale i.MX8QM MEK (DT)
[   37.872919] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   37.872926] pc : lpi2c_imx_xfer_common+0x150/0xff0
[   37.872942] lr : lpi2c_imx_xfer_common+0x54/0xff0
[   37.872949] sp : ffff80008358b960
[   37.872952] x29: ffff80008358b9e0 x28: 0000000000000001 x27: ffff000810bcc080
[   37.872964] x26: 0000000000000000 x25: ffff8000820e9000 x24: 0000000000000000
[   37.872973] x23: 0000000000000001 x22: ffff8000820e7000 x21: 0000000000000001
[   37.872981] x20: ffff80008358bae8 x19: ffff000810b4c010 x18: 000000000000000a
[   37.872990] x17: ffff00081ab43f00 x16: 0000000000000002 x15: 0000000000000000
[   37.872999] x14: 0000000000000001 x13: 00000000ffff0a10 x12: 0000000000000006
[   37.873008] x11: ffff00081a38db07 x10: 0000000000000000 x9 : 0000000000000004
[   37.873016] x8 : 0000000022b63cbf x7 : 00000000016e3600 x6 : 0000000000000000
[   37.873025] x5 : 0000000000000002 x4 : 00000000000186a0 x3 : 00000000000000c0
[   37.873033] x2 : 0000000000000002 x1 : 0000000000000018 x0 : 0000000000000023
[   37.873044] Kernel panic - not syncing: Asynchronous SError Interrupt
[   37.873050] CPU: 2 UID: 0 PID: 147 Comm: 2-0051 Tainted: G   M                6.18.0-rc7-06207-gee9dedcfd432-dirty #396 PREEMPT
[   37.873058] Tainted: [M]=MACHINE_CHECK
[   37.873061] Hardware name: Freescale i.MX8QM MEK (DT)
[   37.873064] Call trace:
[   37.873068]  show_stack+0x18/0x30 (C)
[   37.873081]  dump_stack_lvl+0x60/0x80
[   37.873091]  dump_stack+0x18/0x24
[   37.873100]  vpanic+0xf8/0x2dc
[   37.873108]  abort+0x0/0x4
[   37.873115]  nmi_panic+0x64/0x70
[   37.873125]  arm64_serror_panic+0x70/0x80
[   37.873134]  do_serror+0x34/0x74
[   37.873143]  el1h_64_error_handler+0x38/0x60
[   37.873156]  el1h_64_error+0x6c/0x70
[   37.873163]  lpi2c_imx_xfer_common+0x150/0xff0 (P)
[   37.873172]  lpi2c_imx_xfer+0x14/0x20
[   37.873179]  __i2c_transfer+0x1b8/0x3c8
[   37.873190]  i2c_transfer+0x6c/0xf8
[   37.873199]  i2c_transfer_buffer_flags+0x5c/0xa0
[   37.873208]  regmap_i2c_write+0x20/0x60
[   37.873221]  _regmap_raw_write_impl+0x5cc/0x660
[   37.873230]  _regmap_bus_raw_write+0x60/0x80
[   37.873238]  _regmap_write+0x58/0xc0
[   37.873246]  regmap_write+0x48/0x74
[   37.873254]  tcpci_pd_transmit+0x10c/0x1a8
[   37.873264]  tcpm_pd_transmit+0x60/0x164
[   37.873273]  tcpm_pd_send_source_caps+0x12c/0x1c4
[   37.873280]  tcpm_state_machine_work+0xb10/0x3574
[   37.873288]  kthread_worker_fn+0xc4/0x178
[   37.873300]  kthread+0x12c/0x204
[   37.873310]  ret_from_fork+0x10/0x20
[   37.873322] SMP: stopping secondary CPUs
[   37.875528] Kernel Offset: disabled
[   37.875531] CPU features: 0x080000,04105800,40004001,0400421b
[   37.875536] Memory Limit: none
[   38.148805] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---

Fixes: 3ed8e1c2ac99 ("usb: typec: tcpm: Migrate workqueue to RT priority for processing events")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 4ca2746ce16b..2196de231b9b 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -7836,7 +7836,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	mutex_init(&port->lock);
 	mutex_init(&port->swap_lock);
 
-	port->wq = kthread_run_worker(0, dev_name(dev));
+	port->wq = kthread_run_worker(KTW_FREEZABLE, dev_name(dev));
 	if (IS_ERR(port->wq))
 		return ERR_CAST(port->wq);
 	sched_set_fifo(port->wq->task);
-- 
2.34.1


