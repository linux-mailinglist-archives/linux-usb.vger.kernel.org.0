Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F242585A4
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 04:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgIACe0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 22:34:26 -0400
Received: from mail-eopbgr80041.outbound.protection.outlook.com ([40.107.8.41]:62222
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726085AbgIACeZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 22:34:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iH9vgvwF56lrNpD97ahgVXDAFksr3LvLjfV1+Dfo5QIpsGxFh57N9pFO1Gz1kzIj2BgrrSM47l491VgeRNaEhSM9U7aXceyysSSuxTAKFUfGvAdi0d0Mxx/38tor8tq+Cbq7nqIpD5iR6ArRvUGapzYDp+FkK6hBcCOJnC0PXKPD+9w0y4utv+M0enAY263SRVmAMJIYk6DOEUXDr9+6/L0+Xwab6/NsaLBTH+rW3qHMI9RH6TOWZplkZSJtM2hqcflmSkMZ/y/HCrvVZe8cOCE8ApUYUo0RnZ1xqKE6/BwrXWzRFjLc0X7yjfa7dIjCklcK/63TxmYkpF6n5jA/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsvBjETSvift2/BFN3OIEpBPLCA54eKlmaTScReFHIU=;
 b=XiU/U0RyR5k51ddRg/HrWoy7C7agzjWgp7NAzO9PgpdIX5hh+AnZZ9eMP2qMbiCd/9+Eqt3jRM27H7oL30rp4mifXDpnx+6dL8zK6Vw8BZHAerSz9b/rQkNdsgdEarjM+aAT3gMsStd3RcvIUCrpvVCmkV/K5rGcU6U/f/y1RzedbDdwzTlUn/qZjgJcEfScvEWnPbPaEtUq5CZpVgv95lI3bGPBGJcegU/cLNYYkEYuqopQo6bRuUjsiZLGpqDUnOODZn2kVsgd2e7xG2jypiTvFGHZqaWLTOfTq64Opg0+dX0KcWbssIbudbIkhAK4fylM/W54UMxVdHloBnIRig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsvBjETSvift2/BFN3OIEpBPLCA54eKlmaTScReFHIU=;
 b=KyA6LgJTenmdGdaRIw9e5quEQYIHq0l12+ARPlAuTvIOmKVp5cxp2nmF1dV6XcwuO+CfNL5hsWeu7d7Wl1f+ZfFIGtHbBQCYEnHAFMqYbDceRWLKBQAxxPKvtOlUFCfPpoaIKoJDmAGQEF/HJJbVnCFK6MpcdfL7GgQu6lJajUo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6998.eurprd04.prod.outlook.com (2603:10a6:20b:10a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 1 Sep
 2020 02:34:23 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 02:34:23 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/5] usb: cdns3: core: quit if it uses role switch class
Date:   Tue,  1 Sep 2020 10:33:48 +0800
Message-Id: <20200901023352.25552-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901023352.25552-1-peter.chen@nxp.com>
References: <20200901023352.25552-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR02CA0046.apcprd02.prod.outlook.com (2603:1096:3:18::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 02:34:20 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 023a7871-5006-4a8e-bca1-08d84e1f8977
X-MS-TrafficTypeDiagnostic: AM7PR04MB6998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6998B6C65588C1B3E113A6298B2E0@AM7PR04MB6998.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qmVACrpvgrrrD6gmR44gXKFgwqszfgZgBTbhz/svDVxIXC2f1ZdmPjo3GIKMWXBUxK5lmg3xB5tdVzhhYYa7iRqQoH/QMW1TiXI5WTihRET7Nmiicuwmec9owcnHNem9ToisMXXr8P9BC0qwdZFId6/vKsG80CkrI95pyjs5aZcI7IMXwWopDbP5ojKbGhO6kLjMotrEffMJXE8UhwC1fCnduTkvGi685bsL6x7OQJn2VJXmsTklfNQEq5TvlTwJJw5FkI5Y39dWe9khOAsw1oRQnQ1d4ogLkLQTYA0EDXrOhLam1rlWXT+DoNsj5vGtHhWvpoD9gtpqXdAVKfViXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(6512007)(6506007)(4326008)(16526019)(186003)(1076003)(26005)(4744005)(478600001)(6666004)(6486002)(2616005)(52116002)(8936002)(2906002)(6916009)(36756003)(86362001)(5660300002)(8676002)(66946007)(956004)(66476007)(316002)(66556008)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: yNbT9kCiI4w40o3+D45P9wBZdn3aScB8F8hb52Cd2RnKnoUcnBgY+PnKho1WSxxTIITp7uY9jyiM6yYznf7XZXoVJYO9/TBASwioWmMkVMLUE/nZa78BHa4Lb1mwvPRY5up/vYSFdg6CDa7D6y+BEvmD1FayOE5I+l2CDMosOv6Ft31+EcF/YZY3ag1OLu20+5dsvUEtgy7yTp69V94qWFvq8JkaT9kd89/Pew0AA6FtN4uaojI5hCjbHT2fq3IyvvQ7MRibUyURhArdJT5WaUmXkN+wrPFDQ46TZNsNXv3hzd8Wgz8kysX3l2UyNR27OEmJVIpiybIawWljxmZcqcEVSetpZhtEzMyvwx1/95sYd1H2hdBodxyO59aYY2OynJ/ptjcE8wo0iUgVmrsgiH7RysvMic3uLpgoVoXQx0g5FACAw9FgTtQzCZljxkEl9Ar+4W4/c+v5Oji+8iCRCmVucrmEtI3WAuP/RYmz9JZ1IAhKxfzxPn/iyhmAR+xkXCFXJaftFVPC6UNfN4m62Xq3IFGsQ1E7oTZ65QbldO2/ioKa/Xyb/kN4+IRBE22N3mOoCR2I4RZMGLDpNfqsDU9l8dw4lsSEm9/z83zNTAIqQiRQVlQgjHVbg08S8voovQWMF/Sr1JIINa42MMzlig==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023a7871-5006-4a8e-bca1-08d84e1f8977
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 02:34:23.3688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebGq5aH4hgTLqU5yVLYhEYAWSpKWPyOMOHT2aWMzIB6H9w7YfjRBZkzlTLJNc7LwwMBI98TDxyQUoSMH0P18vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6998
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the board uses role switch class for switching the role, it should
not depends on SoC OTG hardware siginal any more, so quit early.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index faee5ec5fc20..96c2da4e20c5 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -280,6 +280,10 @@ int cdns3_hw_role_switch(struct cdns3 *cdns)
 	enum usb_role real_role, current_role;
 	int ret = 0;
 
+	/* Depends on role switch class */
+	if (cdns->role_sw)
+		return 0;
+
 	pm_runtime_get_sync(cdns->dev);
 
 	current_role = cdns->role;
-- 
2.17.1

