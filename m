Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032512585A5
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 04:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgIACec (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 22:34:32 -0400
Received: from mail-eopbgr80078.outbound.protection.outlook.com ([40.107.8.78]:38116
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726085AbgIACe3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 22:34:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRmknsOwh224BJxRc6kClO8yljcwBPIW65arfrySNnZtK+F8vYdUM4SEiBs+9Rv4HocglONdV+wg2myXf/8jbk+5JaBNcHzp65FGPGSKPMhe4TqsyDYaZKEYNWTlicAtKomIJmn5oFgW7vvrqwTCSS0X9r3sKv12eObtmEVfeO3ZoKapNG3QOsH4PZM4lZ35w+NTWsaZcF9Nq/dbNWMjOBG+HmUn5zO5PDM5B6iZPCSuwdyzeHx9PaVJ481nSyaeYa3aZSl6no6ah+VlNsJWiKm/abbUyZv6lKpujgO1wPpYlTrfQGhM0ZnDG2s2rdi5sZoNGCh16ZXVtohXQc1qLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHPhgfQ7oDZcRLbgclz6ycbeCsO6Qm31dtaydGM7EFU=;
 b=itUSKPNZp+ti/xIrUfyTbUWrkQFA6rCOYZT/Jb0BBXKJoXVbIFgqwqnlxObOwnOLqBBbA4YyS+WQq0FzNEfWPuE2uqFZg+fWdfun29VPisc3ZH5aio60AagcjxQcNqzVacmk9KXlB6coouk6xaDmzVUclUipWPjmrYH1vvL59USwQZmh/nfFm09nFTmDc+oBIDgqF0dJF0G47I2GKa9dDMfGW8wr9QO4FZ1MjD1LNRiqbKwZv2nJEitekPmdSBvSn6Ln+1tGkrfP2TXgr9lMY09ETBr8zpv3qk889/aMCbUjYxj0YE0xKndT6xltfSJDgXp5nMNtOAFEqx+5JWzrDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHPhgfQ7oDZcRLbgclz6ycbeCsO6Qm31dtaydGM7EFU=;
 b=fHAea0Epl3QmlVO5qpFWMFfrQQO4jmQlO1gip6rrWvYVZGsv5jblENQu39n4KmQDJrSoM3LVvBmcwDeQDDw5xUj+DgE4PHXhdEC3oBIfhpiSs86gmyE4SQv6WeV68I3nQMgi3OOiYbyhSqysCnS/hpIZvgkaKtuAPxCkS1xgMg8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6998.eurprd04.prod.outlook.com (2603:10a6:20b:10a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 1 Sep
 2020 02:34:26 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 02:34:26 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/5] usb: cdns3: gadget: set fast access bit
Date:   Tue,  1 Sep 2020 10:33:49 +0800
Message-Id: <20200901023352.25552-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901023352.25552-1-peter.chen@nxp.com>
References: <20200901023352.25552-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR02CA0046.apcprd02.prod.outlook.com (2603:1096:3:18::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 02:34:23 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f83436a-6c74-4178-57f5-08d84e1f8b52
X-MS-TrafficTypeDiagnostic: AM7PR04MB6998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69988BF334B9D813D36DA5208B2E0@AM7PR04MB6998.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jgimX0HSAoihZ6H3nJoiVB7YtnUqGSJkOXxHfcX5dtYgUJ1M89mtpPIr40AIv7IPoI2XTiMepaqcfDKL+ykvvdlQ8O6ZzPqaonArz24iEWd239YrZc/USJQYagtG/CbrtDjFSUr+CCw/7SnnekhkbcQqxwx7uqpHdDNIe+Nili+SkR1JPbF6tICHX7enQZyRAPZUB32zJV9onACeyl+BCxdyYB+6HZeXNxaMqK3yQQ0TNWusOJJDCtffvd1ThUe3UcldGGWfBGH+CJ1MkxmKrjljSXQXQY4LPbxGgrJOO2/dVHIaBHl2qc70sA/5IgWS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(6512007)(6506007)(4326008)(16526019)(186003)(83380400001)(1076003)(26005)(478600001)(6666004)(6486002)(2616005)(52116002)(8936002)(2906002)(6916009)(36756003)(86362001)(5660300002)(8676002)(66946007)(956004)(66476007)(316002)(66556008)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: l0rMFbjKNmRlx7Bp3dowbXP5G2atGpTXCCgxhw+5DqyZmhUnSM1vvz64+2VEzJmVwd0Lvm9pOgPasTnU5IYEJ/PHp0qjtswKLEvqgcrDtMG4fPDSggDA4jmY8i9R2drYYLRb4PkG2Fzi6rYYwLM1vEEMDuSvnKcPVjwArHz/1QjYSSuDaIUULQz7TGsLoEVAMCC0v+kz8rL+HtAPDYeScjRPOXsWW/FgdDlKBEbQ7PcVModByxzgF9qJR94tW2UlK/cl/x8ggBFql3Moq2WsNKBQJOmwNqlhnREPmacMQauNZzDd/YCeY2ZEiZitYAIVGe9gGA5rBVDOTBnvXmPxFajInYOXjiYi0SkYDPm094DJHr4F+YcgpP+X//xPHSwcYegFzaU0fu1n2u9GFzlmUPcb3omMFk1b56rqXhYgjWzwPcPNW3t6JeldnYthG55kAi3cXhsPbJS860lHHrIrh+RWfGPQ2PtqMhRJZFAsPCSgma2fQKQYY13bEuPMGK3o9bSYNT5KqbTvkjDzyBueZfWoLxyINJRrfJeD3iKLvIhACQpNRnmC1U1Yi8/8bJ5XHpRHTiI78oHPU19Q5fQXujK28ARn0TIPWAxJHXM00SAQiwYl2X02Q/p57KWkALS8MnlGYzLy2Z7fAh7eY1BuTw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f83436a-6c74-4178-57f5-08d84e1f8b52
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 02:34:26.3457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lTuT33VDrMgVSVLotMoQ+NXJyZNIQowrehWql6F3GHsHTr0vZXtfEbcp/vQ3jJH/HSIG5DQnpOG60+DOjH5tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6998
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Below is the recommendation from Cadence designer:
	Using this bit to be sure that PHY clock is keeping up in active
	state. It's good to keep Fast Access bit enabled as long as there
	is any access to USB register.

It is used to fix the potential ARM core hang when visit controller
register after DEVDS (.pullup is cleared) is set, the threaded irq
may be scheduled at that time.

Cc: Pawel Laszczak <pawell@cadence.com>
Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 2551901e8470..03b54c239944 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -2783,6 +2783,8 @@ static void cdns3_gadget_config(struct cdns3_device *priv_dev)
 	/* enable generic interrupt*/
 	writel(USB_IEN_INIT, &regs->usb_ien);
 	writel(USB_CONF_CLK2OFFDS | USB_CONF_L1DS, &regs->usb_conf);
+	/*  keep Fast Access bit */
+	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);
 
 	cdns3_configure_dmult(priv_dev, NULL);
 }
@@ -2866,6 +2868,7 @@ static int cdns3_gadget_udc_stop(struct usb_gadget *gadget)
 
 	/* disable interrupt for device */
 	writel(0, &priv_dev->regs->usb_ien);
+	writel(0, &priv_dev->regs->usb_pwr);
 	writel(USB_CONF_DEVDS, &priv_dev->regs->usb_conf);
 
 	return 0;
-- 
2.17.1

