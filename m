Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0B316498B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 17:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgBSQLl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 11:11:41 -0500
Received: from mail-eopbgr60047.outbound.protection.outlook.com ([40.107.6.47]:55782
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726528AbgBSQLk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Feb 2020 11:11:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQakJ4sc224jRkB8GzlcRvHQPQVHGJh0kaFoSWwp2eZpVmq8HY7Adopxtjtwpy+57WrKLSzNMXrMKkA6Nfw7EUks96JNDDVXmlIEsuf1kdLyJLSGtyKCd9z7rfRL4IeG04IAinWGUocyu0XAq+4glzdewOT0peYOAa9xZD4rosCl/a6AipSbcSyjdTouENskxjhHoZi2X4BPE00mtTU++cqtzQG9sUnZkZtVo1sSf0OJyXW99EYLmP/EERk15UBiZ0NajsAW96PnG+Fiz0KKhdCcQUmRSf0lb5ywdGgHLVhVTcMIL4HlViwzSYBSkU/hyf9/yk9r0T76mSB7O3J3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3RJ+hjpTY8t4hVXg6RB6YItCXY6cbWF0gKwTTsZLuk=;
 b=ZfpWuFrAyPTnG67l9dmfaLoz/DAvJzzpPXREVENhok4FtPJDD5pXd29txTWncRhmA0Xmeyc/xWA5GnV+CwTfTEnYD8Cb2nDzQW+wk+kW3fNwVGZB4KTpqLNPR0FJp9yUraUEqsb9XcCV69oT2S+VqugxsCfv6zOkxE2Gh5t56dc0dxhHOIIX8p1KcPfzQ4RfaVe4xr/KWgivLc8HzErRVdXaYVnfps0Y/K5obH9qEpSWSiUjKL1s4TNNXWBR1Asw5ll3+OkesUef87aZF6gezPQe6/WDXYMgLbTWmpp/JWtydBjK/mY3wu13eNgDib+mX5NWKPmY1FR2IZKwHPsOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3RJ+hjpTY8t4hVXg6RB6YItCXY6cbWF0gKwTTsZLuk=;
 b=kVhUxP4SyiaqwRAQoZZ2RZtA4jvkyrnL7BAtSiwS+tx4PHhPCwYcXyjc+7q0nPr2xd0jxJYtra6uAWw/P2NTc5Y+mA9HxyGbmXZwlUjl8VamovIOHC9FSs4DChUv4vbFRpDb0h+/mXPDXFAPsVNZVbMtLBbVwmXR1gNVif2X4ac=
Authentication-Results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6607.eurprd04.prod.outlook.com (20.179.234.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Wed, 19 Feb 2020 16:11:36 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::ccb0:7d6d:adfa:423c]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::ccb0:7d6d:adfa:423c%4]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 16:11:36 +0000
From:   jun.li@nxp.com
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, jun.li@nxp.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: tcpm: move to SNK_UNATTACHED if sink removed for DRP
Date:   Thu, 20 Feb 2020 00:05:43 +0800
Message-Id: <1582128343-22438-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0056.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::20) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
Received: from localhost.localdomain (119.31.174.66) by HK0PR01CA0056.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2750.18 via Frontend Transport; Wed, 19 Feb 2020 16:11:34 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed67278d-969d-40b2-85d2-08d7b55664f9
X-MS-TrafficTypeDiagnostic: VE1PR04MB6607:|VE1PR04MB6607:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6607D69BA68326C02BD3CC1189100@VE1PR04MB6607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-Forefront-PRVS: 0318501FAE
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(199004)(189003)(81156014)(86362001)(4326008)(6486002)(186003)(52116002)(36756003)(26005)(478600001)(2616005)(81166006)(8676002)(956004)(8936002)(6666004)(6506007)(66946007)(2906002)(66476007)(5660300002)(69590400006)(66556008)(6512007)(9686003)(16526019)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6607;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JAm2DqHfytZdwS08oh7xuKu6X6BjgMeheZ+g5xJke/c1bBkSB9j/1kTIlWXwzp+TWLfyFq8bp/CvXppvUHOrtc5ofVaBzdLWhn18RNsVU0ct1rJWU98/gIPdLjFiqzZTkM8Y0V9gqX4ROUFk+uJHcT0T6YzKLnoiiTdrTf1Bf3uizU/WcPCrUE3Mr5lChnvvmPmgcwlGwlbImyEf29FieU6tn2OnRqGOrnsLMNbsJYc5kUKyKUslcTNeNakzBTRt5j1Qtz4AwjKkkIsRO0uV2tydAAFv8igtFgsA1T+uP9TOWPilxKLIKUExLeiq1fMwE3TJnvKU/eCufmPa1sRR9nIosfK6NjeKATtO+zyCLLEES6y3uMK9zbYyPkgq69TZsBeRYTGu7MYvvcwc7AwnTSJd6C7U86aHH+aR9aDt3ouwpHl7BcQljU155OP5ioZLuGUBwPKWetGo905UFQp/rbf7ADYyttkj9GZPTsSuasfvIJxASV84z4OjHGvWPaSykK38mZdaxQkwKK9fjWgCiypQQbRy/hfbXK9OKmVwVUs=
X-MS-Exchange-AntiSpam-MessageData: o0OWCITWVFjN2/qwNgMEAMJkM2thMrbC5zD1/r0IZL9qJ7f36ZhaVDKqSH0aWGibzxC8AS7u+EbzyqgPOFY+xekl3qQaraV8BMqlfU6qDK/3TOI1a8sBdgYkAurK3tP3ZlJOOW3KuUBVZOysaYvuuA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed67278d-969d-40b2-85d2-08d7b55664f9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2020 16:11:36.5321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvh4Kw/jXmgraIqFGQ8807Uxmv6AIqLtR8uOMYojymuuDT8lKjblGSDd2ej85OVZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6607
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

Per typec spec:
Figure 4-15 Connection State Diagram: DRP
Figure 4-16 Connection State Diagram: DRP with Accessory and Try.SRC
	    Support
Figure 4-17 Connection State Diagram: DRP with Accessory and Try.SNK
	    Support
DRP port should move to Unattached.SNK instead of Unattached.SRC if
sink removed.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 78077c2..3174180 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3680,8 +3680,12 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 	case SRC_SEND_CAPABILITIES:
 	case SRC_READY:
 		if (tcpm_port_is_disconnected(port) ||
-		    !tcpm_port_is_source(port))
-			tcpm_set_state(port, SRC_UNATTACHED, 0);
+		    !tcpm_port_is_source(port)) {
+			if (port->port_type == TYPEC_PORT_SRC)
+				tcpm_set_state(port, SRC_UNATTACHED, 0);
+			else
+				tcpm_set_state(port, SNK_UNATTACHED, 0);
+		}
 		break;
 	case SNK_UNATTACHED:
 		if (tcpm_port_is_sink(port))
-- 
2.7.4

