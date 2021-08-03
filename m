Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3B43DEDEE
	for <lists+linux-usb@lfdr.de>; Tue,  3 Aug 2021 14:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235975AbhHCMfl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Aug 2021 08:35:41 -0400
Received: from mail-bn8nam11on2088.outbound.protection.outlook.com ([40.107.236.88]:46561
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235945AbhHCMfk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Aug 2021 08:35:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaypE3LKpDqN6tEXt6CYY2QXsZne4/Ly79A98YW6JvT10bxE0hhzx0flObebxVlmnVeJlOTopWhj8yncLgtK0ijA/F5ubRxkPrf6WF2mTBw6JZ+MxHK6pl7C4zXzr1U4KYVVAJBmz+cVfOs0it6Q0BVJY/e8ICOitJta/qvJ2k9xPIgAJV0EuZJ7UF5L5yfYkdr81mYc3h8R11QAU5/2M/z2lCkded6Orqh+DwBLR3eGelQW0/h4saaJjfZUUyyrEtx1GA9s0LwWWLbbJKYAehnzLJm12dK/ExjgTmNvcRg2EQ9OnJOa7A1KjIaTymBpkREtmBszfVTV9zEo1Efniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1L1W6TCMokPUbDJUnTvvuIoMRdInposBqPxBlFjzkuA=;
 b=EhA3HO25bPtiT8hmacVDB8/ETxCLaM43HXgKr13ZZNMJTaspHtQANcu6H3a3zQdLFRglufLgVnanZiOxtrad47O3wA0Obck1KfpwHm/JMLvr2kjSsvfzjFGh2fUu3k1qFEhv+sykcgdYocpWChSNE4zWgDJ4gW8ibApzGmeDTL8GqepdnK4aPdheuZ7tivcTSTjZ6kSLl6tgSZErh0c/1sy4oZhUA+xLQ++mCsHzs6lYY0nlqs8dwxc4+hqE3mA9UzysDXKfeXD01+l7WZTyKNLZ4DZ4rw4rpN8NsuFFzsE2ZR3l4MTgd123ScnP051Y9WRzbDg/DDq6ifrlwnhILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1L1W6TCMokPUbDJUnTvvuIoMRdInposBqPxBlFjzkuA=;
 b=ZsRMNCvteAn1nWekBz2MyDgs9Tfu8RqwGXJjAYX+2KeJG3QC/3/Bi+ds03qZJ+gj1l1OktaeB8JwIk+yU3CnZ9q/Ck2ZCT/e3GHONrpxDP5E1d44iJnkZZGwUXGZbM1rQffq1vSfGHIB5v8Igk4JEHBhGwe4+3EeN+RnWpXspOM=
Received: from BN6PR22CA0051.namprd22.prod.outlook.com (2603:10b6:404:ca::13)
 by DM6PR12MB4545.namprd12.prod.outlook.com (2603:10b6:5:2a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Tue, 3 Aug
 2021 12:35:28 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::97) by BN6PR22CA0051.outlook.office365.com
 (2603:10b6:404:ca::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Tue, 3 Aug 2021 12:35:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 12:35:28 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 3 Aug
 2021 07:35:25 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v2 4/4] thunderbolt: Fix port linking by checking all adapters
Date:   Tue, 3 Aug 2021 07:34:56 -0500
Message-ID: <1627994096-99972-5-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627994096-99972-1-git-send-email-Sanju.Mehta@amd.com>
References: <1627994096-99972-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01131942-bd34-4d42-caef-08d9567b2cfc
X-MS-TrafficTypeDiagnostic: DM6PR12MB4545:
X-Microsoft-Antispam-PRVS: <DM6PR12MB45455969952EB6D47F2815E7E5F09@DM6PR12MB4545.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1zA2zQfs30dsLjrKfFD4AM2unC1NJTFXNiBzgv46H737Mu8nxMSvOes/tT1DCn80RUT8DvgDie7ZeyglHRmTz2fLt99Im1ZqeQFiweZhB42kSRtwiKssi8d4eT3xFGbKT997uq8frXlwlit7BqKravoofDEhik7xoL5D/aX3zF/LQsGaxj7rhytq1enFpedthuLFdjl/6CKiCYOub14vZsGiwVCN+y19DcONgAXgrXnZeGLaZmvRcSsrDMwXblM5rLMgaT17362RyKUM3/+RLQGLKDbbX3TbNBbSsIhArJA8r05UM/HDg/pYaUbIf6EIR6u2EycsEa5XDpj13uiogB5X1fgzMwLL3BDOCp8/3hIZ9it8Mhr+4Nezxzb/Sgoyz6Z8xKMB+bdaii5agm5s1Z7WrywncS+IlQb5XsM5sH2ut03RhufrLR8dvUisoyGkrUZ+TGT58H4SzvVjq5J1v1Hc1FCRKICZMtvT1fGdAvI888yOaVB1J9xUv40N7SG0HjvdzvQv6qlAa3pRMwf/RKiEzM9xTYR/ZHYDvoyFZEdjKacN5u+vkU09xwBTGGCQOqnIvxwkXBfNe1Trc/4KqWqn8haJ+B8JHoz8RuOcRlMQJSCT8HASzZbtPlBH+0uTz//X0dl+ae8s0+T9W8blltZtrgmeeALcsXCyc+UyZVP9OUfS9/cF6A9MMuKY/NrMaC5W0s0SOQJLr7Joz9iK7ZPTULilqvoQVrSLZbyoWBE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(426003)(47076005)(8676002)(316002)(6666004)(26005)(5660300002)(86362001)(508600001)(70586007)(2616005)(16526019)(36860700001)(186003)(70206006)(83380400001)(54906003)(66574015)(8936002)(2906002)(81166007)(356005)(36756003)(7696005)(82310400003)(4326008)(110136005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 12:35:28.4926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01131942-bd34-4d42-caef-08d9567b2cfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4545
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

In tb_switch_default_link_ports(), while linking of ports,
only odd-numbered ports (1,3,5..) are considered and even-numbered
ports are not considered.

AMD host router has lane adapters at 2 & 3 and link ports at
adapter-2 is not considered due to which lane bonding gets disabled.

Hence added a fix such that all ports are considered during
linking of ports.

Fixes: 0d46c08d1ed4 ("thunderbolt: Add default linking between lane adapters if not provided by DROM")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 6447876..5c3d4bd 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2456,7 +2456,7 @@ static void tb_switch_default_link_ports(struct tb_switch *sw)
 {
 	int i;
 
-	for (i = 1; i <= sw->config.max_port_number; i += 2) {
+	for (i = 1; i <= sw->config.max_port_number; i++) {
 		struct tb_port *port = &sw->ports[i];
 		struct tb_port *subordinate;
 
-- 
2.7.4

