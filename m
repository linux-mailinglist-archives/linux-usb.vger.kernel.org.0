Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7781F6F1A1C
	for <lists+linux-usb@lfdr.de>; Fri, 28 Apr 2023 16:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjD1OB1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Apr 2023 10:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjD1OB0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Apr 2023 10:01:26 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2064.outbound.protection.outlook.com [40.107.100.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF621995
        for <linux-usb@vger.kernel.org>; Fri, 28 Apr 2023 07:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfbEWtGe7T2uRE5pAMFthKs8phX7ZrBBfk9NmeMMNegjqhlAci3M2b8W8Q1GmgtftDlAfyyMLdt9WyfPxBfUxmDxVfDY+qX3Q+bAKksPZiKJOfi+9lgjQIHbEednjYJxits2vwHjjMAhxAmHxnBSO89S2ZVw5r3qMFSh7Q+qLEhQFhGj+oHHtCRFBv2qDfpOo8L2lX4ctKA0QpcUvXznBFqDFgv68m1MxCE3hXlWGgRf6RYOC9kbZ+nQOZ33GiTDZ7/X8Nia944dVqheWPBf0zgN47/Cij5mfqgXaJ66kRA63UBkzr6Fhdj/HnQJAPaLnxDz/l1+EOmPEYKnxclX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks2hTQWJo884k/X0FKNM7bkIvnRWIttinCLbvOfjNME=;
 b=SnIgCMQeH/WLHMTfM4TSub4wfOOSoKCVR6N6iJwX3EKs5Oqyo9IrDNaS+qwqrt9ztFt2mqgGCnBCA6uF6eoRA8hxAyAetKs7MufKCZEW2GhxV3Y85Kfboi5tp0sPDruIQ77Ra/wqLbQCbeAaFsPoI0W/82zPhIRdNowITXYup9nSF8UO1jXp5w0hemrnzD8bDe/0ZQWW0oqUO0rSBWuSbS7MdjxvruwsrpPoGr+82QZs2djoAa3uUZjoyKAi7HOovaPEoRqOmMTMNHi68xPvu8K7SwXE40JHjQbhudsox1qibsM2wq12D3PH1azIW3jGIBXRtuzl74toBhH/2/nykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks2hTQWJo884k/X0FKNM7bkIvnRWIttinCLbvOfjNME=;
 b=BHFf7+N18PQ1i17WVIyIRpIVLLjgOPwWtRboXmh8P1UdEXdImZ7B1AMgbYi53dUhONT98IYcFQVjEPQwNO3ebwsuVRhoAUM45oGcyuh84KeKTdKL0+h3RGEpTwUTsKTF1t+4df7s8l2J6ebnSnewJ5SRw3Kd+95TqEq4Xki1J0k=
Received: from BN0PR02CA0058.namprd02.prod.outlook.com (2603:10b6:408:e5::33)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24; Fri, 28 Apr
 2023 14:01:19 +0000
Received: from BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::29) by BN0PR02CA0058.outlook.office365.com
 (2603:10b6:408:e5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 14:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT096.mail.protection.outlook.com (10.13.177.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.25 via Frontend Transport; Fri, 28 Apr 2023 14:01:19 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 09:01:17 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 0/2] Handle PM events for pci resume
Date:   Fri, 28 Apr 2023 19:30:54 +0530
Message-ID: <20230428140056.1318981-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT096:EE_|MN2PR12MB4549:EE_
X-MS-Office365-Filtering-Correlation-Id: 4abda3c8-e6e2-40c7-a624-08db47f10ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tIm7VcovjlNx7lIl6fljbUw+fZMVbZUnTteGnccLKyJat4Ndv2l2gvFIPzVt0zKP484SH2I4TY89go9feTwqQblrnxqXFzsjur3q9O5zdZf/KZlbC++GDqs/zNJ5tLEXB3pH28hilSmWnbGLFupnUs+VUi1y1Q43w9voMwhkRqBtOwzX3CDnHZzgw4zESw7c5Bypo1K+UyDVTNdLfxOJN+ltLtyxSKsf6XdD2iSSMu+K7j05uz/dV2Y/Kd0C6eeFOw5XyzCswOen56XBCIifICYdwLgkfCUHzGouclTFh4qK56tGIUxNUQ2AQaR1KboSGp8VknjsjNFyRoaex11ZAydudzveZle7bqFCZn8aQwseDTDJd8sIecGS1jvmxQaknTmPZTe6AFuXmUg4OP23pnzXCErb+bxpy3FPFBkLyoN2CurOiDMcDHUGAcyH6VluPcfAfBFNtDaq4zGdoXDdH/LZMBNpDVg/e4FCich4cLaLmsR5km456VeTEX5TqPE+UBgiJ8KtD7GOtUnvZ/pWqeTWCKZZ7g745hnTDzwiRjuc+ZYBXdRoHCJqgxm8oOsRPc87igtuUFIzuuFHhOpIi73jCj5O4IDa1+/SpLueyZw05pVyVJ3fmQnYt/n5bSY9D+Mx0QPkHda4L6CZKdOb5+uYlYZ7YTMEGX/9RDFpAhqHpzSSphZgxT+1chfibnjIhjo3dRmiFRMN/CGsg7iCUKMX9Tjs0FV2l2suwu0ivFk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(478600001)(86362001)(82310400005)(7696005)(36756003)(6666004)(966005)(8936002)(8676002)(5660300002)(356005)(81166007)(316002)(82740400003)(41300700001)(110136005)(70586007)(70206006)(2906002)(4326008)(186003)(16526019)(1076003)(26005)(426003)(336012)(36860700001)(47076005)(2616005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 14:01:19.7642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4abda3c8-e6e2-40c7-a624-08db47f10ade
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
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

This series includes enhancements to the PCI resume function that allow it
to handle PM events in order to improve the XHCI system resume time.

v4:	
	- update PMSG_AUTO_RESUME or PMSG_RESUME in all other resume cases
	  accordingly.

v3:
        - Fix for parameter of incompatible type reported by
          kernel test robot <lkp@intel.com>
          Link: https://lore.kernel.org/oe-kbuild-all/202304272147.qSiPDNIh-lkp@intel.com/

v2:
        - use the same indentation style.
        - keep same function name.
        - avoid wrapper for uhci_resume.
        - use pm_message_t type for PM events.
        - reword commit title and commit message accordingly.
 
Basavaraj Natikar (2):
  USB: Extend pci resume function to handle PM events
  xhci: Improve the XHCI system resume time

 drivers/usb/core/hcd-pci.c    | 24 +++++++++++++-----------
 drivers/usb/host/ehci-pci.c   |  3 ++-
 drivers/usb/host/ohci-pci.c   |  8 +++++++-
 drivers/usb/host/uhci-pci.c   |  7 ++++---
 drivers/usb/host/xhci-histb.c |  2 +-
 drivers/usb/host/xhci-pci.c   |  4 ++--
 drivers/usb/host/xhci-plat.c  |  4 ++--
 drivers/usb/host/xhci-tegra.c |  2 +-
 drivers/usb/host/xhci.c       |  5 +++--
 drivers/usb/host/xhci.h       |  2 +-
 include/linux/usb/hcd.h       |  2 +-
 11 files changed, 37 insertions(+), 26 deletions(-)

-- 
2.25.1

