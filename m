Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBD9615A101
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 07:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbgBLGFq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Feb 2020 01:05:46 -0500
Received: from mail-eopbgr30059.outbound.protection.outlook.com ([40.107.3.59]:63982
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726448AbgBLGFq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Feb 2020 01:05:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUJr65OTmGF+5h2HLAWwhmUClixfEzzEavG4y7+/OSamMxhB/zWybrvbVVYVsOhsO+5UAZ6Zxmz94ek3n8l+C8em4rNI7iHcpfGfIHZFO8fvEVMtcFjM0FEakvCGgNn/ydIWB4xd2zqHej5ihCJEp44Lw/zcHir9ZYslAeEjOkHPGtrbiImRZUIu5yLsQp2Td5mJ2Qtbz4vnBoJ88TQMrewNQJ4qfOfr8Jw3xnOMU7BVQgLE/jg6RQsG2lj43wDxu+TbQ/dC/ZsWsW0yzyDcvSF8xIlkJm/swqSQ4gbvWWkfKEhhlsyOqagIQFXzjurOnslgZSXOoI59PEsPKfWtOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk4Z26g2ydxM5ZVR1bLQPEcCwcCYJ74o3YGkCY41yrg=;
 b=DBgN1QMTlgOzqUuizc3WauK/xL6GFX4phN+2DSGQmoyUqVXLuvus729e+Pif5jF9agAPEuLL0MuhZjLW2QEoE2hF+ewN2GJfvnqqukL/HI86M1LyNSEJDyQMjNYZ5zI157E1mNRLHVAGec0F+x6Vq0Xi1WkAmWqx6h5dN9HtPSR1fdzF46uit48Sy+Sf/Tf1lgIJPRzap2nQSSV548A7+JxUOW7bFPVRQbF6sqO0m2zR9RNNaKsinUpK9ORzNvvmmPbf/nGKfPYCXmc1z6OGWLSZi+UHiuwuh7hUXKPEPJeK1ZcmVA8sY2WP+gO1hMnbmG3qVI83ePDOkBoiUJmAlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk4Z26g2ydxM5ZVR1bLQPEcCwcCYJ74o3YGkCY41yrg=;
 b=AL2Kxt0sj/ZeVgBuVS/YkNvXdervNDfMDumgeveSeXeh3viapqSRuE0HpDhSwqeYf2UaPcIQBd+7KVjEsbso1+sfq0Oo+t6ovwGo/gtx3KKD+Fwa1kEA4ryW040yvZOi1IqNEyN64mD6q6SfiuQ9s0GkVvmatNJ7HmV5qdjEfqQ=
Authentication-Results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6592.eurprd04.prod.outlook.com (20.179.234.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.27; Wed, 12 Feb 2020 06:05:41 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3%7]) with mapi id 15.20.2707.030; Wed, 12 Feb 2020
 06:05:41 +0000
From:   jun.li@nxp.com
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, jun.li@nxp.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: typec: tcpm: set correct data role for non-DRD
Date:   Wed, 12 Feb 2020 14:00:03 +0800
Message-Id: <1581487203-27499-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2750.1 via Frontend Transport; Wed, 12 Feb 2020 06:05:39 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: be1dcbdc-1268-453d-7167-08d7af8196da
X-MS-TrafficTypeDiagnostic: VE1PR04MB6592:|VE1PR04MB6592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB659289313C3814BA83523AED891B0@VE1PR04MB6592.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 0311124FA9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(199004)(189003)(86362001)(16526019)(4326008)(6486002)(186003)(26005)(6512007)(9686003)(52116002)(6506007)(478600001)(316002)(8936002)(66946007)(6666004)(36756003)(69590400006)(81156014)(81166006)(66556008)(66476007)(8676002)(2616005)(5660300002)(2906002)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6592;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EVH6sO1EMsqoc+MiOo0THlAEpqr3TM+8xZCu1xZDEBYo07q9AfNyTKKQWtu114HBtro+2MMtbceZ6n40LeiW08t8v64XYmrRgN4FNSChJ4SqyzvghJYEppzyAon3e5iMHmKLFzFcQfWfQNcKSRTF5nIxiRUH/vX8t6dEB6kiKziW0UvWaCYTvsyU7U2AtgGVAZChk2BTYbcB6e2O8w2O98vfpm3K6ajDIY29BNDeBAYF+YCxB+dPSZ7qLQrXZNebQ2wOnyUWlOjdaXSjVaJAKCrcDtYuCtoKB61upOs1b3EyHXNZjF0kHGLjpnoPx+rGP57IU2CQYlUj6v91/jNBr1JyHoIVKsdDP5O0/00rroEsM1GcxH4ZNNAqAzBnOS6/VFvBno7K29nNqS7bUZRxnO6KH+ZXHQw9qU4WRitEt5S2cKPrTml1YawQ/Q5fjKuXSXbKTG1o6thKAMAvw/Jm9WeQ6mOpjlRcvYI9nSKofvVN1sVFXEZyhKDqJL4cGDioSPdL9l9Xwrtv5twbBvwVlPlfG8KnVDDU+2iJlGp6AIs=
X-MS-Exchange-AntiSpam-MessageData: 3ijMVdQxRqynU2V8/+PRF5q0A9XPKXrCoeklGL0KlHWB3HX7JFwDXtYuAmueeG7eWuP4Ugeere/CDLrBrV361AjvfMlYYHI/JfWLAbVMelVaOIltT8Z6xE6SrhJKywq96ZV4LkWSbrf1qFG/33yhOw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1dcbdc-1268-453d-7167-08d7af8196da
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 06:05:41.5073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCaMp4vrc4UpMNqrD1ltLwCm+bk2V7P2UV57MjBv4uC2/P3lJbZGbnV5eOpbW7FT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6592
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

Since the typec port data role is separated from power role,
so check the port data capability when setting data role.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 53 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index f3087ef..7009644 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -788,10 +788,30 @@ static int tcpm_set_roles(struct tcpm_port *port, bool attached,
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
@@ -1817,7 +1837,7 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		tcpm_set_state(port, SOFT_RESET, 0);
 		break;
 	case PD_CTRL_DR_SWAP:
-		if (port->port_type != TYPEC_PORT_DRP) {
+		if (port->typec_caps.data != TYPEC_PORT_DRD) {
 			tcpm_queue_message(port, PD_MSG_CTRL_REJECT);
 			break;
 		}
@@ -2609,6 +2629,9 @@ static int tcpm_src_attach(struct tcpm_port *port)
 	enum typec_cc_polarity polarity =
 				port->cc2 == TYPEC_CC_RD ? TYPEC_POLARITY_CC2
 							 : TYPEC_POLARITY_CC1;
+	enum typec_data_role data_role =
+				port->typec_caps.data == TYPEC_PORT_UFP ?
+				TYPEC_DEVICE : TYPEC_HOST;
 	int ret;
 
 	if (port->attached)
@@ -2618,7 +2641,7 @@ static int tcpm_src_attach(struct tcpm_port *port)
 	if (ret < 0)
 		return ret;
 
-	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, TYPEC_HOST);
+	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, data_role);
 	if (ret < 0)
 		return ret;
 
@@ -2730,6 +2753,9 @@ static void tcpm_src_detach(struct tcpm_port *port)
 
 static int tcpm_snk_attach(struct tcpm_port *port)
 {
+	enum typec_data_role data_role =
+				port->typec_caps.data == TYPEC_PORT_DFP ?
+				TYPEC_HOST : TYPEC_DEVICE;
 	int ret;
 
 	if (port->attached)
@@ -2740,7 +2766,7 @@ static int tcpm_snk_attach(struct tcpm_port *port)
 	if (ret < 0)
 		return ret;
 
-	ret = tcpm_set_roles(port, true, TYPEC_SINK, TYPEC_DEVICE);
+	ret = tcpm_set_roles(port, true, TYPEC_SINK, data_role);
 	if (ret < 0)
 		return ret;
 
@@ -2761,12 +2787,15 @@ static void tcpm_snk_detach(struct tcpm_port *port)
 
 static int tcpm_acc_attach(struct tcpm_port *port)
 {
+	enum typec_data_role data_role =
+				port->typec_caps.data == TYPEC_PORT_UFP ?
+				TYPEC_DEVICE : TYPEC_HOST;
 	int ret;
 
 	if (port->attached)
 		return 0;
 
-	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, TYPEC_HOST);
+	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, data_role);
 	if (ret < 0)
 		return ret;
 
@@ -3293,7 +3322,8 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_set_vconn(port, true);
 		tcpm_set_vbus(port, false);
 		tcpm_set_roles(port, port->self_powered, TYPEC_SOURCE,
-			       TYPEC_HOST);
+			       port->typec_caps.data == TYPEC_PORT_UFP ?
+			       TYPEC_DEVICE : TYPEC_HOST);
 		tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
 		break;
 	case SRC_HARD_RESET_VBUS_ON:
@@ -3308,7 +3338,8 @@ static void run_state_machine(struct tcpm_port *port)
 		if (port->pd_capable)
 			tcpm_set_charge(port, false);
 		tcpm_set_roles(port, port->self_powered, TYPEC_SINK,
-			       TYPEC_DEVICE);
+			       port->typec_caps.data == TYPEC_PORT_DFP ?
+			       TYPEC_HOST : TYPEC_DEVICE);
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

