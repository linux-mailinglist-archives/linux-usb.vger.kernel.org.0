Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6057567DED
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jul 2022 07:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbiGFFkK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jul 2022 01:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiGFFkI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jul 2022 01:40:08 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7205D95A0
        for <linux-usb@vger.kernel.org>; Tue,  5 Jul 2022 22:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgjiFCGwaWZiOSBItQpN5mpZSEC/EtCIBElLugSrTmVeWmeYjjBuACYCmsAs1oUakJ14uJhnPoakUmASv996F+ogoXE5vOuOZOnfyqucRYcRKU7sjh2R5gfKUBwM+bgufnJcXOtWxXUxu9IrRrtP3DRq8dSQFdk6xRE9bEe2voMSKTRrYr/Ef+3w27BE90x+iXOLwcwU0gRjBMJk48Jnzjih/6TuIFY4iA0j50StqjJFvG8Uz4v+2rypXE6YDH5rQ1PoUE7yMFNzxLyjlq7OmewASzPPzoaN9IPRlM8lRF6/+fKzGSv0XHQtjV8XoMRs1rSUG94pKDHXrqNXSnFESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlD1WZ2simLCrz/zHNHKx9plNB/DJH2I4bNLT96WoKg=;
 b=PATCwBWVEVoPrYfsG16jAGmBk/l85PfbdJPVSiQzDw9fqguixXCuAvnhOrOFe6dwVCaFRSayfC0m3cW9WZPcsCpp2HNodRoDWxKGZyYN/1wbdXV6RW2Mf+pcqZgQ3cr6ITFjeGa6yfWoQgOyRizqZXnC76jS7ZNNFYxbEgxwal+yns9tB7N6dXyjGE6JaDXOzSJE/WYrluMVsheWaN9KcgyZ4NZ0KUv4fE30kCm5Gp3PbRrzSdavk9pUvlRiasBB2BQVBT/RxX0FbN25zZJg+eiAKOedbWRD4FfLiqQZTUVAT/v6+JkwomATYDgoPaxji7LYRl1+OpSoq1xP2hDzJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlD1WZ2simLCrz/zHNHKx9plNB/DJH2I4bNLT96WoKg=;
 b=uZ4RP3rJOxvgiexKubmjIDFaFliT+9A6R6NKQaJnAGUXcJth5ZVTVvr5wJBSh6N+I7JjASNp0ZE/+VHzpi6kYbLuBfU31SXL8Q1PRarNCXvjvrtuXA7wq2V+0QQgJAhKqEtxvXfLlCRwaBFJEIl3OrJwbp4gxQE7Lz77JqQxQw0=
Received: from DS7PR03CA0335.namprd03.prod.outlook.com (2603:10b6:8:55::34) by
 BN7PR12MB2722.namprd12.prod.outlook.com (2603:10b6:408:2e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14; Wed, 6 Jul 2022 05:40:04 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::48) by DS7PR03CA0335.outlook.office365.com
 (2603:10b6:8:55::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 6 Jul 2022 05:40:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.17 via Frontend Transport; Wed, 6 Jul 2022 05:40:03 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 00:40:01 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <mario.limonciello@amd.com>,
        <linux-usb@vger.kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH] thunderbolt: Add DP out resource when DP tunnel is discovered.
Date:   Wed, 6 Jul 2022 00:39:38 -0500
Message-ID: <1657085978-130560-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1023fb02-8c8b-4412-d728-08da5f11fa03
X-MS-TrafficTypeDiagnostic: BN7PR12MB2722:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gkT34UzkAfcYDyeZO8ZIgBJYU+d5z6+AOk0twqMcYRyMLJRYoNmCabmq/2TDfviJ/M7Mtcvzi1/mr1PzyrJ8YgJEXQkpL1FcN6w+WvnN7u7w9o9AUFtj8o95s8NG826lOVvvLMvgD0P1U5/Q9ZHbIeXe/4J6DR9oqlvzuwKSK6B3KQ4UbX7TpoaDS+nwckuk7Zk7VfbW9+xh6SfMrxfC7wotQAyMCTzxWllW3e50I3nqXLdmcMtXJdKMDC4x3CXruI6HXkY4vt5l5Jah7dmICbxsG3KhwMckZ1hitWW+DfhhKLtwisPRcrktxygIEgbLLf1+ANZsMDTDvwJAsYgNBp52Mz65iYrQtCI0jUhMYZhCLCozrl6IT07z0h0Os6iXNbbgFyhgf8NknKwa+nqKvOxC/Xhr6+ZrSqWY+AIbOyYBGigGq9DZQILsfSM/0F8Xw/b0J+WSG2BigO6awvcR+fgZENYntfYy6xBfJINWwPPOzm58HZvU4uIZJHTQd2pVAMtKdUFme1bqafmEEWhp5M3ZD3OajFV1iHtFZbldGLU/PpjYF6hE8fxKfWsVOyJugLC5eksaZQYiaWfxUAQn6g4VsV1h7/lphGJfTXfz5A4nF/xVbunDJgEDMpznZfQQA417oybWfrWknhzyY4hKZgbDw/MQKWdIwtx/SLqpI8drj3M+Lv9r5ZyC0mTxw9+80PkW5fP/f0OqohKrfbYh9rwuYg0XmSFi2K8dbAGXICUOHovG9gly0JkCMQF3E004QbRcT9qQDH4CF2zyO5P0ce/u4T+hA3Qs0x30KiEgDmHgFVUlP6Aqc0CsIqsxoFKmS1bUjf8N6+nGfFv9p2rABP+WEUkFbgy3I4NITcpUZukI3vSJguLvl8qH3eI3w2W1
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(40470700004)(36840700001)(86362001)(478600001)(356005)(34020700004)(5660300002)(40480700001)(36756003)(36860700001)(2906002)(40460700003)(8936002)(26005)(7696005)(6666004)(316002)(81166007)(82310400005)(70586007)(70206006)(8676002)(4326008)(110136005)(54906003)(82740400003)(83380400001)(186003)(16526019)(336012)(426003)(47076005)(2616005)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 05:40:03.9047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1023fb02-8c8b-4412-d728-08da5f11fa03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2722
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
index 4602c69..cef2fe3 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1222,6 +1222,7 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port);
 void usb4_port_device_remove(struct usb4_port *usb4);
 int usb4_port_device_resume(struct usb4_port *usb4);
 
+void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port);
 /* Keep link controller awake during update */
 #define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
 
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

