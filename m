Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67E1C74E7F8
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jul 2023 09:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjGKH2o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jul 2023 03:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbjGKH2n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jul 2023 03:28:43 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2215918D
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 00:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgy+gSjL+troXb0ZrMdQIS/riH6pUmt+AY+vAkHAZxVP4Ouoe+CSwA45q39DRrHHr7zJqg+TW1G5GnYg4/wuPcY8YZc0SAm81g3hZqVa5t3SIHSHlFEC28FW8np60zdgXtgKIu30/LExz8gM2HT0j5l+NcX+aoxENG9gQ7M3t7srZ9CKK4qIRaSy9q3Sg+/zXEYR/XO7lM6BzozAPeEDjMu7I5UF/IOK2+OJHrov3RbIRV+T570Qy54hVKr8uBphyi5OxghPoohbAKYCiw/Amt7pLjA6okCYpXmp9n2f0sZMv8Qc6t0g2IAdxtbRScqqDN+QWFu8pomTuLiM8i3UOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+3KzYU8nfgl8fh5TyIhaFi2NWwKRGFRx208JT+0lGY=;
 b=U9oVT+69hiyOxs4M2uW9LvMgxxAUmfruvDhQElVsDkTH1Kan9aWqG3SHdN4J2BVhOjLvptziquohB7ru/lWxPsKIil2R8AQLJc/Uw7VhgnSIGPTnMwwj2nBsEzwdRhkpyrBdLDYCap+aPa1KUqfpZGMIlcZDPlPbOAbaZgnCxiMHggMjj6iIe/IEMat+3iVGcK+7RVH0Oxa8HbIYwONauOb/3CkpkyK72eAXuL+r6oV4OYHGErDoL+Ww3nlaLYnFgohdK49qWAmrN5RJdM0asf6L+V1hYVPJe+rlP2QC5EUzntsRMFUq+4NhZByglamRCT8lh6vCRoCkSDF28S8z8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+3KzYU8nfgl8fh5TyIhaFi2NWwKRGFRx208JT+0lGY=;
 b=wnZsBuyRJG5TUmSQJpL95/65W1dbJ08TTxjl2ngEQYZoWqNWqluvuFudNSSkEygrj8If53g1ah/hRIN8rOVL6JcCRg2opudfDJEkIpMbFXs+NjczTKx3enXjy2tEmx5u2kL6E2obq4pvku6U6/0TdEhvtWWNTI6m0AKSnAtbins=
Received: from MW4PR04CA0110.namprd04.prod.outlook.com (2603:10b6:303:83::25)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 07:28:34 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::48) by MW4PR04CA0110.outlook.office365.com
 (2603:10b6:303:83::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Tue, 11 Jul 2023 07:28:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Tue, 11 Jul 2023 07:28:33 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Jul
 2023 02:28:30 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <linux-usb@vger.kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>,
        "Sanath S" <Sanath.S@amd.com>
Subject: [PATCH] thunderbolt: Fix Thunderbolt 3 display flickering issue on 2nd hot plug onwards
Date:   Tue, 11 Jul 2023 02:27:50 -0500
Message-ID: <1689060470-88947-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT047:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ed52e1-462a-4583-8746-08db81e06ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZw9FI8mYWNEDjh0ADL5yrEpWtsDnS0eD1SDH9EC/n56/ulBY/qfQeuvtTBdOTjmA0KsXgZOkjBG3UKcyMERehgRGELQjRLkGUxsCc5ZxHeX38kdD2Pgmr32hzRIQFJM1y/tjQCwWFzn7ciL9sdQ78RDeEsQkpfpOMqU751SFjOZGamV2n8ZZvRufmywupPljv8NL/FelFaBXcri1J62/D8moxMQmZzU7cgJXbk9ygwfo+larUWePMT6WZWsl4bJwuRVQUoPrgj0Ykq09zRW01AH+cPz8etzXB3mLVL3lB1E1SBjyzi/mO5O0oXTqHiu4uf1bjNlG0KfBpsiUBAERTua3H8uFTMSA6LKk8lJUSQlzu8rI6TcYeBAlzTk+jt7/HePP1awMh+Im/9Te6pS6xl7lOc4W3R49xDNirgSLWVC8XuEMIF/3gpDJazoLPn8Yu2QVXN6p/k97+XO1tF9dBND8jWlhEK6BeZR8ayVnE/toU21gDQU4XWbv5s5hU5HRG+csEIscCrbiyErmfQVmtU7BmWPUEI+EdQgHzrchdf2g+oLr126/JQc+btT8PZ4o6ggDfRlDM7tYqbmt3YFzN8fMGy0URZx8CyyAXgXGrvOULReT0o/AX2+HBnzwY6tEStaFah1j5qMVeRuhfCMn5dlwVmwsQfyMxPAplvaslK0SkP07SkBgxP/SWN98qkDttfsYIzp9wowUDPzV+tuyCzoo7bWCvrHODEgJwS3WD9KvQp/d/T2Ttcei5LsTXNFrEMeCjza1O9EYDCAoaEe0w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(46966006)(40470700004)(36840700001)(8676002)(8936002)(36860700001)(5660300002)(47076005)(2616005)(83380400001)(66574015)(16526019)(186003)(26005)(86362001)(41300700001)(426003)(6666004)(7696005)(82310400005)(336012)(316002)(356005)(36756003)(40460700003)(2906002)(70586007)(70206006)(82740400003)(40480700001)(4326008)(110136005)(81166007)(54906003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 07:28:33.5384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ed52e1-462a-4583-8746-08db81e06ef2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

Previously, on unplug events, the TMU mode was disabled first
followed by the Time Synchronization Handshake, irrespective of
whether the tb_switch_tmu_rate_write() API was successful or not.

However, this caused a problem with Thunderbolt 3 (TBT3)
devices, as the TSPacketInterval bits were always enabled by default,
leading the host router to assume that the device router's TMU was
already enabled and preventing it from initiating the Time
Synchronization Handshake. As a result, TBT3 monitors experienced
display flickering from the second hot plug onwards.

To address this issue, we have modified the code to only disable the
Time Synchronization Handshake during TMU disable if the
tb_switch_tmu_rate_write() function is successful. This ensures that
the TBT3 devices function correctly and eliminates the display
flickering issue.

Signed-off-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
---
 drivers/thunderbolt/tmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 626aca3..49146f9 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -415,7 +415,9 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 		 * uni-directional mode and we don't want to change it's TMU
 		 * mode.
 		 */
-		tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
+		ret = tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
+		if (ret)
+			return ret;
 
 		tb_port_tmu_time_sync_disable(up);
 		ret = tb_port_tmu_time_sync_disable(down);
-- 
2.7.4

