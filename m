Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7613281800
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 18:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387958AbgJBQe6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 12:34:58 -0400
Received: from mail-vi1eur05on2043.outbound.protection.outlook.com ([40.107.21.43]:53056
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733260AbgJBQe6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Oct 2020 12:34:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSyvmpcbfDJx05tlte6IkSphhzXl5yajm0sWLzttTAyXUXXgTjTYAFCDNQK/k7EDeoEO71anS0gteg55qa24HPWsqANxjzPtxLhmi8QubGiKczTLkimV97wPAMpHhhrAQaRYLGvunIg/JPLqUDfiUm47KxQvAjm6BES1+1y+k3gPjTezGnM+AViXhB/AGZJaTzPyBOEgTUMZLRfZgskbprhqc7bsqy2/JCt44rFDE58GmYhv3KojcWUV7FOwUliYb4OBjsfKEOgyVpLYxkQs2kYZkoknRqRcWX715EMa4sUG/KYumVvEZNQCCvCvG9P61LWmikzgY9wf7VIit4hLjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hV2k7N9wGxMRqVWRWsYn7cS/F5t+J3NOHCb87l3n9tA=;
 b=FlYbt48QNp6ZFubCQGcO1reKUXnGn4iz0myJlmdeQAegsHT8R1k5VCXic/BnWuSt7ZqBoxA43Wv1YYq9s5hD4o33Tuz9YmN35gFARL2FcxsQvO68ODfothahI4M+71wehsWTu7Yvj3/aUt+CQlj+8E6enreKCpGuzMWD8eIP+JYTgvzzAv4yrX7S+JgqL23JK5ysEfie1F1Fm0yjCreZsdFef525k2H4bsAV3fYqLSkC257KiqaH4TgdeFa4GgTdwto/zYraZ3VgGxORDIn2WAg+DKMmo3P9GazCkeVrHDt4iXffvKrIL+hPktWznR6ipTaP3AIgAmStnweWjO/JnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hV2k7N9wGxMRqVWRWsYn7cS/F5t+J3NOHCb87l3n9tA=;
 b=OkbpYbdlKXCrKOvmYxNoc6G5vs5bry7wMoAUcZJSkg0NueFtkf/T/UCcX0g/UCuYN8ZCPxSvAd4Y+gBNjXMMGeEhU9PiFKyZ3zozBD2omOZeBqYMjUulScIaAwLtZOkTs8Lj24oy1CCjEWGMdEK00FSuxQBWHNMye+Lao/c/lK8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB5213.eurprd04.prod.outlook.com (2603:10a6:803:54::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 16:34:54 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3433.035; Fri, 2 Oct 2020
 16:34:54 +0000
From:   Li Jun <jun.li@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, jun.li@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, horia.geanta@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/4] add NXP imx8mp usb support
Date:   Sat,  3 Oct 2020 00:30:34 +0800
Message-Id: <1601656238-22232-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0106.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::32) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0106.apcprd01.prod.exchangelabs.com (2603:1096:3:15::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3433.36 via Frontend Transport; Fri, 2 Oct 2020 16:34:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 521b34e9-3206-4cb3-19c6-08d866f11762
X-MS-TrafficTypeDiagnostic: VI1PR04MB5213:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5213E1704C6D07AA9B8EEA4D89310@VI1PR04MB5213.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7sQnfNgn3UHY5397HSn4uNSafNDLATrmCmaiDmYU+DNMTwuCVAHNBlr+G50RGjgfJxcxdpei0H8XMtO7ok9x+bFF9lyNwVX41cfobpLB+CkVgD3ryFvWTfSKgfkpnIaUjU+A6o9lE7GwGtfvUBC2+zvSZXMPKFAJ17vjlL6DniYM8tBQddiQe7rcsHfp9BLXCK0eepDRBmEl3XFGhSBKX0qZgthCk/QSy0EkAYKbjBayyimTQVK+H2NQOWNp6eyF7+7YsjuUZXUCgAe/bDv9tI1PJiCmcwurJIZZCxn1e+4Nkq3rPWVGjzWuUiJP37hzvFG0sNiLJyBMnYGj5LKU93HPs0AUZaCnfJtb8nFqCZb77fAy/kjToHaMcX9DqIcwkJ4S0F56sD/blKE7fyEp7ZTUACiVqUg7KXT2llZIvG6HRRElKFTZXfu2sZ9HcBUPdVHoU52h2h46XJ86yXUdcEYSHzM4yQ5Hh4UwgBAHEeM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(966005)(6666004)(52116002)(478600001)(8936002)(6506007)(16526019)(4326008)(69590400008)(6486002)(26005)(186003)(83380400001)(2906002)(956004)(316002)(86362001)(8676002)(6512007)(2616005)(83080400001)(36756003)(5660300002)(7416002)(66556008)(66946007)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: cP4Za8W34dRyMiRkEPA+5bopv8gQKhdKBHwA1bz4xwQDh8HQd+dQ3uUsLVVOPI3PMW322HQCAEctnuL5q+k1Q110BLIhv57DFwEjk+/m2b/kMasQ3QFbi0cTRJYo1g8jVXXg2KHUSJyxl6jMh+tpme8LghXuhqFpgAuOmPak43eZEG/xQFYGzI3KX5g31yT5ItFo885RVD2Np1ZoOPgLRWFLW0I+jjM0WkREz5Tsqyn9KTidU3LTV/nhQ+9l/QJKSh0oucqSdshDINPgW24H/dZ9qHE4iZJ6wrO7lj68nyZX3XdgcGy7G1FkOisY4FDlGdA0y8A/pXoskuAGs6NvxbE72L5bWVpha+ovv/dK0+i4j+kSWMBzsq6R1pSb969Cw2dVvShJ6VBF5LbG3otk4vUW44WOmVZXohzpjNrVXWNI5eA/nkM4YtcrCv9jfYt5xywnMZ6O3miazFIvNGkCdVFlhBbXD23xVIH6z6xJlo/cSmw8yTi/zfhkzIkv3AHI86PJqkZHnG5xOvrQIW5HWisnyCyBefexf/5g8g5Vc4OxdF9O5wgag4tV2sYZptCloS1m8SLo6SUtwMgWZX+D6d8lJKKf0xNsFvxOtHY/9tD4aBukmt5UgKwi03yvRDKz9KE9ab+rBWqDNfcyStFZug==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521b34e9-3206-4cb3-19c6-08d866f11762
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 16:34:54.3069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dS4IyoPleld9cuEol/KA4EhJtG2MpAa0AcpAQf1wh6MB/BRF5j7HTXzx9PAZh5SS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5213
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

NXP imx8MPlus integrates 2 indentical dwc3 3.30b IP with additional wakeup
logic to support low power, this wakeup logic has a separated interrupt
which can generate events with suspend clock(32K); due to SoC integration
limitation, it only can support 32 bits DMA, so add dma-ranges property,

changes for v4:
- Use dma-ranges property to limit 32bits DMA, so don't need the new
  property "xhci-64bit-support-disable".
- Fix binding doc to pass dt_binding_check dtbs_check.

changes for v3:
- Add dwc3 core related clocks into dwc3 core node, and glue layer driver
  only handle the clocks(hsio and suspend) for glue block, this is to
  match real HW.
- Change to use property "xhci-64bit-support-disable" to disable 64bit DMA
  as imx8mp USB integration actully can't support it, so remove platform
  data in v2.
- Some changes of imx8mp usb driver binding doc to address comments from Rob

Changes for v2:
- Drop the 2 patches for new property("snps,xhci-dis-64bit-support-quirk")
  introduction, as suggested, imply by SoC compatible string, this is done
  by introduce dwc3 core platform data and pass the xhci_plat_priv to
  xhci-plat for those xhci quirks, so a new patch added:
  [1/5] usb: dwc3: add platform data to dwc3 core device to pass data.
  this patch is based on Peter's one patch which is also in review:
  https://patchwork.kernel.org/patch/11640945/
- dts change, use the USB power function of TRL logic instead of a always-on
  regulator to control vbus on/off.
- Some changes to address Peter's command on patch [2/5].

Li Jun (4):
  dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3 glue bindings
  usb: dwc3: add imx8mp dwc3 glue layer driver
  arm64: dtsi: imx8mp: add usb nodes
  arm64: dts: imx8mp-evk: enable usb1 as host mode

 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   | 106 ++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  21 ++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  82 +++++
 drivers/usb/dwc3/Kconfig                           |  10 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-imx8mp.c                     | 363 +++++++++++++++++++++
 6 files changed, 583 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-imx8mp.c

-- 
2.7.4

