Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B55C3E2EB3
	for <lists+linux-usb@lfdr.de>; Fri,  6 Aug 2021 19:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239854AbhHFRA0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Aug 2021 13:00:26 -0400
Received: from mail-bn8nam11on2050.outbound.protection.outlook.com ([40.107.236.50]:28065
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235659AbhHFRAZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Aug 2021 13:00:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyN1hWWkuWazyALVr80zNLaorJal1u+Vdw4Zz/iGzJ6i+1tzK2fGrWXbw7CF25S7yNwk/YhAC2sNyTDyUwzYe8tTBL2aZvNLpnHYTIwP7bOCyejonTAdKMgefV2S7sf+ZSCohj6bATK30lmTGiQ2vQXWSpvaw8oLkE+yX2hG5K/pVIP4IfMzQNNIo02YYZ/ms4elBX4YOzW+EjY9Hs9Lwa7YOGaEolpunxuxFur14vj3d34BUMh5k+GOpG0NzqFk0AyNyL3MyvoRfXgNK5N51AJ07NePTtdpiZ8wkq/DNOovWE8Egrc4YKea4H3zV2igttZu7b/F1arF9iooUZRCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1L1W6TCMokPUbDJUnTvvuIoMRdInposBqPxBlFjzkuA=;
 b=d2sg0iN5Y4SphBx6guDuDiYmoK41U2BA7nMDl1lcu62h/sMYeKpfmjtR+ehK/PMCT88NdKtn6A2563t40dVmDpxEB5fPLW2JYjrlgwNZ3K7+BU0cAQ8DSEpdq7ESlCI5IWGbj6j8bnacdlivrYyfeNfEEVFcy10SBmBdhj+GOX/ncSDxAdqsoye0UxaxQPjekuBHOKAidlLeASIxBHvE1vvLOATLgLvDmauw7Ld50WVdWyjle3sRopacJ8M1O2bQWla6wweBYwQpKxMfKR8BiKFu5qQqeZZexGejX0dFo07EP7qduvZFdhIMYxxEIq6+PHSzBRDVwp0+hIh4DvaPDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1L1W6TCMokPUbDJUnTvvuIoMRdInposBqPxBlFjzkuA=;
 b=nPygz3YDGiXx//OJ6VTAjeSIX4UeOWnbYjb9ZoICUaI3hsngmYYvzFgdhvyUp4hdqKtvIDC3d9QNOECmuH4WjFjhExV9zjdXw6WG9Xl7TvZUV/qyB93kxYGUI9aaDMP8BjxTAEZF/XxxmPYwr4RC+KDHMRLdso3aAEpJD4OPxHY=
Received: from BN0PR03CA0033.namprd03.prod.outlook.com (2603:10b6:408:e7::8)
 by BN6PR12MB1602.namprd12.prod.outlook.com (2603:10b6:405:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 17:00:06 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::ae) by BN0PR03CA0033.outlook.office365.com
 (2603:10b6:408:e7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 17:00:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 17:00:06 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 6 Aug
 2021 12:00:03 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v3 4/4] thunderbolt: Fix port linking by checking all adapters
Date:   Fri, 6 Aug 2021 11:59:08 -0500
Message-ID: <1628269148-51355-5-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628269148-51355-1-git-send-email-Sanju.Mehta@amd.com>
References: <1628269148-51355-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed3bbda6-13c6-4ec0-ec80-08d958fba46d
X-MS-TrafficTypeDiagnostic: BN6PR12MB1602:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1602A42D5AEC1CC904361FAAE5F39@BN6PR12MB1602.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYQUlR0nGjAuKcrXNFzsd9iTr8VD1h7rtn5gPo0V7QBpQQe14HRgN0wXZZwAlWbqeDysTVzX/239Z6xByZxpeKyPHNvIjW7izomLOXBAxTLjatRut79XStttn/b1yEakJThvxDuATH7/rECPc0NdLpzCTKGXC5fDeIa97225+5W56eUKUT+7PN9nNw/fL5dBMsZPvfI2L9+Gc+/hs7O1mNICNgtjYl2UOSMtLSLSNadgZkaVcdpEbWwnB8qv/HjXHS3pK8fiTJyTN7YlInR5OWZtluji1nIMcjDV2D/XH/BYaQHQvAMrejd/KpyscHep/SJKXK0mZJ1Z5nyfglAOBI2oztcTOO/rHamSVZSrhf3nLlqGcK9WkIfmE9ZKO4b6+D4Pnb178DMb5uG5oaqK3RWhiiROk0ThDwx0BSd0cFigsoHbXUPy/WCIkyveqXxCk8n4CtesvVQ5Nk+t04rqEBxKbLQq/pPf3P9Yb1+jD8UUMNeDzUqfZ2dzRL1iWlf22EA8TWDRo726MBSufphVnZ/ahi532U0OPwVsGKluEFDjPOCXgDia42nly3VQOwJUM4vtfCWVF9urkAr40W07PLrKVihDTOE8354rbxGXpy3kADBOV7Ox9jlJQAmSMXSYb6VUyj2hMrwIoIJ9c3diJROLnzn9ZRND/81uWaaLE8ppFKPQ+tz0webNC37vLrtYESFZOkxEdp639GF1LiGeKO7mQmtEMDr/KivNgQ049/E=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(54906003)(26005)(70586007)(70206006)(8936002)(2906002)(356005)(4326008)(2616005)(8676002)(83380400001)(426003)(81166007)(82740400003)(5660300002)(86362001)(66574015)(186003)(16526019)(82310400003)(36860700001)(110136005)(36756003)(47076005)(7696005)(316002)(336012)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 17:00:06.7919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3bbda6-13c6-4ec0-ec80-08d958fba46d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1602
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

