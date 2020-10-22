Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC68295623
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 03:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894793AbgJVBoz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 21:44:55 -0400
Received: from mail-am6eur05on2078.outbound.protection.outlook.com ([40.107.22.78]:5857
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2894779AbgJVBoy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 21:44:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpTVPL///Dd/mCWaDL1vnDhfhUGhZi1wbrSn36M5LeS8/s+kokhPNPQ9hZ/X+mU4bx89Dgk7pBcd6R69brapBW9BjZc+egDLMmcxhElECeHWp/OKIFlqyE/aGpQ/xU2PZNgWBs4iGtMovs6tcQMRkd1tLWP/ZzsjTNM++5aC97oZffYm9zh5lJf5ckZGi//jLb92fFgk9fh2/99edY8Ds4UHvWDERB31JWfqf/UMhhlOxNhMqRJQ2yAK4baDyLGEqdcsDfu+ZKcWFuMzMJYE6BIVRp0jdWNEcP9l2qTtPyvmZkPaL5m4Fy0WuZqbs95jDH2YDdihj54TF2/NgKjC+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BS1g07yGxCYLJMy+io9URR4I6y5m3vkNJmZmGt6AvQc=;
 b=PxDom4URzK7+5Wt8CCfXoL83lmFUTy91eEb56gT63tOjvZLHFn5nRRl4fAy+QvZBJrt4TGI2SKkYj2D6Vge2lr9XbhrCYAmHEcQoBtfDaSnSsK5y0kCo7fabqsYn+BnJ3irCMGX7LumV8f/MQyxUrJErqk8JK4T3meHc6GnMU9vr3HI8C+/MlCoYnfewTwdrqV0Wu65eBOf08XgD/e4JojwPeUHwJvVhACqCyYE12PAQmog0UTz0Ne6VCs0as0hcsLvJo3UdVF5mSC/3Opady36NoXKldOLkYllZTdGaF020vkPnE+7Ljq4mBgF0HZ1+9Cn4KQTBuSqhm7tyoTGJTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BS1g07yGxCYLJMy+io9URR4I6y5m3vkNJmZmGt6AvQc=;
 b=OndY0hOW7+8RW8oHeoJ/RbJ9eY/0IktfccaaMKXvlBx6skRNGXfgA9Yq3BE5W9K1CWbVl2p9SJegwyK0weBRfZjiLvqs7E+IX3iguT8EUKIU4zRkijHlZgxjvii8rjxHJk397Dfkt059BoB/bh6oOd5OhN41vWLH8REiyQpw6gs=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3539.eurprd04.prod.outlook.com (2603:10a6:208:1b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Thu, 22 Oct
 2020 01:44:50 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 01:44:50 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, pawell@cadence.com, rogerq@ti.com,
        jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 6/6] doc: dt-binding: cdns,usb3: add wakeup-irq
Date:   Thu, 22 Oct 2020 09:44:11 +0800
Message-Id: <20201022014411.2343-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0102.apcprd02.prod.outlook.com
 (2603:1096:4:92::18) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR02CA0102.apcprd02.prod.outlook.com (2603:1096:4:92::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 01:44:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 651c9be8-9211-4af8-9ea3-08d8762c106b
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB35397CD8033CDBD2F667D0D98B1D0@AM0PR0402MB3539.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vHdKwVQU2C0PdecpOtgrQHC92f4NyG06j2Al12wlUOcj267wZC2xcE53spMtanE5C9uFO5FfWYZgpcD7Jy7Y3mndcsKqnWkQt5n58rmP8I0swXrraNln/5Wy75z1mOF5WuqECt5zj3La4zvaVdTCwysq9fhRj3b9Rc+JbpkVKAME3ztawCRtETopD7LdQNLrxUO5iKw+hQBveqB4uYbetGNanYHI5iTLONdWwmjphgvheGmEzcx+fCn36t+exgFBsGq7vVFCpYRglz4norP16TYkLchQWt/4VLX0J3EnCtk/Ixi2Vdnl6zmCXMMTeiFJWwP0iot+U2Sh1GK0roVQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(66556008)(66946007)(66476007)(478600001)(5660300002)(6506007)(26005)(6512007)(44832011)(6666004)(8936002)(186003)(16526019)(1076003)(86362001)(4326008)(36756003)(52116002)(2616005)(956004)(6486002)(8676002)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: TLYCKDqb49iBh5d8CoyLaoaZwtHHgjiN57dbxnYH0JiQbrnNqHpCrhHyLGwNh5yvaRUFupnkQrK3DGxlnYUHZR8r7g5W6LI59v2EfMtdiXpUnYfzB2Thklbx2fiJS95nW3cgrmdVPT7AoiVfM7mlSfIirMQw3Fp4vE8p0cUh+y0o6c6K8eFr5Fk2TMY/UiuGY+aGQ2boyLJYcnpeKsrHpGWvtVJP+5Xhk/krsCAcxF3sme20C3niD0jvxZlZ3h/PyDlT8FkvFp3NEciSeEW3E15zXpbWScEQ83i8OQFPRXkfYCV1z4TV/z5VTF8Apjf9vfO6r8bbTSzQbwdAkAZCVR8tA0oFhLJwpg6a87JCoB2sE2OxgH1iIZnL7dIktiYUWhyUK6Bp+9x9ZPxM+nshY+V/XuN/u3O6K2oNDvvC2QajP0S2nLYwKVMUIDNiI+nUu4wKE5teiQhYMuj5mIdE2FV5Cf/Xtl/ZCqTSGFP2WOjOw557Z+HnmRELKQXe3MyFvzbyBYf1vxb/TH0gC9T3DDjPxeNh2e8mBkVJH3SnJkBEWKTakoayAVLF7hgoxLFp6amtTTPJ6JROsSokZjp/TSC1tljU7q80Qw5vvIBOv2xO2ZaiGo/VbQxtWWg+TDAja35DQY0jRA1Qi30HhmHZCw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651c9be8-9211-4af8-9ea3-08d8762c106b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 01:44:50.2098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eh9tqBVANDVKX9HwxBrjRtRZoOqbR0VPkgbcHpX1h8UwUmFSMm04Ekm0+d/Y/182xwXqPIKfI3ZKCiJAl6DYDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3539
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To support low power mode for controller, the driver needs wakeup-irq
to reflect the signal changing after controller is stopped, and waking
the controller up accordingly.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index ac20b98e9910..0171e64ef95e 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -30,12 +30,15 @@ properties:
       - description: OTG/DRD controller interrupt
       - description: XHCI host controller interrupt
       - description: Device controller interrupt
+      - description: interrupt used to wake up core, eg: when usbcmd.rs is
+      cleared by xhci core, this interrupt is optional.
 
   interrupt-names:
     items:
       - const: host
       - const: peripheral
       - const: otg
+      - const: wakeup
 
   dr_mode:
     enum: [host, otg, peripheral]
-- 
2.17.1

