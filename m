Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629D126411A
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 11:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbgIJJOc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 05:14:32 -0400
Received: from mail-eopbgr40061.outbound.protection.outlook.com ([40.107.4.61]:49482
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726847AbgIJJNy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 05:13:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0aYqAUJ1Zd8CN+GRSdg+xL0SD0LZ9nLTJpuu2ov79m44A3B/4q3BYmrmd7015P90fSlqUyzoHVSw24vLt4qi/HOuWR77CxWghlBwsjI1kqf6pkZ8r39Vg/7nUkDkZcpWH7x4myF120XeCpV0Mdn3rbGNoRnRsnE/8MHy6rXaRqQMDYEk9kxirPj1u417gI8Iss3Hqat82s9aayAXyaJmMKavNCI4iFBnj4rUMKeQukCVb8Z1SxWMvkZBR0+BmLQ+ucfH7kUkHmsQObJIhYHlHuVLaBbkcLg84oK3jreWlne4Qn8pUgZYh92pJVmN8N1B3JFembYInRCf6D6BhcVmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20UMUvYcOTfXzDTccHSiMZloHtWNpfoflBsj8t1KCz4=;
 b=WqW3AW9z0GQ3qEYLvUdirvJ6xLqPyLD7Sf0g8GFkgifalQOLtD7IUYUw2yBqSUApBEeWGJgMXrFbYcJxrWOhdpPSOCjXgiNHnrPmrpXO5EC3Cywi1Kh4GC/A4PW0g8sdPZPaAEm+qm9dFGhzsGlfOcAaRWraCafuKKyvo3QGVhlC7EJwEcGddgsSMZkY5QFqtO7b9pPdDc3810ul8AW2wJ7LlL2/MDSm773y3rSHXM/n77c+q+zR5342y/InELVFxaq856zd5rZ98SVqeGvzMgEYrKWIgdFvnvIv6lUo5MnKX15IHEtDwDxiOGb3E6PwszuGHjJp1OUet6ZgdTsZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20UMUvYcOTfXzDTccHSiMZloHtWNpfoflBsj8t1KCz4=;
 b=qn43HHcR8JRdyzcD0IeVUlDQBTUoTii4NbQI4YEufoWL9qjZYVutlpv8hPSjlOq95TpR9gu7EsJs9eNA5fI8F5LigWRECW80AlK1Q42RDkhzrC4b54HSqq7tLemEOtrbE6J0KiGjVFw/is73znoIzqVGUiog0jNBtYkj1u3Nk2o=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4168.eurprd04.prod.outlook.com (2603:10a6:209:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 10 Sep
 2020 09:12:33 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 09:12:33 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 7/8] usb: cdns3: gadget: sg_support is only for DEV_VER_V2 or above
Date:   Thu, 10 Sep 2020 17:11:29 +0800
Message-Id: <20200910091130.20937-8-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910091130.20937-1-peter.chen@nxp.com>
References: <20200910091130.20937-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0134.apcprd06.prod.outlook.com (2603:1096:1:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 09:12:31 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 87657771-b5d4-47c9-3aaf-08d85569a6fc
X-MS-TrafficTypeDiagnostic: AM6PR04MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4168E2DEB36B9DCEE0C08E2F8B270@AM6PR04MB4168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EYC43CkcB5cCiKLw5Jh227O2ht0T+zH5rukVkxtCtzfmqpIcqq3CYd2whrF64m0uoptzbDah7ckBKA3v6Dl9iv84o3QrgYdJJrL+HFq+E+lvu1kQQHtw6BZ+430MiIgYxhwaM3TzITyXB5aFJo3O5MWBpNq362tmo8wZEt3O4k2Oe4N/rJ6SSmHFbB7nYhpMCbTklugxPKkMHt8JgEex/fzJ/IbF4f8fAiLNOms7UG6iVsv0o42MCfibfiQPEqOCstKvJ6IfI4qrA/0u6qbcjGLG3gH9/1QIZvTxjUE14s7lB7vTGHrCumx/596GRfCh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(4326008)(6512007)(83380400001)(186003)(6486002)(16526019)(36756003)(66946007)(66556008)(1076003)(8936002)(66476007)(52116002)(26005)(478600001)(44832011)(316002)(2616005)(2906002)(8676002)(956004)(5660300002)(6916009)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: UkZ5ZDP3pW83BUUoTmNgLkGQHtT3QE9KIGMNSwiJOvHs0SUuSk7Zhw2hbIGEKWhw6JyeU5aRL52VD7l7d4goz560i6nu3ejKPGIyYJQ4XERrHdR9a5BapjX1c0dlh2woyvTVd5RsSk5+zcbuosam//JF729quqKyFNomngKho6Ru8bLuTxr4R+aHay8s44dMYPSurO2x8stpnpXBQfLO6/ThhMYYq+QJvYo7Mjf7Vv+1dyqw4eV5otlVvLPvoMnD+WKkbJ7f77PEBs/Dw+3pGykFNH27inKmmLVtDxc2XtXuqjt9iEgjlwn8yu+yTnZ4xS2wPzqz+G5S1SdcqyrhVWLeSs/YCxWkBamyNzFnNljLs2INa4a6HCRXDbn3cI1/mj0Isl9XXMZOrXgBvTOgt9lcXMOrSvP/Ezwp5JoOXFb7Q3AyHhqJpN5cwnxSgIBbHpuyjf3Sg/Skx0KMahwai5TgcPjR98vVPFSWM6oe7VJY20Pz17IzDwULN2wm8twp3Sp0GWlVcAyuUGS13ufHEtoArXVQzsoyJ+QNE9Ut1662B1B8yoy0Bm2A10oX4D12NkDUaET1dwe2jPxkAJzMeZS2L/DjWYpdxyOQw4lTes2MgccRP/PaNbKnxOQQj8V8mfyrmTvKPHLLM3Y4S0fWjw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87657771-b5d4-47c9-3aaf-08d85569a6fc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 09:12:33.7406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmaymI6SlsTiarTurKbLoRZX4/LclrEuEWZ4ZPcOMGivjd5loV+axAwhI6+LBuhy40j0QbQGeokXoNWePT6Fuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4168
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The scatter buffer list support earlier than DEV_VER_V2 is not
good enough, software can't know well about short transfer for it.

Cc: Pawel Laszczak <pawell@cadence.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index e2c12212dba4..90a66bdc30ba 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -3160,7 +3160,6 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 	priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
 	priv_dev->gadget.ops = &cdns3_gadget_ops;
 	priv_dev->gadget.name = "usb-ss-gadget";
-	priv_dev->gadget.sg_supported = 1;
 	priv_dev->gadget.quirk_avoids_skb_reserve = 1;
 	priv_dev->gadget.irq = cdns->dev_irq;
 
@@ -3199,6 +3198,8 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 		readl(&priv_dev->regs->usb_cap2));
 
 	priv_dev->dev_ver = GET_DEV_BASE_VERSION(priv_dev->dev_ver);
+	if (priv_dev->dev_ver >= DEV_VER_V2)
+		priv_dev->gadget.sg_supported = 1;
 
 	priv_dev->zlp_buf = kzalloc(CDNS3_EP_ZLP_BUF_SIZE, GFP_KERNEL);
 	if (!priv_dev->zlp_buf) {
-- 
2.17.1

