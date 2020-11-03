Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C919E2A441F
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 12:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgKCLX3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Nov 2020 06:23:29 -0500
Received: from mail-vi1eur05on2088.outbound.protection.outlook.com ([40.107.21.88]:21729
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728092AbgKCLX2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 06:23:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hto3k/y7vFeNuh5Jt/nucf0P8Ig3xYLjuY1Hp+iJeE8k+Q9rLEkznir9LEOSHyIgOgaujFZlACOzAS3/clUgQBWmLtutuDcjwBNp9tUlgqHsuDRvtrqMHL1GW+/RuhvDyV0jcl5QViHAr5/6QkPl8mRKxPUXr++YaNH8kHtYJctAsYj1C8WaudsZRSNfDE+O6UnZr53FJ8yvZ9O0mFCCTQzGISY+zKm+mqXITKTzO2y6wA796CnUyllDEoDQsS2ki8IYv5uUfe5vTX2WI+RL8CB9M0X6IT5+4jKigLBm34hidZm8yu0Xcb/yQ/n6U738fDMF5/Ra0LjVp+q2FSOXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zu5OyylSN127hG6rzB+NTi/+6clv255dmTTcZSPfFVE=;
 b=iCeAhAxN76QqGJOGYeOxZeOKay3Iid25y/HMtS6ooZXpTkWJD/F8n+8zK4Pyt0XyYs1qe2MhUoYaGHjPkozUoR9CicHvuLMwL9CdHxpTgbBcKs6YFItElqH2/qaOfchK+GQpMvrUP6sioDOwAdlDQmLLJowRZfiMsBmqzrTXv8uG9UBk9D0YlxQUD9AOVOq91RGWjVFeFi2oM1nF5Wo8tcXkweGSJEEaVnobdOIAXtkn8Hf21VSWCdXvudsoYPQZUpKUxjuTAI19HisTYtY1pZ86jU6+otoYvZoa+HDZGQaWYxTd6P4X35O67GQ1B3U7GQgkX1hPMeo7Oe0/MMPmGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zu5OyylSN127hG6rzB+NTi/+6clv255dmTTcZSPfFVE=;
 b=p/IMqZtVulgAYDQIAT/bB7LHPMSNs0Qlk6+fJGv8MUGjICb31RScFb/F/E3Ke1CefuxTML2ZmsgluIiC4qVB/71lZjkTZ1nrOHPD3znx6hHgHFu7IgJqG5mr71MIvepx7aKtrDVWKeIhH+ah9bqeHGlT+b+DPcsqgsXt8q2lAwg=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3758.eurprd04.prod.outlook.com (2603:10a6:803:1d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 3 Nov
 2020 11:23:25 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 11:23:25 +0000
From:   Li Jun <jun.li@nxp.com>
To:     mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        peter.chen@nxp.com
Subject: [PATCH] usb: host: xhci: wait USB2 port enter suspend for bus suspend
Date:   Tue,  3 Nov 2020 19:17:30 +0800
Message-Id: <1604402250-16434-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0078.apcprd02.prod.outlook.com
 (2603:1096:4:90::18) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0078.apcprd02.prod.outlook.com (2603:1096:4:90::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Tue, 3 Nov 2020 11:23:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 463d7039-054f-4b68-65ee-08d87feae153
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3758:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3758277752F09D15B83845D389110@VI1PR0402MB3758.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: woxM8O+oG5nl2FBJ9O8VYEVlHJjLdE3F912y1sbY+mOkLlYBLO2LtZuK3CbNCXNqThfIkbh/4SSMZbpsTTEVv1db46L8A25tOzgoRA5MVhWGRzRq62YhrPBlKV5zxesC4lrmseaozfYuJyEIP86BJXtsP98TCpGmtkcWL+wh1khSNE2Gg28IBSH1e+28nb+kqfxoKrouLp0zfONvz72zv6cR5QfoWV24AOEcbh28yEmxeLd+g9kiPV9MiTMiLrsB0QOs2/BldKsYC1TATKUk/yTTysuRzgOQVXG6yUyMXG7iYLXd6/zektwkc8Pj+LCcDT1EvGoNWYC82I28Uz5jZOajzETj5KtNVJZjyvwsZGq78vfoERFzkQEBV+3VyZc+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(6666004)(86362001)(2616005)(69590400008)(26005)(6916009)(956004)(2906002)(6506007)(6486002)(4326008)(16526019)(8936002)(186003)(6512007)(36756003)(52116002)(66946007)(316002)(83380400001)(478600001)(5660300002)(15650500001)(66476007)(8676002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: eHDxnwtAfgNtW61k7/BGWFQMWOuvkxxtMXiWJpMKPyTzcOc3NhV2j8n5eo4PPwOS0QR1dIxsBz6CjKdBrP8BEgGEV+nGO5//ZCf6T23xoZwS9ICx5xoNIax0qG+9XYvo9IP86QxuWv62Iu+TN8atO70n31wZoGCCf2ugYS8jQF42RVE/ADZ6FWozv3CoTNuu/tqHxc6UMCGt2kKdZps+3JkAATTi4+nfoTIhPUyzATWWuFFlRi91yTkZHeom/2hr+xb4qk/RZR7a6Ti0Env7/hjKlS+fncwcG0jyLw8zOTbqSd6v28eSlfeBvkuELkO4Vg0VljPoNdwgUAqpeEtIuXkv7gV3L1Mo2iJTrNG1drzH54ENtTQWzKqJSWc60QXxAQMwQpvDYj1dgicp+cz4uhPPi0/iPBWdQGL41sk4uVG8i+3jJ3WBSztJWpeIUhB848sAM4+F4ZGaNfCC+hU9j+ZFTi5eb+QgAtAOORcL1DLjCV3ezYyA12Ozigi8UPDhAdRYqwu3lncybFummxCRuC9g3beWmBo5tSR5EEfAwWMyc6pbzy8fVo6x3MMVfo5MPgZDxaQCIH2nToSQklRo76Qgi6rh8fERWpAFr/ev0OuUgkc7iWEYUqHV1iit+JSGpHqhlauqfAV5QKhJrFePmg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 463d7039-054f-4b68-65ee-08d87feae153
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 11:23:25.7396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6j1JCnbby0njAX6togptUtE1EJnwE/Jb0gGhD7LDgoYaRwDyITWowkyyu0I7nPC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3758
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the connected USB2 device wakeup is not enabled/supported, the link
state may still be U0 when do xhci bus suspend, after we suspend ports
in U0, we need give time to device to enter suspend before do further
suspend operations (e.g. system suspend), otherwise we may enter system
suspend with link state at U0.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/host/xhci-hub.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index c799ca5..1e054d0 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1598,6 +1598,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 	struct xhci_hub *rhub;
 	struct xhci_port **ports;
 	u32 portsc_buf[USB_MAXCHILDREN];
+	bool wait_port_enter_u3 = false;
 	bool wake_enabled;
 
 	rhub = xhci_get_rhub(hcd);
@@ -1706,12 +1707,17 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 				xhci_stop_device(xhci, slot_id, 1);
 				spin_lock_irqsave(&xhci->lock, flags);
 			}
+			wait_port_enter_u3 = true;
 		}
 		writel(portsc_buf[port_index], ports[port_index]->addr);
 	}
 	hcd->state = HC_STATE_SUSPENDED;
 	bus_state->next_statechange = jiffies + msecs_to_jiffies(10);
 	spin_unlock_irqrestore(&xhci->lock, flags);
+
+	if (wait_port_enter_u3)
+		usleep_range(5000, 10000);
+
 	return 0;
 }
 
-- 
2.7.4

