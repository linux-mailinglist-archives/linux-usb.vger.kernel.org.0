Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E10815D34D
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2020 08:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgBNH7e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Feb 2020 02:59:34 -0500
Received: from mail-vi1eur05on2075.outbound.protection.outlook.com ([40.107.21.75]:6022
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728691AbgBNH7e (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Feb 2020 02:59:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bm1W7Z78w8oJcxpCjQp4q5oN9jiTisDNRyvSYtPwyz5IprOg7tDXVIJDSoEw6YxEn8Z4ZXbvP6kt+td4HemABABUeNcz5FNkqQpyBtJ5DsL1IREU9nW0ISDq9lXUuhAq/juTRKg6/lPuBqGXWa15zyqofXt2zpCyZGl2yaSEH1+zytZU9N1PDLHgepUhc7yHK5+ZiR/9NQZ63qR750a3/emNDz6wJ+lgBd5IxI3c73AelD/R05GlnfDDsojKXPyQ0DCX7o1UHWLF/CQEGXaIg2ZKA35B71g5Afca2kEFO9R480qMgCxaL18922hKaQB6wiGmiF+Sw9765s/0SAry2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPLcOE05QySd96suJ4yVyS5+pD91ErsaCNrbu4h0ctU=;
 b=BzXcZ9qESUjBvgMlqTAvi8tGWcF5+V+gMEN18ZOoQ1n/sOMJdhHjhtP1bRpoLhUIf3K+uOZKwXyVV6pkRTjR4LHY72CUlhj2XZdVRfimBQbh5agEr0DAzS6bbnEutwsDIhDuVtvfJEmC1nbRxAwsXZrzGbyjYSn/sF8RvFPsGUSisxSsAK52NoCoirw2QRoEoluVDZ5mvKpkIFnffOXBqM/DsnGJ6h2sKEczSqxaXl6e3uHrHGXw9FFamG3rLvmaguG4K5gKHEIwyIawtB6NWOHLMyjQBZZBosq64LSgRY1VLWD0IPFuhQ7XUxBp08UvuUhFv0mw+VruyLFPSZSG2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPLcOE05QySd96suJ4yVyS5+pD91ErsaCNrbu4h0ctU=;
 b=XT17a7bt0K8+ArwhP4798NDqUp49JYaDdD5djepSs6IEZKX5xovf6j8suQhxDoo1KxS+ysUbcpBHS906fiR0gpY2URGqabNYOG34o+Bc4+Hk7cRelNbRGD3QPV9dAImONLd1Xm/jtwpWox0iolJVcfHhGkI12I0scePDuheYnCQ=
Authentication-Results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6735.eurprd04.prod.outlook.com (20.179.234.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Fri, 14 Feb 2020 07:59:29 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::ccb0:7d6d:adfa:423c]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::ccb0:7d6d:adfa:423c%4]) with mapi id 15.20.2729.025; Fri, 14 Feb 2020
 07:59:29 +0000
From:   jun.li@nxp.com
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, jun.li@nxp.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org
Subject: [PATCH v3] usb: typec: tcpm: set correct data role for non-DRD
Date:   Fri, 14 Feb 2020 15:53:48 +0800
Message-Id: <1581666828-2063-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0117.apcprd03.prod.outlook.com
 (2603:1096:203:b0::33) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
Received: from localhost.localdomain (119.31.174.66) by HK0PR03CA0117.apcprd03.prod.outlook.com (2603:1096:203:b0::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2729.25 via Frontend Transport; Fri, 14 Feb 2020 07:59:27 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4bc8c181-8363-4d66-c764-08d7b123d158
X-MS-TrafficTypeDiagnostic: VE1PR04MB6735:|VE1PR04MB6735:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB67352FA5024BDDA1493199AB89150@VE1PR04MB6735.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 03137AC81E
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(199004)(189003)(6506007)(316002)(2616005)(26005)(956004)(8676002)(6512007)(81156014)(81166006)(186003)(9686003)(5660300002)(8936002)(69590400006)(16526019)(6486002)(4326008)(86362001)(478600001)(6666004)(36756003)(52116002)(2906002)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6735;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +4NDBAeAnzkZ6h5JRSoXIyawZ8LcbKy3VkeBNVfaKWsJS5lSwOD90NlpEPdcRZZoFk7+mQpJpTOdXthzwTB7rDfzhbQYb4SHVs2tJ0cGijiQlUXmEaA6CgSEMS7DlKyc0ybO5tTHjotKAeTGx/CQu/UOgEmrwTL1VsmSF6yrsL6IPxHVf0Jo0ZSBOAHnMvo94VZh0NE+K8s98ui+UkRJaZsaPudICgH0TYkg6JMIniiELUjpuBndssl7Qj+zyrSgQG2uGkGFuvEUegS2gcrgeFMgicX/C2T8BbCl94JX26dpb5AIYyqgCEe5yc4IjK4ygS37irGLsV1q1qNXUheeZkENeT6P/tifvMu9zF8DwEzxMdEzx26f8S8f2MqdB6MLWhkb9jygyOljvFt5IE3sFtZolqP/+PFIf72FL6BbKqDxX8U5+phPZohTFQ21GICqBlBfTFHPeJf3J1BE+NHmnq48WmL9BaMQPNgDcK2WNNQuauRx0P/PQbI8MCi74MOFFJY1J5QneaF5urUU4utrCp9FHzpt3rvJ8Za2zMlefdQ=
X-MS-Exchange-AntiSpam-MessageData: V0MW/TO03Up2Ouf5sBKfrxdoyEomCijNI0P1aLyzNLtIkCPc0JFxiQlrkMl/nGbTXczge3L5i9hV2aCxwnS7NrrDC4BCB1a2YEvaTlDXFCIxQQ8/otbsa1shxI33l0+DI1vishbOYCNEmC0QAj0FgQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc8c181-8363-4d66-c764-08d7b123d158
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 07:59:29.1971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOpFIfWu2w0NUSoJzKp49s4LMnOCfohuUHYyElYMKtfrxVG1niG5p7RfP6J/F486
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6735
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

Since the typec port data role is separated from power role,
so check the port data capability when setting data role.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
change for v3:
- Use 2 macro to get correct typec data role for source and sink
  according to port data capability.

change for v2:
- Pass the right typec data role when call tcpm_set_roles()
- Return error if the pass typec data role is not supported
  in tcpm_set_roles().

 drivers/usb/typec/tcpm/tcpm.c | 53 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index f3087ef..78077c2 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -373,6 +373,14 @@ struct pd_rx_event {
 	((port)->try_src_count == 0 && (port)->try_role == TYPEC_SOURCE && \
 	(port)->port_type == TYPEC_PORT_DRP)
 
+#define tcpm_data_role_for_source(port) \
+	((port)->typec_caps.data == TYPEC_PORT_UFP ? \
+	TYPEC_DEVICE : TYPEC_HOST)
+
+#define tcpm_data_role_for_sink(port) \
+	((port)->typec_caps.data == TYPEC_PORT_DFP ? \
+	TYPEC_HOST : TYPEC_DEVICE)
+
 static enum tcpm_state tcpm_default_state(struct tcpm_port *port)
 {
 	if (port->port_type == TYPEC_PORT_DRP) {
@@ -788,10 +796,30 @@ static int tcpm_set_roles(struct tcpm_port *port, bool attached,
 	else
 		orientation = TYPEC_ORIENTATION_REVERSE;
 
-	if (data == TYPEC_HOST)
-		usb_role = USB_ROLE_HOST;
-	else
-		usb_role = USB_ROLE_DEVICE;
+	if (port->typec_caps.data == TYPEC_PORT_DRD) {
+		if (data == TYPEC_HOST)
+			usb_role = USB_ROLE_HOST;
+		else
+			usb_role = USB_ROLE_DEVICE;
+	} else if (port->typec_caps.data == TYPEC_PORT_DFP) {
+		if (data == TYPEC_HOST) {
+			if (role == TYPEC_SOURCE)
+				usb_role = USB_ROLE_HOST;
+			else
+				usb_role = USB_ROLE_NONE;
+		} else {
+			return -ENOTSUPP;
+		}
+	} else {
+		if (data == TYPEC_DEVICE) {
+			if (role == TYPEC_SINK)
+				usb_role = USB_ROLE_DEVICE;
+			else
+				usb_role = USB_ROLE_NONE;
+		} else {
+			return -ENOTSUPP;
+		}
+	}
 
 	ret = tcpm_mux_set(port, TYPEC_STATE_USB, usb_role, orientation);
 	if (ret < 0)
@@ -1817,7 +1845,7 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		tcpm_set_state(port, SOFT_RESET, 0);
 		break;
 	case PD_CTRL_DR_SWAP:
-		if (port->port_type != TYPEC_PORT_DRP) {
+		if (port->typec_caps.data != TYPEC_PORT_DRD) {
 			tcpm_queue_message(port, PD_MSG_CTRL_REJECT);
 			break;
 		}
@@ -2618,7 +2646,8 @@ static int tcpm_src_attach(struct tcpm_port *port)
 	if (ret < 0)
 		return ret;
 
-	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, TYPEC_HOST);
+	ret = tcpm_set_roles(port, true, TYPEC_SOURCE,
+			     tcpm_data_role_for_source(port));
 	if (ret < 0)
 		return ret;
 
@@ -2740,7 +2769,8 @@ static int tcpm_snk_attach(struct tcpm_port *port)
 	if (ret < 0)
 		return ret;
 
-	ret = tcpm_set_roles(port, true, TYPEC_SINK, TYPEC_DEVICE);
+	ret = tcpm_set_roles(port, true, TYPEC_SINK,
+			     tcpm_data_role_for_sink(port));
 	if (ret < 0)
 		return ret;
 
@@ -2766,7 +2796,8 @@ static int tcpm_acc_attach(struct tcpm_port *port)
 	if (port->attached)
 		return 0;
 
-	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, TYPEC_HOST);
+	ret = tcpm_set_roles(port, true, TYPEC_SOURCE,
+			     tcpm_data_role_for_source(port));
 	if (ret < 0)
 		return ret;
 
@@ -3293,7 +3324,7 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_set_vconn(port, true);
 		tcpm_set_vbus(port, false);
 		tcpm_set_roles(port, port->self_powered, TYPEC_SOURCE,
-			       TYPEC_HOST);
+			       tcpm_data_role_for_source(port));
 		tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
 		break;
 	case SRC_HARD_RESET_VBUS_ON:
@@ -3308,7 +3339,7 @@ static void run_state_machine(struct tcpm_port *port)
 		if (port->pd_capable)
 			tcpm_set_charge(port, false);
 		tcpm_set_roles(port, port->self_powered, TYPEC_SINK,
-			       TYPEC_DEVICE);
+			       tcpm_data_role_for_sink(port));
 		/*
 		 * VBUS may or may not toggle, depending on the adapter.
 		 * If it doesn't toggle, transition to SNK_HARD_RESET_SINK_ON
@@ -3969,7 +4000,7 @@ static int tcpm_dr_set(struct typec_port *p, enum typec_data_role data)
 	mutex_lock(&port->swap_lock);
 	mutex_lock(&port->lock);
 
-	if (port->port_type != TYPEC_PORT_DRP) {
+	if (port->typec_caps.data != TYPEC_PORT_DRD) {
 		ret = -EINVAL;
 		goto port_unlock;
 	}
-- 
2.7.4

