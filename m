Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C6A3932C7
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 17:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236883AbhE0Prb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 11:47:31 -0400
Received: from mail-co1nam11on2063.outbound.protection.outlook.com ([40.107.220.63]:30944
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236975AbhE0PrY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 May 2021 11:47:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLIDcw0Veq4nvk7GZ+YEh3v4GGPE1c6dh8xpe3aRTjTlO1DT7RFDUxoW25BGN5RsvEhqJ9F9t02cHa6JDGHfstLRSSAIaIb3vUQWptUayMqm2Aw+bMkni/ctcAwDp0aClPOhAt3+n5mIVu6EU9xUg3QSjyDwwNPk4JeflTxQYvqNsOayo7frpwN19LIht5jTCGlDyyExSaJSUFc4sGeeK5b/xEUoDnrujI6drIbjDVy0h5TLgZfGNKNoXKxMKZIWty5/madzLVkKyucSqa985mYkTLS816zVSmAy16jagN2lN19LwCgtbVJnfriS3F0vzYV+DC9NhAH2MBItDJ5qaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Sg35WxRLRhG56CMR7XWiv4iwwx8oBI5fsr9j/H9ayg=;
 b=mSt6szJ+rUCf0sjeX8eVFqWkycVA/Uwcw4M1tQngMO1Hk3liTQkzpwxgv5J4t3+fnBp3JMAhSax13KHERlaCmfD6E0lhfSoJwUfXWaXnEH+VmcUtrSKoPpnwb5BVzv6o1KWPbcg0uiC20JWtUz+D7LgydjOtwcX5qqDKbw6wbbk1hZfWq3jtf5o+aZGob8CgZvEhqj217DpoB7Xld9VqXXn7zh0YUILI+XmgosMw9pe9uEAjmdu05j7sRSadDEjuXbPmOUk40GP73qaSBWDQxwBLcakYQ4oZkCylUp2fPkhpC9f3ySI94j02Y6MnemdJtVAC2YKEPMVG1wdx1djWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Sg35WxRLRhG56CMR7XWiv4iwwx8oBI5fsr9j/H9ayg=;
 b=YB/m3tWFvdnBYPIs0aG5JsDq/msF8JsGZcT6NDSn7rl1/d65aSpXgP7neCVOg3vCC9nQo1I5/E30m+cdwZHE71F/ekMphNDtPLgfeqTUrUB99KUrxEYiNve6GaPhuCWd17uQCfp9gTpI5qPiEFucyzqHPveHLImKb3xcL/jar4w=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB2693.namprd12.prod.outlook.com (2603:10b6:a03:6a::33)
 by BY5PR12MB4872.namprd12.prod.outlook.com (2603:10b6:a03:1c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 27 May
 2021 15:45:47 +0000
Received: from BYAPR12MB2693.namprd12.prod.outlook.com
 ([fe80::c0c3:7247:a767:f5b6]) by BYAPR12MB2693.namprd12.prod.outlook.com
 ([fe80::c0c3:7247:a767:f5b6%3]) with mapi id 15.20.4150.026; Thu, 27 May 2021
 15:45:47 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org (open list:USB XHCI DRIVER),
        Mario Limonciello <mario.limonciello@amd.com>,
        Prike Liang <Prike.Liang@amd.com>
Subject: [PATCH v5] usb: pci-quirks: disable D3cold on xhci suspend for s2idle on AMD Renoir
Date:   Thu, 27 May 2021 10:45:34 -0500
Message-Id: <20210527154534.8900-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.77.11]
X-ClientProxiedBy: SN4PR0501CA0110.namprd05.prod.outlook.com
 (2603:10b6:803:42::27) To BYAPR12MB2693.namprd12.prod.outlook.com
 (2603:10b6:a03:6a::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (165.204.77.11) by SN4PR0501CA0110.namprd05.prod.outlook.com (2603:10b6:803:42::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.9 via Frontend Transport; Thu, 27 May 2021 15:45:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f0925f6-9b71-46cf-be84-08d921267eb9
X-MS-TrafficTypeDiagnostic: BY5PR12MB4872:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4872439FF93ADE6F3D77B1A4E2239@BY5PR12MB4872.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2TFC8ZRoQyzqf6iGfp93PABNN0knYQ4MvivGrDyqI/5z8ZLuaYvOfQ6jm9Jhay9vurs4sGZfvCqHAehs9kPZENXhUZVGOjleYtkrZepftTrajpjw8mPAB7t9iTdi9CnrT1LDcECeSKiSw2iPCxaueue5CYWtabNLkJRTJ+0gS2MsaLG7TH8Qs47QvAD+DEVKsFLKE4bnsA2TlOLlGHzSoxQmQ0sqaKg7Xnbv/DMDPPoBZLf3/kCUyMX3XMiu4uNETwxvvtbTrFE/bJbL9c6cUSOOn6nICjkjqGHkdn8ExTqljg9IdFsxM2nexoxWJKjb8Xo+GHLwYozO8G6XXE4laQEcZCte6EGEWOfoxZ8sRfGnR5pssCghhClGRXN39Iu7v24WQq5WTd7Xqt1q3lP7h1/ie3VXGBHzYg591jfeImBuqYeh2+JvYkf1D+lyD3aVUMs8lcDpfdCgy3NfVwkHXT0J93b2KJ56vbi0/iLYatOUI8WCuSdTgCuusAzkhBWI4vTkXiKAS34/XxBs77jU//CQ6ag3yVxI2CooSQ2CNEeUjxYZepjDZf63qsuLVMU8Jqie9df9uhiWIy8W0lIRzs6jsiL541w9b0dJycCNBF+CNexSICvGYsWp+9ZS3gGZD32B3hpgOsVmBiFEKVEJsMYAFufdXU+LfsNQd22YbiFabdaoveNkdg8CV1pNcJFTJw0KhrqfV1ViIPfH7/Z1quLtZzqCDPIND6778Ih7LCNAICbA8cmVftBahQcZ354ghxaWfF5dZ7QZ9fxNvNSaPIMrKaROOgXdYqa9a3zQ5rZ/WMsdxz7laSi27zOwyzd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2693.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(86362001)(44832011)(966005)(8936002)(38350700002)(83380400001)(478600001)(36756003)(38100700002)(6486002)(2906002)(4326008)(2616005)(186003)(16526019)(956004)(1076003)(316002)(54906003)(6666004)(66476007)(66556008)(66946007)(15650500001)(5660300002)(7696005)(52116002)(8676002)(26005)(110136005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ti27d/0B+1+BotRiflxdBHSeV1hbJHLbJhq+5hYXBqv/p/3bRfn8sUwqc8px?=
 =?us-ascii?Q?hj8PFEq5/hFk8eiM7QG1V+lZghm+rczctkdd8pD7sLgogrFKYuprIFAJwisC?=
 =?us-ascii?Q?io7ra4niX2cXtkp2fUj9hCnWvrRQqu9ZSWShVesfiLDaARD/yQi2h7O/4BWd?=
 =?us-ascii?Q?/F9Wj5SzDX05xGXJpsghZEH7oX3+mNgkcra+yRujemdB1rxxKwRrW//SSFfk?=
 =?us-ascii?Q?NKyBv3vbTO8tyxRi73QXgHxBBFWVTM2T0gSJ/XXNMa6uJLQt4rl0q20Va35v?=
 =?us-ascii?Q?aHcjqrlp37JQkw5c1nxpt/2uQmfoYiwvU492jfgeCs3k28X/z5SByLrQT7rX?=
 =?us-ascii?Q?/QtuwtwyUstcqLB6oAOOxSLN+SGFQ+ckJdIxFRSMH3Fyp66J2zqIzdPVYhM2?=
 =?us-ascii?Q?wULmaNrhWBE7p+l3n4dL0sJ9ALP+MZKn+sZkjSpW+arCM6+GtwFhoJVh25vM?=
 =?us-ascii?Q?8iUTU4rxwqEghHLlQ+qlnRLmMLC+ksFpvxjGU6ePNs6uu4dLcuAWS6s0Dnsr?=
 =?us-ascii?Q?LOnFckUPYXT22ZEnSzrUrqD4CPx7vBzOR29y+wuQ4CGH5HsAjJbZEoysABIi?=
 =?us-ascii?Q?19/vK+kW69Ea0Txqh6YWuFHEBIsQfAW3tdjZKtr05KyFXnOY7cUn3fiwT1Fe?=
 =?us-ascii?Q?thNafenozv1mAVepLWkOrVEPTcvwjEHqP0jRLuicXuCFS1hsu4sbB/T6TBfP?=
 =?us-ascii?Q?8bN6UMyeR1Yk5GO55xl2pKPGKzVx+nZcf7+B+YzLmCLfN6P3A7dY+3PLo4U7?=
 =?us-ascii?Q?dVO6pjs+KPeSEUDa8P5OXs8MCFHC9xOpXJTq3Fy7gFEy379veYek3qIpSVP1?=
 =?us-ascii?Q?Qya2W7QZzqPlvb4hZvU9wLgUheMNEhhWj+gWhcfYwKFCSMwAhArA8y0ynlQR?=
 =?us-ascii?Q?I9E5b7WnXHFlWFvQ12Jf+QZvivHe9FPD8H+J2iILdkEniFJsX8W1b3j3pSmj?=
 =?us-ascii?Q?Gxe9SmWPxSmgtq5SbBbSoLSIkc9YpFDznMcxwgDxjoF3P9t6eQmDboy0Bs/j?=
 =?us-ascii?Q?AQaihStP1XGE54kTvQsFnPAjhK8X4w2euiNaHJoNIuYaYo0sJNTnobEqDLiF?=
 =?us-ascii?Q?Ymu+/lpYibWmxvGST5yssx6zacSWDP/GZCh/ESyxJs/Q+7yysdGRTYlvmMSP?=
 =?us-ascii?Q?Dkt0qCcbXOZZ7cO08Dtr3PszJRX1B7J9SiiVBMvcjrXF89ls1tJCTEBQ5VcZ?=
 =?us-ascii?Q?zNmvytjj8hLhFZOlxi7d+i/taugas0uDQnAA0aYzKl0c9MX7/1o31WWXyOlz?=
 =?us-ascii?Q?HLZzKuTTMUyMt5BkD+1RiTGarjIA2M4Y9BKGQ9VkpQ/SljIM0T20nmWG2iSJ?=
 =?us-ascii?Q?kAbn0scY1pILssSot/wg9+xK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0925f6-9b71-46cf-be84-08d921267eb9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2693.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 15:45:47.0490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pvIL7EtQqc/wLZFf6rDszpy4GbDttWTG9cQ+fe+Elm6Tx12gL27nD8SLZuGW01aiXhuzZjg5Y6/bpOOP9RiKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4872
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The XHCI controller is required to enter D3hot rather than D3cold for AMD
s2idle on this hardware generation.

Otherwise, the 'Controller Not Ready' (CNR) bit is not being cleared by
host in resume and eventually this results in xhci resume failures during
the s2idle wakeup.

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
v4 -> v5: Correct a typographical error

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 7bc18cf8042c..18c2bbddf080 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -59,6 +59,7 @@
 #define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI		0x1138
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_XHCI		0x461e
 
+#define PCI_DEVICE_ID_AMD_RENOIR_XHCI			0x1639
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_2			0x43bb
@@ -182,6 +183,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		(pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_1)))
 		xhci->quirks |= XHCI_U2_DISABLE_WAKE;
 
+	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
+		pdev->device == PCI_DEVICE_ID_AMD_RENOIR_XHCI)
+		xhci->quirks |= XHCI_BROKEN_D3COLD;
+
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 		xhci->quirks |= XHCI_INTEL_HOST;
@@ -539,7 +544,7 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	 * Systems with the TI redriver that loses port status change events
 	 * need to have the registers polled during D3, so avoid D3cold.
 	 */
-	if (xhci->quirks & XHCI_COMP_MODE_QUIRK)
+	if (xhci->quirks & (XHCI_COMP_MODE_QUIRK | XHCI_BROKEN_D3COLD))
 		pci_d3cold_disable(pdev);
 
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2595a8f057c4..e417f5ce13d1 100644
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

