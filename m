Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29E095FD573
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 09:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiJMHNJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 03:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiJMHNC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 03:13:02 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80085.outbound.protection.outlook.com [40.107.8.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB80D1187AE
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 00:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/tQlRZdPXz4gypBmwiPI7ODVpN13SGbSNJyjgZ5N+cdAwHYlGcTJXBmXNjce1MHtzTzmEMBtSHVmVjzAaLrpNRzbCIUY80u9s3aDzGbeke3OIguHBto7oPouJXlH36wVm2l5tl2+kDE8/vcK6mPaHRUjJsLpDL8BaKykSCIlQ8Kjima+qLbYTuj240sUf6cOCLjlKWl7f7Yif3Rb3rDspuz6VVeNSx6lwbbpQ7YACoPVT6aEFahrlsJQLDBikGLoNol3brOS0QDOfXtig1VuNTZIbAzXwvzJo6fhCPt21XeofyXh6FylGrMPGpb403qHpphdtEmuQcF8Ird0GglHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVdiW0xtN0nwn4+0z3MqCOmCDrj+xsI9ox4QCiTgzTc=;
 b=BFEpXn4/UDo6AlDPoDMEkxnwvnpM+bLzupC5BlrmNs+hFBErbAEVwKldCtXp1P8bOdqxo+Iybg3QDHmnIughZeIsweRq4KdrNTgePVueO69D677MqKEDgbFLQrzKCeLkI327R+jealhKkTcX/YLF4U5boR8jnXMYaNKWaO8lY9A8N1q5m9rYVHSNTQzc++u9dGUV/Kc34MesrFTkIrgrVq6TjDryfyoP/VOMPpdMcT1i0aSbE/KAEv41IINMOQgcxg/j6Xub5rjcmU+xt01UR0wTC8E/GHxX6y1JvXPWZOmwMMEw3s/En3rTY6L7GXXTr9C68bhUa/dvQbu9jVvVtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVdiW0xtN0nwn4+0z3MqCOmCDrj+xsI9ox4QCiTgzTc=;
 b=lJ03pNrlkH/MHNRCPaG9on2f26ulNSbPhTIYKHyACnfP0FZu7z112aM2crd6bKQfh1P3q1FxTDlYgLaa36J00tI3MMf69Ss6X73TFXN3c0C76ABvLRQfQzUYNJL0NFkc55vTAxi2R/eosNGGwqd0Lod4t1FnQFel7FzWD1fj7r4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB8444.eurprd04.prod.outlook.com (2603:10a6:102:1db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Thu, 13 Oct
 2022 07:12:58 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 07:12:58 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v2 8/8] usb: chipidea: usbmisc: add power lost check for imx7ulp
Date:   Thu, 13 Oct 2022 23:14:42 +0800
Message-Id: <20221013151442.3262951-9-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013151442.3262951-1-xu.yang_2@nxp.com>
References: <20221013151442.3262951-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0091.apcprd02.prod.outlook.com
 (2603:1096:4:90::31) To AM9PR04MB8777.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|PAXPR04MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd8b384-52a4-4cd9-65e2-08daacea5b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aq2e24fr1fgUs5zfZVfcHqbjDXPAnDnKfogatoRwC+3JWzbepGbp2czvCQWQdtXxXIMiGKPTLXfaL3m2qDdpnYXwI+mTSBllRhY0vOFLRrl15X6a5CHvlbUWuWacxzuVT6uJTB9yjNdR8EC2Aq1tDl7/EQ4hkVo5rNNpa7nc2ap8uaXW+cCB8I5uxN87pil8bbyD5H5R7M56n0fqfua3m5J9b5NAOmQePv+HXE9CQzZZzBUZCy4bxQKQQD5PNE+xfDMQiAa+ID1RjQXb9kMvhyI0VDiUtHKZPOExf6MNy3HU3YChZ9eccQLZ1e0LaXWG9IM+FTZ/HccAS5or7NnSa4NUg9wOMLVSCeCDzIII/x4oYLxyr/lfFHkE3S9OYgV9bVL0rT1JXRstg87358aIgW+ix/XKCOaccWE5Gmtfb/KCl+aPgL18jN1GMWX+QpdwKSvvN7YuQlvshzRM0Rj7aM2W8jPM3fjosDz8Ekl9IVKv9LV8qLasvjgTfjUYleZTsfopW0Ik6GEMsV59xw9e2/8RalS8OMhl1i7V0bHEfE5bfOC1LR/vFRYXnRuM8GUuzxii4M/vFBbLw0Hg9bqnMK43gYzZG0A09BnxJ5zj+7psDF3PfdnBVO4O3I8DyZKQUyjGwz00gtPJGeBHZPFMT//ydAHWby5VTRDdqFXT2dmcBMsur+i0tNcc4MjMlOt8C0hdGZD7EXysraKV5qhcV7mGTmxTZTCqO2duBIxkeDwogSL4qRzKfTebBwCg+fhvZCSL2KqApCiyd7Bw8zhv8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199015)(41300700001)(26005)(6512007)(36756003)(6666004)(478600001)(6506007)(52116002)(6486002)(38100700002)(316002)(38350700002)(186003)(6636002)(4326008)(86362001)(66476007)(8676002)(2906002)(66946007)(1076003)(8936002)(4744005)(2616005)(5660300002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xrQDYfGsLM6I080V4NBpNmZ48hwy2eT5rsprHhsYbciRu5rjMjytJ9fC+47m?=
 =?us-ascii?Q?6cRpcG6JFJHTrUBsJRRjykdBTR+U/DaACD+btps4++kDO0jnPu2j2LqCggtj?=
 =?us-ascii?Q?KIwYPd8RpMTolC/NOTrqAiEJskaWfj5F1dGLBMOuoAUlNkwALVwLwJgLIEza?=
 =?us-ascii?Q?QfhxHTNPwT1Pw1hMTq/0TIkK89p1Fw8wqEOZEd5WNSVZFFMcEVPU2231pmZx?=
 =?us-ascii?Q?ieDITeSf0pWthAKrVa+Q6KjAyrKqIZ4ue7LSUgqM9L8NYd6A2gjtrR7we0qq?=
 =?us-ascii?Q?ac3r7uie29QKACDCpbCoaZKGK1sx5QoB+ouMIiew53gVh39ZrIKpL6I7sCDs?=
 =?us-ascii?Q?u8k/hk8YZEB/cz8sO/ZU9XICooQ3gHlH1jsowucroetgvKf5/21ppAiQTkIH?=
 =?us-ascii?Q?INeMPjandNq1Jn1SfOEoW9+saeYa6r4pEbFz+yz3asq/6Aei5vDP1obWpt9G?=
 =?us-ascii?Q?LfGu4rRJ/sWXwGDQqxkydTbjTEpGftBNfyWV5wHL1KL9yqzMDOz6d+OTRyqE?=
 =?us-ascii?Q?ZiN+92Am375NuK4HukgEChBRyrY89SJ4PxJe8hCWIbzpFNh3gY9b45Qc+TlQ?=
 =?us-ascii?Q?XiiGhwgZZGhGIqmHKCzv/KS3QaorOZoJl30S+BGOGApDakS0TCJaz7YoNuZs?=
 =?us-ascii?Q?NmZ9psW58TwKA4yiZ82PvfF8tLGLVTai9U6+fEklpaukKnBbmnP9YTq5drCD?=
 =?us-ascii?Q?+h5Tc7+iOnqilpuHPz0KG4+m79dLTmRlo73rvMbKpNk2XttK1CJO48UPoraW?=
 =?us-ascii?Q?CpH7naFvXCF90OSzd+US1Oor+4Ed0nTgOOg2RpxK9IkG4mtRftBuEIxec73y?=
 =?us-ascii?Q?xlaQlIPOiLoAnsfh/I0DFRYqXnSluwNua/3/7yVyKGFUhJ0Zy64kAy97Qxg1?=
 =?us-ascii?Q?lFh4BJ3mgLtk0TnW5X1p7pgozn5lSGIJfhYTlihTMQKSrPrUvbEYDehtAjRf?=
 =?us-ascii?Q?KzCHZi4sCROvbcd2RvVOYjnwJFgZqLimmfgasps0hWbhgo0s95gPQQRql6Py?=
 =?us-ascii?Q?Yki6SgAJTKyPA1rAAeBtxpImgAogkQyJYbPh8rX1G1w/DRnumYe5AN3yTlJV?=
 =?us-ascii?Q?o3NiIdWSICUr5ayQoeLebg2ZzRJJIgUkwsaHFyX7Q2hgqIuwhJMlI73RDQxA?=
 =?us-ascii?Q?b67iVwb1mVXIx3hhn/5TfbQBnLYHpUqDMh+q+UibsgMEaG/GmZTe/36lDqir?=
 =?us-ascii?Q?o9ogAI+w+EOCYPXNduCz5BEWU+XHv06JnWA1YYhbgEN60eN1o9LNUJpgiERd?=
 =?us-ascii?Q?x9CeSLQfqgVLLlnsL6foUr4vVVz17wZtFR9f4fFfBUyzAUZGnQOyyrn2gcJe?=
 =?us-ascii?Q?mb67nC7Lm476gC0FprT0dHzwpre4siYNsq+gMB9k9eEwIB6bD+kWLmAeowW3?=
 =?us-ascii?Q?XzrreYRoc3JPa/3l+J0iVDG9HDqXkKxErUFGE4vdWH7cxomUvtNTkKYyT9iv?=
 =?us-ascii?Q?vxAq9NU3VIYdqeGDFhKtW0uaRJQRVQUImLJuDUtF0YMshYV00A9R8gjGfygU?=
 =?us-ascii?Q?odZC6G6qcMAsh4HX3axhD6T/d/vWZ/dTlXd1WPIOhnrPU92SXFYuQtOYxrWS?=
 =?us-ascii?Q?W0FiwVA2I4aMKdhc65jjRADOXOykXlq9Ls+WCDcL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd8b384-52a4-4cd9-65e2-08daacea5b59
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8777.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 07:12:58.6137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkyUqsUgFMMgPenMUX7WfCSW7hcVz86/uDXwtloewWev6l6FhaAVnOhE+KFqBC63yxAV+7ftFAdMKSFFB8kjIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8444
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

imx7ulp can shutdown domain power supply if none of peripheral in this
domain is registered as wakeup source, this patch add related power lost
check API.

Signed-off-by: Li Jun <jun.li@nxp.com>

---
Changes since v1:
- No changes.
---
 drivers/usb/chipidea/usbmisc_imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index cc17dcd97856..acdb13316cd0 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1025,6 +1025,7 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
 	.set_wakeup = usbmisc_imx7d_set_wakeup,
 	.hsic_set_connect = usbmisc_imx6_hsic_set_connect,
 	.hsic_set_clk = usbmisc_imx6_hsic_set_clk,
+	.power_lost_check = usbmisc_imx7d_power_lost_check,
 };
 
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
-- 
2.34.1

