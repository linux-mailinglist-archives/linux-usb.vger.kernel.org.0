Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD532585A7
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 04:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgIACej (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 22:34:39 -0400
Received: from mail-eopbgr80078.outbound.protection.outlook.com ([40.107.8.78]:38116
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726044AbgIACei (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 22:34:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4+pHUz3XQ4bMH2+9sLguhKq4GtL1/Fbqqp63d/Ied0ZeJTw9IIPlFvFgItuyYVUMuIulCpikkpkkI2Gvfx2HKJnQFZDFL6nCfjndyxqgsZsExGn5Z1M7jevn9bB5gMIW7iaP+vtlX4oBwDNKM62oo9iUlKbc2avB1igug6Zt8I4V3Lac+SMhr67ugRu5vKJmjyKe4u09zyJpswBemmPX8S/VpT34v8XG1Wg46cOxHHxS0lDoFlH/5OfzVMRddy6KWrwVl8MIFq/YqSsh2/tjv2Urb4NSiCpjK/o0/dqC3zWnSuN165icgy5i26nz+VTa5b+tAOf97mQtL5bRL/VAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iohVom1BNaXZs+Kz1dpltVQrMuRQVw02UmIU5d43Stw=;
 b=eyLYZTc88ZMtEWSv4v3mwlmwYpe64Z122pPgfxu7DoaUbrV1BfsOkP8llpYmkIeRmcxxQtO+9sECM+oChSJd+dvU2q7CsdxkBEIq1a0vja90RQ7bzlv6so+NIARZ2DABiMeoS/UubSFcq8m7v5pTaqtI7XTz971S4H+xVSEEEPHr5mCUWV+DE4X5PQvhZHNijhb3Kc4SFedutJvrsRTw+ScThF7HYaw9qNGuHQLXEZOFgfA94sgApV7v4d0WbxkYKctkFn6iX71oXdquEpo2LWx0LwUzbX8B4fcZAGAutvtfLvZg4nVtZ2dJCGpX1MbFJMEoq18LasQvnOKNYKUNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iohVom1BNaXZs+Kz1dpltVQrMuRQVw02UmIU5d43Stw=;
 b=V/4B/9mzSqlo0VnofE2mSLVP3lUwOczwDraK745ehKm6HhVhZR5Ulw9MFOJ2ZVvkzxcQNlYFTHqcQSnOiq5cXmsF6CsIS14cdfM/n00mjghHQQ7iDdrJNEHKYoqNKRevUNsDeKeWGl4+6TWEBXhfEJ23+ZJwDwhkI4AsRMSlv0k=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6998.eurprd04.prod.outlook.com (2603:10a6:20b:10a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 1 Sep
 2020 02:34:32 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 02:34:32 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 4/5] usb: cdns3: drd: call PHY .set_mode accordingly
Date:   Tue,  1 Sep 2020 10:33:51 +0800
Message-Id: <20200901023352.25552-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901023352.25552-1-peter.chen@nxp.com>
References: <20200901023352.25552-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR02CA0046.apcprd02.prod.outlook.com (2603:1096:3:18::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 02:34:29 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eb67ab51-85e5-4d0c-c04a-08d84e1f8ed3
X-MS-TrafficTypeDiagnostic: AM7PR04MB6998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6998BE2DBBBA9D269FAD563D8B2E0@AM7PR04MB6998.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mKpzN6ZDucliGFpWt0X4LKtaIXK5VG7LSDI6yAk+WIZB7agBvypFrMJMca9dtr00wGKuSfurY832i0gaZBGBytnSreJykQGRw7sNTOFkVJomYyHFEIe/IL3PHJRO87LKhBaYRTfVLPlC+xUjrwvm0TjpSQSTZRn4BB7acjswHv5DDcbvmq5vDPnznEosluVpr/VS73FDsXWMdi+NOvCf3Ak6Lu+aWaLo8GGw/FRs9K3yNbCz3B+x+baHDdD68EHecpdVtH6ZpRMvpd3IF5U7YuNxx3rG8geRalxcogNqlTDuRT8NSZ26ApTRZIHhYW+98UOYh7kQRYaad4hadp3RLwGBz9A+L1s5/SHvAXP9cfa040QlgXrV5n10GvlsX7/j
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(6512007)(6506007)(4326008)(16526019)(186003)(1076003)(26005)(478600001)(6666004)(6486002)(2616005)(52116002)(8936002)(2906002)(6916009)(36756003)(86362001)(5660300002)(8676002)(66946007)(956004)(66476007)(316002)(66556008)(44832011)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 68UOkRLyIeo6Q2i9ldX670sdV67Aqv4FJiaru5UcWYTNXIoq9k3f7Ktg6DnQDJnUHPdAFyUwYV2gDbKExtBp8/YouoEwSjzfjl5NSaifsxEyWHQ6s3/0xiuMqZ0SuCRcjCUknJp6TqvYYs3wdv14+8MYlLpzRvI/E9p/OHS66x+m+MmWh5kKphj5PWD1T4sDTQfcpyvEjiAOJ3vyVdlYPtdPsobiuTygcsmMDgcVLXht7+oBXuJqgQky357PUxS5KZFqmFUe2nXY+mr/Wkyp84GWZzIJpbxoU8AkaUWDhnZ886dWgm5UHhkjkudPae0/zCFCv2K2v6OlFUmewjIs8ptvLQS9n/qM1obLWltMlfAtF9RRppoCZuSqn0CdLkAIdox2N3srnoZPNTZ5I9KRWQxM3Z67vVlfQG9WIRgMcr3rt8AE113rSmTiVgxmfO9sUR/wDCEPXxDb97UPnZZYeqwmRvi71yUssyLmxOSE3ToQWzO8pMs1y8E+ztpRNjEPd7wZivxB9FAgRFmOiKl/5Z4/Hz6sJ8dgPH44rzfFeadtTVYAvpzB4Ter7zgFZBgBnWY6K2VA6cFqCzYL8STKivasLfJUYtIS2V0Zte3s5NkCRKybQ/9aCsx6sjR7aR7JUvm6MirGGfeAv5Zs5p1ylg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb67ab51-85e5-4d0c-c04a-08d84e1f8ed3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 02:34:32.2429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gA8569oHLtNRR5zeCuP075CgtG7JQOBpv/IAFz0P2OgMe1dRyUYoKRei3XuXwUVCZqSd7F47VjkzDdVdb6AIxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6998
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some PHYs may need to enter related mode, and do some settings.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/drd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
index 5f2685cadf5e..31fddf84f226 100644
--- a/drivers/usb/cdns3/drd.c
+++ b/drivers/usb/cdns3/drd.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/usb/otg.h>
+#include <linux/phy/phy.h>
 
 #include "gadget.h"
 #include "drd.h"
@@ -145,6 +146,7 @@ int cdns3_drd_host_on(struct cdns3 *cdns)
 	if (ret)
 		dev_err(cdns->dev, "timeout waiting for xhci_ready\n");
 
+	phy_set_mode(cdns->usb3_phy, PHY_MODE_USB_HOST);
 	return ret;
 }
 
@@ -164,6 +166,7 @@ void cdns3_drd_host_off(struct cdns3 *cdns)
 	readl_poll_timeout_atomic(&cdns->otg_regs->state, val,
 				  !(val & OTGSTATE_HOST_STATE_MASK),
 				  1, 2000000);
+	phy_set_mode(cdns->usb3_phy, PHY_MODE_INVALID);
 }
 
 /**
@@ -190,6 +193,7 @@ int cdns3_drd_gadget_on(struct cdns3 *cdns)
 		return ret;
 	}
 
+	phy_set_mode(cdns->usb3_phy, PHY_MODE_USB_DEVICE);
 	return 0;
 }
 
@@ -213,6 +217,7 @@ void cdns3_drd_gadget_off(struct cdns3 *cdns)
 	readl_poll_timeout_atomic(&cdns->otg_regs->state, val,
 				  !(val & OTGSTATE_DEV_STATE_MASK),
 				  1, 2000000);
+	phy_set_mode(cdns->usb3_phy, PHY_MODE_INVALID);
 }
 
 /**
-- 
2.17.1

