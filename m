Return-Path: <linux-usb+bounces-4154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC7812E70
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 12:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30B1E1C21521
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 11:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4E83FB2B;
	Thu, 14 Dec 2023 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZMBuMXhJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBF38E
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 03:20:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnBccI1shDL98yzC1mrp/De/FKYjutJxWNZxIVW30Tp0Xod4ELA2YTpLGlEp3SBFS4PqgmfqHWqSg8BuL9ReAlXqhyVJdRidtpGy/szbz5U0UOXrNcz6UxjgIeedIUcgMIhMBh5/2QqxUhvOgLqd8PN+Eb0S0dBYuhFx4Qhf8BV0Msdz8nMu/aNHFXHcNPiFMRgk/K5aTSM7ENbiWI2PIf4C50Qu2WgdB5jfdCwjxy063WK7ilNgxtu/ame6jHZVx694l0orYnF4ZLmfzvvOv8OGApmT3uXrTCiGukegg0LConHlFSjtKRy+acv5j3LL0DTeD83KIzFbqn88df8BCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vmXWpMklDUFj6qdNuCAtAxN5Tpkm5gHNNNMkV0Br8o=;
 b=FLEYtkjuR/DQx6Ab4cosfJbhZV2rKODiJom/xgI+lp4ACJq39CDEW5Ug4cuBczAVaNEAm1e97Wu7/PHvpTYvxUxwyKz1rZQ7j9WuxGMrItw2WBj9pw1VS5A+nG3e0wURT5VkUllNJQ7CoQnCMJqLqrttsxNmsLS4UFx+ORYOMK/WbUkP0q/j1guF8g0MnX7YyxQuT1zF4ZCr0Uysm+ieP7iPUQGoxCRjQKWwcfj8EG8HpIQCaz8766iIBbAW9UCIju1q/i7258L4HA4mHTa8uXb/PzmT2AhxXE8TX7j0zmYaEEum6qC61i/+X/kf1vITJQdP4/v6FtfiL/r8npIwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vmXWpMklDUFj6qdNuCAtAxN5Tpkm5gHNNNMkV0Br8o=;
 b=ZMBuMXhJJG1wNXP1bC15po26ycRLxYVKM+NTwjU0+IeTuM+X/HciiTUvklgzls5Sd6gR9CaqAb8PeiHoNawvY2/qVfTFeB8zUrzfAviBknn4V60QIm3IBfeZRt1ZTQM57t4sm9gbM1r6joA9grAzcY8x90a4736H1gjMaBaFuwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5152.eurprd04.prod.outlook.com (2603:10a6:803:5b::13)
 by AS8PR04MB7880.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Thu, 14 Dec
 2023 11:20:41 +0000
Received: from VI1PR04MB5152.eurprd04.prod.outlook.com
 ([fe80::577e:f2c6:9d67:f89f]) by VI1PR04MB5152.eurprd04.prod.outlook.com
 ([fe80::577e:f2c6:9d67:f89f%7]) with mapi id 15.20.7068.033; Thu, 14 Dec 2023
 11:20:39 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org
Cc: gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	luca.ceresoli@bootlin.com,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] usb: chipidea: wait controller resume finished for wakeup irq
Date: Thu, 14 Dec 2023 19:26:21 +0800
Message-Id: <20231214112622.2412321-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214112622.2412321-1-xu.yang_2@nxp.com>
References: <20231214112622.2412321-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To AM6PR04MB5144.eurprd04.prod.outlook.com
 (2603:10a6:20b:a::32)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5152:EE_|AS8PR04MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 75fd658b-68f5-4ba6-f508-08dbfc96b378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LSWykH9VRIx6IyYHccylysi38a6MJ4JzZ4dO5/OhZQjgpZNbyxR1SrFM0dZAvgiy98mSvHv0VTzaMBqdZDGn5H9jly2h4YXxMrILRsCtLe0h1oYu4+ZhZbz37qgHET1NvmNIazPOBD91zmAHCJDttjn6wwDVvks1ubYr/aMg/wCKcTiNLWszhTjiPDL9jIrhNnjjY4ReXTYW8FgVocDjk0AxJTsUBa6SGowlJyivome3ytOydIa1M2lNfjvwmQ7C5W9DIAItbi7H77Mwji8KD2mUz2gwOc8/kwcWVu74IYASZUHa1f9/JfOyJhyX0gibU7EtZt/luASy51iKj8HJ8w1do0EsQbySt5fesp8TEq8+aVpIZGMcYL0LP9WX6EwTBFmigm5bjm5/f3ftgnqmFVF0rdQ2qM5USx5ozAyYWKcC1wx4FNxU3xFuFiwKnDPniPNC034vo8HwA4DOIaGKiv/I5z8YvHll0zNAkowqzgxUD3k3XyxcetFVK+PVH6VG/wVv4qstQwQZpZ2uNzj8/j8sLL1ytnpzXAUrMVEaVZDDqamga9b2ynksE0+W7XK+J1nRUTTiniKUSgdGDgaPTZG1+Q/6vLxo+wi2ks0PHv2Xp5kI/uBT9Q8rXB32cPpp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5152.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(26005)(66946007)(6916009)(66476007)(66556008)(86362001)(38350700005)(36756003)(6666004)(6506007)(2616005)(6512007)(1076003)(52116002)(316002)(2906002)(478600001)(6486002)(5660300002)(8676002)(4326008)(38100700002)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HbQG7CUSlgl5Z4tCYivYSyFzI1qYsxjkOVJ8UxpQ0D7pZpKeiQZjElIZaIzE?=
 =?us-ascii?Q?B2LCfvYFAeC83EiGx1i+GdXxn/oVN1WSzL5agD5uIGsZgKUqiuFmmYc4MYKE?=
 =?us-ascii?Q?0loqTLqWKAtpBHAM5/EAHq7O619NPumoXNuRns5ib/DRFFcBLytdbWplLxMk?=
 =?us-ascii?Q?BRbRfohbC84qoCx1GuBAWPgSR/b24LxbCCCNgKwDDkNx/A4lJIgh4/jVfspE?=
 =?us-ascii?Q?MYo2I1F7V/KrNDDSLSmnRQhvavxEHwhCJEaFO+oOWr0+slcdIWrEx7didvKk?=
 =?us-ascii?Q?DKyAkcoWuOdVAmLq9iNtvtMvJ9WK2RnDr/pcOdC7CDlp5xZ24i6vrcTq8s47?=
 =?us-ascii?Q?LNVJcX2n/lGnss/rTJobiQntgFqswWRstw5evhhj2f4d2QzF8JJVuqreAfwb?=
 =?us-ascii?Q?+fjaRASYgxaYPpzD2LNXAHXc8MyRyOorkPjf0l0SHhCbKDQKMuDSILKp/L2o?=
 =?us-ascii?Q?ZtKtDb45YqWQbs61fnDdFH2JNSaUDsDguAU8wlNqCcma+JK/xhpLNiWXa0NV?=
 =?us-ascii?Q?23xCNvlDY2eSdLexUMkv/DOJczptOxmkCPMhkrFeviLvvK0/KWT96t1pnlp/?=
 =?us-ascii?Q?S5YrbE5PKWDCyUWSCBNf0Gwu6QCpp0S3RDDyXWMVlO2Ekq8qFBEGWH3BJfrT?=
 =?us-ascii?Q?VwcHl8FtcITEn1/K7ncS1BXSY1gdavJpi6lDgNpEEg9CdotI9u7YI4sXui/N?=
 =?us-ascii?Q?k9J0WPdnfYXftb7YmR7tFsbFYwnu/uhLd3tFOye+82Xf+Fymfynhr10s5AgG?=
 =?us-ascii?Q?tylc+glf+v0S0zNmQfVn8n+/7czB7KS4GdvXlAY4DRC1lcVsMbOnQlr6Lm2c?=
 =?us-ascii?Q?BnwKz9+h2LXS4gRSMRI3FSdvkKDzXeKQrdRbiuO6mUP8DbFXFACTcPRFYiDt?=
 =?us-ascii?Q?xbn8K11xMLDpSRfVYi2cL0AmZV+B7UKLxf5ErHbrwuKPpE8J1wCXougEwSHY?=
 =?us-ascii?Q?H1/VgjQpoEYKJcIihmuhNxk3KssRngAOZ2apYamd9ddSuPQ4VRndSphe4NHE?=
 =?us-ascii?Q?jEStFIdlJjlD5ijBmVYzz61b4l1dKfEhMdBkwGQb7F/Eu8GYwd9pdgxki4qh?=
 =?us-ascii?Q?bxENNWxxG/TyRNn+z91zzc1+4PbPOCbZ3VSbHEgFjAvht4vFMBNK9oHom4L2?=
 =?us-ascii?Q?NXKNv+rPjBsmHud1/jbrbJGqIdH9ATKu90z2LgIKuvjBk0eUKlng54PuYIQX?=
 =?us-ascii?Q?cjHTUhw3dByMEVuL2vHxsMYF2gnrhUM+lL3FL+fBWbObtFg7dG0qF3bxYjHX?=
 =?us-ascii?Q?ZP7MkpkGRlYj8qHJVGstslsPcT0NsZI/o9E7nNWT1IgW1lT8UnchIixG1rxl?=
 =?us-ascii?Q?4Um0gctwwvkRrjav3N0sWmml2KgO/Xaq1v/XYOCQzCT4Ug95lCXzh+KoYq3/?=
 =?us-ascii?Q?cshasI4t/EUZQXIH4aFfw3GE/gp2gviZa+/Iexs/9M7RPap+eGGa8WzFlRup?=
 =?us-ascii?Q?J7AXnqpZEcZNvQR0sQGASVJcmA1/5SeHSqHYrckYDbIVxqbf2x4wCas1q9OF?=
 =?us-ascii?Q?7jWwIHYdntUPmtJuT8I0ZnFDKyqwgi2XV76jquhMtMjEYQhWsyqY0Ny3Dr2p?=
 =?us-ascii?Q?rPxrtyhXV2DhekxjgVdykqITWOstXeRSL+vhiL61?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75fd658b-68f5-4ba6-f508-08dbfc96b378
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5144.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 11:20:39.3952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jz4SFG+qMoHI8bO1dyydOhaIpIxRbXa2nXz5Gs6+0daP9e3du2dBEagCnjTfbLq0u1J4ekMIrY/IigNPfxMlvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7880

After the chipidea driver introduce extcon for id and vbus, it's able
to wakeup from another irq source, in case the system with extcon ID
cable, wakeup from usb ID cable and device removal, the usb device
disconnect irq may come firstly before the extcon notifier while system
resume, so we will get 2 "wakeup" irq, one for usb device disconnect;
and one for extcon ID cable change(real wakeup event), current driver
treat them as 2 successive wakeup irq so can't handle it correctly, then
finally the usb irq can't be enabled. This patch adds a check to bypass
further usb events before controller resume finished to fix it.

Fixes: 1f874edcb731 ("usb: chipidea: add runtime power management support")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/chipidea/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 7ac39a281b8c..85e9c3ab66e9 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -523,6 +523,13 @@ static irqreturn_t ci_irq_handler(int irq, void *data)
 	u32 otgsc = 0;
 
 	if (ci->in_lpm) {
+		/*
+		 * If we already have a wakeup irq pending there,
+		 * let's just return to wait resume finished firstly.
+		 */
+		if (ci->wakeup_int)
+			return IRQ_HANDLED;
+
 		disable_irq_nosync(irq);
 		ci->wakeup_int = true;
 		pm_runtime_get(ci->dev);
-- 
2.34.1


