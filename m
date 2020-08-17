Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFEF22463AB
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 11:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgHQJqh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 05:46:37 -0400
Received: from mail-am6eur05on2075.outbound.protection.outlook.com ([40.107.22.75]:62688
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726324AbgHQJqB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 05:46:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIbBn1uPnuT+QIjc4Hls8X1PSxQ0vFuhUTw68zl+NkTm+HJQXmlRAUG6kb6AO7yXwIrIi9TNB1Re9hqgZDm8UjdlbHZVvrNT0nfQSvdvSZVawTx24ght1vvB4ZERJgm3z6ZMmh4pjjkwXClUUEWiXs6WfmagtkUdvxalXoc1MTYgxJw86j893lExuNMwzj/djeH2v+NheD1n8J4hiHXLMj68R9elDR7AAGaK0YsitCx6oY2SixMEL+9ZZ/E1U+nA3eyHKrPe8JRvE8Jk98w3cZaJ2zR784Xi9HYbWY4o3zrTaOblMITzhBu+cfPHnkGmBy3pEMq1xPCaxpxyQMrkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spaYOvH8F/9QH7WGZtpWwXsHPxLiYcpIsu4YuOb9WE4=;
 b=JuX4GbgN5ztO+Ai/fQep8U4U8YNZkoLq5Ig0P0HHhCWIQAbdONH19wZ4lXk4gc1pi748iwVo9H3DpPm4cJcZRfHCn32mb2grVaFEkgMpBwSWFYyfE16tPss9P/pGmUKCLPP9VyKOf4VZBXEn7Q1hDs7ZrqZw1KOYS1hV9Y5kGGTWlR2pTLIIIUxHveZA7+mPCzPeCLW7tqh0CVl8jHB71aLDcRv27hiuc1XwSgjs0gXB1NM/jrcWpdJt0RaaygB5vg4Ws815MS9efv3Z7FWErqk/mLgVhQYMvazhsENxfJs5ppwWbDq2MFcmsCqJOnfcFhepCbipS/CPe1MW9cp5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spaYOvH8F/9QH7WGZtpWwXsHPxLiYcpIsu4YuOb9WE4=;
 b=FcdOCpMscsnZm/SWh3P3KQAlqTDg1oGYmTXraU0JOwObkLrwdNJkYzW63AbJwm1eDhz9Uvp42EK9sSotuJcdX2QoxcetDGBzvqOc31Nvov/bAtBIAmUp1vYkojQYH/NhCMyvfRYkuLyg7jVw69UOjiRHIEMtF4WcZ6gCukNOuAU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.26; Mon, 17 Aug
 2020 09:45:55 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Mon, 17 Aug 2020
 09:45:55 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 2/7] usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
Date:   Mon, 17 Aug 2020 17:44:35 +0800
Message-Id: <20200817094440.23202-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817094440.23202-1-peter.chen@nxp.com>
References: <20200817094440.23202-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0094.apcprd02.prod.outlook.com (2603:1096:4:90::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Mon, 17 Aug 2020 09:45:53 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d5ffb376-c152-446e-69f8-08d842925631
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB71605110690FCDF18DBC40498B5F0@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UmAXGo5qqDFEx2TbufJqxpNalJki1G9AUIBK2yDAtbLtiW0RzuPR3dtQxP1QprGGOFOMZXCv5sVAJ+cuKnJ3TefFfs93MiNGt4tIAEz/MuSHH8ckEft7dUUQ6LFsTUdpeyYPPCSv6o1TlDN3HlSZgIaKsD3ecSqBC6/MBtzTPRjdKBRhMEYCzPBh4eAAIaztLanI3f46kAxk2JxzzqIezEBYoGkkn1i8g81gWpYuDgRcNfPU/ERKCL4KSXr6/P+r4yddBoA/K2dPEGADCIlksCJKIimTg00whEA9B3hnAHOCwwbknSgJvWn+XmOpqHamiJOlwu1M/9fxMFF0FF/HSSR33iN+v9osOwgqjXnxBwIJgMENcnUA/LEXqa7w9p3V
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(6506007)(6666004)(4326008)(66946007)(1076003)(2906002)(16526019)(5660300002)(66476007)(52116002)(6512007)(6486002)(66556008)(26005)(186003)(478600001)(83380400001)(8676002)(2616005)(8936002)(956004)(44832011)(316002)(6916009)(15650500001)(36756003)(86362001)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: MQUPNV3Az/CBEomwIO0PsOECqRHDtEYWYTT6YE0tW1c38fKHdcUikCzcAFvmRkzgzdqG4TRUScWI5AifI7F4RiCx6aA9qBDfq4inpGMZS7bjzFL7vOZbxAULtJNeftwt3c2EMT7QNwhli0cszL1ve4ayFKC6ywIByxifrIflvMT3IR8yoa+E3t18+h1TWcioSSlcXL91h9UP4cZu24gHQ4S3W2JENQmk2g0KluFN3H9CO8gs4EDDVL7JYJUq9H3CrSGyVHsD77YsxxLO8SaM4b8qg4bXwW2pVW9rixo96vFt6jfyJh5atVc6T43v2zZD3baAZalptGEX4ZkXrjmml1/KVhelWWkug+BsiV8g51XINKt80uSLOAGq76LW0XAesFbVNsiPCYtaSpphv3gNA8eJOenaqMTd2dZTKu6gXr127wOWbz6bbDibDGRZL7S/uaEzQhXxB65b39vEVdtg+FBfuck7HgUGuspbIA7Bu+Whs1wVZUjyBaLbhQuuDB6+dSNlpgl8PHQd9do4LiaLREUJqfdN1u0jg59sRTKNsVD9G/mfA7G8U87yZ9FKUykL/A6ly+a9RmuQxb8Zm3fGzBj6tgOffmcdIR40Xk5nzPeWhS2NvZJsf6ISe1rPvCetuZ6/G81HVOdUtTR8gCZuoQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ffb376-c152-446e-69f8-08d842925631
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 09:45:55.3564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUjDLsfVa1aL9z5ajnm/Lnf5zr4/noYK4T87j9pbPmJLMO5VSn9Gw2CHmboR6XbTNa+FMuqqAYD9be/NfRQFTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some platforms (eg cdns3) may have special sequences between
xhci_bus_suspend and xhci_suspend, add .suspend_quick for it.

Reviewed-by: Jun Li <jun.li@nxp.com>
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 19 +++++++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c7f98edc5678..c3ce4d762adf 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -54,6 +54,16 @@ static int xhci_priv_init_quirk(struct usb_hcd *hcd)
 	return priv->init_quirk(hcd);
 }
 
+static int xhci_priv_suspend_quirk(struct usb_hcd *hcd)
+{
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+	if (!priv->suspend_quirk)
+		return 0;
+
+	return priv->suspend_quirk(hcd);
+}
+
 static int xhci_priv_resume_quirk(struct usb_hcd *hcd)
 {
 	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
@@ -401,7 +411,11 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+	int ret;
 
+	ret = xhci_priv_suspend_quirk(hcd);
+	if (ret)
+		return ret;
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
 	 * to do wakeup during suspend. Since xhci_plat_suspend is currently
@@ -438,6 +452,11 @@ static int __maybe_unused xhci_plat_runtime_suspend(struct device *dev)
 {
 	struct usb_hcd  *hcd = dev_get_drvdata(dev);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	int ret;
+
+	ret = xhci_priv_suspend_quirk(hcd);
+	if (ret)
+		return ret;
 
 	return xhci_suspend(xhci, true);
 }
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index b49f6447bd3a..1fb149d1fbce 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -15,6 +15,7 @@ struct xhci_plat_priv {
 	unsigned long long quirks;
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
+	int (*suspend_quirk)(struct usb_hcd *);
 	int (*resume_quirk)(struct usb_hcd *);
 };
 
-- 
2.17.1

