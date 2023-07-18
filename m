Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC981757A59
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jul 2023 13:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbjGRLWg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jul 2023 07:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbjGRLWe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jul 2023 07:22:34 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF551701
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 04:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBLu5GDjLHc+p+Oyy9LJP0q/Pi0UpiwF0QwzqV4WsIpxAXLw5h3JaMz5L+dT/5+4zayjdYWh+8DuJNlVB+oUsMriJqxBKRzDX+mA6ejqebpwlRaa0C2nvOBBe6ReVDQore1Mo06gqWWjVgYpOFhN6Na/7L3gx2bOGFzQ7vc/f0TA9oicMwu/c+47n8ryDcE0h4zB1WLju7xEbyJJforgM8+UeNZXjI8iOg6FRZsCxplysuRE2Yw5ZGbk2qs23eFlTQlj6+bOl+b4ICajZybURm4KOks7nVTVC7sjrlogx9YRpA3vFfbDk31mZ1gWZFJTJM7AVngm0gOZBgZZafJqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WABKwB67A0itaa/O3pQi5SwXQZUmAdNDXW9Q0+Zds8w=;
 b=SAJj3D2k2ZJ/IQcg8k0bF9H5CO4fkDdrlJQNWMNCFP28uYLvwTjm5RN6Z7/7+9PScPoaKzrpMc6qOMoBhnH5GZevcMjc++plqmYgLtCKiN7OShzsm5+zz1lPmkiY3GR+Wt6CUJbF5CljagW/oPQFRcbJ0HhQNbDDjuEmyfhD0XZ+GE6+VWYv+qtNabLle2RYsGesDsOgx090A+m0BZKuGfVd+cttHnJtEFqy7hBMKUzhCw4qsoPhb50WZ7lRrvDuOQ7mXxAKrBTmB7v9TP58IF+Sf/Jbwz1cCu5GY2FLK5wbbiMEjEnOHk3HMYL5HTEr2pjdJlYYEmE/PTMZBB8v1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WABKwB67A0itaa/O3pQi5SwXQZUmAdNDXW9Q0+Zds8w=;
 b=GQ/gKtJ5YGYm9Bai3yZhvnjf3zcRyvguEx3801yGC+stEkefbArfOG+2i/NzTzq41LUz/MWPkSqYsSufpBCvG6q+iN2uzfkhUaDREXxeQDHcgiBzzbVL9CZ5S8eeumsB9rciE9YhAcc09ZrSW4HINMgWlYfAAPpOP6x4PF2WjC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DU2PR04MB8743.eurprd04.prod.outlook.com (2603:10a6:10:2e1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Tue, 18 Jul 2023 11:22:13 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 11:22:13 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        xu.yang_2@nxp.com, jun.li@nxp.com
Subject: [PATCH 1/2] usb: host: ehci-sched: add itd/sitd_unlink_urb() functions
Date:   Tue, 18 Jul 2023 19:25:59 +0800
Message-Id: <20230718112600.3969141-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DU2PR04MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6cfc4c-cc62-4bac-b64b-08db87813bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L6plY7UWsx4NSq3ozKlLPyMU7MdF3+cfFh+zUbExUzUueAzM5BSOV1AgxPRjjcd/hcCpVuPuBLQrLvT+xIXTlnfxco3mHijGfqZ4xlN0f+h+XOp3Olt0zACglCeluCfRdYjY+11G+ltMjm0ET+dSOmlbeGtQ16y9q9i7E8t8gI06XVaOhnmCqnw4wMWLCvaEooTBzIgjk89zWN31b1iFgtalU+T0S9O47nMdvMY9urHvfsh5N1NRDyo8YEgvmvO2HwFvMVThI6pFBBYwZf+zhXRDJqOj0duJCnCkvU+tJ5+Cx7nvxuQtcrR+VUoVHOeUfDPYmxW/1nYQxLj146cq3BAb5nDN3JkFPre78Hr5OB0lX5FYdORw5Vfd6z0yf+yPKJNzaSGPmpdYKeV82WN4epPf5rqnykzhyorU69Hb9U8GrkvL7S5gGszD9NHwnPOudDg8jM5od6JFlaPILfmVuq7prPCAKtoOqywHZh0vMSYDdDHj/YYaG37DbLCqKmBDE0Fm36EjME23PVZRBCGfi5dgQ4d29LfQ3MEjo3ieX+o/syGT9MsFR0d0BTdukFITOrf7/O99UIAIZHhO0vftC5ZEN/nF8HCmQJjs4rwL0mQX3to4OnBV0hGxzS5KKK5H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(86362001)(2906002)(66476007)(5660300002)(66556008)(41300700001)(4326008)(8936002)(8676002)(66946007)(38350700002)(6916009)(38100700002)(316002)(186003)(36756003)(2616005)(1076003)(6506007)(478600001)(26005)(52116002)(6666004)(6486002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7C+itHoFdWi6qnumKC3sdB7MU2j3uI1B2ABO45SAxiPuFTSQcRiuB6ZGGEDK?=
 =?us-ascii?Q?/ZvVX0OQ6ycgORimf2P+H2e95IcnVQuEQvg2dujCxbY7hKZfwv6A5NwX+CRy?=
 =?us-ascii?Q?u3DSxCXW2QshfowAX1uxKnSeXzW58oNnDrVH9n0C+YrNPf1AjN6qa3xSvHPg?=
 =?us-ascii?Q?HpmEdiviJ/4VmiZg+LPOsuRh0D0sgqxX5ZYZBx+ZebrpfvPQxdCn8pDVWDPU?=
 =?us-ascii?Q?jYlew1Kht88mN49zqbuRUWdnsTmMF/0StN0qHWqhUC0Qra556NKA9MEW+9hd?=
 =?us-ascii?Q?LIFseBHmPryLqxD7TZfU/IdNBJtGhOU2XZdIpGXJ+7KL53elM9U+qWGSXGqo?=
 =?us-ascii?Q?bfv/L9vRIdRsCGxCWufqQF5UEyYNQKB8Bbz/UXbS0ZfRxGgjcReZCrPcB46F?=
 =?us-ascii?Q?yadDcxo28BvfCFHzL45z4KCovEFCtSCxtCAeC2AyFbCj8s7LYqCPuFmRTpn0?=
 =?us-ascii?Q?a10gXNiHP7/IfNkzGWbzKJe/DoUAX0V7vv4JLKR5KGNhN6pGPLkVGyKke9h7?=
 =?us-ascii?Q?c/7059djCfdGBMVOjSiRkyNCTnzRhWAxKF3bvPu5F1uaAMsvRzfTEm8zIWK0?=
 =?us-ascii?Q?3BT4KJCSKsKkPdCuyyFKaGIPivo140l/Agaf+1M2i+7c5YZXVJSUKfCSGGMv?=
 =?us-ascii?Q?oMmEennRuAu/F9W5IGcjn6V0PeHwPuJh6HvXsZHOp1aWOxPy4/QLvPzUpihA?=
 =?us-ascii?Q?cPL32iKXDhMLa+e/uzrRkuF0iGlbTpaZAtE0Nv/1o45WmcgkX44KwSplPn1c?=
 =?us-ascii?Q?WsGKN/247IgJoug1X0OPOaIGrMI4XGnzFG86J0wSiVSQoKcZJXLeajY78cNy?=
 =?us-ascii?Q?NBZKJIKaL/Ssz1pb7h8SgkGnR4HWVQ6SxAYxbJcJnCnFv+ykRIlyWNMtq8Xk?=
 =?us-ascii?Q?QKvBe/Ivcb30hZtOxZKTXDU0LqZ53cTbNxX5whDaj5UcqosyHMx9A6bnAUH0?=
 =?us-ascii?Q?lCjRrG9IOAwQ0X0+d0LlcWBAP/LyPNv7SEc5f0y6QuCX+dZrg4CnYP5qCrNa?=
 =?us-ascii?Q?sGYrWVh/B6EAe7tKINHNYUxIGt/bsO5unPFTd6N1ML/MET9Nz+ZfVZlXAQqu?=
 =?us-ascii?Q?7ZVCb+JOtKYOSEEoQCEVtOSF0cq/7XjGTW3L6lkTRAS32deYgGRRFl62jrx2?=
 =?us-ascii?Q?n0uEV3lpt1xqbf4MU/7GBLnrfGPNIukUZN5Psh21OtXRe3TW9P+ny+gM/tRe?=
 =?us-ascii?Q?xLeyCT8JwOC4TEwvoM+XYoDXyJC3sVkGdanJu1lzvEGZxkcPSLRTslKwqfC0?=
 =?us-ascii?Q?puTA/M+b4LfSpSJ+6ciYQIRMe4OUmFSPGY8QzqtUv/kzfsU8IzGJqTG5deeH?=
 =?us-ascii?Q?m4RhzD3+4dh82alB9rlgXQWdkjDMglmTkw57MxOtNmsP1OwZ+PDI02hLQU0r?=
 =?us-ascii?Q?GeIw0O16mkJcYl0zLu1IK2Sn8+qzdQWMETYzg4ljkiOUXFarDgGvc+JuwGkV?=
 =?us-ascii?Q?Tup0eFYb1hVWDrIIdQuC4lJr8x1zkNYopYFrRrzFvE0TlTEyopX0uddcCj8K?=
 =?us-ascii?Q?9olCif0IIQdevM9zfkynNo2PYyD7IYMSjlf6yHKv8hcwFS2HvvOkZklGi3Ku?=
 =?us-ascii?Q?lHhQiw1pmjUURT9OR782h7Jr1p/LNiJjzfKgUOwI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6cfc4c-cc62-4bac-b64b-08db87813bf3
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 11:22:13.3970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUUPIe9Ssl0KPdSQii7/HVBKjGU15PEHAukW07f5nXczPqTBhODFhj/nFJunmRzXA7jjAJJ9/i0QCMRrojyOqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8743
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This will add itd/sitd_unlink_urb() functions in case of the driver needs
to unlink these urbs manually.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/host/ehci-sched.c | 94 +++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
index bd542b6fc46b..b95a8bc4d3ba 100644
--- a/drivers/usb/host/ehci-sched.c
+++ b/drivers/usb/host/ehci-sched.c
@@ -1805,6 +1805,67 @@ static void itd_link_urb(
 	enable_periodic(ehci);
 }
 
+/* unlink itd/sitd from the periodic list */
+static inline void
+unlink(struct ehci_hcd *ehci, unsigned frame, void *ptr)
+{
+	union ehci_shadow	*prev = &ehci->pshadow[frame];
+	__hc32			*hw_p = &ehci->periodic[frame];
+	union ehci_shadow	here = *prev;
+
+	while (here.ptr && here.ptr != ptr) {
+		prev = periodic_next_shadow(ehci, prev,
+			Q_NEXT_TYPE(ehci, *hw_p));
+		hw_p = shadow_next_periodic(ehci, &here,
+			Q_NEXT_TYPE(ehci, *hw_p));
+		here = *prev;
+	}
+
+	*prev = *periodic_next_shadow(ehci, &here,
+			Q_NEXT_TYPE(ehci, *hw_p));
+
+	if (!ehci->use_dummy_qh ||
+		*shadow_next_periodic(ehci, &here, Q_NEXT_TYPE(ehci, *hw_p)
+		!= EHCI_LIST_END(ehci)))
+		*hw_p = *shadow_next_periodic(ehci, &here,
+					Q_NEXT_TYPE(ehci, *hw_p));
+	else
+		*hw_p = cpu_to_hc32(ehci, ehci->dummy->qh_dma);
+}
+
+static void itd_unlink_urb(
+	struct ehci_hcd         *ehci,
+	struct urb              *urb
+)
+{
+	struct ehci_itd         *itd, *n;
+	struct ehci_iso_stream	*stream = urb->hcpriv;
+
+	if (unlikely(list_empty(&stream->td_list)))
+		return;
+
+	list_for_each_entry_safe(itd, n, &stream->td_list, itd_list) {
+		if (itd->urb != urb)
+			continue;
+		unlink(ehci, itd->frame, itd);
+		itd->urb = NULL;
+		list_move_tail(&itd->itd_list, &stream->free_list);
+	}
+
+	ehci_to_hcd(ehci)->self.bandwidth_isoc_reqs--;
+	if (unlikely(list_empty(&stream->td_list)))
+		ehci_to_hcd(ehci)->self.bandwidth_allocated -= stream->bandwidth;
+
+	ehci_urb_done(ehci, urb, -ENOENT);
+
+	--ehci->isoc_count;
+	disable_periodic(ehci);
+
+	list_splice_tail_init(&stream->free_list,
+			&ehci->cached_itd_list);
+	start_free_itds(ehci);
+}
+
 #define	ISO_ERRS (EHCI_ISOC_BUF_ERR | EHCI_ISOC_BABBLE | EHCI_ISOC_XACTERR)
 
 /* Process and recycle a completed ITD.  Return true iff its urb completed,
@@ -2196,6 +2257,39 @@ static void sitd_link_urb(
 	enable_periodic(ehci);
 }
 
+static void sitd_unlink_urb(
+	struct ehci_hcd         *ehci,
+	struct urb              *urb
+)
+{
+	struct ehci_sitd         *sitd, *n;
+	struct ehci_iso_stream	*stream = urb->hcpriv;
+
+	if (unlikely(list_empty(&stream->td_list)))
+		return;
+
+	list_for_each_entry_safe(sitd, n, &stream->td_list, sitd_list) {
+		if (sitd->urb != urb)
+			continue;
+		unlink(ehci, sitd->frame, sitd);
+		sitd->urb = NULL;
+		list_move_tail(&sitd->sitd_list, &stream->free_list);
+	}
+
+	ehci_to_hcd(ehci)->self.bandwidth_isoc_reqs--;
+	if (unlikely(list_empty(&stream->td_list)))
+		ehci_to_hcd(ehci)->self.bandwidth_allocated -= stream->bandwidth;
+
+	ehci_urb_done(ehci, urb, -ENOENT);
+
+	--ehci->isoc_count;
+	disable_periodic(ehci);
+
+	list_splice_tail_init(&stream->free_list,
+			&ehci->cached_sitd_list);
+	start_free_itds(ehci);
+}
+
 /*-------------------------------------------------------------------------*/
 
 #define	SITD_ERRS (SITD_STS_ERR | SITD_STS_DBE | SITD_STS_BABBLE \
-- 
2.34.1

