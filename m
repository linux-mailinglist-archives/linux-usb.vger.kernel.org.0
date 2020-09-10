Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C44264118
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 11:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbgIJJO0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 05:14:26 -0400
Received: from mail-eopbgr130040.outbound.protection.outlook.com ([40.107.13.40]:39234
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726738AbgIJJNo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 05:13:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a17Ex0q0emqt4keJ8rjXEnk8XebDzCnVVZbpnNJWyzdGRE1fXo+hc/c0kUcl1mJkn7PnTPYvpB1ZEVa3NPwgG2IZCalU3GZ3UkyT3RFQNSeWtptfjEm/DWQfMoVY1dfsTqxBwikcxNoewpKszybrCMTrypAINwhama43/1rn34Zq1sJGzZ6fQWF9RF//d7V6cHkxblExhZtNCMwYO+lsQ+kcOBMcR3Jke91e9rYOYzjF4cMiPg/yXF+VYfqyxSOW95Vwa3+ZnmbkzyryMJ33WBWlqGyksT+6e+CBnfAT0sU566rf5f2WuTwPxNz6MgcDl2bsnxk6GQpAqFEqt+/M2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1DYJey45iW5UvrCSV7H6WNoTSWl+d8AeIaPUjDCyog=;
 b=aou7O9oCQr5uOlY3Xfi9BBQLdQ9yorfBEyv3d2gFICciOG6iIRzUvWCLySBe39iQD4if3GlwXdHINvXGY1y7V/r9jlXmKg1DqyJiZTKVABz38egdgi+wIYMAAdSQ57PMzsOho/s7smnJAU+vyhLG8NFj7txseT650bsb2QcLm0LolifPZOsFbbN5ktj9M0rqIc9XvIhFuNzL/PBDH+OfNIHemcy6Eic5wRwdKWLhxm/atEAtReQ+V+O+2UUfhUWtuW4Z9aJ3bYSjQRk2xUPclgafAhV+FZPoamhc9UhNGyEz8csRQUUEnRHcTb4sQdvtdWQw15KpHKyHbR4j74hC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1DYJey45iW5UvrCSV7H6WNoTSWl+d8AeIaPUjDCyog=;
 b=q7q/9I8znjf2xntCVQNlebyxK4XZCi++7zCiAnPZFLFKDbtxOIMcfIX41NqezT1OfB9gYcVX0OjvjyKOK3pgx8HdqfdqQcAtNM3ozB09DpcbUxjKkdj/EiHtI0x+tW5WWmSYZPDXzRHYK1ufRe7eNoXeRk7jebs9eZRsYSz3kY4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4168.eurprd04.prod.outlook.com (2603:10a6:209:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 10 Sep
 2020 09:12:30 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 09:12:30 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 6/8] usb: cdns3: gadget: need to handle sg case for workaround 2 case
Date:   Thu, 10 Sep 2020 17:11:28 +0800
Message-Id: <20200910091130.20937-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910091130.20937-1-peter.chen@nxp.com>
References: <20200910091130.20937-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0134.apcprd06.prod.outlook.com (2603:1096:1:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 09:12:28 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1172249b-2a1e-418c-d668-08d85569a54d
X-MS-TrafficTypeDiagnostic: AM6PR04MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB41680AF916FBAA7634EB93158B270@AM6PR04MB4168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RKry5EGhmHjKC+B4BmdSL78Punl0ShoXKU2omTVJygA+xlVroroVPzPdYvtO52nv+I+vxd5JqEPr2dWGo/LErgcfBsycREiQH5duT9UfaYUHN0tpRqCn4QH1mh6D8Q6KOqJA6JPHr2u9P0XlOmxnQXCt+JNmoPWXM69F71ZqP2U43SuV40l0Cz37KiqCBLxFj+yjLu8iDkrUMLzD/n+i+TwJsw82L50ktyqnuuu1yuZyaUxeBc+hc7yD1JLXH/Cvaitmi9rnBxSF5jJmrq9QeSdVVqxHkoWEEFL3KdAspG5K58+vLeOfx9NV2xKFo2Vwm5NAhBn+rkNKP//kLvhd3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(4326008)(6512007)(83380400001)(186003)(6486002)(16526019)(36756003)(66946007)(66556008)(1076003)(8936002)(66476007)(52116002)(26005)(478600001)(44832011)(316002)(2616005)(2906002)(8676002)(956004)(5660300002)(6916009)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: A5PvE2l8qHMQ2eFOG//xTFPXaNIsuSgjlkmHziX15fVEZKTptLI6w4SIAca3PTjiW90q89gTN1hbW04v81KLKxlsiaGCPftzJs9v2ERQDyG/UM498fg4xA+F9DB05lsgrmQ5sG++0lA3Dp6R6BzR5NmyN+pt+HMq3kDhBqnvFeL6cj5BvW4vxi9owiR1j9n9pYUtKnflRdrk5i6VSsYJASlFeTBbw1r98jFyeaYjjXTHNz5dq8Yg/e7tL7vUYI1dzYqoLxZdbAOoOwq65nK2AUzeU+fW6pQ+D2lPkvHF11/5/TJfTWMCdW5VnjQkwKfWtmzyidsJi9xTjDlyruGtk/I2269X5343lIafKJpfj8w4X3mBBAi+Dd4EFjctsAdlofUDRziHGGuU8zKRJX+IaQ0qwZmPnQWM+Rx8Py6Qgtqm33qN+rVqlMoamB6DRq0IxhKT/C7uDfpWUQpGmq4jP/iM7N8xbwbqp/lYMvHv+cy4k4KzEAwh6x+i7B51mf22Y31mu4kYSTojJ7gzKpf3AMjeHKdzMsnxiu760lO8Z4M1+toR+3juquZmXxeRxTjJj8vYs++e90BYu/JpwkLh67RrR9mN7oXoLwv6FimyQBlLv/wuY03fCeyQBoubVzOB7gpBqxvUv+zjzxR827KdhQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1172249b-2a1e-418c-d668-08d85569a54d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 09:12:30.7806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZTWBjW5v1CgTDnK4c8qzF0WjPnG2oEVHk19swqvlGCbAI5vkslE/+zdIiTGlR7gu14BFOuRZCiw4nqqw4Sbnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4168
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add sg case for workaround 2, the workaround 2 is described at the
beginning of this file.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 44 +++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index a5dbe1a01050..e2c12212dba4 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -462,6 +462,36 @@ static int cdns3_start_all_request(struct cdns3_device *priv_dev,
 		(reg) |= EP_STS_EN_DESCMISEN; \
 	} } while (0)
 
+static void __cdns3_descmiss_copy_data(struct usb_request *request,
+	struct usb_request *descmiss_req)
+{
+	int length = request->actual + descmiss_req->actual;
+	struct scatterlist *s = request->sg;
+
+	if (!s) {
+		if (length <= request->length) {
+			memcpy(&((u8 *)request->buf)[request->actual],
+			       descmiss_req->buf,
+			       descmiss_req->actual);
+			request->actual = length;
+		} else {
+			/* It should never occures */
+			request->status = -ENOMEM;
+		}
+	} else {
+		if (length <= sg_dma_len(s)) {
+			void *p = phys_to_virt(sg_dma_address(s));
+
+			memcpy(&((u8 *)p)[request->actual],
+				descmiss_req->buf,
+				descmiss_req->actual);
+			request->actual = length;
+		} else {
+			request->status = -ENOMEM;
+		}
+	}
+}
+
 /**
  * cdns3_wa2_descmiss_copy_data copy data from internal requests to
  * request queued by class driver.
@@ -488,21 +518,9 @@ static void cdns3_wa2_descmiss_copy_data(struct cdns3_endpoint *priv_ep,
 
 		chunk_end = descmiss_priv_req->flags & REQUEST_INTERNAL_CH;
 		length = request->actual + descmiss_req->actual;
-
 		request->status = descmiss_req->status;
-
-		if (length <= request->length) {
-			memcpy(&((u8 *)request->buf)[request->actual],
-			       descmiss_req->buf,
-			       descmiss_req->actual);
-			request->actual = length;
-		} else {
-			/* It should never occures */
-			request->status = -ENOMEM;
-		}
-
+		__cdns3_descmiss_copy_data(request, descmiss_req);
 		list_del_init(&descmiss_priv_req->list);
-
 		kfree(descmiss_req->buf);
 		cdns3_gadget_ep_free_request(&priv_ep->endpoint, descmiss_req);
 		--priv_ep->wa2_counter;
-- 
2.17.1

