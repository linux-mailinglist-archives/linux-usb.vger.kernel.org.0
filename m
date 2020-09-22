Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31045273FFB
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 12:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgIVKyR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 06:54:17 -0400
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:10333
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726454AbgIVKyR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 06:54:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KR0VRtxxgNvqgVoOLnCrkAT/wcQBocdiT2FtxVP1LdCZ1NOXzyrvA+7NTLbnP8/gpePciX7vDQzkiPz0aicqtPlfPUWiCcITnE8wt/B9hLi2iTf8GqRAPH2sITfIsvk5HnqATXwLGoBDRtRMheDGlT0FLsS9mbTNKYFBToP8O5MlMTH9FD6coMQOHlTlQ9HbORMJQatpczFS8ao9HYvFkr6yRcvcrwIVsrdydd4aS3Hm156FjNzJtmEA0r42clJYq1aWjfk0hWdHi3XXowVkRFI3tD2ArKaszfk09lHo/w6eL1tvzyJfujSJLFoOoBSeAQwwFPoA17BUtGulqmc4mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFy2fXuiEpKYhzI0Tqc9zHGXNcryPKf6Q8hUDAg23wI=;
 b=ifNBC8SmXBC+kzShFwARQiAM7YEslhsNLMo0AM5njNT+RT88bi5tJL9Q66L5+LPgVH8pluPLXTHqFQrfkerDMAD7pLWsZPQTKOLBTV3ImHKFLbAZuot+KAblctrbhJwhWuwvaK6Vr4LSLTD46r9Rdd00Qu7UFaFku9tg1/LJ5R4afFqSL/xiFFTkA0nQ4V7sQQxjuCg7SWga6RdNkY42tdiTqkUNErGkN0aq3ExPKFSHi/D2gvV1PaYiMpH7jCG5IwhefTR1LHjlyz9a68iQj/unBQzi+OF1qv7F5EciQSQGQ3TmS318ZmE8EPKQ4sjNEXj42EVDY6PXdrPOon7eFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFy2fXuiEpKYhzI0Tqc9zHGXNcryPKf6Q8hUDAg23wI=;
 b=dlF84oELjaVHHdFBd/D9BcfnTDiC/Y1x0YNVn3ZV5GV54yC9gemdMLpKVDrZNuVb5CdWad3wgDHUIA9h4CanQoUndjif1mmCFRdBHPOKvTlgQd4MjuXfAdkwYPT5AY8TZi+h1pX+FiDjnZcEZiGfo2lHdDB9OkXHwxzdWdtQQx8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4255.eurprd04.prod.outlook.com (2603:10a6:803:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 22 Sep
 2020 10:54:14 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3391.025; Tue, 22 Sep 2020
 10:54:14 +0000
From:   Li Jun <jun.li@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, jun.li@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, qiangqing.zhang@nxp.com,
        horia.geanta@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/6] dt-bindings: usb: xhci: add property to disable xhci 64bit support
Date:   Tue, 22 Sep 2020 18:46:47 +0800
Message-Id: <1600771612-30727-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0017.apcprd04.prod.outlook.com
 (2603:1096:3:1::27) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.66) by SG2PR0401CA0017.apcprd04.prod.outlook.com (2603:1096:3:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.13 via Frontend Transport; Tue, 22 Sep 2020 10:54:08 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8aef5c4d-91af-441a-896a-08d85ee5d805
X-MS-TrafficTypeDiagnostic: VI1PR04MB4255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4255051A892E89EE000D5E9C893B0@VI1PR04MB4255.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDvuuxs2W1LpIgqYanwO98xx0KHFpcU1y1QeGn10524JGfiIFnPgkJtvckJZFdnWuTwZ5WLLNIvxVAUgG05GKJAg7kOVUMEYqS5FTiAntmTfs1lANfiVieWZE7j6Djc16NPJoYc3YWs9orpsUNN4oMh4GB2eosAPEU7EOBOfNhesDE4TscenGKTEzyVESBGFm7ne0laF9Si18nzE5WCA5fjRdaED+ZAytFE8lap4NAle48NTpz7qBydP6f7VsGlSs21T1MqBGj988PZ3VI1karguI9Ng9ChQlOLCO4vmgVmeNTCvKraVfN1WtjevL0JY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(316002)(16526019)(86362001)(956004)(2616005)(478600001)(8936002)(26005)(52116002)(5660300002)(8676002)(6666004)(186003)(66476007)(66556008)(16576012)(4326008)(66946007)(2906002)(6486002)(36756003)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: B107vV4EKZ/5haqje46+R98iPd9n9F4pgvExIjUpR+weP5PpWXBZROZpswA/R5qiAWUQCPlttqxtzedm8cr9agYYXmiXmqXL8dNnzR6aXPQZNo2q0+/1GTcIUeo0Mldw+jtnFrbbrTgMvSDF8FzValKdfAzSUMx9Xcrs/srsCe8mCtOBuzleSAYVpSMBSZsCkgTafac7RixmpVkzKfT27Ir8cTvNn//MQBT9rrPi69gJ5mL6UXkjv87gTgAmExF7+zrQcJRVwTDzfJSVDYq+Nssj18mZ45KrHmBGWlCpB+RzifKWXLdeqDZO4FA5KduPqbbbEOhFM4MKGJwtLCYVFo9LqStWbmWI7VozAbFuJhrcW6AFhrG32wE7eLTLnRkla7glDjwXDJPoL9AWSzLYuMjlpbxEqg2AImASZ2/7zbzn2eZk3hnmmjxM5N2eYRAkESiWwpk4Zopu5e1G0KOxV2gaE2oVNAgyEc1hO65XQY2RYJqiGx4HuXAfsjydRqdIeLlTMB8vy2wAvP0ZRHtkPa3eu69tHSlnkNAVLRhHirDZt3q8q/cvI6kLZ1D4CvDhAQ3kQFWpDzdr3P/XWSBIn773hW9gOV7xXrnsMAjZdu0nkp1NFZBJNgzH9h62s6x8JX8a5Os0XPV/cL95alWs1A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aef5c4d-91af-441a-896a-08d85ee5d805
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 10:54:14.1996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02a7snJbpPgHcmKJ8eJJ0JlYfeEMfER0X/3rXvQw8CjR2idytee8Oc9qF+4p4hvF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4255
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a property "xhci-64bit-support-disable" to disable xhci 64bit address
dma, some SoC integration may not support 64bit DMA but the AC64 bit
(bit 0) of HCCPARAMS1 is kept to be 1.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 0c5cff8..26446fb 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -28,6 +28,9 @@ Optional properties:
   - quirk-broken-port-ped: set if the controller has broken port disable mechanism
   - imod-interval-ns: default interrupt moderation interval is 5000ns
   - phys : see usb-hcd.yaml in the current directory
+  - xhci-64bit-support-disable: set if the AC64 bit (bit 0) of HCCPARAMS1 is
+    set to be 1, but the controller actually can't handle 64-bit address
+    due to SoC integration.
 
 additionally the properties from usb-hcd.yaml (in the current directory) are
 supported.
-- 
2.7.4

