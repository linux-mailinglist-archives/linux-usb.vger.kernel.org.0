Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6062FAE6E
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 02:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392592AbhASBu2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 20:50:28 -0500
Received: from mail-bn7nam10on2089.outbound.protection.outlook.com ([40.107.92.89]:63904
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727788AbhASBu0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 20:50:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHiFGnQqsn59G7t6SX1kUnFxZIsJFIWn+T6S8wVN97ePKnUQXZt6vTAkEa4/R5NKrAIMeWaMawwSFqbT3ZOSoi5vorvV2MC8H2lCePjEwq7/kNlo4GZsZUnErebDjDdGz39Ackwlh+ryvBFbEV1frDuDiOZxbGOw4mPpyXMLX2cn+E62ZMPYQxvL1X3cCkA3Qv3VSmy9hCrJ5ojy28OZvW5v0feCEsrwbtE3rcCOOLhKDNkGc1QQ4hWnVQIUyX1epZoer4uLiGQw346cv11jBNPae1GSHB7W1Vwve5GtWwsPeXLJhYfFls8gxT37achyrSHJjIcBL5ch5ami49//zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucmcrR/BvAFCJmilkkCqHpVG4EPaLMVLt5cy+1y+DOI=;
 b=H1tyvn2YrPOpKYWiKibhlyXjzQmfPtmxT2qvHV7fuFn0JSiKFXIksvQU0a66vj88Xawrnn/cOHj/zWi/oxdCiR/26BJXwVckQCg04eBOoBGoPg0jDkU6gDNZ6wAcn/ypPyPK6MP5HI5d4RYLL7PkP/HLZEcmdVM7kpCrPNA15XmGmOOhfhYsSaPkOyZ4Ehd8QJvtIxsXctwxwwfZvKJaUgyGg6mIY8+Hc1N9VJ5F6hw3n8lED1WEdwurlJm3cSoaBvLMhGmxlYD6toC6zeUWuGfLgI9nResshEuLXr+MyuWo03G5gzPlGBnB1zoK8sDJQhBppfYF8M5VjSB8NoP4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucmcrR/BvAFCJmilkkCqHpVG4EPaLMVLt5cy+1y+DOI=;
 b=s4xczcwrVlp+CNyUAprrdM7tVrfcCga1pUSLf/xX4aP6HdaTaKxR98k01/15un6A++gLSGPsOfFCd1jps/ccCvvb4HtN9lOcrNsQSOKbHJnfDbWJ781MJkw4g+O6DYwSHRXTBpF77Qte4UQ80dnoAe50WBwce2Yfvo8xcy3HY0g=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3238.namprd12.prod.outlook.com (2603:10b6:a03:13b::20)
 by BY5PR12MB4274.namprd12.prod.outlook.com (2603:10b6:a03:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 01:49:33 +0000
Received: from BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16]) by BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16%4]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 01:49:33 +0000
From:   Prike Liang <Prike.Liang@amd.com>
To:     linux-usb@vger.kernel.org
Cc:     mathias.nyman@intel.com, Prike Liang <Prike.Liang@amd.com>
Subject: [PATCH] usb: pci-quirks: add XHCI_COMP_MODE_QUIRK for disabling amd xhci D3cold
Date:   Tue, 19 Jan 2021 09:48:44 +0800
Message-Id: <1611020924-17178-1-git-send-email-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2PR04CA0085.apcprd04.prod.outlook.com
 (2603:1096:202:15::29) To BYAPR12MB3238.namprd12.prod.outlook.com
 (2603:10b6:a03:13b::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prike.amd.com (180.167.199.189) by HK2PR04CA0085.apcprd04.prod.outlook.com (2603:1096:202:15::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.10 via Frontend Transport; Tue, 19 Jan 2021 01:49:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 470c1309-6dcc-4c62-e677-08d8bc1c77b5
X-MS-TrafficTypeDiagnostic: BY5PR12MB4274:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB42740CD4FC5FBE724FDE4D18FBA30@BY5PR12MB4274.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gfFQesig1Je3AcayUT/lilH9kGqCr8z2+17tEHmarxyymXw0Zjw7HLkf1vs1B1i/lu3KyE+ZSUBSYggB4/IEBIFd8lKMImy5QRv1nQN7lWQcMG/qEwowzPu78AHTp2YBcMF6KVAS7PtFwmDBno3nG5pJh0QShHaE3nL/nZsT7AY2DumbbWuOP+uNQIpPG5eegiqZ+o1LS1b055O9Ksyb5Jph6KK6Z5RmckXgsjv375W3rWL/v2fomIUZVL7vZxstU+mDkqd012DeBX8aJO/DQI0QBf19tFC3TsQuo7zbCah5rpiNnitqpT+DzPg1jWdzKXOLgsUQj0/AKeshm9Qy6Zj61vVpvDQ5dnKnRuMvoYE8qyiEnghjlmwkb92EeysTW0g2p7SYmX31KSWuEZwy62sKAGVFm+AKkaNC9t3RjAjfibuF1IWU88fztXRYHKbt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3238.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(52116002)(4326008)(5660300002)(86362001)(83380400001)(6916009)(7696005)(478600001)(2616005)(316002)(6486002)(66946007)(66476007)(66556008)(956004)(36756003)(16526019)(8676002)(2906002)(6666004)(8936002)(26005)(4744005)(186003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MMd5MDmMMUBvOQH5AJj0FcDPKnuGNn+88znt/uADTKO9OExZ5+JZZGF12eKV?=
 =?us-ascii?Q?DXNiecSs1H24bW7SmF+Y/nenqMJUw23J+SbuAVBNUQpFwGZ+mTf30rCtM+d/?=
 =?us-ascii?Q?+0+9zcCP361fFiOQ9/gIoeYu0ocPRriIv1CDkjGXneIcoKe70pHqvi88XqRt?=
 =?us-ascii?Q?ZarKm/Wx8AHPCzoMFDlJCkEdZWJ0ibpdN15ICEWO2z3r7vulC7yg9b/kTd1l?=
 =?us-ascii?Q?/IOHEV56IY+QTnK0AKKHg4CveR5+mAXNeq4VGygM73JqUxFlKFiVNFUSy36R?=
 =?us-ascii?Q?vqjiI/wg90qNJsarqYopCOBmKni8cYjwuRUSNJVZsBEWlY8zWdytdiOKO0TF?=
 =?us-ascii?Q?8QbILyhofqjuGX89Ja4zCoH/WxHqiUA8gRU0A7b52aGrpyL1C3NY2Dg3A3mi?=
 =?us-ascii?Q?ioXZ+sFK6pPq6jdKX0w0Lt+k8xmFUYABO/oGs/JnzqN+Bk55hMcH/6psPZUY?=
 =?us-ascii?Q?MHBt4UzU4Z5uV8EUndnr6/FtM0FkjmT9gQ9nBrZZoY8TVyMsIr8DzHV96rIM?=
 =?us-ascii?Q?ouL+uQ0QQR5xATAycKro14O9J18Q3psY+KZzX5gLc5DVNz8CTXeGiVCb95iw?=
 =?us-ascii?Q?otsql+d0QkomspjcT/gi8TCZ7vZvfL8xK3K8P8durMHmcWxEEDosDOnUJHsw?=
 =?us-ascii?Q?DkpxIzhGC7JQu6Nke4JiE9QUhtUnlzvTneEq2v4SwXBbgbb8sa0XMnrLSoWe?=
 =?us-ascii?Q?dcO5rz+Dx5d8+WPBOpyIby0/Upv8ZgNdFD44ycGybtLqnUCxavz/4OGzhvjl?=
 =?us-ascii?Q?aXMNAjGKeb+QW0vU6Lm1qLj1B05nyP8v7QGjKdaapgXA4W7gCSgS7sK7FJhR?=
 =?us-ascii?Q?yH1deMFzAO3N4l6l3wo2NEwLkEKXKG+dq95rUy3p7X48iFAFzM0TTcn1PiFs?=
 =?us-ascii?Q?sBeLNHrQGOvqSSvPxyJSTQjouFcoAI9fRjhG0JYVANP9zr6skurxaXWVT1gE?=
 =?us-ascii?Q?X0LOI0oRgRQ1UO993fL/5m4xCW1p+Fqg/DPiTUJslhXubUEyb+aKHlj6+dTa?=
 =?us-ascii?Q?GdZo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470c1309-6dcc-4c62-e677-08d8bc1c77b5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3238.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 01:49:32.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhddEdCIYlm3v/7rQItSsmezV2B14J6SDAFZZNNnai9cOGDoFGnimIWAJT/xSxzB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4274
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

During xhci suspend some AMD USB host will lose port status change events and
need to have the registers polled during D3, so now just avoid D3cold.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/usb/host/xhci-pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 3feaafe..bff817a 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -170,6 +170,11 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		(pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_1)))
 		xhci->quirks |= XHCI_U2_DISABLE_WAKE;
 
+	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
+		pdev->device == 0x1639) {
+		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
+	}
+
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 		xhci->quirks |= XHCI_INTEL_HOST;
-- 
2.7.4

