Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4226E66B7
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 16:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbjDROJn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 10:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbjDROJl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 10:09:41 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68340B752
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 07:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aY+PkypwM45gWx9fNoqrVURaQ6q0/pOCKriHDEsuBX4IR5PdSI2727G3p+C0QSClnithMvyyJS6+RM4u78dxPjl46m0GD1dyC63yQoEZpJRhDa9+zz9fnCAZKvUX41Wj8qPlM/sosd9KqWV9v2Dlk8kO8Mg0spP5454vJK6i1pBD6LtYkBGVJyZ4hcWRyPxb1m4RNMHzFbVEoVoO4K0M5UcEqXoXk7/WxcugixQkFTCw62ljmPLvZDTc3EEEmlUXeZ775Cgb+04HatawwHcASl8IlyYvz5crhUY0gFV4NmHHT5MFDkdFayiPyQlxrh4X2+71xNEgkdkAEQzvbemR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMR2A8MnlTkc7PygPRXXQjVJORMUsNkaDoZlh0+dFR4=;
 b=SrofRW2xo5Xq5g6wwsWhCGmREfkfz16yRG3xG+PEJcLm6NYe1krvECgO3hlpHjq77elw/sC9AR5jTCr3dO/IHr+gdpxQ+PbxiDpkt9mP4gKaZv44PQLJHyWyvVOWGcD/OmA4pf6F9d/KD2IiuMaBXKuo2iKfGS9o9TEMqTEcRE+3LB82es1c5xQchjhZFbUSHnINpUTqubC1NIz0WnWxMu8Xhg0KMRSFCQa8GDIITzEh/RNzJUf5hF094BVopBq002sI5zPmSGJMx3DQS3d0qicinyAUrXTGQxpbp8xwhVNO/tYbGrRiN17jwgsoXXb4DgAIcqG3pH/u/dIRQ88Vzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMR2A8MnlTkc7PygPRXXQjVJORMUsNkaDoZlh0+dFR4=;
 b=UT1PI/o27NngnOq+t8hmwttnAsPZIA2JUf+wzT/3d4LZZVFWCk5V/V5a+N446s2DI3+DNjZQ3rLuCNZNpVTtMVNe7zlDpHMr164cz+2OXKDeoxq7tnulSDjjfWpqmppBmdCQVrxEdkvRgsXFf/BLg0wQk4D1iFrNotWh6W2BNPw=
Received: from DS7PR05CA0068.namprd05.prod.outlook.com (2603:10b6:8:57::20) by
 SN7PR12MB7936.namprd12.prod.outlook.com (2603:10b6:806:347::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 14:09:34 +0000
Received: from DM6NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::3) by DS7PR05CA0068.outlook.office365.com
 (2603:10b6:8:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20 via Frontend
 Transport; Tue, 18 Apr 2023 14:09:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT095.mail.protection.outlook.com (10.13.172.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 14:09:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 18 Apr
 2023 09:09:28 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/2] xhci: Improve the XHCI resume time
Date:   Tue, 18 Apr 2023 19:38:17 +0530
Message-ID: <20230418140817.3651909-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230418140817.3651909-1-Basavaraj.Natikar@amd.com>
References: <20230418140817.3651909-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT095:EE_|SN7PR12MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b6a8ac-5ac7-4c3a-76a7-08db401689b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sGAJlXugCuXlx0Rkr/M3dVa34ZuqQ90goGJT7552JDPqoNtrJnT0OFZbPe6R6PC6ebMoAxD1VD9f28OorWJFHBpWG/L7i2SLnn6AqiuTERjHAo8g0VkIOTjri0jVWKAqRG2Ydz7l5YEcXOPWX2N6oN8KjH6pYwXsJAxniBa15Tqh4B1j+JVXkKEWhOUMfQyAwTl3RfgxAkkYCqcyELUL7Q6X82XoRdu3io+0uXujydsNEDESKjrTJV1rgFGyWO2KbPsTUirErlvyAycMOiWdrwCK54eAUGE7yb7etYS+PjpPvVtqfcKTp2R2wbsOK5WJ6srer6zPy49yp1A3F5p333ZQFSP2Tmgeifca9XJT1vrpnvAOspobgAW7rFpitS+kQ4qSvqH73XoxvRtoQ2LFzX+ankqBq/+ItxoE2yjQPCnMhVynsc6W65+vk6wGLD+dLgkOg5y4h+bQJCzt31E8Xz45el64Ey61DxaP4uN49RC1chMOSRPPGI2mRypUqY8E4JjiG84iyAw1QNytrhiAFybJvtgygVZxThHmUneh5YffJk32On6Itf4/0nM66rvQwYPPUMvAfJvufoQPPzNUZMNM5dm+ASwWvp1ABrn10iRa370fIj7BezbUHN3M1vNOkMxAaifPxlL0tIc5pYNCTh2+XPZkkdp7KD5OVUFf7pT2Rq3ywxdCYCsspFtDKUbcmllYg5HOJNb0wD9fqR87fEN02QzqMuxrG11Nx5a0V1s=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(46966006)(40470700004)(36840700001)(40480700001)(82310400005)(4326008)(2616005)(40460700003)(16526019)(186003)(41300700001)(36860700001)(426003)(336012)(47076005)(83380400001)(7696005)(6666004)(110136005)(316002)(478600001)(1076003)(26005)(70206006)(70586007)(81166007)(356005)(82740400003)(86362001)(36756003)(8676002)(8936002)(2906002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 14:09:34.6457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b6a8ac-5ac7-4c3a-76a7-08db401689b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7936
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

xHC system resume time may increase due to a 120ms delay. A PME# signal
will trigger the xHC host to resume runtime, and the host must wait for a
missed U3 LFPS wake signal before re-checking for port activity. It may
be necessary to wait only for auto-resume cases. Add a check only for
runtime resume to avoid the delay for other PM events so that the resume
time can be improved.

Fixes: 253f588c70f6 ("xhci: Improve detection of device initiated wake signal.")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a539e4dd54f7..a3ee80ee5d1e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1315,7 +1315,7 @@ int xhci_resume(struct xhci_hcd *xhci, int event)
 		 * the first wake signalling failed, give it that chance.
 		 */
 		pending_portevent = xhci_pending_portevent(xhci);
-		if (!pending_portevent) {
+		if (!pending_portevent && event == PM_EVENT_AUTO_RESUME) {
 			msleep(120);
 			pending_portevent = xhci_pending_portevent(xhci);
 		}
-- 
2.25.1

