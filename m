Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1E34782413
	for <lists+linux-usb@lfdr.de>; Mon, 21 Aug 2023 08:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbjHUG6N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Aug 2023 02:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjHUG6N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Aug 2023 02:58:13 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA20AC
        for <linux-usb@vger.kernel.org>; Sun, 20 Aug 2023 23:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1Ce4wLSbXFkunNHVEYrvvY7GkjF3KAD9ZeRRPbVl3YurQKQf4Uz/I5ZhCY5G9/D72cDONg9zL+qN3ZrBdD3dahiW+PnoodTNBIVp04YN21LIxZJBaQlAJsooq0LHpI2ji7YovvfKpjLlq1eTzIr2WfUI4Kc0KAuOrANoMQvIscwS0NlsG44M64Exhqe4YOsJiKm9JhTETSC2WhRoRFn+2k88qSdXUfe4nlKK9joewnSifFbSZbdWu35sb4NLYotjnyRt/f92HaS0IOx95U92Ph9hbFi1LZASA9puigW3JNPe5sDIVffGxDMGF5YoOMDQXUdbbQnvyeUHEHiqhaniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zqrik9efYT2xnp/Ey5UnEr+ZOgMtCbWrbzy5C1OK31s=;
 b=BODj/FKOv7xprtBZtDeQ+1QGbgQbHoHlMF41BpPPVSAsUrA/ZXCoHzQ8wzbx2OQyIc0EBvrT0zLPiYBw+QxDi91Le+msONmjQY671sWb6rWnWQm7CurwYE+R+reSXwa+jDpHfpdHgByOy/cx/Izi4QjDOPospJXRmj8O2/L/EjOtISnG3GZ7wCTDTo8vgnT8wPLhZVp292BWDF20GLS9aYvtO3hNh7jwJM/6Yl9M5AxViXAIiR7pbve/sZf4ypbIKyetum3+Ird3ID4YN/rONsDiIjEamzY0yVHLebMW/VzBNj4Q+L1u+UQd8n2co5OweVuveyfJNLQgDJQuL0Mxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zqrik9efYT2xnp/Ey5UnEr+ZOgMtCbWrbzy5C1OK31s=;
 b=FMxQxM842V2X95h5B3ff1HccJLmKtcrIKtutg7EuaDt5/t9g1PCAtvWqfVShzbLP6stgM12t5DsH1ZTr95hT5z7mOa49jMBxFrSy+dC3fVOA2fI2Ri1z2Q2OedrSj+e1mc6fnov2e48s7x8nuCdI/XNHfbjX9EvoAFjfmBNNDBw=
Received: from PH8PR07CA0030.namprd07.prod.outlook.com (2603:10b6:510:2cf::16)
 by PH7PR12MB6393.namprd12.prod.outlook.com (2603:10b6:510:1ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 06:58:06 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::99) by PH8PR07CA0030.outlook.office365.com
 (2603:10b6:510:2cf::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 06:58:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 21 Aug 2023 06:58:06 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 21 Aug
 2023 01:58:03 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <mika.westerberg@linux.intel.com>, <mario.limonciello@amd.com>,
        <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/2] Handle RPM for xhci-pci
Date:   Mon, 21 Aug 2023 12:27:40 +0530
Message-ID: <20230821065742.2924681-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|PH7PR12MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 72192f76-8feb-42c6-4ceb-08dba213f896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jlq8P9YpAvpXyPZefaZDbPtB5y1V5nqdNmv3bxRMnmHsb/rjr66zaufkoiUMsLZqbLaG4EXDnK7m59j2nL20LpZM06q2j3ZcUl2DExFlO1DvLTn4yi8Z47Ps5TSxgIzr/Z0wSvN88QpZYGoXyIdurRZou0PUQ7Zizn7eKzmKzk5+IWpgBzmdFxBizwvgaqsiZS9dY6hFZEq2s+GJ1tsHYPzrQJXEm5vkzXwPgJYNoeBamBrTpiaRybKXkIvJAHm1Ro6ynFrTH7P9ASCQtxJGVjbWTnJyk6a1BE7ZjVeAdSc6AEF/LJZllRJmWfX8Fuo2uX9U6g4OcOTFkiyyDAL5/YDKXgXVrZpPbWxTE/R+VG00x7dujcqJpbQvTxvX0b7wCtm5cjabPqshwIiFMcabRS3hLJnQ0h+jKyEVJ4YCHnRcIxkgydvinmQs+BQwuJm/yMm9ynPrPUPqa6uLsq5SFCc/dXylvuXwe6WzHs0+D2LsXpMFIE7F0ugFljIvM+FaGXQChsNzVNzZ6loeMsutCS4pDJL97gssC8ebGTnb+l0UlvbSxBQhyNLD3CRFppK10Ie+KnhWZy3soTG3gPRc7nTG0QR1BdGuT90aS2WnPSrt5XXbSergJ2Hhc1I4pHosJt16ibR+HiY7Z9yz5V9RqQWWxpQmCJ+B8WD52OgA2xg9xFD57pPYd9xyMg9dYBHg8BbUQJKy+Sza8H6HdN7YtdtHVM8ABVbSRhKOnzQ20lur9JhdGYVBwunGFiBd8jb1r9/FOVaCQ7PSAQp5llPQ96mRIjpAtabSJP+6Ekb2Ktk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(2906002)(83380400001)(4744005)(7696005)(40480700001)(5660300002)(336012)(426003)(26005)(16526019)(86362001)(47076005)(36860700001)(8676002)(2616005)(8936002)(4326008)(70206006)(316002)(70586007)(110136005)(478600001)(82740400003)(356005)(81166007)(6666004)(36756003)(40460700003)(41300700001)(1076003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:58:06.0485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72192f76-8feb-42c6-4ceb-08dba213f896
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6393
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series includes fixes for PCI USB controllers that use RPM as their
default policy, including enabling RPM for controllers that support
low-power states.

Basavaraj Natikar (2):
  xhci: Loosen RPM as default policy to cover xHC 1.1 as well
  xhci: Enable RPM on controllers that support low-power states

 drivers/usb/host/xhci-pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.25.1

