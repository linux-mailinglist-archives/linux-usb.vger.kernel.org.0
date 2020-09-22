Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407E9273FF9
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 12:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgIVKyN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 06:54:13 -0400
Received: from mail-eopbgr60078.outbound.protection.outlook.com ([40.107.6.78]:32737
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726454AbgIVKyN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 06:54:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jA/ZImaMVEe1l/trAQ7C9QNySEm85ijP4mQO3ivDY4WNaa6Q5xnChgxxf+EPQwi5zsj1D75+nmR2MqLNQ3wHUy3iVbEXPdk9/Zqa3kJKn1V/UGJtXxVAedylVklXk6T0/mqwfFU3e9H6hFHNX+zx0j26yyTWsfMOUhfJzKhor9O33I7sHc6TXqb7aSaKxcbiFwXd6CjDKAsdxZCimwu+E1MbL/i0Lx8xOZnXos94yajQh+kgx5U9xwaN+r4DRPQUpgn7b/EQMJTdjpvLFQhiTPxqY9U3hmZUAFQvegWrtACGvMgMvMVojWQKG7shDb58ne+I0U7nxe55osNyNGuvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y83wvAedLPsIeJVPue5VdUssAk8oecI8lWWxVHwAm5Y=;
 b=cgM8TDMFmXrN80fJElFcbQzHiCCMhXQXm2zYBVYytyaQnRTYodlDGp3pNDSibPDQhuq5lmKd3g5JIiG2b1PuO4MggwRXmbATSuSYGwbZU2ynqh4o0jyeKriXCBuMNVXiQdS4/pxnvOC/gYSgLmfM/kyLPhVyPdOUyvHNHG9qw0pUeW9svRfxuvw7FrCO7R3B4zV/Cu9b6SBQnQ0pUQ+illB5VhxXYfQ025DHtuuHNLp+WvtrPRUzqilPSrbQ7NIx/bMeI641JuSbD2GpItD7mFOu7hU9TqIWrV9wafRRGdCD4T2I7lp2wJ1XTzD2yaucprqD4Z/u1DRVNhQGgi5r+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y83wvAedLPsIeJVPue5VdUssAk8oecI8lWWxVHwAm5Y=;
 b=TfLZo8qzcuNTZRKSSxlKH0ApWBVg1XN3yYIUVIGDOeush2H6Al1IyrY6DKc3yDRdGQCYU1obwIwGILYgjP1Gjjj5OD4SuovbdQDvOtEfA6OEbT2Foc38jnt86Rgw+JvVru5aLnC2AzRsfI/d34np+0yS8mjhek+3PmZKo+tc7m8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4255.eurprd04.prod.outlook.com (2603:10a6:803:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 22 Sep
 2020 10:54:08 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3391.025; Tue, 22 Sep 2020
 10:54:08 +0000
From:   Li Jun <jun.li@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, jun.li@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, qiangqing.zhang@nxp.com,
        horia.geanta@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/6] add NXP imx8mp usb support
Date:   Tue, 22 Sep 2020 18:46:46 +0800
Message-Id: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0017.apcprd04.prod.outlook.com
 (2603:1096:3:1::27) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.66) by SG2PR0401CA0017.apcprd04.prod.outlook.com (2603:1096:3:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.13 via Frontend Transport; Tue, 22 Sep 2020 10:54:03 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2cfa6adc-f58d-4235-3d09-08d85ee5d49d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB42559CDA9D0D2F971F528BC7893B0@VI1PR04MB4255.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u8EZVnAOf/Co/YlGWWWP+4+KWDHS6cf3eti6ogE68Yck+weVW2lRcOU58u5W0P/4HFxRnJt0apmYeKYyPZ7F0Goc5e1Fd9vdz9NGd19oQIbcUiMTNx+6qhpvXYC5fNL3f+t9FEX6P5cZI8A5KmsKQ/uYMWWIwHKy4QJv+eEnfOdOoISCGWlPgmkv4RItj/k1z+956SZKutGuL/AzZznKNT0Bcg37mjHfNcsBnNwY/piwZRjgoxl1NSwbl6GfNrKSgcCWEJLRSsyeKz9ifK5faEegjc+Q4MDuZ4/waXvWyW2otcqVGTclV25nOFv4wCqHMc1hxwP6/3fFzBXST0nW3hphJ8Yw51WXKT7I0K44kcn6yiKqyUIlUbEp8ylNcfUwnx6W/ZZierYcEj2u3Fk5neEmH7ta46d7OGxMDPUWuWxCx/ECKat72uUJXHoa3Xt1fhx1DOzFw1zSZdCwP1I+nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(316002)(16526019)(86362001)(956004)(2616005)(478600001)(8936002)(26005)(52116002)(83380400001)(5660300002)(8676002)(6666004)(186003)(66476007)(66556008)(16576012)(966005)(4326008)(66946007)(2906002)(6486002)(36756003)(7416002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Y8PuHVyWj3Sl4RkZRfskwcbravWUAAZ/Tb4aXDwt7ft+Yd/y35TibaG+fxCvx6DeTMgWaJLIw5xa0M5xv+xgClbzl9gCDWiYMrOFECw8BVaIdm27d8wMtd3GSlAXMo/Xpa371YwKAxNtx7y5xaQXFLmZE1HcT3NwLmluqYcv/lWp3bkOOQbhnQJeEeS/XxQUTKU1OoeKRgjqJ6StIFxjcSykxIMdn7HIsWrm/1ug8Sr9FvMVrn04zOe5lC5UN3a12KZ39laRxQGd1KYLvZGR+Lhozr+nwwaYKvnNd1Yom0CaFxGUt9tzEV0a5obStviv1znOjMiPvYmls30NMjON+f7MOEFKLqxcBZ2ibkgtHo9tVocXosGH1GA8ih7D1qLpF7T8/Bx9GItFtu2AQrr7FDHqN3pDlIXjT4Jbj19MF6vwhWcmsS8BnnX5ACK83FTQhsrTAR5egdnTedBZhosrxRyxHOwueckGYRhY9ofUXLHlCmGD3JzGmSQVwi/Bg7Wu4WM0deRUOmvs+cTi9tj+v41tpD+l7dGwO6+hr7sIT2LaSMnlqOIEgkHIar2VnpGxutlVI59GLkx/iJzb8L8lH1n4vgQUUK1iAwuKE3SJkyRlgbrY6eYOHrVUiBK+vH0QbgG432QYT8wizaye03IBHA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfa6adc-f58d-4235-3d09-08d85ee5d49d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 10:54:08.4209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KP3QhFd8qRgZTV3ibh81GhAJUiz5VvzCkn21r5w0DQ9RHnBayksJsWu09lYc53rq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4255
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

NXP imx8MPlus integrates 2 indentical dwc3 3.30b IP with additional wakeup
logic to support low power, this wakeup logic has a separated interrupt
which can generate events with suspend clock(32K); due to SoC integration
limitation, a few quriks required, instead of create new properties flags,
introduce platform data and pass it from glue layer to dwc3 core, those xhci
private data can further pass to xhci-plat.

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

Li Jun (6):
  dt-bindings: usb: xhci: add property to disable xhci 64bit support
  usb: host: xhci-plat: add support of XHCI_NO_64BIT_SUPPORT via
    property
  dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3 glue bindings
  usb: dwc3: add imx8mp dwc3 glue layer driver
  arm64: dtsi: imx8mp: add usb nodes
  arm64: dts: imx8mp-evk: enable usb1 as host mode

 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  99 ++++++
 Documentation/devicetree/bindings/usb/usb-xhci.txt |   3 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  21 ++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  88 +++++
 drivers/usb/dwc3/Kconfig                           |  10 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-imx8mp.c                     | 363 +++++++++++++++++++++
 drivers/usb/host/xhci-plat.c                       |   4 +
 8 files changed, 589 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-imx8mp.c

-- 
2.7.4

