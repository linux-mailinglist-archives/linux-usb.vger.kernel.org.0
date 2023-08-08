Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0972B773C1D
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 18:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbjHHQAW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 12:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbjHHP6o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 11:58:44 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201B66183
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 08:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnacRpUdd9dSyXTFuWsUQfgC2J1MN1VYotqBcp3hhCZnxbm8Wlptv5s7OHqqIPgiLwAL9zlr+rRVEUBwgN6FkkdiKuvLoSMmFtZrv3RZlnDlOqrPVb1oovwraFMMEaHU+UJ1e/HmptLw53y3cQc+xXQcL8L1qblddTWXIMfPCQDRCgoZgO4vRPypoILfQ+qdN91iv9xBLBCnop5gjyGx3K53Ay2TKugdFtt5Sg+MCixUOHmSLqIb+3czQI2aJJn4W9vtsIrD76eENClQIZ0LuCO3EQMTk364VFDxdh2v/X26Vfv8sGbgZxQVwCgtQj20y7F7mNigykh9/fg5IDqtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32N5mGLb3ZHYIIfcQ7bPzzfEq6MtTw9LTvxHuxMLt00=;
 b=Rw6KkbZBfJLq5AvC7RbTqNeMXDtCAaZtfT0n102SRHcCNjxvC+J2OBodmXsRnhB0Pq23P0O1PJEE4+PuMid28NzC1iCHoCO1ipBFD5CER2BJG2HBN6hehRzNFwo/OF+MLi3yDW5bPxjEX1rAcO7aakS8tQ2XHLRZetehFkWXs8AxiLOcjRwoCt/44npJGewCOWvEh7dgLIpHJ+O/PrYkwspYXKLi0Ij4DLQJw08uT8qbpViBEvPsg1OIzRHk2NkOuB3ZbCz8gd0ac6kcmVMNHzItEDRoqcnnd2yev7AgRWiOAWLCCUzuEM5Gjr52IXa275UhBb8+91bUFuL4X5+pAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32N5mGLb3ZHYIIfcQ7bPzzfEq6MtTw9LTvxHuxMLt00=;
 b=VzDpqj5aAvlSxmYa9PjhkSN4VsvTtku0d7QTF3ElB+majkuE7XhqukbfjyhiofebsQ9a6Y+tAkZFn2FQlExRROcy/N30shLkLihPwqt+O/VMEuVkiytgozH2xI/mx/Nspm98Hx6qTTCEZVkcAtcXkscLnSobU3cV05J5hJc6CKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM7PR04MB6936.eurprd04.prod.outlook.com (2603:10a6:20b:106::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:33:27 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 10:33:27 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     stern@rowland.harvard.edu, peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH 1/2] usb: ehci: add workaround for chipidea PORTSC.PEC bug
Date:   Tue,  8 Aug 2023 18:37:33 +0800
Message-Id: <20230808103734.494321-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AM7PR04MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd05945-8455-46c2-5245-08db97fae687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KIPWss+YnTynDDyGCcB5VI3i5m7H9P/1lIvg8+LJt+7Q51cG247KGPHrAFmjaewTXIZ4V0yLrBXoUi56nDTQJ10i4tSU/lTUT128XA8LR2PXqS2Hg1ZLw1MLz9+xV3wHPh3iCmgAgeebVItEUmdggcGkomrXglzOlMIVrffw/BK2A2BgW2ctej7oA90/dnU4g/+mCMzst4gA0JF+atF2tRPJ3POcKyE048LTSvFOWWZxleQhTr7xK36aXBHOoCkhnX+9iQGBYtbjzx/XavnmCrpL7jzoj9Ip1DBaJvAuhdGN+nwFwfkXPACEZZZm5e/iNECVRdBIsoGRZkvkEaU3o7q9tXAR/OyvFcyQ7O6jUQQyR0s86KU8y0Q/cBZwjMObd/kdUbVdinP6yUNEN7rn+v/+P5o6bfhiV3SJeoQxhLNCuXDrInskCZAz+9ZgD1vWqd4tHCNWA98q5+hwHtox73fYys0Ck8dPAYOBUbJbEvW6nrKBGGYV3zxr+iEpDvMIDcs3eypK7t+fMy5Kb2IbkrOgpM9+COXh044O/7Yxf2uAB5GHLvcn/xyDp/N6Y8skHw17o9T8ule7a5MAmkHds0iQqkIe0Sn/oPhSFNd4UMsRJkrxTAmS7hnN7SIWnohz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(346002)(376002)(396003)(186006)(1800799003)(451199021)(2616005)(52116002)(26005)(1076003)(6506007)(6512007)(6486002)(6666004)(478600001)(38350700002)(38100700002)(36756003)(66946007)(66476007)(66556008)(4326008)(316002)(41300700001)(8676002)(8936002)(5660300002)(2906002)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gs4et3Kj/7AbFdKNjY2ZMgcT1d0hCysQn3rpyv6zZ6r9FNGx0/GTcDPxWsGm?=
 =?us-ascii?Q?ZGa5V2IhkN9UE+JumeQ3PEzJtjFLtWgdx5G1/H1jSM9JU4y29B90qvp3ocRQ?=
 =?us-ascii?Q?W2/Mvdfk8HmDKGLSmYdJ/Bt7wuSeBFSsy5H/Q4nNHbwTQ2jfe8SQ4m7JLYme?=
 =?us-ascii?Q?c2Inbgi8OZ9skuLq4Wz8GED7P3dMcPK2vlFLliaeuQo9OlU4Nm+MjKfQDuCB?=
 =?us-ascii?Q?ubeIchWTLzfqOtpGowmRDcc28p22lqn4Tclf48B2YzXKk4P2z2NVyeKXUlEO?=
 =?us-ascii?Q?kOht6iHDMaPiq2bIfu0PQw/9xQ2UD4JKeWaOw31NizMPoA8fyZdRjTDKAe1K?=
 =?us-ascii?Q?V3F2Pq58gQP++gPhk3nvssXpkIkPI6XWJsIam7BtdqZNXa5IrTB3TXpiqrFx?=
 =?us-ascii?Q?BU46l7rWiboABJ1onQgwvUELbz9yjqeZ+JriSYg4gXjvlkOgyNapqUfeRSEf?=
 =?us-ascii?Q?H7tHCP8L/nUOvLLfzmxaY3EuGlHxg3q2MrWY/qWrP3s/Qsq4gE5gehyCCYlH?=
 =?us-ascii?Q?Zj/NJlvH7VUQslkWslIS0KbzxG3xqZ79C1f/BtKzok3+3E9WT+YAdksNMNhK?=
 =?us-ascii?Q?5ULd9AlCCtY1V9QS3S8pAnjTONjjmcYOl2AWWFuzFmLbmgNTQ1gzd2puPzwT?=
 =?us-ascii?Q?lIG+6uw6nl/Juff4nfmBTS9LMTTtH1EZyIrPZngpZJcrVM0ru2TUi9cyMhhE?=
 =?us-ascii?Q?RsMLfFfhMCxhgMmhVdI6sckiykupWA/Ed2R4pOSyliToLlzdrnLOiOtaTeHx?=
 =?us-ascii?Q?7wuEVRfuuCK1/TzKjejFNvFivAKlUSbwewoogAQ79XU0nkIkjp9g7SHhmFg4?=
 =?us-ascii?Q?E+4E23T7uz+/q4DkbaRWQeW01IJ5SkgAYJOHQqTn1NqHErXpj8b60YbdTaNH?=
 =?us-ascii?Q?STHqVq7eub7nsw/A9o3k9YIUybu1BMLeocezcTIKJveTNVyBhGwJ4pmEGBsZ?=
 =?us-ascii?Q?vmyZtNU/cZOO6+lV1MrXrwtdifl63i/wfXuhMRY+GPNd6JP4jhCwocvomZG7?=
 =?us-ascii?Q?f338RKz+moqIQCAI42q6QTF/R3f8Gzvv+pBdlhnh+qMTynZMSk5Fgd7dnQDp?=
 =?us-ascii?Q?fmctcbZs5iHFbyQ6/mwjIGB6tj2HZsnd4sK2tQoTJNXqAyMM6NIP9IgA+GRb?=
 =?us-ascii?Q?1y4NUedLZZzzw8g7KstO2EVM48mj0nfbnBPdoDHKnMC81C3OnuSFJ/cOPjWY?=
 =?us-ascii?Q?tLyBut9dXDFC/ZydvgijP3REC0xMgPNeIjLdI8LCUqyHBtLHIQJNr3V+w1bj?=
 =?us-ascii?Q?/yM5LHlLOBLSKkroeEEDVfoaUwhfNt3zhcvXAmKkDOPDfzNRlKEfOeDXcMx/?=
 =?us-ascii?Q?zrbM8f3+WwLAvbVg8mvV09vl7rJ+T7TWX4m6Az0+qQ5pjeUNhBtQbMLkjLGQ?=
 =?us-ascii?Q?F1hu5115mDUWf6ACRyash5OcpIlGzrk/OmmIRFsR6giO2YQ3nNiiE8+q3JPE?=
 =?us-ascii?Q?hSRpFpOCcpxXjqx0xoE5c4Hd+PwgSqjy337tCrESqT07rj+/nBy7JP9eSNWw?=
 =?us-ascii?Q?/+yh1RdJjj7GzBeIKSmBrXn8Eyx1YP9hocm2+F/6/7L+4cN0oRt40J1Q3B3d?=
 =?us-ascii?Q?aRdD/9H+dI89fQ6tyqK0Xn/9hxaXCq2h2VNlWhQy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd05945-8455-46c2-5245-08db97fae687
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:33:27.1129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjlLk43J5kgrsp6GlZOoujXOMbYoqykWSUOvyr3RL+RsU/LHwIrd3puF01RLyVqY/rlO+IAfMg94Il+QrlrR5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6936
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some NXP processor using chipidea IP has a bug when frame babble is
detected.

As per 4.15.1.1.1 Serial Bus Babble:
  A babble condition also exists if IN transaction is in progress at
High-speed SOF2 point. This is called frame balle. The host controller
must disable the port to which the frame babble is detected.

The USB controller has disabled the port (PE cleared) and has asserted
USBERRINT when frame babble is detected, but PEC is not asserted.
Therefore, the SW didn't aware that port has been disabled. Then the
SW keeps sending packets to this port, but all of the transfers will
fail.

This workaround will firstly assert PCD by SW when USBERRINT is detected
and then judge whether port change has really occurred or not by polling
roothub status. Because the PEC doesn't get asserted in our case, this
patch will also assert it by SW when specific conditions are satisfied.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/host/ehci-hcd.c |  5 +++++
 drivers/usb/host/ehci-hub.c | 10 +++++++++-
 drivers/usb/host/ehci.h     | 10 ++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index a1930db0da1c..d6b276c354db 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -762,6 +762,11 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
 		bh = 1;
 	}
 
+	/* Force to check port status */
+	if (ehci->has_ci_pec_bug && (status & STS_ERR)
+			&& !(status & STS_PCD))
+		status |= STS_PCD;
+
 	/* complete the unlinking of some qh [4.15.2.3] */
 	if (status & STS_IAA) {
 
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index efe30e3be22f..1aee392e8492 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -674,7 +674,8 @@ ehci_hub_status_data (struct usb_hcd *hcd, char *buf)
 
 		if ((temp & mask) != 0 || test_bit(i, &ehci->port_c_suspend)
 				|| (ehci->reset_done[i] && time_after_eq(
-					jiffies, ehci->reset_done[i]))) {
+					jiffies, ehci->reset_done[i]))
+				|| ehci_has_ci_pec_bug(ehci, temp)) {
 			if (i < 7)
 			    buf [0] |= 1 << (i + 1);
 			else
@@ -875,6 +876,13 @@ int ehci_hub_control(
 		if (temp & PORT_PEC)
 			status |= USB_PORT_STAT_C_ENABLE << 16;
 
+		if (ehci_has_ci_pec_bug(ehci, temp)) {
+			status |= USB_PORT_STAT_C_ENABLE << 16;
+			ehci_info(ehci,
+				"PE is cleared by HW port:%d PORTSC:%08x\n",
+				wIndex + 1, temp);
+		}
+
 		if ((temp & PORT_OCC) && (!ignore_oc && !ehci->spurious_oc)){
 			status |= USB_PORT_STAT_C_OVERCURRENT << 16;
 
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index c5c7f8782549..1441e3400796 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -207,6 +207,7 @@ struct ehci_hcd {			/* one per controller */
 	unsigned		has_fsl_port_bug:1; /* FreeScale */
 	unsigned		has_fsl_hs_errata:1;	/* Freescale HS quirk */
 	unsigned		has_fsl_susp_errata:1;	/* NXP SUSP quirk */
+	unsigned		has_ci_pec_bug:1;	/* ChipIdea PEC bug */
 	unsigned		big_endian_mmio:1;
 	unsigned		big_endian_desc:1;
 	unsigned		big_endian_capbase:1;
@@ -707,6 +708,15 @@ ehci_port_speed(struct ehci_hcd *ehci, unsigned int portsc)
  */
 #define ehci_has_fsl_susp_errata(e)	((e)->has_fsl_susp_errata)
 
+/*
+ * Some Freescale/NXP processors using ChipIdea IP have a bug in which
+ * disabling the port (PE is cleared) does not cause PEC to be asserted
+ * when frame babble is detected.
+ */
+#define ehci_has_ci_pec_bug(e, portsc) \
+	((e)->has_ci_pec_bug && ((e)->command & CMD_PSE) \
+	 && !(portsc & PORT_PEC) && !(portsc & PORT_PE))
+
 /*
  * While most USB host controllers implement their registers in
  * little-endian format, a minority (celleb companion chip) implement
-- 
2.34.1

