Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33AA310A5B
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 12:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbhBELhB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 06:37:01 -0500
Received: from mail-dm6nam10on2082.outbound.protection.outlook.com ([40.107.93.82]:23393
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231911AbhBELey (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Feb 2021 06:34:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjIqEcWTaqDh/ownKHQguSoZ5Vd3AVIhcsWxRqqj3lAoDbLC+MUzfHG7tdXOPCeTtgUtsYXlLG+oka/Ln62dM4oXcyY8TCLMqXvwUyMFz1fab1WYYWR+Fi6XWnI4aRfHr0XemcQRHl6J+AscH3R8PhaGr2Jmpz84glfuU4v+6xVQkjhTckqUTpkIsLRMtFXBRUNQI8vI8qAAnR1hSnw54upohnw2n/Pdf4qc7PnRgSesY6VktVoK11WiVQAfCmMHzYCbU+6jiBY7/mDiUEmz81PMfwE/jQTmqs6lkX602SdKt/WjAJwjb8VB0tmR3zKWD8LwJ3OBC+Bx799wTVdMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2USs5XCIuRxmDV71lrRfNvgiMBbV0xAOVRnrMCWEHNc=;
 b=MuvtuNi2w6LclBPL54uS7iAI6wYYKiD7TT6cpz9+OiCe9IG+jtVTl0zFYguT5ULkF/+gso7xRzjuQH9uXTNTo8geGvij6BynX0GyspaofRQc1/wrFk0aYdT4+Bmg9/NnJ6TNvqLtdKbVhuoi0Ft3yQ35Ih5yoqCExOor7NhSfvYbgrqKx0MATxHTDv8hHP7sI9nqitq2wGudbgsbMDWmsiAU+1jbyvXMxTy5jbP5Gn+c+Q4vrRc367PyV+H48+pzYE9+czfpTsATsDyJs/QwuqB4CkwcsxQnzeGSFJ9Dn6Q+bwLdAQ/rIN68ysJFCU/20mlj5j/1klvld6gKlzk8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2USs5XCIuRxmDV71lrRfNvgiMBbV0xAOVRnrMCWEHNc=;
 b=AtGGYNcH/rMsgJzMbiD58sVVyWxfER3Yq4SvNVnGqnlQcnCzH0N7d9CxZ5MsX1fR6HbOLsGLYr1ncQM42AG3S/RkQWFEEUAen2sHjs0cb2gikQtzI/tpMt4N+BeflOuKXnK5Uitig+NcBSenPzd9F/aLDRU7dkrzN3HeIpWMDxg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3238.namprd12.prod.outlook.com (2603:10b6:a03:13b::20)
 by BYAPR12MB2981.namprd12.prod.outlook.com (2603:10b6:a03:de::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Fri, 5 Feb
 2021 11:33:52 +0000
Received: from BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16]) by BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16%4]) with mapi id 15.20.3805.024; Fri, 5 Feb 2021
 11:33:52 +0000
From:   Prike Liang <Prike.Liang@amd.com>
To:     linux-usb@vger.kernel.org
Cc:     greg@kroah.com, mathias.nyman@intel.com, Shyam-sundar.S-k@amd.com,
        Alexander.Deucher@amd.com, Ramakanth.Akkenepalli@amd.com,
        Jack.Xie@amd.com, Prike Liang <Prike.Liang@amd.com>
Subject: [PATCH] usb: pci-quirks: disable D3cold on xhci suspend for s2idle
Date:   Fri,  5 Feb 2021 19:32:44 +0800
Message-Id: <1612524764-6496-1-git-send-email-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HKAPR03CA0036.apcprd03.prod.outlook.com
 (2603:1096:203:c9::23) To BYAPR12MB3238.namprd12.prod.outlook.com
 (2603:10b6:a03:13b::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prike.amd.com (180.167.199.189) by HKAPR03CA0036.apcprd03.prod.outlook.com (2603:1096:203:c9::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 11:33:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27d5dbd0-3b97-4187-a043-08d8c9c9e9b9
X-MS-TrafficTypeDiagnostic: BYAPR12MB2981:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB2981EF842366673CE7FFC5C3FBB29@BYAPR12MB2981.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyWROt1vIy1iodX5HuGuNs5rl1BsaP7jQSgDsoEyl234azL8eJmidXXByMj09qG5YJceeGvrQe/DloXHwbXd5muuzDuyn6KVq8cH2b4VdqnwVlxMgYeIQelZsNqKXCA1Fq/Pt4RR+3w/4i2NHUsG49hvG77ODJfsF50EpFSl8uxzYFYjcHs9YEcSSpJaQf1xQrua0QQPZeNq2O0UCbrk5H95xrvMcITFncr+CaJ+oe+BujUHjtjDCGuCx3CH0k1phAT0krjtL0bgiMQNr06ViSDhCHAeAWBeP5d21v5/VZrkKCv70BATOvcxn+CQZiSo1pPlLSSgseFVu0Masrzk9pZfkivv3X7jiw50NL1EsPDsu8hH0m3fr//WgSNvuX0IwQpoWclRwmGwfZsIhvAHe3RzcquGeYuQSrZCXvC80PvGKpfb7gwqVuoWnQsbiXS1gzuh3SO2O/3jAbm7CjEs25x+fc/FpJ8lNuzTkxUlGJGzf8hyOFCEhwYSj+IfL85c5VFLhy6c8yfUcQ1lKQjpehT/X4h0FSUcRN13m8J4DURjuJdII9mAnBq52h+FTkP/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3238.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(66556008)(66476007)(956004)(36756003)(8676002)(16526019)(478600001)(5660300002)(8936002)(4326008)(186003)(52116002)(2616005)(6916009)(86362001)(7696005)(6666004)(6486002)(316002)(66946007)(83380400001)(26005)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VDP7+gJlRh2yXiw1aILJ2KYh59/ZGOslUS0Vh/ZenbtmBYeluzW1Vf/qU6iF?=
 =?us-ascii?Q?NoRDfKeZJSE62a4ftK4AgDRLGmAkoIRuWzmNlXK/D4r5ZG22fg0N3tNHDHFH?=
 =?us-ascii?Q?nUvGsORKEWsywW3b0ECr3P8xLikrS2LVNebqIUGY6FhrbFUNncuNT/iQUwmo?=
 =?us-ascii?Q?ISuYcY2BDhsAjYLiqK31DjJ8qFwIOIaM+Wy4gtyVRu/N0XF2iDmMgP+27jWu?=
 =?us-ascii?Q?Gm3SSlbsPjj2Gzzwgk+tfBBo4vweqb6MSwscym7a2rlIqo/dgJFGntSAgbyK?=
 =?us-ascii?Q?KQQFBz0Z8Dvmxv7zUh4bS2fd3BxB6GW1HNJ+TfinCYCzFohrauelcu4Qa/Hm?=
 =?us-ascii?Q?GQKAkYXd4XC2vu1UMfCamrO/ktt+DQa8LdkOvwpr7dsgszgUjkXXFRqUZc0t?=
 =?us-ascii?Q?B6JhTphIJoJrwNg1dDxmESL3OoiFKOA0jKNUCPuWiIJQS89S6tEz8Mrutl0b?=
 =?us-ascii?Q?/SrxLNBfpSC3eA5LiuIQ5c10oREy3rvB83Clt3sdtH6unG9r+H2xcPebtzon?=
 =?us-ascii?Q?ee+a9CHjU7xuBGstzqafqjeJjC5E4HZCjU1pf3pnUX+YuOoKH+IzVxaTqDC1?=
 =?us-ascii?Q?9mq1BLmi9070zRqzXmOLMCRzhBnW/PPNtvjSEZwVrdQ9iZgkyouMHe2jdsVQ?=
 =?us-ascii?Q?Ma1MqweJIhNzrDgqb8Mm6pFUWWO3Aa3moItCHq99psD23DDaZe7K1HGIfIMd?=
 =?us-ascii?Q?jTNyRj1HhgBM1Wfarr8fGu8iJ+Pbhb4pAg96434vY8vTbOq5zJLNaEpHvhNS?=
 =?us-ascii?Q?xBLzC8foTraAIxkmSvaBOtXySqLbgKiCfvDGwnHaHJnvjDp8JMP6vsjjZ2J6?=
 =?us-ascii?Q?PK7XpBhWS5WdEvnTqAQLxks65LJVt5tAcJ0/Nk66RX8mww0nJgyFK9lrSgRw?=
 =?us-ascii?Q?STLZ2Il7qDQ0mB2V2/ChIMBVYbsIFVQozDECH7qOzcxTVnw+x7/ykj3x5/MA?=
 =?us-ascii?Q?hA2lgsxhwBpohfUxnALg9H6nBM21ZjhtrT9rWklZ0SQZxd+QXBYeaFD0FLQo?=
 =?us-ascii?Q?dQN+zhCdugFL7Apl4nWB+qS1pgWR8JuzqSWRYdd9+n5ZGiaYtjGJ10yC6NuF?=
 =?us-ascii?Q?+4zlSDXY0eHusUf+xA1Wk4ofgNyHuqaoH7vY5gHqNAv1wxxryHU2fClgH+OS?=
 =?us-ascii?Q?rDvhUFB+9T4+O2sBW+0fMDIYHOPT18v8nST3Y9KMF46OoSovslYZCgtZbvMs?=
 =?us-ascii?Q?Oh0gxYZKprnL7VhiiJ/5PkCbstAytsKgZzaUWACi3urqhP2L5y9B4cLpQjzB?=
 =?us-ascii?Q?J7MgATtRk2qaoxF6tqBNhGyX9PUDiwDob9QEtgK/5CPnxuGh/VTSLDXFEStQ?=
 =?us-ascii?Q?W1nWbd+m/f9dosj1rRrDZx0Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d5dbd0-3b97-4187-a043-08d8c9c9e9b9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3238.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:33:52.4578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORhwCorxJUOfcOUfRHbI3mWsFFyTXlR1UYTtOUBZbQZbvyrzaNfMVBhiT/EzV//P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2981
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The XHCI is required enter D3hot rather than D3cold for AMD s2idle solution.
Otherwise, the 'Controller Not Ready' (CNR) bit not being cleared by host
in resume and eventually result in xhci resume failed in s2idle wakeup period.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/usb/host/xhci-pci.c | 6 +++++-
 drivers/usb/host/xhci.h     | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 3feaafe..8ecde66 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -170,6 +170,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		(pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_1)))
 		xhci->quirks |= XHCI_U2_DISABLE_WAKE;
 
+	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
+		pdev->device == 0x1639)
+		xhci->quirks |= XHCI_AMD_S2IDL_SUPPORT_QUIRK;
+
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 		xhci->quirks |= XHCI_INTEL_HOST;
@@ -500,7 +504,7 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	 * Systems with the TI redriver that loses port status change events
 	 * need to have the registers polled during D3, so avoid D3cold.
 	 */
-	if (xhci->quirks & XHCI_COMP_MODE_QUIRK)
+	if (xhci->quirks & (XHCI_COMP_MODE_QUIRK | XHCI_AMD_S2IDL_SUPPORT_QUIRK))
 		pci_d3cold_disable(pdev);
 
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ea1754f..fafa044 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1874,6 +1874,7 @@ struct xhci_hcd {
 #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
 #define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
+#define XHCI_AMD_S2IDL_SUPPORT_QUIRK   BIT_ULL(37)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.7.4

