Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11C84589A91
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 12:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238266AbiHDKtJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 06:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238472AbiHDKtF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 06:49:05 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0FDB3F318
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 03:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6aJhUkP+q/DeSxox85XfYLCz1bRn9UKUppUnBKUO1g+zQCR/8nZhhOiDQHDTexlEa6v07dZujCmrzyJel5vZLx7XszAamLOLNLs78YorFKRlsr7jRx8AfSzK8ZMelXMTyaIAehbcp35iANWLG3ZAmEJx+sMVzzvu+vApSCBItMGV3Y3o2XtdSTGQeVgZsH+FBZFGNyoC+BEW+UQqT5ZGQp/O5iItlkeAdJ3SIUfoPr6A5Lj7j8zLOvYBWt8oQZe5TdT/lOe1IKRPXcHo7oT5TK/aFKDuyh6mKKldA4LH4bOdXgYBx919lqJqKYZwfC2z9kHpBvyw3GdzBe8ReHAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Drlh58QuJXCIK52Fl3TnfZncEyRMTm8ymZq+9sae1NU=;
 b=iiaIxXSnpBFrB2dy2SoEdCgUhyY6Cw3AaoZdjih0ZBiqoxMZ2aKwymfZRpPYURDhmuu8C1tpd6WldxLOmV3agL3Sh/NwKh33gSOQwSCEIZrZMke9taNUJjitolJVfOObLV6YgSAr1K2IrAAyAC5KqL4KsrmV1xGjhuy8iQqa0OoPj4aImEvzr6L+K3GsoVAEMlkA95aWGUylbypsJIsX2VH16mxO/6dNa+Z14Qd+e+/X0/j+FBMme8+2AE2JV0HvzdQ2q4I0R3lICLLbsdUjPREf4BUk4nhpRk2ySTHqbewlHeEs4L9tTP2nCbMaHFa4YL5VgnTZnNuR911W78PdOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Drlh58QuJXCIK52Fl3TnfZncEyRMTm8ymZq+9sae1NU=;
 b=BXpM8bT/hZpiLkPo/eI7Hxajmeyft5I4Uq5/IGb56u05IV28EI33JWiOqA5tWrLq2vZxoClHX+0T/LiDWfnqtd8VoH5mTX3d/eJ7GK32khiTHjKSChF2MGEfKeB9rXrbmQ5aBlw+zv+8WFwvFuM8OlrdkY0kWQdgKQCvfDHcfeY=
Received: from DS7PR07CA0018.namprd07.prod.outlook.com (2603:10b6:5:3af::27)
 by BYAPR12MB4742.namprd12.prod.outlook.com (2603:10b6:a03:9f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 10:49:01 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::5f) by DS7PR07CA0018.outlook.office365.com
 (2603:10b6:5:3af::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Thu, 4 Aug 2022 10:49:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Thu, 4 Aug 2022 10:49:01 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 4 Aug
 2022 05:48:57 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <mario.limonciello@amd.com>,
        <linux-usb@vger.kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v3/RESEND] thunderbolt: Add DP out resource when DP tunnel is discovered.
Date:   Thu, 4 Aug 2022 05:48:38 -0500
Message-ID: <1659610118-119104-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc9cf092-be1f-4f0e-4986-08da7606f102
X-MS-TrafficTypeDiagnostic: BYAPR12MB4742:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ypJzGk1UleU4wV30Ij5hIwxYCVRCbPgYm5ArEEyR8eaNvCPt9ZjPuP1ocOOSTQJ3yghCaqB0EmiPDgFVI9QekYOPbXf92c53dDJ/z+RC7J8wsXs6t3QA2J0x7JWuROmQze5CpKphHm/FZCfmf9PFXh0mzedUcOIPcywkEG57dGhGnXNfL8hxm4CE+/AG78F92FZPAD29fAWgZz27rCPoMhczavMPXS8/vAyQj3yt3jzc4JD56Sh+V63bNw091LyTmP30G07LwHU5OWfIzDGtN7IrQN4ZBA8WqzT/1QpgNeb6TPGv1OpiN/cUGeH27hHITogrdT51Z6gO1l0AEVo+jfIJPmOlZAFQ6oWXZraBxl8Gc6USTCBjLlmsQ0ZJUOu1y2RJlJRae3bpLyMDETn9jWzw9XRtUP4zAEJa5bmEgh3KUnYMgJZw3JyTIz2ldI4TyoGTpUDs/o2Ir3ru09op8jx17dFFQLiYxXip6rE0G/DcWb09Xu/grEH3cqYszfiL8UqwGlxfwHxUvDOiPJ0jS7j5bVhWk76rxpGePx0J7neG3VNTQQZ/OKcGubvPK0OPC3PupUTZjzmgTNUY3AG4XYWlQwXTaBlwExgnzqGL+fR07d/CHBVHENiUDWiTEZRrvVdjAf2dus3b7YHEmrYxyZDQfTkgJbZA4w63yJpSMULN6o7j7obEZIqqFP4MrpC+sTnQZoUk2TSxFj7P+V3Bs6BBj6TKPYfBemUpO2CeFCthAS4iGD6Sjhjd4ykpv7lB0tBCEYfaofu826R2AEzErmjabOTk1RoF/0WNyJTExqFxkRHkk9AWCf1nnQXquZn/AkUtIJMACV/yEx05NxOP+A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39860400002)(36840700001)(46966006)(40470700004)(8936002)(2906002)(40480700001)(70206006)(8676002)(4326008)(70586007)(478600001)(54906003)(110136005)(316002)(36756003)(82310400005)(356005)(82740400003)(81166007)(86362001)(41300700001)(2616005)(6666004)(26005)(7696005)(36860700001)(16526019)(40460700003)(426003)(186003)(336012)(83380400001)(47076005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 10:49:01.0593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9cf092-be1f-4f0e-4986-08da7606f102
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4742
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
v3:
- Change function name to tb_discover_dp_resources & making it
  as static function as per Mika's comment.
- Move call to tb_discover_dp_resources() from tb_start().

v2: Re-ordering the function declaration as per Greg's comment.
---
 drivers/thunderbolt/tb.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 9a3214f..0d420dd 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -105,6 +105,32 @@ static void tb_remove_dp_resources(struct tb_switch *sw)
 	}
 }
 
+static void tb_discover_dp_resource(struct tb *tb, struct tb_port *port)
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
+static void tb_discover_dp_resources(struct tb *tb)
+{
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_tunnel *tunnel;
+
+	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
+		if (tb_tunnel_is_dp(tunnel))
+			tb_discover_dp_resource(tb, tunnel->dst_port);
+	}
+}
+
 static void tb_switch_discover_tunnels(struct tb_switch *sw,
 				       struct list_head *list,
 				       bool alloc_hopids)
@@ -1414,6 +1440,8 @@ static int tb_start(struct tb *tb)
 	tb_scan_switch(tb->root_switch);
 	/* Find out tunnels created by the boot firmware */
 	tb_discover_tunnels(tb);
+	/* Add DP resources from the DP tunnels created by the boot firmware */
+	tb_discover_dp_resources(tb);
 	/*
 	 * If the boot firmware did not create USB 3.x tunnels create them
 	 * now for the whole topology.
-- 
2.7.4

