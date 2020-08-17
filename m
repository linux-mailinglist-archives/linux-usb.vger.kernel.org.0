Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E345F2463A9
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 11:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbgHQJqA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 05:46:00 -0400
Received: from mail-am6eur05on2075.outbound.protection.outlook.com ([40.107.22.75]:62688
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726424AbgHQJp4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 05:45:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZcfh/xikKSX/yqndp81nSICSQ2PDmQQZQuoXqaBM6kqLmVUSEi0L6dVru49qWfNatGRzcDTLxGiAqgOTe4AEykB0MI0jXnV7uZpbn6F0FAdpkyS6STShArMpwqAwn4DXN9Nq3Q80Kl/skx8xKo7oKXkHxbjC8PWf3Hilaz7oI1PkZTAlejBRMBlth3Z2y4nq5ClunMn/krTRsQETNnfGigsKpWldPJWmDdhzLHRi7IfMt+Zg7iIORIe8XqMj1u2qOHlWOQzIEtMLAWcgOPf8KnYoVc2jgaUDCHkGxbIWOxLbVwsLGvBNiwe6nARim9+YOFvhOOIpwIzYCzJJM0/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a21MYJG585ovaQvFo1R1pG9GmwyxlzAKPyrUzmHcoPc=;
 b=Pfw78LS/rJrFKVJHE1A5A2ONjlB2Llhko8KpuqX3+dPQt5x/WRQcTCBnit4B0+ldcJJmouSA6mGTkkNWudyGVKNCPDN3694K808vHoB/U0Sg7I6U7VppqvtOSVPEQRVU/5jmfQOxOCMwYgOnn19X8m4jVo6ZaYOm5BxNY1oPPLtEbXYqzqV9WmhGdyMfpu3yNKRaVVFJ4jpgY5R6SVseWDgqJppPYXmJR1hTSHjCwyaEeZwqLZtogTdmuCBzx8O6QflAUN9LfVlWaLxcMqHSTdz5V7Hcc5okpAIxucy0w7Hgcpkal/sjJK9GpervlcB4l08D68/mGSZwyuHqZbIlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a21MYJG585ovaQvFo1R1pG9GmwyxlzAKPyrUzmHcoPc=;
 b=aD9JtEKL3L0bN1yQbjp+Irdkly0kGMwLdm+qUGXIM2V6DTdwMy1BETuBbp6LPZDgUkljVTK4bE+/TcWAGdhtdccevEy1uBiTcIwaBFQJMoTSoXqML2vqLumZKmO2HCHrqxuEYEbH8JkMlAdWoG83NmjxaAFHduJmSq2Uh2/d4BM=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.26; Mon, 17 Aug
 2020 09:45:53 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Mon, 17 Aug 2020
 09:45:53 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/7] usb: host: xhci-plat: add platform data support
Date:   Mon, 17 Aug 2020 17:44:34 +0800
Message-Id: <20200817094440.23202-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817094440.23202-1-peter.chen@nxp.com>
References: <20200817094440.23202-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0094.apcprd02.prod.outlook.com (2603:1096:4:90::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Mon, 17 Aug 2020 09:45:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 89f03043-18fa-46b7-f0bd-08d8429254cb
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB71608E521CB4BD0BBBA544548B5F0@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k9fYMz07c1iFp881vqVHqhePwxc4doqZgAj4IHcYKM61TNjxJNTx/ThNoxtF6hW52HrZ5UxhHxeUctReYc/1AewhCLjWPJNbOb0W2mTvZ1zUuB3YSJCkrdZS2jH2ebXhyDdspbxCldUP8df6mzDKXH2S7PI5kvif/uVENKq/hCDF9STMbc4WtCEymxO1xnwLqaeFV4r/1jW+jdtO94AVo/B1aePJLxOH8IF0T0radRksEsht3ZhsVjYQVv1Dq1ywyhprpuxGeiWNIKmiB3TnJq04zYHDV5CDVjknu+tSBUbnG3OyanoEMgTEu9VvR5NkjTqc6RGLrG47slTSidPPcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(6506007)(6666004)(4326008)(66946007)(1076003)(2906002)(16526019)(5660300002)(66476007)(52116002)(6512007)(6486002)(66556008)(26005)(186003)(478600001)(83380400001)(8676002)(2616005)(8936002)(956004)(44832011)(316002)(6916009)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ZJjrM3tJXL5kQ50s6LbjFlEHGlYsXjBjAHi4oUbovAfdiLOLGt0lHudt8hpvenBAoTUKFNS5rn+ULFHn3sM8pMsvS5mkvMg0pJUBkFiePdopM6D4bBMarkrhyI2hhdhvw43UU64IDRP16if2ovEULxD61Ooft2dChZWhYFoMgN61+JiL6Ug4SFjo9nILl/mew5Q1ehe0ll+su1pS3dVDq3soN1RoIxq9g3I0fpV0lXR41FEq3BhzJllUYPleUVUDW3HjwY9W8EsUANRD7U78D5VvlsdEgfBMkEGF7zUXQRJp+TD4EL6bHLxpwM88NHXA4VCAN/pPmb67wreMeIM4Lr5YAB+yQ7QLgxBi+dskTteBo6wO9KJ/dLsw6QZKyAMpvpg8FvgleGO0vJKQZQE2J31V8QSI+N+SUUz5DvYX8uL8K+fBlYHTDz6Y+o5B4Fyf5D7vrGJRSW0vlbSSlqUp7mslIt9So6CWAjgmeWAWlJ3Yh1s/owG2wE+G/DxmaPlW1uNd96xkUaG2Wrap+GbAiVNxx699wz0H2VxcMz10Jx4LKn4WjVEO90R+lDqSwGImWzqlxImKw30QMabEKXQc39QgCqVPvtw/3yfR9tBRFOZhYLxFonybbu5EAmMbliYCScpmT2z267DwISLsIOfAxw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f03043-18fa-46b7-f0bd-08d8429254cb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 09:45:53.1690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSe5U9ROwz8vKKVQw+oqyITt7If0EI4d9NmsKgAyyxzaTdwEW+qIzPPsocFepRx8fUPz6m2qj/3MeU+fo4Im4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some xhci hosts (eg dwc3 and cdns3) do not use OF to create
platform device, they create xhci-plat platform device runtime.
And these platforms may also have quirks, and the quirks could
be supplied by their parent device through platform data.

Reviewed-by: Jun Li <jun.li@nxp.com>
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3057cfc76d6a..c7f98edc5678 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -264,7 +264,11 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_reg_clk;
 
-	priv_match = of_device_get_match_data(&pdev->dev);
+	if (pdev->dev.of_node)
+		priv_match = of_device_get_match_data(&pdev->dev);
+	else
+		priv_match = dev_get_platdata(&pdev->dev);
+
 	if (priv_match) {
 		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 
-- 
2.17.1

