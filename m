Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6D46F0B34
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 19:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244423AbjD0Rnh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 13:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244545AbjD0RnQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 13:43:16 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8291A5253
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 10:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvZQrr/btZMk0Jj8TjTeSg9QJhnxFOLHYufQi9sEikSn/ayWA/LcHNWdqibVBPopCerh+UiOYD4+lntAZq2Oy8Da0+RmKDO6SUxp64wi28D1j5XYX+9w+Qa5K/WoPLHg5+VPPu6HX24VdALjlnynHvUK/GBCbDbJS+x1eWBCktzSMSNTCkP3btpM+kzhkRhZBDWdCAgEd71xYrHlv7YdI9GxESPW/SokB8MdHak6igwhospq0jTIZLUPkPgHlXkd4+egAZKaqgLJbGLL9ClJXo+vMKy4E1t48P4ZGi1ijuacOvdZ7GPq6FoIoImsvTl5oXOnVnXKWxkP5+GRbGlwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRQMV2zEN3Yo3l6KxjI1fhNCBrXfLWEMWjLYOx9awsE=;
 b=e/q+GlPz0YZt4uZ/E+dnwz7r66R1cnSPZNoJWvVCSjfqN8zY2zwpil0Z18E6d+4Dnu8mn7WPwsX7AHAmKtfnOwTKDpfU5zKZH6J6OLwRkJ5dtVrr6tPz+vA1O7NX/g270i9fJXmRFlEQzYS/4MK+kEkc4AtQ2KORRziJ1n8hpyY6FHQetaAcpmziAV6tUmbXJOGJevAewxIgu/WfZUq/MATV6CJCFwh/fjKFgU1YQRWp5d+fWAcfX4qBfaLTc2OB05KQc3Fmt41zaKiDA/FISSg7mGpGTm8fgHQrtXUkG+PgFE6NUnvyesvgvMxfj6zyrKA4t2iFrRmas9FLw7KGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRQMV2zEN3Yo3l6KxjI1fhNCBrXfLWEMWjLYOx9awsE=;
 b=2zT/0yyJAHojF2MAWGDd6EVOu+5GxM8bCAl8RW6Xfs6S4z1GJg6NlcGhHpkz/xutsMfDjCrJnAvFGCSzOSpA9anb1AtexBinvIdC20BFdOckaHa+wa7Tkur0BtCoZjW2+5eKtmDBEueSM395iw7vlSLon8+M1dQtUhV6ToaOFsI=
Received: from MW4PR04CA0076.namprd04.prod.outlook.com (2603:10b6:303:6b::21)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Thu, 27 Apr
 2023 17:42:44 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::3) by MW4PR04CA0076.outlook.office365.com
 (2603:10b6:303:6b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22 via Frontend
 Transport; Thu, 27 Apr 2023 17:42:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.22 via Frontend Transport; Thu, 27 Apr 2023 17:42:43 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 12:42:40 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 0/2] Handle PM events for pci resume 
Date:   Thu, 27 Apr 2023 23:12:18 +0530
Message-ID: <20230427174220.3953123-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT010:EE_|MN2PR12MB4342:EE_
X-MS-Office365-Filtering-Correlation-Id: 70914e97-1e51-4609-9424-08db4746ce34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PnW85AyZm8F/9xShb8CF/P+TgNcL2DK7hGqB2B0O1aoBi2/zK3bwwnoGkSOBnVsnnEw2Mwom6W/jqHbyPLXDpu0eHp0S31/VKiM23j3KenybvsQzvXmkS20sv0aU9j3iyX4tTHxYBE9YaHSOcTPvms5LEVz4bmqFlMvwfAANgLEEmLv1JEN+E7mRBYCsS4V9B//n8jzeBG61mocn5SC/L1g6F8Hazc/9k4aPs+WjwNkARjkNg6/vsGs2Sv4ZE84bUkY4lb5SpdAJX2HvTCOreKXA2AWlmnRdhb5uqyLkltiAm87/NxJXXYTa6UwebdQaWv+tdvk7SMbj6WFBmuUwwHAoBQh0JPGvmg/BvjE0RsvJkSe3N0weU57kUmTLGZFupq/3awWWJ0lSUdUsyVvtoltCuGtImgxwj0heCJNPTfnX+xk8CODMGJ+UZL8jqYm+bQFQ4Pfit7Y7/vDzk8EYlQtLuj4unFWP45xudtAlN4/UuP8MWZ9NuceuMXVcEGky/cVC4jMA9968k9q7aZqiIHDWSm7oLem88Wbo3xbCrbchbWcid7/jtD64J/VRMmf24x5Uprz/l2S9tJxDiOda46eBBcROD9yJTdi7uxGrrrEjUa1fH+VfQgLcaqresC4Kx0v01bSFUscKtolSC4zMCxCPdt/o+wBaMbFmqH3BBwxBBg3ohDNPg3QfQTCYJUzFIn0sHnT58jR2Zs1DabpLlqAeYZ4sCzQ7ilqm2fq8IIg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199021)(46966006)(40470700004)(36840700001)(426003)(336012)(186003)(4743002)(966005)(356005)(41300700001)(81166007)(7696005)(47076005)(6666004)(83380400001)(2616005)(1076003)(16526019)(26005)(36860700001)(478600001)(110136005)(40460700003)(82310400005)(40480700001)(70206006)(4326008)(316002)(82740400003)(5660300002)(8936002)(8676002)(86362001)(2906002)(36756003)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 17:42:43.4329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70914e97-1e51-4609-9424-08db4746ce34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series includes enhancements to the PCI resume function that allow it
to handle PM events in order to improve the XHCI system resume time.

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

