Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771DC5F8A10
	for <lists+linux-usb@lfdr.de>; Sun,  9 Oct 2022 10:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbiJIIGT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Oct 2022 04:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiJIIGR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 04:06:17 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0E72DA85
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 01:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FU8Aork9WHMbNLKEiRcCxjhl8oAg0YEvB98kujVlzwvLH8mMvRvUF4IC00NT/h+rL9uHq/b1HEzhRadZnDedI3KGbBYK4Wt0Czw9pzEU05aW8rpUbtXFXj+qh+bQRETBkof/xh9Lr9mn5fk85uVXmyD6RAYah1HVNmBAuUS5u3Bbgk0ixUv9+o4cCqdGays3aVLZr5MZQ527pgNm4HbDaL2PM6cAaAZ1m0F39ZAZNaqB3Y9w/IiQqCwGTPH6UzfPWmuDQ1pQbQ4Lboh8xEN0an8bLJ+588nfZOmpzK/iVTGmLgIhzSZVlnz+Mtj3L9/Mjb0OBBAaYSy9cCDifioLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAS8XOy8Qys82SnLUXasrUYLm86lzEz6Qq5s6zueWk0=;
 b=gmwfIq+V92U3rpK8/DJknWyhNiRQy6uWYlyDvu0ijGChLw28/kGalr47w16jkX0qCRWe+5XpFdejDwLmzCAJnDsKaHoT3f/WBeBbtJNSOb0giO+poiCk6p03OeuYlUgo8pH6SXgVNjgwk+Tl4Y3nF2fPyWTWQI0/BvVDwnJfD2K6Kb9W5rwQinNt/0zSG8LrrmCQFSeiMfYtJb9eYBVfr3TiHUZcqIXzeQXgB+BH3ypezfKfpn/5o6TLGJoUs9qhK3XUa2xgyIrteitho0m5Ti2hzDYAqeeuWtooDD8XDbHY4ZmqmgR7LKcct4CBMkaCUCFZoQvmYVCOV6sG0AOPgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAS8XOy8Qys82SnLUXasrUYLm86lzEz6Qq5s6zueWk0=;
 b=Ps5AIjQqPxukmwJV5mK6c7pcTCrvu72cP+tF352Jg5EQSqfTpb9VbzmYxDxsy6M5rwKxxo96TFx1AA/V8VDbHrZ0XfLHV7UDFTGa6Wh5O5HiS7pirA+AqxyELdpBG1cu19wFzr3tgTygscqUJjdQhfzAIXlmfF/r9S3ox+FW9Ss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Sun, 9 Oct
 2022 08:06:15 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be%5]) with mapi id 15.20.5676.038; Sun, 9 Oct 2022
 08:06:15 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 4/8] usb: chipidea: udc: add suspend/resume support for device controller
Date:   Mon, 10 Oct 2022 00:08:09 +0800
Message-Id: <20221009160813.776829-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009160813.776829-1-xu.yang_2@nxp.com>
References: <20221009160813.776829-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|PAXPR04MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: ce39be34-e911-41ee-d760-08daa9cd2349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5iY8yJe1JBydMHe8a2ZPreD5vXYSEGoNC5JAQRops3pnRhNAr+YGvQupjqflVHcGpH8vogRTiR2iYEHXO3Jitvha9vtROFRestUeiWodUcbs06hGmO4tGCB76SYNEdIV/oCp5oeZjnoPVlOAeBJESHwJEe9HNBPnGWUtkO/Sz911S+4L0muWj/N0rokMy7StdFVpYf4bPP2+IoHluSzUlG/OtFmgnhsBuGuaBcwE1W1GvkxAo6wujy1BtVUvZVUHomesF1j7gl78A0KUyZY+ZdQfl6gvSyN7i/aoQj0ViRmTN1iA7xh1RYrXBPZOjzet8+KYZJBfHFa85AwYv3CJtPWeVWEv2Px4YUhYhHbh5crDTIU7y/3PRUMdwbDjyvJ6uz1EM6V4hgmwBWLJ8lWxBc33ZQA6AloJAYvVMThdZ/L4D6CvasI/C1ovqWPIElMch9yrotQXbQB/xaxm/Vi3WcDOHhbSPgFZQpDZCtq5d9eRNjbZ6d9bJh0fFJhSRG6CTeOchGJB/HUEyKMO/zDPBkzuuZe9zX2t1YhgA6mh/Fpd8C23Wszm7ve2D1Zp7G+5HU7AVOT6uyr9KUfjxVpUQrCC13T6xyVcV5vYu6ZV4eFia/RbR063rzo0I/9a2US5/TbNJOV9f56Kx/bbmSg/uGHC6bQNtAZtA0NEpi4mp5/DzaPYV6Oxsu0xyZig7CAwC3ycDvYpRh1acNXmDDWhluX9EvftYEd54el+3LpCdNaFtI3G5fR79a0dg7uoaobTjOzEniUsaeewOdafRbPeEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(6666004)(83380400001)(1076003)(186003)(2616005)(38100700002)(38350700002)(2906002)(8936002)(41300700001)(6486002)(6636002)(26005)(6506007)(52116002)(478600001)(8676002)(15650500001)(66946007)(66556008)(4326008)(5660300002)(316002)(66476007)(36756003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Co8BGqu7aFNlNsU2ySOwWDE0aWUJr459VBut/Pvm00JtKXg9xitAaMTO/dtu?=
 =?us-ascii?Q?mm+kmvySjyewHwSrhivWBwfnO2nvX0HGI/dugOA4VGhaWmEHbxi5DSsyrxbD?=
 =?us-ascii?Q?8Lb3uInGfNYyTl9pxYe380EwbkJwv1G+EpJ2woB83oWxZJn0Cq8d5PYNT9p+?=
 =?us-ascii?Q?lqa5e5856D2xLq6d4FKwHOk1fAO/g+TXmhLh6OuwzN3JhvL4fc+4/4TnxYGP?=
 =?us-ascii?Q?cGG9Mn+Pa2A4X8DIqcjkIZo49eZuOm2l+B6zB5Ca1ozV0bDeVLmdtJgdzir1?=
 =?us-ascii?Q?Cjo5N//dCSi3hgvzBZ2lQIGIOdj3z9tIRp85QGrbFaU4Yo4YUqSB3S2eATTk?=
 =?us-ascii?Q?haQ1TF+r6rSbwzJn46TUZXSRc07RbDggvBMosniSwoz1omLH89QfkXnX5H1k?=
 =?us-ascii?Q?wCwIP3IiRNxP1XH6cigdcEO87dPq9NzAwJWj+oPG5veerWsYr+BpqxRpf/Lw?=
 =?us-ascii?Q?Br1BsxooIKKmlFnaxlfWLz8jxX75ygt0aPJh3Q3/78//yTVMjk80SXpATnrM?=
 =?us-ascii?Q?WOADyIatQ6cAx72sIh9eYeRhYpmjmA3sHNaFdyT5GLEC6vEn1yFMPp4IkCzl?=
 =?us-ascii?Q?gwILEMHo53fqjJfY36G76/FoDHNtHED79SIwOBehJFTaidO+N4wGB0bli0CX?=
 =?us-ascii?Q?KeKc7rhzUHlDmWxNqMIs5PhAUmLFvtgUfog4xYEhQ17HHLM4Y0d0B/VoHaMz?=
 =?us-ascii?Q?kMf18QFQXhGqNBbXx9YM7ZaAAjI4bZs2o3Ij5hhbOIMNSOiTTMabxxKGu53a?=
 =?us-ascii?Q?IH1h0lsFEFuwV2MsFm1n0cmNShUbc6Jt0fdu+T5lzpuisjHb1u/zkgzXNlYT?=
 =?us-ascii?Q?MyFVvC4fdRr+MnJilSyhOgxkwpanpCJvoqs7TQsA45N+rOHU/7CbwG0ehg5d?=
 =?us-ascii?Q?jlyXs5gLUBgQPV1hnKucF4mr0Mf7ScLtmNCY34GoK1PI9UUrSM3AbKC5rFzU?=
 =?us-ascii?Q?76l7XC9kZz7pyQokoTwM0xpyNILwP8lJS0JxFPzWjsyzC6nmj0y/pNZK92AP?=
 =?us-ascii?Q?F1w4q7PWaV16De3GhGv/pKzoyrkHYdZG+N/3Xtmh/PBEUXUCnPIz0FChZy2b?=
 =?us-ascii?Q?WJOhCSHyU7neM9rdny+F22rRX3lgHjlcs8+bq3qMijh13UZgWgAGm+eTPYV5?=
 =?us-ascii?Q?wou4CA2xK7v5OARhvvMxUY4VuLU4xlTG3pIcm0HAH6UZMPwhdVJptXnROv+E?=
 =?us-ascii?Q?xrzVSqslxbHkxlSAWu4ks0Ckco/IqgwjRKiMbOEQoUc1g+Lq4G+msT0EDdJK?=
 =?us-ascii?Q?02Yho5Blx19flzubquiCLX9IWVfa1Y7KXN7wU5A3hf7SbToV/Y3SF5nXAd09?=
 =?us-ascii?Q?IwE+SKR76VtN+JPXzM25dZdqnvVGudf63KeemGVEvUmDdOmV4okL1MlipBGU?=
 =?us-ascii?Q?i5nuyOc3Iw+WcxtLFa9UAHKAW9RVA1nQhyU1VHdlIomjgNqLNdPVS3AJssua?=
 =?us-ascii?Q?17k0NK43hVoAUCmcvRym4qmMn82BpYwPbD1wYmpPK6YvULG3YS2aAfSGX7ly?=
 =?us-ascii?Q?1D8WuG5FW10xABH4PwW5q7yxkoYKzxveLRKXJIX7OwJ+f7FkxUJHNDObPzpb?=
 =?us-ascii?Q?rpYaQyjRan9toUUQFoyxTYzCaNndJt1zwly0kUXz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce39be34-e911-41ee-d760-08daa9cd2349
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 08:06:15.3183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /x+zxDb/FedQE6c3n22A2MNm2EGgIpGh2yjB9Veuv31cOLQ3YGvc3UbzxLECCBld1Z7sSl3TSMKk0Xztm+Mibg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9230
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The controller's power may be powered off during system suspend. This
will add suspend/resume support when the controller suffers power lost.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/udc.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 8c3e3a635ac2..1a0fb23ccf4c 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2181,6 +2181,32 @@ static void udc_id_switch_for_host(struct ci_hdrc *ci)
 				     ci->platdata->pins_default);
 }
 
+static void udc_suspend(struct ci_hdrc *ci)
+{
+	/*
+	 * Set OP_ENDPTLISTADDR to be non-zero for
+	 * checking if controller resume from power lost
+	 * in non-host mode.
+	 */
+	if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0)
+		hw_write(ci, OP_ENDPTLISTADDR, ~0, ~0);
+}
+
+static void udc_resume(struct ci_hdrc *ci, bool power_lost)
+{
+	if (power_lost) {
+		if (ci->is_otg)
+			hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
+					OTGSC_BSVIS | OTGSC_BSVIE);
+		if (ci->vbus_active)
+			usb_gadget_vbus_disconnect(&ci->gadget);
+	}
+
+	/* Restore value 0 if it was set for power lost check */
+	if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0xFFFFFFFF)
+		hw_write(ci, OP_ENDPTLISTADDR, ~0, 0);
+}
+
 /**
  * ci_hdrc_gadget_init - initialize device related bits
  * @ci: the controller
@@ -2201,6 +2227,8 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
 
 	rdrv->start	= udc_id_switch_for_device;
 	rdrv->stop	= udc_id_switch_for_host;
+	rdrv->suspend	= udc_suspend;
+	rdrv->resume	= udc_resume;
 	rdrv->irq	= udc_irq;
 	rdrv->name	= "gadget";
 
-- 
2.34.1

