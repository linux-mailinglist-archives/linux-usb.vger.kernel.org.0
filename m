Return-Path: <linux-usb+bounces-37218-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFbIDD1CAWpwTAEAu9opvQ
	(envelope-from <linux-usb+bounces-37218-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 04:43:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB080507459
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 04:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1C893017C17
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 02:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00DD2FE582;
	Mon, 11 May 2026 02:42:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022107.outbound.protection.outlook.com [40.107.75.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4B92F12A1;
	Mon, 11 May 2026 02:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778467372; cv=fail; b=bv/IhCnR7q8nPstDkGZ+KAvVVj3RjIGaVZ74vew+46eUGnYpXHnLLoz6LY7r+5SKEEcIlD4Px71KORXS1rwJ7mefj+T09nX63YYV8t80Bd7UcsHo54zXxye7AlrrX3SD4bgdOirmouPHtWuaGc/a41HNZUC0arkSVmLhCe+uToE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778467372; c=relaxed/simple;
	bh=5heUz9QaEOLc/wuqfetbwP/1RkHaRoT78jFhymB/DXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uL/tWuZ043/WuFahnu7kWI4MWf3dATnlfWimCBdBtYizlsoBWWlH/tQtnikHnVcqVVXPS67jW/nFaMsOrVT626R13ZDF0eZbm1L7//9ae7VOjw09d67/4g8bRqrlCgp6gYOXtaKU72khHe88TL48Lk/35IWC7EtnS3BVGhFJNlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YV29aFj1KyoNG5efvlVKY5j06TyJJ3RnKrNCmqhjqte6u53uhtuITcvU1C7i+2B368H+wI/JeMIBLinR6VXur1/1uveo0vyy9Zo4PPCjvhNFyuewdU4mNVt9keweQ3JTJXm1mgKjpKM8kUTDo9+z1oSD610+Owo84UJJocjnqwiqJFlnhAWtWYMMqJ/6RVshRfl4/ru1LOYwQFMZ5wI6LPVHid2qJy8jEbxuPoSmGULrPtgICHe9ViZ5ph4Ku17gl6yusPl6nDzrC8wPOqSp6xHlvrz8Gv2YWjgme4ZRl71gGPeJkGFzgMKuIAoZ8AnjLapvBKbd9QZWZpA8/+mOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdkycykB7DdZ/5TmpdCM8Ij0KMR2LHDs8nmH9tVVmY0=;
 b=CpFqbXT/ZMNNTTrivxrEN7hJxY8VdgsHkBiuQT7wwAp2G56HOFXfg/zkCjT4anMn8ZZCnE3NHB9+jO1B3ez8bsaIKWAuYqYFd9gfaqDAzaoXNAOpk9Y85L728kWwa+OMW1UOdCRSjT7wKpA7eikgG9xI/KsqKXtjenXV+kesFnbUloooZx+w9ouQPvk9acpBfftuUmQ5r/kSSBTQFsyKM45HN9wOcZwwxJ5d+HtTz9a3RTCAeO/RXVaBVXOtKt7z1Gr3LFK0ZMo/AH67rXjOO4oI6d9aqh+8wuoXTD3Qjnmb542Rq6WpeAFl+3OVBvz9qvCZheWonyCSj4VLovRnFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0033.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:29d::7)
 by KUXPR06MB8560.apcprd06.prod.outlook.com (2603:1096:d10:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 02:42:46 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:400:29d:cafe::2d) by TYCP286CA0033.outlook.office365.com
 (2603:1096:400:29d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Mon,
 11 May 2026 02:42:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 02:42:46 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 20F104126F91;
	Mon, 11 May 2026 10:42:45 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	pawell@cadence.com,
	rogerq@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH 0/4] Add CIX Sky1 Cadence USB3 support
Date: Mon, 11 May 2026 10:42:40 +0800
Message-ID: <20260511024244.981941-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|KUXPR06MB8560:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ce54aed2-5cfe-4a67-cda1-08deaf06fbcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	O9myw0dNZoK6py+f/3vHDNKSdV/EdtACEk5SmpgNJ4MvJdulF0c9KbnsfehZ29mtZBK32XixxGxUQ7qshJ1lD1/+/NE37lqc7lVXMVfMNkrPOqVEb8aJ1tjbkUvF3LYiLKypRB3/JFxU7eteDJPwqT1gtz688rkwZ6E4gFi+nDoo4RKV1j9xBQfS4ZOJ9eqiJCUjFbzWw6RbhXsZys7XOBK9haka9x/9UAabMCoG++m0OcJFLuMpO1qHh341/W2iMu7xVZHyDwPutTQN9Ja0XVjr1O1l6IcRaQJqvpQfOuAbNr3UMRzperwEkj7oKLvY9GnBWit31Xcaw3qPPppqe1YGxzqNT1EVgOA5lzaDgGBohofMycUynZ094wdWUJja0Uq2mc0gB5Ovi/mKhT5kLElNDXIdKQKxC+nuYCWNV8PFLmfJYMcRwBC66TIxi3q1976pxabQhJDxy9zwgM4yAznabfD0M5JpjUWRFM5B/Smkij7NTwlKg4Vu4BXST3IOIR4b2YyvgLl7TuDQbrOylTqvkmxbAOa8yi9iohNKeFKw4Sqnlmfwr5gbuFLrTvK31of7Wj2E8FBt3CyZuDjYp9DEPRN07cQubqGbVG690Dm/5IixzLcFl2Gigge9uMDxvgct7n5AuBHA0aPWQZ+xmp30S0RRMBx4VZu4+UNsuCWjgdCO6mFY+eL2D0xuCaCg
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iQ8bU8Z9zTH5y65uIL56mlymib9LpzmG+FaLjU1Z4CNuFzA8J2bYgtX8RJdUfpeB/VML3bp8Yt3RYxQ+374Q6opaG9gfBmmcWNVQe1k6/g0kqsPcE1A3EwGbJg5env8x1M2/blT/QVNnGp/HfQpMCO9MuhbxTMXzyk8YNbcBl705eoQ06/gynMhs4dwDjkoPrMSEJiKfm6WyTulgMiQgjuRvwD7N5EGqwqyj+FNxERtWcdZR6uK5PjHoi+prQq1prkpceRvd8hbwR6a3VeQp1EuX2eOLtDbdqz8NSmq6fMiI62F4fFJJHUB9Wk7FTHOji6G9Vlw1lGziNIEH7Tfb864E9Dhj5J6hjE6Nlxat3bAC95Ky3kSs+9Bv6UuM0s5bT8nECMF2ETAay8NYN6XXs2mdBwWtqcZiEArSkrSuamqLmM7KtdW/fIZR8euLq86g
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 02:42:46.0016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce54aed2-5cfe-4a67-cda1-08deaf06fbcd
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8560
X-Rspamd-Queue-Id: BB080507459
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[cixtech.com];
	TAGGED_FROM(0.00)[bounces-37218-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_SPAM(0.00)[0.297];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds library support for cdns3 platform driver as well as the
first user CIX Sky1 USB3. It is the follow-up of Arnd's suggestion [1] for
helping cdns3 module dependencies and new developers working on it.
The final two patches document the Sky1 binding and describe the USB4/USB5
controller instances in the Sky1 device tree and enable them on the Radxa
Orion O6 board.

[1] https://lore.kernel.org/linux-usb/cb70271c-3ddb-422c-bf24-1cf019473f7e@app.fastmail.com/T/#mf61131099335cdfb6b4264e90b0d3de10cc4abac

Peter Chen (4):
  usb: cdns3: plat: Expose platform core driver as library
  usb: cdns3: sky1: Add cdnsp-sky1 glue driver
  dt-bindings: usb: add CIX Sky1 Cadence USB3 controller
  arm64: dts: cix: add Sky1 USB4 and USB5 controllers

 .../bindings/usb/cix,sky1-cdns3.yaml          | 151 +++++++++++
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  30 +++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  68 +++++
 drivers/usb/cdns3/Kconfig                     |  13 +
 drivers/usb/cdns3/Makefile                    |   1 +
 drivers/usb/cdns3/cdns3-plat.c                | 138 ++++++----
 drivers/usb/cdns3/cdnsp-sky1.c                | 252 ++++++++++++++++++
 drivers/usb/cdns3/glue.h                      |  51 ++++
 8 files changed, 659 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
 create mode 100644 drivers/usb/cdns3/glue.h

-- 
2.50.1


