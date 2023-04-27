Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBAA6F0477
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 12:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243516AbjD0Ks6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 06:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243448AbjD0Ksv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 06:48:51 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0763D19AF
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 03:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXN5chkwSRzjW9gS7b5/uOFZ5lHFy+vARWBjTAxkNP54dxIyDQv99wOHh7hGW05qh3GoAWQqCZ4zOh4XS5xAqaR58eE/Zl4uBLMTJVF8twFdqQSowYVj5azFK3F1jNOy9NIzRWhwcUAwBXzcpHM5OEZIgvpykpQ3lQ6TUqgWnrItxzmxbrTV4Gvd18IpCYV3RnY/ed6Z6KlpwUwgh8ihHTuKZigYr8VLit3x21yrFkgsZA3FpVvrggBjkbZCY+U3370yJmexNKTAIu886vDRGpeyMKpJ8Lxd+betaoCWHj0XIzjDmJIEaGf5UIi3NQPGYNUyc3KWTGlFrS9wnjhw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3h/A/IqYh8C1+lU+h4i/rVuhk9gj1hCwHMddEMfHQ8=;
 b=Xo2wPljtc2rvS0b5yUBJfeSshB5Z1xLjrrokPPDGAdh7F0tjnWU0wbejNKAt+UQLagUyhLviSfQn0V4P/PRxLk6mVgRCqp+O32Cck3mNu2zt3iULS53LAKpgRaFQqV0/1Cfqstdl7fWcjNv6UzeimkRuVeJdIGg240pnspIkKKdpYk3W2Z6k7VwCO8jBfSN51smdOn598s4EUQvS9XRHbC0eEOucBny0qC8PSvB3VTcVSjPuyXMEQzf8A8aS0wMpX/OyrDgJ+bAdHblZUD+hYcfcHqfhPwDN9RlGM6l2s1DsCe0pbnGzOuQSQKt4tZaGYcHKkqC1qP43VXR+T0Fs7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3h/A/IqYh8C1+lU+h4i/rVuhk9gj1hCwHMddEMfHQ8=;
 b=vravkLmmjF215rdoP3rqWnlR0hx6C4H0jN3YuikR0ECQzZ7dcQs9ljAxZLaqQbYumR6XX9BNXuLJQXSid01iD9G+HiSlaHIOOf6bbgSnk7dnqVJj3PKeybSKwOpSDL1eJYtaMPlu4LK9uWtivOvQ19qiGb2sPJtktx+UA35CQtI=
Received: from BN9PR03CA0468.namprd03.prod.outlook.com (2603:10b6:408:139::23)
 by PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 10:48:48 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::c9) by BN9PR03CA0468.outlook.office365.com
 (2603:10b6:408:139::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22 via Frontend
 Transport; Thu, 27 Apr 2023 10:48:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.22 via Frontend Transport; Thu, 27 Apr 2023 10:48:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 05:48:46 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 2/2] xhci: Improve the XHCI system resume time
Date:   Thu, 27 Apr 2023 16:18:05 +0530
Message-ID: <20230427104805.3560591-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427104805.3560591-1-Basavaraj.Natikar@amd.com>
References: <20230427104805.3560591-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|PH0PR12MB5481:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c1e860-c9ba-4dbb-bb13-08db470cfb5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXYRANXIuOv7+iGuodLqpp6BDCALCp0rXpv5mB6mqedE2QIdPsZJu5jFg9LW9O7z2vLMunytic90SNfdLpkCXVwOX99rWpLtVtrvdpsraA/bC1Wvg19RHSairsjTNtSzjgFWYPC6tq7Sjw7lrdh0sdBji6b2UrBTiAIEMBCYuVwpJD+qM3KnowfI2j3hZcaUgBld9wQoo2gnTN+3WFElbkLuAwyYxcW+oUmI48VLn9VH+9G37WoF3jBeK+QOAzOk/UdCpqNu7Z7Y1JVHNHvP0s5gpvGSkxt/DYHHcYk5qIfOnEXz7xkzwEXnZ3OOyaY27UKbmLmWVqOyKL85Sj7KRaw4c58QzQbFW8dhx8uChFX4Bgv8FNN77GvYyCdD5rkYuEQeYdnKS/4aeNMbW6D6O7Np3W6/EWIUHzM7bebYGxsZBchSZe87ePEAC8t31C2CKjUYtmErOalvdmbHAvYHzTWAebPu7ffq1eh4GdSb9UaoxZ74S32yjgHGFcBkfJ5B/VfZmKpeYs4zsDCXIawf0aHyUaaJIxqzkFzmAt0GPof+9mcjEU6sI+ocw3IvMjoz7a/aeIpclzuZcrtEwSkhVpnHw/nM7GHqAnB2R4f01EL7A0tAegy8m8QyHAbPmRh/TeGvd3pn0RWDPzwRI0oSvRcrIhICZ1fYL4VagO18ADrcZioRBSIs6e+W4Q6DG2BBJCC4yRfQfmvi0fIBJEM+9mOsXE7Hfxm9NE3V/rjQTE8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(356005)(8676002)(81166007)(8936002)(40460700003)(41300700001)(426003)(478600001)(2906002)(336012)(36860700001)(82740400003)(36756003)(316002)(2616005)(1076003)(86362001)(70586007)(4326008)(70206006)(83380400001)(110136005)(82310400005)(40480700001)(16526019)(6666004)(26005)(186003)(47076005)(7696005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 10:48:48.5017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c1e860-c9ba-4dbb-bb13-08db470cfb5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5481
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

