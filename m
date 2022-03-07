Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375EB4CFF8D
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 14:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242744AbiCGNGt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 08:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233610AbiCGNGr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 08:06:47 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E808B6E0
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 05:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fdirs2plHeijLXMKxzoaGrqWo3KrtlEgbrpQgnC7UouXvzooQJj1jFMnyKy6OqkW46tGeQgT4S3mO+Uz7c90aOEqpaZPLmCksI9XqbbcJev5x+3bqiPmEB41oh7EPJaH3XCs0xV0na6EQPV/BlzQdCkH0hbIQbfheH0b4QvwUY+NVKR8qHKrH3eieqjfCcv0EZZ8VDAqnY1sUE8CyktAGNTHFCSmta4a0ZwVqTGH+rKudqjFhXDEDCnQQ3RP5qAKPuh9FqAkb5/8JQHmynGlMDb37W477HaCutGBJzEllqmceuvjhDrbPk+LAJaCQiHtdG3yMU8rCOqvKI62ncs7xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcUeoLRK1aQTCRf/j76Dub6Q4T5O6/21p2cXWqEGhco=;
 b=OTbO3aZJa78rC+AKbQoV5E0U5CkXajMBt5234TUDKAOdjhKvQq0e9nTVrEhwMR7T5iJpmQO/Ufz9Kuh9R6QW20mnimDddK1TOzxHQN8eRIn8jTOqdVriJS7CONW6NplDmnihrrAgSePeYD7IxlVJTvUVs5EN10uYnqa0Ou+ZPxgZOV48M9y3NJTySF/v4Mgo+Z7qk/D+e01dJYY3hLHP8QsIIPKJYmhps3dE7WJvdjpHDJTSScRttpe7uqSky8XxsxcJcDNMpFhLGqnr5Iw+JsL0/+ztmkT4ihYFpr9zyliQULPfA4kJHpJfrNAw/IRlysCKEi/9i9+92e/fB587+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcUeoLRK1aQTCRf/j76Dub6Q4T5O6/21p2cXWqEGhco=;
 b=gSFJo0CKdCWfsnyEuXf89ghVQKUcEKMsAPlZM+AwwFyRM5EYI3ZNbKYn3N9j6mvKimhj1Og9VqTJjDhT+tkWsq4E7IYC0vdRVpUpel0TryIftrzGf9NSDeVAd15Pi/oPrpCzQE4JmbLAIetIjY9EZsjFinL5HIgmvMKzJURzBGI=
Received: from BN1PR14CA0016.namprd14.prod.outlook.com (2603:10b6:408:e3::21)
 by DM6PR12MB5566.namprd12.prod.outlook.com (2603:10b6:5:20d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 13:05:51 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::de) by BN1PR14CA0016.outlook.office365.com
 (2603:10b6:408:e3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Mon, 7 Mar 2022 13:05:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Mon, 7 Mar 2022 13:05:50 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 7 Mar
 2022 07:05:46 -0600
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <mario.limonciello@amd.com>,
        <linux-usb@vger.kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH] thunderbolt: handle runtime pm for tunnelled pci root port
Date:   Mon, 7 Mar 2022 07:05:19 -0600
Message-ID: <1646658319-59532-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03d92f48-8667-4e59-63f9-08da003b342f
X-MS-TrafficTypeDiagnostic: DM6PR12MB5566:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB5566BD403D3C73FB9FA90A80E5089@DM6PR12MB5566.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gf6dGuj23zwisMJHAJ2U48dHuFmivHrFxiK64lCQ/nhL6HaP7K45temeIl6x1zOp4+TSn0KGs0BqY/iFTErMWHb8W0qWyEF5HNubcJPoFWOTb5IE7DMbr1OiaGoHy6I1NmUbTYG7GJy3tmmEVBQ2HG8nCpLobwlqmUYYeyZQmdsYH3RMZJP/1csBNI7W2l4TENXDj3W8Ot4iXKBEnrS17nklL7v3vKi9507LplN/O4VGHFhgr0vpI+2TdLZUTHvwcjH1BGTBhuOYg7ee7/F0TM9e0j3v1b44QvKF/kQ9xDy0rCZUX94oI7ry1tonpsO1CwZdWwzxN5RNadoIQcgZfUJcbykivYnsTNyR9OhvrFE7dELjQz6Fxe+e4lBUN/lSA1+MIXNb+GUNf6IYJZJpjTf8g06gsnXuazxyfpHDWiG1JhhSuwqGZWY6JB2Q2hF1h3f9IIGNTFn/wFivwF+QcjEumwzJ3cu27LIw6ghpWT1QNgkzYMs/Rget4GDLGfZboeaI498vPrgLWj9Lu++5m1qwwteMGBkCIXj2jfEyICedzLcogPIeyomNenrfvYGI4V1ZDXvkt9PITd0BbfZMU9mltktKQb875nsyuJ6Phqx7rrBudUXwtV2w0BV+pdK5bMuZ50kKny6P/noN3SuUXY6yo1SnVMxD55NF+ZpKKk2D+q6GUo0PemRC4Z737kRo4w3DVcAm2mwOJuKhPvS9pw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(7696005)(6666004)(70586007)(336012)(426003)(16526019)(508600001)(186003)(26005)(47076005)(36756003)(36860700001)(83380400001)(110136005)(82310400004)(54906003)(40460700003)(8676002)(4326008)(70206006)(316002)(356005)(81166007)(8936002)(2616005)(2906002)(5660300002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:05:50.3844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d92f48-8667-4e59-63f9-08da003b342f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5566
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

Carry out runtime-resume of PCI tunnelled root port to handle
hotplug interrupts synchronously.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
---
 drivers/thunderbolt/acpi.c |  3 +++
 drivers/thunderbolt/tb.c   | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/thunderbolt/acpi.c b/drivers/thunderbolt/acpi.c
index 79b5abf..10dd61b 100644
--- a/drivers/thunderbolt/acpi.c
+++ b/drivers/thunderbolt/acpi.c
@@ -96,6 +96,9 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
 				 dev_name(&pdev->dev));
 		}
 
+		pm_runtime_set_autosuspend_delay(&pdev->dev, TB_AUTOSUSPEND_DELAY);
+		pm_runtime_use_autosuspend(&pdev->dev);
+		pm_runtime_mark_last_busy(&pdev->dev);
 		pm_runtime_put(&pdev->dev);
 	}
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index cbd0ad8..2a53fa6 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1066,6 +1066,7 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_switch *parent_sw;
 	struct tb_tunnel *tunnel;
+	struct device_link *link;
 
 	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
 	if (!up)
@@ -1099,6 +1100,16 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 	if (tb_switch_pcie_l1_enable(sw))
 		tb_sw_warn(sw, "failed to enable PCIe L1 for Titan Ridge\n");
 
+	list_for_each_entry(link, &tb->nhi->pdev->dev.links.consumers, s_node) {
+		if (pci_pcie_type(to_pci_dev(link->consumer)) == PCI_EXP_TYPE_ROOT_PORT) {
+			if (pm_runtime_status_suspended(link->consumer)) {
+				pm_runtime_get_sync(link->consumer);
+				pm_runtime_mark_last_busy(link->consumer);
+				pm_runtime_put_sync_autosuspend(link->consumer);
+			}
+		}
+	}
+
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
 	return 0;
 }
-- 
2.7.4

