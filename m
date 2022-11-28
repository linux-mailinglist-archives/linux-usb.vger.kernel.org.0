Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCF9063A284
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 09:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbiK1IMz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 03:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiK1IMx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 03:12:53 -0500
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2042.outbound.protection.outlook.com [40.107.104.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A771B59
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 00:12:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MysyWkKxmcGo4gTM0rLgDKDWbh1iUjssHooyUAnOYh8V2fTe+L12RZX2qQakBilNdCJugWXdVYOYeO63k6KG6ce23XpBp/Ho/+ptZ7EKMLJ9EgDwP5D9SGXsCsyyxvTrwheGGI/PJsMiGRFf62+d/ukb8cb8WC2wvL0OhztxtquxUNE2Vz/O3qmnqCrMWcPPQiAcpxbXcnWKaZ9MomS01AvURc3cNgdbuGxpNZU49O2d0xoBAj/bUuSC2jF+AVPEz3nRXhWV0+rEYWGCsnUtjap4b6hwLHP9g6ThSZ1kU4//qLwxXa9CqyLGpOunGUFmSCrWeRq6A6NFDaxrlHnQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFBymhm0wj2WvDN7r+5x5pIhWuX0AKsImNfjHn0FPK0=;
 b=jko5mbCizR5SbtJxdIeCej0omh9jdUgmc1BCrHJMBCyjZes5tomn/nTYsV+8iM2EaIh0d8rr3/MXrfg/3I5gt+MVSPo4/lk5GeHeLw/VqK4iw4HSO9e8x3x5F0ltAu//87VzVN5TwfODMgHO4zWeUYDP7hlq8Iz7qhSRHId23TDJqLTiLB6dasMBLVWmFBbO40BCXbflI8baISaEA5gXc3uK+1v4TWSJRLdgCCRuywqKNrxDOKQAl9evd42rP/3NRqkm+U1YJj9XiJ23iDLddFbfOpEfYO35FrsCR03VS8vTthvEJq+lyYzaORvoLE2nKqqBsvwpk78vj7G698fvrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFBymhm0wj2WvDN7r+5x5pIhWuX0AKsImNfjHn0FPK0=;
 b=e3e3D8lRhbQJv8DNOnqBaqx60qba2KU4g2IJaE7PE1N2pTXlVrAHQVsf6qXP23ph+3TklkPIwawKvT++1Kf3fNwmpFFkGa0SwHPGOCBLpD+YeAfohgQ3WYE4JoiBzDYgx+7j9/fOUE0mRJBY8qYPmfd6hQ6Fm5Pj0kTGgDuRKUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by AM9PR04MB8908.eurprd04.prod.outlook.com (2603:10a6:20b:40b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Mon, 28 Nov
 2022 08:12:50 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%6]) with mapi id 15.20.5857.021; Mon, 28 Nov 2022
 08:12:50 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH] usb: host: fix a typo in ehci.h
Date:   Mon, 28 Nov 2022 16:13:06 +0800
Message-Id: <20221128081306.2772729-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0068.apcprd02.prod.outlook.com
 (2603:1096:4:54::32) To PA4PR04MB9591.eurprd04.prod.outlook.com
 (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|AM9PR04MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d54002-cc3c-4710-b46d-08dad118572d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nyXi13IoGxI7n1dC6UdOR9/g/V+VZ9tNGjt2sFoySK3rLujqYPmGdHnKdANY/u3MgvppsX9nPi86Cd2jVG6LxmceS15rrkjuAqGhWuv0p+OtqP0xLJLiAqhgClTBhOCQIhCxd4wMmn1Qx3uHv5T9WTSd6Hj4yUIsnsiUQBrnCtxaa9kwRAfjeT/cuX8ZQGUuK/hEs5nVp2hiL9w/UVZdUFoeS4fLyikJ4/tKHHn1GPIKZ8t+3BOt5/GrT9cqbnqFXW3WTs0uEU0lCFUxEVbkp3vYqRT4YAGBOox4t3Pn1ghOO9/INmPXn5nDmwBHsXLIMWm8uhZSFMARQZhesoMpednxPp3fQrSH5YHVHGGr70Y0gNWhEKNAt4g5ztgvYWP2mOMZPLCrouoBxY6rCrWeN4gPEoFeDGwy7FTip9DrKNsMlXLDSI1dcSLp9lQVF3xpYu33z/lcgKp8y8bjIocssPPdtWowkWTZ9umhtkIze+cepbdrk5GftfN8DXqX28NZeCA4/ydkE6UyWzwFjDV4VRHGXqhqtCyzCGlXtyzHOiEvNbZlY915+jHYj4s0++TSAe13gH6bXtNVSa9y/zEthmT4jC9IjTgdAZpQQrshhqG/vnAqToqx1R/TQbHWcwHX3C8kZUW9KDiOZuoNZBPnInCKUSPUTxCbQnKVsoww3xy00x+cDa5/pY/nHVQVDKtKWl+4MJUPc7c9RG3kNTrbpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199015)(36756003)(2906002)(86362001)(6486002)(6666004)(478600001)(52116002)(6506007)(4744005)(316002)(66476007)(66946007)(41300700001)(5660300002)(26005)(8936002)(66556008)(8676002)(4326008)(6916009)(6512007)(38350700002)(38100700002)(186003)(1076003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gEPgj7kud4brBOtltfGVXKymPqokHUc9Ba8Pf9oILcLN2wjutZQW3nDhCCdf?=
 =?us-ascii?Q?8DuocEO3c35ESpyfnNy1aB4dKeO9Ysk38lRaccp6GsevFXt7nXmw7i+jBEzk?=
 =?us-ascii?Q?yOPVBSNSzG9Ju+NpyCa8OJ7E6odVVenmPTGte7mKcK+AbNzDqv6mymZWOR25?=
 =?us-ascii?Q?tGcNlJ/9wEpwzbn2u7MdRgSFFLY9GFvoqOKnaNPBQNtCDpQCVfKiJhlteCfY?=
 =?us-ascii?Q?F39g6dQTRPa04SV1VuAObAJImQS5FfJEn6bjnHXKvBbSQcbedvEzpa7OFB9X?=
 =?us-ascii?Q?An0Ztn5rV/4jdrbF7j8OZHRysHcuLMzxfP73Y7tBno65SINVGoBga8wQlTA8?=
 =?us-ascii?Q?68AFMATxPqIBAThJ6l64s+K3Jmt//EP6lnHVZZGwfSYQjU9Z9RDYGQeabejE?=
 =?us-ascii?Q?4bh6GoaKTY/4SxeaRsui11ljoaox2ZMYWjtoiTsKLos1RD7IThpSl13JNgP6?=
 =?us-ascii?Q?zUsGirW0/XZ3K7kWrLkbFl4QdUH8zDUyd9NNXL4ADXh88a3HIIcfOZ13+3o7?=
 =?us-ascii?Q?xca1UA7P3HfyFIzAgDtsn8CX/HpQcLukxKl3zEpyptQT5kQAS5WUFp5IRmq1?=
 =?us-ascii?Q?rV3f2/AStqevPI4yuAhybbY/+jLxb+gIFmgrfAEW1t2QTn9O7hjQ7XwJ5lFY?=
 =?us-ascii?Q?Xm/4skbpJCt+VirPqbj4R9YJzY6ZA1wQePUSXUg4ZKTllLy/aJ9wlI/qKl6h?=
 =?us-ascii?Q?SSW9boCXslwIPienJPloInMRsQiI744hNxQWe1GdUjfqvqerPGUZlKor6T3M?=
 =?us-ascii?Q?DwSunSsS7P92+FUpd+uEMR1hQtFPm5k1JzO/4L41nzpzIb2xVwk5AB3Jawoc?=
 =?us-ascii?Q?cDpI6JK1VdEjIMlf59BnVvCKrk/EzfDbGZUO2BGZgQp2IC3uNyHQyqtuImHu?=
 =?us-ascii?Q?fBS3ILAviZYMLJJ1x0RiSUS1LqgaXIXL0UFpkjtX/DP7xRx52VNua2kPE4Mu?=
 =?us-ascii?Q?3o4d7ZHFgOvI7/gudSf/ItAj4LSY+mpO4KJvCTDfnJvsPd5aicZPNKEdSmRX?=
 =?us-ascii?Q?JMiK+N/TrKO7dxM3Ka3K4vOnqHQJFcGCLe89bSCSmY2Ry8zIPGOUXvqAsgSp?=
 =?us-ascii?Q?LjPPSptpziVD+rCCExp3TS2qHkfdEepat8MnZRQUa67aNPI8nYXAEwq6SY12?=
 =?us-ascii?Q?oZCJ1sdVw9zG+JPgCV/PQKfxVXlEpxBbDSvMyTjhBiM116NSYjaKJjm3X9yJ?=
 =?us-ascii?Q?Tsx5kXbqYq0GJio+LcyjB8H9dsqCudZdQLJXR+A8kRVqReciHNWGxXDNt9O1?=
 =?us-ascii?Q?StdOR6lJxwkOXgJSAgZJBWHLUgf11sWW9kNKPVGw7HE+b3uk3NBE4sDKr43b?=
 =?us-ascii?Q?A81rDieZj7DXjPpTnebFWECY5xR18HjB+b6KZy8i5LDDHtsoUd6PbI9kVGjz?=
 =?us-ascii?Q?GS3qy4y11mhZnpqsYCcaafAxiWIgjz5qgVw8C9kFj6BPydXdWr8EatQtFXG7?=
 =?us-ascii?Q?2Z/gpjnOaiRL2jB3OvzYTqyTaWdvk3IAZR69EhYwArrBxXQPNB6MwaKPecVA?=
 =?us-ascii?Q?U+UrBFbYNTe4aRgHKd2fPgDj2x1jdzqa1f+Js9tQTYaZdmNvxuX2X8zJedBV?=
 =?us-ascii?Q?PXSnA2p4sRNX3oNL5h8f4FqEAaIrEWwz0gpz887Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d54002-cc3c-4710-b46d-08dad118572d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 08:12:50.4618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnj9a2YwuM3PCimo2L/9XI/B4XhD3knYqrZH6klY2XwPZI9Hqs15Fgohdf/axOYV8jkR6+4U9NbAuomO7lvFWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8908
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Change "ehci_hq" to "ehci_qh" in this comment.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/host/ehci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index ad3f13a3eaf1..c5c7f8782549 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -471,7 +471,7 @@ struct ehci_iso_sched {
  * acts like a qh would, if EHCI had them for ISO.
  */
 struct ehci_iso_stream {
-	/* first field matches ehci_hq, but is NULL */
+	/* first field matches ehci_qh, but is NULL */
 	struct ehci_qh_hw	*hw;
 
 	u8			bEndpointAddress;
-- 
2.34.1

