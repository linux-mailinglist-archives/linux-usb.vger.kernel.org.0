Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1B1416D0B
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 09:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244458AbhIXHqb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 03:46:31 -0400
Received: from mail-co1nam11on2079.outbound.protection.outlook.com ([40.107.220.79]:58593
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235134AbhIXHqb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Sep 2021 03:46:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQnbW8f0o+gW7eyua5lva2A0tMzyHsIJleT0SBWZ11U/CL0t4ZYjgIusGc8KtgZfDT/dCVQNBM+iQEiXS/D70ddEon0PocKzLph8nLJGTr6mQsFOBBQT831uzfXwwyrNAi2zU/E5iew8RbXXEgwc+XwVeZcxTrb/wFiUJp1I8cAh6Lu/I10MBJk4y2nUNs7D4x+ng7qKv0Jk+kx/4zEBEBVuX/lrZ2PBn5oqXBNAjP4WtUeNbExK5w+3x6UnPL2RrMaLoXgsgSiz7lUm4K/NFmdZL9RVPFVEIDZeWWMFYVPUgni3H1XyMVQL1D2je9r7bfZyxd/KnoZXhJGw0+eYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=P7gvhXMoNSF4tYXn0fbC9KWX8245WGvXSA0pBEU+Mmo=;
 b=N2vO01NbTuaCAAqVXH28mcWrWYIeSYRkI0wPXuZxx+R3aClq9pS46h1dx3iX++UKWtMuCVaEn8sKIpYX8dE/Bw7ZK3iWWFd74GxzeSh9KRctjZ/3okr0RKWzBnddPtLfvM4RFfqckGbfDBgxNbFxUyMhT1G0FgkGPjcyjBOlH9LcpoQQsqtm72u9EONQRxVLKAy2cYGjMdnOuvTsRYnee73adStjOgC30w3tmJtXxTFriA3iLUEfssr+RIN8KBtwV5COphMTpREsxEEEDtEJPSnlnkifDEMwza06dK0tqZk16YqRC9NtvEzOa5GG48LV3tiFVuxYYhlk5G6C8DN85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7gvhXMoNSF4tYXn0fbC9KWX8245WGvXSA0pBEU+Mmo=;
 b=eiBrJHd+BpWYeAP6d/2A1AozD3bJM/QDtgUFdSX1yfVlNBJxQfmw+lt6zkhNTWId66Fp4yRBzrbpj4xbiB1p10AVbzSCdUFSjNZ8H7b8jrhYgOWqbm1mAnJ1qDK2XaOpQK0/BhPY0iXTDDNpcasH7jXmJQ49paPZFq+ljGf2eTU=
Received: from MWHPR01CA0039.prod.exchangelabs.com (2603:10b6:300:101::25) by
 BN8PR12MB3009.namprd12.prod.outlook.com (2603:10b6:408:42::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Fri, 24 Sep 2021 07:44:50 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:101:cafe::ba) by MWHPR01CA0039.outlook.office365.com
 (2603:10b6:300:101::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 07:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 07:44:50 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 24 Sep
 2021 02:44:43 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH] thunderbolt: Enable retry logic for intra-domain control packets
Date:   Fri, 24 Sep 2021 02:44:24 -0500
Message-ID: <1632469464-53954-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 637b225e-36df-44f7-a6e5-08d97f2f306e
X-MS-TrafficTypeDiagnostic: BN8PR12MB3009:
X-Microsoft-Antispam-PRVS: <BN8PR12MB300939993176D7E7512A1E7DE5A49@BN8PR12MB3009.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PP2eA52Rqk5g9mkMhj8nf6IiWQMKNWiIUVtx2OB7G/+CWOkvTlFVpHDav4Vlrg58o+TUzEOtxU8g5hGDVBp3TB3+ar87Q0dx75XdjMG8YYhvNV1cZskrOJbEaKdwmxJoxGEgFuwSxp67bOvzPmt3MygIcMZxCeKeVHLVqxfDjKYaGMOaN8YHhBzHkcl78OrxdGf6yNJ0hQf/THZJg/fVT6FWIZ1Ll9lee75ZVNOvBnPMwffyUEMdgDq9nq/d2c7qEQ1cyoky5KrybeNGBL7lwCUQFjCEFI2duKfwC2AR919eDjrj/16h9loXM+KPMawz/3t4goQwrfAYn+CK5dKaVcUL/0XD66RKBtUmkQN/GP7Gl9Uc50W8svGvQzfX9VXaFZkqeB89rl/WTJmvNZaqhKAoP2AIPwS6d7K9SY4O7k1MoK8VhxVjhWUr2rzCSBSP0BxQ1E39+AKpRPlONRIzqIEjfY8eh4OXBWjrsfedP1/HYhoZFhrZ4kktbGeyGiP6XF+QBF306lI6m/+Bz3vroSjGai86gb6xPzzDG2H7WdBDmRU9dgivOGk0nwOZ9ED748lWR6iWgJjEPpNWKJxgxubAmN2vLFJEau9lMVgL5LlHhkG9kzm2TAOgpelB72XJhajIrYvjcAa9b38gwStysXLtWX+DxU10hCjhZWyW7mtT8laNm8KN6GMiweSUEZ64ES1p6mh/vbzd+cqdUnGTlY2gdH4aJjQbaL1czHjz2DU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(16526019)(26005)(186003)(336012)(426003)(2616005)(2906002)(7696005)(6666004)(4744005)(5660300002)(81166007)(82310400003)(356005)(110136005)(54906003)(47076005)(316002)(8676002)(83380400001)(8936002)(36860700001)(70206006)(70586007)(508600001)(4326008)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 07:44:50.0945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 637b225e-36df-44f7-a6e5-08d97f2f306e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3009
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

In case of software connection manager, the response packets are lost
sometimes within the stipulated time. Hence resending the control
packets in such scenario by increasing the retry count TB_CTL_RETRIES
value.

Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 0fb5e04..4986edf 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -17,7 +17,7 @@
 
 
 #define TB_CTL_RX_PKG_COUNT	10
-#define TB_CTL_RETRIES		1
+#define TB_CTL_RETRIES		4
 
 /**
  * struct tb_ctl - Thunderbolt control channel
-- 
2.7.4

