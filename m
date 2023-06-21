Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F58738041
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 13:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbjFUKj2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 06:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbjFUKiu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 06:38:50 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02231BF1
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 03:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDEnkJASHkVulY4L0e81SK/T3aNALTWVrkh2g+QWNO3ST4d+m0TdLNFU4M0VQtKkvpzvacfUvdwLRdz7Z1xUTiiihIUrsncjz4MBeKgHqxMXeYvFm5YM8PFrGN/6hA1+zAY/U1Wd3+QKuG9OrJuhD381+7nZ4HYn2Id1b1I+myhVI3AazlnZBV/PsTgij2nb7ECfZhBXnaMbFS3J/rpJgsWg9Gfv4cyZudoTlcZKxVrTRZq6uYP9A2cd9K32PdcLUAEp67Xd2ys7w0N8DItMW+hUO4KiNcRn3tFf7n17QYZu+CgZbJe2WQZafcX2JZSxHrijIkmV2tPZnOofu1T8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/C7/OGdhSfUwqlYXkhOnCYq3rDSMDdzgASB1bTURKQ=;
 b=P6oxj0CRQXQWLq77J/9l6TO11Y25Wc8ofb/rW/dNaPC2Dr8u+iYtB9JzYIkI09JvWlTQwe91MDq0pIi3ivIwsoeO/urvW5FccUoydXmV8bC3NTwuttYlYDrmjNQCuI2oui/Qm/cSnS3gOy1C2oanGkHFhX11mGhvf25aYpRxjAUSpvCOo4ocbFtZe62/5UyJudwInoxPW+I+q9SDIVDaSYfXuXpk0j+jxbJBgOiyeCnQPwP9DOblBU2Vy+nvIToY1WGnNx+Y0F3/uAHKOHtEHOz20AGax+p2HbSmSNCqGlCkv5XAUYh16eWk57EqXyV0yhQ+chbp77bD5++4AUoHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/C7/OGdhSfUwqlYXkhOnCYq3rDSMDdzgASB1bTURKQ=;
 b=B1fhNmBcvpAUxI0oAOi0rI/7EhVQG+S3dlYLR6VmzblY5/q5vXKBdg/3rmXRiJ3jBnAI9wmOC+PhslOpRpTxT7x1Ak4yzfawkKBVWdJ09PD8I9f2GhJ55i7xkS5rsgCr8gae5WrKL3/reYX8RzVFJYmzm/bYN8/dwJMzowh05ts=
Received: from DM6PR06CA0099.namprd06.prod.outlook.com (2603:10b6:5:336::32)
 by DM4PR12MB6230.namprd12.prod.outlook.com (2603:10b6:8:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 10:37:50 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:5:336:cafe::f) by DM6PR06CA0099.outlook.office365.com
 (2603:10b6:5:336::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23 via Frontend
 Transport; Wed, 21 Jun 2023 10:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Wed, 21 Jun 2023 10:37:49 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 05:37:46 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <linux-usb@vger.kernel.org>, Sanath S <Sanath.S@amd.com>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH Internal] thunderbolt: Remove enabling/disabling TMU based on CLx
Date:   Wed, 21 Jun 2023 05:37:22 -0500
Message-ID: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|DM4PR12MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 00dfbdd1-ccdf-4942-b14d-08db72438f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BO1dfLMlLMi0IVe4frhIZhNxpeGDyXutu9Vk8tgZbPezZJRA6d3wwK0ybNSApJjoeVLrGI5MvCv3ZViR9cfC7NDU5ngMq+yOnju+yCkquRQgnf/Iux6fmBdQsUep2At32yyBNhJ8mQNELFwGvXvmJaKjLEob4VvNuEWQrlGuq/sMo18BoLFTF7LdYXD/+MsAIib6Z7bRV6UD0UerRhRkMey6tbYLy9+OLFo/ru+MbeozCtkc2MqsTZ593MrxbtrawLzQMmuFapQqYJaKJUeUD6dJ8K2sPlcXjI6aet/oox+7ma5hGq1edtO7kLvXAbqPcflc4GVL9+FLymnHg/b1rHxCxgZKUhlLrYhjCffHMeGj97bkJNyZ8u7hISr6f5TYqb0YW5AO80ModkpASXt82g5VWah2Ln0uxgihdPF1b8utjXyLEdC1MpyuOIr4ITqdt62DZxI3I4rSPPTU2J/h0r04A5Oke1bIloPPv6bRHw/BZSsoY9l+NgfuHJCewxSCzG97c2lSA2x7Mhi3dES8fn+/yDnFJwB33LH8r46s0H7pmPz7JTN1MzF8joI0Yj5zFxC0C9WAkTj2kYJ0Quc6xWshy9v6y7Ge4fcK7YXZfvEr1ZEaGFvDVlIwnoG20RK5RteKYTLvNW5d2Fa+sDYdufKmzSGxHSa48nzDioeHSpakPteX1nuE9ruM1OV2Bl1xD5gtwMuh3/rk1s/8j7vDIrA7zWfEBE/vDf9Y7bPf/lur14O/OQgSTdNEvSPvVEhsxOuSbR4kZCFAdbt9f1EblA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(70586007)(4326008)(70206006)(41300700001)(316002)(54906003)(110136005)(8676002)(8936002)(2906002)(5660300002)(7696005)(478600001)(36860700001)(6666004)(40460700003)(81166007)(40480700001)(356005)(16526019)(26005)(2616005)(336012)(426003)(36756003)(82740400003)(47076005)(83380400001)(186003)(82310400005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 10:37:49.3589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00dfbdd1-ccdf-4942-b14d-08db72438f3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6230
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanath S <Sanath.S@amd.com>

Since TMU is enabled by default on Intel SOCs for USB4 before Alpine
Ridge, explicit enabling or disabling of TMU is not required.

However, the current implementation of enabling or disabling TMU based
on CLx state is inadequate as not all SOCs with CLx disabled have TMU
enabled by default, such as AMD Yellow Carp and Pink Sardine.

To address this, a quirk named "QUIRK_TMU_DEFAULT_ENABLED" is
implemented to skip the enabling or disabling of TMU for SOCs where it
is already enabled by default, such as Intel SOCs prior to Alpine Ridge.

Fixes: 7af9da8ce8f9 ("thunderbolt: Add quirk to disable CLx")
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
Signed-off-by: Sanath S <Sanath.S@amd.com>
---
 drivers/thunderbolt/tb.c  | 4 ++++
 drivers/thunderbolt/tb.h  | 2 ++
 drivers/thunderbolt/tmu.c | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index aa6e11589c28..5fa9fbf095d2 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -923,6 +923,10 @@ static void tb_scan_port(struct tb_port *port)
 	tb_switch_lane_bonding_enable(sw);
 	/* Set the link configured */
 	tb_switch_configure_link(sw);
+	/* On Alpine Ridge and earlier Platforms, the TMU mode is enabled by default */
+	if (sw->generation < 4 || tb_switch_is_tiger_lake(sw))
+		sw->quirks |= QUIRK_TMU_DEFAULT_ENABLED;
+
 	/*
 	 * CL0s and CL1 are enabled and supported together.
 	 * Silently ignore CLx enabling in case CLx is not supported.
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 58df106aaa5e..9252d3875c08 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -27,6 +27,8 @@
 #define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
 /* Disable CLx if not supported */
 #define QUIRK_NO_CLX					BIT(1)
+/* TMU enabled by default */
+#define QUIRK_TMU_DEFAULT_ENABLED			BIT(2)
 
 /**
  * struct tb_nvm - Structure holding NVM information
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index c926fb71c43d..8e38ab5aae15 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -387,6 +387,9 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 	if (sw->tmu.rate == TB_SWITCH_TMU_RATE_OFF)
 		return 0;
 
+	if (sw->quirks & QUIRK_TMU_DEFAULT_ENABLED)
+ 		return 0;
+
 	if (tb_route(sw)) {
 		bool unidirectional = sw->tmu.unidirectional;
 		struct tb_port *down, *up;
@@ -643,6 +646,9 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 	if (tb_switch_tmu_is_enabled(sw))
 		return 0;
 
+	if (sw->quirks & QUIRK_TMU_DEFAULT_ENABLED)
+ 		return 0;
+
 	if (tb_switch_is_titan_ridge(sw) && unidirectional) {
 		ret = tb_switch_tmu_disable_objections(sw);
 		if (ret)
-- 
2.34.1

