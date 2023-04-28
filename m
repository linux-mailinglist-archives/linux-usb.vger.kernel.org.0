Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F5A6F1A1D
	for <lists+linux-usb@lfdr.de>; Fri, 28 Apr 2023 16:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjD1OB2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Apr 2023 10:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjD1OB1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Apr 2023 10:01:27 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DF319AD
        for <linux-usb@vger.kernel.org>; Fri, 28 Apr 2023 07:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqxcnU/aSMTysbZWAiPlJk3ZYtXMO+dZVw9IdzbhKkFoGFdGVVNyRB8NMz5Efv6eb8EbRqIh5poFcegmHbCcpXvnZfSUhuvLEojYmBqT6RJXKNImGkVACfb3GjppJW6kk+1AmVDMFeszb2VQStHwo7zatWRF/YYtAEvL8KdBnfvQVJBZET95oj3VghIKMRQsxv92rc067Td1Q6zGWCdsIeAbImJXW/wYFZEsrHZ7iVJuJ01//UXgA9ep3LhQzzAidzK+zKlSheDu1qw5yM9h8k2U5wvezuaOhCRnxdMrwybP6PLtVX635GL41u3MNPq2earMjYGYVdKjX3WhSnN+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3h/A/IqYh8C1+lU+h4i/rVuhk9gj1hCwHMddEMfHQ8=;
 b=JLOovTeSO/nlVI0YZtECPjBcmiKHBFBAu5hXRCe59Zpsryx0xmF2iVNTWT+o+rE0DdJ3GKf/5nWvI0Pnb+jf+hyowgCBQ7vvlTTH7Cto7llbRSiROPgHAO0XhtnV7j/7KtgJwLroPueSY2pRf+8vXqwU7bgWlRw0QZhkFNTuvP19JPDMIb4daNqF9ukcBG0n+K3KEYR98JbkjQAVWRJuuGqN9CiBUFjdG2RhLd0ZJJTbhm3YIZ7TWWo4PXTtr7uKTwOid7tsO5uMGuh+kiUMqlA4uYelH08ED0fCoxnXtMd3i4/QnSbzW7f1oItEg3rt5Pdc0VNKXI8CSY8ueoOJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3h/A/IqYh8C1+lU+h4i/rVuhk9gj1hCwHMddEMfHQ8=;
 b=rV+ab1WNulsD4ou4y9TMrCUNDSvP164ak6Mli9GCF94EMqqNSD9+DQ6FVez8A3Ncm8pXybAU93fTZ49H+wP9nlfCtq62Evaj+dgYdOQl7z2DOCYiGZ5W4Tgvo8hjIb1wdWG3UgcbaTtySPHQp9RsCHSggJp4TsaBcFfWNu/XAyM=
Received: from BN9PR03CA0855.namprd03.prod.outlook.com (2603:10b6:408:13d::20)
 by CH0PR12MB8531.namprd12.prod.outlook.com (2603:10b6:610:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 14:01:24 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::57) by BN9PR03CA0855.outlook.office365.com
 (2603:10b6:408:13d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23 via Frontend
 Transport; Fri, 28 Apr 2023 14:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.24 via Frontend Transport; Fri, 28 Apr 2023 14:01:23 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 09:01:21 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 2/2] xhci: Improve the XHCI system resume time
Date:   Fri, 28 Apr 2023 19:30:56 +0530
Message-ID: <20230428140056.1318981-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428140056.1318981-1-Basavaraj.Natikar@amd.com>
References: <20230428140056.1318981-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|CH0PR12MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c63858e-4a7a-44a9-7eaf-08db47f10d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fU9PPv3GVpr+BGGeeEJegdNB+3ETGhyTc0icijVnTYdP4V3JetejoJSn8+TwGWg8yW2DqA8A5j2mbzWKdGqmANJ3Vb4hEbMVkD0aTTgVuM/IMl/hduBfY2ozPMsdMtAZDr3RtAVJfzzNgijWu4ZWr57i8T0xwxt0elvZ0c1OZnf01+S13fenQ8WdKfzZkNGjsVMyCJUvMci214sySvzCnWKV2cHMP4qd4J0T/5I6G+Zf3AMcsvoYlQbPHy76a3ny4MCdW1F15DXfIJ6M4+j0GDUrAeOZWwUkZepzD6V5DVnjWMaEZQK/Ni12xhh5oHMg25rx7pyrTE2NVrVg7o6LhWKlic1eh43iF66wE4IHdib3B7PC6GF6I03Em0FuP0IYr5dc/HVnxk4zoO4KVjtTyl6c3zd64Sz1xOjItMjBqht7nZMwv/UROUUZJHb4KXNquvowJo1QODg/HaqhPUoG48MRQ61dMbFiOiK+I/ZWeF5l6czlufss/rf1pFMsmKDlJGjT5fFWjRUfmCIMwqy1xN5h+17XX2Bz2DcY9kZwZXJWNrYqKxXr+tOCpRE6dq+mEYLrsGRknYyMu3zjo+prMD6HeHxzkfwbqjHGjgHn/U9CA2sHDqjfAx+CT4LdW/TRJB3FhfDjc6YKZcYBU7KL45TjJ4TMavnuO0dse9uFoqSJWmpPDvIPJPFH4wgZhL3UhhCnIAY/m05Kn8BzfckmroxXPZymtbLU4ypW8nnUCzA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(46966006)(36840700001)(40470700004)(41300700001)(81166007)(356005)(2616005)(36860700001)(336012)(426003)(8676002)(8936002)(7696005)(36756003)(316002)(4326008)(70206006)(82740400003)(2906002)(47076005)(83380400001)(5660300002)(16526019)(70586007)(86362001)(186003)(40460700003)(110136005)(82310400005)(26005)(1076003)(40480700001)(478600001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 14:01:23.8002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c63858e-4a7a-44a9-7eaf-08db47f10d46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8531
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

