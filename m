Return-Path: <linux-usb+bounces-33849-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOmMORr+pGn3xwUAu9opvQ
	(envelope-from <linux-usb+bounces-33849-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 04:03:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 548151D2981
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 04:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A618300B3CA
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 03:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AF32D5925;
	Mon,  2 Mar 2026 03:03:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023078.outbound.protection.outlook.com [52.101.127.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2345623D283;
	Mon,  2 Mar 2026 03:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772420628; cv=fail; b=a6Rc1MKYQ23wPmbGS39CH+4vX3HTL+SjXc4LDmXia9U5hJxscJ8j+nbsV72I10h+57dyXtQl8qvoKt0ycvpP3nhi/W2e6/9Qj+4leetXZ4Bz4psFzWw/o8DVsVIprgTBmZGzYS0hanXipfuIWj684V5y2bVl87/AqdFs7R48wzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772420628; c=relaxed/simple;
	bh=/359U/ShJTn4ezWTViUCOC1ckBu20S0UEjaXcL94XrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZAEpljTvcRj3leVgtyGbemzSyCntCHuv7cIbqn3qzBNLMV4C59u6ynKxB0FlopYml8MYzfct8alODpJcyFkJ1lOAyVCmvwiJ7EBGWyc2Rt3UbXQ3fvNXkOCzCfT29ydHxbDHx949ckodAUy0fTJtuFHrSVAWr15BhGzF+Wvv/Pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzdeSNrMUT5ZnpKHZe0dY/WPQi2tDiz575e7KP8BVzvLMNtrnb+qRiWnTGanTsuOEGSdVl+CsXIL5NpLTeg/TrH+2GeMpjFw2yDgw9YXFIFP43crm4O+SnsY5DhVlZMuNAoLWZYOK4NvBy+uBtLZrfWBkB5vcSR/vYPhobfFwGouiGvv2OSzi9iizeQSxZRjehL1EJU2Qo2/djWuLw5qdvt2T+YkrVUUzNJl1lWdbO2RNP94IkSdp4QkWSvWjYt0ARcG3G48x1WfHGZMPFyjc0V5MNky00QQqqySfEFko7PAjYu74kPTq7kMwySZgC+chNPJ+8ltPlTZRcbij4xWrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+UaYOW9GDO66SRwkj+6UeTfeR/9BAsIZGe+ZmibH24=;
 b=szq+z4iXyZH/8jUUPaEKgevLpgEVoYOESJX4gbiBqZLQkmGOQOV2GOF8QKrcTlVXwyFOv/+o3cUe3ka8qpI0BAFauIK/D34bsXN3WtZdTv4nDU2F79HHz/ozkqAWFxOSWpTOI+c0YMCc1WI/7EeqpPfd4j3X+32fmxfN6j9m11NoI3nE0tFEmfUX/SLOryswyMgbWIIkRIZpXe5G8TuYNNwqrJEG54Z3kX9X8gO9ALaIW+x18BiqkpEZ/KmqxbVnKo4Nz3V4hs1OVV2JKqlDwCf8Yg8eQUL0lGP/BhAU303tTW9Sk71fx4JNbQ6O6wjsRDbL6IuM2btPnixA2vXiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP301CA0052.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:384::15)
 by JH0PR06MB6774.apcprd06.prod.outlook.com (2603:1096:990:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Mon, 2 Mar
 2026 03:03:43 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:400:384:cafe::c8) by TYCP301CA0052.outlook.office365.com
 (2603:1096:400:384::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Mon,
 2 Mar 2026 03:03:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 03:03:40 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 705FC4350701;
	Mon,  2 Mar 2026 11:03:39 +0800 (CST)
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
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH 0/2] usb: cdns3: USBSSP platform driver support
Date: Mon,  2 Mar 2026 11:03:32 +0800
Message-ID: <20260302030339.324196-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|JH0PR06MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 49078fb1-5866-47fa-9053-08de78084e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	isg87cbXf9/wM6MFokyJmTJ8/E8RAtwIbH6vqNVLXrE9qItRT2OjZU1JuCwY2cFS2UO7z92bcpwvMOcgir0AHCsFi0afZh3eTyWS7o06Ai36WDu6OH5Q1KSsl5iWv/GJfn9QenEnBj+WDmRoHYc6cxhtaqyRHgzGGUUURW0RndK871iq7kXYz10VZ3rXnFqFz7rGFb3ULe9dpiMlhnDQQxjL61rnEJNsqTpb17o9XsTaos6+kemk1qQoaGsutXnIv1ZwqZT4ul3REkPxUo9LqZRFKrxiHT1xrbc7FKhqcL6Fno5hZY2hda58kQmmD5lQ0xuiDSoLrelyzdqNqvIHL+KFYh/cQoO9cgJJSOlDrqx6CteF1AlrqUdK9avy+27Z46n+5QX/kbVlyga7/lV77F61W1cVr4Oy7KyLmc0RDmOx2PRCgUVOJQW0c4nA676z9ToCqiBiGhyUdAChrxUZ4rnDpAWy+ekjqzdNxt71q3NYHR3M113vrtwcCmLgJBh7XARtoDtcTVW6ca00CjyaYnmY3WkWQ7vEQeKnPekhKPoLRD/TpWh2+2WXG+XFxArFSHJOafqJ6INtJ7f5/jzpegHq6P5F4Fny4pcMX6yLzyPPJEZmN4eGtfoyzFOZodi21ngIPP+fOmihwhVswVrb9fLgwrJE3qNTkKvRBqBh6k6GisBDtWPBxCmbly34lxhbW6Ncl1Zw2QljQVoQAdAywHXjfXKKdgmbXQMZ0rtmtXUzxpOnludcaI2YSgtvrSa4Il5hsSz21eDK+FloIQhqYyT+c+FOJX8QYZnhbWO8subaTndkNlqf5Cpihr8VXJhP
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wv/bgkGuhj5rx0T+/qeevukzi2GqInmHM3uTR6eXcgHvXkSyE395BkzAqhLYFnWrdhULMTRPUWB1Ke4OoPvm3E+bDkEDh6sjm9rswNYhBH4Qr9UZJP6C6LCP7PFIq1zKa635z2mzl7tnjaauLUaweT9GAv65YYjcvmj9HNclLGlsMGuuWxK0D2gRGgdDACwr5jgHg9wS5ujAYmZ6EzQfIUyVSS1tpVmfNrWPlz62JKcsZtKTBuQxI+NfDAcF9OPHKMDrAvmMeDq89nV7allOT8Xq4AtdPm6nzoYtrFOWQ8c+Rv0MR50cTP0uy499hkxTb7BFwnmG4WB4TVFpmRnGEj8zcV9JMnpQUtWiDuzW/MGAvnEqlkrct4nV8QY1Yirbh9OfkgxNkdD+WzkPZNXulTyR3hlMJFc6hhF4lLQHAka6JQ2CJaLaGyXCRiCtmZ6Z
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 03:03:40.3583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49078fb1-5866-47fa-9053-08de78084e8e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6774
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33849-lists,linux-usb=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	DMARC_NA(0.00)[cixtech.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.977];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cixtech.com:mid]
X-Rspamd-Queue-Id: 548151D2981
X-Rspamd-Action: no action

Hi Pawel,

The Cadence USBSSP (CDNSP) controller was previously only accessible
through PCI, coupling the gadget driver with the PCI glue layer into a
single monolithic module (cdnsp-udc-pci). This prevented using the
CDNSP IP on SoC/platform designs that expose the controller through
device tree, eg, CIX Sky1 SoC.

In this series, it restructures the driver to decouple the CDNSP gadget
from PCI, and refactor cdnsp-pci.c into a thin PCI-to-platform wrapper (similar
to cdns3-pci-wrap.c) that registers a platform device and passes
PCI resources and platform data to the common platform driver. So, please
help test it in your platform.

The changes are tested with random configuration combination tests.

============================================================
ALL TESTS COMPLETE. Summary:
============================================================
Starting cdns3 config combination tests...
Timestamp: 2026年 03月 02日 星期一 09:34:47 CST

PASS: all-builtin (SUPPORT=y CDNS3=y GADGET=y HOST=y CDNSP=y CDNSP_G=y CDNSP_H=y)
PASS: support-y_cdns3-m_gadget-y (SUPPORT=y CDNS3=m GADGET=y HOST=y CDNSP=y CDNSP_G=y CDNSP_H=y)
PASS: support-y_cdns3-m_gadget-n (SUPPORT=y CDNS3=m GADGET=n HOST=y CDNSP=y CDNSP_G=y CDNSP_H=y)
PASS: support-y_cdnsp-m_gadget-y (SUPPORT=y CDNS3=y GADGET=y HOST=y CDNSP=m CDNSP_G=y CDNSP_H=y)
PASS: all-module (SUPPORT=m CDNS3=m GADGET=y HOST=y CDNSP=m CDNSP_G=y CDNSP_H=y)
PASS: no-cdns3 (SUPPORT=y CDNS3=n GADGET=n HOST=n CDNSP=y CDNSP_G=y CDNSP_H=y)
PASS: no-gadget (SUPPORT=y CDNS3=y GADGET=n HOST=y CDNSP=y CDNSP_G=n CDNSP_H=y)
PASS: support-y_both-m_gadget-y (SUPPORT=y CDNS3=m GADGET=y HOST=y CDNSP=m CDNSP_G=y CDNSP_H=y)
PASS: minimal-module (SUPPORT=m CDNS3=m GADGET=n HOST=n CDNSP=m CDNSP_G=n CDNSP_H=n)

This patch was developed with assistance from Anthropic Claude Opus 4.6.

Peter Chen (2):
  usb: cdns3: Add USBSSP platform driver support
  dt-bindings: usb: cdns,usb3: Add support for USBSSP

 .../devicetree/bindings/usb/cdns,usb3.yaml    |  36 ++-
 drivers/usb/cdns3/Kconfig                     |  44 ++--
 drivers/usb/cdns3/Makefile                    |  30 +--
 drivers/usb/cdns3/cdns3-gadget.c              |   4 +
 drivers/usb/cdns3/cdns3-plat.c                |  14 +-
 drivers/usb/cdns3/cdnsp-gadget.c              |   4 +
 drivers/usb/cdns3/cdnsp-pci.c                 | 221 ++++++++----------
 drivers/usb/cdns3/core.h                      |   1 +
 drivers/usb/cdns3/gadget-export.h             |   4 +-
 9 files changed, 184 insertions(+), 174 deletions(-)

-- 
2.50.1


