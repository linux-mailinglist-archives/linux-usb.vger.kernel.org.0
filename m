Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71C72E700F
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 12:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgL2Lrs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 06:47:48 -0500
Received: from mail-db8eur05on2086.outbound.protection.outlook.com ([40.107.20.86]:50497
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725964AbgL2Lrr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Dec 2020 06:47:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oK4wVSXD4x2MK9zzQvk2bbTM1UJczOhsAWKQLt5OUl4Xeddb44Bp4Y25ruM3RL6PGhg6eCit1fgj+b1HlkzKiaMtHCWtQHMrt38baHKY5xhYZcAdCrRn8sUd2fJrVSgt8XEUMoTjr4NzJi/6yDugy+5BmlZstbHi24BsQ8Fd5etiSkne5jkEbEt0dz8Ge9lgx/kv+iSbnB5njFFkMWFPFXYEHaemIdkryFQvjTrnuPXD0GUfr74qpA985He4UCg/rPnU3wGQQInBh2rY68gi20+W5EXwuo5CgOXxjxR45i2cPEM/cmOp9KVKCBlAoHgR7VbOU+HnjJOBWAogQsfCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeZ4mjVsyY9AmprKH9MwhlGSISNfTd611i1v3Jkvqbg=;
 b=IZCBRs1a+sbEP+0PoRWrQE40vKwap9nM/csa/enJcz4FuJuPQNU2cROQR21+glPqOIf1h05Tjq1gk5Qv5wBKOWZwYhOJA+b3rwEihj2mnTZxgnRiHEpjRwLLILySBd4hR4Iz2dJ+BVkIVhm6ehYkTRqT4GDZvJRXU/ICRiO0cA22pRFUcKwppY1ROYtuur6MqXI1pbz4M/xD8dmRGLOqJ6kIcMkt/ubMN65gyXZqkv86Ym2fVW46kEFgsfg5K41ZEwK8zbQD9gxzgN9jhH7GzKtZBrBE2/6mQM98ivVmVeaTrneQz1l7qgxeW8tbeDDVla6e2yhTC++AcHMMIGvsIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeZ4mjVsyY9AmprKH9MwhlGSISNfTd611i1v3Jkvqbg=;
 b=jRPjD68uPpEZrMDX3Z5hLBhMQhQFaXZsAT84KreOBpCAZ629ABhod6OM6rUVXYVR9CZVKaOy7641RvidKwK45Ip1Dy8N7mFth+RTAYZ/XhDcM1Xa+1eyeBg8ZNk6Mpt8ByqWicdbgDZ3iRRFAmwPg2MSQHgTvN0uuIpM9DXVc8Q=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6653.eurprd04.prod.outlook.com (2603:10a6:803:122::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 11:46:54 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 11:46:54 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     balbi@kernel.org, krzk@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, l.stach@pengutronix.de, jun.li@nxp.com,
        aisheng.dong@nxp.com, peng.fan@nxp.com, peter.chen@nxp.com
Subject: [PATCH RESEND v5 0/4] add NXP imx8mp usb support
Date:   Tue, 29 Dec 2020 19:37:42 +0800
Message-Id: <1609241866-9508-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0173.apcprd06.prod.outlook.com
 (2603:1096:1:1e::27) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0173.apcprd06.prod.outlook.com (2603:1096:1:1e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 11:46:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cce72d13-673f-4829-eec9-08d8abef706d
X-MS-TrafficTypeDiagnostic: VE1PR04MB6653:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6653EC6ADD5FE97C6B7DE8B989D80@VE1PR04MB6653.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +yEfWQfty2oxLvJTDdiRP6+6XKCaJo9gNjvYaDqljQqfVGHPGmj/WpzPIIrL89atNdgusTJgZ3aiBKBrWHWgeryJ68FVcd4SVF8IINLsRzafuJzgJuIHM9IvXONtKXi/WdZKQ7yXLKkM12QkRA8C6ZjCFdCXHItdr5brjnoRJPXsbDf4o//WsRRacNzgPqZh3t/mpcBO+m5mVn9pMRJs2J0GHLYuB888hKoURZssAttIPlh/kjMC5HNfGWIoBtBvMdqBjEeCv6GPWE7jRe1q94U61mM36ILWPY42hyC6+WinEVgx1CzuK63avniAaRXpjtqVZIUHMjKvPTGC0KFTXeuwOACsLjMeoJdqY/V4g5RrTlCHnIPBzAduPmbBl7UmvcyTHjkYNgHdHhFYC+roW/2JrK+XfzlGffUV9vEZ1Pk3npz8qfc8NyvQDiBXIYJhTANuy7Kd9MvpGvUbkIfPWG1J50XWaxwl8fJczZLAvy1k155waxX3CDRBSPHrzDZjhyPy+7di+oUhSjaiPkla/24NYkjg3EeLQOAGKCYsRAk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(6506007)(66476007)(4326008)(83380400001)(26005)(8676002)(66946007)(956004)(2616005)(2906002)(69590400010)(5660300002)(66556008)(966005)(16526019)(6512007)(498600001)(6666004)(8936002)(7416002)(52116002)(186003)(86362001)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?J5Hp1g/S5X/LEabkh6dt1lSBoOGnKKWFB89UmBAfPZJ3r6Ug51R/zBbRfI8z?=
 =?us-ascii?Q?6+vRVtXKnYDNNKewmc9dWvGLxfq14GmvHDiQY1ahYxK7bQ9he7hibrWYmChO?=
 =?us-ascii?Q?ndksRFyi2I6cQdLZ4irL9U60LBOt44dMP7hwzjBR5WHXBrApHXrtYYm9X98h?=
 =?us-ascii?Q?Jg5dcIcphudvGnte58cTdEsp+KSl2cKa/cqlqgT4X5BYBXXOA4YEJ2fdIe4W?=
 =?us-ascii?Q?5uy+/1NpYxiDxn+9pPxGkofnstnWUkPSj5lB2yI2MOB3vtvaT66WuM++dLA+?=
 =?us-ascii?Q?LUClcx4q5+Vq2N0DK26Kqq1xc5OX1LhafYEiL30oRB5KRFnhB0tQW4eYmNb2?=
 =?us-ascii?Q?g7M58OLBKV+EKpR7+RhI7WU2cwXzizeuNQQqRycjXl6/8VqFSQyz5i5NeEDw?=
 =?us-ascii?Q?du7xdY/HaAJ9ayOV2bFqbyfopAJPp2YianNmAfGg/vDPbcq21qLaE/RhG56U?=
 =?us-ascii?Q?YoliPZ9SMV5ZN+RtNsGCjzwMHgYS5e3xmS1oSWYmDFYGRqLGNcAhXIbPD270?=
 =?us-ascii?Q?GSF6twh/UHtexCj3OWHB4tQ65j5HPlATunX6W/kZWXwNQJA2uq5PDmjvtsM/?=
 =?us-ascii?Q?7yoOGB6vwOurQWPLc6N/UD/5ADv2vyNijkbXP3U6yLEa6O4Yc8Ql+P6uBnhR?=
 =?us-ascii?Q?mV7EOHX2TqoPIa+so+uaKJrjHo6rh3DQUGGjdcCjaD22dmwk0JEWUbvaWXk/?=
 =?us-ascii?Q?ldHGEs0MC+wL3H9RCllI3yg43WzMWs+mU5pg325RhhG+UL0CJ2K5CjtWCim7?=
 =?us-ascii?Q?K1KDKp8qU6ZhD6NJUquZ/axZXG6lokcHX+VbjG5Vkjhs11t20k+lht6J7dsd?=
 =?us-ascii?Q?vc/nPIHUk9i3Tj6ma5hKAw7rbXwk7TEDltmwxcsxpov85PgaUaZ3CYQKf/uJ?=
 =?us-ascii?Q?NBRE4ew36hI5f0r/sL4IdzECG4ZGllSvlFUafjPteX5tConZ4tgxBXyhuTdK?=
 =?us-ascii?Q?e/EpGpUScQEzLERuvCtGm5QCI0sx+qTOzYHF2qXmxkqMPlQTPz/zL3W1GW/u?=
 =?us-ascii?Q?kFaX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:46:54.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: cce72d13-673f-4829-eec9-08d8abef706d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrQ+ly6fUkzy1FtsZvaoJXvXMemeuYI9l6TzjYAzIkw5dEtsgqCM/gCYCblxErAm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6653
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

NXP imx8MPlus integrates 2 indentical dwc3 3.30b IP with additional wakeup
logic to support low power, this wakeup logic has a separated interrupt
which can generate events with suspend clock(32K); due to SoC integration
limitation, it only can support 32 bits DMA, so add dma-ranges property,

changes for v5
- Remove "Items" of compatible in binding doc [1/4]
- Add Krzysztof's R-b tag for patches [3-4/4].

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

 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   | 105 ++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  21 ++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  82 +++++
 drivers/usb/dwc3/Kconfig                           |  10 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-imx8mp.c                     | 363 +++++++++++++++++++++
 6 files changed, 582 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-imx8mp.c

-- 
2.7.4

