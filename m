Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7540B56A9A8
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 19:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235922AbiGGRbt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 13:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235824AbiGGRbs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 13:31:48 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174DA313BF
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 10:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l58dZjzqCFA34tim2/VQdSyGCVMHIiN4A3uOwsoz/SYLZ6Gj/xCHAiOh4dFQwCehoilNWhhtmwZBNgzqutZniA//gy8KdWjdX568a7IY8rOHGu7bX421c29lbJTtmZfjRR2XQsN74nSLTT4sI/C9D3W5pya8wGL9OwK5UehGSL9pIWvKPtByApUV0YHCCLtU+wJJRT5w/H1UrRZpDeBsyI3Xz18LpMyNxUZulVSxAT30Y764ZK6YmS3iBdJAagy8qcn6LXfqfQCo1b+7Uz/XzRh5gxAtTwc4xnMQF+5o4zp+KCk9+UiawljXIT49EkLvIM2sUsrcb+55LlSjq8Wzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6zxrqkuz43Mb/Ua5Kqkq92yYryBMDqclrx01MrVr/s=;
 b=YaRe6Q3Kw+OiITKIFTE3JuUoRgjUwXLmewItkgDuTwE5G5Hf3/Hks8WfUvNceSsyfn98Rjhc+fGIa5XQbk+GaIcGzTt/M4ejE3yoGI3Mlay5EEz8bN+GA8TdRfnrNSDFNivFuShyBLk9V1CH6lfCaWFmcvObTTihBe8QJ2KTiYGt3n9mQWsrLqXTRctzY3oJgW9yOnIZbT4ie/Vop4q1cOslNj+MOAGkj2R7e8nafLSG3yes2U/qt2dzsOpzMbN88KmMxmr3+k/H+apQsGelosTvdBpTAj+wPV3aoU4UFA6ie61HxAQKVx4FIRR9Gr8vNY8sW2XbzyHzgp2+pECzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6zxrqkuz43Mb/Ua5Kqkq92yYryBMDqclrx01MrVr/s=;
 b=iA5XRpJ9uTRMQi1TuCwIOYHk4qUzsdpSwtJLVhBotYFJThGCQU1OhLQsCdp8o5GN1eGgGmqqWEHUl2jGioKIF6vXNKfJAG7SM8AjFbckH3j/1Qu5bJdRmF2wBteu5+4Zc1jNfy9Z7/86E1/F7K+dGz8WEPDK7HeGWuiu1EA3Tjg=
Received: from MW4P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::9) by
 CH0PR12MB5155.namprd12.prod.outlook.com (2603:10b6:610:ba::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Thu, 7 Jul 2022 17:31:45 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::d5) by MW4P223CA0004.outlook.office365.com
 (2603:10b6:303:80::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 7 Jul 2022 17:31:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 17:31:44 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 12:31:40 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <mario.limonciello@amd.com>,
        <linux-usb@vger.kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v2 RESEND] thunderbolt: Add DP out resource when DP tunnel is discovered.
Date:   Thu, 7 Jul 2022 12:31:28 -0500
Message-ID: <1657215088-6185-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 934f3b10-2577-4920-fbda-08da603e8fe4
X-MS-TrafficTypeDiagnostic: CH0PR12MB5155:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: op/LBYvnLaRG35o7JUU25nYu3zmO07e6/4JpPDPkyse5A+nuMY0N9GJXtUvzoYdZT1FVWUDRWsMNGRrcV72/JpsYVTOBlGYfecIGUDFV4VHIxq417hHfL6hmB5qfL3VB0n60CXYhC2OYzM1QXchxcToIh49N2NNx9nL99dMNyzkkG6VGlgED0powvFkakiUK/THtWnwGwCEhGpUppKy/bIMis1nfN/AT7RXCb/Nj2p6CYk3xspGpZPwB5IvVJVDCLfiUAk9XfchDyekAT8C1/KhhFAf/P6wc8bClHhVpEJXEeFRncTlnvK6hCsxZkneJzBNPe0uhc50Ut2BJGCVvC+vz1FKrqgUYN47cv1Kaq5p+IWed/Wpon0V/9YdyQddPzkzPJuMGR3aad9+16sXkP8Sl3AwYTht21i0RQCJRSUHYGkN2Xw7X500C8Ys5ZLbPsTC6BYMyfyHHyrFWSePQP4gFQjxvkLOiidL3pizC2y9F97cWx2yk6EOhEdS+4bnKF8PitJH7j3xeA9NOmsxX0AGoR5aY0rQgR1ooRKo3r6p7t9a1d3v92+MxmCrV3gAJ/t2balac1j/9WJFQFlgJzKkEYz/qggzsrl1yN3JTHOCbMcmpXctApp7gwOwvv5AVy2LFJ70YAW87x45xYbXZ7+8weJdee73z3E5pk38Kgh9IwN7ex4L6MVkPmlYylFL98FetX2vHlpejxMHsq0A0y/rv4pHaXtKGCe4OANOIEV1PBgcSM6n+cXpzy/7oprJSa6ZHOLg3VK+rP63WfZyQY5iDVTY2LfZlhs4m7a1HUTHipMcAlKiHJYw2UgCev18/MP7zg/G4xxcpMogDlCUQLMUV7oUPMJy0ODqpfeMLRzb4z8ro0dmc2wGHf++1Qd2F
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(40470700004)(36840700001)(46966006)(478600001)(40480700001)(34020700004)(2616005)(86362001)(40460700003)(426003)(336012)(8936002)(110136005)(54906003)(81166007)(83380400001)(47076005)(36756003)(26005)(82740400003)(41300700001)(2906002)(70586007)(70206006)(8676002)(356005)(6666004)(5660300002)(4326008)(36860700001)(316002)(7696005)(82310400005)(16526019)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 17:31:44.2859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 934f3b10-2577-4920-fbda-08da603e8fe4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5155
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
v2: Re-ordering the function declaration as per Greg's comment.

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

