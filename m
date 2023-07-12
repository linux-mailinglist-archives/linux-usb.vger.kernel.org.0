Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC45D74FEB9
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 07:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbjGLFcy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 01:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbjGLFcx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 01:32:53 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3D11987
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 22:32:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRxP3+IFYEPP3CffGanWqFdRobrZ27t/j8P2eRJDluaro+XQ8fttR9PtbBWmUudpTwf6uH7fKJtTNujiyIbZG+mEMdiu0CxWIpAlA4mA4pV10to9ZOESf8dTMgRq9Rtry26odOX42Epf/+5b4mb+9JaYoMpzqNjZ7F04wCl3WzzKUJcyZnL0CuTXNnDFT1byWusp2OQalPhCZne0iZbr+txjK1cAcPAgIJnfHyln2udqEGElSMcBHV6+nSpt/rVNH/wOqyBOlBuZeYVPEXu4md6RAlOUIsbAuZ1BrWbLveAvKU3HsLC7bLKtcoqoGmlOV1QoPFRbMGeZU+obHLDZLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LFGHhSXY6oMremyx19e6LhQbYrNmfk7WUFP2MSynnE=;
 b=PmV/qq5bPFC/mmTyxwohRWRrrw4irSum1Mz1Mp02vRau2B1OacH6MJ6cEYd1OiNBELx0rgMMI9QgpidjnjPJqc8ZSzjjCjRhQeGWbLBmMRCYbeBcu7sIvdGC7OoNLacq9pFwuc7i6h2I/PvHgekQiXPSnTcKBICC0Xzw+T+GdSVDQTLwMZLevnV1yZ6P9lplY+COgmtkgE+kwtEh75bHIXWbyW6x+6YPb/HRPZlRXx+WNb2XJMK6wzJI3eLlnivw1C8SzVYTa/r2oI67+87L5pvJzohfcjehbEFZzVfdE724xQc8GPTP0LprilIMhYYuHXwNVy8+Dw7zxaIk810Apw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LFGHhSXY6oMremyx19e6LhQbYrNmfk7WUFP2MSynnE=;
 b=SYjbPjQ3qQIiifFZLY+Q2UTdG1wt63j3SohzRZyilIrTvuk6+b0DSSTDCldfFPTbpvsvG45Zzz3vxQLL6hENRJz6fBeuYbOqGLsdtcHRRS8czCII1MpUx1PxR0/MmkKMcVMTiQSG5g4pLzJxa+ZdtfZQE0O+ppiiCu/HcD/mxA0=
Received: from MW4PR04CA0380.namprd04.prod.outlook.com (2603:10b6:303:81::25)
 by SA1PR12MB6917.namprd12.prod.outlook.com (2603:10b6:806:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 05:32:45 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::ee) by MW4PR04CA0380.outlook.office365.com
 (2603:10b6:303:81::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 05:32:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Wed, 12 Jul 2023 05:32:44 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Jul
 2023 00:32:41 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <linux-usb@vger.kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>,
        "Sanath S" <Sanath.S@amd.com>
Subject: [PATCH RESEND] thunderbolt: Fix Thunderbolt 3 display flickering issue on 2nd hot plug onwards
Date:   Wed, 12 Jul 2023 00:32:26 -0500
Message-ID: <1689139946-18667-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT058:EE_|SA1PR12MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1fa475-f14e-4bfc-21d1-08db82996b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YSnG509p70Nlc7lSpoAiDWhJjeeUunF+DKUwEddIw+Hcz2R8Re3NjkA5RQGWlF0h6fbjnsg+8aRlDHGdP7pKRXkPx6XrG8NKqZL9YOvM9xDlv14yLoX/sUyjccemzomvvFa4+0Bfuw75dtFbGMdTBmkrMumArwc/GhEoBGwFxGacHrwHBsg7sv+Q3XnjCOtvPvV2LvUcW7zi7b2JuCfc4cpzwMcWDdZMHVbFJqc1YB7Ke0zKLGePSUe2Ijk21Rn+7nHzcwSvI+kozNQB4ARzNi/f2O6hWaXGi1e9EICqf0fDr7Ja5XLhaiVmnmheUpnSDXQpsVe8IaPlVO390AiFMAxXsrSMD5ZNg8xiv2xunXF8qauX9rOrDuSNNUIDGzP6+Pgq1N+y2XdTEJXeyWZ/mrJxOh4K1uwGCM+m9/zCebsGbuLXWfvS5brwq3vX7gRpvdDrsGAsiudYxFSW2F3ceo2LFJfPTIHslb5+U55nF79fbH3ruxN2DtUnKOmLmG9g7xLM6e6xUFJwYUhwZqcV3CEz7jeXAFKCFTz7StGYfHj6pUQb1VFgNpBJA4a4I04MujYL+nmcRNPI+JaOZVQw3lszq74L/Ot62vZQDyx4X59yDTDiJEcfMlOhwtP2m6h/Gy4k0G4CS6jvRa1v+1XPItKF8I+PJzXdcar9tIsuQjWfxuClYwB2rugRqv7DBh+5wL7XELcfi7+5Q1LjntlLdCGqD72dszLed+2OIqctYcJmWvt9d2oqYxx4AzKge+Ja1Mvgw3VrSVIHyYaUx/bO8g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(4326008)(70586007)(70206006)(82310400005)(356005)(81166007)(86362001)(336012)(186003)(16526019)(26005)(2616005)(36860700001)(83380400001)(47076005)(82740400003)(66574015)(426003)(36756003)(478600001)(110136005)(7696005)(6666004)(54906003)(40480700001)(41300700001)(5660300002)(8676002)(8936002)(316002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 05:32:44.1589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1fa475-f14e-4bfc-21d1-08db82996b35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6917
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

Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
Signed-off-by: Sanath S <Sanath.S@amd.com>
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

