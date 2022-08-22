Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6B359BA4F
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 09:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbiHVHeG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 03:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiHVHeE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 03:34:04 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10056.outbound.protection.outlook.com [40.107.1.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADD3614B;
        Mon, 22 Aug 2022 00:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSjDvLpYTOCNxJ3GMyhi4J/KBQHMqKEruHOWnVRC8q0CIKUcpU7ufDJHhwh9VJGICwgaemPLvMFI0yhaS5Rb8hcrelaYTtwnyfbXcC/ZinYMB5iLAAYp0/MVKeCbmU/LltGcx8jqMyyHNipu8URjsGL2WzO6IG0NUi73IQZcNBBQdgLpwQpcSjPxHdPE08aCWAB6vYhTSqqYrqtlJQpS9HK/lWWvVfZ9wVPyCdtLaKVBNyMU6yyz3P+63E1wIib9AbB7ltXTM30AtxdcWhEPa1X8c3O9wOkRnDbJ2nFOnKtnC5XDPDoQY5AKH+9i4mCWiyPZeDfsHTLxffptA/3kEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBIqSawA9sFf9swDL7L8x643noBWSI02lnc4ii+0ZVI=;
 b=Ipz9t32laS7QOkXH4fHk3rRwljra4GH25Is15scmK/iE0yUoQBhcWSi7dkI3mGKn35kc8b2JeooMHPvCE9PLTrhzFy2GH1WRD5iFz/hW/r5RK6XWajw61PLsCZrTdYiATiRL2MHvGi1XBoV6htawkGBf9qK8GVteTmOQ75iSmfz8WeWPaY2YNMz4Wn133ftCJEkCmfyLCBw/GDdfuyU8EQWLhMEikAgDaFiqbiD3Wacvvd4TgJbojmNnzruAy9Naf63xT99pmWzPn+re+pzu7JMssMh4xFTX0J8bJPfLscrMpuWLS3DRenIJjmnDpCj8vtcZmjRJZmx8aKvIGdSYVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBIqSawA9sFf9swDL7L8x643noBWSI02lnc4ii+0ZVI=;
 b=DGCq8u+5QLUCTzNHC/5VUDMsa36Zi7zpSclvRIIriadOjD/J9Mvr2VliBnrXfJ+GEq4bvrFyhPXiuyqhZp7ZxkJblHRIuAeMquCJ55M+ttTuQr5Bvt3f0XiEvbJjC7VUkf6mVBUGP16gPS1+7H5LgmzJhRpkyS4UfMO/rs2QQls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 07:34:00 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 07:34:00 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        peda@axentia.se, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        xu.yang_2@nxp.com, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] typec orientation switch support via mux controller
Date:   Mon, 22 Aug 2022 23:35:13 +0800
Message-Id: <20220822153517.3747679-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e6d3045-6317-4e14-b55b-08da8410ae34
X-MS-TrafficTypeDiagnostic: PAXPR04MB9644:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bHxY7Qg4VP3lHNT0aUTBwjtsExROzllW5zynE0aN1XBuzViMKO9iW7odjMFY+LG6hbFF6w5zM+gOS4kIFCOvhXfUWNK9ymFCqOm85uXYNSMFqInSv70pghLk0x4R3imm4Gs3HmlZTtKJe16Ztt9ySSJ2nFgR7INzHFS/mQAY9gl+CAdUVjcCVGqdYRvAvt3V/ZbZhNI+JOPqWPZS0GuPMz01jxw0/kAOaaGZkeCYB9JbUHp2snHJf7P463+h8WuZAdfD4haBzJKkao+BPkhpJRvJWc+p+rxLK/+JNo2NzQ6pBRaj5KjwwBSUFVHzoHCyIUAwUcZJisn8+YyHz54mXAUYI0sV+DCSIlgmHOMHJUmyvdVMDG3aKAS/yV9DwdSWjLYKhMTQw5tW2fGhRllH9MxwhJvWkGcgUWuZa9O+D8Tv0ZaK0Ot2feDKRxKk/dYCn3Av3wpd/HF2GCYCT9LvVWmCgKb5F2P3z6d11R9jKCf/axlc8WuitYglH/k59ashN6twX49sozx8iPE3zEVDzSeU6z7k6DMT28Kmc2ck3iT3dbkOU4WvH/gVFNA920ErkJ/HDFNppYjAfu1cPf/RSfnUu/t1mgTIcJDnHWic9gI+o6l/lcIMTx30f2VKLeHf1nECl0dIMt7X56NGgAM2cb5yxbhAmvSvkmwLTwlyYomWsjuxbVA/N/cOy7OMAle0QS2HRKcH5Y8W5bE6bIAXWZGjk4iH8EQdRRncnSHFZ71uM9jBBh8SZU5QuY9ZRrPiMhuxcdRlLWI8nvLdFnUlMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(41300700001)(6506007)(6666004)(6486002)(478600001)(186003)(1076003)(6512007)(2616005)(52116002)(26005)(83380400001)(2906002)(5660300002)(4744005)(8936002)(316002)(66946007)(8676002)(66476007)(66556008)(4326008)(38350700002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MTqEsPPh1IIIbFUAxqiUxHaM91tbM2dCoQIadgUM8yeAS79o5XU+NSmrbKJB?=
 =?us-ascii?Q?qSFBynplE0CQVHsNgIFy3O9BeH3nsun+lmPdkrl+AuDKB/dsWWFglhpBsL2g?=
 =?us-ascii?Q?ivy1Oc8i7zz4J1TbyKFScejymleCvICsYcstptUhjEElRtsWjBdVq5vp7m/N?=
 =?us-ascii?Q?fTu3Nnq32ipMpplk/wDqtU7gNgj8Qk6iPHO2tM33S1fDgJNd3QS6N4MkMsM8?=
 =?us-ascii?Q?pZhch1ed49XnkCZUPycob8FLK/hbBs8gettAcFWopOIpTIrgtPoCMkg2o83J?=
 =?us-ascii?Q?4pGaO4UZi0pF5TFKPLbKe2ANpoxaFuxRtXsZnaktolf5D3/hErXLU1zHmnTu?=
 =?us-ascii?Q?2PLbixMSd41BEYa9kaHrumAtJDlQYZQDePNcLKP1w5Zi5VqcPn8s1Nhg+1MT?=
 =?us-ascii?Q?2WxAgPXWwyA+EuB1jqRGEFPhguaDD0UEcd/IHRhZhRlFD1TyPsWVPvQRBOLD?=
 =?us-ascii?Q?9bhREJYYNB01gM9OJm2hv/cuhols2HsBzCHgPCrhfC6suVESbf6hcJGxSLZZ?=
 =?us-ascii?Q?2o4ZMe77onTO7Ru+sJNX7bC2REOFfGd+ex8gE+o/uNxuA1n2bQEQnFx+paR+?=
 =?us-ascii?Q?SIHLB0c61tvWeIBmEG/2nY9VYq+MLn0tHGYupDZfiLJNau4VSTyFCJvUY5xe?=
 =?us-ascii?Q?R4CD92Kra/0XbzByYGlqrosPFQzLyxodTsw/Bs0vKRpwWWwl0gknNI1DjE4t?=
 =?us-ascii?Q?aS7xktPKGLDa/INfmV1me+XSwIFY4Q4ak3sIZvihTTpoyt7q3oQX1Y94B6kO?=
 =?us-ascii?Q?dADdrZZRVObibXd/qF2hyWjdHE6YNb97t7oqqEr7bkUv9MaipSOfz1zkxGo/?=
 =?us-ascii?Q?bhZy6qmkFmv4JM5si5AbvYkUeRM9CNHDJHior5yVCbb8v02FG+BcNjUJGsKS?=
 =?us-ascii?Q?s4QsPgFJ0RDBfT0P9mLO20BkMjBY6rPV7nTMOoweEFe+vd381PPJAmoA0CuY?=
 =?us-ascii?Q?dLDCzDY2ThVGHbd4kiNh08Ji2msm1QfdujvPSYLG3jVPrfbw/YO4IOU/eDJ3?=
 =?us-ascii?Q?hfJ0MXTTw4rnbTT1R6dL0HuhgKSGQOrxyzkn+aY0r8TdK7QZKNAR81GWGWOo?=
 =?us-ascii?Q?jP0HW4gVLiYvzJXf+n7nrqNb/Le7qUzAl75/JXS5vZu1TKVCqV0K5RmCKebh?=
 =?us-ascii?Q?hmXJI44Q5rknSj5S9TLX65RLOwOSMHawBbn4CSmqjtk9YqGdq6if+ZQ/i19S?=
 =?us-ascii?Q?hyExRln1cVtFZVpn3a7T2wNMQfGgnhoNgbsVElZ9UaW/KrQyqXrHJsRTvUwL?=
 =?us-ascii?Q?NBTiNf3O1khFh7ouYUs0XpGiW/7O4fT9Z4q0BPviy7yzCytvjifibdLOdVtj?=
 =?us-ascii?Q?oJRmI9VvmdANLm06pnmGbUtgaC7VcuPPN/FC8HVA7bTN74pE3acdzjd/bK+N?=
 =?us-ascii?Q?Cw3j6Uh2UioYsiCaRzSUs4HpwtngE/cIRCTrrQUjeQdbb0fyj9dU4U4mfQu0?=
 =?us-ascii?Q?orbbWmEorvuHo6fY6QrNYGog/+RFW8+EoJGPsvh73sdQTD/VvK4t1h7FiqKK?=
 =?us-ascii?Q?FrMlOiZ//FtmQmyZ2p7x/ZJSEEHFd7rMofCOZQo36zIZEgUrxeURN+NoMHEj?=
 =?us-ascii?Q?7Ve8vjNKW1i9qkzvWKecc8N7gE9R2L5rxH5m/5dS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6d3045-6317-4e14-b55b-08da8410ae34
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 07:34:00.6828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bz/96YhSiKKYBBfiXHRHJVD+pTkw3Y83ARzV96zlEMpn6A/8NDf18L3wW5F5ZD8uhskk9SMrr7oVPbUS5BXjAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9644
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
  mux: allow get mux_control from fwnode if of_node is NULL
  usb: typec: mux: add typec orientation switch support via mux
    controller
  arm64: dts: imx8mp-evk: add typec node

 .../bindings/connector/usb-connector.yaml     |  18 +++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 120 ++++++++++++++++++
 drivers/mux/core.c                            |   3 +
 drivers/usb/typec/mux.c                       |  74 +++++++++++
 include/linux/usb/typec_mux.h                 |   7 +-
 5 files changed, 217 insertions(+), 5 deletions(-)

-- 
2.34.1

