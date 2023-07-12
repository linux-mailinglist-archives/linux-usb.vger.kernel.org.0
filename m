Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7BC751067
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 20:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbjGLSRz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 14:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjGLSRx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 14:17:53 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8840E173C
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 11:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLF3bN6ZIXYGjexbtqmMFcJ9ph0bxsUBlLjfAJq4dzLn5uIvqamJNEyOCRakE2wykvkjDFPOz25m/OFJEZu0dTlnOdbl1U6YnDE/KZnFjFYKlU4pzkHUEExaKr5wrJXPssWivPKnMoi4y58RfUWcYcrE6yApAyDCBDK7UbQIbs+dYeAFBkELt8gUt6ROcQVt+x4i+yE+1IvQUMhf7CdOh0bV8iTc9VXkPe97nA5FT7c54Fbn584kDrMYwyp/+h9o39KTDz6hgkahJA3q2quTIVjLb050tieoh55rxQfOAI7YJ8S7Uh8bzbP15CiDPG1ifDIu5w23FPZAL4MRpvEiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGHdyqW+cWPW1ti8QRF2UbH0TmnKuudHvJUu/GdJXGQ=;
 b=CU7dxTHYkJvMVJHAC0ThQr+uLIWtWBg/TlNufbOrvYoyV975UE0wqvF2ha8fQFJko2xLCC0ozR7ky34pffODXXOQYnC5UG7zSFdjujxMYUt3NCrpGcimggpyc1mdwSGrSkJwyy0O8PHGkzXsyU55gZeqLFM4Ua4ww2/b7WbBLdUZV2w/tPVPAWpPQqLW9iTGeOFNdkv2+H0MmB5QvykMPeRzMosuGHKpdVzpxre/H728JlES9x4A0ET5XrwLUobdVR2xM51wo9NpgsoPlNDV7QOGqYt/BQVp4mYrzhLEf3ljV8HQRO1N05kdXJDE2hPJYakfch0NTwrcZ3Cdmwcr1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGHdyqW+cWPW1ti8QRF2UbH0TmnKuudHvJUu/GdJXGQ=;
 b=Ym+yAcDyxoU+Btqg4da4M1tuxZ8Z05+Q1tLXeULtu4Lhb33pxLsAJ6cN10HV+MmMiLFm+ZgVFrpICqz85HH9KzqbjRK6arOqaC/cFT3ptc8rF4fX7QTppsNGLz1/iG3FOw0x2ZlCojSAf3+WByslhLmnFMzs5pvsxQoX2hbUkFs=
Received: from MW4PR03CA0142.namprd03.prod.outlook.com (2603:10b6:303:8c::27)
 by DS7PR12MB8419.namprd12.prod.outlook.com (2603:10b6:8:e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 18:17:50 +0000
Received: from CO1NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::46) by MW4PR03CA0142.outlook.office365.com
 (2603:10b6:303:8c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 18:17:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT109.mail.protection.outlook.com (10.13.174.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.24 via Frontend Transport; Wed, 12 Jul 2023 18:17:49 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Jul
 2023 13:17:46 -0500
From:   Sanjay R Mehta <sanju.mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <linux-usb@vger.kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>,
        "Sanath S" <Sanath.S@amd.com>
Subject: [PATCH V2] thunderbolt: Fix Thunderbolt 3 display flickering issue on 2nd hot plug onwards
Date:   Wed, 12 Jul 2023 13:16:19 -0500
Message-ID: <1689185779-25648-1-git-send-email-sanju.mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT109:EE_|DS7PR12MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb80ec4-ae40-4faa-ac9b-08db83044cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kg91FD1BEMVj3kmRXGlP2/IkxH6Gfa/YtXNpBHnpnXpmRyfVXSc2ZVMZ3F55Q5OqT7d6GI/0H9XRe99KAZcwmPKDrumwx5TNrL7071fvXj2NsuVFIm9w/daVbwlVg7deqaYbIOft1PnkQrODEpU1difSHVC0JkmV5H5vOTmLwjo0wiWmfAE1Ru5dIWJArg5ovLICzEly2KleWjuFjt3f+0ZNoSynJTclLpNqvJC2bq92iWHwJfn4yOHfF1nXDgFGdOEU0Bje8LmdFJmbKD5x16wb8jkW8XcIdKnz7j037RUSTOYwwbTOjYORWbPw10LTIaNsKX4avWUxr/0sBdcf2ToZbU8rmdsLV8Fh0ZSjOiW8U9b/0jMuXGvtBP/yGgC/i+0PeBRylzjwdORH4QkPh1D+bp12AMAYYZKe/wkZpkc3Y5ODpkZlst2MDjC5PYOFNqrsehPgExT8E4bbg81chXaqJ3HoOXrrJ7CfZ9fZie6bVBXqLzSOOhPJu0iibErjFz0hEouiQ52k+o2HdwrzepqrARB2J8ViB+c2LEVfLu9tIXAzHyMi6eJaZAldZZEXiNdq1HrQSZfzsh9bz8GNAYiD9bzbcBlvyr8Jhn+j/hC+AIPW4YkWQKSkisZIVW3vmvOK/9FOrwoJ2myLqXyLnJtlz+snyqX5ad5j57+2zCfPLEQLg2O1/XtzrBnFbCN1FnZ11TJ3NlRNi9KCeiAYvojulEVCxrD9dNfYqDkUetbdf7l6wHeXGWHqrdDIF5z+h8LrlJQykuR5Rb86JIsI4A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(46966006)(36840700001)(40470700004)(8936002)(8676002)(36860700001)(5660300002)(186003)(16526019)(47076005)(2616005)(66574015)(83380400001)(26005)(86362001)(41300700001)(6666004)(7696005)(82310400005)(336012)(426003)(54906003)(316002)(356005)(36756003)(2906002)(40460700003)(82740400003)(70206006)(70586007)(40480700001)(81166007)(478600001)(110136005)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 18:17:49.4289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb80ec4-ae40-4faa-ac9b-08db83044cdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8419
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

Co-developed-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
---
V2:
	Corrected the signed-off-by ordering as per Greg's comment.
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

