Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A74C311694
	for <lists+linux-usb@lfdr.de>; Sat,  6 Feb 2021 00:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbhBEXFZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 18:05:25 -0500
Received: from mail-eopbgr680075.outbound.protection.outlook.com ([40.107.68.75]:31814
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231681AbhBEMWH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Feb 2021 07:22:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7VJSEHr/C8LEg0wvB0Fr3NX+Tbo+/YJ3V57NAnPDTR25pr+Xp/ylRSHcGKhZPfozej/F3qbpvd/CtaYLz+VChNrPYG0XCDt1BU52TLQSXRsyDOrv3oM5UO1ux7Ontcu3f7TfguSDflbBcQ2un+38UEZg7LsJ7ONme1l14FALpfXV2H1QGELho/jrTC/MZHSuYGsBsIdEmeULWaoTCvR/f5QYP8Mne6c007bTq04St7nNRLRmDYciO6IVDiUdblTnxGidQk+IKCTzx2Cx0OU4fepQf/Dr+VJ76c6GzynLG6zvKYSkZUTloBrRPFpix6uEJ0ydHkfI2I1tgQEmnV1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6NnOIoUq36KEG+P73W6hePfFVyPTnhETTA4kIyXqTo=;
 b=RscPTXpxxvKgUbfU7b5KIEZrWMHV2xjqGQnYrCWWYHq39NUqiao8EfnkVLrV4QwY0d6pu0NT81zs3fNTwJ5xG0BtGvSTn8WoO9Y/wU/4qxfPYl1RLJTjFgV2yEEYOQKmPzQHsbE27+toAcMBTvnP3cUMnZWli/sVrwWp90CCTyThcgLHrfwn0Opc8fmoPgAwql/N0HcjEkmE8/CZstet6/hJ0RnafY37Dt3IZfzIL4Xu/f2Tggx4E2TZBGNKRiA8N0t886XdpTmF9Q1XA3DhrA/WSqAtjzkQLvwrkH0C2oagFQlMg1WUe9IDimpS4S3sPCDItBnx9cbjZoaxg+wlzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6NnOIoUq36KEG+P73W6hePfFVyPTnhETTA4kIyXqTo=;
 b=tCNYsda3667gVlpVhC3MeQlMPgcVP9ippsy7ngXXq6TsOo08mkqvQ+oYuYgGGGQ0cam5V4nR/R+K+6nWfp0UKrssfiFdJx4ZOcSDDLm9vGUgebK69Qhc+lF4Ma+kuLDkiIMRXcP0mW9K/negwGuUSt1ZTr34o9nd4PxTVIhA27o=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3238.namprd12.prod.outlook.com (2603:10b6:a03:13b::20)
 by BYAPR12MB4631.namprd12.prod.outlook.com (2603:10b6:a03:10d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 12:21:16 +0000
Received: from BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16]) by BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16%4]) with mapi id 15.20.3805.024; Fri, 5 Feb 2021
 12:21:16 +0000
From:   Prike Liang <Prike.Liang@amd.com>
To:     linux-usb@vger.kernel.org
Cc:     greg@kroah.com, mathias.nyman@intel.com, Shyam-sundar.S-k@amd.com,
        Alexander.Deucher@amd.com, Ramakanth.Akkenepalli@amd.com,
        Jack.Xie@amd.com, Prike Liang <Prike.Liang@amd.com>
Subject: [PATCH v3] usb: pci-quirks: disable D3cold on xhci suspend for s2idle
Date:   Fri,  5 Feb 2021 20:20:09 +0800
Message-Id: <1612527609-7053-1-git-send-email-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK0PR03CA0110.apcprd03.prod.outlook.com
 (2603:1096:203:b0::26) To BYAPR12MB3238.namprd12.prod.outlook.com
 (2603:10b6:a03:13b::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prike.amd.com (180.167.199.189) by HK0PR03CA0110.apcprd03.prod.outlook.com (2603:1096:203:b0::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 12:21:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: acd66d4b-8465-44a6-034f-08d8c9d08905
X-MS-TrafficTypeDiagnostic: BYAPR12MB4631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB4631257FEF1C5311E2E6CA48FBB29@BYAPR12MB4631.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NjPs828dE01aHOmX/t7+ZEq0NBFslQe19eHpkfAGk2/CZG/orZv1NIIKYkclakHaR5Aj5LrepOBoRx2FdMszl08giC7A6Ar2qViMORdL8nbP/LEhEMX+U6wi0LwkqBWlDDZjQeUbnkKHnBhtpNIp+ZfOsBagcBW3SW/we7OHIszbRPIfUiyifS9n0b3Gx/YAF6Ec7IqQ5MmvUeiaGAeEwOLyJeagxae8ImkwT5arQ31VmFhvauOg0RqVwnOMCNPYPasLnz1U0g1pumKrhV02Wyi7YXZddZYqcOPcebcm8+enCTNRwSn19UNun98sqCeVxXYOjliJp21mqLxnXAyQB68sQHMKY2s1EuIOCIQOQm/jgnNTU8O29K/cxHCZ4BA/fxiB2IcrLx9AqDOYDWmKuOFzrQ+oeFnfto79ZOhNBRmQlwRoCWhrCywPi5rwvOMfhYgjxFLoE16EE2VJsbE58XGTI9J+JEz+gHsaEU0nrCTGbmnUVADt/3VcY8oxi8u3JXvN41ySRQHvyeZUkpc4IwdyICkKA6zXDjf+WvT5UJY7rZLH2YG6sM5bsMkiAlVF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3238.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(956004)(36756003)(6666004)(86362001)(2616005)(316002)(7696005)(478600001)(66476007)(8676002)(5660300002)(66556008)(52116002)(66946007)(6486002)(186003)(16526019)(2906002)(4326008)(8936002)(83380400001)(6916009)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1EcmbJ5bxiDeiDExdzp0j1+Dmjso/1bQq7Lf3AuihHUV6s4ntXemjMXQv9pt?=
 =?us-ascii?Q?EebzOQUqlb+5rMEatZYA2VVGkZpl9RN4OCjmE74B8OHsQnzj9N9+toCAjL3F?=
 =?us-ascii?Q?kERSKXjObIbNGDaSIjfxwAkkUXP5quglr8NhzEPMnLYCSFf9aHUHv4ZbZYI6?=
 =?us-ascii?Q?j8BW3J0OGGjeDSBbw0RBEWf/nu/5AWTglfmtsVcD95zh1WdB9RGH3pKwGtw4?=
 =?us-ascii?Q?+ILRExoZBiYhQQXNeBx6uAyKZnyIrxW6DRsELG0YAO1Ycvr4raY4vfzkLYiE?=
 =?us-ascii?Q?Rb6hS9tHnTcISwF6XaPPvGaqbfzgko6T60dEXvURZD/U0kYHnpaXHqTDe01q?=
 =?us-ascii?Q?ImtSTmk1g0AKrdK7OPbAj/DVJew3Aa8/QMZpdU6J2CAbyBrGF7MrWrBHvM9x?=
 =?us-ascii?Q?APO5dzvEpfzu0j/+wndtl70s8Thjr1yhFWjv6y5HW1Xs7zwuzIx8RcJ7PDmq?=
 =?us-ascii?Q?9uxKdtCS5xkKTW7eT+PbWycKTEk1LDQ0bZFOjwG5C6H/sxJCm5S35jL7PADe?=
 =?us-ascii?Q?7OWiRKYHREoV6FrqfkgOavT5wfnxn7Vp16pFnR7jrP+ntc5U4Li1U7EFxG72?=
 =?us-ascii?Q?ThdNYWx9ccjDiEcX9rw8vpZ3SPQZP+cuA8ywQTXsxhnnuP4nfhAPielOyuGc?=
 =?us-ascii?Q?ptlLFbrAYUh707G++bNLC8dOWQ1upqbmnwagT+9pWmMcruYkL73xJvHzP+8f?=
 =?us-ascii?Q?9UKR66h3hgXyuIVFVd5H1NWeQbJBi+yivsbWOj1jDYLw7x3nS7UBflKv7Wkh?=
 =?us-ascii?Q?rqAsf7iVMMoB1C3yoQdfKUxSKreAfjKUQLt2rDspyR9EcXKXA0bvrIHUtTXa?=
 =?us-ascii?Q?P3oi7hr3FVwGqNJxCJ/yjfQLhpASpG5zIP1gP/ylNMiYGoGa55waroKj/YQL?=
 =?us-ascii?Q?q9RE20SzTqh49cy1QhCGZFwXPpd47yMLAVI2eCi/WJbJbt31FgO3LyiF+DBp?=
 =?us-ascii?Q?yBm1SDj+v707JZLRdAbWlSjB5P7RKjHJ4CcvQUrG5qPswJ0cVvUJGvUTqHkV?=
 =?us-ascii?Q?Lhl9l3ZZ7qVtYA7y2enEH/5pBDp8yan+2Fc9B+R4O8temxHPm6Ev8KkhcEKX?=
 =?us-ascii?Q?1bRcEmk/AcD1JqP4PGyRaN1WaA4M8ISgR3z/b/VoVPS8+ygo71JxGIHC5wKy?=
 =?us-ascii?Q?w7V/FJ0jFrGdRnbNM41OeqlTBa58NUWUZ133Fu5PGMeILPLIMncxxbtnPfbr?=
 =?us-ascii?Q?YEfqiewk6eR24hivwg9Q11g3aHDzpue/B7/79Tk0sP3TnaAZEGHnQlX9qveU?=
 =?us-ascii?Q?1iLv1wcVgIDKmXDYlUXPUDV34QUEgh8sWZ9x/fDjVPgU7o1vrtm9VSLJuCjQ?=
 =?us-ascii?Q?/s+JuABvF/rrmghD9AhdVHN9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd66d4b-8465-44a6-034f-08d8c9d08905
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3238.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 12:21:16.4931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qX+S3tW/RspYdBWGdhmy6uU1oEGvXfSybC9v7aJ7I3ymkK8ab/WNPo3oJZ2VuDX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4631
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The XHCI is required enter D3hot rather than D3cold for AMD s2idle solution.
Otherwise, the 'Controller Not Ready' (CNR) bit not being cleared by host
in resume and eventually result in xhci resume failed in s2idle wakeup period.

v1 -> v2: drop the XHCI_COMP_MODE_QUIRK quirk and create a new one for handling
XHCI D3cold.

v2 -> v3: correct the quirk name typo XHCI_AMD_S2IDL_SUPPORT_QUIRK -> XHCI_AMD_S2IDLE_SUPPORT_QUIRK

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/usb/host/xhci-pci.c | 6 +++++-
 drivers/usb/host/xhci.h     | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 3feaafe..6cd27b9 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -170,6 +170,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		(pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_1)))
 		xhci->quirks |= XHCI_U2_DISABLE_WAKE;
 
+	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
+		pdev->device == 0x1639)
+		xhci->quirks |= XHCI_AMD_S2IDLE_SUPPORT_QUIRK;
+
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 		xhci->quirks |= XHCI_INTEL_HOST;
@@ -500,7 +504,7 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	 * Systems with the TI redriver that loses port status change events
 	 * need to have the registers polled during D3, so avoid D3cold.
 	 */
-	if (xhci->quirks & XHCI_COMP_MODE_QUIRK)
+	if (xhci->quirks & (XHCI_COMP_MODE_QUIRK | XHCI_AMD_S2IDLE_SUPPORT_QUIRK))
 		pci_d3cold_disable(pdev);
 
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ea1754f..ca69427 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1874,6 +1874,7 @@ struct xhci_hcd {
 #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
 #define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
+#define XHCI_AMD_S2IDLE_SUPPORT_QUIRK   BIT_ULL(37)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.7.4

