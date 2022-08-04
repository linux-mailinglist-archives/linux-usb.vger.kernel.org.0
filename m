Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3CC589714
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 06:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232713AbiHDEas (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 00:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238461AbiHDEaq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 00:30:46 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39024220CC
        for <linux-usb@vger.kernel.org>; Wed,  3 Aug 2022 21:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoPaUY7/Kpy4veFhVcvNSHDtTyj2lj1JejbCo8vBAFypP3/VPTqhawsbvWq5ykv2U95EMeEEdhZTOdIq92VAnmWFcLQMZTMRmAmejFJ+SDLjlHix8BFj9NZwIi2rGNvxMYypSK07MU6LgRa1xMVqV3KFva2cDFME5GPCk0aWZ8urAQ2Jy4tAHaRh6rAdgao5vKTfRBu+d0691HO9ogQesXuVwJOy/0qypDBrcDt0C8ycxbInbdnDeERz1KKdYsp0jOT+U8yCdbNi6WQCf1kx6PdQ9xQDG74RnyOsSm0wv1QSquHbPZipgWxCzDkn3g+LnKYN48+7IJKF5GZymWfk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iSNfz7QYDk6f7OIExaWbyEaZ3DyaIcaYDG4QyzubNI=;
 b=HlrbBGz8fAC1LnnxegM3DKZYJgMPe0RgqOJilNlCV2PsMPusBQueXCrkl8rgG5V6Rhrvulv3iNFBOSMtWJua+M/3Dk7qC9E7w/oXl1qFaPZoWOj2tEHRMTtKp5nMsiNQjElEeh0TYH4x5mqi5JUweJxmo15/Qqa9yrf1Y5lXxSkxLHSP4yS6eqbT3T8pYTNQhvHFu1iGyiZc6Ags2KMXhAM/XpGJRqMnwyBlYCKpCacUxUsi6BwUMBk+iaUmZT/Uoke/IIU9lruqAgd9udQ+2Y2uwiMOPMmji7+Ft9M+bVqUpQNDuMJ5id+MJl2Fe7wKd7Ii/B+TioKHH3uxrP0z8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iSNfz7QYDk6f7OIExaWbyEaZ3DyaIcaYDG4QyzubNI=;
 b=sUWQTIPWN5CgtxmB7C+zosecPDVdBjnYu9Ck59RrhvSFoz0ZlLuGfr7L/raGM9Jv+sQ6SxILi2MABiWyTlKI0A6NP0H0obxSqCS+znHT3kFPGHM8LTHOrCMvy4PLsuod0hLh/ng/mxLuYCh//UT5i3Vc0cQHtlsxoZ/zJ41dP6w=
Received: from BN8PR04CA0064.namprd04.prod.outlook.com (2603:10b6:408:d4::38)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 04:30:43 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::e0) by BN8PR04CA0064.outlook.office365.com
 (2603:10b6:408:d4::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12 via Frontend
 Transport; Thu, 4 Aug 2022 04:30:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Thu, 4 Aug 2022 04:30:42 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 3 Aug
 2022 23:30:37 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <mario.limonciello@amd.com>,
        <linux-usb@vger.kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v3] thunderbolt: Add DP out resource when DP tunnel is discovered.
Date:   Wed, 3 Aug 2022 23:29:54 -0500
Message-ID: <1659587394-115256-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41acd6a7-c05f-4e75-11ac-08da75d217b7
X-MS-TrafficTypeDiagnostic: BL1PR12MB5730:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7A6yjtIPOOrCSIDGDkxWLF/35Rs58/v9D+XdMEwSLcB0YQCzFwFklsISpFT295AAsQoQeK1tbDe/k4T/xkNqd0i4Ifmt84J8knHfVdW+in7ACZOwnTxNF992omI2l5sYM63bd38pV9nUamof+TGWnNGCDgXX076IR+5G9q3tGGeerTtl62/18QxUCHF6ohHHISvFRLesIU8rp01RAc2aRytRC4bPdq+aHotwcrY2rS94NcQdlhDa0UeMSyZzyfZpC4GVfHDWwqoe9Xo3J8RFhVIGh3l1R+pN3zzxFJt9nXr02++vqjipkqEKpyLpkp6kVapDjxlQvzTfP1HbR5fIUgZ3X/iuIUGZkr+9SSn1fupOF191WWnHLGsmZBf9gPFpIra0z3mRTQSIAFR3uu4xqFIZGutzRd4Xp/cjyJZcsHJBvUGMyUXQGrzVT7YtH9Cz/sq/crsglNROdQV8uOjIEBTgIxlu6Ee+/5DLhVSWlCL8fyeySZNZkOJTv5LX77Ist+fJTfT1egV13je9GrKgbSIBUbAOrl+UJ0DIqUtf1BbqQj/SFKd51HFh7TA5dfwzjEdpFtjphU0zGmhegpoIhMYZqg9YzzeNOKPi+MiZBh3RovX5VxNafW0T59Sa/QYriNBP9ZbAfSVicaNq9p7YHV9Tdpe6EfqqDfgmOhW5vS8q8oyf70wbYafOuHLsUtitI4JEboPaUZJPbqxOSsA92Mip7h9cGE4jWRhVWU1WMa7QkgoBngNFR9KRPmNNkUi24Rzx2/KBaW9nsg0yKoRsj7m1Vh4smEZ9Zhke0ye61dvht4j68inEeJSVdezxM/WjWihklQ3ozqm+2lMOaISHcQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(40470700004)(83380400001)(70586007)(41300700001)(186003)(336012)(426003)(2616005)(70206006)(47076005)(16526019)(8936002)(2906002)(36860700001)(4326008)(8676002)(6666004)(36756003)(7696005)(356005)(81166007)(82310400005)(26005)(40460700003)(40480700001)(478600001)(82740400003)(86362001)(316002)(110136005)(54906003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 04:30:42.7177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41acd6a7-c05f-4e75-11ac-08da75d217b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

If the boot firmware implements a connection manager of its
own it may create a DP tunnel and will be handed off to Linux
CM, but the DP out resource is not saved in the dp_resource
list.

This patch adds tunnelled DP out port to the dp_resource list
once the DP tunnel is discovered.

Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

---
v3: make tb_dp_resource_available_discovered as static function.

v2: Re-ordering the function declaration as per Greg's comment.
---
 drivers/thunderbolt/tb.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 9a3214f..53abce3 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -105,6 +105,21 @@ static void tb_remove_dp_resources(struct tb_switch *sw)
 	}
 }
 
+static void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port)
+{
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_port *p;
+
+	list_for_each_entry(p, &tcm->dp_resources, list) {
+		if (p == port)
+			return;
+	}
+
+	tb_port_dbg(port, "DP %s resource available discovered\n",
+		    tb_port_is_dpin(port) ? "IN" : "OUT");
+	list_add_tail(&port->list, &tcm->dp_resources);
+}
+
 static void tb_switch_discover_tunnels(struct tb_switch *sw,
 				       struct list_head *list,
 				       bool alloc_hopids)
@@ -118,6 +133,7 @@ static void tb_switch_discover_tunnels(struct tb_switch *sw,
 		switch (port->config.type) {
 		case TB_TYPE_DP_HDMI_IN:
 			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids);
+			tb_dp_resource_available_discovered(tb, tunnel->dst_port);
 			break;
 
 		case TB_TYPE_PCIE_DOWN:
-- 
2.7.4

