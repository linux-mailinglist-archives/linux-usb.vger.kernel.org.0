Return-Path: <linux-usb+bounces-21130-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDD2A4798E
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 10:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 265913B3A1F
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 09:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E010D2288D5;
	Thu, 27 Feb 2025 09:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fFmAMUjN"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2054.outbound.protection.outlook.com [40.107.247.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACF6270024;
	Thu, 27 Feb 2025 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649965; cv=fail; b=cyv8xvIkfneWDiRWGKNXf106qIAtuuKAZ5cTdaaLxDXrMyP/cYiUCfxhLbdV3nYBKpSBuKgBcm8/Gsi8xwlAJy55nJ7l9rUVIzaz28ixIdXh6nG0qkI6MzXvjnL5Xlb5aIr352ZzAOnu5+eHQMLRSzqk9l7ZQvPrI4OWGwrnyRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649965; c=relaxed/simple;
	bh=UXwhKcPpR5nApVaFnRbhzhIgUFJX+3PwUqm2MEC/WUE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=W4uzHZAWc1nsziVcgHd5agkGQP4OuieTQzDCTlmZhC3rqDgITbVtFrp0oY02rsJXoO0yi9X7YLAtvlxeABonW2NDH5P/KhZMUmGqwxE4fuC5VB9pvk68kPtSjbTdr6SPQznj+92SesgFqfOJCA7Ohyp/giPQL50Q5Aj3XhC5zQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fFmAMUjN; arc=fail smtp.client-ip=40.107.247.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZGtEiEhwaO/6hwsxIVoTKXxLTsVIOrVsq8B0NhDjbFG/m9Lup3zQxi+qHI8njcKtmfCCDHcXVzbQ0KtdJCZfXSG6TcZ0q0fKkBLwX3wzoRtahAMuCsK9m3rf+XSX/A+d8kNZbYPFfzrmHXiyUZVhqDBGV5hjNU59K+Lm4HWvXoikh+fxujS/MT6L+GIeO4CVzyd6WiVff01EkO9tqVEqaB8CRbMRG/mD3dVWDFhorMRyRooK4vRZiFBGaThMXk/IkzwOetWhi6hdBzkvzhbK3tZt6snMW0p8RIR6thKw3HyP62dwnt3fwjY1HRwxu9Gqp6HP2nOnXBAp+ZYCgl9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYY8h+RpKdyh32uOyyNY0hh7lfm/fQ2HG8iXF6zjiHQ=;
 b=sf3+qpL/2j/ZPzt7QRHPImAZbOA2yGNggV0YWmZmopyUcn7aphoTrLgIxRmRB1wxxLtYnAsqENmOtskYvf2FlZY3KvmUdenc3EUlRRDB/V4qkvfdWX6XqC9cMK25R2ozZgIozRPK4YrC7MLmeWuNPMbu1mWdH+lcBx/QH8ZGKG1gRGBU93NYM/cSAv5G93IJ3YV/rHF6pnH3hyWE9RvfdpuiBs/oLLTBHYlJBfzROAUz5ecZ2xebiHjo9/ZakdQJooEk/M0I0XtPuEWiKHEfIB2JTtyIKCTaf2t2796WM0TPg07E7/TBJKwQhrXO8elTH6JVvpMxHt/FK5jWeccHug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYY8h+RpKdyh32uOyyNY0hh7lfm/fQ2HG8iXF6zjiHQ=;
 b=fFmAMUjNsZyQp13Kvrz5+1TEB9dicn991JaPx31d41TuYeugJ7Q4zVIu1ayq+fkwkPljZIykv8Wah9idB/+V1mLRa9ygJHoXAM+RtMCoNtTm9a8y+2Q+J3ekMGX8/jsqduC6vaux4+DmxiLwMyYJJUwv+86uL1LYVX0s5yg51Np+hX8dDpiyyFDBX9ktwjkPKT3wIVv6omm9OCCVZH1uCChjrTLYvtqQRnwmxFoeUSUybAZDE81TdPk1U3oJCMVq1dkT1aKtphTZuyjPlMOZE9+rV7W/ioJpXWpvRHOD5VB7+63MKRm4LZjtjwfVKvIo627GIDdbmFjwNr/Jw/2gzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6848.eurprd04.prod.outlook.com (2603:10a6:803:13c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 09:52:40 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 09:52:40 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 0/6] add USB2.0 support for i.MX95-19x19 EVK board
Date: Thu, 27 Feb 2025 17:53:42 +0800
Message-Id: <20250227095348.837223-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0205.apcprd06.prod.outlook.com
 (2603:1096:4:68::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f8b018-7857-4387-19ab-08dd57147956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gc1VffANC9paxRnN+elyy00NUJDylsEg17clv8D1RrIeegfRexl4niYEIQ2s?=
 =?us-ascii?Q?W6m99EhZGM2Fuqdet36GB+JCgmfsTof2wsJp2opEA1rMZvE5Nb90TbZw1nba?=
 =?us-ascii?Q?WfBEgSo5tohEIkgsP/B5uBvQnIHMGn1zsS0//jDTf7YXokgIXnHYVUvdw6BC?=
 =?us-ascii?Q?r3eZwQmhX232k0+lMZa0oYipO0uyjBYO1MIMWq7rXEZkH1ZKa1MsoMK00iN3?=
 =?us-ascii?Q?jwUaKdBqh9T2XRbEVc4Gbuba7Hik0Nx8wmhptp82+gavoTcQc2V5ZQfy81wi?=
 =?us-ascii?Q?EZQDERgKRDEF7GdmPC4jXEDpEIHDsayrcuMaP7JmkgT8c+650BKqMS2R2sxj?=
 =?us-ascii?Q?yGr/+SZJq09OGKu18rpT79wg2ekxmj7+gyr4rlaR+Gh6aNnWYlaCqxuEGYJA?=
 =?us-ascii?Q?P4o0ttaXVVWzBoCXOYpSrCTHguJdLFD3pFDXHGVmvq8DcJO9Ml4Z5nhancB4?=
 =?us-ascii?Q?nUkKbDLtd3De6RZ6izcZnc9I21iAPqDQP3XQSr4AguconB553bm5PScQkCqZ?=
 =?us-ascii?Q?qw06RAEoHfuZH4azcp+FIksZVrDLdjAMNs9B1+UHI97E6DnEcBUN/K5JWOoc?=
 =?us-ascii?Q?DqGW/QCo3udF2yMffOTCCJUmjcwCg2kYsHiAxHzJSChzMdSrFI1Y9gSrTrhC?=
 =?us-ascii?Q?l7YLDdH70BJek+fS7JSIkTgAYw0Y6TEl63TeIQWIwpoZZyTcZyD7gMx5pMPz?=
 =?us-ascii?Q?nKDHndrtpom519Q4OkmeRkJTcZktMSlcrs0r9MKNVRIqkQ5c53qxRomPSmoa?=
 =?us-ascii?Q?G4rSSktDDpA0ssMfatw+b2rDEbCmLdoIC1LIcSCmWkA1WsdV9X4W1kcviMxT?=
 =?us-ascii?Q?+lWl5CkXtks30dgo4aoFUGtD/Zule8GZJWJeUcfBnn7XakJyHu+a1wXDQqHT?=
 =?us-ascii?Q?HeqabL1GH+3GGpBpQANAT1t4ppl0DUJSv54J5wgBeOts3o3CdeBHypaqCKFx?=
 =?us-ascii?Q?sthy8wyndAbqtH0jip9uRp6iIrmShJQLZouPGM28zaEzZmR+/AfcGhxP9LQK?=
 =?us-ascii?Q?zlW6MBMqFEGwzol95KGNJVVq1u7hC3lHQzTdHwDHmZpkizoGAl8AItUdSAsg?=
 =?us-ascii?Q?kIiU3xkBYzTOreDco9JsHkih8YXNl0gJaMz8K7oLocjMTqY2pdYABAdOTISz?=
 =?us-ascii?Q?KmtzgnA2hHkEMEGj8uAvaIB1x04Tp9V27JlwWhiEcDmaQv3SZw8I6s4K9STD?=
 =?us-ascii?Q?uRCkQX1OjdvdzrwulI5IJXA5+SRyz8aKa3uWYc82IEpRXdZuRwgslSYyCjhH?=
 =?us-ascii?Q?GBfXp3myQPEDPJjUdIZNqkyoN4SChwuUnKWfyPUVh+QGHi/b4wstCto0NlBr?=
 =?us-ascii?Q?ucfm+XNwZRNyLJEcgGEJnDLxJ605IA/Evn8kqKS4xByDwb6fPNH2UACpoJFZ?=
 =?us-ascii?Q?ZSwdgg3PMzUbz1HRRwKuJmC8cEk+lqFm9yd3itl+5nq4yIFKVvdPYLP9DDmX?=
 =?us-ascii?Q?D34v4o/Tbt+R/2nBGdP64A+t+viGzQnI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kmSo0NdTfOsTMJuK38WH7sWfs2a3MDU2rIl1aIuvMGp5OxsSAGx138VUGC8H?=
 =?us-ascii?Q?8pHerMZA4aQWa8de5oadJMNtQx1KuOuAiBqwDnpmiDBjxZw13wYHuhOjFo+Y?=
 =?us-ascii?Q?EfwHwwozv44xOnz4ScW25rp1D9vNC8ylwCcnlfiN/R9fq/dzBTaaVVg7GeFm?=
 =?us-ascii?Q?ouXIUnnDniYYdcH3rU+Ylrpm3uYNdWsH39hw423gdBdBC4xh/RXQ0edWCoOZ?=
 =?us-ascii?Q?fd9Vp/fHzvKnkeuUYfrOk2Npv4kezN5p9iSpzIunK6Odze3aYe/Z8KrLWJpA?=
 =?us-ascii?Q?hCq2kfPW5k9WZM7IIqefXUJveUaTlERboLx62sWG2dfxNWyqJUhXG85KJSvz?=
 =?us-ascii?Q?G2Ee2ne8lZwakAhWe5hfDk+GVTDeb3VUHyEo7LWkwDA4om00IKNEjYofs8UC?=
 =?us-ascii?Q?Vbi1VrGuLt9s+q8zlUFx+6uiIbvQgBqOCb8wG2R1LWuosr3aZZ4qFUYrStUE?=
 =?us-ascii?Q?i2WlR+i0MMOBrOBJQ8NeykEFXn3r5Y5BMSpMtfwczrm7or0294LvYs+IHb0o?=
 =?us-ascii?Q?xPNSaJkiOmMw/MlnLmOWijCb4my5/0k9ar5A1SzqyCizDkOUgkTi4y8sUECp?=
 =?us-ascii?Q?uM/QIKf1yyE5DjapwBG2udVadw0mc0RzXJhvINYbqxt1po1pChZkys7sxgoF?=
 =?us-ascii?Q?PGkYFdf2Uv0dr6brKr9NZF107q1ZtAtFwXhXVpZRWqZR0pUTfPN1yRWOZe7B?=
 =?us-ascii?Q?9kBQ44+OnnesCQUWtOGHPOlQ42OKMzdCIaigb7oY+LgyHf44jxMP8YJ1HykS?=
 =?us-ascii?Q?lohiJPHqOzLVZdlsdZ/T6MCQNMTj6HIIAqTHlFyUui9YK/wiV3egTh9xFfRa?=
 =?us-ascii?Q?E6boZqhsjgUqz1nNmAzOD0tJqU3i5CIVeib3I6JCaEVj/v4iPv2s8d9sJiaa?=
 =?us-ascii?Q?g2jREVfB6cClrbuc3NEyIwsGHoFn1kG+drCXBJIu6jzjKVeRfQeZGh9sA1ef?=
 =?us-ascii?Q?/VpMTdi3Rf6xsA9ir7bm7QEy14kHGSafnmRUV3FXYlC4UhNxIM1aleZg1Cq4?=
 =?us-ascii?Q?jOYWywLKyFHuOeqJJ98Kzwj5dNKkyZrmKwq1oCDfYgfrg4ZkhcDReU6GHEN/?=
 =?us-ascii?Q?LFY9++mY1JqceW9eWxjthSCv2fAO6OJoBhb+SRtH4PVpgPIJHXblW8iTnTVR?=
 =?us-ascii?Q?Ts47wBgDq/B0/xWuTYZ8DX1bCJTdolJtQY31y2pM9kttXjKng+TMPzk6QCVX?=
 =?us-ascii?Q?LYzd3fEBipShbbMf5FVOrrxEXfvlfBQhCnhR5GDBxkNA2GVj8qmb5sdZaUtG?=
 =?us-ascii?Q?wFM7pXwXqsMxzfyU2339VyD2kppO5GhrnZo7WA4DrF34dl7kC+jm7Kud3ZtO?=
 =?us-ascii?Q?2/QSCYpzAgpVRcqHjQ4gR8MhMmYqWdG0pmrgQPcHMjZns2ebzVD7Yotd7hdF?=
 =?us-ascii?Q?X6i6+YjfdOghSiNdgUc4LWEAvmYtYEsJ02kUrJGjHt1OZEtj69Btm7m63lBG?=
 =?us-ascii?Q?Kcthe35cBNuFtkdlFnygD9FNAxsdqA2ptrMzbPPa0tf2WYxZvnyDZXNxd8Q8?=
 =?us-ascii?Q?3QssLvNubP4GwpaLlXvs+nznxP7sUukPo8mSSwf2TPEUmGL+nqsea3olu5FB?=
 =?us-ascii?Q?EV7AJr3soYMEoG2XZ9sPhKSXS0yBv4c3rfBUgQph?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f8b018-7857-4387-19ab-08dd57147956
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 09:52:40.4891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHJdKnZ1Hy81Yo83QWTbnRSmYc+yd2zfynCgdMammM43gwIMJZmJ0iGgMU3A9wcWvo7vnODe+KgMUU6xPzLeWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6848

The i.MX95-19x19 EVK board features a USB 2.0 Type-A port, with this
series primarily introducing USB 2.0 support. In the i.MX95 architecture,
the USB wake-up handling mechanism is integrated within the HSIO block
control module, utilizing a dedicated wake-up interrupt. Therefore, we
also implemented corresponding wake-up logic code to properly manage this
functionality.

For detailed changes can refer to patch commit log.

v3:
 - fix possible build break
 - remove usbmisc_imx95_init()
 - add Rb tag in some patches

v2:
 - apply some suggestions
 - improve wakeup interrupt handling
 - add Rb tag in some patches

Xu Yang (6):
  dt-bindings: usb: chipidea: Add i.MX95 compatible string
    'fsl,imx95-usb'
  dt-bindings: usb: usbmisc-imx: add support for i.MX95 platform
  usb: chipidea: imx: add wakeup interrupt handling
  usb: chipidea: imx: add HSIO Block Control wakeup setting
  arm64: dts: imx95: add USB2.0 nodes
  arm64: dts: imx95-19x19-evk: enable USB2.0 node

 .../bindings/usb/chipidea,usb2-common.yaml    |  3 +
 .../bindings/usb/chipidea,usb2-imx.yaml       | 24 ++++++-
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  | 23 +++++-
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 16 +++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 30 ++++++++
 drivers/usb/chipidea/ci_hdrc_imx.c            | 33 +++++++++
 drivers/usb/chipidea/usbmisc_imx.c            | 72 +++++++++++++++++++
 7 files changed, 199 insertions(+), 2 deletions(-)

-- 
2.34.1


