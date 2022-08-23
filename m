Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 691DA59E538
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 16:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238284AbiHWOh0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 10:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243423AbiHWOgk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 10:36:40 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E77C2BC429;
        Tue, 23 Aug 2022 04:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFlH/fHFpKjGaAYtYiJ1xQWVa+OO2NZZbOScALbIsuTYOWsthAUPGEIAqzN6T+1XTaHOUIN6u8oD6M46q5VoYki1a7BHMY4hYj2PTGvhN48c9OaMq5ck8COf8H09//W9QV9CQzJwH/TWn7BHuG8McsE3TYMyjzOzoiMYzGjZdQvROMtK+t6Fh/2N6cOFBbtq968/70M2QDUjJi6hB1lrOjvp28YGPNSA/0yI3AKqqVuaSH8LIrkPe0ctmN3OMoI1KCZ52vBDWEKWxdRsxw4sHg/85nq0mgruHK6o6pKWJegkoUk4K5gwauFiKkETvRtLxHYhvIhw0MyMlRZwH1l/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hclc/fKCMScQuXC8QLzOd7QtSDh2pdKucfyS02tR6m8=;
 b=HSabk0TC2U+Q5ONQG1Cv7FZRnBsHzfDIuGF9RMnox4wImDxsZ/HkqUiJ1HEbxJiZ+g2cZSjz8DfKZfIDMTaA/cwSs0Hnqhub14P4xEjC6AGcg1AjSyMuzxCEZYZ1wnfB7F5XWG0yJhsgvDKTujLbzy9GbsSWXSq6u9ONRMzfiHFD2VOCF3nLe8idBeNe5ZvcRi6ZqQ3x55hprF1IMi+uDj9SlkOUBxAtBWmhvVLqSdoRNB0StYtxJffUFOplXwK16lPCU8kDiVJCBUDGeq9akPqdrvuQge2cN1dDMsq60oz+vflR0jWn4lZGZJUNpIve/29tTxzIqF3aJRkkCXmDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hclc/fKCMScQuXC8QLzOd7QtSDh2pdKucfyS02tR6m8=;
 b=TKU/NauW6lJSPYYC5O5A9k+kGi88gmRJygQQwpGUUBa5GL5wCCJeCOxXTWXY1ZnBjOqO+T/RzV//Ul75Hali6emWfhzkpSUIosToTXcl4XR5u4K3BYo536DeGbDinML9+ETQmAfkg4/39LVxZhNJ42qHH6qhMaxtHkO5gNnEjiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by VI1PR0402MB2720.eurprd04.prod.outlook.com (2603:10a6:800:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 11:53:11 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 11:53:11 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        peda@axentia.se, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        xu.yang_2@nxp.com, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] typec orientation switch support via mux controller 
Date:   Wed, 24 Aug 2022 03:54:25 +0800
Message-Id: <20220823195429.1243516-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b7719fc-c78d-4e92-fbe9-08da84fe0db7
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2720:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OaSZOqDPpFXWp3LPD7rY1jRMqsjLVEWxWKQ+O4PbhRG/p4j52SU1ddyzKjltPKu8/NPtk3UZgNN5pujYIaMpJJURH1Pj8TmhJdb72nupzcsq1WSHIHArglahd7cctkmKsPuYC8IclO35wzZ/VUC6M5OkMOPtH4FZz73nRpLIkvx7LnWUTlZjJ1IrSX/nkCtmdCxbLgVmg9CI5dMP/TgDLdJz+4eJe/7B9TjmI35ug/zLO22HRdqXStbJp8FermX8g8LcTXSoEgMlk9mgS8f3A7JfVlcASMOmNhl3SFv/3kMQFtrj1WrnE9cxGsI2XfzJKV7JZYbW/FqikzasawGwdWkLG3aojVnW8rcZGxDHeqC3MUyz7Y49dA9Jfl19BpFX4qU5uzv93s1Fjg/rsO+8YwjVwZhB9V7LFL0W7hkahp97gJviIGENMcJfOOVN3mezWbmm+JUUhZxcgZcOlMWRhnK+NZx0at3ZshYpMdUXUIdSzCB8G7q97UfomLxBuuMr297NynC0JOHzpoBd1PieI3jGBLFIjo1XyzgvsvXuOTGEIHam6pQC9r5fzRNsxxr4WO3x/mO9BfhCYozmFVyCEPbUwxhjPfdsvqolG7lhEnusfFRLgqexp8WuvwMdZmtYHJdz+jotMlzHpnGdCAc+tueZi9swOxVqgRXpKywwVZSKN2QfbTtlqth8SFKu2IR3ZbxRCI/9mUO6p7atvvhQwBtDa9+OGEGxUIt6yp/nHTLQUrM9Oa72v2BTE7ti2lJfcDsm1JzF3wb0D7MGxtdFJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(66556008)(66476007)(66946007)(8676002)(4326008)(86362001)(38350700002)(38100700002)(36756003)(186003)(8936002)(26005)(6512007)(52116002)(1076003)(4743002)(6666004)(6506007)(41300700001)(6486002)(478600001)(316002)(2906002)(5660300002)(83380400001)(4744005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mcxijasAFiw9ZHsGl6EYSKzZv0/oDGbabultj0cnUYhCcBnEnLiImGCPwZ0r?=
 =?us-ascii?Q?x93SBinXreZaTX3Qh7e5sUD8uPzR/tKHURT5GnHyncwI3ACBZ8NsQ2ZDXCgU?=
 =?us-ascii?Q?FJy7c7rGmFmy/BRVsOw0ZyCS1fc3/sHCpybP1vhnMaku6AsEL1JwmBi9lg9l?=
 =?us-ascii?Q?KuI+cVkjhaPz+m4gMng6u26kovOD95b3ikYE/Gc4J6aM1Yu2DAUz0TR83zay?=
 =?us-ascii?Q?TD903jaCkN3XdvZnra5hMI27gCN3THxxC+X+GAq+MWgfQrpnrR7cSHQsBYfU?=
 =?us-ascii?Q?xddS7KCRNIc9EIc9hcIKJsO9ghOzLaPQaeizjkz3bmJWqB+235c5jSY3cPbD?=
 =?us-ascii?Q?KOKDAa36ztTs4LAGrdamxSkKSbpgtx3gnrBHVqjO+/X9amimVVjlihz0HxEs?=
 =?us-ascii?Q?rta6awnCsKdXIKrkZK7ubhcGYSEsbR2tv6X9lryBkox71hRLGkXvZcR+WyYe?=
 =?us-ascii?Q?abPwMU1CzmUQZg98yA2J2MMl/l+UwYxTCBYs2oKLNWgzwx/mzxqQmiDgXGCn?=
 =?us-ascii?Q?+WQU/RnBDg3vkzZMyZz9WGThSA3/Hu7E8DFmJ0a4dyZ52ynRQ4G94T3nxk+3?=
 =?us-ascii?Q?V3FB4Bo2mxQ/K/8H2zljZEJSTc97dodgNfJCjtFkBZOGB0m354PqgAaPsoxX?=
 =?us-ascii?Q?vUTRtYV4kmDwrPWO/WTFGxsS7CceIg4QL/WqjfibvEZLkAdYRQiiR15+/ggP?=
 =?us-ascii?Q?n/N5IBjGrZCXhH7Me1r3WhVWoG/FFnfyybSooIKGSwywnxiqRUj+h6sK5FIF?=
 =?us-ascii?Q?pShhBWip7ty4jLHRDXqVjk8z4oT/RNjWcNyqKOUgeCs+50nhPFkC/PaGwWAn?=
 =?us-ascii?Q?zI3w1LQYMSFg02oU3rWxCjteYf2SzLzvS3hKxOhTiQQoTezsfMFa0K272nPi?=
 =?us-ascii?Q?g+TzzQOkC8G4p/E5aw+lTQoPYH0DrlTXoKSD33eiCwgGRSoucdHws0WZ0b6b?=
 =?us-ascii?Q?ty5f8Vu8fJ6nAJAwB3Hofg75y16ptDb/RaV3dWOJM71wq2PaiY3tXbi32eHv?=
 =?us-ascii?Q?jJJRJ4LB9mFsrDmOcrCmNmun/ve+jpok3d+Ox7bvRXyJpmxmSEQgx+W/YtFn?=
 =?us-ascii?Q?b8nzyJsfdYh+U+B4IypxZQGst4PKWXHdZd1bwiVbSsloSdu5tY1Ie8trz4jX?=
 =?us-ascii?Q?HnhaeE3mE7cty/Vg6SpDVkEdAzW5qV/dq289oHsIObX6VhQU/r/TDv+kGK3o?=
 =?us-ascii?Q?th4XU5kP2S1rhS034YoNpcTJ39eusTDZy7jYl4hae5PT1ASU4QOMv8jdMfId?=
 =?us-ascii?Q?Mp3gbNm/g63v2VN/JUqUPVUcoK4wRsYGe1a+0bD1JK3exZi4MQqWTnaoJJ+6?=
 =?us-ascii?Q?9BrRwYhWkc/50u/K+HWdrSvT1fTwsR6pUxfrjNrf+bAHZlILV/VaRqHvW6xJ?=
 =?us-ascii?Q?v0OVMKiHm53O+vS4vu0s76rpE3AraN/tnsrAEboyRhA4jm9NoS6JVNdwDod/?=
 =?us-ascii?Q?luMYSg0jAXUFShSbfvUUnszS0VoSVLqkOT/SKwLLI86Up9mtW7htmc9C95mJ?=
 =?us-ascii?Q?28IhdprkKayD1SEsr0gT42jPRCXnMSr2T0XJ6JW7L+fxqSPWp7npLv3s4+06?=
 =?us-ascii?Q?1y1TUsvdc7xNfW4BOrEbF9vD9H+wAFElqVkuHtmD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7719fc-c78d-4e92-fbe9-08da84fe0db7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 11:53:11.6816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8dwL3EhA/f1RYhGM6V/9S9qAtgnvquHCQ6XFnr1wZQuQUky9nRHSk/0Pg2s+cvmHI3eQnH9FCmNSw1kiRXRrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2720
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since typec port support flip-ability, there may need various swithes to
set correct path for SuperSpeed or Sideband use cases. As a common way, mux
controller could complete such tasks in simple cases, such as GPIO-based
swich or reg-based switch. This implementation could be an alternate way to
control orientation switch.

Xu Yang (4):
  dt-bindings: connector: Add typec orientation switch properties
  mux: convert to use fwnode interface
  usb: typec: mux: add typec orientation switch support via mux
    controller
  arm64: dts: imx8mp-evk: add typec node

 .../bindings/connector/usb-connector.yaml     |  18 +++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 122 ++++++++++++++++++
 drivers/mux/core.c                            |  65 +++++-----
 drivers/usb/typec/Kconfig                     |   1 +
 drivers/usb/typec/mux.c                       |  76 ++++++++++-
 include/linux/usb/typec_mux.h                 |   7 +-
 6 files changed, 251 insertions(+), 38 deletions(-)

-- 
2.34.1

