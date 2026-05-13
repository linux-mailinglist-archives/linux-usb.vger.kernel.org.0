Return-Path: <linux-usb+bounces-37373-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T8ZoEkc8BGqsGAIAu9opvQ
	(envelope-from <linux-usb+bounces-37373-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 10:54:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2B352FFF9
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 10:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 183D23047554
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 08:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79163E558E;
	Wed, 13 May 2026 08:53:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023082.outbound.protection.outlook.com [40.107.44.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB383E51F9
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778662399; cv=fail; b=ihv1st5L6vXDv6e+QuT0/21/Cybo6AlLHeM+b0oIr875xC3cTyYNdMwANUg52jl8PqMGIvp0n7w8+zEyisFA+otocAlGsLRJs3JbcBYcPBfNBZO5dLKp6p4Zh444LNipjFBMbSlaHClWzP5pYvV5c8rmIpx0wgOuPJ0EjaZgudo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778662399; c=relaxed/simple;
	bh=iD1BkrtC3cPlcL47Ei6XyIUxtNe/Yel2CrK4PlInklA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VhwIRvh5VPRtOc5P3/pTPjWruqNPVbgpM4eWxeEhD8pRVro3SsdTFJ9/g7R0W4pTj+ANRWpq1ySHtcFBSTPFqXJEQwaeaOgFo8TvIVhWsTve55BjY2THiLNtsV4Y89xIfXW8pdsFyTE1wsUZhVaTA6ksfbbNOHSQVoagKdACdmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZI2rJr4r95+N8dCBY0LkzAoQT6yqFsrKJTAWiklaxs3e0P7d8Vq089Jiw4Okxb5VCOOZG52AvDwkIClLKu2jRFrj4gWGrSuiaBKf/ctYOxOn7F6h2xWgokmfsevQZ7S3JeKjkL5nrn1RnVDRwX62X1qseUpKGSem1sv7EE4/xRsWUrwW6nElw+Y/IgivvuP8/ziu30HDPEfeBnlw31BjnKajVWL+dPJZCs/myGZtesdSAccSENwLOZDygLWmqD71ABKKqWu38qIMZWf1XJKrlaw4Rgvno2a1qaeAOoEBBRgMULaH483jB0XdwAXaXzXqWBHgh4CAID4YXyxQQ8s3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8U+3G+krjvEutGJGFMYINw08vy/WZaMRG+q9vWbY1w=;
 b=QjzB3stWv7axjy2Hj8AssI7Z0DyN3MIXzPomokZfZz8lHokZqBqmV2jNG6fw7JqV759Lrp/GuLyIzkVT/SodrbJ+9i7IKZkrG6eXrJ9aEwiUhqdukz6aiAJCdi1oTtiqLYbAOFQuUZboCIy/83pRv7QNp2NBjuqdoVLupd3GXafIYmPGG90pn2W9o/Q01jXo/CWz2hLHxv8OTGsR+0kylj+qWmwvpYnTX29/cvsXR0ERxYbvLUSjPqL8bjAu/3AG6dh7tsAoXmBia3IhDRWu3WNjlpKfnNTvMWA/cLyqC6Gkz7sGH5USTuVtdZhHDNbm9KIX/TCKaL2ipxzUsWxsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0182.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::20) by SI4PR06MB8946.apcprd06.prod.outlook.com
 (2603:1096:4:2b2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 08:53:13 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:189:cafe::d0) by SG2PR01CA0182.outlook.office365.com
 (2603:1096:4:189::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Wed, 13
 May 2026 08:53:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 08:53:11 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E0CD74126F80;
	Wed, 13 May 2026 16:53:10 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: gregkh@linuxfoundation.org,
	pawell@cadence.com,
	rogerq@kernel.org
Cc: linux-usb@vger.kernel.org,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH 0/2] usb: cdns3 fixes for usb-linus
Date: Wed, 13 May 2026 16:53:08 +0800
Message-ID: <20260513085310.2217547-1-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SI4PR06MB8946:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7316df70-9c6a-4db2-500b-08deb0cd1036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FsViwMbcXW8qhPVuPLd1+BfekWpMZvMpCKU6AsH6IU9LtGxKY1o3N0G65qi6Ko+HqCWwKdJUrKdsawnpxM8IG58R1Vaw8mA3h5QM/43+Fb8PDuFJPWJtnfor8KSGtrvfC31C8MuIBcRA81LVEW+I95EWjBAjhfKVbT3sshpy+O02nC/scGcr0GjwTFqsPbtozqZFxqMU9AhBBWJRVHEsc9o9E+8lk8ChDs2x6kSmDRaNjqMEa6GveBsz6IrY5WJ7GwPrGjkFszExtVuJl9iFtWkSd26gS8eIGUyhPjNC2Jw5sFS8nw9B/tS4sulWusUW1PtvoiPhSOa8bifDyoHIeMHdJgrFjLp9qX17xIxfTQgQnyhqBzpSVbmtu/JQ92L233pmeRPHc4YKA5Zm2TJn7EveNc2lcGnn2Vw7r5kHGkldZ52Y0V/KShdtOOmvz1b+90hcrPchV5gpPINgiAQX9xznyae43+5964PLFvgjay/F8BPDETvXLz6yGSjEm3S5AGI7geNkbs15bfDLQgmQ7fT/BjqIQB7VjfVSJrkpAZcLmEb6Cr63YFzVk0CABGld2xQmbD9TAbIiQNgSCt44qz6c2FkKkgw/s3rrkrrQ2mbWv/FNVW9lbhRN2OlHJXSGV3m1K41IZF72vecZPb6Ck0o5R5LN5bitbb0rChuDEHqE1s/ApWwWp+bDqpimwg+PsSLFKcvC2oaeT7ZrA5UdZz+X4XZJaIc7AXGAPQ66zzA=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NCp6cnlez4Hzcon6jgeC09geBgQ1vxnzlJdOdMXQz6Cp8/7F43ypdRScA5vqcBjeWQSGYBJvSrCc5rfZb707Yag3Irncfnj5XbOGZWD21YtxnundWEu0tVh0AYoc+Q//ZfzMet4R0bUcXDaUATEUhT4Qh+9QpziTKbczBZ8cFo/TJcSRYMxg9HMCgI+BBwOhC2uzIukY+dWZRLqoZFCTRhpfsm1LTF2VhFirLkNTpxkCrPWRrmBzcrKUZtaT8KY6HC9ktynqa0oyUrfLWu+Yf6kVgoUIkQ0u7bfuI4piLN8cKN59urzWogbU/3vW/Ts1B9wgSBwKgC/gJwaeakl92vlthILJanrnAKFpn2FMv59Rpo+JdHRyv1NrWj59MyZC1bGwBfenc9aoLdlEcbOOQ9APtVekQQje9HbgwtjDjbiVywDfhuqDCOFrOz6Susaw
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:53:11.6019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7316df70-9c6a-4db2-500b-08deb0cd1036
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR06MB8946
X-Rspamd-Queue-Id: 3D2B352FFF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[cixtech.com];
	TAGGED_FROM(0.00)[bounces-37373-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Two fixes reported by sashiko-bot@kernel.org.

Peter Chen (2):
  usb: cdns3: plat: fix leaked usb2_phy initialization on usb3_phy
    acquisition failure
  usb: cdns3: plat: fix unbalanced pm_runtime_forbid() call permanently
    leaks the runtime PM usage counter across bind/unbind cycles

 drivers/usb/cdns3/cdns3-plat.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.50.1


