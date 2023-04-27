Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B25776F0B36
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 19:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244608AbjD0Rnj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 13:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244414AbjD0RnS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 13:43:18 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAB26197
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 10:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tmu6csB1N6Lw5pZiwiAS2fCeum+C3tiGu4ScnSMoayTtPJj5o+vhTEZSMUkQrFwXXnNDh4Lb78DU2x6Fo4TIqgHvqu7CvdI6SRE7BhRlEAgsnplFuI7bPqFz/LAOEcKOjpMHmFpDv3hEkzHYM8rwV0hxzxiYcNKiRxOnQDENvW2mG46/XDWY1YT5ep6FZ5GGMsnuYQyH6K7me3I20Vt9s2Fw1L8bZDb9hTPw99tlSsV+0V5lTJI7r0u6G7kZktkREoRMVMp+G0K7gt2msmi0xs8jNx3uM2xTe1JO1pngZeyxlc9iZD/ydhwst1nyMLsPGEluXJ0ca3AOIrH5YKuAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3h/A/IqYh8C1+lU+h4i/rVuhk9gj1hCwHMddEMfHQ8=;
 b=Yl/2WUJstusxJNBLs5gLafePkeFNdR7XYnbe5yrgrXdvb0SK1VRl7wNo063CV3+JwAA1eZ9RYp4uAVB6ntzuoDpzDqx7Z0Yjb4GPIvvAai7599RUrB9E/YRkbczGs6Wq5dhFSYp05+ZSEYWtvGrbmTSfOYzTx6nYWcuOJWjIWUYEdcyAxyYkfM+UmCJbh2zgNDlpRhvaepIyQ+iqqb+kosOn+zstPI6Qrr6le9Qf3i7B07cSYHl3brhsxe5XtMdkpGBBRHlqROMs+nZaSzG/YkzLtOz6ygHdiietqco0pXx9ajIOsQJYv1vWSqTrRCJBhCMTTcIWapyDKYlla/hZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3h/A/IqYh8C1+lU+h4i/rVuhk9gj1hCwHMddEMfHQ8=;
 b=Fy1vQRv8nHF0TiImS1mhtJhinwN2vf2AouswB9uygT2q+2lqqB7BS0ewd8PUbhzBEh8KULZHb1rTUj0NSjL8NS1OK8Mn0hLRtavk+i4iLFlf7BMU58Ng8n/Ni/IfY4NccRVAMtPRhk9PTe0Jutk/h28ZTWFuvLxWvoSJkGFz2TU=
Received: from MW4P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::31)
 by PH7PR12MB6836.namprd12.prod.outlook.com (2603:10b6:510:1b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Thu, 27 Apr
 2023 17:42:48 +0000
Received: from CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::f4) by MW4P222CA0026.outlook.office365.com
 (2603:10b6:303:114::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22 via Frontend
 Transport; Thu, 27 Apr 2023 17:42:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT094.mail.protection.outlook.com (10.13.174.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.23 via Frontend Transport; Thu, 27 Apr 2023 17:42:47 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 12:42:44 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 2/2] xhci: Improve the XHCI system resume time
Date:   Thu, 27 Apr 2023 23:12:20 +0530
Message-ID: <20230427174220.3953123-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427174220.3953123-1-Basavaraj.Natikar@amd.com>
References: <20230427174220.3953123-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT094:EE_|PH7PR12MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 340903a3-3ea4-4092-197c-08db4746d09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gjIsijzZYeL5Au3c1NSxp+CpqJ5BuIz80uNJAkBjoqnijEcwgJ9tkQwq48+7wRCTnQvr6w9zSvPup4TyBXkETecNzqeYmXX+iHarib8sJ/gJGeqNZ2l5vkBDLpmAttrJOG8+ad1k68sIcoAy8CM8IooztfwBkQTz4YE44fRVFCkzwNGqNJahmbLclxwW5u8dQG+GrAgw/091FbpHAybLhrcMUcqpG5LJxAzpkLNhNYpiTFzZnVGlGHuSydEYBE4zii6ALlRX8QfOCoBQ1m5Kf9/0vi4/penkZXREk5oQr0YV4nZZMeEpo5tXRd7hpL8Ke1ZM4H6LYAX7bFiOW7H9jO6etGgQPEs0eahwS2ca8OXwmacCFt6Eth3A8EqTJnayW3O8Zcc5962eND0TAlaUz8Q98pHHQXCXUj+rsWknDJi/3VfP807kOpEwg3zAkseLbbOZGYL5de8zGi1oH4IXK89f2p7dOkhRLU0EMX9bTnLVi4rVwRBSllp84slYqjV5erxMeOzI+HpKuoaM8JdcVhT3XyuKHgXviEYmmCRYSq0V159IAJ8WCd41aYaFHfCNi3Ax7eBga3aajlv7ILE49hJrOrmRTirHEGKvkAfMi+HD5ql+fVdTkOtLZealuS/8Sx+pq/pKPiICgVkPr1/Axnl7yJpN2lx6hU9H/V31icuCEl1/wvmH48gMoJrsO0khbrxxqY1Vx/EPs7c2BTQJO70F4IgGuzuflirYbZ2qYO4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(46966006)(36840700001)(40470700004)(478600001)(2616005)(47076005)(83380400001)(36860700001)(7696005)(40480700001)(26005)(1076003)(6666004)(70586007)(356005)(70206006)(4326008)(82740400003)(110136005)(426003)(336012)(186003)(16526019)(5660300002)(8936002)(8676002)(81166007)(41300700001)(316002)(40460700003)(2906002)(86362001)(82310400005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 17:42:47.4759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 340903a3-3ea4-4092-197c-08db4746d09b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6836
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Avoid extra 120ms delay during system resume.

The xHC controller may signal wake up to 120ms before showing which usb
device caused the wake on the xHC port registers.

The xhci driver therefore checks for port activity up to 120ms during
resume, making sure that the hub driver can see the port change, and
won't immediately runtime suspend back due to no port activity.

This is however only needed for runtime resume as system resume will
resume all child hubs and other child usb devices anyway.

Fixes: 253f588c70f6 ("xhci: Improve detection of device initiated wake signal.")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 11a87b9cbb50..4c0a2b9ca7b2 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1315,7 +1315,7 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
 		 * the first wake signalling failed, give it that chance.
 		 */
 		pending_portevent = xhci_pending_portevent(xhci);
-		if (!pending_portevent) {
+		if (!pending_portevent && msg.event == PM_EVENT_AUTO_RESUME) {
 			msleep(120);
 			pending_portevent = xhci_pending_portevent(xhci);
 		}
-- 
2.25.1

