Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC34538882E
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 09:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240267AbhESHdS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 03:33:18 -0400
Received: from mail-eopbgr140081.outbound.protection.outlook.com ([40.107.14.81]:32741
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239548AbhESHdQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 03:33:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSmeyw27Uw2eQ8o+dTeJGWEwUcR0riKdCvm69Ui8Uqxd3Dhzy/1me1/QlMulriTZfpZOk08R1kBQpsQ3CZz6MqKVvjGyjN6IE2bTOJ3aHS9Ygo8YbbpvXMj9jrh3OQquSbrqpVObndsZBXk2xWY5qdlOD6GmVxGTOx/TgK4UnyaSAVW+5i4ud7aVZACn5im3YCrvD46SRO9RC7V4pfMXeGBoBH3hcdbxqVYpOLbLSj7ZkfdFKpRPiO0sOQYCf0gZ5tIm/Btlyy8/Dul/hgRtxcCjcEoZhKTBBNnfjtRE3kkisn53538Pfozgzmq2HpYdcNz2lMOdsQQ7/5SYDMNiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBxjHPcoTm9JKCP6/X3QEVKNd8/3+Qqr9Qbi/CtJuhM=;
 b=A9XRxbmRSelalSbsbRfQsIqWBut/JBSM8PlRpco4h7tEDdamtjDxbBd+UkgQNW/1HhMWFbGPGDvnKYCGwXYaFDDMETadsVJ9Fhsqf2G3w8wk/7+s+TU5AT866z628TEBbzu2Gs1VsKpFHYzKnr7kMMQv3kefGLzZnlGNNoq/DR/ZX081NR+9z6i6BqRxZC6qYiqIRlJYc1DcjQWa012SHYFLZzGNhhbHd78469kz6xg3Y53ZOHuOZsDfS17U523kbGijk5a8t4Tjzq6zk7vOhmaNtyfzUj1zNDPIPBwCo4J3OxDrzaVoJO0g3Iy20T4jS8SZ6ousT7pRryWJNBZURA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBxjHPcoTm9JKCP6/X3QEVKNd8/3+Qqr9Qbi/CtJuhM=;
 b=GzzQKW1mNV5PkMYlePKKSfRpzPv7Ay1i/bop9MyZvXIImH6MnAKL1q4MAWN5ZuHx8ObBTeRz7A2nfNYlYcKXZtCXXu/5P6g9YfRhOmQ/uvAY4BpUwO5dQYtE7ZN3rRA8dfVG3+irvtnDKVJL/zysMYoor52pdfhFBMaPkR7Q688=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB6237.eurprd04.prod.outlook.com (2603:10a6:803:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 07:31:50 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:31:50 +0000
From:   Li Jun <jun.li@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] usb: typec: use typec cap fwnode's of_node for typec port
Date:   Wed, 19 May 2021 15:14:48 +0800
Message-Id: <1621408490-23811-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4129.32 via Frontend Transport; Wed, 19 May 2021 07:31:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ccf085c-36bb-44c8-0780-08d91a982a3e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB62376D028E5C0BADC3E877BC892B9@VI1PR04MB6237.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WgfFiCGm3EyAkVwyIX6tILXZwsmw0Slgp+bH5Qp32aacYFhHlIa7dSEhSwYFoyExTsgElM9J0ndIOF050ZIofmshclHRkMLxR/sW6prLh5mfdVZiDTyL/vkvlIoy6G+aOSb8tSqUZQ/ms3+scsdEQ7pFJC7Y4W7kCVpUG/Bm+IzAhXNrxs5NTWAngjMH4nsllJhjDhxs34PDbShDebyKPYMYEYTZuqemUgSfVTp0JeT4wLZikg/XVKWluC3NkuLmAkp5uoBkgRG/KAo8NA26BragcFYgUGBRwMK3L6Dfcmc/NrLeP5NMaifX81HHVIzoXJ0+PgX67eqPwrteRxijF47IXSjGKwcmKHSCSotMkwJ3pJT6VFiF0q041gQyov9I+UclIhc0UZNuR1mIw1CRUqtYKIYYFWQDDoSDzpSivSmvbOQthnlOWosSOt5Nu51iNOu+K6qp+VDbJzNvioS1mDVO2Ek5Ba0QOx1NmsKnuGNQNTPlg8l2vtC8XfJmcs0yPug52omGB1W08JxsTczGOME+VvrCfgpMdfnf5L1BZMb320rPNMnJGirLzQYJWVecdcENwaljUcnx4vzmyU0/6eQfxNUfPqamDaIAJVZ6Hn1iW7S4UMP66TGkdmeN9w1OZ+EAC11SPMtuSsTN7QPpWc+4wV5/cKhhzBqZQoPipi/R+CYFyb2qMpM8p8Rux26g
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(86362001)(478600001)(36756003)(4326008)(2906002)(52116002)(6486002)(26005)(38350700002)(6506007)(38100700002)(16526019)(186003)(4744005)(8936002)(316002)(66946007)(66476007)(5660300002)(66556008)(6512007)(2616005)(8676002)(956004)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sPmgo/iySW4mlw9mYERpQVRfw1Q/zpDsBSmAp4z0+uc3GLzRa75utjuT7Csm?=
 =?us-ascii?Q?s1ZGQR4/iV5BGvB8wHD+pvv/ZlludTPcbULyArYMhw5bHItv1qqenrtPxucR?=
 =?us-ascii?Q?VpwcouN15aT4BGcnrIu0YyUd5kW1uMPqpwrLkzH4qflKiGRXOI+kwII8oIFJ?=
 =?us-ascii?Q?Uh9Vb9BnJ/9kE7IpI6OadB7I0LTKp9Qu+apIUtPAPWQwj9lH5eaV07hgItFZ?=
 =?us-ascii?Q?VnF37p4keHEi2cRMGlpZKFheEiykVgKpweb1A9GJQ6lAvLwcJ7rv0jgmzhfL?=
 =?us-ascii?Q?ZsYZuumpTuPQURQF80/3bMw5BqD6qyEp0GpQHxNPHX6d56t3FALOhe9RIqa5?=
 =?us-ascii?Q?xl3R6CqVuGcSUukGPEN2GcqgSMKEgKcwy+dYmiagFtI9QRduHjfeDFZgY/aV?=
 =?us-ascii?Q?2CfEcopyeHSZCClPpZ+ctiwUoGctZFdj33yGt39J3nd2M2aHTO/2+tgcihxD?=
 =?us-ascii?Q?w/0QfTE5cyYWfjuUh+6h5+yGh2nwnplT1O1wTh9UY8/CDdB9mROegm8yYJBN?=
 =?us-ascii?Q?XVqzXgYkYeGi4DNp2kp9TvEO/2FLCwWOx35UCWluy7PFdL02qPEW0GjE8q19?=
 =?us-ascii?Q?Sn1eAITYRo24kRtyUdtbDaJoUK5Ezl3C+8kRykybmRKEL4dayX3zGb4dMx6W?=
 =?us-ascii?Q?z1ylMGc9/dBB4KPkzLvDnP5NwEHU5H48wHHVjL/oRnNdpk0W6xIRW/IP3hiC?=
 =?us-ascii?Q?F/NjH2Bc+qUv4bWBCLgu+BFRDaHWeHiST5zLAwmK8vNz9NCrQrSwAdf+UYue?=
 =?us-ascii?Q?rNd6ivoE1JJTKprxu5HsZi8+8boIiSsfvafr3fSKi4fO85hmkXr6KuDQKXNW?=
 =?us-ascii?Q?SL/7s+5mOGY5LJoz6bl/T62BKpgEX5texrQtobXP9qxMY+QpSCiPl/urBdTU?=
 =?us-ascii?Q?vToIweK2QiQ+E2Wbonv39KXLjdtObJmeQzrBJL1tbcN4jEaxtshrpZQfaJBA?=
 =?us-ascii?Q?FJRgyCDor8UlXZAbumQWABKiGMx4IwDUouCWA4SyG47QmN5wio9bev0tW0wP?=
 =?us-ascii?Q?nNXm75qSXqPccpaMeKcUENcGuA/dwMNt/BUubVja6XY0HX5mCY+9Ze3W+C4j?=
 =?us-ascii?Q?icP287I7eE9vqw8kSAQ1lwzDIxD+IHs7lF29i1BlPbkY4J6NT35tX26Kn4Ub?=
 =?us-ascii?Q?NdILVuioPXFry8LspLUXA5KzxOVT5iEaUbllA1DBy09TPcL2yKgR5/ZvxEm9?=
 =?us-ascii?Q?KK/7gzSUtizjhIxi1vCID8GbVJR7RJP/PsmJG4Xm2ArIWu5543lNJm1uCU0z?=
 =?us-ascii?Q?vL7ZY07kX33YLzUhd+Kr9Jm7ajQgRw1C3dssAkVZlPU5JtgyuQ7DpXGI4eUh?=
 =?us-ascii?Q?U3PsEY4Na2kPKVp9jTi0UF29?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccf085c-36bb-44c8-0780-08d91a982a3e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:31:49.9593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2g21yhlHPnd32+t5AJ3vFl0xSqftcT/TLJog/U7PlaM1fp2cydjqqgwKhwbY/yqb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6237
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Asssign typec cap fwnode's of_node to typec port, then we can use
typec port device to get properties from its OF.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/class.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index b9429c9f65f6..a29bf2c32233 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/usb/pd_vdo.h>
@@ -2049,6 +2050,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	port->dev.class = &typec_class;
 	port->dev.parent = parent;
 	port->dev.fwnode = cap->fwnode;
+	port->dev.of_node = to_of_node(cap->fwnode);
 	port->dev.type = &typec_port_dev_type;
 	dev_set_name(&port->dev, "port%d", id);
 	dev_set_drvdata(&port->dev, cap->driver_data);
-- 
2.25.1

