Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D462A116D
	for <lists+linux-usb@lfdr.de>; Sat, 31 Oct 2020 00:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgJ3XIl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 19:08:41 -0400
Received: from mail-eopbgr50046.outbound.protection.outlook.com ([40.107.5.46]:20548
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725780AbgJ3XIl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Oct 2020 19:08:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXjquM9iwXAISazvSG4cw2L9ugnv3binkJCvxtqE6SaDaZTiq1TRORStnrCTOlzHmxZg1IRxDDKEB/a18T20eTWfE5JeqGgE3zyEKJQbwHAQ8iiuOj/QsCh/FJQ2KEOvZIIaobkUyakLe1rxJlcOI/WyuLDDcltjnwpt7ygG22B0J2bLHEQvo09Y2GGCPCVm9ZzUMaq2vs5Gy9kCb8ghU0FRrGV8mqSPDPQKmvra6j7V5j3SmN7jUMNF57xWYqVLs//eX7xEAqbKTxxtpAeQb1Hci+jo3iQMQi5J0L7xTHx+wXV79hOyd2ZpjmsIguY071wlfYFOddWOzrwssPWBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usNFevepz1IFkHNiHTjOVKDEqnl2ayAcJAmLVMzHSpU=;
 b=OP2I7HhgM4C4UEgsgnrHOaTM4at4c5WiZgjcPHlIJk08ZikFdEgUQvkzwlKIfjBU5C88OKFuHeMlFFQ2gWFt6EypZplkXvFIsUhnGXR8QfDKnggKJ45I6v4C7JFwPea3wUER6Acp51fGUhrRJr+KZbgZyxUTd9tTaZew97HqZ4YcsVPtOqQatD2WBUvl5Rjq3hHTmAbcE2wAGu+isdDuE1Jga6mW6nuQNKhZ1V+o93EE7pnflQ0L8bEaDXK9S7jhLxYmA3cTxqp/4QLeYhWe+rBNtR1l6D+HMgj1FAyMPkUx+w9C3MrwaGzn2ZxQtg89HcU97N55VyZgKpHGlpm3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usNFevepz1IFkHNiHTjOVKDEqnl2ayAcJAmLVMzHSpU=;
 b=jKXwiUHBIvxvKssuAH/aNJa8VyFHEJie0gp9lW8AKqeZZVglWq7o9Vuh2t/I+sj3d0x3sSswAoixWPNPTNp1usHcVBlEkXGzQadbrP4SMAoTqaHkLnssmQJuWiD/zhz/csONnXlH3AamUs/nQKv3fP68/nTAT685iDnrWAxWExk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB7123.eurprd04.prod.outlook.com (2603:10a6:208:197::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 23:08:35 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 23:08:35 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, pawell@cadence.com, rogerq@ti.com,
        jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/1] doc: dt-binding: cdns,usb3: add wakeup-irq
Date:   Sat, 31 Oct 2020 07:07:52 +0800
Message-Id: <20201030230752.2950-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0145.apcprd04.prod.outlook.com
 (2603:1096:3:16::29) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0145.apcprd04.prod.outlook.com (2603:1096:3:16::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Fri, 30 Oct 2020 23:08:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d984c3ec-c3f2-434a-f533-08d87d28ba45
X-MS-TrafficTypeDiagnostic: AM0PR04MB7123:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB712378F3338FDBC2926D7F5A8B150@AM0PR04MB7123.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Am3GG4Sc3GggIVDUho9PnUbqU0LxkXowjfLyuEOcGMuQKPyi6fMJOWdYgrv7YHQUvSzs0TigbLuM72kmU4JR/Rpk+DMVVHNv1A8d0u6up6s7JOOrojYTW150ImeOvo8BXRbzRdC400IcoTPsgyvrAV+9LuCld0fZ/+Bx7dyhIUJNNvqqMgjxCkeQsGj9YL7Y/MESNLpX3eDazLGK/88j5tI+JgcJFc5dmGDFRagaSxSF+W+fGprIOWPw9dU6YvHQcgpAbApgtlInfskiBS2hmzfZOe9Nx1u4wqRi9ybaBf0K3KrFCoWdzMYJ1LmFYekrRPE7pQpp/4CclB0jIOonNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(366004)(136003)(346002)(66556008)(66946007)(52116002)(66476007)(6486002)(316002)(86362001)(2616005)(44832011)(8676002)(36756003)(478600001)(4326008)(6666004)(6512007)(26005)(6506007)(1076003)(5660300002)(956004)(186003)(8936002)(2906002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kaiQ/dzahyN3bcFEt8z0r5hGTU0N2pZYBtE6HgX36+gbURM3dxAx0RtjFpXgeDsotOGeHQGJU3ZfI2tnrAutNV0yj3sC6U1fTCoFBYnBChVV/HxxAKibXmB1D4WZ/l/HxCvXbxIGn3ZYWFxiQU2/fzu0sYJtLqiwpFVfFsoxgO57M4pjEe+bZxA3nKKm3CKewgNJeROW8JOnPNk8YHvjKXEXI9wTqrLLDR4NORIRyC5BGMR4LvW5c1YwZAjhzQeo5nxnMEZaNJkey2tll/H9EhE4iIfMRGav1rguo9YimV8We1LSuUwuZ69TlnBQypOqjEzSHSZDA1LWcG8aVBtcqHHPfW6x2rkUNWRQ7XALcYlq/R7Mj1AFCuvsahcAxETIttqmXhGl6lm2iz9Olha3eEx4bDXxMH5HbQfS/6f9HFyKKJbD6YJlyEGlbhP2leGHDn57pQLEMdLIq3Fgj4CFs3zbuowyDUq5mBhNiVzUeMd9u2ei7C7mC5AIQn6Ytk4bYyoD5mUPzTCOAlikGpJ+myq5Vnql5vVTIhdNAoxRXZ/ZWzWRiR90gYGxV2ybNVQKvh6s8YrGMs2UAoeXKf0UAuUdnWA1I8XtU6GVMfO4aoFVlL089PR3gMOSkRR6XiWmxhRdj7qRXpHsyXgcmdu5wA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d984c3ec-c3f2-434a-f533-08d87d28ba45
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 23:08:35.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7zUNHEyoMVHlbiYgX3nTFHaS0/2UyjI28oXGQYlkTUdt9pob0Mhqw9xdSHktNv4Srtlm+TwCz9AwruoTGaStw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7123
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To support low power mode for controller, the driver needs wakeup-irq
to reflect the signal changing after controller is stopped, and waking
the controller up accordingly.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v2:
- Add "minItems: 3" to make wakeup irq optional

 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index ac20b98e9910..44b19a7298b8 100644
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
+      - description: interrupt used to wake up core, eg: when usbcmd.rs is
+      cleared by xhci core, this interrupt is optional.
 
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

