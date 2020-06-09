Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A871F3990
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jun 2020 13:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbgFILXo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jun 2020 07:23:44 -0400
Received: from mail-eopbgr20076.outbound.protection.outlook.com ([40.107.2.76]:15630
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728730AbgFILXn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Jun 2020 07:23:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtiBWgcyIU9lmUH6A1Bs8j66GFJyl06RoM+7pfrvATluADaQ51WUe5VYPbFDyVYJH/R014jeWIHodfQE3cAxdFxKRWhNgYFrePihkJfFb51MOxL4X3Hc0NfVTZXEQ14jcEwqVcqTXQkKzCiJjErR/TZ4QAP8WufmxYQFGVCUYmUptFfdvNRPV1fxTPcwsWds823b4R2yEgsFPIb0wtPdZf4t2DThfLggQk7XkQ4+bBUYnjyLoiknul0Q0hwcrFF3sZwAHaCACPflqdyr/lZZHBmexwCR9PJE77Y0E2riLiNkCf1Aj0RQe56WvEp7pwD9onC3y3QqER706Ltm0lydbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2I4E5ymUx2K4KjoTr/nrL47JWnZ73Ap2qG5vG/4xz0=;
 b=aV1K3T2ujA+EPwON7iaKDwrvWjSi8lWJX4W1RITgDO7ZixdmpijGo9qWf5FDljod/xvjieKtX2ehdPXObFgp2z7GcSJfVyLUjsp5XRHN3aC/1P/MOBJkUC5bqJq/RkRRMovS9hIv3QyLqfD6/xZlZ+yx3mao6u6YZbKNh+tai+7kkkSqxfqkNw4Dl94uHfuzunRyhhhlWYBPmeGUypFJeqDJp5NplT8onpYtUBtFz1p3bCe207CNwyli7W58Qgx6ZGb5eeSv8dn/8eTV04+yp9YfyJSVb5tvUy1wdKf+Vni0R2HtsImMQ8WCbeon+7qkSNW/NDGdIsN7YRV4Vkavww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2I4E5ymUx2K4KjoTr/nrL47JWnZ73Ap2qG5vG/4xz0=;
 b=FU20Wls2fcZ59WiEPZPWYsjhIX88BaliCKNkyu8/s3ikVvYnGLT3nhkLbICSLsmXNkNRXzqTpnNEN+BPROyOer8O9Lsvd6IkROgABlH0G/QzLU/Mq3Fy84E4ywG81G69VZoEqRIfbxMyeDH5kKe1ghPtxNQVYSZGVFEZdf2AMXI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Tue, 9 Jun
 2020 11:23:37 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 11:23:37 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, peter.chen@nxp.com
Subject: [PATCH 2/6] usb: host: xhci-plat: add quirk for XHCI_NO_64BIT_SUPPORT
Date:   Tue,  9 Jun 2020 19:12:41 +0800
Message-Id: <1591701165-12872-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
References: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0069.apcprd02.prod.outlook.com (2603:1096:4:54::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 11:23:34 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d673955a-6ebe-4096-0576-08d80c678dc2
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB65893C6BCC8592269B33B87289820@VE1PR04MB6589.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MDd4rcd39QKst4NuCi21b8xBPhoqERF1GnAIyHNyeyzaLXP1JC+szA+4pvf/CQCUUAEX8aT1RGVgxcYQELVLf3RR7cw6g/fHayIeaCxXytF1cPmz1GYWEAMbBMZP0xmyoz3BOr3ciLZ9PVRRi4lqAnEy11Hpt9zZUZQw+gPmiNfPx83SWcJdejTTg7pwKnUeXSnlxesq0iOOeSpGhWQjXRyb47AkEFeSEqjmOuXufyasD/xJEI97qt4UmwH3tfFEaFLmj8vbohoS+4QhTHKb763xw9y9JdEt+taCJ/BFSWswLREbnQSkYWnPZMzFzZ6onTyGk/iCbXX8U1aMvV7lbgY8huHO+EH2x9N+WtunYl5Myrktio5evRsIXDG65LKP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(8676002)(4326008)(8936002)(66556008)(66476007)(4744005)(5660300002)(66946007)(86362001)(16526019)(36756003)(498600001)(6506007)(69590400007)(2906002)(6512007)(26005)(2616005)(6486002)(956004)(52116002)(6666004)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: naxa/der2HKEhyxheYmrOFYipNfsGKzeUcm4jvAsyGlfVaGjjZoZP0sMjEpIgN9JKKMKMMG8TXR0j8XcjvL2IKjxXyV/u3lY9SjQWgS5WYNAG79jPPikerhMjyZpG71c7n7NE8ZsamLkc/YsU4q3lCQJIdQFyBv4SijZH04NWBYaGC2n02+agH7seCu9svpH6cqV56tTcscdZ+/R30WT0b5cL90d4S+6gYqQLFOsw+pBjrY9muUCmMSNPodPhtzC5O+twBnbVF5DBIzFZtW5PRXiuDpNzz2Gt12GzENMkGrFYE7KOdq02HNED/rv5KwaMxi3yynM+AwKboOxFSPJn0DiAJx6bIJN6yyhg/lYPv+UaxPn1Zn8/LEsMEwTUYMwvgDFKODJix6qHkUGvtGnorn4MvgldrAVPwITdAdM9zOd2/DIv6+LR6yVsxYE617T3abUmeQGqOx6B2XPXNu7pJs34ExmI6GJtx95qrCF59U=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d673955a-6ebe-4096-0576-08d80c678dc2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 11:23:37.6150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxWbxQx7mCXZ1vxaiYkXQHdJD7TOz1SsAiBTuH57YvzpzsR4MSN/b9wVzy2PvTgB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6589
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some dwc3 based platforms may also have the problem AC64 bit (bit 0)
of HCCPARAMS1 set to be 1 but the controller actually can't support
64-bit address when SoC integration, so enable XHCI_NO_64BIT_SUPPORT
via dts property "snps,xhci-dis-64bit-support-quirk".

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 1d4f6f8..f782aea 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -290,6 +290,10 @@ static int xhci_plat_probe(struct platform_device *pdev)
 
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
+
+		if (device_property_read_bool(tmpdev,
+					      "snps,xhci-dis-64bit-support-quirk"))
+			xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
 	}
 
 	hcd->usb_phy = devm_usb_get_phy_by_phandle(sysdev, "usb-phy", 0);
-- 
2.7.4

