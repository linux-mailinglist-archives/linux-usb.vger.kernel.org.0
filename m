Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDC05FD56F
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 09:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiJMHMy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 03:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiJMHMw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 03:12:52 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C01FFFA8
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 00:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAJKGb4D3SGvFQATs8SOpKt+M/Ab+gEdb6w0nh5Qk2c1tTo1dd5T5eYg2v4683noaptRGjXuhTOzYyGztbxJEYzrj/vWPKcYizQuuXqrk5gCjZZTzdtqSz2J4SaoZkQyccu1knUJ5dkId9xcN+YoZcOs2YrBzXp170XtkCJ6HGjxZCzSm3vmc4aVjiqldfXG/Le12u5q1ji8G9QY+PIUVsWIUCdvegh7LxZ/Ykkjvny3RTelv/NYtcPzvs2ZGyygthUqNcnuCeka9i7l7uLM7lukIYqUoxzO58mMKLhv1J2R6ipn7hqzQTp1z0kmkvytO888vA26ZmEBobxdoz3CQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfYA+GIHOeQcAxj9ExW37cHUeUtzEjYUOWy088eb/00=;
 b=elOBQM0wsClRIEyGr51DMk2cJiJG3jvizky8fPT19L1XXptYN5v+oJN2/L955RxqfYFhPZ699Xr7bMCEE53d5tXnw372rUm1d8iH4XBM41ATOkbj0LbwfZ6i7d78uXG+ulUEg2PVSHVBUY3iEYq+cg/pBQyTiyYwFqlj+pU2Xfrj7E2QY1Btce9hu1UQTDdD82fcSfyWbsCWqoEom35ymyxyVBfWn60ghUFltBOW2GbyPe0qvht76qZGnH3YUCh+cMBCBcXKQ1B8p6BW0LE3CpZ0kE5mns/Adl4dU/DtsmUjYnQM12vh5ng4ADZelTsA8ufQSxWY16Dm7kBSm03ZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfYA+GIHOeQcAxj9ExW37cHUeUtzEjYUOWy088eb/00=;
 b=E+gpk7/ybgzmliN/TQ7fIu6bDVt2xGNpWPvt/hShW1lqo9p1JYdxTWzk5CTyBiAFuCrHDOdLWCbWGBpaCelT1YJRgilu3W1pqYgp9B5S6GQY6KRmykEEL/ao+0mYBsFwegMjla8/y91Jfqycl2wVrwb3jP+XZIhpsc4M8UNK4eA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB8444.eurprd04.prod.outlook.com (2603:10a6:102:1db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Thu, 13 Oct
 2022 07:12:48 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 07:12:48 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v2 4/8] usb: chipidea: udc: add suspend/resume support for device controller
Date:   Thu, 13 Oct 2022 23:14:38 +0800
Message-Id: <20221013151442.3262951-5-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 47f20dd4-3b81-47aa-31de-08daacea5571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zfEApHOq0DrGwnw9JHaoYu2ZM22jOsL78X661vEhu+BQZ8gY7hpcqk0cJMva30CFvmfRsqDFfPvhnxXG+xCLlpvQg/Wrj1bE6EbK2NgjGrIF1ObwrBmDrIogsCzOfORRMPJwZp4MTe4XqP/wGhpjFiTAghosgtTbqzgvKBkvYLjp3Rg75pJNr2Op0RkVfnsjE89DUKbb9uzZvTBYLTYj70eMgv55BAfUoDL51RvBBI9HNY2jESVeh/ZcNYippy0v2ehWJkHKvAPBv3dscUdeKPjqZgHJu7bFVeNJdKEnRkomRiIlbOpzMQNoRefmu4Z7WJZbHUBj36jRZnK4dK+iXzGCrEh0OpA5U659fhC3yu7fUqZOOv3WK+1pCwel0Ck1J+PRyvaBugzzvS+Qd1sGVIaEWLVTjtoD99OeB8FdWABVZz/phu92W9zfyq+7ucFzwCpREVcnxT3/U7DBuV7uvOVMbbqaCWpfBdoWgtF/d4n4eML6YevFifRQ/RgJGccYq4WzQCcopF4soFLs84KIcnmwnaWBHR6EkJbtxTUN6rnyLDt/TH16/f/XFUhEJweYR0lFi6a/ROl2OBqhGXaDPcx4x9da1Cw7R4ZFmELB8t4UV2ojajitTv5oR+0K7knAsiHFwcypLCaL+19WSFQLJ4t7Ndz8YR1et0Y+nLsSu3MZUPtm8pUYiUpYmgYUcbpzJJmDe40jfHiUE29Ev9OvFKI0HhHKeXIMymfcOuG6DyUgmdQoYw/Y0wGkPZSZhoKZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199015)(41300700001)(26005)(6512007)(36756003)(6666004)(478600001)(6506007)(52116002)(6486002)(38100700002)(316002)(38350700002)(186003)(6636002)(4326008)(86362001)(66476007)(8676002)(15650500001)(83380400001)(2906002)(66946007)(1076003)(8936002)(2616005)(5660300002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5OlNpebN24989wBpOmnbL+zIT9BfNcEYxy4vgcxEZ4bdiy5mmNuuQDcZutW4?=
 =?us-ascii?Q?HkUTgBRFSMcn5cTEaFA3jcPSrJjvNgtjPhsVPRHowVu8+qHMTLKV38kcZfQ1?=
 =?us-ascii?Q?NBne2k77NVM7Ea5eI/RJNDMHxlGklbF1HRIVvNHr2YtJ2wgNaBFrrNMlLnNV?=
 =?us-ascii?Q?PncMPgDY+UezbZv+FxKZuwHikxfD07Bs7rGoL5VrZWRV630y/sdJTD1v6aLJ?=
 =?us-ascii?Q?VRQRGfM4u56DvnQfRRNFaEgWyn9zLtcFRNJ+CvUlqzH+k2xs03hLSsUL2LCU?=
 =?us-ascii?Q?3rc8X25mQxgFhDjTG/QCD4RrJMrckKVsUvwK62+YrAAt7E3QRL2obVEM4g/+?=
 =?us-ascii?Q?YYMrJiNqjipVv+DhZWJBL5Kqtu7Lq0FVBvU7hJam9dmKmYGev3KqA79Dmr2/?=
 =?us-ascii?Q?ZAQakfQQpfte1pEWxvJkrNQA3KfCCJYvuV2uT1LkbBDqDRNCYzFFiz7pDJ/Q?=
 =?us-ascii?Q?csi01sx+HIozdjCEWir5tmcmAK44mxPh+0AfxgzEE1lDNSwh3PReBDFWPRAU?=
 =?us-ascii?Q?fc0VhNJlDXYVbSwQgtLZdXAlaQIb5nNH9o1FTBryJ3IxsrLA3bfuyOO49ZoX?=
 =?us-ascii?Q?2wpsEDOg9JnnMrWxVKRq36U8njThzxFntYdd7egJN4PaTJvabfdiOrI4xdYn?=
 =?us-ascii?Q?bMwwFAq520C+EYZiCqwQo+bqCiW/yaAGeorugsyJitBF2uMWQqKCbMLiISBl?=
 =?us-ascii?Q?hjnJLEDog8D2M5k2hxY+UEkqEXWGwDiK6OxZHz/DXV2R7ghx2CEtc4ZKixk1?=
 =?us-ascii?Q?SDk77VIqQjsXEvQX3REq/uMxBWv0iU0OJq+9q2WRHrSLLhzPimc4TQ80/nnF?=
 =?us-ascii?Q?fktNWJkAaFn+x1L6SUWaTJYisywyzU+BnuuNTdXlBN280cykY4TJHyyGeSME?=
 =?us-ascii?Q?2nFhHLyGc/8f4uAQiBixEIMjizJHGza4pdZP2GPLwxnkgfza0hRZ5g4eb6ho?=
 =?us-ascii?Q?e8/0zPXCD9AGAtPBSQYel/ec2/oEB00YIaXvC93N4B5J8MKbqYxhCfb5v6Sk?=
 =?us-ascii?Q?HSMhxvuu/k0svVMQlk4f76w8WCuHhjHYq+ezydo68mrDKr7c7zmOMQcsvrhP?=
 =?us-ascii?Q?FXIBiWW+mwMKI+IxXos1FmthGUfCp1Gbb3ioyRzuqE31SLwmC6nt7sS10cBF?=
 =?us-ascii?Q?BqQg89XLf7sinQNqM0dnZt1OPkwe2BwKS6a+qDNWNuuzInapHNvMOQfHaWSU?=
 =?us-ascii?Q?Eerm3iPssFsnZ4ONs8GHzmgHZD7FilszRla82v+dL15AhIOZbYlJkxY5qPqe?=
 =?us-ascii?Q?GBh2tmkzbu/7iRkPXjyh8c1Yu4nnuzrVlsxcLjEkosXYUCRIGPRco0O4W9cX?=
 =?us-ascii?Q?Q18vdqHwGcERPGzWbA9lYg39Zph2RqmBR3PSXTdS3YvF1Ee7GP+Xap8UzTF1?=
 =?us-ascii?Q?PdbMkwgZJJGfIzO68tMnOs9sE3QLSdjqv0QZ3W4I1uob36in7uSvk0FCVBhz?=
 =?us-ascii?Q?nN+GtVnLvYUWWxElC0mnLWJFeGSJQs7UL7HN3bY3uN9ok8ZYHL/y0agyZo1T?=
 =?us-ascii?Q?eny+G6pws1xKWWmvJryiVXX7Fdv0otg6gOBx58NdLlBCkqN3ly1Cyi4feuJD?=
 =?us-ascii?Q?iWDDC+/TeugJBvzk1eL/81XM0Us33qRu2kQA9u9G?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f20dd4-3b81-47aa-31de-08daacea5571
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8777.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 07:12:48.5468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dt7+WIWpJCKY12OLhUy+IoB/8cAS4kM9RbxEF9p0yNoL3sO0FWyjpmgSbDrV7oDCiTGTiCezi71yzRx19sJzag==
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

The controller's power may be powered off during system suspend. This
will add suspend/resume support when the controller suffers power lost.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v1:
- wrap suspend/resume functions with CONFIG_PM_SLEEP.
---
 drivers/usb/chipidea/udc.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 8c3e3a635ac2..54c09245ad05 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2181,6 +2181,34 @@ static void udc_id_switch_for_host(struct ci_hdrc *ci)
 				     ci->platdata->pins_default);
 }
 
+#ifdef CONFIG_PM_SLEEP
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
+#endif
+
 /**
  * ci_hdrc_gadget_init - initialize device related bits
  * @ci: the controller
@@ -2201,6 +2229,10 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
 
 	rdrv->start	= udc_id_switch_for_device;
 	rdrv->stop	= udc_id_switch_for_host;
+#ifdef CONFIG_PM_SLEEP
+	rdrv->suspend	= udc_suspend;
+	rdrv->resume	= udc_resume;
+#endif
 	rdrv->irq	= udc_irq;
 	rdrv->name	= "gadget";
 
-- 
2.34.1

