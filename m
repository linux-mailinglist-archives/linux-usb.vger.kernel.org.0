Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 949336F0478
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 12:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243598AbjD0Ks4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 06:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233094AbjD0Ksv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 06:48:51 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A8D2D76
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 03:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8h8jc5plEFp34nctIsN5AdH+uQ/Xfat8TmWYLy5gwdYH1ZEQkFfomOOd04NrWxh6cyisEENUzM/8/u1re89+ZzTM84pHEKNTJbLcVWa3WwQR2ChQ/e1zSAJzHGtv/2a4hdibHOfBOfoP+gFI9XnXV4GRoeLzJG6GiCdfsX5l4i+fjwtZzSV4uw/mQJPKgTTcIgQcwqBHzNQ2ElMUt4M44GrhAAUBfrxNDBeYjXN3raUBSHMRTYS+jOtxeFaEoODaMobFOVV0pYHY8lh3yFMKiZL/CSTf78uO/4aoui+h5HX17kDgflHQeZz6MAtA+Mm16U0Hn72vl+3jtcry7Xg8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=082zrOSRAfZ80Z9dAuqwcQFcK9V6HnUiuvi5s7jHFbQ=;
 b=jAcOsdLyUDLvpXe6Zz9EqjDhBciRJgKHENySfd5SPZuGwY/PxRLNoocU9dbwlR+x0eKGxnKMZyvXs3nwsP1jHkIVsbmWDjYqITx4anqNICezmznNF9B7ZjulLqz/xHB/BNlUMLeR6mHNchB8HJvX0WBmVPD21g3LdJmd/TqJBT+aQpmdARumelbVxeZzG7rqA1cZl9hm6mJ7QbOxxdSP6EliTAJjWDh/1Zemuuu6ON+bKbtLnSblLjHEGKN4+rMLoXhCR1qsVDXhfD8T/8JwMJO7Cf3EKVEtyJhrnJL6g4zuUeQi1BAo3TEl1sYmbnCoy2t3VwdZHu/oOiIUCOFV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=082zrOSRAfZ80Z9dAuqwcQFcK9V6HnUiuvi5s7jHFbQ=;
 b=NOZLDeXwJG4otdSMH1nHuF9EQws4TPot73dqk8W9Dxj0Pacc0A2hIHHdKe6T6Sxo3QCBmwnUWdmyw64d4lh/Qdaqs1bJNTP6u94+HlT8wZqfJKLtJ3dO5LlIL+m6I1msKnuLa26121xZs0lLXKLhNOr9hXXWoy0/UYNggb5j4qM=
Received: from BN9PR03CA0294.namprd03.prod.outlook.com (2603:10b6:408:f5::29)
 by SJ0PR12MB8140.namprd12.prod.outlook.com (2603:10b6:a03:4e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Thu, 27 Apr
 2023 10:48:45 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::f7) by BN9PR03CA0294.outlook.office365.com
 (2603:10b6:408:f5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21 via Frontend
 Transport; Thu, 27 Apr 2023 10:48:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.22 via Frontend Transport; Thu, 27 Apr 2023 10:48:44 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 05:48:42 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 0/2] Handle PM events for pci resume 
Date:   Thu, 27 Apr 2023 16:18:03 +0530
Message-ID: <20230427104805.3560591-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|SJ0PR12MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a76efe4-81a2-47c4-c858-08db470cf8e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1QP4H6rwrXBirErePMmmLstMnEDxszidyp+shK2bBy7xCg8W09Z8SFeI7umjXFEO803wkwGRlb/U5P/tTtGdP7CzmHWugKGBf+7uaOWDQX60lzVDLX+YphHD7NyWl8q29dRUpFTFe+xKv3QN0MlNikfl8nHDIKuKduPQM5eIlW91HF9Dbe8XDvhrM6MGka5R/LgFBy7dJjF9SuMqpjepBEiHvrR4Ad1kI1PycbIaws5Aw/0DedqPz218l98Nr/mTAyuj6UyN4VhRyl0gOycxA1kJQP0LULDAUeaQ8y5GYXJ8X+TKKWo8S/k+RYzeWdB83TBAfeIdZN0uVdcGXY6HvCPFqyYPzlgAaSLoz4J9gl2T7F9meN89rVKPXzl/GNpWkKu4iP/wk+jU6p52o2RNiohDXp94BfRD9KR6NuZw3G7syl9+UvWU7CPlTtdqES2vrxu51K5/TqXTdamMkuCAJF9ChcL30tyH6fDJrAJQgDpXe6qdTHwwgcQMye+ltriFExjTzAkr/xZ8pDX+75+ECVDKOp045fHe+bcfG2gX7S8Z/lJm/IfrmtVfmq8R5Rd/7wxKI0QzCjJQQ3egNklpF6sImItYI95vRQasOJbe0C85Tv/HEue6l8Th7PKZFvVaEZ6wikTOo+cYtW4a3Lr3pnXoYP3tZCQcpgCG1jatRGKMCPBmeOBCW0bRURcKxGqlKvSA7X84ua0Mlb/YiV7pkk+UULXRO2y4fe5lCuy3atA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(83380400001)(5660300002)(82740400003)(316002)(47076005)(8676002)(41300700001)(81166007)(70586007)(2906002)(2616005)(356005)(70206006)(4744005)(4326008)(6666004)(8936002)(478600001)(336012)(86362001)(426003)(36756003)(82310400005)(7696005)(36860700001)(110136005)(186003)(4743002)(1076003)(26005)(40480700001)(16526019)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 10:48:44.3839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a76efe4-81a2-47c4-c858-08db470cf8e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8140
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

v2:
	- use the same indentation style.
	- keep same function name.
	- avoid wrapper for uhci_resume.
	- use pm_message_t type for PM events.
	- reword commit title and commit message accordingly.

Basavaraj Natikar (2):
  USB: Extend pci resume function to handle PM events
  xhci: Improve the XHCI system resume time

 drivers/usb/core/hcd-pci.c   | 24 +++++++++++++-----------
 drivers/usb/host/ehci-pci.c  |  3 ++-
 drivers/usb/host/ohci-pci.c  |  8 +++++++-
 drivers/usb/host/uhci-pci.c  |  7 ++++---
 drivers/usb/host/xhci-pci.c  |  4 ++--
 drivers/usb/host/xhci-plat.c |  4 ++--
 drivers/usb/host/xhci.c      |  5 +++--
 drivers/usb/host/xhci.h      |  2 +-
 include/linux/usb/hcd.h      |  2 +-
 9 files changed, 35 insertions(+), 24 deletions(-)

-- 
2.25.1

