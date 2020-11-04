Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86292A5F1B
	for <lists+linux-usb@lfdr.de>; Wed,  4 Nov 2020 09:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbgKDIGJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Nov 2020 03:06:09 -0500
Received: from mail-eopbgr80051.outbound.protection.outlook.com ([40.107.8.51]:50309
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727672AbgKDIGJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Nov 2020 03:06:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJjS99vSYUTr36AtuXSFQeO57Y/S6sfLEhpWUCAvD8A6U22MwnHlT23IWlEpLC0FexBRh5wNyy884qX6Uk8X0Ci13AziYKI9DPc7xreRCqwfdz1xXmlm8RFW2EnoKesDUJWGj2QjirVVqkFkBxZhcfCkf3A0o02SL4Q6L5EW04Hwpyc18HmSb1w75CfLE945iSXR75EeJLmkHswYqbqt5CDTZIZAI2j720CHtiI02BL73cVkPrI2Ub9tprhceDm6LYiJckrUk35XShMNhgozBwwjLBgSnQhjAbNdLfQWme/NpfQ4FzW3NEXM0QrXKlFf7RyBoXWrSyZMyYkUSiVzHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/cNN6W2ylhoAoCAPeltPZhzswmvNrofA604oRP/bYM=;
 b=CGNhBlVdyabFfZiNX9QwiFL3F83XCyK6GLHbKoxxVt8HfjcxYJNQoqpMLQd8OzwXcWr3Idb/AP+vcrADyD8Qe4yImlbyGu5tq0Xq/O13+QMEbyiI8FAR4VW1nC8WZkpCVLDjeUkXkg7nkK4Wp8G8xRVII7Nj8Tbcit4lqrHZgwdPBPHKlNF1UtBOQ+0onaSLF1GiNHLd1Fly6tTCwVlEsu8pp1xqEtvHA0blgQDMkhxb8qVwABg4RWjl1a9uzW+tj7PinXwUT4RQQ5eSPR5MwOz/J0zcf7Wpfcst/jTSRTAuRg3DbsqwH4KusdabP/m5YGaTD7YUBIUhZlFb1nupbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/cNN6W2ylhoAoCAPeltPZhzswmvNrofA604oRP/bYM=;
 b=NqAr40wlTYE534v3A7qjN21fFzZbnYDkCcihotFg1y7MLcNZ/z2u8O7gcwmGNiU4hnvFkMT9q/9ph84Zkd2L/GkA5we6uOiEqPZUw1i76p/qxgFF86yBPgJwvH4r4vDolvMjRRD/AO7O80F+y1IQqERFUwB/00K4M2yHaU7phgU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM9PR04MB7603.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Wed, 4 Nov
 2020 08:06:06 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 08:06:06 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, pawell@cadence.com, rogerq@ti.com,
        jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 1/1] doc: dt-binding: cdns,usb3: add wakeup-irq
Date:   Wed,  4 Nov 2020 16:05:24 +0800
Message-Id: <20201104080524.1821-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0144.apcprd06.prod.outlook.com
 (2603:1096:1:1f::22) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0144.apcprd06.prod.outlook.com (2603:1096:1:1f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 08:06:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c546588d-a567-4441-d6cb-08d880987b27
X-MS-TrafficTypeDiagnostic: AM9PR04MB7603:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB7603C340552C8D4198D421178BEF0@AM9PR04MB7603.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xH4UUXQQy7eXkoXr08L3NrNrGudSGbip6BXwTCT3N5grHPB/dQVI/Qp7ta5s6L688elrQLSO+vExBqf7HkyvAJsmHgWOVc+IS0cAaWPJKgNNY1m9IVZ9rEvxdIhlUKyDuukDqEWdBDwqozLdNwknuk2azSf1lxRH7+/41iJ3uLk4lbW5xURPInCafsJJGYjRo0J6Or77LDd29TeIKeLWWisleI4ZtmtwrZb1I28yGZ5LX8WqIbU1AOq0RpGfZ8538QumOUvpF2JLLuD2F1ufm3caIcfSzWF0HCyOjaUXP13N5XFpDoGlAbSDI/esv5BxDi33YklaJ9NoS2QfCCvwqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(86362001)(1076003)(8936002)(4326008)(36756003)(186003)(26005)(16526019)(6486002)(2906002)(2616005)(316002)(956004)(44832011)(66476007)(66556008)(66946007)(52116002)(8676002)(6666004)(478600001)(6512007)(5660300002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Ow6IiyfePkIPLoCmrChvyGGPIpCRUhNyPaVRH06cRCIqUwS9U0UWIPzo9N4ZJPPseQ35Ubgst0+TXN4Z85aZ0pdhr49wiapXniJcsGnvFF5dTuHGI104XpgDSyDW6DPkwcHGkCqwsduV+Ywsujy/q9qrPJ8UPJDpS2V60cIZwnWx/X/dG4e9LgRhkpPS7qYREvsBGwj7ETpNUA/s2NvOi5zgG2+iv+i2FT0vjvoY1FVbUib+Jb5B0GhWm00cS4099I2gq1eXe7r5W9oScdij+uDEF1/yrjbSO2upt53t4OiYvK9RSiu7qdbn2ZGiiqk8CobPTsRjCUlgA175wFyctQcGGD+n1UWSG0IbDFEu/Gwmut+AD5bdt1J8DT/uYqPx/F/e46j1gjIZrvfPIvDbUVJ62joHNmEZvBwHR3wmuUvuWiWMBjQwebE94QK9+b1UMBs4UTM/wzp1WSMuXX9JG/y3D8ZZ0gMQfpE7mQuPtz9G0BpqUrV0ndqlpC9cRmM4TFUNlM06cSLIrhfHNDW0lQ//2EGQYQ4g4UugiY1P0gidum5HFOZv8rZV4rxIuYNf/ASJGVn2OV660N8NcJqEgwOJxBnHzv/x5ei6G1FOLpAbIbi5bzM7L2vg8/6Jcx/GKwusGuEdqc98+hfuB02DLw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c546588d-a567-4441-d6cb-08d880987b27
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 08:06:06.6321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0/xMICIsClp8/EvEuRtOvkN/z04WEQAPWxy9EliExsVe78EFSJE91p4FQXLb7cDvatEnN5Vd6SSLwyrUSs3gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7603
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To support low power mode for controller, the driver needs wakeup-irq
to reflect the signal changing after controller is stopped, and waking
the controller up accordingly.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v3:
- Fix the dt_binding_check error

Changes for v2:
- Add "minItems: 3" to make wakeup irq optional

 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index ac20b98e9910..b32c877dc2a8 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -26,16 +26,21 @@ properties:
       - const: dev
 
   interrupts:
+    minItems: 3
     items:
       - description: OTG/DRD controller interrupt
       - description: XHCI host controller interrupt
       - description: Device controller interrupt
+      - description: interrupt used to wake up core, e.g when usbcmd.rs is
+                     cleared by xhci core, this interrupt is optional
 
   interrupt-names:
+    minItems: 3
     items:
       - const: host
       - const: peripheral
       - const: otg
+      - const: wakeup
 
   dr_mode:
     enum: [host, otg, peripheral]
-- 
2.17.1

