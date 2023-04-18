Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3188C6E66B5
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 16:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbjDROJ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 10:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjDROJZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 10:09:25 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9351146DF
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 07:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfnSvWLkkaGeuTG6rtwFLW2VEtOweIf7YV8bgMtftRCEJTSLHjGDdCO4BIizwz0VkPPLlUGEbMdf7haH7Hc5YhA+/yEfq8DjtW7ibnRwut/NRU4Ag78in9HKPLu0iICVHBjcxXRdHrTi1csmTdAmN7HNh5Qhm7FVMoxONY7nkC/Yn3G4wqsbXJ+oT0MciD/em9WPrATVW+iRJEQVpNoAPgE0lIuQ01V4bSSqNKxMcubWAAkh1VRV6HCgRxYRSeLDNhiT6mEestWJxhBFChv4MtOA9c2svrrsFQKI7v8/JwWk4AzzmMgrmfahpz7edJ5Khf/mbmnVsscFt+gFo7f4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qz/i8eyQzsaEwM9hXfg6UtcvdqniQCwbo6VXJnhN76w=;
 b=kHZN9AsFp9EU+wgipCQvMUsAUdk0AcQx+JzD6zdK0B+E6txNI99AV47E6QqGJSZFjrN0k9YAxrX5uGo4EGlM7jXB55huP6Y3awK/AAyW3m2dDSmYm4/mkvJfZZLn/qvvS0aP6fuFWesi7DwaNGjRCYa/cArGeIenLuWsIa9ZRGm60Jwr30gFvZqmS9YP4kc2klNvuVZWG9yvF44AJREXoBhDXUzN44nrgLxEW+IOqRWDmZu8cAZgZ5uifM6GeDlTtRFyoxRTOfrsdo4ofJVwq+ZaF0WfE+h3T5TucLbLSdnIUehvQnY+xUqkvUBq8na9QPqF48WOfS8JVfeQf6p+zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz/i8eyQzsaEwM9hXfg6UtcvdqniQCwbo6VXJnhN76w=;
 b=IQnZXRx5LwcH6JqVcZ0kHi/bbYVdh4eLjoAgelpTHiLZuS/yb5GlGPzfwzjFQLAUSn1I5j5Aa1xixuM44SDeuERkrJfrflMUSwch1POs2EnPXhjqQ1d2i5tc8S/68EphINkUtpXiDjVNhZdS1KeYB4FSqvQy/XVG/jgBQMRu/8s=
Received: from DM6PR05CA0048.namprd05.prod.outlook.com (2603:10b6:5:335::17)
 by DM4PR12MB5279.namprd12.prod.outlook.com (2603:10b6:5:39f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 14:08:59 +0000
Received: from DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::9) by DM6PR05CA0048.outlook.office365.com
 (2603:10b6:5:335::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20 via Frontend
 Transport; Tue, 18 Apr 2023 14:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT105.mail.protection.outlook.com (10.13.173.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 14:08:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 18 Apr
 2023 09:08:57 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/2] Handle PM events for pci resume 
Date:   Tue, 18 Apr 2023 19:38:15 +0530
Message-ID: <20230418140817.3651909-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT105:EE_|DM4PR12MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: a789e263-6050-48f6-83ce-08db401674a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7urbjpXNND1/+PtNx7IOgnQMhSXqSXivVMXW7H8juBbN7pYzykeddGQKwQpSRZpcJumrPP4ie8e7f/jj5Nxgt5RuHyZBm/K8S6aRQGwBqaa+QH0pGJrmMBdVLe3vfb20SnalH9qaLL+lR/Bj9wL26titeen53eOurTwMHiaz2RZEmey9ZXTXbgWXqFb2RSmHglF8z1ONg5dXpGZJPk7mdXVaAhlH2rQ9H95VnwidfQmcieWvQj2RASXtIdHWkautRDZhX8KmDIC9LbzP6QlWp+7R4VNDGfl3ptlZz3UfxWVq+3WFgf61nB2e7a+Z1UkWuT3xjKg4fAr0NSC6fmcGhXyfquBLA3fMMttYP2y/SomuB1ufAAK+SS1olO9a9Is78XDnfIaNpOMVDygnpmUv2VmdUFxiYetv5O7aQdPa5O1mGpSI5SSzo5ayJSt4sz/1HHIZLLpbT6RRtygjV+QmxAJjLhge6hShzYntHJZsFrtqL8Tgzrjodtd9Bp7q1JSxwJcqQN3urfdFTIJO3yIKJj2gs9aHFZk1ORcSdPON1LCL2slXZka/oBduLCECVe7x4kNFGJxTzGRsBE0Ed9yqSLmVWwKYJc83A1goU1i4QG6wdQ5OMcQ73tLF9JW2EF+yCpNpDjpqcFTygblL7WWrCBFBqoWrYJ7LP2z/YsUAmuHrFwOXIsf7ywZiWkfedP6Ek5KtXH9X+DTGYdbbCgcLhyy7bJT5irydX618WmThMDI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199021)(46966006)(40470700004)(36840700001)(36756003)(40460700003)(82310400005)(2906002)(4744005)(5660300002)(8936002)(8676002)(41300700001)(356005)(81166007)(40480700001)(86362001)(478600001)(110136005)(2616005)(36860700001)(26005)(1076003)(186003)(6666004)(16526019)(4743002)(7696005)(336012)(4326008)(426003)(70206006)(70586007)(82740400003)(83380400001)(47076005)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 14:08:59.2803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a789e263-6050-48f6-83ce-08db401674a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5279
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
to handle PM events in order to improve the XHCI resume time.

Basavaraj Natikar (2):
  USB: Extend pci resume function to handle PM events
  xhci: Improve the XHCI resume time

 drivers/usb/core/hcd-pci.c  | 14 ++++++++------
 drivers/usb/host/ehci-pci.c |  3 ++-
 drivers/usb/host/ohci-pci.c |  8 +++++++-
 drivers/usb/host/uhci-pci.c | 10 +++++++---
 drivers/usb/host/xhci-pci.c |  4 ++--
 drivers/usb/host/xhci.c     |  5 +++--
 drivers/usb/host/xhci.h     |  2 +-
 include/linux/usb/hcd.h     |  2 +-
 8 files changed, 31 insertions(+), 17 deletions(-)

-- 
2.25.1

