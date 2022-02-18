Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D407A4BB2FA
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 08:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbiBRHMF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 02:12:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiBRHME (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 02:12:04 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449D8DFA4
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 23:11:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dei3ddVMxUhmoZFnm3ds6HtbVMJjyO0VIhWZHKI43lshweU/QF2iP6P5kefb/xEhQtsIaEeENX5+GPwHhC8k5336bkgNEQaZsP36Rr7Bl48P7I3ErVlIz/RfPGLYp6Q4CLcBf240Pv90xIQm1eJRp5wc2+AgtyGDcpUvm5worRDHVE+fJQ1dU8kG0hDM5reKgZxym6WQcmhMPxuOrpGZj/oMjpGnWkTtJ9/Ql6gSBF06lXEsBUURs+H6E2//dWizXEBHmShw1JIW+1zLRX1P2ukkuMjpM8yXloWjuwA11ZA60HgfXAneliKnqgcWIXjhJf3y5lkAA9BpL7RS3DX53g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iEDxKWukD2RGs1gmeDVEAM5NUAitcGGZgCZ3E1Y4ME=;
 b=lHK9UqjZyW5p8JCfCmVBpoV0NIdiek+nO6QQJ4sd0Qwf4UY4lEvd1KLz2Bo83lYRhB+LRzKzhjJqINQXkDrcb6iyb7pjlSlwIfbJXp3n9ABvRp3u5uLoH7XO9qLRNq/fD5xTjp4owbwZTd6I7J5U2XDprT09dUcWuMW1bmLBuopwhZLI87z8TKTuZM5bs8Flm07YyzLIu8U95QsZAOmegMaxKETOqcAaA9MeeooiQYJlRZNZkNYhea3hMgmaTQPruXyQALBDPvyKFxrXL13LdpSrFUFz0qupASlJIhxYGv5HQzxNgGgMdStjy93VwswLCWZaikfYIGbjCa09eF739A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iEDxKWukD2RGs1gmeDVEAM5NUAitcGGZgCZ3E1Y4ME=;
 b=vI62ZeQ+5vvKwKZqwMg/lVvfjoBB5uhkUCf97t6FUljP/KALFq6n51AIaS2C53IlTiUCvnoeaUPto31V2UaReT/HNKPT5VgQOfwNwRlUuscxo919S9S8WsTzOMwT+CPZa+p/WzI1sCiUMckEg2vlSmaBat8RYFaEK7/1cPxuS6A=
Received: from BN6PR16CA0026.namprd16.prod.outlook.com (2603:10b6:405:14::12)
 by BN8PR12MB3538.namprd12.prod.outlook.com (2603:10b6:408:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 18 Feb
 2022 07:11:45 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::29) by BN6PR16CA0026.outlook.office365.com
 (2603:10b6:405:14::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24 via Frontend
 Transport; Fri, 18 Feb 2022 07:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Fri, 18 Feb 2022 07:11:45 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Feb
 2022 01:11:41 -0600
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <jagadish.hadimani@amd.com>,
        <sachinkumar.butte@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH] thunderbolt: Retain host router DP IN resources during suspend
Date:   Fri, 18 Feb 2022 01:11:25 -0600
Message-ID: <1645168285-126273-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3490987-ae7c-4007-8efe-08d9f2adec04
X-MS-TrafficTypeDiagnostic: BN8PR12MB3538:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB353881CEF6A4A78C4A20A614E5379@BN8PR12MB3538.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MwNwH3dinsQgbuR8qCu4ctYpHLEYRcp/4BSBcs1XjJQx6JI78QbAh0U4KRhj9VtywpxNCsm5r95U4vBwRWHtoOi4i6Owl5XVFQutefm/czCXaWguEXH/18Tth+ynO0Ro+69INo7kZGmCdJPeykMkRwp0mZC7EtZV+aZ0Ey7WsF+iJ5YiR1el+smhrVFd50NtcT2D/7tju+EekRw7tgQVLM1MR1jm4pf/SQSXEMelqlfQBa2DJLhr60rI1Pv7L++9YhAaOc8apD79GaRvvghbBJ+aVTznImme+Xw64UjG4tvhXWAy4hGLYPOcCnyuVAMr29XgSC476SePRkOZK37OKNZsrmhUNJDWrBx3oAjRAEJBtY08IPEdChjV0YlrvgOpKiT+m6Lc5xkoeDVS4Ey+m4uiLBbWrEf0FZrPtwHMKjbr5ug0Q1r3iRxWUp+rdaufH1Acb0xq95Gb37y9TA7d+xjYq0oFgdy0ylFtC1Ap0UOa9pX/wdUUiK8oNHxd8iUuLqoEEQ5OafcIHM94gkVV4VppheOioW0CBIm6yUsqXnQAkQaXSluFnrp6xKjpazDw1codx4B8EPAp+0kzwXt0vqeg8rTYeWJ5lhW6rGMGBvBUB59eElJmdXlH24YC/ZzvX2oBcSPVS4CWH/LdCns5uxP1RJO7n625U1/7kcDH+ZMxt8nr7oFMgosK5tsft4iYnI6eRnJMeYNMEKnUUm3d0Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(36860700001)(356005)(110136005)(36756003)(81166007)(54906003)(316002)(47076005)(2616005)(2906002)(86362001)(8676002)(70586007)(70206006)(82310400004)(15650500001)(40460700003)(186003)(426003)(4326008)(336012)(7696005)(26005)(8936002)(5660300002)(83380400001)(16526019)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 07:11:45.1996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3490987-ae7c-4007-8efe-08d9f2adec04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3538
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

All DP resources are released during suspend and while
resuming back DP IN resource is not available, therefore
unable to find DP pair to re-establish the DP tunnel.

Hence preserve host routers DP IN resources and
release all other DP resources during suspend.

Suggested-by: Jagadish Hadimani <jagadish.hadimani@amd.com>
Suggested-by: Sachinkumar Butte <sachinkumar.butte@amd.com>
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/thunderbolt/tb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index cbd0ad8..a11710e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1022,6 +1022,7 @@ static void tb_disconnect_and_release_dp(struct tb *tb)
 {
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel, *n;
+	struct tb_port *port, *tmp;
 
 	/*
 	 * Tear down all DP tunnels and release their resources. They
@@ -1032,11 +1033,10 @@ static void tb_disconnect_and_release_dp(struct tb *tb)
 			tb_deactivate_and_free_tunnel(tunnel);
 	}
 
-	while (!list_empty(&tcm->dp_resources)) {
-		struct tb_port *port;
-
-		port = list_first_entry(&tcm->dp_resources,
-					struct tb_port, list);
+	list_for_each_entry_safe(port, tmp, &tcm->dp_resources, list) {
+		/* Preserve root switch DP IN resource */
+		if (!tb_route(port->sw) && tb_port_is_dpin(port))
+			continue;
 		list_del_init(&port->list);
 	}
 }
-- 
2.7.4

