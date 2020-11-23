Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85932C0CF6
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 15:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730123AbgKWOJJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 09:09:09 -0500
Received: from mail-vi1eur05on2081.outbound.protection.outlook.com ([40.107.21.81]:56064
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729204AbgKWOJG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Nov 2020 09:09:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y13X9PCq7KKAo+VbQxNv8316a7XFWPNZ8F1OLgIfp5BEFjfKDZZfcmA7GUIBhkXnpXpTxUfg3VxMhmMQBIK/Co27BzfB+TTSHH6pdzOSB5as/1WLwmANVqBtT1cHp1NAdNP/tYpwdVHKnVO9S+FTxAi/6BwxIZ0B9wPP1Ea8NB3pT43QHnE/Xy91SspuPAZcrWVwSV2mcUnVPml/mO2qCFRskpOBU57yiz6lJsSgNiDug++pUO80WNxZVTZAVpTPzzp0yWEQTH8kxyglqAU0xhMyAPnKZlhH9Ypq9taQZuhakXtkZIh2oLSuaDSmSrh05s1AKFtOrPXZMw8Tp4gMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7as96nAltumeTfk60IfWdz+fqlULvx32CtbZSPCOPlE=;
 b=MTJvIUTT1CjSNEO7+VHiB9IgGcIXOQdmMJYeApyzCuDGMB6RlxZYSmsqUfnvSAbU53/gnK8Wk1n0/iMKdD9CQP3UqnE8c9CnWfit73UVW1UIt1IwAJCTYZKMFyZIZVu4EutKidr2p05W5o6YvLaJQXl0Z9gEr+y63dvfv+VyZDXvudA4vjAFJPNFXrgJopNgMidTnWHmMi49ZebRvU+a192ZMUn1sm/SA0rM4BT19Nbm8FOVGC4yDTCS8vk07Ij3HK7Pmy2/Epyj+WZNtNb2mPJQJYQidVAYIVDkZ6W4otdh/Ur5TalTBXxbm5Yl5z+K/FQ9dji69mClI2WzD6dNSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7as96nAltumeTfk60IfWdz+fqlULvx32CtbZSPCOPlE=;
 b=GwBmge4nl5GepSczkkUaL+dhmUb7IzNV4UeMhWXrslaoK7hj9l5TU0ZTXF2W2Q1F1sp9r73zuD5xRfv6KydEZiPX3kqt4zcbhzcSgGDFtpHmwfUwi48GqAusNE1J92Qd1NhzO2wKe2u4BxLhh44UNhlOM7swrp5ZEKmf1CTDUFQ=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3760.eurprd04.prod.outlook.com (2603:10a6:803:23::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 14:09:03 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3589.028; Mon, 23 Nov 2020
 14:09:03 +0000
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
Subject: [PATCH v6 4/6] usb: typec: mux: use fwnode's dev for driver module user count
Date:   Mon, 23 Nov 2020 22:01:34 +0800
Message-Id: <1606140096-1382-4-git-send-email-jun.li@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0164.apcprd06.prod.outlook.com (2603:1096:1:1e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 14:08:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7909f32f-6504-4954-41c3-08d88fb954c2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3760:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB37601E1EA4EFD2D955DBEF9389FC0@VI1PR0402MB3760.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aySgnACvSx6NQsmrmLtruz/DVbG+1eQ6Aja6N6MntEhxB2TaPai3K/X4/JF6Wq7MSwXqm1ZtwMHKR4T3K3OTdXEjDVEcmiISL+9bTN4rDqbY3HrGrbznliS/4+OsRqG4r4tZOTHAJxDcVMvvY7vLX+0J+QFDLMyzvcQE35UyevbUn/HFnercDIkYufuVRvhEGsscfLgctvXKGwyNqhe4411S0T0zHsugHJ6HTpNbl/wVXRetjzL0zTXJ/vpztlN5t/YefjJ+neQYnczXC2IGFIU9/LdpDYk3tH7sVK6I/mpz7huUc1UAyi182dEW4V/C2/ugcdDpxchFxMEhaw3MYGQ845XzEM2hGe7uUyy2sXnt7H6ovQD6w2ig/cWLjqHG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(4326008)(186003)(16526019)(83380400001)(26005)(36756003)(86362001)(69590400008)(6666004)(2906002)(66556008)(6512007)(66946007)(478600001)(7416002)(2616005)(8936002)(956004)(316002)(52116002)(66476007)(6486002)(8676002)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: i9RGt8egEELZCVAeMQNifHIe51+CAGC/z1rDdPx9bv3x9V2P3uDqlLimZMchSivV7LzlNaaEpqo/qXSMpHfiT2zj0m6NfChLOXJcBOb7ASfM4EymXH7RK2B+I9dli01NG4D1STZw2nWP8VzWdVLy9ygeHhcAcBQcY+MF1Aa3q3SXDWEn5kLx2R/wBR1KDDxb8sah7O6fLoiSfqmPHkMv/ApOCWrfIzwal5p1Rp+4IOG3bW+L79dqvE+YOlGVqzjM6VgZFQuMUlGbttfwaVs9vH+tDzjOBeA1KcNh2EdL4m2p2T/PSJPHAI55YISaspAQ6BezPlEpNo5YmxlkkBMXfHYDDp9ZkzyDbdnF+avwHpGM/ST99A3NoRJnnTcwSDDHnXiFJxQrmgejaatrt3X5W0mIgKL/fALikiMfsjbzMGzjSnP5bxZ0Zn/le60nmxV+2czK9YmNwn4cqcoFOduIMSI90fT65ehtEL5YOu7NdxoNbDNhIeRmuB+jCMGB//0bHqgTpUmMxlYJXIZwX8sIWTJ3Flw22glypHmkg9K8Mmd03rgazNFbqIx8q9aeNYK5EkY3b+8pUiArL7OyuBdEYPhEyWLQ2w88ZJ/EdxZAMxiLxNLmPG1aNaFrESsM5ouJ1BlDqr3EB1RRu3jglwsgOGNNRuG4jLrSYtZ+A2Mw80GCKab9V7nnQWEUGg5Kqcpxj6VZgEnEig7ClANforfjHvjxaEC+lhUxlcFUXI073axX9MAc2q8ccJK5Nyrtfjm7xceU7a0e0UF8Muqp5BDPvM/F1c+DLvyzwALFPDK9JKxWWMGrbjD6AZpxRR5G+xFgP3z0h7Zo3RgaMX5HTVf28PLGu8Rd7s6OQm9aqaWK3nPrBFn1Q7jJTTKZmf3WlnPn5cYkkFKJ+DUhlkmWVt6E3A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7909f32f-6504-4954-41c3-08d88fb954c2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 14:09:02.9971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xBI3k6eDbBfPvfqyHwhyJqmykKGChJ+VraPk2+7/aAmNJydLlLi5/8vFUVoHAF9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3760
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As the typec switch provider driver's dev may not the parent of
typec_switch dev(may be the switch's parent's parent), but we use
the typec switch provider driver dev's fwnode anyway, so change to
use fwnode's dev to get driver's user count.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
New patch for v6.

 drivers/usb/typec/mux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 3da17d1..0219aa4 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -65,7 +65,7 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
 	sw = fwnode_connection_find_match(fwnode, "typec-orientation-switch",
 					  NULL, typec_switch_match);
 	if (!IS_ERR_OR_NULL(sw))
-		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+		WARN_ON(!try_module_get(dev_fwnode(&sw->dev)->dev->driver->owner));
 
 	return sw;
 }
@@ -80,7 +80,7 @@ EXPORT_SYMBOL_GPL(fwnode_typec_switch_get);
 void typec_switch_put(struct typec_switch *sw)
 {
 	if (!IS_ERR_OR_NULL(sw)) {
-		module_put(sw->dev.parent->driver->owner);
+		module_put(dev_fwnode(&sw->dev)->dev->driver->owner);
 		put_device(&sw->dev);
 	}
 }
-- 
2.7.4

