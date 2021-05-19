Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A52438882C
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 09:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240210AbhESHdR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 03:33:17 -0400
Received: from mail-eopbgr140081.outbound.protection.outlook.com ([40.107.14.81]:32741
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239933AbhESHdP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 03:33:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEZA+8CZACEyDiihk4iXI/kulZu57yO/hvQIFaR8RQxqSR1NSMKMK96LtTcL9rG390eiUI+ZjqCNY9KuXauxGQj7x+j7EdfIVfG9GqhKufByOoV3pQr85o3SRoV65GY1PL1emZxRF4dA23AkhdfZi7PlX0nLCFSI8dYgTdKyb9p/C7dzRDLMCLIGiSTOOq9Q3vZycYCzUSGQl/tICG02k5lj2eZFm5DOUOPb+LRuUtsuABA+WmHGv3xG6w/5OdD8kllqTtkh2Ab+kYY96RTtWRlsHaHIKq7IW5esaEeIh21mmKq17FgMox8pdZ4iIPOKQFD+yFIzpZuF84IhNuEHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xwyi4oxxQ69GZLox1vkTjd2gWOXRoa9oDKotSc/nIA=;
 b=WP7chmMbJ6+8bnuw/u7MBIdlX8MSa5YwrJJQ+hWc4/gS3rXXio6FmwylTp74fhChLuer4DJc2pDgzCgkpDcjQhqXKCQIS6ezFhbnqAgQzro1RuCAc7Zc2KYMkGFzREiYSmVCZmNcDpwqdDAIPzELxRPucfra/BT65mlD+in/UEBn+n2FlXcvnQxcvSCT6pjWuacpiR54xwhHkv7z+OUelknZxzP3yf1FDela+CFgqD5HkNrTGYSuC2Lpsdgo01IuOjb8U1D72adLKm+NjBHeT90XVbmLr7u63JsD7m3tfBCAx7z1LsZav2mXuhT2D02SblrZNGDWBj0lFnhNiRyqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xwyi4oxxQ69GZLox1vkTjd2gWOXRoa9oDKotSc/nIA=;
 b=a3KgCNaecFBi4Akw7vpA7NO07HaeStQDVeLpJQnzILBsx8IYx8r9C2Em1BLHvkylDVcvWJlPQlHZlYUzbdv3nTNoVAgvbNvhmGDQtMcsaP1lH534hA7LOalV+mOYUtUPt8YTt70oFUSf3BFO10f33jLt6casm8ywei7WVDcslAM=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB6237.eurprd04.prod.outlook.com (2603:10a6:803:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 07:31:46 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:31:46 +0000
From:   Li Jun <jun.li@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: connector: Add typec orientation switch properties
Date:   Wed, 19 May 2021 15:14:47 +0800
Message-Id: <1621408490-23811-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4129.32 via Frontend Transport; Wed, 19 May 2021 07:31:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ae4968d-2436-4db9-cc54-08d91a982829
X-MS-TrafficTypeDiagnostic: VI1PR04MB6237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB62374E38B9B2613CFAED52E9892B9@VI1PR04MB6237.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QZtX73YN7AUBEEjxT+kheJCycZ4V1X7rYz+w8uNP7TE0rWJ9uQA+4Vm/FYRSvhEZfZZxxDtQljSDhV+XJ6ghHfeN64ZfyV1Ughv3Q7BnZE/uXo5v9S9qujLLCy0GPnTUdC8AtjA1PjR801tFJZ5q+q+gJHSSDuk6ndzv/cQU3DfkGX7ovBZRJN0rDXCS8Uq85MUH/40kmUysIMA0oVQRwkuziLkG5gcx27MzvCHbaF+1OB32ieljflACHmvapV18ZIV3xHS3SPOoaS476aLwZk29GY1sM1LFT8Z7dstadOyA1XaP97LPrtieOUQwoy8ha65hrQnM2FNbZZMICPF0Gb4DFOi8GuLp5RKeGaP1up9vqcauctNbCjCyWWRYTSJkVUCSrK0N+n69dH2gIFsBoJTuBvdc5jjCIPnNkas5CzNmZ20VGb1vJrjh6cdtWYpsdLjYL3equkXdBpGfFaozOUB1eDKDkD6GkFQxFx6OTSs0U6V0SpSbyQvMbznVvacjg5am7ohnU/B5RkQyzxshGwl0lrHGpmZiMguoKzuTM4Jnvn/XNcVrPLHwzV45hnAiVdJF/ne9RtJ1TVqhxije1o5DulwZvtnr6Y3cqanIFoMnAyKQVXFRvW/GEaQVcMSh/PKvtD0uOomLNIlG8NRYrMK4d2KaC/l/rvNJzKUiEwcLKL2yb4a8ueuCnwjlSMf4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(66476007)(5660300002)(66556008)(8936002)(66946007)(316002)(2616005)(8676002)(956004)(6512007)(86362001)(478600001)(36756003)(83380400001)(6506007)(38100700002)(38350700002)(16526019)(186003)(52116002)(4326008)(2906002)(26005)(6486002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Zp2KQI8NSBy7KOwMoDvJ0f6JJBfo8D1Q9fXK5uBg9fucO17MjevGgNqnFd8w?=
 =?us-ascii?Q?IzAVLJtG7Qr99HY8vSkch5XjY09J9XMRvO4xXelR+yx01O1U3a5/KlKs0oyD?=
 =?us-ascii?Q?KtmYagm68DxJjhIkpPlHnju8P6jc4nxAzR34ALYnaVd2F1LWUR4YdY0g7mqg?=
 =?us-ascii?Q?T2t0C4zB2tNryeqzA0ZuVFsQzHTB1rvae7uVk4HNxgJzvzOOo3cIOxCCH+4Q?=
 =?us-ascii?Q?anD/FncbGIfI37d+quvrrer763oDJVrh0lj2GZbIKTYRDTA3gssRFE2lvB28?=
 =?us-ascii?Q?aJru5F5qpfwqKsFBfBZA5WxkHUNARBEntyPzep3kjYalSVoXVZkboXCZy564?=
 =?us-ascii?Q?W9nU8Z7B992AP58i0I6K5xKlyPJDYf6pN+E0UcXtQckx8Sjz43p4rSOItcAs?=
 =?us-ascii?Q?SQOcx3+7catfHeRWzFsuhulnx3iz4sMScfBWUlanyoeOOdwjbl58DRA1i/DG?=
 =?us-ascii?Q?OUf6NoAY34bD3W+fK83ltDz8owZsL0yn8P0ENb40Dc54l1KLTawgE9TM/Nll?=
 =?us-ascii?Q?xarvZSJ7UaP0ZdC5dqCMV3QAJjGCWQqLkEHkq8fF43L8w9+7c7nwe6Mk9SR0?=
 =?us-ascii?Q?+7CO9w5kYreaGLl33k7uNtb5FAXNFcmIUGESwyDs2hcfUTqCmAa+r9jsl4sY?=
 =?us-ascii?Q?edS9qw+52fy+GvY2iusumV0WYWItm1cLfUzFr5BlrwD+W8o7aLKAWcmvytsa?=
 =?us-ascii?Q?vw4ztKYACTubwuQzZsUoaSdEtapANfA4TLAqc5LGKRICFKlu3a1JlxLaoyCo?=
 =?us-ascii?Q?SimdQfKzapaOm/foSPADaG2Jj8Jq/O+n4R9hWj2J2AYG2GfPlJLzeZQ+yF3R?=
 =?us-ascii?Q?Yw+gzotBvokH59UQ0LYLLxc6cJn+GvK6j1nYb2DLnI+vcDSbXQIG1qtQdIHv?=
 =?us-ascii?Q?gg94JGz3Mz+Ibo7WT7R+0i9si+GzYJhC9QfFN2KHrlFPdZgQt/aWaBSqh3+a?=
 =?us-ascii?Q?U/I9d0ztacPohZD36z3pIbzMr9ONdiPjMHFLST+fQHOKFbvj0lCP1KxM8OuH?=
 =?us-ascii?Q?SgBa+Z+6BPLcmnA9xpKC4NUlsvFdnLtbGd1tEl29l4qV+7TtYXw/j+zfrPDe?=
 =?us-ascii?Q?nmHdPM9W0JUJh521JIf/WZ5b+ibJ87uU7KRUaEZ5qPsWopPg1hbZ4ssCY+bP?=
 =?us-ascii?Q?VgY6yg9Q/04dqfHDp+u41Xh+OprOt1zISoolc3NWkGLd0dtwfb1UJbcYrh7q?=
 =?us-ascii?Q?9odZbkqBUNDeOlL27lIfjmjeDc6d1FkS/EHTv0X0wt7zVMYIWXHWcx2XihTH?=
 =?us-ascii?Q?nNT6KDSEwwubQ0Pc4nWq9Jc9TaBQuD6KB9UOn2osOeRSGq9hrxClBgpl21m0?=
 =?us-ascii?Q?wevhMMDUSXJW871mUEECcL37?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae4968d-2436-4db9-cc54-08d91a982829
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:31:46.2583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftR9uSfQYDiSLEwxtppH11FNbTRLFZwr0sQy/rE/gYDeEREB+E6GY+3Jh6a55jTF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6237
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Typec orientation switch can be implementaed as a consumer of mux
controller, with this way, mux-control-name must be provided with
name "typec-orientation-switch", along with its 3 states value array
for none(high impedance), cc1, cc2.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 .../bindings/connector/usb-connector.yaml     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 32509b98142e..567183e199a3 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -111,6 +111,24 @@ properties:
       - 1.5A
       - 3.0A
 
+  mux-controls:
+    description:
+      mux controller node to use for orientation switch selection.
+    maxItems: 1
+
+  mux-control-name:
+    items:
+      - const: typec-orientation-switch
+
+  mux-control-switch-states:
+    description: |
+      An ordered u32 array describing the mux state value for each typec
+      orientations: NONE(high impedance), CC1, CC2, if there is no HW mux
+      state for NONE, use value of CC1 or CC2 for it,
+    minItems: 3
+    maxItems: 3
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
   # The following are optional properties for "usb-c-connector" with power
   # delivery support.
   source-pdos:
@@ -301,6 +319,9 @@ examples:
         sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
                      PDO_VAR(5000, 12000, 2000)>;
         op-sink-microwatt = <10000000>;
+        mux-controls = <&mux>;
+        mux-control-names = "typec-orientation-switch";
+        mux-control-switch-states = <2>, <0>, <1>;
       };
     };
 
-- 
2.25.1

