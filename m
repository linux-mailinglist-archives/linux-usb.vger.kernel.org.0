Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07AF92F0AB5
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 02:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbhAKBRS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Jan 2021 20:17:18 -0500
Received: from mail-eopbgr70075.outbound.protection.outlook.com ([40.107.7.75]:21668
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726049AbhAKBRS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 10 Jan 2021 20:17:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnHRlJZrQhi9lhFGy/AhZuGp9s6vj8raO6xIJTTxgWCbimuHdrgr0lVVjwWHxnD2kyjLIL/GJehQbHxDs1a4AM44Pszv1GwqB+38bgTRDQyJQMaHXg7D3lX0DFRSUUN94JhUbJLDJ0eiDa8wBf2EhUnmx9dt+F3PfzCCWl2oDWyl7uOfh7rc8aGgMp41VVDpaJ1vsLz+TeC4xKnZ8ylEBBjkyym0F01oYg/mk1OHTWy/5hLP3Daj/zKxEGPIYELnD2+tFAnhxkM/djTfdYXKmLXb1TgaarZ9j/Z3Tp0ty245YnFfVZe2BqV7/f2fCyNSzrZPbb3ThoSxZZHVsIqNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHGP/u/ZKdYVeLC1fuHhx4pxmqoGianl/F1oUtsPxKY=;
 b=awU5kxJQAUg0AK4yvWRE2bAzQsoJhN6VlIT6m8mEtFSBjmkjpAAtEXvWVAQXNGZhmkrBI9mAJqY10Nc8CWrK560eu2jIffpXYHFblOHgFlEDWc8MEVH+H2KBq5cXd+OeOIZaVR71j4WvU9FnffEjiRgiM0CKjzE6TzlS0keCv3g1SOyroLPnaX6U6yKfell6qAzLIH3rKBUaRDqgtDNDbJslyARNQjmkMW+8w67BLGngN8nHeboT3hmh/DDTxZOC3V2HECHAD00AfSSFxegfPjrTg9a+xaUjFItzv1vhffGs6K19JN+oBglg2eYgCEFcCS92g7dQwXe1+/LJlKTX5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHGP/u/ZKdYVeLC1fuHhx4pxmqoGianl/F1oUtsPxKY=;
 b=ai99LVYasogyizcrlbRDz4SEwwkvYx/4OA7yYAdNgmltvTFpEA0nZfT2IaPQS8twr+tZbbLrF3HtFpZ0xfeFBTvK5GO15xlEavshR/IArDTi8ohcyvmzV7odi+6R+NO+r5xj1gGYanGGbOb7uLquCKtuf8fwuS+z4xgaeQgQV2w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Mon, 11 Jan
 2021 01:16:29 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::89de:bd7c:7245:f139]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::89de:bd7c:7245:f139%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 01:16:29 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] MAINTAINERS: update Peter Chen's email address
Date:   Mon, 11 Jan 2021 09:15:48 +0800
Message-Id: <20210111011548.25102-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0139.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::19) To DBBPR04MB7979.eurprd04.prod.outlook.com
 (2603:10a6:10:1ec::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR01CA0139.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 01:16:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6ea4e23-2922-4f0e-2241-08d8b5ce8662
X-MS-TrafficTypeDiagnostic: DB8PR04MB6618:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB661811510B3ABFE3689B77828BAB0@DB8PR04MB6618.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qwp8uIROUzLr9SA8YKBPFR1FAxE9mD7YED68VAdc9c7GAfCHfff6Y4XABT1cn3mY8gyIVlRfwVwh0GgKuhXF48nN0w8EXzCPQoispO089Tp8gh91I7t3Cuc7GSPY8m2y8xgz3Oj1T5MTsfkn67nQGIVmePC3rktAUY16RxK7UQ5+0rfAm3Zita+3xRaCwC9A2uyC6zEXDahBQ/6HYL2Y3ZbhF1pXU77+Qw/gLjV5sW9bm7Xtnq8GOEyQJWhh43Me77GGatnWse+s5gic58a+7vsCwTufTSD9NKTc+waCeXvQM9UBZCaBTraFamnPJcBXy4p9PqoJheQvWBk68vBjoXjo20zQNg4uKIfz5Ez5EEwr8X/srfR3AEgy+/1IcNNCqxTE9gfFBDUmKLiG/M7OpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(6486002)(66556008)(6512007)(66946007)(6506007)(26005)(8936002)(6666004)(86362001)(8676002)(478600001)(36756003)(44832011)(1076003)(2906002)(6916009)(5660300002)(186003)(16526019)(2616005)(66476007)(956004)(4326008)(83380400001)(316002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6Nx386cHyqcrR2/o2uiukWHtcP6zfqrq6PxlD9M7HjPGossPf2cuGJ+k/3Fo?=
 =?us-ascii?Q?GbDAgE2Qr1I/YhWeL/tDfEFFpBFWYMZGW6PaRakEncbbXiEl9F8o1koITiMj?=
 =?us-ascii?Q?HdJuyNi0z1NrrK+Klm61LX1QkzjlaiHJRqTEjCxF7HH8ekVXAaL1bn5d+oU2?=
 =?us-ascii?Q?lsrtWEz3FV8G7AEZpRzLMlBM2JBhFXXHXRRC3Rrtd10LaiI6Eo5byQE5ZcCi?=
 =?us-ascii?Q?y93MRIE3wr7l+lM7NY1n+zspKEq5/l0hCwVrvF23pPx5WujggxyYa6dbNRIr?=
 =?us-ascii?Q?XryXfC23CFnMD/1hQVJ3MkomJjDhOPEmHob0YwUmiYtNaDckmF9jv2kSHoOD?=
 =?us-ascii?Q?Ts+woKIE/0KNoPVa+Xnr03y3Otg0uDSARE8eJ59LHxUVqUNdNq4clSO7lue3?=
 =?us-ascii?Q?3NhrTkRYXJbEL+wFNM382E01bWCE5Ku/CF+kLDVKXJk2yKxhxarU/vhmFomR?=
 =?us-ascii?Q?06C0cqYWszfWW+9v3bGQXwjoIYwhsB8OHzKdFJyIXprD2JZUq5NM/Wa3Adlk?=
 =?us-ascii?Q?DbBDqmdRdLAHzH3JgX0hXxqA6r5kXWCXpnPt+LYG35AadFV+v0rTd0c8AuVN?=
 =?us-ascii?Q?v8ivxGopkb1Oz/bym/fyS+/NjOZhQl/p1gF7wN5cEPcQvpz6w/6R0DhMYXIY?=
 =?us-ascii?Q?fOJ1FYDnRM75GVjMBcUkMF9nNyviYCe4EDVw2ZirsRiBXbB/pkZvLpwL4cox?=
 =?us-ascii?Q?6ujlnuubI4UompgKOUyf2RV3lhLQqqT8c18v9UIqKjWFx/lZDd035k29lBPB?=
 =?us-ascii?Q?+31ypjYclPUXbdpyBFMlDJ+hiObfcIrq4H11ZJXrYDHpvc9676QL0V3pnctE?=
 =?us-ascii?Q?UZ4hMFhcuIsdZFcnxT7Tu0O/T6SoipWAttn0CF/08hNfVlPTqHJqlHL4c9gF?=
 =?us-ascii?Q?Cn979pw/R69BMLVokUXzMWdsPRg/AI/+8F52V4VSzuey50cLg4mj2BUtK5d6?=
 =?us-ascii?Q?lkLzIJ0HQ24NEaR18RCSYVdDG4dwMWdvtNOc15C7G4Rfug1V0fh96VPmstH0?=
 =?us-ascii?Q?KzHK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 01:16:29.4129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ea4e23-2922-4f0e-2241-08d8b5ce8662
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4m4Kufi3ClO1nDMxYVOaBIOnIbXzb3xql70MCpcMhhodkWm2NMXKvuB2NVLh7u/89ZDJIciBGkTdcJIYHJ3G8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Using kernel.org as my email address.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index afe3a5c66bc9..c16a2e83e176 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3881,7 +3881,7 @@ F:	Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
 F:	drivers/mtd/nand/raw/cadence-nand-controller.c
 
 CADENCE USB3 DRD IP DRIVER
-M:	Peter Chen <peter.chen@nxp.com>
+M:	Peter Chen <peter.chen@kernel.org>
 M:	Pawel Laszczak <pawell@cadence.com>
 R:	Roger Quadros <rogerq@kernel.org>
 R:	Aswath Govindraju <a-govindraju@ti.com>
@@ -4163,7 +4163,7 @@ S:	Maintained
 F:	Documentation/translations/zh_CN/
 
 CHIPIDEA USB HIGH SPEED DUAL ROLE CONTROLLER
-M:	Peter Chen <Peter.Chen@nxp.com>
+M:	Peter Chen <peter.chen@kernel.org>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git
@@ -18404,7 +18404,7 @@ F:	Documentation/usb/ohci.rst
 F:	drivers/usb/host/ohci*
 
 USB OTG FSM (Finite State Machine)
-M:	Peter Chen <Peter.Chen@nxp.com>
+M:	Peter Chen <peter.chen@kernel.org>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git
-- 
2.17.1

