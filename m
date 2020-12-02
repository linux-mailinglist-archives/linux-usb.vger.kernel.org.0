Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C142CBD55
	for <lists+linux-usb@lfdr.de>; Wed,  2 Dec 2020 13:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729757AbgLBMvV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Dec 2020 07:51:21 -0500
Received: from mail-eopbgr20064.outbound.protection.outlook.com ([40.107.2.64]:48199
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727832AbgLBMvV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Dec 2020 07:51:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FR/OhXtDs0z5cIhrfD75KUVryX85rdKWS8OmgRIHwjqdQLMKmyKcY7OUaVXRBZC5SihvN4CMv10YmoihBHPVW+Js4ceCOJyZ0W+6Du7PHYmgojRquAGPnn9jfB/JGcYZH6DE8aNhKAIXUnHONP//pql1tG0BNz7EOKjXWdaCTzzBU3QGBW93Ga+VHOQOleMy/fLHPn6pYVM0oefVphrx7Em0BrYXGthC5X8vI9RG21KVXmQ60LC9qFW33GEAvGoam8kkIp2zlKlpCbs9XWmlMxOcwTJka4UiI0/L3Y7X6D5ZYziL96/WLbEljbIwSWdxytcu28sKCnHQoYnlR0BK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM1spiikxRnB9a/W53EEt8bnYv1i6lrq6sTaiLPbtMs=;
 b=PqQEgh7HHUe9jQNsYhVIe9CGZ7eLQljLJADS+nXEifhOIvuGxBBs9sPwsX4nhgzJf+zxqlnRDWK+dXDe4HM+E943fN8u1xmU3A4DDvEoyWidjdFyVwRarqOwZwnF+8ug7oJePejqTC/JOXoV3AC0GtSM9rUQ2LGDp40BJJmMWMmQJhr5GZbZc2ANidV4eNzaTseW/dfprrerRkm6RXWW7uUUCp8gOANKElkouzz5zHNX/SM8FS7RSB0Ntz7ULXxI8A/T9nfZIv1TkTWByVZiYL9P0RhkJynOTXPG4EIkv/0voxr3OBdGIIt2OF4Eq5vAB121wwRhW6m3/ydMGCnOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM1spiikxRnB9a/W53EEt8bnYv1i6lrq6sTaiLPbtMs=;
 b=rvc90FefCcaa0cArc467A66OorWKnEOijbG0SdLLRkf4/XUJtj9bt+pjZ7eDOiP4jBEZql4AH0RVlA6kwG9CjpBsT8IS92i8ADuR5i1rx/PIvKyEUtKVs+NyM+TEKk3BTcXJiCUsPF1vQfFILwNOWKGZt28UuFXG7O5KMjHqMs8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB5759.eurprd04.prod.outlook.com (2603:10a6:803:de::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.21; Wed, 2 Dec
 2020 12:50:31 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3611.032; Wed, 2 Dec 2020
 12:50:31 +0000
From:   Li Jun <jun.li@nxp.com>
To:     mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        peter.chen@nxp.com
Subject: [PATCH v2] usb: host: xhci: wait USB2 port enter suspend for bus suspend
Date:   Wed,  2 Dec 2020 20:42:56 +0800
Message-Id: <1606912976-28318-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0073.apcprd02.prod.outlook.com (2603:1096:4:90::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 12:50:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 247b76ca-28f7-405f-f837-08d896c0da42
X-MS-TrafficTypeDiagnostic: VI1PR04MB5759:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB575999EB743430FCEDA3B84689F30@VI1PR04MB5759.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V2hx0ORufJgRCIdIKEDBijchZArg1pDSPn0IWM8dPB12ul1i54++vD/fOjszntjYUF37jEGpucqxvNt6JrIw0mTFGW2HD2nqhoeL2DL4st2En3dDr4z+jYRaNJzlYPaOv3O8O6cACYvHZ/3NYcNX8v4qVL/c8bSFxO6YjAY87Hdb+Y9MptOfMr8IjkLdyw3yTckqUwEA2kxnw9f+Ycb0KgHbRG/T70D6AoIckmZOoR1JtAqy1LxxCU0tlogmHNukCLh6l+6vDWV2wdlDQyt/JsL1a7IunTdr+BYcCw53S2WbHEu1MAgYi3vCFZEwKvAw99MLz5eNsV8jOsjbvQOA9Bdbwwar0OE0p/sbjt1fnPO2R4P78Yl7ae/S2I2bvwtV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(39850400004)(136003)(83380400001)(66946007)(52116002)(6916009)(5660300002)(2906002)(69590400008)(6486002)(186003)(16526019)(86362001)(66556008)(6512007)(26005)(8936002)(4744005)(36756003)(6666004)(66476007)(15650500001)(956004)(8676002)(4326008)(6506007)(2616005)(478600001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kMa7i4jbzin5id4LQjDMFvmyM7Yf25ZcbaEQXc33d/gtCGFU/WjB/06ipvpD?=
 =?us-ascii?Q?1hSH0DKdpuHOwyPuxVqecue2C2eE+KNRpO36VtEiVzFiFaNjZJIiOiXvK1iG?=
 =?us-ascii?Q?GFQRxuunVBfBVYnGlkbnWLG2LuViQBMxeq7hKxBp+5pwNJA2LbP6A8vnVGVp?=
 =?us-ascii?Q?ydx/lU4ZJlMMTeg5ymIzyd3FkIHgVNZB653N9MpwdOCSUhShj7fPN3DvxLWQ?=
 =?us-ascii?Q?mi3rjmcsxhimcF8N2HObM1C9a5vnvRM/28EDExClrfnbgU3/+d0p/7nBDpNn?=
 =?us-ascii?Q?lVpp8/37x+mVnCeQDDR/12OzUxug46gUEiH3qCV99zBBCWOnj8VqXo/WROOa?=
 =?us-ascii?Q?ygKJAqZTA4p7dyOdELhF8GO/jFsgSUdRZoQP5puf6ZMwnxrnCg1q/L44iIJu?=
 =?us-ascii?Q?7Nvf1TX7saSeXvEIca8nariyVqZcvyg0BHiJKFLE2We6VM8/gc5xXfTNJvpe?=
 =?us-ascii?Q?rQy2f4FmryKTuTguFzJB60Mb3DqfczSOlS8/CBz63yoRiy4kzh73y2hOaPyQ?=
 =?us-ascii?Q?w+NSm+iA3t+cn5/0UMheuGzO6x8k6kkt10m+tWc0UD2DGlVy+dilgL3xamBA?=
 =?us-ascii?Q?Sh2Fyskqz8rUrETN2fC/9igAMJ8WF6cuMK4M6kxoIrnAGtj1+hjjs7sPzZls?=
 =?us-ascii?Q?pDIalxmYSs+6qF8RHchPwiopKI3L2OrRS+bSICl3RPLPQzAyQpZzmeg+QW3V?=
 =?us-ascii?Q?EsjQnQYBFJ+NTivv6fBgjzhYlvADVb2+eeSq9p9AUngWYPNNPeFj4TZY8f97?=
 =?us-ascii?Q?i0eCejKBKPSR3QnD8c+SK6I5ACf+Nk6HaMdFIzU9iuhzg0elng21HEPRHQeA?=
 =?us-ascii?Q?vEil8b5dWGvX4Caa53zx02HG8d9+sG5IctsMJ4BDQbYlKwn6GrvXEN0T/1PN?=
 =?us-ascii?Q?9BeeeKG/M8yuDJTV3HcJA3P+hFpeEwukIpRwpLBEvd1OqErpehArozMrROa2?=
 =?us-ascii?Q?kGRoFgcnF/QSdM0wsdnpMnu4f0AEVjgHSR35otDEelyI9M7pMQ2CMQrL0dRs?=
 =?us-ascii?Q?FXsq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247b76ca-28f7-405f-f837-08d896c0da42
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 12:50:31.6792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bmak2EBL4AJH5gInigh/vi7hw7NXvWACUBv9nB692G/IK/sEgEjA/88X0NXCri+o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5759
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
Change for v2:
-Use bus_state->bus_suspended to check if any port may be at U0.

 drivers/usb/host/xhci-hub.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index c799ca5..74c497f 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1712,6 +1712,10 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 	hcd->state = HC_STATE_SUSPENDED;
 	bus_state->next_statechange = jiffies + msecs_to_jiffies(10);
 	spin_unlock_irqrestore(&xhci->lock, flags);
+
+	if (bus_state->bus_suspended)
+		usleep_range(5000, 10000);
+
 	return 0;
 }
 
-- 
2.7.4

