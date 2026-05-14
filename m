Return-Path: <linux-usb+bounces-37427-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDJUDuUeBWopSwIAu9opvQ
	(envelope-from <linux-usb+bounces-37427-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 03:01:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7619453C812
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 03:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 650B8301E9B2
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 01:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E632FD665;
	Thu, 14 May 2026 01:01:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022081.outbound.protection.outlook.com [40.107.75.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3E51531C8
	for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 01:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778720481; cv=fail; b=Xiist/+bDlCxQngxSuGX6gIO83e8c2WDGWPs/Duzkf70pORRzchO5phK7EpYUOE94X1JrifCb1/YKKL/VpybctCNXsQzCP+07Y/Y27Q61S314YP/kLke3aryozoS+AH/yURtZV5nUTeHlA86zfN8QJ6uO4c6nKZssRKy8DyTmsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778720481; c=relaxed/simple;
	bh=6xOw7QinMRIUjeLYtbboVbTZgfrLDxV2JDoEWe8ElKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G6/QzMRv/SrIHDAze3U+qcZ9xBBb9xZgayAXiphyt6eyXvnNuYgGdnrpgYRA6xJwCQjnikiY/GYWLoC0/QSYMBevZ1CWGg3gAn0ZobysUtsoZaD0H/V1QA9Kh546eqNdFnQMUhKKCqGk7mbY54NZSPr/siCRWdIEfgiQ581PJvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0cvsxY4o31st/YDF9SJnxh/bdWpUw7umH8LCos+qIygKorKmtcG0jMMz3q/4cONTU4R4ZBe2Y4Z1ZNYBK/bjdkY2sV9vPah0aRYGwHpfXP6GkphwQ/COkY+MsOoSoERsFh8CjwhakP1d6WE+kehpVCk4NN8TS4v6deDvTHuBKQIRNostewpHmfWMCBP0iIiAwCIMrzmhZWR083EAUvPIKUX9UJZXDkLBeK3ZASs3oomh+SlA7a8mg3bUhKFI042DWy9/V5KflwCOvA2r7OHM+gGeJNhxb7VYROSGVtXovfp0YSur9tVBmgutykAHzJbN+HIbuuWO8ileeXi2SuadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZgRWN5y1GnEPQ9OV4VYn5ECT0K/d80aqghYLQCptSM=;
 b=Xkz4loWTMoHpqflgLFP4RQXCHXiMuwf/Rv3EbhxbwO8sMeIFCb/EUBvFm2JhS9p3TkOeDnQI13VKkpUO7qKULe+kRveaM0i8LWse5aOZnV8EpAWl9rsswA7sMXC7z0vRosAUqjbMbUiKtooxmcabn+d9RFKrhMsCQPWsub04f44wOqOrbGlKgkR6SrJI+lL/y+NM9YOligILQlnZbuOUS0jPPF4mbqxy5T//RU+1VRvdZ58yRklysYj2FF12+1cA8zm52su7gv9SwzdFV3KwhIQy3Mtm8BCX+jEDMSHtFfa2cyHnmmK1mydbYmDZeY4VQg/5gpg4xWdzFg7/zlgnoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::21)
 by OSNPR06MB8418.apcprd06.prod.outlook.com (2603:1096:604:487::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 01:01:16 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::8a) by PUZP153CA0006.outlook.office365.com
 (2603:1096:301:c2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.12 via Frontend Transport; Thu, 14
 May 2026 01:01:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 01:01:15 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 53C9E40A5A01;
	Thu, 14 May 2026 09:01:14 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: gregkh@linuxfoundation.org,
	pawell@cadence.com,
	rogerq@kernel.org
Cc: linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH 0/1] usb: cdns3 fixes on usb-next
Date: Thu, 14 May 2026 09:01:13 +0800
Message-ID: <20260514010114.2436781-1-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|OSNPR06MB8418:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a0bd3ba9-d3a5-4be9-2fbf-08deb1544ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	K3sJm8ysgFPbtgLjXBYdp6AFGwxD4poPoN+wXSi6wBIUSQFS6RYwYWafE3ySzwnRlFx3fhAukrNGAuiEGmdYJzJdKNC4O3b2EvjcUk6/yyqq9A0rN9Dr3jLrunt2+JyBn56yU88gH+tEcYa8zzHfurUx2beR4DJWJa9mCa03zoFopLEesYPjktaWK2DorU1ZEIlnl0UPkA2f8iZQE5ric3i4STfYFnSMwo+CMyNeUMKeTuFARUP2JkNoUv0xx9Wu8qAJVaXfxwVKwLTtSBA0NHWxXg8PR4cdtKjN+0Q3nf9xdj31FMiojf/Dm5ave8G/ofdyRq1j69RdOiO6FORCQwBMZMD3Nvqj77DR2waGfLaPcklFgfZcjfN0u5UnzdbrkvxDmzEFInUVDc6blgOirKEWV9P8w81zvT3vJQTfeONxWjTcjidhkfZCOSxMKP4quznsZFHITualndFGn4yxWF0MilEK24VCHnZWhD5KRaqh/uxjqWVzhjpaOLLXpR5PjXwLeCGjotPPlJruMWu4s7s7rH9QWJWwrHRUN0VKoM+v9XJXro0smg/7tclzCM1oryJ+khUh08at8iyBOToEG8/V63iuyPSSALkAUwj8eR+yvUK6atO6VoMX7sjYJCF5EATYh16xbv+c2uMnb8RwwBGTCxEiJL+2No898rzgtXeQa8LsyRdlYvE9xgoFbkJUft7MlFDST5KHntwXgFZoWOk4QUsZD99hS3GAQM1qAbo=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZTtaC2gCc4QLV6ued4zTFvP2lIMBhwzH1H2zu7YS2dADfCH47DYVDObWBrqTX1WrAd1qDmzKb63MwD9tgkphx23nhznx3k0scqEOTpNwxWjmUB7KvWR3eDr9398j8JEDpdYPeymM59vx7f3ci0+vmnhch4UzzI9qVZZwoF9+BfNkPtEwuehOIc/36TH/1ochWWaiZ8fniiCjqAlnfneHQr/Fch7IEYeGrhWoSy9N9J1YadUtNlh3eZDiKv2QLM5MUiuuHkqJzzGaXE1C5O/g3z2MvTbH1cxOasLl8bDFho5hk6PtR2Kj8WRILN8bnSOccQAwD+Pm64L0zWxDL30gYX/b3MbezUq9GxHBzJIZqJxDkNvHvVA8vYz0h3tn7iBUS1Xh9qCE4BptXShzOe0rzG6ks6dEg0ytYDQfdmHXRLPtBhmrwGHpbRjOBteWfGPi
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 01:01:15.1728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0bd3ba9-d3a5-4be9-2fbf-08deb1544ca0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8418
X-Rspamd-Queue-Id: 7619453C812
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[cixtech.com];
	TAGGED_FROM(0.00)[bounces-37427-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

One fix reported by sashiko-bot@kernel.org.

Peter Chen (1):
  usb: cdns3: plat: fix leaked role switch on core role initialization
    failure

 drivers/usb/cdns3/cdns3-plat.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.50.1


