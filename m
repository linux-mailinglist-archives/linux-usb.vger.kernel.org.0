Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE58C2463AF
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 11:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgHQJqo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 05:46:44 -0400
Received: from mail-db8eur05on2086.outbound.protection.outlook.com ([40.107.20.86]:12129
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726324AbgHQJqm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 05:46:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwPcD3ceeygnjgqj+6agk0u9VGwGhZd6tCpOB+hwxV2s7ZVlGT6GbjxSG5L2sfp/1Dyeuv9L3LM/wyGzfiG6tYY2hJjQ1CGpv0nRMGNI/NCNigV8D9iZDMyeVNYp8UAb2vRzckHJSlBmkJWsL5XNB9hA+MU1Dahr+RFm3z+fOiq18bKjvuKgd11sKj8VvddbTD6m202p/5QB77TBKwms894QTMC6l0s0TwkS44lRmNcxWd672YniDTqDREmgTuDn7LgB1M+a3C3hIrwOkhJX6F8dlE1O22QVFbTNmn1uJ1jizPrtAelZ1Bip/H8PjwhXxoDm3V2BK9+6Tc4nKXYgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiygfphVRc6jCRLTweWBo0aa43+acXpEU7O3O1eRSHM=;
 b=EwB0us+Z8uRu7Gcc5O3cSg+XlqoHpxCS/9MbibIhHXqj8DTfw3bl87/E2gO378fnAU09oXT60L8ZmCXv0P1+PVbucFWPFdrUBUxijRTF4P0HKNJbMhIsJrLxivNkFTZWoPqxPfAvIsLTGcVBG4+Lj/bmPCzoMubDqGaWj+FIms4ov5VexMXs4IvaFDjk164OgsFwpXIqUVidTeMU3y0VpIDYbptSUTkWf/L8Zcu2KiJzjZx1iqKTaPkHNXPkn+OO8SQZoE9j4hAw0pi5gh6mfAvsQfkr9xTXy2nuaPT7OS/MNPVyah89ybbWGVJwMXeRYdxOlIG+FkGf5XcF2gSOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiygfphVRc6jCRLTweWBo0aa43+acXpEU7O3O1eRSHM=;
 b=WyRM16rIJAmnlURi77JJgTGSmz3VFCEgjQ4FyETG1rUb92mql+a1flBfTcsrJnFlRvoa3e+kWgmoqCEvL+FtZQ7zUdVPd5kBeu+OkURaVBHY4EylOi9YAjnlpUXOwovnNmxSFiyM6GlcbEnsHZFB/G+Rp1hPasx26Y+PKFPCNMo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0402MB2740.eurprd04.prod.outlook.com (2603:10a6:203:9a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Mon, 17 Aug
 2020 09:46:06 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Mon, 17 Aug 2020
 09:46:06 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 7/7] usb: host: xhci: avoid calling contineous two times for xhci_suspend
Date:   Mon, 17 Aug 2020 17:44:40 +0800
Message-Id: <20200817094440.23202-8-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817094440.23202-1-peter.chen@nxp.com>
References: <20200817094440.23202-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0094.apcprd02.prod.outlook.com (2603:1096:4:90::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Mon, 17 Aug 2020 09:46:04 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9b8690a-291f-4e98-003d-08d842925cf7
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB27404D683E7F964A5608EA2C8B5F0@AM5PR0402MB2740.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uzzAl9iN/2pTTjtfSVIzHDOqC0MAUGZJOPKI1MLRlY2seFaG+o2N5Ops4Fysi6aJw9Ynbtg0kTAWt9uzQyuAUT7Qvq+x11g0rLbBt/becxfgBkWfdi7WIHMQuSUXiZC5a3Lc9plgzfXLOV8bjlmVQwz+hDPsRuJ3tp6Q9xIPz6UqHt+Zi8G2Txt6oY0zmccl7sj7nI7wWuUDkG8KPqAQ1YmcwWbJvIEn0dfkmtR3UMD2W7UFL4gwdev6MGauNCmhCJ20on828m2bJPupWl4y6ohf0yxvDobrw9DYFNiSr58fJIj+ejv3vFaGjJFC/CR3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(5660300002)(66476007)(4326008)(36756003)(2906002)(8936002)(6486002)(66556008)(44832011)(83380400001)(6512007)(6916009)(66946007)(8676002)(316002)(6666004)(16526019)(186003)(26005)(52116002)(86362001)(2616005)(478600001)(1076003)(956004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /f2R6D0i0x5cVwd5dTDvzVmPK9bCot2urKki3P1eNyCvedcsZhgwhXv+j/Z5d8j7E98AivYxFkpm9/qwn1m1riXGpTnZNM2k1vqLS0woGSHTRZxctVQA2pRzkeqXVVNP10XsXKw1XgvH7UerQZAIuK21ne0rHDlZAEzcVpBuUtYRd8elfLiND/k15qjSaXKDcHm8dqVSHAWsvbU5t0iHjvWKFTQ+c9USXkvG3oS/qQgbP1UAEYz1fCXxhXhsGIjNJqGBZ8GS+JviVL5Xczubip1cu1G0PMIMONojBz0SbTICoEFEPs7bCOUt8RswI7aIYZiFs5D3Is3E5/bhuRtf9CZXjR0ntIX0Lg7Wqy59B7j+r7vKSuRxgPEDQHvEXxAoyNdXLYIciI4MJaQ1fXZUHbeQO252L8iJjntScsCqdubo2rOW4EMGT5DIx5PUygwHXxPolE4F62rCtFDstzXhvpi/J/fqJlZTiBnDpJFboxvE3HTyOEtgKBpnjGqByjueDTDdQGzaCH5k07fbasBFzGxdPwI3ZhkNVa/mRbFWh9OELlpOcSuu2Xsg+aQzMstUnnnNcXTPlA44t2G64mk+HvFhv3BSqr61WJkyEU/H43/IwuDnflbO/GoNdM2Z6C2SMLzzshjEPajEvVvmora4nw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b8690a-291f-4e98-003d-08d842925cf7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 09:46:06.7564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0Ts9ycZ43VZ47MVUjoVxjicgH9FvgsxRqISlXPMhQZr7iydAUmTm30A0PLkIicAwmWIJUzoADY+RAw0wp3Slw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2740
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the xhci-plat.c is the platform driver, after the runtime pm is
enabled, the xhci_suspend is called if nothing is connected on
the port. When the system goes to suspend, it will call xhci_suspend again
if USB wakeup is enabled.

Since the runtime suspend wakeup setting is not always the same with
system suspend wakeup setting, eg, at runtime suspend, we always need
wakeup if the controller is in low power mode; but at suspend system,
we may not need wakeup. So, we move the judgement after changing
wakeup setting.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 3c41b14ecce7..cde71f3b9767 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -982,12 +982,15 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 			xhci->shared_hcd->state != HC_STATE_SUSPENDED)
 		return -EINVAL;
 
-	xhci_dbc_suspend(xhci);
-
 	/* Clear root port wake on bits if wakeup not allowed. */
 	if (!do_wakeup)
 		xhci_disable_port_wake_on_bits(xhci);
 
+	if (!HCD_HW_ACCESSIBLE(hcd))
+		return 0;
+
+	xhci_dbc_suspend(xhci);
+
 	/* Don't poll the roothubs on bus suspend. */
 	xhci_dbg(xhci, "%s: stopping port polling.\n", __func__);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
-- 
2.17.1

