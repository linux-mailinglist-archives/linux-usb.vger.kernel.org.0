Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E68EA73FAA3
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 13:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbjF0LAc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 07:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjF0LAb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 07:00:31 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA65E1BE7
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 04:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFIaf7HfNvX4M2/MWUn5yrXw9k4fVjXk4x5cvh0BHzcjiPbHAQ4vp3sxMB9VjJwt4wbhNg3WqD1hZrMKTosGzovvama1kPHapo66FhvYjS1avZ6PA6bdbZ7VsCD/ms1wl8GuucatWIylkhcGVG/+NU0lBZcd3E2II4o7WbhNwxSDwwygXohMjZNzqddhdJEce90WklClrPCzFKcdXd0HQEmtDPSNKFaNSNv9YEXd1DPoYhV1yzEuIV0+Oo8cMqzUTaB99fOi5kVkYpVLP6nQry8HLd5nJ7wzNlWw8si/Yx9zK/xiMqTxWXfRj09iTMBfwDlzBFIke6UFo+xdb4Lo1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsYFdjrcHtYHzQ8neQAN8l5BSoE3sWA/soa+z3A5mfM=;
 b=ECDPCw9oGZ/P6h+KQDYXo6GaQd5qonADcP46z3PgEj18b+b9q6C2+1R/s24Y4rLomSE9YsFqQrJOAOciy9UAhGSXG9el0rcK8WwWQZHRIVnDcKyNGQRhsDOkaPZj+JgPwRHcPtjANBk4qhqV/yF9dnHo6NbcDyzR0YUYC9il47AVg7iHc74d8dsN1b69YHXKS1Vs6auDZ7L+kQDZZ57d+HrtUI56mLd7VPj+7om+9ctwt4FCHrpi6qJwK8wPhmCi1pkspn5SjkggZGZSxHsokpc8ZQ6P/OW0Jra2scpEOxFHGYQxHMN189NjPWN1Tmkp0MsOBdwIfWEszRwMYQiQQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsYFdjrcHtYHzQ8neQAN8l5BSoE3sWA/soa+z3A5mfM=;
 b=pcNaE/dYCj6nHybqZdCl7hdyoICRsCHvUjZUJnEswVO9k/1MbyNKdwNxdTadvza67N5ORzsmBHE1OrANijCIoMqntJt+MbMxUY0s0Vv8PMNcsRSH0q0jdhQaCDWiQ8LgVnqvnZyvo5sHTbHNqtmmWPX9AkNTpcA6rOAhN79JAI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM9PR04MB8114.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 11:00:27 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 11:00:27 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        balbi@ti.com, linux-usb@vger.kernel.org, jun.li@nxp.com,
        xu.yang_2@nxp.com
Subject: [PATCH 2/3] usb: phy: mxs: fix getting wrong state with mxs_phy_is_otg_host()
Date:   Tue, 27 Jun 2023 19:03:52 +0800
Message-Id: <20230627110353.1879477-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230627110353.1879477-1-xu.yang_2@nxp.com>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AM9PR04MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 2faf6665-def9-4a9b-a42c-08db76fdb704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FJWemdONSQFkdX8hh1bhp9XHi06cOiYanzVgzjdXEjVuLacr4BUf3uYCe5mH5q5Z7ZwkxrnTa7MKOgE21BoeSiPCP1eCHzh38BwiAqW46N2vYHTotbZVyiYcq1giwx1wJOyU6XfdnGhssE7fJqOzpiVN1385BVyLsuWYblqc41kfNgOUn8yMV8F2V25o3MMs6Hy6fjov9xbHlVkOJEvN86Snt1gidhG0Al9f+OIyq4E+joKdtOJ+43/S8+Hq2gf0NMl3tJyMScj/guQHmS7iHadzSO5cbD7H0kgt7kVlC4e66KiQfcVIisOs4og5ULy3+BpfLk5UvttPiz5MTP6dTjNilEig6bRN4OOAUJTutFHCqF2eoPppomgxbJ7h64DfzWc8wGPlGWQGJvsknm7aZBQLV0zzAg+97X1YcD9znGaHDpQ5FM0g3kNWwwBE7ozuWguWmF0v2RPCqRPo98UybZMLVxsoRpDxfrlR5n2Whyxyvn/wTZtkpIYPWjcd7v864vNwzzY5LkL+vmXZ9nqLBDJjWmIYHmoMRGKJASLr2DiNLGeJSJlV1oKfDZV+Lu1v7RUL8vROS4P3x9ASEU11RrHJsN5QwUCV0nfv4vJ1Th7y0lsbVfHguFY5q6ZQ1hOZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199021)(6506007)(36756003)(6486002)(478600001)(52116002)(2616005)(6666004)(83380400001)(2906002)(26005)(6512007)(186003)(1076003)(5660300002)(316002)(86362001)(66476007)(38100700002)(66946007)(38350700002)(41300700001)(8936002)(4326008)(8676002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0TzAiqB5vSuQ7GK1BYsWjSFX4OIHUh1S+fLIZapt1enrgI2A84mV7OFgt9rS?=
 =?us-ascii?Q?jruKuR2sdZfAi8qu/aoJ+iaT61I8EiqDo80txRZ9rvKSHkeB7ahxLgjkqR+y?=
 =?us-ascii?Q?Jt0729x9zj8EqQYvPovvEZzi+O3Ce/Hl+cwcdxaxwT0/f8EnKMu2Lkyf1/97?=
 =?us-ascii?Q?TFRu0z5nvmO7rTGHH86cvddnriSLrsAlb8GBReM12S4Y1/UbMDrXPq80Ti3E?=
 =?us-ascii?Q?U7Lh6ETIrN6R+fLiXRWx5onFEHfoKB/d98fMRUEeEIqQzwRakAY/xmOLYUB9?=
 =?us-ascii?Q?1EymTel8H3LTEE2q9N9VqJBRh7eMDkm1sSayxgYgqHp64aLZWCjWQ6kkcmTi?=
 =?us-ascii?Q?CDcpzhXP2y9A2/m9yY3ULWb5/9Q2IA6WJl+ubYHRkPEyessB6QsJXYn5FZQL?=
 =?us-ascii?Q?9LOkrLaPKNtKolGPrgEt2bvgs9CxHS6QXgLscwyUt2Gj009pH67RrCj8FqM1?=
 =?us-ascii?Q?Z9ICIEf+wWLS5sLTVL0Ml3t9mTsfaD4E8AZtF+jcQPZwjNM+QEpSoa+Js70c?=
 =?us-ascii?Q?LzF5vGvw6fn4pa3LBf/vLdoBmJDZD1YA4ujd6d95rlf8M+hhac3s5dt9S1oW?=
 =?us-ascii?Q?oijMJQ3qyRl4F7eA6u/HZmcx5LPjW4mhjURjJ6chmX2iZo/67jschsiG0gFa?=
 =?us-ascii?Q?WONzolzzOFEjBmRHghzRKRMChEa2A8N1rV8tBTsHl0dL+2FQtKRFEGsUwbTZ?=
 =?us-ascii?Q?/KDPQYA2f7KsgrPd09UOpUFZ6hrqV65OU7vn5Uh/s20YRwsnwxOOZ1pnPk8H?=
 =?us-ascii?Q?Pb+cBZTr8patlwCjPENJaIoOujdnAMxCtcXJyOAaM+UovEOnMxKVAjbAVLA+?=
 =?us-ascii?Q?vDdlxBuiDwtIhLEC53l38/hPFHtgOWieQyuUrGCC9qAyJ+Fd18g8/4QrEuRc?=
 =?us-ascii?Q?opB9Uh20i3ZV34UkvkMr8D7LJfee/mWWjrCJhEqBjpPybbiZQDmq00RKljM7?=
 =?us-ascii?Q?+INW8xmX8KJQ8O91Ep/bIpMVaWo+GWuzu3TQ8vJe2rJI+Pew4iVUAvreIEga?=
 =?us-ascii?Q?8djLkqksv0/vFSDagmzHjhIdxAiauOtnEiWfGSlFLdf5iqQasz/O0pU02/Fc?=
 =?us-ascii?Q?kMtGjJX1+Bu0B6jX2TJw2LEvVF9rg10jnGOsbAl0Om0roByoIiQ71mP1aaV4?=
 =?us-ascii?Q?g/JvWMpiLv4Db9C6y2ieR/W/CweisBFan4mMd1eMkN32Tph2eNlLgAX0hN4f?=
 =?us-ascii?Q?bdWgIxYJUAV31DfOeEf8VWaFXBRbfudKQ8cnDIc2cbipT8cMC8QB/YklqlEx?=
 =?us-ascii?Q?spH+C0IjtAIfxCHyruHo/2BXDwwZWARZu7uUvixBdmFoz+76DkoHIhTVjPQM?=
 =?us-ascii?Q?Vdts9f1YN1f2yC97I/lpkaIc4UE1eyxIfqJyque7bUwh7dDfPZbL5kUsO126?=
 =?us-ascii?Q?hxRTETi1rED6tiBVUEazTJFvq4GQVUc2mUJn4JcBYRnDh4gqhQSBcRa7NRP/?=
 =?us-ascii?Q?EfWs9BvvgVuAExNsIfHfUpWsQHPJr1Gi8RdQMwrmp2wxtrhSTbKm7Xgn/5DI?=
 =?us-ascii?Q?W8lih/dw63INTkg+ZP+fqREZKr+fxExfVSA/4sunpT5lDacw1Zbn1B7RUqFI?=
 =?us-ascii?Q?Qwwq/cGGnn7+sMSKA4B7G1gSv7+ZMgV/CJ4N6xmR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2faf6665-def9-4a9b-a42c-08db76fdb704
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 11:00:27.4460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1RjcM5st2/bioTsbAr814jjszY8prxmYepTU51gW0ZWLlsi4IwG3PnQui2ArGISyAFxBoINWo/OhH6FCbpx7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8114
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The function mxs_phy_is_otg_host() will return true if OTG_ID_VALUE is
0 at USBPHY_CTRL register. However, OTG_ID_VALUE will not reflect the real
state if the ID pin is float, such as Host-only or Type-C cases. The value
of OTG_ID_VALUE is always 1 which means device mode.
This patch will fix the issue by judging the current mode based on
last_event. The controller will update last_event in time.

Fixes: 7b09e67639d6 ("usb: phy: mxs: refine mxs_phy_disconnect_line")
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 036bb58a3a71..f484c79efa6c 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -388,14 +388,8 @@ static void __mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool disconnect)
 
 static bool mxs_phy_is_otg_host(struct mxs_phy *mxs_phy)
 {
-	void __iomem *base = mxs_phy->phy.io_priv;
-	u32 phyctrl = readl(base + HW_USBPHY_CTRL);
-
-	if (IS_ENABLED(CONFIG_USB_OTG) &&
-			!(phyctrl & BM_USBPHY_CTRL_OTG_ID_VALUE))
-		return true;
-
-	return false;
+	return IS_ENABLED(CONFIG_USB_OTG) &&
+		mxs_phy->phy.last_event == USB_EVENT_ID;
 }
 
 static void mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool on)
-- 
2.34.1

