Return-Path: <linux-usb+bounces-14079-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EEF95E9F7
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 09:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58615280F8E
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 07:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEA377111;
	Mon, 26 Aug 2024 07:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="My7PuXyG"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2072.outbound.protection.outlook.com [40.107.104.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3C981751;
	Mon, 26 Aug 2024 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724656108; cv=fail; b=FIteWzWvHIduwwdOrRSl2jQ6dkKUl58Lz1h7rkhlqJiD9JY4/gVwRV3Ygh5BgoUm3ttu4fwWInOhZIn/ZfgypfSL9MM+m7Oos7UF+4PqHLZ8DWkUaKhYKmrrPYWC5kdvJBwf3qE+/2H+mX0fPE5Hh0QTaemXTTRHQPO2ZiE03sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724656108; c=relaxed/simple;
	bh=ihJJFoCtwFInmHag+Ff+A0FUV9NB8ya7pIPhIclteKI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Fa9W6QAcI8o33F6eRNPTdUThBLZmWxtBbOhzh8KEpgH01Kuq0/WINq0f58i8uOKQDpQ4P61xL0xATzNhp6cfmAF8tnMNfIrJvzaSa/Hu8CYoPHdmJegJh9kUZGDEt1kYunsPn3KuvswNZ9qjmInMfD9u2L8X+djG5d5HHK0MDuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=My7PuXyG; arc=fail smtp.client-ip=40.107.104.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+AwlQbcJ4wGF/yVrC+MeHwGXgVg2yZKSQG+LnaIxEcNFrhGp494tMIGqUrWwLu/A4ZeGOXEDgCLEQygsUuVwbSArnaO/f3fon397/u0oTpww7012wfK2kmKrPBMX9PPAO8THFPCEpKqa95bWORctz/oJzOUCECm6zYFdkzvVv6W6Yw+vA40trasPlv6RViFt5i59MvNJ8UfeirgNKue/Sjz+AQHO2BCZeU45Uu+pe38j9PiO94PLbvl99VHD8iPjlzuvNy9NbXjyXFgPvbrdF4Loo7q0lnJkyFDa1LBh9Fexnkb4WXH9tVAyKaMfpmKyT/9yn8GVhp9exYHu+w3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUvyS6wBHOdfXUbJ91I/zXi40m/hwyVSSzOM1+9oYwc=;
 b=wUk/27EHWdskmAV+iGY7Ypgr45LZkIG8tR6WifHOGAyyelewPj1AEX/x3MECdpT0DMhuQ1RIoAG0A8ivBJ99xpYTwpGBA7DouR47GSotpyaMU/7hReb9BPhq/9LgHTdqyAWcQgJWFS8Eoc7f+515jJY/ULkSZjbXHQoI40LNp0sW3xABPEi+Rl9Co+MWzlP0OSTd7zDzdrzDd4taAkH/tGs+OVWB/bu/CTNp0MA56T75BrXpp9EZUnUKPUrP6toFXqFStZ/YIyJ7Gq8ysdMEpwWTIBOaLKuxh+SVwxgETXOkkSgjbKuYed9S9xDowB1irp5/JiIkX8VFEV1tgODV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUvyS6wBHOdfXUbJ91I/zXi40m/hwyVSSzOM1+9oYwc=;
 b=My7PuXyGlZBL5/ZY0CGXXDlkm5/0bUt+TEbJ4V+mio+MTq6emMCu54wW3XtWMbi8OBjndv7xK/W8ie6foXzXtAeik+i7uy2nKT7kBUllDcsLh29UVCh4ebhAdhC+Cd/6NWFQu1KfXkYaEpXvwNGu8FobQ3BcbzKELTdEOR1Q5dOUtO0Zp7VuYEYQMVWPwT0s5K/0M6vdt/D2m8YhmyveSMyezJ/JcGRHIdgO44rkjF1VDLc0gJHb3oBwfy7iKvwOuupZoLa+3iICcuZFfqkzvTWXhB/aRZfTd4gVpypaPAxGs4mj+QjhNB4E7h7+LVZBUC9D1+f4BXLLd1R4Yp3ojA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB9637.eurprd04.prod.outlook.com (2603:10a6:102:272::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 07:08:23 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 07:08:23 +0000
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
	Frank.Li@nxp.com,
	jun.li@nxp.com,
	l.stach@pengutronix.de,
	aford173@gmail.com,
	hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: phy: imx8mq-usb: add compatible "fsl,imx95-usb-phy"
Date: Mon, 26 Aug 2024 15:08:50 +0800
Message-Id: <20240826070854.1948347-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0194.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f988ac-86e0-4e3e-9136-08dcc59ddfd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TW1cewbFOa45xaFBQJPneUij4yL8MKdX3R0Qk1khJW6VSbBWQVSiNpq13AqU?=
 =?us-ascii?Q?o9ULuOcs/aHrzMb2wAzStsV+UCP9dr3k/+XomGH0d6BnWaHSaXzlJACcbbMu?=
 =?us-ascii?Q?nJrFQqqWvcS7Pe/7VAc1BX3cDs3mte4eW6uIHeMsHvkkZGE2wC05C+g8JGoT?=
 =?us-ascii?Q?UkoUzHJ5jsfklFGVNyfUxnt5gYVc9ZVFIufTR6JEB/CzTgaOlIkNea28Zj2m?=
 =?us-ascii?Q?VJbk6lkKY5aUsAX8CUxUEtaZh1+jcxOW6LqPyrzxTtfN9Z8CxDtzvh9JJJQC?=
 =?us-ascii?Q?PI6FztV2Yh0CMs7QpcXUVDFBaixax/nH1xxb8UlF7qpxRcUsHotmVgmc61sV?=
 =?us-ascii?Q?bUmYpt/0TAtOVxgBds8FTSEkfNDFMdT1HFTwmDLVXg/xJU3TJ9nqZx0JoMIl?=
 =?us-ascii?Q?ImidtLa+JDG3UTJ8YFWRyGxlWYmT4j2w6CWVffMijBDlSUxVPsOy2D37HjGB?=
 =?us-ascii?Q?2Sc58Ufyfpe9wI+1gBwxZBZzwRhgpSqjzPlGibKRHz3lkBKPW4//1j4FZcdb?=
 =?us-ascii?Q?knOc+Crnk1UCL+jtrFB1PzPCqCTopFPRehisXDM/k3QWqs/LR6QhfE1aVtSu?=
 =?us-ascii?Q?nqZtVioWmDhlCsjuN+uOh8zauGohubPB3KDnMYPtbRyhllhyNwBmZ3jH3kDb?=
 =?us-ascii?Q?FOcilLtCUqkMho0pICvedtYAaWuwLCD9mV6ohGxroQ4hPVkGrwxml+DU2kRN?=
 =?us-ascii?Q?aRapfxUEt11JG+3nAABnF5Nlu0t442SzV4plaeZ31Fwix1GfoNTpa8JZMf6k?=
 =?us-ascii?Q?JbIZVRuDoA2OPbZhM+lF5y06GY5CRIXNra5GnNvhZfpp9ukwEhLMmNJEqLSD?=
 =?us-ascii?Q?e6URcNgI045ZemjNEXGUpwEZ/ViszZfeou0/fV39Z25FLFmOZFnbAWKnq4qc?=
 =?us-ascii?Q?FSzFhgCKi2SN9M8O/ro/Wi+2pRlS+HTJJESjfGqYUXtjI8kh/c7OlgXwL7Ei?=
 =?us-ascii?Q?heTcvhbXH/ngqJZJTk1/TSNPkLvO7d1v0eGlrMy8CVdyZ+XlGpISdUMoEtZ0?=
 =?us-ascii?Q?E8eQaN5qFjjo01EMHf/BLKyiZCIe88EtVZpaZIzSb67aXK4uPn1thuvwwDIg?=
 =?us-ascii?Q?t63gDrPzS/3q/qlumcZqBbQzGqxXKO/9jF9Kmn7y0zvQ4MzWi0I6B9ruePWh?=
 =?us-ascii?Q?c7hCRLFge+eVrJuTn+REhbooFLaEvpK/acSJWFYhyX3xGi85kCFfm/ozoD3F?=
 =?us-ascii?Q?FoGjXa9eMgZIRXxcxCeJ5u6kjRb5RBRi+42GMTBC56HjojiKst7DAHpjkZlC?=
 =?us-ascii?Q?PEqFsihZ+qvhktLXNNLrYPoXEID47WhD3wZ5F7sx5g65c10INTm6ndPpbApp?=
 =?us-ascii?Q?Kzsc55NZCLYdqCXsGTynHZqlGXbhHgt/+Buc9BfPEht/9PQD0QRS9cZOULLW?=
 =?us-ascii?Q?gxnQ6vUhkkAUVWJGtQXwYjS9FP3XYqkv264vpKEwJqIQJ3c7ak9n/gkj/kVr?=
 =?us-ascii?Q?O/H+sVRi72U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f7rbPtp83u4/oS5ILNjCpS9Oq+sLUJ1KvUZ3Awu3DxEQ6Z75eCzwVMM66ik9?=
 =?us-ascii?Q?iXBTTbfFnZDdUbK7PkieWUa22efQDJIeIKWrSd10JgWTWpFqczVDCSKAmVKa?=
 =?us-ascii?Q?PXDsWXcI1Ly4erMM5naTJdtsLzb9Ecr+CWNwnDf7HFrBbHnOh3K98KKzomDR?=
 =?us-ascii?Q?YgmHaBqQspvxeqD2ePg5biD45lF2TcLINtzZXSOTKSMOwC23bqsSvRwARFja?=
 =?us-ascii?Q?DXKnhlESzH9ppGgx1wrtcVYqz5q+D6oYYAlJ9AUbkGxO2DTeORQJWgR7Jh8J?=
 =?us-ascii?Q?ALOdFWYNJd0tzg2WRMT9A+UDnK/bjQNQGvAIDkgrDMFwWb3JDu5/vu8iauRD?=
 =?us-ascii?Q?8s6GdKj1T8rg8+Z8K424KYY8QaPJW7eHvCmkBXhemgCS+YaNGaObakTAkETR?=
 =?us-ascii?Q?Zgwetw6zmIUXmq0IxrodsA5xWFB0xZZIZ0nnDWOw0AlpQerD8ILtYfKtfFIc?=
 =?us-ascii?Q?de8c1cVGGccuPYKUOqLQjEEsu66+46GSPJffjEB89kl36p7XHe9CWQSNS7gj?=
 =?us-ascii?Q?GK/2j4ONaGAnctFESE9awizclIastQQFBCBPW4aTzV9T3pwOICIPFk0ahgmj?=
 =?us-ascii?Q?YO6Xs7QmZ5gIibHbZDpWf9v3S6IrPElvrgOuRpxN+ayxEcG0kBsKBrKvB06U?=
 =?us-ascii?Q?aD/WVwbPDOikd8e+10jdW+5KEcRrndUGU7kiFY9vUZ7IruTMTPfCWVBfyW25?=
 =?us-ascii?Q?CXBw6n1J5qtuxhdReYGUwyhmPvbtRPyOhtURQxc/dqiHVV/OlLUNwKpOWrw+?=
 =?us-ascii?Q?W/qLVQPZt7Bk4/rjbQ7GNeXjSNcGahnwLbyjbcbdkCjJLxun7azTKsUnpewL?=
 =?us-ascii?Q?/SVe5YrOfvVXJOQgXADXQ6AGYBUDBLQOku5zUzq8isW/vXbhBURFtoGe6nnS?=
 =?us-ascii?Q?We61rhWWSBMnKDYHest3rnJnNN6eEKYs8fKwX9jx8D+a0qDejZkhXVZmdRIQ?=
 =?us-ascii?Q?KQdikkoYvMJYAZ8lLYafu5fghlWPdk5SDxo6ysF6FcZhXUEFJmsDtJU0x1WS?=
 =?us-ascii?Q?gtHHTWtqF18i8dPrxGELFzYj7ZKzi0GExE0TI8tUItRtzT60ciVTxHCKRuxH?=
 =?us-ascii?Q?LvfRT5pCe3wnXYTTm35j4rtbopX6FPetkSwNCw2IjsHF0JxANt9M/ts8gwY4?=
 =?us-ascii?Q?pvGc1uIO9ftQpwzMLA4cb0hse3s7CBXuoHh5Y/GvvJReDx3eSUZBDVimSP55?=
 =?us-ascii?Q?yaP+AqP9NhBjkRFnkzdpkg3YtwarQ/n3IUzmByNmvKqaDPoD5nXHRwrlwLfm?=
 =?us-ascii?Q?qy4PhKnhOeALkvnlCIIZlnqMbo8ssCmUhoVbkQGuTzGPJuvS39Af2MiHSzcx?=
 =?us-ascii?Q?9TbX3BBisHpe7qKceyT5KXU0Rg5Sk5CDgh88R6F/LpUGahY/yfs3YoTY6hPU?=
 =?us-ascii?Q?kJ6uNSaa0czRDClnKT0bbxrnYlHwwZWN/sSEJlR7cQJzZ6K5UNMmOBlGDwGm?=
 =?us-ascii?Q?92WxghRhIhBCK6mO43rz5/9HW4gqI6tLecaEOSTMD0WUr7BLJ9+FbmD7G1nD?=
 =?us-ascii?Q?5W9OrmKi8fDAem/qTC98r0x3iEsPCg/96DotLcXwgK96GkU52aLNNUQZewSJ?=
 =?us-ascii?Q?QiigM+J6iXZ0DV5ryOSlSdloDN9Z3j4bSTQeEVYZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f988ac-86e0-4e3e-9136-08dcc59ddfd3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 07:08:23.8032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Orn7UkYb32VnhReibHq8x5gi4kTRB+DJ9xhLJJ0TLps7RDPq8YaKfm/SavXTU9HM8BBjoTI5yeh+X630uvKGRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9637

The usb phy in i.MX95 is compatible with i.MX8MP's, this will add a
compatible "fsl,imx95-usb-phy" for i.MX95. Also change reg maxItems
to 2 since i.MX95 needs another regmap to control Type-C Assist (TCA)
block. Since i.MX95 usb phy is able to switch SS lanes, this will also
add orientation-switch and port property to the file.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - replace minItems with description in reg property
 - remove orientation-switch and port
 - refer to usb-switch.yaml
 - use unevaluatedProperties
Changes in v3:
 - add Rb tag
---
 .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 42 ++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index dc3a3f709fea..6d6d211883ae 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -11,12 +11,17 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mq-usb-phy
-      - fsl,imx8mp-usb-phy
+    oneOf:
+      - enum:
+          - fsl,imx8mq-usb-phy
+          - fsl,imx8mp-usb-phy
+      - items:
+          - const: fsl,imx95-usb-phy
+          - const: fsl,imx8mp-usb-phy
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   "#phy-cells":
     const: 0
@@ -89,7 +94,34 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb-phy
+    then:
+      properties:
+        reg:
+          items:
+            - description: USB PHY Control range
+            - description: USB PHY TCA Block range
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb-phy
+    then:
+      $ref: /schemas/usb/usb-switch.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


