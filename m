Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C89B272FC1B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jun 2023 13:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243801AbjFNLNs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jun 2023 07:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243799AbjFNLNI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jun 2023 07:13:08 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2052.outbound.protection.outlook.com [40.107.13.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F7B26A6;
        Wed, 14 Jun 2023 04:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYbXz31sJn3DCaZepgDwUjSz/6SvP/UsQMk9+RHFmrHTkFtw0yLnqhpu1mWazP6fUs4tHA3CMBxCjPQEygVbF6F+7a+93krse7LXX7u0S/0spDLJX1Pa9jVXyHQ4/api0xftjCYYn0cmNMHrl8PgyjpMkJzEOnuN4YBElJ81/5LkQOjcZve9j/G4bqo4Bc4WHl/yo50EW4Q5ytkihD6Npfa6DVLTUnamjrC3AVF/vl5ZNXM5MYICswDBqD9qExmI7EbSoqituJIB/LUsh5adZJo3X2YirIP1lbluc8WprVN1x4Hf9mJltp8CgOOZet1LXxz5cELStN630VoyGCuD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJ3F+Ab9o+4v2mwEAzoSllaMFtnzcSWi2Y4/wMRo138=;
 b=gVHbBfX3XfCjR5qfT0b/db1hrzJLRvgnLk8Gj1mE3MtzSxXt6BwB4eaj28FWtwGRGy1YCykheKaZSuQVvwofN+7r8nKPtyQZAB5mSw49jwLuw0bNiRuEta/myVh0cFjwE3H8PUzfs5PaX1TD5L+BcKRJDJMEdqp4hZY7xm1aZTeR70PbXoTBEgSwnIUxiFjukI5RALuJeMj2PS6ulLJwb3KdyQC9hCQ2P9sE9RRmrOXi4eEYhDV+0qszAr1sK1iXjmlD9IALUbykPkePv/G7MU4p8FRPH602a9eTHP7Jx/kO1PnWhH/JPDKtfUrS2+iatgpGeCyiy+62HACncco2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJ3F+Ab9o+4v2mwEAzoSllaMFtnzcSWi2Y4/wMRo138=;
 b=QvMc2foxcFrjinhHWPvigwpPRaaRtEngZ40WsXVngtBtBzvyrs+VB8jAQGqXxI0ZZEDUXTv/Az+cjJQgM0A/oiCpAXM1uTr5tbAyzw1Bl7E/xtplaRdaz5xkOU6IJuFS+1e+Glc7XsZCSCUNn7D5n+Fb5NOer+bL0xEU9YWqtc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB9174.eurprd04.prod.outlook.com (2603:10a6:20b:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 11:12:31 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 11:12:31 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gregkh@linuxfoundation.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, jun.li@nxp.com
Cc:     Frank.Li@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, xu.yang_2@nxp.com
Subject: [PATCH 1/2] dt-bindings: phy: fsl,mxs-usbphy: add fsl,hold-line-without-vbus property
Date:   Wed, 14 Jun 2023 19:15:47 +0800
Message-Id: <20230614111548.1815146-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0191.apcprd06.prod.outlook.com (2603:1096:4:1::23)
 To DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AS8PR04MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca93a90-65f2-411a-439d-08db6cc83f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VAzqHTg+dTSi+CvJ48kzGzrAVXFaAMUIVKpodZcPXZMNkRfJ9Jzvwlwj6AyV2INDt+YQCnO0dH4LtUmRn/m3a1IyaNA4Tf4Lki+1hyQAw63qVN84VFPuicX/AaFxA4rBEjm3fgmdTW5+BXO7dxa53IXRS9LGLaS2fKpN/hK1VOXAE9HRqmnl24k2kNx5dT8lL7//tDBbkNZWb8qH4lrCo/21Tgj9v/tp/T2MTYecFQWjKdFJmhgBE5Kwos4drhmdePnDC7KugHSKBN6ijIdXep3bth3PzAF8h7QjDEmqBlGiFT0XCCNy4NPu/JZxf2mKGLG0tDi9NkVPHMig5Ii0zKlCHmnM/xngFmJ/+9GobWIrw3MEnXjGxuGY5IlEIp3Rqj/X9t6MGiymsHBVovgpivid9HICHXumZTr477LSewcRGqzt07DyBrx7i9PG9iPlgK+qrqD9boUrWIw4tNXxFSgAwxDKq9Dw7dVeix1gFCmud60Szf2m9sW0sLVA6QGL23iEWGsh/a3yRt6fqhkqe/Yn7vdoYTX/Raj/CmT0MCX1ZPL9uiAq6sqdV6V7CFYiLzVnLZIJRyiot5dFoS7TgRJ7fKiWL/1dulz1AV06o9mkr6RfMNPHi/bo6OMGq66H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(38350700002)(38100700002)(41300700001)(316002)(6666004)(6486002)(6512007)(1076003)(6506007)(52116002)(26005)(6636002)(66556008)(4326008)(66476007)(66946007)(2906002)(7416002)(86362001)(8936002)(5660300002)(36756003)(8676002)(4744005)(2616005)(478600001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zelflaCuyEUUd4soRkHtFkorUHBnzIIaXX5OXoHWQ0x3eWlfYQmoKGpVGXEH?=
 =?us-ascii?Q?RVsmrHACaLAbAeifxcox4KR4TwqBjlj47QsJ2n4DJe6rlOBD3AI3vBi4wrES?=
 =?us-ascii?Q?JFADx9FwrP7zvoQQlJ7uXle8bFU7Q9q7c1aPxk/QBzLc9jgQQ8saD46VBSCT?=
 =?us-ascii?Q?DRd26YmpTyo5Z68dUfczJPSUnJfHPf0e+b/WpDjwCGuu75avSjnNcpN4dJP0?=
 =?us-ascii?Q?xHqwWep6ATNK54JuyhlVi5BmeWR21K+a6pDllGEeCIj491uRprAPWtvBeovV?=
 =?us-ascii?Q?h9T5JI7WEN60tuSFjOYi1szFIl0qwk+/2ESguSc0jgwtNyXtHm0bJL4Cr2DM?=
 =?us-ascii?Q?IoBNbiCjxtv3Rb6aBLamPFSiTxQgxb0nJ/hLiyhyWcbBH6k0kIPtrTdrEBF5?=
 =?us-ascii?Q?M/Pze8WKRS6Fcsz5cBhDe80sW4Zs8F7UF/2jPwNe3cIy8rkG53vkxRIbkcEf?=
 =?us-ascii?Q?nhGTuZV6SCJNYsbzJokhDbBtg+xEWNk0KajB7Bo3eFHnWicPPUtOJpX+psED?=
 =?us-ascii?Q?jJwkDTAXQlBSIPVMWco4IteGJpcU8hRs74DZEWnJM9/NlbT+BeZ+3O5xKaS5?=
 =?us-ascii?Q?00o9lk7SMg2eDz0Ce9rBEMDhvntfCUUnHfM5EJxNcLkL7srxg+UYL+nPadZ3?=
 =?us-ascii?Q?MR+9S5nWOcJWOauyOwYRVQSu4lVwj+l187vQTR3KdzdBP1CX9SvlXSZooVgK?=
 =?us-ascii?Q?gIaQ/OfAilKJHDn0/AcHJWFDlVsK9f5aFLv0RynNe3USU1R2lIlb3q7zQB7p?=
 =?us-ascii?Q?eIjGOPmkdWZk8YMl8MVmKLhizEajMpo8uqof7wRrd6tPWNsCUJ4ma1K7FB5+?=
 =?us-ascii?Q?A5cA+XzZP60gS6WCna7qDDhfjFlePKHzsSgGumIL2elYkCZ5ACybp5LqP3We?=
 =?us-ascii?Q?I+2z6ThOnTspeICSycYX/h5pb/px1QScrAMxynIyLiMSYShSZjrZkUom+VoF?=
 =?us-ascii?Q?rFp+RFwR310jZqIXKFsbtspRxq7TIeymlttHbAURbZnJkph6SR6JR9WaQW+k?=
 =?us-ascii?Q?zAFZ9vR+fMPLsIy99jMhHcjY24eCrQicxuEOswB97HUQEA0khG8ouWz9xOiE?=
 =?us-ascii?Q?RrKnicwZSsB4GrtEI3P/X6yy7KeL4wUoKZCmrYpKVn96kcVZ2ew3stKdhaE4?=
 =?us-ascii?Q?CG2Bhyw5cZqs8JIWQO1se087dX04Ui0zBPrCvcTOfeF7m0sPvzHIiqfi8Xw0?=
 =?us-ascii?Q?9mnqRkgudpZJw+YcFJjAYZuHyFc78r2zLTHiLvGn8Aksy7/lXhFD80h1iFtE?=
 =?us-ascii?Q?sTYzQMMain24OI2rrY3rbrO+w7W8bVj71cfw7Fq3I3SM+jKXr+YrWIqNgPCg?=
 =?us-ascii?Q?d55ApNuJa2L7edmiBG0887CRsRKnesMtuuIAeFd3LqK7mL8l5taLymMsj8m0?=
 =?us-ascii?Q?YtEyG3PzeJORFM4bnNfkXHufsb8I3Xgv6dxpShrcDS1CbFOkfI2aEtQG5VIS?=
 =?us-ascii?Q?+rr/5/PvgPfJbc/ND5iskzN6CscPFyiKVfoLEZwFwaxhBCIgyEf64h+dTdNN?=
 =?us-ascii?Q?f+ysZADYJ8SAo9vxEvPDX5bk8pZ4pPGe47Gtxjx8Ayf3jwRYy7d3U4idD1Pr?=
 =?us-ascii?Q?xqZiIGAiR03Cuw5xnR0F7ROdAvrCf9AXcl50DSjF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca93a90-65f2-411a-439d-08db6cc83f2e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 11:12:31.5731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsQTBVaWdU6Cc1q5w0+qpg/ZONenE5hcHutiIOMq4GzGPjveEk9CfVPbW6p65NRLAzxVtuzXRQUaZfsWaEDeLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9174
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The data line can be kept or disconnected when vbus is not present. This
will add a flag "fsl,hold-line-without-vbus" to describe this behavior.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
index f4b1ca2fb562..c5f9d8a8298e 100644
--- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
@@ -87,6 +87,13 @@ properties:
     maximum: 119
     default: 100
 
+  fsl,hold-line-without-vbus:
+    description:
+      Normaly, the data line should be disconnected if vbus is not
+      present. This flag is used to hold data line even though vbus
+      is not present.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.34.1

