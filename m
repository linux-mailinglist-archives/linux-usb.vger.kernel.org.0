Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB772C0CF2
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 15:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbgKWOI7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 09:08:59 -0500
Received: from mail-vi1eur05on2088.outbound.protection.outlook.com ([40.107.21.88]:4001
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729111AbgKWOI7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Nov 2020 09:08:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNae8u0t+XRx3AYWdfC2THD5i1/bd5k2XmIBdl9OxnPrIGQG9OGFiJSFfKS+/37jG/QCSpAd4/l+hSi8LiiURtr5xxNqhaGJqR0h41hqQBBtwuWIJOlxf2nDcqMNhuoj0hgxQYgzaGbWyxMjC8i3PqxwljqFuK1KgtjZt/wDCEbGAv+GP9TcF0rpTRZi7+WHKAqeuONsNRJ+Wd5tUcUoDAICnJp8aI59hY8eLUeW51wmiT5H5uj/zVY9YBCiu1VRIIUQtTUM2l1aINUN/bvb8uchPWoH5CyMIMXwp12T0f4tZfAwY61NymZpwqHYd4GKF665gbvVRORUVD1DJY3pVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKxA2olZIxrO9Jii9rIBwEOXLwjmbAGvddS6MgKU5/A=;
 b=QL3AJLupj4+Sl/KpySebzX5WvTVywSZvj8hLe/lQ6Jt3lz3eBCZ0TK7NvRBoZbQsxSKB2X2oWGShOwzjAWcUAdAMSyb8OUsTt+4Zy+sw8aDBXbasYbu9Un6jGbTmYmg2UJ4Sb6IyAXWW963GhGKoTb51sjBE2eYaKC//DM7YcIjOvhWbKD8LrJSfVRshy0sMxepMBN/bi/0NAyxThYSVMq4dqoBaN85PME1OqSK4jcdMI8CusE7NW3oMGV0HU84UwNljHFrt5FcL84CI73joJdle/k1RSOWzQ+3nJIj76smtiQKWS5cd9qi1AaErouyEWvuopkg6g6GBQQrwgNWjoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKxA2olZIxrO9Jii9rIBwEOXLwjmbAGvddS6MgKU5/A=;
 b=eIqk8lMdqsxeHvB9E/hDQnzRsYeh3nUpZU+7xSWrQNMUmCmkCrf/VXnJG+bD2FS4QOKXt5oqNO2+4Tf+jjgsHe7p0+6Pg1iFCPCjjXa6bKBZ62DH6C48S9UnMZ+tL2RSXZlA6P9qOIcfEjt6sTwNjXbIdwrr4fIUvJVplO6H4ns=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3760.eurprd04.prod.outlook.com (2603:10a6:803:23::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 14:08:53 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3589.028; Mon, 23 Nov 2020
 14:08:53 +0000
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
Subject: [PATCH v6 2/6] device property: Add fwnode_is_compatible() and device_is_compatible() helpers
Date:   Mon, 23 Nov 2020 22:01:32 +0800
Message-Id: <1606140096-1382-2-git-send-email-jun.li@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0164.apcprd06.prod.outlook.com (2603:1096:1:1e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 14:08:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c2253203-4d0f-462d-c398-08d88fb94f53
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3760:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3760303DB060FDEAB1E4154E89FC0@VI1PR0402MB3760.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:499;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d4Kr9fJ9w1rLCEXJCotPJQoTde48G5roeZ87aOqogrZ6EYiy9lM0HL9XlBrHSKJzw7cZR0sKMXZOasL+EKtBn66m3OATUXtNygDF693nuozhQPmNl3h/X8IOU9BjIW/d87pD89Cze1PVi4fIy8iekIWOSE8fs0L+RYx1ZpxsJnW1rYyMfjZ1UywOMAeILLXWh8zmRg4GR1kE9Yd2VGzhmICGxjLiyH1iFha7B09hqwPjZVvLvHJUKBaTn0U+EomWllvX+KFnYhjvj0DiRzVsZzh4zri8QL0BdxxirZVDkqWHxriMME3f+yVxMsKTri/kdfq3xxo31lepQ/Y1AP0Ag/Yay5dBxWj0XKUn6OEmqldryFMXIfyNbqWvUEOLcs7G
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(4326008)(186003)(16526019)(26005)(36756003)(86362001)(69590400008)(6666004)(2906002)(66556008)(6512007)(66946007)(478600001)(7416002)(2616005)(8936002)(956004)(316002)(52116002)(66476007)(6486002)(8676002)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: itove1DVrv7uGjU4RNv0BsuqPCjcLCQDRDV0WDsobJkGdghS+1ijRMewAnH3TldNHAX8zNmYTyEO38StmsKGZ5kRnh6QlSScmVXnqCwW1EiqVvf4+siRqlY3/00VY0MsTyyZmYQ5CorTE34uUqQ50pXcW4CQnlfMKir8hL4Y5AGIz1F7CRvy0pZcW3nISOcnSGBSirvK/7AY7cujvgJDduOlnYHZ0x7S3A8FrgokM7bv7sHyIdb7Utupe5WOwcE4W6laJ6PBXlHE1zxInrGrw/nvFe+1jUL2e7W4YVcJjGXOfs5g7kIOb6xtsru4edYk9LNBNmBQIJhh7g/nEkbWK0oqAL7yw0FkoGXA5wMrPAOejuJC3NTKgcG5T4cyO9sTZaNFMiLor4zTa1tXD49RK8ifo7HEqcT1GM0J+YkjsTufS2JvWbIkiZF4xQVuUPixVF82mC9nGjFoYCml1SJVKnl2xz5R6covB+QEDvSoSqh7+73nVqowBjzZ/NAf/ULogsv3jKrx3mk4qo+dWokVsnmCnUuIDQL9+Y+rIzDRlnVF2VvNw7xc6Em8H8vWEpjWHKrOHygTZrbX9Zm0WhBSx7EZLyOUXE5llbG3ZFDg0wxA1DlGJG0tH4sShyrN54lWA21V5KzROTPxZ+n2LGPBOqZ0bWK+tHrF1k/JAhIi7CR5xNKdVeHASaPKBbnV0eOEQCJARAC1UQOfM2OCRdBIMhkviTWq0T/H7bHMeGpclH4vNIGsNXua1+Aub/3i7GLq+PKLgjvqTkpvu/iSUQULiX9t8XKyE4anECv+/CHmTJy/OKKsDwZo3luLMJgugW+QLD2CSleqScAt9EWRqiV8MlHM8dPP52tvppizf4MTKsCt5J+Fc00Q2nuKrDBE4mOTFI5dMQoP+ILdQosEi5LH+g==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2253203-4d0f-462d-c398-08d88fb94f53
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 14:08:53.7335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ijKQNeEumOb+OXw4DWCwG23crvDtlxUozo9LY/HPP6/uiodHcpQL8iD36eoLyb8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3760
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
 drivers/base/property.c  | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index d58aa98..d1c1f30 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1184,3 +1184,42 @@ const void *device_get_match_data(struct device *dev)
 	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
 }
 EXPORT_SYMBOL_GPL(device_get_match_data);
+
+/**
+ * fwnode_is_compatible - Check does fwnode have the given compatible string
+ * @fwnode: fwnode with the "compatible" property
+ * @compat: The compatible string
+ *
+ * Match the compatible strings of @fwnode against @compat.
+ *
+ * Returns positive value on match, and 0 when no matching compatible
+ * string is found.
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
+ * Match the compatible strings of @dev against @compat.
+ *
+ * Returns positive value on match, and 0 when no matching compatible
+ * string is found.
+ */
+int device_is_compatible(struct device *dev, const char *compat)
+{
+	return fwnode_is_compatible(dev_fwnode(dev), compat);
+}
+EXPORT_SYMBOL_GPL(device_is_compatible);
diff --git a/include/linux/property.h b/include/linux/property.h
index 9f805c4..42c1d99 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -48,6 +48,7 @@ int device_property_read_string(struct device *dev, const char *propname,
 				const char **val);
 int device_property_match_string(struct device *dev,
 				 const char *propname, const char *string);
+int device_is_compatible(struct device *dev, const char *compat);
 
 bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
 bool fwnode_property_present(const struct fwnode_handle *fwnode,
@@ -117,6 +118,7 @@ struct fwnode_handle *fwnode_handle_get(struct fwnode_handle *fwnode);
 void fwnode_handle_put(struct fwnode_handle *fwnode);
 
 int fwnode_irq_get(struct fwnode_handle *fwnode, unsigned int index);
+int fwnode_is_compatible(struct fwnode_handle *fwnode, const char *compat);
 
 unsigned int device_get_child_node_count(struct device *dev);
 
-- 
2.7.4

