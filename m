Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BE148D508
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 10:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbiAMJbb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 04:31:31 -0500
Received: from mail-eopbgr70082.outbound.protection.outlook.com ([40.107.7.82]:51354
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231216AbiAMJba (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Jan 2022 04:31:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUmE5JsM/PNSYoJEX/fvRuxSNKT7hNqEW34A/4d84+YzIT1f4jsWy2srav5RcxJD8b18ZxnP2QWaUypCCkUJvqGSYF6B3evJFb6srCUoQ/D2bYuFBMyUcuNaNFrNs1uqZjzj0K1jSgAy24EzLd3ZXMz7Ts3CKkNGRqc2US7Ita87Piy3ZgsULXeVeswaoRj9lqgq/xjkkOPHkD3VmDFqE2Pdj9XIY2Cvgkdmq4oo6OuWNI1MUfjzOPuGlfqlus4sCdmOmkqtMkkNPiN5ATsp0OP1NuH+146vU2guAe8md3uDBIFbdELVh/rLQMx45EKsneP+OIlSyaOjQ2yoo57WXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJTKCCa3p5RIIQ1jX7p6y53WbqrfAI8Ie6yJ5RAFCFQ=;
 b=eOOBc6n58bGVCVRA7YrWrtxV5cZpIb2kE6FEpcP9qsxlaPsR1yJNQEtpVeyQFScdxdUTA4f33+H6d8VgYw255BWcRglhWtvY24q3mPl9n9pCD6ux0iuMJ944WBp64dr1wykmsgQfz9A6MnHkt/jlz0ZzrY+cV4DMAn8kwhrhBfBaEjeLJSEiwzEd24JBWLqGZgTBgBNy/TylSqB2wSZ6L3QzFPNgkwORcpUGhjxxc/7GRWbij8O1nkvBwsxoXXYAusFCB3NoN7iZbRr+e4nGznRSwV3f3yAr7aDgKBGmqEeuSyQ84Y0u/iphrzIbJohdhs2WStxrauSggMu9JpFuuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJTKCCa3p5RIIQ1jX7p6y53WbqrfAI8Ie6yJ5RAFCFQ=;
 b=YvH0k0RRXSdMScwGs5sOE5+pHrivyt11DOdGKYxaomSIeMsxuHMi1F0rlkM9twx3erEOP4pwntmaqpWMmlepRicb7UFloWCP0z5pFQDbmpo8qZKahwYrP4+Bl83s6KcHn6zWW/CrfzjzXIbkX4Rk3W/cP7FUau9joR0hqaluR2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by AM7PR04MB7093.eurprd04.prod.outlook.com (2603:10a6:20b:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 09:31:27 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::9934:6146:9a64:1e51]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::9934:6146:9a64:1e51%8]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 09:31:27 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com
Subject: [PATCH v3] usb: typec: tcpci: don't touch CC line if it's Vconn source
Date:   Thu, 13 Jan 2022 17:29:43 +0800
Message-Id: <20220113092943.752372-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To DB8PR04MB6843.eurprd04.prod.outlook.com
 (2603:10a6:10:11b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6788668-04ae-40e8-ed9b-08d9d6777917
X-MS-TrafficTypeDiagnostic: AM7PR04MB7093:EE_
X-Microsoft-Antispam-PRVS: <AM7PR04MB7093F21ED9ECDD07D942C4628C539@AM7PR04MB7093.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXPlrAHf/A/AlxbqYNQDK5SJx/TpPfcbLg56pbTkCmLBl7ykb8VOuN1CQw8BK1XGxF+MZuXFSHhK20+VXRC33JlUIT0iASlxuIY07cgWzsMb4cWI9eoHsa/rgSaZQWijQ1Xmw+4ZPu+Q5QTFtJ9JUbEwQNcp+IM5yXmXEIkptCuYjx+QGJhzFlnh1bzVbMJWZOWWgrMRLdQTrGdKQEPLHmNedaXJ98UTwjYfm6Lhg2DgB6vvMj2wairi1JDyWUGgzzjwNFeKecYQl5fYsoR9/OKHpiAbUsrVrn3MJIlPVdD3QZPdfqD3BFKpQlc5N1MqDFVNo0Z8/ouQwBngZtIRMVunJB21MUNIdT4qmr/sbWU6YnR7VEgArvJyivQIgGpe/FS3J21GtWDtBw0OqMoWJOzuW4Ke1bsTf9zikG6elAhgmCrZcBEj+4VWHCdjq6fTYOnh38TWsf8Imq9RK0K/TD7duAtUDly/A5wi3w8a9oVNG57Zdy50fOoN4tfNPAIXBbA+/3lCgk9q5pXOjgk0g/9xOaxNwQk0qe2UvsJn7YgCzXrxVjvjhLx1eCh3Zozffn4Es5vu7W4TpJh0XK5AoTpSRx+BzA2W0nl1cYE0YKmTWtfPHwPc/4gxqcHr5xBaaUEJkLmdWYOqvxq0X3G62oktE83N8VXQtzbU0kr/Oy7Hf+PPOx2Un18s2M1oVFG0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(66946007)(8676002)(6506007)(8936002)(6512007)(26005)(508600001)(5660300002)(52116002)(4326008)(86362001)(2906002)(66476007)(36756003)(186003)(38100700002)(38350700002)(2616005)(66556008)(6486002)(6666004)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nYG+NADpQn34utiLYk+NHmUU6P7mbNwhWGrZelOMKsEIqumhPM6LO2UpU/iz?=
 =?us-ascii?Q?ZG4XBWxbJz0Cjqm2kNxGSkBHUWsoUeiQlv6w8pOiQ7H1TAIUN4OFIrr04hKV?=
 =?us-ascii?Q?/Kb2rSJfJnAPkbxbCwBf01JZC+Jtts3ghTmf74DUqxHfEPpmpX8eBHE+1Y3E?=
 =?us-ascii?Q?VJ04qX7fPQbh4g8MvrMrHwWjSg4tjerE5L2PIR3JNrTQ3/w6AwCSIas0rBtB?=
 =?us-ascii?Q?lZbpDnnghX3wCOqfSq3ZCHWH2i68tftsAsAqeO0yA7+jZ3buQH6J0kVCjjWM?=
 =?us-ascii?Q?ruI5bBlUmCe0kXqpXJgtA3UCX4vadO3NFTejKN+Rs4SdmrKC0YOditCcSCXO?=
 =?us-ascii?Q?fLRS2VIoU7ueoPdb1r9lpjlFuabnq/tVb20PmnEGnr4JtN6TEff33QSjefSG?=
 =?us-ascii?Q?fI6P73KbjWy5U+Ib74AUlXrKervPS1rIdgN79H2kCKjHywgnFgbaQeWmOhpB?=
 =?us-ascii?Q?4WbXoxL91SnLqc2n3B9jDkB/aoiPPmjjlHRspg8yjm3QGygI5E5P7SoS83Hn?=
 =?us-ascii?Q?2k0sse/4l7xV1hrxKi4zZ0lM9o2Jmjm5oXNPcMkOcv0BSxWEHe5E3V1TgMMx?=
 =?us-ascii?Q?05IyGsJ2txuTrh+e7nligVxq0szYnz9AgGt+0OmKCk2apkG9M54pII/m/f1L?=
 =?us-ascii?Q?PyGXC020Gs4WK9hD8mJkpji9vb1d555kl62H9wzKW0htP5sX9S2MgFQBR//I?=
 =?us-ascii?Q?fMGYoZSFvhkJRWcM8UUc6dISTOnTDN2KasEkn+0d0Y2hgrzqgwV6sLBuo0YB?=
 =?us-ascii?Q?GoXMa9u7Taoq80lOPhI4D83k8C/Dfua2nt7uGdltPrF973mhnFA9SVCRvEtu?=
 =?us-ascii?Q?SUoion1UTtjLSDeHRbLPWUCDsxWWylw1wZXHD1PtnAmkTiWTQE2Cz/Q+lkcP?=
 =?us-ascii?Q?oT/UCBH9LWmII+McxbwVXRdlvfVgVGdFs1wSY2Q69IfBJfs7GwYjLmXSG0Kf?=
 =?us-ascii?Q?v5jS+11Ys9VM1JHO0+3tpR9nreQOcx8nlGZ1qyQYp0kWpVXlRkXfjVX88NFu?=
 =?us-ascii?Q?Mdnj+kYBJxOCY9sLQjEsfFB1LTV5qMOg+WvVB2DzsjYHRR9sY6yv2Gdsy/SC?=
 =?us-ascii?Q?BQBrG+Cn4Btp1EEetLUyirzeIbPaegsBakZlnwUlsYsT4OWwneqpjWydTfUq?=
 =?us-ascii?Q?Ace9jRIVTtZ0wO2vbXBLxOqO+UuXWLhlCs08LrS/ZqBu5RPiTZFLnx1MXUL6?=
 =?us-ascii?Q?MgsDizk7yCy7ypSYGq113UnGwKMUQfLQQYwELJUdgJXjEjVWAtZR6J6VN7EK?=
 =?us-ascii?Q?VE0ALzU37noN6OidGLACxeaP0pQuIqYjjqZkqGBtG6Od27Aerf34BLkoYOv/?=
 =?us-ascii?Q?RmXzdqhkX9r+HH4y5VcknDjiQ0LR9NZSQZoAKclR82ZYins7qh1+D+aBuJ6/?=
 =?us-ascii?Q?DCuPs7n1OufpRXDLIeTPV+hN8QCDigJ+8nqw/4JhJZ4YhFmTAlo9WwikdQXA?=
 =?us-ascii?Q?vnBdU3Z1f+qzQA1N+vSlReAVvUxF9OuXZFon4NqSqGlI3DVJEd9Ei6szs0aV?=
 =?us-ascii?Q?SG9VPOXxWBE+z5rPZp1M1Yl7LSfiyIxfGwnzcKggnDKFxLNTmyr9gajbR1Nn?=
 =?us-ascii?Q?+1ANt2mwdGqCuF4PEWyconRwhC2u+l2HwUKaQcTJaTkncUX6RMswR8cpNbfm?=
 =?us-ascii?Q?o5LB8d6FS0AjjMpLvtUGgcs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6788668-04ae-40e8-ed9b-08d9d6777917
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 09:31:27.4761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgYglYkISPXWmvsQrzQkhg7dytCMaYVvYusTx3FiulBLOBdHS4ixdsRAv5WfXwx0OuroHs93K0PM4H35e71S7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7093
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With the AMS and Collision Avoidance, tcpm often needs to change the CC's
termination. When one CC line is sourcing Vconn, if we still change its
termination, the voltage of the another CC line is likely to be fluctuant
and unstable.

Therefore, we should verify whether a CC line is sourcing Vconn before
changing its termination and only change the termination that is not
a Vconn line. This can be done by reading the Vconn Present bit of
POWER_ STATUS register. To determine the polarity, we can read the
Plug Orientation bit of TCPC_CONTROL register. Since Vconn can only be
sourced if Plug Orientation is set.

Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
v2: changed subject line
v3: optimized the commit message and code according to Guenter's suggestions
---
 drivers/usb/typec/tcpm/tcpci.c | 26 ++++++++++++++++++++++++++
 drivers/usb/typec/tcpm/tcpci.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 35a1307349a2..e07d26a3cd8e 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -75,9 +75,25 @@ static int tcpci_write16(struct tcpci *tcpci, unsigned int reg, u16 val)
 static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+	bool vconn_pres;
+	enum typec_cc_polarity polarity = TYPEC_POLARITY_CC1;
 	unsigned int reg;
 	int ret;
 
+	ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS, &reg);
+	if (ret < 0)
+		return ret;
+
+	vconn_pres = !!(reg & TCPC_POWER_STATUS_VCONN_PRES);
+	if (vconn_pres) {
+		ret = regmap_read(tcpci->regmap, TCPC_TCPC_CTRL, &reg);
+		if (ret < 0)
+			return ret;
+
+		if (reg & TCPC_TCPC_CTRL_ORIENTATION)
+			polarity = TYPEC_POLARITY_CC2;
+	}
+
 	switch (cc) {
 	case TYPEC_CC_RA:
 		reg = (TCPC_ROLE_CTRL_CC_RA << TCPC_ROLE_CTRL_CC1_SHIFT) |
@@ -112,6 +128,16 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
 		break;
 	}
 
+	if (vconn_pres) {
+		if (polarity == TYPEC_POLARITY_CC2) {
+			reg &= ~(TCPC_ROLE_CTRL_CC1_MASK << TCPC_ROLE_CTRL_CC1_SHIFT);
+			reg |= (TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC1_SHIFT);
+		} else {
+			reg &= ~(TCPC_ROLE_CTRL_CC2_MASK << TCPC_ROLE_CTRL_CC2_SHIFT);
+			reg |= (TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC2_SHIFT);
+		}
+	}
+
 	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 2be7a77d400e..b2edd45f13c6 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -98,6 +98,7 @@
 #define TCPC_POWER_STATUS_SOURCING_VBUS	BIT(4)
 #define TCPC_POWER_STATUS_VBUS_DET	BIT(3)
 #define TCPC_POWER_STATUS_VBUS_PRES	BIT(2)
+#define TCPC_POWER_STATUS_VCONN_PRES	BIT(1)
 #define TCPC_POWER_STATUS_SINKING_VBUS	BIT(0)
 
 #define TCPC_FAULT_STATUS		0x1f
-- 
2.25.1

