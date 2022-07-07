Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4930C56A103
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 13:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbiGGL0x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 07:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiGGL0x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 07:26:53 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8570D27B03
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 04:26:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVdUeROcak+UkqgqmLvM6ovqJ1PZVtq1eKpwO32DL0u9OVF1MOK/xMIGLORsx1oBmrOMYMasp2KxATcQRApWVGOwCfmSl3OM5hVndrjKLUJ1rQ2ZT8pvX9qwxKLS6Cx4Aqc01zwgfo1cCoWzmvaDPuS96SIe/gki9YyZ2cKEnLOgwVmhWw/qvYbbfPr6JTuNQfOgSWG44Bpt2eOvrhbIumX6Gvm3pKAV6rDcu64Ht9AjG8di4RMBr0C714vb5QOmCxFPRcRKS2RpCJx7UQM7o2tE2mszg38Wd4qXf3lc2cSLg89Fcrao3Ps7j9vzPrSx8ootgZeumrDvtmevJM1b9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EDhaXFpVM8QVS9Xkw0i7iZaStx+qmv/mV7LXXFpmSo=;
 b=P2v4rKxi8OSpdqY8FAKQIiQcGEsiiOVyyN0vW4PrdISArukiyGcU65TJTK1TlM/BMBRBchYn7DQ/QE8WReBPj0ZcjXwlLowH8D1v9R7454kf0OF5SPmOiE9ksqJwBnv9kFs1+ERlvVKAM34oIMai77mDyisB5sQHhv6qfXLW+4meR5ZO9AygJHaAnTKvv5MZfmKflsWhL/hj1ddPcegHK8ITyMLcHBjg/61Gfh8rXN+0fx/UvVHHo0hKsVP66Qq0XP79gLdqCVKk+17rsIVMhMziHqWQ+YmD7ZL50b0fy/WsoZvJGZKmbHT33R7ZDD5Kf3ZVpGOip/rutbthHgEv3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EDhaXFpVM8QVS9Xkw0i7iZaStx+qmv/mV7LXXFpmSo=;
 b=R23P2cXGk8OaMqh+FdjK9+8wVkj/ovCjrq3oUXHBKuWkX+SsTOlruh2WCFgplbrtkFr+8AhWqBUXg9WTSAfih0D3amVs60ZfKDYW4TPn9YvlZ2LmHONmnCLw5S8KuR86/B6hk8S8v1l0Ygb21PeDiCkDZQ/3JY+dbwY3emE4NGU=
Received: from BN9PR03CA0951.namprd03.prod.outlook.com (2603:10b6:408:108::26)
 by BL0PR12MB5524.namprd12.prod.outlook.com (2603:10b6:208:1cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 11:26:48 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::31) by BN9PR03CA0951.outlook.office365.com
 (2603:10b6:408:108::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Thu, 7 Jul 2022 11:26:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 11:26:48 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 06:26:45 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <mario.limonciello@amd.com>,
        <linux-usb@vger.kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v2] thunderbolt: Add DP out resource when DP tunnel is discovered.
Date:   Thu, 7 Jul 2022 06:26:30 -0500
Message-ID: <1657193190-5708-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ee816f3-a9d7-4117-b137-08da600b9501
X-MS-TrafficTypeDiagnostic: BL0PR12MB5524:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b+uYRy25r14Nv2eyzeFNk4ADE1cZjgPUXegn0TzUOrT+DA4ScT93+90GGb5UaGSkGYYezCkm0HsD2I99PAVRZbYyeMQa+ONd6rRUH0yjd0K1+tyc0hb45FGwjwUbkDpgZR7AXfVAfUOLKcr5RsINjSwo48HHmczXvSGI7RBU6QLkZpPoTZh19HRRvihSwMLH/WxOb5WOBc46CVWfpNe2AGkFEbqJEN/6YE19NJcgchW613I58DcYq/lR41+fia9RcVn5gMJUK+XM69gVGt2igyfJJRCnVjSWdlzaxTlY7wl8GvzrlgqcrpWrHvmj5lTE75jjA4rDzYjMYBiScBBTqLnLFotADS3OgETNg90LC9+cSDGLc84cAgj7gEWRGuFa1MN1zfCs2NTCDEtL3MBabWQ/D/W5aRnHEnTuj5gPAP8XyajWrE6N2zzxvaf/tlPOk4t7fj9MB7nT/60Prv3QuyAMBjL1qTCCz8PZEIy7pQxIIGpasv38VxwdAdPeHUGX2VRJ22F3cB7H4zZ5NPkMx9WyYUh7kTuVA0hENy0kQZ0/yH9T4i6T3g4sJCseEM6Q5GFkKybfbDLCu0rRD7lC/1MsqbAnZRtL0nyvW8izgpZn6VWp5reywfiPNYRYKtdPYX5UsbZcvNO7skmN0tlvFCA2Z2X1pY7LAzlfW50OFAc5SUngB9k7TPUjHSnuVg4CwbE3viVTeUD7SmdACqVDF6T6s+/tsMPFPrFFUBs1P6dk4M/+NZDTdR5GQdE+w+V77zhbPYXCUSJZ3z9esakBn/WTXJi04VTuMBLJTfq5IB2tHv9iyhqVgAC7AYRAroSUxH7hvkZ7jaoxeCsj4KMdrDbFTLcmXorf4BLmIug99BaCDWR9rS7lWKecSTw8Dlq7
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966006)(36840700001)(40470700004)(34020700004)(81166007)(54906003)(40480700001)(356005)(36756003)(7696005)(316002)(110136005)(86362001)(82740400003)(36860700001)(6666004)(82310400005)(426003)(83380400001)(41300700001)(47076005)(336012)(26005)(70206006)(70586007)(2616005)(186003)(5660300002)(16526019)(40460700003)(4326008)(478600001)(8936002)(8676002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 11:26:48.5919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee816f3-a9d7-4117-b137-08da600b9501
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5524
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

If the boot firmware implements a connection manager of its
own it may create a DP tunnel and will be handed off to Linux
CM, but the DP out resource is not saved in the dp_resource
list.

This patch adds tunnelled DP out port to the dp_resource list
once the DP tunnel is discovered.

Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/thunderbolt/tb.c     | 15 +++++++++++++++
 drivers/thunderbolt/tb.h     |  1 +
 drivers/thunderbolt/tunnel.c |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 9a3214f..dcd0c3e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1006,6 +1006,21 @@ static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
 	tb_tunnel_dp(tb);
 }
 
+void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port)
+{
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_port *p;
+
+	list_for_each_entry(p, &tcm->dp_resources, list) {
+		if (p == port)
+			return;
+	}
+
+	tb_port_dbg(port, "DP %s resource available discovered\n",
+		    tb_port_is_dpin(port) ? "IN" : "OUT");
+	list_add_tail(&port->list, &tcm->dp_resources);
+}
+
 static void tb_dp_resource_available(struct tb *tb, struct tb_port *port)
 {
 	struct tb_cm *tcm = tb_priv(tb);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 4602c69..a841844 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1051,6 +1051,7 @@ int tb_dp_port_set_hops(struct tb_port *port, unsigned int video,
 			unsigned int aux_tx, unsigned int aux_rx);
 bool tb_dp_port_is_enabled(struct tb_port *port);
 int tb_dp_port_enable(struct tb_port *port, bool enable);
+void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port);
 
 struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
 				 struct tb_port *dst, int dst_hopid,
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 2c3cf7f..1394ae9 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -845,6 +845,8 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 		goto err_deactivate;
 	}
 
+	tb_dp_resource_available_discovered(tb, tunnel->dst_port);
+
 	tb_tunnel_dbg(tunnel, "discovered\n");
 	return tunnel;
 
-- 
2.7.4

