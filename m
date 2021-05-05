Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4403734E7
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 08:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhEEGRY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 02:17:24 -0400
Received: from mail-bn8nam12on2080.outbound.protection.outlook.com ([40.107.237.80]:34688
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231494AbhEEGRY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 May 2021 02:17:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qn+hQRb8hM6IqvM9jps3lKSjDJxrX+Ba99iu77RWoLmr7kX1qI+NW9F6WkCi1YFTmDMZzbFieqzGGK6V/vI5xjZlbmZf+07Zk236mkx6NyA21IVEVN0YH0SyujvulSIcvjX2djnbW0Cy+FSdb/kpwovkJQXgng6DEyHpo7gsCguD8NFeDsFfDz7Ksce2v3lTUFMQoyJf0Qb74KKyD194Hip3FoVo2zsKV81ZHM2WYf0S0ne1ZiFuvrlndl1/J+irubrJ8fIRLGgpR180Zep9tBI66I1DQZZZR+25a+0f3FSPNLq7KHNGfhJstE1GkOzkvEbosfQKBE52A71dLBbkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEW5ZD7DPxjw89twgwQ072RUOZdDXng/TUe3AaNb7h4=;
 b=SHRTiLEN3Xn+TFLf7u+pUCP1dl6+9MJNAdoxL2gKGJElcWpJEiyEYOE+dhoRKTJ7B9O2bjBI3FqC0goYTeY7y7kSJFPdTl3WQ0qv+bqiQ0fmxlqVxaKQ3O1yI64a76dL3xNIYP+hYrRP4Wpm7skSn1EidfkIyOLwnedXloUdwsFAyzPF3QKJ6/DOjSJ2doKxQkixWf6c8Owa2H2tPKtpecdOMeXHYy4j6Ibo9PVrdrLqdqfs6qcYXfpV2fpciPpdc85QATgDImE7OBs7S1frrrw/DxD0HEhbGBhYDslBvx3SZkBilgRYv1RI45fe3iaogP/GaIqkJPYEZqb/+iWkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEW5ZD7DPxjw89twgwQ072RUOZdDXng/TUe3AaNb7h4=;
 b=Em6EhopHNc1wU7YNMS67QB7zLchD5Jjtd6/GUzWa2TeMVziph6v9KcgGhXqqBUqhowuMgFjiZCr7KZHLOU82X0U5PprKItTF6ic58n4tB7rXzvpSlQnPIJ7pDse4IgP7jGQur4RoMySIt6+2QQqVx1gzK23nueckxFeq+kPablI=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB2693.namprd12.prod.outlook.com (2603:10b6:a03:6a::33)
 by BYAPR12MB3366.namprd12.prod.outlook.com (2603:10b6:a03:db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Wed, 5 May
 2021 06:16:26 +0000
Received: from BYAPR12MB2693.namprd12.prod.outlook.com
 ([fe80::c0c3:7247:a767:f5b6]) by BYAPR12MB2693.namprd12.prod.outlook.com
 ([fe80::c0c3:7247:a767:f5b6%3]) with mapi id 15.20.4087.044; Wed, 5 May 2021
 06:16:26 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org (open list:USB XHCI DRIVER),
        Mario Limonciello <mario.limonciello@amd.com>,
        Prike Liang <Prike.Liang@amd.com>
Subject: [PATCH v4] usb: pci-quirks: disable D3cold on xhci suspend for s2idle on AMD Renoire
Date:   Wed,  5 May 2021 01:16:06 -0500
Message-Id: <20210505061606.22716-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.77.11]
X-ClientProxiedBy: SA9PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:806:28::25) To BYAPR12MB2693.namprd12.prod.outlook.com
 (2603:10b6:a03:6a::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (165.204.77.11) by SA9PR13CA0170.namprd13.prod.outlook.com (2603:10b6:806:28::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.9 via Frontend Transport; Wed, 5 May 2021 06:16:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84210b7c-d725-4baa-e117-08d90f8d5044
X-MS-TrafficTypeDiagnostic: BYAPR12MB3366:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB3366244C80D5E442825CFDFDE2599@BYAPR12MB3366.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: koANSHLNMmbenQyEcDT39dlYmqXWiQpgalhbwkGJgXS0jG21n6LGOXkG+Pc+oCavADyw1I+XQrUY8+C9i9nJ/XxHViXap1vF9Ohn70rUr4pMAS6j0eLgR19FG/LgufER4D7HlntD2TUvlqWbUr3+PZ04FphkweMqFbOaUQhk0Xfkiuz++WAncb04iVfpGTezn2b9YAttTzE+fWpyEC6ZJ4khGG+8KTIR+6EP87lkRLMkAJHOJ+a/HuC16KA150Fnn0fMTQYGXbtjjM/jiKo01WgBv9eNQMspy3gBqu3TnFHiIqczuAKL6SzNeg3xwuYkyFDeuJm6JoI5eMIMslMGZATpBWSta2WHJG3u07s957NH1HyCqamtLDjSiHPtiAhjXNSIUeOPFALhWdcBdtKNlatMxKUI+PSqM4zywmDP435PDOx/8mjAlFnJy7q50ckOARaHomRkXbcBmWSJfOm6za3glyrOgxuNF2kTyy5vxTycaTpVIxOlK2A4WaD+bq+pzIEuFjgL+sQZ1FvsmwI8VBhsLRp2b9lwxwdv+PmC3FQt5NmiQAw1Nwj/dm6bSjE8EDGnDzbzqo65i837VfV/36k1yv4f0VwBpp83DDeVaWWXfv0p2q/onOu+8QF9uD/spTMHrQvp//mXqDlvu0eE3U5xN1FT5xdglg43DUBkfRsLmsFYURW432n2OPz68HIqlQyx0vwEbBvO0mxD8SNt3uLJ9c7kDtPZpbJfYjQxOSsY2LbWqVLocRtzT07AVGaTj2N0lxOR7Spblo3cFzvkkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2693.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(2906002)(38350700002)(66476007)(66556008)(7696005)(38100700002)(6666004)(4326008)(66946007)(478600001)(15650500001)(8676002)(86362001)(8936002)(6486002)(83380400001)(16526019)(110136005)(44832011)(54906003)(5660300002)(52116002)(36756003)(1076003)(186003)(966005)(26005)(2616005)(956004)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?imUuvKOMJ9jLvlXgpPZ9jRHqtlWrDRgchKUlxMIDcbbMb4zhdTZlpAlREknj?=
 =?us-ascii?Q?phvvgoSXRFIHctBy4aasNk3dAU+7FoL/EoJFbawD2BsoiLWMcY89VD/rTv39?=
 =?us-ascii?Q?j2Z6mdk4nW9c6/zbidvZ2JvRViahMJzWdaOBSLc992AiNjTvlQvSzazC5Fx1?=
 =?us-ascii?Q?0H4KfSSY/epA2vFchhLI3W0LKpNgdyHlaVqRwGPmpIDXt6c6uCOB7dPeteH/?=
 =?us-ascii?Q?n47jU9IWzpSV6qba/cY0O9pkF1Ti4w2+VAx9FqgupDJqiuKjA/9eOTS2TON7?=
 =?us-ascii?Q?tdvH+lSb76Kkzlzx4XJe6qB1FjWHIVZ7ycLLqMwSEgZJfFtbIMgyLJ6SxdZi?=
 =?us-ascii?Q?IRTiXzHyFtJquUBX6lK20OX/Ni410bsB9RZ0ocETx/+m15+duYpFJZyYtPKR?=
 =?us-ascii?Q?J+qp0oZiTAj/QGHcjIiqZuAMJNFckja+Ijdc/nzjBFhS/2qb7wm838tT4gc5?=
 =?us-ascii?Q?Ea2bxPhoYSrd0fJJBc1Y31JZAaj6MRSYeU8J7OX5+WfOAgSTokubM0mNV7rq?=
 =?us-ascii?Q?KOZIBhejpuG/n7FLl+loSwK42xpeSu86q7NMfqvNaC1Ls0Qt9fmrPZ5qsTCM?=
 =?us-ascii?Q?aj8zS5VqdWMra0IsBEmbYla7hRfzw+rNkR9eOER2NbGbpgNASD8DYrUj2VJ8?=
 =?us-ascii?Q?jZxvQIJRfmZKptMjJEEp1ujpNyQzWJSjx0FIwby+XzPvYFmpW4hin4dU1abC?=
 =?us-ascii?Q?gIt9jSHS2QkYqUVXJ+3aNFWn05N72Polvwlyy2AJ3+uVDkMUy2xFRVf4ny+u?=
 =?us-ascii?Q?os2/RlOOhru8BUqCAyKB2GNdqb6oAH1JWuDkN9lBmlCy/sLqc7X3HvK7diXb?=
 =?us-ascii?Q?iiDXY24cYfJeo27BX/27MV1baoUYPNlqY+jwQjbQD2bkUmVswzCMK/MZAK0N?=
 =?us-ascii?Q?yWXr0giJQF8eArpN4g8qB3rBWfPDUqDfOFXFa2BvUn1L4k7ltMJ/aYFr2IBa?=
 =?us-ascii?Q?GC2000UEaBH9DnbaHOqXm/WmDyLrgXGT0BjT+0VOf6LcfhYb1O3QjISwUFFK?=
 =?us-ascii?Q?LfIcRZMop3R1gfquuBDQcmsZnB0VB/ATOXQ9DBrduKehf/MtncVhTmownK6z?=
 =?us-ascii?Q?sGnwsTTnQhuHZ0FWLs0FEh9zgBEiaUSWc4JpVqcuzt8uXvLYagnb+0lzoEDQ?=
 =?us-ascii?Q?9v0eGjpRppga9l3vXNLwpuDOuO+i90XPzv7LwyT/ZQTgBeXfuTKVP9Eb2S1K?=
 =?us-ascii?Q?reBEg17xi9A8Dju0tG3selJOkgd5vhAVwC+yg+sBX9hVJIi0v/3bKsE2cO5L?=
 =?us-ascii?Q?P6rzCYgGwXIFTLoZIINW/dHxlbR9r29j4+RfrITeIU9DlJdOzTfzYzjteTcp?=
 =?us-ascii?Q?Bw270/mNpuOXEKmBFh1cb3R7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84210b7c-d725-4baa-e117-08d90f8d5044
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2693.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 06:16:26.2641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFqdbKfQu2Oyq6fT0uh/e6lGbhb0jS0dyzCeI/kQS3qw0nwp8g7wdkN3Ydg3t6lVdq911X4eJn3beGeJvqXSZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3366
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The XHCI controller is required to enter D3hot rather than D3cold for AMD
s2idle on this hardware generation.

Otherwise, the 'Controller Not Ready' (CNR) bit is not being cleared by host
in resume and eventually this results in xhci resume failures during the
s2idle wakeup.

Suggested-by: Prike Liang <Prike.Liang@amd.com>
Link: https://lore.kernel.org/linux-usb/1612527609-7053-1-git-send-email-Prike.Liang@amd.com/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/usb/host/xhci-pci.c | 7 ++++++-
 drivers/usb/host/xhci.h     | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

v1 -> v2: drop the XHCI_COMP_MODE_QUIRK quirk and create a new one for handling
XHCI D3cold.

v2 -> v3: correct the quirk name typo XHCI_AMD_S2IDL_SUPPORT_QUIRK -> XHCI_AMD_S2IDLE_SUPPORT_QUIRK

v3 -> v4: Fix commit message to clarify and reference HW
          Rename quirk to describe problem, not hardware
          Add definition for the hardware to source
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 5bbccc9a0179..7930edf8ebd1 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -58,6 +58,7 @@
 #define PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI		0x9a13
 #define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI		0x1138
 
+#define PCI_DEVICE_ID_AMD_RENOIRE_XHCI			0x1639
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_2			0x43bb
@@ -179,6 +180,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		(pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_1)))
 		xhci->quirks |= XHCI_U2_DISABLE_WAKE;
 
+	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
+		pdev->device == PCI_DEVICE_ID_AMD_RENOIRE_XHCI)
+		xhci->quirks |= XHCI_BROKEN_D3COLD;
+
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 		xhci->quirks |= XHCI_INTEL_HOST;
@@ -535,7 +540,7 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	 * Systems with the TI redriver that loses port status change events
 	 * need to have the registers polled during D3, so avoid D3cold.
 	 */
-	if (xhci->quirks & XHCI_COMP_MODE_QUIRK)
+	if (xhci->quirks & (XHCI_COMP_MODE_QUIRK | XHCI_BROKEN_D3COLD))
 		pci_d3cold_disable(pdev);
 
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ca822ad3b65b..4e171099d2cb 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1892,6 +1892,7 @@ struct xhci_hcd {
 #define XHCI_DISABLE_SPARSE	BIT_ULL(38)
 #define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)
 #define XHCI_NO_SOFT_RETRY	BIT_ULL(40)
+#define XHCI_BROKEN_D3COLD	BIT_ULL(41)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.25.1

