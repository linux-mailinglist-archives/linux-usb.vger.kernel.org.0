Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7B6292467
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 11:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730163AbgJSJKS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 05:10:18 -0400
Received: from mail-eopbgr60080.outbound.protection.outlook.com ([40.107.6.80]:54046
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727235AbgJSJKR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Oct 2020 05:10:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABwRcc45yPPI+VwO6fBF9FamM+d5kAUz9zqSv1o3z/8pSi1Y/dYlPnxpQSlLfg1JNoJauCm2oGpscn1k17el7DcZNta1hj1ejLLkg94RJpqoxN7DFvdCTiUg9PlDtnzOOolbyypV28AsPfT6eD1iHv8UegAc3GRWOJ4OocgS0nolpN4mgF+eixIA62NKmpUJbhe3rKjT5FHX7vde57CVWmi17UESdrjXiv2cyythcXDBcIJXg+oEMDrTfKCtiad3+jXCzxRX4xSDgj8WRUVlltR/wkG6p6rlV7D1CKMa400pqgXs6g0A1eSboppxa5gAIkYc3FQs7LTmrn3uEWBhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8vk+XZTydaeDCsS2UPxVDpzAulijz2e5lZz4PBh4t0=;
 b=UXKFfzAl6uhRWoJ4Ywso0XO1TD4ipkE9MPNfOZ8LZg7BPGlV/EpB7AKkI6FvzdMWvUAMcAwBOT4JGFm62gPunOxTXMf/u4cSeynB5/HFFsf0tDqyhbrJHWZi34QnTKTbWlRAOzadww14PsNVAdJv7rzUAM4EKTaT2069TVhyvhoY5cdbXFCnnvL6j3ru4Jb+M+WuD1LHMVmJffJp6pOu5FEu6DeXQcN4oLMnBOT+8ooep2PXxWj3R96kfr+z1hK+0U+v4W9rgtt99MzUYvU7R6B0JzqiYoWexj0MIYBkXkIW+speABuBjbclMgTwh0RQnDDnplxRWA2i0Ir/MHD7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8vk+XZTydaeDCsS2UPxVDpzAulijz2e5lZz4PBh4t0=;
 b=TNDG3SQ15hkfsbdJl3Miluq8J8b9hHRtgk360t7MFw+Wp54CxdskhpzfVb1NDJFrAbo6zX/ab7iaTGKYkfHBePMDCfxyN3jhFAcEUUggUoaiw5RxJwTumPgOZDygEgmOgtVinqAF+dEeyGzY2mOa+MHzMsHMc6iyGSHmEbjYa7c=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB6PR0401MB2342.eurprd04.prod.outlook.com (2603:10a6:4:4e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 19 Oct
 2020 09:10:14 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3%6]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 09:10:14 +0000
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
Subject: [PATCH v4 2/4] device property: Add fwnode_is_compatible() and device_is_compatible() helpers
Date:   Mon, 19 Oct 2020 17:03:13 +0800
Message-Id: <1603098195-9923-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0128.apcprd01.prod.exchangelabs.com (2603:1096:4:40::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 09:10:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a0fc9a30-67a9-4ee7-b3c6-08d8740ec9df
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB2342B253DA675B3F819C1036891E0@DB6PR0401MB2342.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8MHKoJB1vn8NInQ0kWxqicpKgziSC/YhTut5awpBjzhViqZAa2TL4BycbYXSf59agJK7hSspqpe4wuEng2XkLkvF6hi3gk0dDHyzprg3y8z+wgqYy3JO3IkqarT7kbpv2xbkNFDn5F7lUgkQDS+xoEKSxwWrTZfvgD/Z372XVST8OXXAEsMcuoQYjeGgjgJzvBe78SBqcEYwOTV/LEmaYg7wydGOuZMr6RZQkzxKaOJP7pakYl7cposll/cUqZsBWh2SGmnDD4pm/o0bFoT/G2DhzFQWOmdTJHoOTUEZJ3L/MLi4Mkna+HRPdoldoGSjiZyTqOWW9HMBfyKOnTXSsZo9dLFvp+HhKq4yENbc1/cP7FYqmTF/r/zbmod0jV1G
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(6666004)(8936002)(66556008)(7416002)(316002)(5660300002)(6512007)(4326008)(36756003)(66476007)(66946007)(8676002)(52116002)(69590400008)(478600001)(2616005)(956004)(2906002)(16526019)(26005)(86362001)(186003)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: hsJNo2lcV4q78InLOqmNIaUZzuG21vduZwqovAJBd5NWeVHDotMbgheluC7IUoJrRzy/zwjFG8CWNM+E+rdz75q/GraP4rarqkGNTDdokILaq+tc3uMHOunTWja4PYVkCHm8dvUsZCTxdel29WLaIpoRi6nl92qTsAur+4+PAcihcgKvpmIjRG1baDaxwDzGkODPpdO07qDNf9ufkRmqxUxR0kLldlpY/SHHE5DBMldxasqjy6IpA+Bgg6OHCjA2ZuTzE2OjmfuYTggW1r5yQ0f8PIX/x6isgOXdL9nzzsp7MRz13+ARGc8/e4dlSFKlHO8GGyAMP3AeitT9ISrkz9lZ+8l9de+Z3C5IAEZDwwqMku3U97gf7uDq1MkOOGfeigCRagjNZffBNZFqd7jT8Ry6DTaGFp+UhKoaoxE2N6NHVtsPO60xK7d//5aZTb1JiDY1N7b/HZ+icZ1c3hi34EHoSGLDPZ3DarCgI0g7v+I/xKr2NiL40tvtxIqnz316GLndl0+w+Qkya7bTYNV5oweKlvHe3Gsngtr9KTuKE6ihVBW+1CpDNRD/vUXrsoRjYDI47mTPGHL3QLW1S1SPEoKFRxZDOoaOj+EaB2fWex5pBlRboV+KeYx6AomTffIqGqNZ3pw7gPdlMUAYjFutQA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fc9a30-67a9-4ee7-b3c6-08d8740ec9df
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6523.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 09:10:14.0279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aizlz1/1E+71E1Wl39rA2AdfLKDA3nMKQDYSo3CO8F27OS+QXv4NFrwv+WIE2KeG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2342
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Since there are also some ACPI platforms where the
"compatible" property is used, introducing a generic helper
function fwnode_is_compatible() that can be used with
DT, ACPI and swnodes, and a wrapper function
device_is_compatible() with it.

The function calls of_device_is_comaptible() with OF nodes,
and with ACPI and swnodes it matches the given string
against the "compatible" string property array.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
New patch for v4.

 drivers/base/property.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index d58aa98..32e3a3e 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1184,3 +1184,38 @@ const void *device_get_match_data(struct device *dev)
 	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
 }
 EXPORT_SYMBOL_GPL(device_get_match_data);
+
+/**
+ * fwnode_is_compatible - Check does fwnode have the given compatible string
+ * @fwnode: fwnode with the "compatible" property
+ * @compat: The compatible string
+ *
+ * Match the compatible strings of @fwnode against @compat. Returns positive
+ * value on match, and 0 when no matching compatible string is found.
+ */
+int fwnode_is_compatible(struct fwnode_handle *fwnode, const char *compat)
+{
+	int ret;
+
+	if (is_of_node(fwnode))
+		return of_device_is_compatible(to_of_node(fwnode), compat);
+
+	ret = fwnode_property_match_string(fwnode, "compatible", compat);
+
+	return ret < 0 ? 0 : 1;
+}
+EXPORT_SYMBOL_GPL(fwnode_is_compatible);
+
+/**
+ * device_is_compatible - Check does a device have the given compatible string
+ * @dev: Device with the "compatible" property
+ * @compat: The compatible string
+ *
+ * Match the compatible strings of @dev against @compat. Returns positive value
+ * on match, and 0 when no matching compatible string is found.
+ */
+int device_is_compatible(struct device *dev, const char *compat)
+{
+	return fwnode_is_compatible(dev_fwnode(dev), compat);
+}
+EXPORT_SYMBOL_GPL(device_is_compatible);
diff --git a/include/linux/property.h b/include/linux/property.h
index 9f805c4..4a84325 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -418,6 +418,9 @@ fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
 int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 				struct fwnode_endpoint *endpoint);
 
+int fwnode_is_compatible(struct fwnode_handle *fwnode, const char *compat);
+int device_is_compatible(struct device *dev, const char *compat);
+
 /* -------------------------------------------------------------------------- */
 /* Software fwnode support - when HW description is incomplete or missing */
 
-- 
2.7.4

