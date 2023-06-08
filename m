Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7B0C727EAD
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 13:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233016AbjFHLZv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 07:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbjFHLZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 07:25:50 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2049.outbound.protection.outlook.com [40.107.14.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59181FF3
        for <linux-usb@vger.kernel.org>; Thu,  8 Jun 2023 04:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I03GpFCTP272t7cjdfDLt2nL5X8wBAyMPUQdBuPGbI6Jdy9szWTrwHr0RfTW7ML0K3lYSzMO+0zVkO0SYmC6cAFPpsatbD3uBno/Mg9bnZO+pDU00AU3Q+CflXw6V1ZN8L/sXPaEuwuQMDa6P7cfE6Fb/ckJBJ2B9I4UQGWLMQ3sgjpf8nJAP6BgAYCdxS98qYUqGHS5mBm1JjWYqO3GoITndjlA8t6SHiTPcKT9JmvLuUZYx9dyfsCM/8wTlMEtP6b2D5o50PSVFxE6hd9nxH6oPENXXmruW7Jt77pzCvii2QH2PKSaLTEaA/1tjRp43cf+dF/STxxuIFRWvy09xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONd/KIjdImBhz01GKU7c67LL6r6DXwgNGo3wOt1k9s4=;
 b=muk+zr/aLr6EpfEmftFeLc5NyrLelQS2/WnoIpbmHIPFtMOsnp5Lt11kLPDJhom78bfiZds79+esw6SsFou6CvYuk9GXm7B+KaTf9Uhvcz2yNxLnuDr4vtyodv4ujPSvsQacY+OzI9SROSUVYrU32P6VRpmUg23QMflR5Ixv9WPOdQRrtN9c2Z2ArYgzsG0J007UZ5insan7OAml3UiAZO0k8g6/PYPb8rQOo1jMLOSr4OyUkH1yuJBUH8fugxQ+aRra11sddqUQTepZOk4kbBrvHwKMzM8NPDMcsIogX5ORSOkwRQNBf6Qk8h4ImhvtOXlL+lhmZUuFNFVWKKL+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONd/KIjdImBhz01GKU7c67LL6r6DXwgNGo3wOt1k9s4=;
 b=oPw8U78f+sysCG2OOSCdlXoJBDxGnfSFUsbmosVxQFqveXkNK4I89+QAo4em7eX46lnYLt+p44n5sXgn8fHtd8iUVz3rtrxEtI8F0IR/KaDNSNmGEkEMPNLJMoarMRKU4P4y1IB8uQ6ScNIGW8gZYQ9QqMiJ9iEDRLokeQOA7JQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM9PR04MB7587.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Thu, 8 Jun
 2023 11:25:44 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 11:25:43 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, jun.li@nxp.com, xu.yang_2@nxp.com,
        zhipeng.wang_1@nxp.com, faqiang.zhu@nxp.com
Subject: [PATCH] usb: typec: tcpci: allow drp toggling for non-drp port
Date:   Thu,  8 Jun 2023 19:28:58 +0800
Message-Id: <20230608112858.4405-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28)
 To DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AM9PR04MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8c6506-d603-434a-6f90-08db681318fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ttDcoqiEKLLURH3dUVD4kMPRIH9a+IlSrMYtcfuiTYhFp+YM5+s/rTikiqgZAoa4F0Il0ANaIsOH/N5ClWHyKGObvU5O3KoMbWBeCWq4YwHzu94vbwMt6glJ0mniYVUHPDIKTwh5vnpWAQo+P2isYOhQzOy0vH17NKVTPEkhRRRkW0/mbznqfGCSuQouCJcraXNlndxFiGPZ3VYKJAUa20HsHoCqUKmD/Ji36i4QWJdinrSJHxM9tsR5CxVUlEUw9+IyY6n5aznOO05a149N2cbT4daN9pm7+msgGzGIv+cGlcmnQkpQ/9WSYpxN3Nnb/s9gvrNiw2FYxBV70tDvlGSIJDCwMM0IVoX6o4FzFO+61WWD+dJGDy1BNXe1re9k0wLpMK4RNzvUbcAFCPN0c+mcyRRJqfIy1EMr9giGTnPG0D4MADWjrAYLZX513PajGu0RaxPBj0onxN33KAuSaHlOncPwHtGvDpBVV6/Hj/56FDqZBBXRC2zfzKCSv2sQAKAnsobSNuIv6+FsGyk5s1YPcwQ2yY28hkjO30HCK1rjsW8vSZUVorIwdFxAWmrNubBeMk0nKE7k3IfhcWjEOMR5Lc44BJJa08SYkxPiCfyuIAg3bqGVPc1mp/RLXBgD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(8936002)(8676002)(5660300002)(41300700001)(316002)(6666004)(52116002)(6486002)(478600001)(66476007)(6506007)(66556008)(186003)(26005)(6512007)(4326008)(1076003)(66946007)(2616005)(83380400001)(2906002)(38350700002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J2dwza4MkHMifZfEGkI6g+q9lG0he+m4/731MFSH3uj0L70VwJwuVL7HhSq1?=
 =?us-ascii?Q?qAgZNgFzi22Oy6dSxucWEArKBN0QulMuQ9fjD5aUhTiBdN4UQ3OK4Ra5p6ky?=
 =?us-ascii?Q?VpdyHtDL7NHDWIA/T5DLIRvQZ+734cUnktuaGYR6gDWDg43rzVyE24rbhHZL?=
 =?us-ascii?Q?d0oDipbGfgXMRNGugQtrEY0mG+itVuBkpfSacMDdTw+nxe8+54x5uqzmvcGQ?=
 =?us-ascii?Q?gN7gX4ppVIxSNHZFlDgPi5xiNoF2V/uQjBR8BXZFR0WalCqaBuzTh/UqwdRj?=
 =?us-ascii?Q?ND0/aDZzX7l/wR0H4AKyv4pnpBld4tPKcHo9+DPW9GvXrOoOjhN3P/Z+zqwu?=
 =?us-ascii?Q?d++Ig/IaP/HkUuaqCx3WbuiQRxTUJyrsxelQ4Rit2cUvnbO+Xl0pblc3/mCK?=
 =?us-ascii?Q?Qvq7BMLoY77aBqtgBfmDTxYXaZdAKiFBErPbtbNZQWLe2bNwpEvhH/mch8FE?=
 =?us-ascii?Q?3HGD+Q2hD+bixoKCAsyb3osvcfp53QK2sAa4mm5/2KwaWHT8VUU5oAjEgU0b?=
 =?us-ascii?Q?oJ1HLEd3LdGt3ZgIylBWItuAks1KGhZ2s0+G/OfTe9HGsxyWcrUCPFLWkwFA?=
 =?us-ascii?Q?jo3t2dWakwytRy+2X21wisQuvqxiApu9e9hWy+IlWHMNxZsWvoE16WNUIDvd?=
 =?us-ascii?Q?w4XXVxJwe7wg+IyrkyFkyXou0Z7FCQY1jd2HUzFL/d4QgJe1DgIE0WOLSdcW?=
 =?us-ascii?Q?2KCFL6m3hrc1VzqZvgdV3AOyP2nBwmxbFAvBCBLjwt0mpmIwEt1wbwsYOAb2?=
 =?us-ascii?Q?SKEhgSKKMnz0Mw/48OUp/wwlWw68kxG9wkU5PkV0XS8/P1PTXnNqEAapjqjF?=
 =?us-ascii?Q?8vKJfKvkcffpL8TRt2ERvVMzAoPUmM45KjF61CTHCqt4qu0CWiKXV5qGor8u?=
 =?us-ascii?Q?8l4WlrbCO2DAtWsKWFjVGalfebVUBGsObe3LeUtF7HFW9s539pUnj/RVjedn?=
 =?us-ascii?Q?8C2elCgamqB1iNi/sM213OQdbqet+ZfH6OnRBC1sVVQDA5A0lvOVHfKY0+zr?=
 =?us-ascii?Q?no4xYB7RdWt7NqWB9WpFrSSEc02cRrN8l/t8qx78LMamYVdRgmIYuQP7YtAN?=
 =?us-ascii?Q?Q3TTSMxlypsJfCSj08pf6CzsLutHMRlWSRbsWyb1Govo2y6uf5tdlB/ZuLBc?=
 =?us-ascii?Q?co0q1h+xDwEoGTMPoePymgFuzYDfobz7kgqkBr+rmmK7WaKB0i+iD2uUks7M?=
 =?us-ascii?Q?UJ0lByvOpdtg5lyEBFoV0TCgRXjTjIjoXfK6X4EgRhZU3TCDTQZD77uOQkam?=
 =?us-ascii?Q?rDPj8JCw1F604M3FazPsCH/oKYzFpE9rLTAz1812ajCDPCB3iKepN48wtcX7?=
 =?us-ascii?Q?NzRxtkx49S5U8MuR+BLS1uE+9p2OGDR2fJY4Cr9LmJpjJj9meSWQys4KwnCd?=
 =?us-ascii?Q?iNlgt1X+ySk9Wl+O16Ybd1Gm7q0UCgXkqxuZPFLzQdO+zR3iUGMX9F7BlEBH?=
 =?us-ascii?Q?bQZk50ZCgjCKiNHnN1ZZI+zLpK7s8ug4y0OAicEM3UlydAd8MojMMtw4CRTo?=
 =?us-ascii?Q?/b8x3vDhAmXWNBnqI6EZskp/3E8yldThUA1IapuEIbDNLJurOBtJMB9DVfvy?=
 =?us-ascii?Q?UUQwIktOCEjerpW7Mw5qaffRVQaSePwtw+MHWhIB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8c6506-d603-434a-6f90-08db681318fe
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 11:25:43.8886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4AQoMb4zvBJB7lUC3D1UjF14W+VEJxifnrOZzKygUQoxgC12XHZcaDntsEYyelXuDflslOM3BWHBqLXPpNUnlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7587
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some single power role Type-C port with dual data role, this kind of
port connects non Type-C port for usb data will need tcpm to work to
get polarity for orientation change and let Type-C port keep at fake
power role to provide another non-default data role, so remove the drp
port condition for now.

Has anyone encountered this use case? How do you handle this limitation
in current tcpm with a better way? Please kindly share your thoughts.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 3 ---
 drivers/usb/typec/tcpm/tcpm.c  | 6 +++++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index fc708c289a73..88559e749120 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -175,9 +175,6 @@ static int tcpci_start_toggling(struct tcpc_dev *tcpc,
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	unsigned int reg = TCPC_ROLE_CTRL_DRP;
 
-	if (port_type != TYPEC_PORT_DRP)
-		return -EOPNOTSUPP;
-
 	/* Handle vendor drp toggling */
 	if (tcpci->data->start_drp_toggling) {
 		ret = tcpci->data->start_drp_toggling(tcpci, tcpci->data, cc);
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 3c6b0c8e2d3a..6aa62132e69a 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4274,7 +4274,11 @@ static void run_state_machine(struct tcpm_port *port)
 		ret = tcpm_snk_attach(port);
 		if (ret < 0)
 			tcpm_set_state(port, SNK_UNATTACHED, 0);
-		else
+		else if (port->port_type == TYPEC_PORT_SRC &&
+			 port->typec_caps.data == TYPEC_PORT_DRD) {
+			tcpm_typec_connect(port);
+			tcpm_log(port, "Keep at SNK_ATTACHED for USB data.");
+		} else
 			tcpm_set_state(port, SNK_STARTUP, 0);
 		break;
 	case SNK_STARTUP:
-- 
2.34.1

