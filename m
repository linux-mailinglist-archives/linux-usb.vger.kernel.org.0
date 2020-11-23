Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083052C0CF4
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 15:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729967AbgKWOJC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 09:09:02 -0500
Received: from mail-vi1eur05on2088.outbound.protection.outlook.com ([40.107.21.88]:4001
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729204AbgKWOJC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Nov 2020 09:09:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/IK5kCvkO508CxQzvP5uvOflJDJzQy0BIuPy6cdbo4qSkJLcYUO+ehW7Iyd+SjOdK9p1khyaH/RXVQ+VPOVyTrzXLLPqEVNxzgZftZbjUpSYmJ4StJenQI9HlWOg0njzUcFE5pQN5FRNQm4lrndmwINof9gSQflANL3KnyV7pZ6vQZzKACGadhyLiBQWF5Mpaw0qdN/Xwmo506tzU+WgMhlg/LIRhqSAa2+WjHuavRyUB0VcsOLG9J7lT8bNGz+24LDdwL37zDNW/3ajp14TSPhM/uuv5xjmHFJF5wx4akZIHQnZYntguY3dpsFTRfU1JV8lUiVzxJXLelflXSytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd6JWnJqQg35ArpxYz6B9la1kP+S+kzVwUQWP8efgik=;
 b=nId6dY2NJoFU2X/N44cVqixwvQKjAyZN8PlrC377n/hMQleT7vSqTyH2/0Ne88NssriONbcbP3R6B5ySJmCbmgnujCtCwg9Fn1Jsga4U+BO8Z4hGLWXMzdeTdF4UdE9OPSWdetfJL3R3suc+G6DmTxVJ//ijmIC6A/2qGms9qUgStZQg25rm6BedX7p/evf/nElC/omnB4dHgLDONt1h5YeUN3oaRDqt5uLHKKxwvUoiMxNksaC+JvOPUtBqmWnFbGxbV2+dxsou5b5upQsZkgOTgMXfYKupF8aTwtgzfM8CnLbI2fodVninfpuDlnP2XBLvUcEZlvAlbSUwcLsX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd6JWnJqQg35ArpxYz6B9la1kP+S+kzVwUQWP8efgik=;
 b=gWoqastOiPMYcDeK6mG6qGpVMCCPRfQ8CJTvFTR/8x4aE0lDyjQreQTkiahwjlRKK0kaOEPwaey0jvwvwNneLQbJPDuv5zVYJNL4CNBV4KxmdORdXUNUG32DuKXhqBgHjyjf7a0XOlkXAkHcPkY8UGqCakAUb6JzegTCNrBA8jU=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3760.eurprd04.prod.outlook.com (2603:10a6:803:23::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 14:08:58 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3589.028; Mon, 23 Nov 2020
 14:08:58 +0000
From:   Li Jun <jun.li@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        rafael@kernel.org
Cc:     gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, lee.jones@linaro.org,
        mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: [PATCH v6 3/6] usb: typec: mux: add "compatible" property for switch match
Date:   Mon, 23 Nov 2020 22:01:33 +0800
Message-Id: <1606140096-1382-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
References: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0164.apcprd06.prod.outlook.com
 (2603:1096:1:1e::18) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0164.apcprd06.prod.outlook.com (2603:1096:1:1e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 14:08:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a69eb107-4813-4e18-a872-08d88fb951fe
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3760:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB376021D8D2D121BBA1A62B4089FC0@VI1PR0402MB3760.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1rHQoeSm/WCqstH8ZshkhqevQeEVLYfzrCg00XCdTXhCrbPQY/tXR8d8TDB7ww7aIAJLyKVFffbai0hgBbapdhlQsFjkXMc11/lUXVaH0Udx2OVtI30GDwNdbXI7yWT+EcYPX7Bl6uuLx70aIV0ZtrJZluXNm0orvoE/kIJJBMoZaM5zv1BCpwWjLNyzOUjNbRHVmOUHuswnyscy1DbV2UGnRnC/n5wGHHVtKURcG2E7ieuvblegshuYTvm/8KbKm3P2M10xv0MwAd1wmEdkrUDnLPltcUc8FNpnZR2y0v7RpIccBI7U6l8FwTXwYi31Ss0yTLzOSIHLOUCaxeZ9zehaqBJ8SWc4chVldqlwgGTYHZjQtIPEagzujvbIwV7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(4326008)(186003)(16526019)(83380400001)(26005)(36756003)(86362001)(69590400008)(6666004)(2906002)(66556008)(6512007)(66946007)(478600001)(7416002)(2616005)(8936002)(956004)(316002)(52116002)(66476007)(6486002)(8676002)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: yqSzNA5idMGzd67mCUMSr1lcvjTYi6fV0iw1TnC0MhO1qarJOPWUTCnWa/yiZErlqSywqVRAFC6mKN4MXX4ilXaMhDJOaa4WvnK8rirnD3VxFfoGt9H4H4rMsgwnclJVU+fdwpMXdDxkonqWPTdTgfNsG92dP11OS6C8LZhbQvojuOQW/LvmDue1GZ8ZfQDi1wuXhSMhskMst5xs+e6hOfvQAKAJmSMOTJJ4ET+Wexvaumq9nA5ErTL1xPL7tXg0fq3iMUJRWJ63SNL+jfc+3P2bOH/dCfgr+kB2DkZnnFLqUbWpO3eQYhfQOxZAZvxJNPnE1nztc6UHOpiy1Z+oeq7gTevOha7RyvP7PNcBhp2+2x/68qutU6uir6xYpSuKswszFax5tRcpw+RJyEVuMyD9XqwIEoATLXQeAYfYJNl/5befbvapLLzE6JNiMfde6P3PSgspPNmqIp6/G5HzMUB1/VqexOb4ucpOGHF1SaFwdmNjY3xudD4ZXoPgnwTQIlaxtMRTw4ElVSMNuByzRJiKYPyU8KP0XHp6tZVEFR4RSdmYWFKXektveFzrLTjy4g7DJtSm6ahCmtqA0Cs5WdxyTpyotGve/Gt3HjieM0PRz67f+WeyF/KL+ZcMe9QU0oEy5evMyIewQPzeMHfPwRg1v2cYoAim/tOaxH2XC5hKFJUfH8nV6TF8+jPMhS4rNiP9h8A+7g/MYSsEMn2/okcItxFRYxlg/5hUZ9FPvt3jVqmsaZRBG0maiT90bN9GHJE2acjn8Q+W7LNCerOF2TW7MpluGbBnB5jv4eQ+cn4XYr/RRVuGCOb+IkkQFbhT79ckThaAyAw+tpRZtZCyriK67qRwMqRfYixqLVzAgUKkSevNGnmOfFEArjNAn2iKha4BD5+yGZssE/K96DXAwQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69eb107-4813-4e18-a872-08d88fb951fe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 14:08:58.3748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qw6mLqFkNzfKcqCRKeNrPnGRolNrPKJmIjprfs3Fme9Et1NB7D4RPKV3Ydael+GH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3760
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For those need a dedicated typec switch simple solution driver,
use compatible property for matching.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/mux.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 52ad277..3da17d1 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -39,7 +39,8 @@ static void *typec_switch_match(struct device_connection *con, int ep,
 {
 	struct device *dev;
 
-	if (con->id && !fwnode_property_present(con->fwnode, con->id))
+	if (con->id && !fwnode_is_compatible(con->fwnode, con->id) &&
+		       !fwnode_property_present(con->fwnode, con->id))
 		return NULL;
 
 	dev = class_find_device(&typec_mux_class, NULL, con->fwnode,
@@ -61,8 +62,8 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
 {
 	struct typec_switch *sw;
 
-	sw = fwnode_connection_find_match(fwnode, "orientation-switch", NULL,
-					  typec_switch_match);
+	sw = fwnode_connection_find_match(fwnode, "typec-orientation-switch",
+					  NULL, typec_switch_match);
 	if (!IS_ERR_OR_NULL(sw))
 		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
 
-- 
2.7.4

