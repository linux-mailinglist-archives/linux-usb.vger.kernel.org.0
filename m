Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373B07750FE
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 04:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjHICkj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 22:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbjHICki (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 22:40:38 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0600.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BA9198A
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 19:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cD1Sbn2P2h1jKR/thnVl8aYdvLTIqrDTiGxRO9/VxdnsaS3CFny4N4q1YuaY5qPkarA0g/JoY19iScArFu46qFFgBkDwj/FOVN/Q0Zt/1D7AKMjSaGAbGqI9y0+pq3AWs/oJb5fgtzA91+AOk16YwOps21F992PTqekbbwGSP66ZAWdEaOJS9yMY1HEldBsCMwuSdblKW5ZyU3wIVZBQgTsvGbnRIAqHp6hk2e+hOHkENAHiyqHFUxYhQgTpGmk43UCsDB5mnxKtufSTiI7mQxvqzUI36JzovrBxTjAvq/loS8GXQ0VAj2idEZiEtn8OeztFX8Jtd+8i09neDhCErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IGQQC36QJfjwmi+ZfR5YRhmhybwYqS6LMhZTvFwH/A=;
 b=RSQf85lH+V41ClOSoSKFS+ZkEEynLoQCOpYHe5ghdQawI8cPbH921XSkxnPdyShbhZA6LQAhmrTYu7Ms4FdePPkYFTgvPUHZqsfbStix6DNbLzlElzr+/VHFicntbDAlvpWQ1xNSH5uIjAocrp1+RfH8Az4nDYKQdk05i9ORSC3yAyRxVNBrPq+JbAOmHDpEzvGVmdObYxil6aqM3zsSn3Cod7oTh90hWrLVdLc874T0QWTvlZbx56zaNrTdWFnhBltoFBy8/phBTyq+9H5SyITExPRj61P7mLwAKIb8/bWKhBJ2SvwEe27jCTXhTVEK31CVSUfce8ZmTLo8m0Yk6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IGQQC36QJfjwmi+ZfR5YRhmhybwYqS6LMhZTvFwH/A=;
 b=sWA5HkCMMQLy/EyJv6cEwebi/5xoN6HFIxRd7GTycSJPS0qPcptwrJnKG8mHoG02WJD+Tnc1Rj03Gd2HagKkhH0Hfom6jBHVbtznXHTyolfueWFIvTM42HosyQODLrvQA2mOlCC0A/aoV52oBTE51RcwTSiukbIj1q6QXYyIKl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 VE1PR04MB7374.eurprd04.prod.outlook.com (2603:10a6:800:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 02:40:30 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 02:40:30 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     stern@rowland.harvard.edu, peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v2 2/2] usb: chipidea: add workaround for chipidea PEC bug
Date:   Wed,  9 Aug 2023 10:44:32 +0800
Message-Id: <20230809024432.535160-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809024432.535160-1-xu.yang_2@nxp.com>
References: <20230809024432.535160-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0128.apcprd03.prod.outlook.com
 (2603:1096:4:91::32) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|VE1PR04MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f40ac5-c5dc-4219-400c-08db9881ff38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tcen7c5PaFQwQ+mL+bBRQibao/O3VkGTJamcTOrHGoEFMP1xoXmQCSJYuB9CC1XUxLJyPPEK6Q2j8S4orY8FIXcQz1BKo3gBFBBQ/3UMu3HjALu71aoJ1KVcthQNFRaml5CpyQT4HH895OE71YixJoBQuWCuCCizgP7dhpn5+8twqe5ZlTq7nvWTg+iyKfUJFhFmT5Tfnzx9QRs+esqzRjS0YNkxTxbRN7+EXSYb5etL3+ocmHlHCcUSI+2vRNXPm8r6gww6BC1XG/NsBp7k1GhXW6I2ITqDq6p67I5x17yJTj2+4V2yPJe+xohaQgL9YrX2ZhYTT7RFzN2yavmAZz03FVZD40flToHpKhLlS6V5bl56CtGPvj48HeYmpTBAUAm+/MRgyRO+U1dlG4bawDxjYOSvsBggyDHqaSWAG3sVe8Udny57MEIryam+AQVDz8BYOVXN7XVJDNWPclBWfW8s0bkT+S/X3tD9iOCJb+mdf/teoMayVz2HuEcbedIx8XGHXoQGI5OVG/tQybvMQI9WqfElmQL/QJNjrBlsF/dwsJ4hy3vNHTVVcX0HJmsqxLUKaJmKxbYzvVlEwHMUqzdtczlCy8k8mUEF1jwiKMiz07TMZEqltvO0mW1IY0at
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199021)(1800799006)(186006)(316002)(66946007)(66556008)(66476007)(4326008)(8676002)(8936002)(41300700001)(2616005)(83380400001)(86362001)(38350700002)(38100700002)(52116002)(36756003)(6486002)(6512007)(6506007)(26005)(1076003)(478600001)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rJwEyYLK9IW/MLrkJSSLkkd4CUHfwSDGay5ri941DNjHMQwm49b1dAubME+G?=
 =?us-ascii?Q?zeGPZa4QgtHO9XcshlZPG5seV900c1ZTt4xupZYeBwf2jp+20ndclf+1ZE+0?=
 =?us-ascii?Q?xLeuYe+0ZHJ+/Z0CywNZvtJ99jUjSPjNExLQO1fTHIRS0CqNFQMQndX5zYaM?=
 =?us-ascii?Q?K2srNzngxFj0eypmI742vExTqut9nTq99xbZlYw4Zwy9HkrU5V+5Cj82B+QK?=
 =?us-ascii?Q?PVbN1PKzTIctWJpJYXmTiX6xA1UGkEGSgia/pMgAkO2+ILUDfQaQe0xAJb15?=
 =?us-ascii?Q?Q+q6QUUR1WZCpejkvYJrMs5hlSXVBasBCO7Y3gwq6ezgqWtGVrUMVtvI/x7X?=
 =?us-ascii?Q?79Aip6AGKZLpmBQJLJ57XKwLvlMGvxpL8C0JX5oAeiPRj9R6317nkGKd7AVu?=
 =?us-ascii?Q?iNjrqsmT3n4NESRRZUxwR1+4QwFn32NWtGZA7nKaJnlOufstMUG/wje9SZMp?=
 =?us-ascii?Q?ufXyLh50f/EkeYQDUsguW4gftW4gXmoWJmArZbGFbsmmX6IQbCuSVELTujOy?=
 =?us-ascii?Q?qbXS5PZXDRrN8aVZlZ++kbDePcAicUzCRT29IDXUi56DD20qzqaBOyhVOVJ4?=
 =?us-ascii?Q?xTosM5uLbWURQ59k4dazgOq7xrztMkzfYWqoh2ci84Gc1D4u/MeIgZ4iE4qS?=
 =?us-ascii?Q?dGylym6RRINol74PNvj6rSj+7OikY1pSS9pyxwpuRyPAr5L1eVnACdb7LL0Y?=
 =?us-ascii?Q?ekcSP/0IKobbs1A9ghTk5XlibaD8Mzat3pd3qomUET/e4jwORVF7Pb3D3Sg1?=
 =?us-ascii?Q?4VX0Zv/e37E8UEDJXbbMZ7ntHZHWhhrgNAnd9XntVVq+QrSlUMYSkzZBjQY9?=
 =?us-ascii?Q?ODiMADFho0ILT6dXv9gXbtetDEMstwPAwQk7SD+sXxyjZh7Z24aIvk/d3A+g?=
 =?us-ascii?Q?0WQKQTGLwWbb7uBdrZu+6bfwQhX8QV/DX6lvQvrJ6UldAyi7qZ9tGcnRus8G?=
 =?us-ascii?Q?HTCCKzYwXxobTFzECOgryZptDuLvidEK9fuYUFV5z6+bUAdghsWeb1MsQO1P?=
 =?us-ascii?Q?JPXBo1qGemBWxyWrFIMXlr00O9t1pTtt6VR5ioObLLLwKlMVUuwPPXRa/shu?=
 =?us-ascii?Q?PG5h0bqyL2qvOH3LI8Hy9ZjsHkZVEuQlKwN0I173KCBQZwuA2K/ON+HroJRt?=
 =?us-ascii?Q?kRvMf+LGW8cgXZl5n4tWO0wg/9O4sZvRy3S1UdZAvg4B4nLc3C82/VilGVFg?=
 =?us-ascii?Q?BA0cqanmg/Upu5OrajRidooCGuFc819onvfniHGVTttkdGqng9dThmiwGnyq?=
 =?us-ascii?Q?iTKfFdXW3KU58DMTFHcGVoWtk1li5mJiJjlJzonqxnukhYCuy1tt7y/EOw8G?=
 =?us-ascii?Q?dq6bIWiBmeVWJXK4OQqzedw7sBF/UB2ynBeTFwgj8yornhuH8Qqd+b6eYsd+?=
 =?us-ascii?Q?A6fg5FjZocle5dhENKUIeAFK/GHXTumHpLOdCC52EA9UaDOn7MntDAXshN8k?=
 =?us-ascii?Q?wSTI097tiiNb97E2ajKib8DgpMPbF6tozPjTrMn8bbvyaiij9ryop+WWW1QM?=
 =?us-ascii?Q?/xPtYF554MEEbVa9Eqv7Hc4BMtZblKeQRXlz3CW0vP49O/iVQNia+BHM4Lqo?=
 =?us-ascii?Q?j9PAoqNvlyuOZGAxBEEwWVZxyJ9jhnaEIkdbkjk7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f40ac5-c5dc-4219-400c-08db9881ff38
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 02:40:30.6014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1W6wnz3LjMZ+676zRWYgfcR06saT+j2siNZa4HliYoA31+dLEDif6zni2DRdaFmAcDDuNh6KODEA1GEt3cuSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7374
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some NXP processors using ChipIdea USB IP have a bug when frame babble is
detected.

Issue description:
In USB camera test, our controller is host in HS mode. In ISOC IN, when
device sends data across the micro frame, it causes the babble in host
controller. This will clear the PE bit. In spec, it also requires to set
the PEC bit and then set the PCI bit. Without the PCI interrupt, the
software does not know the PE is cleared.

This will add a flag CI_HDRC_HAS_PORTSC_PEC_MISSED to some impacted
platform datas. And the ehci host driver will assert PEC by SW when
specific conditions are satisfied.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no change
---
 drivers/usb/chipidea/ci.h          | 1 +
 drivers/usb/chipidea/ci_hdrc_imx.c | 4 +++-
 drivers/usb/chipidea/core.c        | 2 ++
 drivers/usb/chipidea/host.c        | 1 +
 include/linux/usb/chipidea.h       | 1 +
 5 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index d262b9df7b3d..d9bb3d3f026e 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -257,6 +257,7 @@ struct ci_hdrc {
 	bool				id_event;
 	bool				b_sess_valid_event;
 	bool				imx28_write_fix;
+	bool				has_portsc_pec_bug;
 	bool				supports_runtime_pm;
 	bool				in_lpm;
 	bool				wakeup_int;
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 772bbdade994..e28bb2f2612d 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -68,11 +68,13 @@ static const struct ci_hdrc_imx_platform_flag imx7d_usb_data = {
 
 static const struct ci_hdrc_imx_platform_flag imx7ulp_usb_data = {
 	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM |
+		CI_HDRC_HAS_PORTSC_PEC_MISSED |
 		CI_HDRC_PMQOS,
 };
 
 static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
-	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM,
+	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM |
+		CI_HDRC_HAS_PORTSC_PEC_MISSED,
 };
 
 static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 6e1196b53253..7ac39a281b8c 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1044,6 +1044,8 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		CI_HDRC_IMX28_WRITE_FIX);
 	ci->supports_runtime_pm = !!(ci->platdata->flags &
 		CI_HDRC_SUPPORTS_RUNTIME_PM);
+	ci->has_portsc_pec_bug = !!(ci->platdata->flags &
+		CI_HDRC_HAS_PORTSC_PEC_MISSED);
 	platform_set_drvdata(pdev, ci);
 
 	ret = hw_device_init(ci, base);
diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index ebe7400243b1..08af26b762a2 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -151,6 +151,7 @@ static int host_start(struct ci_hdrc *ci)
 	ehci->has_hostpc = ci->hw_bank.lpm;
 	ehci->has_tdi_phy_lpm = ci->hw_bank.lpm;
 	ehci->imx28_write_fix = ci->imx28_write_fix;
+	ehci->has_ci_pec_bug = ci->has_portsc_pec_bug;
 
 	priv = (struct ehci_ci_priv *)ehci->priv;
 	priv->reg_vbus = NULL;
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index ee38835ed77c..0b4f2d5faa08 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -63,6 +63,7 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_IMX_IS_HSIC		BIT(14)
 #define CI_HDRC_PMQOS			BIT(15)
 #define CI_HDRC_PHY_VBUS_CONTROL	BIT(16)
+#define CI_HDRC_HAS_PORTSC_PEC_MISSED	BIT(17)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
-- 
2.34.1

