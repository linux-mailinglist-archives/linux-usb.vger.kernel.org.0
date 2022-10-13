Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 126AE5FD56B
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 09:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiJMHMp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 03:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiJMHMn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 03:12:43 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F7CFF8FF
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 00:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AY6sWZo1/tesghk2MjXEQUXYNnq9/YZNtO4GYzlBEkl96nrfVdRPL/VyzduU88OdNp2Wzns7/AApr1pDgykkIVKT/0fvdefnZkQgwVW/gL+qoWA+eCS48OTchsHrIP6SvMQkK873UPU0ca3+tZ/ggHIgvd2K/e9JbkgZ7ej/AwOOnCUfXAUlp0+K0AKDZKHYvQTGmEyYC7rZvbsgE2FuhyETpDpSLYfTSMXx4yaVsWeAbMw8/sDhz4kEt1WrJGSfSV+K+uw7nzXlP8LqS8MMETRo7zbMMtp6BfbdMrZ1XbWiM/0opjhStaNMB3N8sSF1NGQJUU7xY6Kdwt8ZLXPb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhqqJ2xQVZWXMw6B6aMUdwRxMTvdtI6bsB0i0w+uFQ0=;
 b=kzrmuZlA6uA+yc82TPqxGDFOMQe5WhPijEwrtvfBMKEqdFaLwt3+5QryTvJbBoRYgC2ZT6F+2yM08Hpg0TlUa3IVw1Qb9RtwwKWKZskmLWaub5GQK7k7ZwJRfHFPhSBU4MMvWSNjk9XdhjlL5TST5gEdb1L1/YyN2FyH4LrCQAoV/lbiCmCnUnwr1At8DHv4FOHPSV1cusdX1SvUQekSQJg9Fch6CMth6/WCilYAIwX5Z3f+m7BbAU3KuxU23b1ZU5mQmMx4ZykMvicFod94/0MuQOt50SpwCDM9tSfP0QksIXsfkzVPfYo3k6NnchogFLJxScPT2Hq8hSha3sjNZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhqqJ2xQVZWXMw6B6aMUdwRxMTvdtI6bsB0i0w+uFQ0=;
 b=is0NASo4c1T130/Hsk9gIdKFFqjEprz85qV3zBnCx0i/xxB/17stJkLlm2IRjqKZ27FtkSDomnjRAOf3OISwOxMSg9D6oqwC+1fE+42WM3s8thRYT9m7yrwp0J2Sh/TMWzaxl05kXfM45qibZ6e+juJ3cI/kl3vM8Fsw8GOhoNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by GV1PR04MB9151.eurprd04.prod.outlook.com (2603:10a6:150:26::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 07:12:38 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 07:12:38 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v2 0/8] add power lost support during system suspend/resume 
Date:   Thu, 13 Oct 2022 23:14:34 +0800
Message-Id: <20221013151442.3262951-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0091.apcprd02.prod.outlook.com
 (2603:1096:4:90::31) To AM9PR04MB8777.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|GV1PR04MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 2376ec97-8f62-429a-f035-08daacea4f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A/THWzT2jL9Nl9GaUqBm0FL63ulgS5PlPbReLevDoDZ4TpUNVbyZNx988S1XlREj+1PSdbeqZoThuJfbDHqcuZswzjnM8KnFTbs2oQc2FQMjomousfz92AtK+J3XAfvckAI8dnqTgY3nG7gT/cr3GwGSMwuFqDDm8y2iwgNJpzMDHwY3xydqxfbXtRpDtbC5kls4p3rNEd4sxiaEfHtdeM990UhfQG2aEmTAEsu7UMiUJXa23DzdrUTxQT6aDrXieQgLT7ELIO1dFvrOd2LiVJKS8Ht55Vh11ej6jYwUJn0UAR70Vm8ryyZGSe6Kj/fZMX2jDtsxyMjsTumGGu0CGnLHpgs+nVIlf+eDnhWP3fuWg0xsRahmG7tqXOvXnXGeLu6myhSJmh0G7uBSnekEGfw8uXgvkNti5bUQhNIgzs2sMlloIGxVGFkz6mXSlxdeSw9+41HUef/YwXhFEVaZZsmSJtwUYUpnWMk2s0fF3k670Ezk7H1PV6LZd05xMwFi9BrJFkUX6oBlRN8jGkWY2/XEuUxkpiZ3hogwnOfkYswI6Jj+w6TegiVQVRNB9um3XC1YfOHeUqHjOXGe0a4fcdlmgdajhi79qzlAaXdO4Wah0w4nAWTIezktegM4HcZflQ6TII3rTG2qCfYJjIWTKr9EiSDqHfVuWhWBBBS+X3GOFnNiCx07syIf2S2gwvBMsAw1mm/I7INoL7ReBt9NCiglYVbDH5PZYckg2lbg5EYTu+tOtby2dne6/wPbtl8QmUImGXjBxoPXT6PuAvWiuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(6636002)(316002)(38350700002)(66946007)(8936002)(38100700002)(15650500001)(2906002)(41300700001)(4326008)(66476007)(66556008)(8676002)(5660300002)(6512007)(186003)(6506007)(52116002)(6666004)(26005)(1076003)(2616005)(83380400001)(4743002)(478600001)(6486002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6U2CiEiAHfhmTBotwNvCRNJWVng+wNegohNa1Pl8IP08VybLlrcTlAb7btc+?=
 =?us-ascii?Q?TpmWRybq6lyDLegaIW/oIRBOTmPhYnBh/UXco4YOWqheaq2Vqp0/YDVEQIhn?=
 =?us-ascii?Q?NZlfj39mC9CKJyKivPPzdcOF14NUasODrRWqU/xeo2S+WZh9tgTULnz7d6h4?=
 =?us-ascii?Q?zsxVJghIQC2W/qjMNNNU6M+doWGx3OCUC7YlIUAZPdIDti0lErMLyfni0Oml?=
 =?us-ascii?Q?qM87pzGx67+R7UTsOL7xezLuY2X5OaDMNgao4QqEdOaAyJToDe4R71XA1E9E?=
 =?us-ascii?Q?P5r0K+JvbOZjq0PXhcVoGe+43RExx7ANLzv+OeichYlN9faNHrj/f4Ff6CsL?=
 =?us-ascii?Q?5uOgIKKQvm2a/pZmM7eTKJn8eHLUQlYCoXbZsbLizl12K/4xnHamxjTdUuwY?=
 =?us-ascii?Q?firEAj0oCAFlJb1/WKeuSOI9Lk8ADHjdpYRPqxbBcPimuoJ9FE8ZJ2lDd1/C?=
 =?us-ascii?Q?opO+Xw/1aWxlLnhJ1OutTmJ4StlauYdsofKVbG0skv/MLoWZuKpuDraml0Lt?=
 =?us-ascii?Q?nFonuS46If1Si/DkzKZciINeqlCSOqKA/flXHEPsAD4snsUNFmWAE70X3vKc?=
 =?us-ascii?Q?1NE9cTTB0mxN1TLcCa0nfQMXs2UxvDn0b6IvkPmSuGoJbjEtsd4VgUd4+TMu?=
 =?us-ascii?Q?UIVmAjpgoiNS2zaU8XUK2fGACHUW+R8JbHDpiDoLVnVEuyWKZqTCqYyn8ORR?=
 =?us-ascii?Q?+3HPmBtvat4CZznpV6Pf7vSAqESbU+JfLEPQdj4zfIRP82O/VuYRDha1ZsS/?=
 =?us-ascii?Q?ErCAya0Xt7vk2qDe1zzdMDttgz1X0h4usj0d2PKxhkEz0MwiEWx24g9mcdvy?=
 =?us-ascii?Q?uoj50Ihd71nPPZnLidH30fLvWLDak5/p6QEO3otInb3GppomQUlXc1lSuHDG?=
 =?us-ascii?Q?bQC1mN+0+Yy6UWxL9ipgsEqdtfIw9zboj7NoZ8nJ92vbmsme5VMtsN7VNDNO?=
 =?us-ascii?Q?2u8hNztyptWrV91d9JVePJ4Hk0dhAzXygoQNa6Z+cyYBW9y6RB6/Twzre8dX?=
 =?us-ascii?Q?JuOD8V3jvFzMVLyEtSA0K9e+L/ow8O5deRv8uHtexW4sD1PJBDYu8BVRCL5j?=
 =?us-ascii?Q?r7tH/VwvpkJjgcl/HQGRfS40Rv1fPE7VHhNIEmiP/tBdToCxuruDqrP46x25?=
 =?us-ascii?Q?bD6ACxe+Nh7cBrel3TxNxF2n6tjJmRD3mijmhFgCwZTkY4aYAdDaWHzFI1qe?=
 =?us-ascii?Q?qw0X/g2RvXTZDqTZIK1HILWDwpk7i/I7BnNrVnbQjVSI+XOUZ4Ic+KZ6TYaU?=
 =?us-ascii?Q?kLO/VSZAVFqSmzxtQd0ZT6tjf5CAooVLWl8ao0MY2/DRtlPyhB9lPTrTf6jI?=
 =?us-ascii?Q?xqOH393bWbJFwQsTA4EONmyQNuiWE+18IeyX5irfaBvvcWo/aGF4xbttOX9W?=
 =?us-ascii?Q?IqH9GIZeMGCOHBAOLimm9GOkgT4QJ1VA2L4f7IbSIeExura3rmdXA5gOOupm?=
 =?us-ascii?Q?uvEuhvvnMvw5PK0ceW8c9WcyIwvrMcfGKhjFO6toTeGRIwvI6I048HFgUa3z?=
 =?us-ascii?Q?qSthfV0AgikVRcIPn9ldP7aZN9NV4Rlu5N5p9+x2fgyH3yq+Z16fuMJuUp2h?=
 =?us-ascii?Q?ilSOAMqF8KcjnP3mOpHe49HlFIXbeX9rCCyU1qGl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2376ec97-8f62-429a-f035-08daacea4f32
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8777.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 07:12:38.4016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knzcJqk8gtG9NBQZzQcmY0n2XjAd3wnaUyW8+Z22CXxEiwqUk0i+CaOkTG01JlUxN5lP2a5XhCDb2EIBRF4beQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9151
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For some SOC, the controller may be powered off during system suspend.
Then, it will not work after system resume without other means. These
patches will add such support if the controller suffer power lost. 

Li Jun (4):
  usb: chipidea: usbmisc: group usbmisc operations for PM
  usb: chipidea: usbmisc: add power lost check for imx6sx
  usb: chipidea: usbmisc: add power lost check for imx7d
  usb: chipidea: usbmisc: add power lost check for imx7ulp

Xu Yang (4):
  usb: chipidea: core: add controller resume support when controller is
    powered off
  usb: chipidea: core: handle suspend/resume for each role
  usb: chipidea: host: add suspend/resume support for host controller
  usb: chipidea: udc: add suspend/resume support for device controller

 drivers/usb/chipidea/ci.h          |   4 +
 drivers/usb/chipidea/ci_hdrc_imx.c |  49 +++------
 drivers/usb/chipidea/ci_hdrc_imx.h |   4 +-
 drivers/usb/chipidea/core.c        |  88 ++++++++++++----
 drivers/usb/chipidea/host.c        |  16 +++
 drivers/usb/chipidea/otg.c         |   2 +-
 drivers/usb/chipidea/otg.h         |   1 +
 drivers/usb/chipidea/udc.c         |  32 ++++++
 drivers/usb/chipidea/usbmisc_imx.c | 160 +++++++++++++++++++++++------
 9 files changed, 270 insertions(+), 86 deletions(-)

-- 
2.34.1

