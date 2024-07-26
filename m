Return-Path: <linux-usb+bounces-12444-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE9593D24F
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 13:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87EB6282283
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 11:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAF617A938;
	Fri, 26 Jul 2024 11:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mmWM4/Jt"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0641EF01;
	Fri, 26 Jul 2024 11:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721993517; cv=fail; b=VfPbUrn2+18tbak/INZKZHhv/l2nnnlO7LXqb1eex2VSTpTpHXqMdGfZalMflD5/A+b2pyyPS8+X9MuS8WzHS6OhZtpz/QPu1fQitdeufN50bwhU3S9EL9Qq8/gIIU+WoFEJP1nzptlz9/AwGkkXWyrYjjXkDytoeDfQVzvTyoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721993517; c=relaxed/simple;
	bh=6cftCuRez24ImXuUnE/ntOMuBhW40Wg3Fil8ag2XHnc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LD0yA4pc5lsvBLbwmSk/kk2WTPB7eftEAd8I4VpiIVhj3GyFsRwk77RoEz4c1MaZbNw8ciJcFcV1TPOOgkSvQGvdSWWIxJATxYCNNyw4W4x2p20A37znLsqn5Qv4B9KXZdKfiHNqdpOxc8GqrnZkUl76hRxt95qlOOLSEvKxry8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mmWM4/Jt; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UffjPyiMi+quWJOYEZCU7wNRYKtIEg2T0X7SfrNIPAkVXc1qAKGsa0g2nnsAdv5fNliDWOnpTyK0fcA8OLX3bEdqUanjypxLgE/YubUZYNgd9rb9WnMA9wzgLxWzfe2yTCFZBhKFO3/y3iK10IjQAxK9+URT/WlS82qGQLHcue7Gw23+WZkoWFChyXM1QAFOW73msw8G3uBdIMMvh0ke+215Gji/TM02qoq1D/xkVu+aDG3tTzipENOyR5dGY2JE56ST2e1BdDsgTHcqIIrqGV+W081wHsIH/veWo2v/AdTosaGulpruJQ/16x+sJ4N5adJfQZJVfsMVccaNpKLW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDtgLengr5PECs/ga4Qc79rxX1BqZHPO9lPHqLrfj5o=;
 b=Kr9CPBkbzVlzyFLbLRQOR50pzBQl1gs8+oylE2eVEfmPGWCtP5dvp2xPLPrAIOwJfyOCUo75F0ypN4IP47utKELGFt4cW8jggp4jQFDky9dd9eM0PaHSZ0g3qlkpJ5WfRrQ+KRwEfH8pqEpD/LaFLec1ZwXq2wQRzQQMn+J8Q/tnNr6sKNjhdUmU35npBLhHf4MUs9cbgPGzBu3hMdeoNG8xe546ZMgaxSFMGhOgDrp+eqo+5eN8Js7JK8RCHHlcNoaNGvjSxZ4iY29rqRyQul/FjguGnxvlUlJK+xfyjvtWoaJgCroSaTmY+3FyZU0xzfx6XVZW5IN+9In7YMwJag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDtgLengr5PECs/ga4Qc79rxX1BqZHPO9lPHqLrfj5o=;
 b=mmWM4/Jtekca+IJNYTGvX+EmMXJZggOIeK9BAbe6ytZj+9K6lNT2hjqbpqM2DV0ygxaM6Pd0fhxWaxywSTr3PwFYOFxp1xa1C49xi2pxGLt5+V8MlCXR50Xq+FQBV1t8RANoyz1V83Llz+lNiKElUSCb96/96fCU/loWtE57NzMQsEEmKrVy3IGfxzj23/LyhIMY8BQ2oUBgCQ8hkjtORErm4rvIMXx4FtBxil6juIb15AaH3RYcmwNWeMRE8cxjqGovHaBEuRz7+D7ZZAYVl+JrZJkcZ4/uwWPQKxqyNPWJ5+QR3PljLpFkPglp2y/v+ZrmW7khH0WeHEm0+szs/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7875.eurprd04.prod.outlook.com (2603:10a6:20b:236::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 11:31:51 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 26 Jul 2024
 11:31:51 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	peter.chen@kernel.org,
	herve.codina@bootlin.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH v2 1/6] usb: phy: mxs: enable regulator phy-3p0 to improve signal qualilty
Date: Fri, 26 Jul 2024 19:32:02 +0800
Message-Id: <20240726113207.3393247-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b21e910-ddc7-4020-0291-08dcad668b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8CIGGg4wDZq7FEBHBcK+mWy+rspYmfDFlghX3KGRxYd284B72lhlmE2OyIFI?=
 =?us-ascii?Q?iVrBsnS5kD7fvkb+VOMlh4tnYTSTTFtrUFdxxZY2CTvYSpFVj5mv4xgbeUaM?=
 =?us-ascii?Q?uR5B6jcDNyPWebLrAgc50fJb6YDpEQuJb+Ao8oMiHa/DImo8mkJ6WewYJnQl?=
 =?us-ascii?Q?k8YX4e/bjDlkM9zBBekoeSu3TDxsf7uKPGmHFFee1eOPUR63DGLPjew6mViX?=
 =?us-ascii?Q?GQuB5QaOISJpOpOD14YxWeqmjxK1mEOSE/D6DR3gANzhs/zddfP9IxNSuZ0j?=
 =?us-ascii?Q?YFSZmSSUJwislHpay0YvtO4hs764DxhZh4r/SoWUKi6MknUMLpyk81LYHMW1?=
 =?us-ascii?Q?6ME5UXwzSh4Tl9nnhyBe0pcQXj1vigx6FRe9ea8gXOfCnsR+hp/Ehd1cfZhA?=
 =?us-ascii?Q?AHkgPZtYO9KZkJ5Aoytrvyv0TDc7UN9Owi+q6rRgSbu8s3vMZz114b6kmH7D?=
 =?us-ascii?Q?Xhgx7KPHnMNQddBWMHSoL9/Wy5bV2r64+u926GToSHl0Hk14M+x+kxr1b0jQ?=
 =?us-ascii?Q?mDAUPWSXOBuEETgOvT8qow8q6U2nNLZ24N12YSSqYROz8t5cBeEG7MStwz8L?=
 =?us-ascii?Q?TV5I3a4UYQDLO2fjDZdxl/vEcckzzyjE4Jt3v9y1LuIgqK0oxuDpKbz2B7SS?=
 =?us-ascii?Q?CzWSEWBVpSOqu+Yir2PYDjU5F91PnsaB4hsh7m2p5AkwG0FHVLWJJboIFa0V?=
 =?us-ascii?Q?Pdo3pzbG3FK+mGd+464tm8lxnkk53G7go8dfCANo/XNKsgcSP+CUhUMdcZHG?=
 =?us-ascii?Q?AUkZ9Vs61ONd5TvASwwvg8oG4B1GP0D6+3CFhx1lX4utbRp7ondRNgNYCX0n?=
 =?us-ascii?Q?C8upN73U7hXNLZ9fA42L85XFkJ7iOJe/35OS1aHhrmJcXjSLOGoFsC9TfN4Y?=
 =?us-ascii?Q?MbrwDo/fVjDr5ko7YH0iruORDujz4iZYuM5baPFneHR+HE8XLRZ3CXk74gH9?=
 =?us-ascii?Q?QsDa+p4PTwcbfyq/1usa8gsyxUW7BvapniWj+19cqoSOB3pkVQFW49MyIKNB?=
 =?us-ascii?Q?97Cb+UC1nidtju94tYy+HLxyOSo9wTAVRM1Zf2sIjPJBJYqGn/U3cScMFvJS?=
 =?us-ascii?Q?DpOmuhayqhEsPGrrBudWXCed3Bfm2dFWr2sw8HBQpMWgcJ+xmLFy/aWOfRDQ?=
 =?us-ascii?Q?DWSm46btCi3Y1aX7PSEcsl7yItdWjv+n/mF8eiIhnbuYdUVtbOHfKhVxljd9?=
 =?us-ascii?Q?EPCP/UnAwJPBM1gZ734UsC7c2sfUTUo+pSZ/eGu3o6bGUL0jUTDxIalFzO3M?=
 =?us-ascii?Q?AY7ZQ2SyF1qQsT9KGiSsAI3WfSacJxiCfwWwgLL+vSpx/pvTc7BYMk5taALC?=
 =?us-ascii?Q?6YiIhw3TgRSIgf5OgufnkjWrtYLmkqZENKfpfmXkKn2CX5fArfS5gjTx20AF?=
 =?us-ascii?Q?5jw0qM9EKAcUbVyy9voFtt3IqSj6WlOp9Al6hMY/qYN3phc+dEWwukDCCR9J?=
 =?us-ascii?Q?YdKf5b4Cv/g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IFoXSR/KFRddT52XToalTmAmf6GRLjwEujF3q2rxjzskKkcBsQFg6/RYZlmH?=
 =?us-ascii?Q?romdFRQ50mfJOgY4szZADUlXTcYoTAbPCoawDe4R9N85gZtNoet9nGWMcbG0?=
 =?us-ascii?Q?ZoDwm82Lp6Wpwr59ymmifWoAy8UM513c5OdBrLrsGwN0B/kG2zvq1G+oY+pU?=
 =?us-ascii?Q?WMed0E0dIjDGvdE3d8Sv+yAcdJ9NBicUtbjKegNYuvtAcZvsdRVgXB01tA+K?=
 =?us-ascii?Q?SowKbD3Y2qlhdEo6wBxU2ZWuiInpjtL7m8NGvqqe3UM420zhm89m/gK1AL4G?=
 =?us-ascii?Q?F2Rnkq5skVGsBs0YPaMx7Gth7M3B9PPbhuPT7rHanR4OJ1GPUXivs9xLg/Pj?=
 =?us-ascii?Q?2w+NJ0azVgHO9KEvBbKYfk7ZWY3tilLRqGLQWNL6elxJof4JpKLouvTi6rq/?=
 =?us-ascii?Q?YSNh7cfOmzsgPz283csGk5LVILHeRDB58E+KoUxudfXw+Jna6b5prPxtjKKN?=
 =?us-ascii?Q?DvOunWev3xO0VGvF5YKhCygbeFhvEpqfN5kv2eKIxUxkw+b+h0JeiBP6HI7k?=
 =?us-ascii?Q?3Voqw1hP5lUc3ryMtBI3XKnnCtqtnMrIDC+nZVY+r4l5ubhE2M3cYkFT0h/t?=
 =?us-ascii?Q?Qz7j0nhCObh6fD/euQGqErpp8368WDUkt8EEz2K6em3xYRJHfYQg7mI8R2nd?=
 =?us-ascii?Q?ioD8G+gjT/11xeeDTwuby4AtyJXUFbMpZm7W89gB0T+7uwjVxNZEzkc0cThL?=
 =?us-ascii?Q?G03PmsYRvC25avwN3DTOj0xkFrA9WU1+xpd1CZsAqV331ci49PFy4NKoV3FQ?=
 =?us-ascii?Q?eMlz8v0+W8J//vmLeIpHi0QfzUS8OW0v7OA5a+5AeyT2WtHv/YUbWpcS7nfZ?=
 =?us-ascii?Q?XxsU/1KfPNpaOf/oaurPUaWmXH3bUzpXA7ArTlVPLInV6NwNftHTVJecss4M?=
 =?us-ascii?Q?/cqX87y/0Y7+b19Q7EjP9s1lI7ejFblR9srUeW+e88tqdjW6TlYO3Dng6Lj7?=
 =?us-ascii?Q?rZkkBm505A2kTac84FzEjgwf47H/4iPwXp4o4gsfJOu1mJYY7gPH92UkQRkh?=
 =?us-ascii?Q?UxSK77N1VHEFHU3z+FcnVSe1JfOJ4Zzo4KoDGxeq663bcBJqA5buZITbkMOi?=
 =?us-ascii?Q?7YwMa3CGZb5g9AXlA40Tti6H2mn+cIkUaa9fcE/O/kojI/WftxNQBoNvjvqc?=
 =?us-ascii?Q?gA0hsQcBne6Cje22nhvGpMk0o//PN9xiW+h+GdNISMtj14XhdLA4vtJHbAeH?=
 =?us-ascii?Q?BkRz8Jy9VStzLm5+GYenq/y8S9m2DAqdlow/IUgcjXxsaN8ZLi0LmPgS6bdw?=
 =?us-ascii?Q?1tvN6OKu6j5eYBW0E75l+zBCs/HMGsp5rIoXsxzF6Xb7AETVjCAsbLwFA9yn?=
 =?us-ascii?Q?OoSgQcXtBMpb1MLsYd3vJC0VkPXojv77oa06znPxc12NiGI4QXxhv8YA6art?=
 =?us-ascii?Q?VeNtsf1urHJnWS4Hl79F2Jeu4g+hRDziMObIrlWCQ7UjRky3E60G+JMk+9o6?=
 =?us-ascii?Q?RvIPZFMfA2iFE6VjTT3Oa4h4MHb/fNTEe51+emLwFQ/hrSDkBpGx6hAJBBK+?=
 =?us-ascii?Q?oKx+qkzbZm4hQSF2Z6CngmsbI532N0Ib1D9EF7UbGhMO0X4y1kpHi5Br346s?=
 =?us-ascii?Q?I5mN9PEtGJI9rgZQbRXcQ8TCFvl4IJoMuBSMmvZd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b21e910-ddc7-4020-0291-08dcad668b00
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 11:31:51.5145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wthNgj5LQux5WaU8Q+6C0+SUl/KHxWIkU3Qjmb8XmRzWsPAdZP/+dpphrTLpC3kKvn1fyHPU2IqlY3Ll1hgJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7875

Enable regulator 'phy-3p0' to pass eye diagram test since it improve signal
qualilty.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - rewrite commit message
 - use dev_err_probe() as suggested by Frank Li
---
 drivers/usb/phy/phy-mxs-usb.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 920a32cd094d..d9d29f0b37de 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -18,6 +18,7 @@
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <linux/iopoll.h>
+#include <linux/regulator/consumer.h>
 
 #define DRIVER_NAME "mxs_phy"
 
@@ -204,6 +205,7 @@ struct mxs_phy {
 	int port_id;
 	u32 tx_reg_set;
 	u32 tx_reg_mask;
+	struct regulator *phy_3p0;
 };
 
 static inline bool is_imx6q_phy(struct mxs_phy *mxs_phy)
@@ -288,6 +290,16 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 	if (ret)
 		goto disable_pll;
 
+	if (mxs_phy->phy_3p0) {
+		ret = regulator_enable(mxs_phy->phy_3p0);
+		if (ret) {
+			dev_err(mxs_phy->phy.dev,
+				"Failed to enable 3p0 regulator, ret=%d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	/* Power up the PHY */
 	writel(0, base + HW_USBPHY_PWD);
 
@@ -448,6 +460,9 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
 	if (is_imx7ulp_phy(mxs_phy))
 		mxs_phy_pll_enable(phy->io_priv, false);
 
+	if (mxs_phy->phy_3p0)
+		regulator_disable(mxs_phy->phy_3p0);
+
 	clk_disable_unprepare(mxs_phy->clk);
 }
 
@@ -789,6 +804,17 @@ static int mxs_phy_probe(struct platform_device *pdev)
 	mxs_phy->clk = clk;
 	mxs_phy->data = of_device_get_match_data(&pdev->dev);
 
+	mxs_phy->phy_3p0 = devm_regulator_get(&pdev->dev, "phy-3p0");
+	if (PTR_ERR(mxs_phy->phy_3p0) == -ENODEV)
+		/* not exist */
+		mxs_phy->phy_3p0 = NULL;
+	else if (IS_ERR(mxs_phy->phy_3p0))
+		return dev_err_probe(&pdev->dev, PTR_ERR(mxs_phy->phy_3p0),
+				"Getting regulator error\n");
+
+	if (mxs_phy->phy_3p0)
+		regulator_set_voltage(mxs_phy->phy_3p0, 3200000, 3200000);
+
 	platform_set_drvdata(pdev, mxs_phy);
 
 	device_set_wakeup_capable(&pdev->dev, true);
-- 
2.34.1


