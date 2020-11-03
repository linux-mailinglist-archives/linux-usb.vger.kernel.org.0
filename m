Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B8E2A447D
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 12:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbgKCLqn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Nov 2020 06:46:43 -0500
Received: from mail-eopbgr40066.outbound.protection.outlook.com ([40.107.4.66]:28642
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727923AbgKCLqm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 06:46:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxvqnhNrYARpQEi5Ap3EQw31vJY5JBVIBfzE+qnUHfm6rRyVqHJN4B4A3O/tKSnhHpa32sbMbWaSfr83HxoIDYAmv7cv/iOhIiaNZ+iwUfXPdux3I637QjiL30UTas3z8Fouzv9JCoFKMN/cF+eGxNH0ke6xRPnsUQ6l8ALQRzF40mmUE9NKonSlh0Nr5uHqynvUFuhgkEnZwAwS/aSKbbHZtMFehaV3Mr+EKHtZPzs0IyZ3FAEo5IzLYbmhEaDsXzMNmJbnz0g5bUdaFqAWs7u/xnLonXZE3hfVtHwyuY+weKxVdcn3F5y93+1iY5EDFvRIRvrpqSX1o/0cB+hJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHglhA++m5WTUnzAra6cRX4kqXFTIwL+B0/ZkuiZyvM=;
 b=iUpfq1pvgKND3XwYTgHMIvsRYUjScbUSYlubTctorgbpfr2mMw553KDULtErGv0QjuJO8BsqnU2zkcz2bodCxtFkLEDz390SjRvAugyGNufx5I62m9MR+ogV1o+eghKQ4afxZwL8NyAmmM2dFz4LbXGIfvVAMjiDXJq4ff1n/64vkCPqjiDyE9YD6auGeX98q3DW/uUHmMDs6I6GPSnNY2N5x5vSv2M9SBMDdeIA5Flkwf74qr0sLQv0rDCQMmDTsCDUIoujSj3fBdM9x5dtxEJ9wEjMrS8qEXuu+wug0SlDaff7B0qXKkMDjk8+QI+1lnVvyZLg13/brH5ijiiz2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHglhA++m5WTUnzAra6cRX4kqXFTIwL+B0/ZkuiZyvM=;
 b=OEBzY/313E835L5309qVxSKN0Y7+6gkKbtfkXVJhmIlcgyFjpkR+G6sTu03nI2zSX8pWWNarbzK96b28jfgiE7lnzf26XFG5B/N2VTDqjpkO7TWpGfMZxeFIgymla8GkaQMNzwWB1Cehqvp3phKTqZimNqPgZ3oE1EjIgoNXbzA=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 11:46:27 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 11:46:27 +0000
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
Subject: [PATCH v5 2/4] device property: Add fwnode_is_compatible() and device_is_compatible() helpers
Date:   Tue,  3 Nov 2020 19:40:08 +0800
Message-Id: <1604403610-16577-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
References: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0131.apcprd01.prod.exchangelabs.com (2603:1096:4:40::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 11:46:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d55c2006-e54e-42e4-bceb-08d87fee18d2
X-MS-TrafficTypeDiagnostic: VE1PR04MB7278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7278DFF6370B8F3FDCF7C2FC89110@VE1PR04MB7278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pSUUING/exk2cTDngFXxMW7qTv7xc7Vm64ypCU0jg1vocgj99Jv0uTLO6dc6hkBeQB2/704pdVE7iwizmlTWQ7orjUnjhUOx8Hg2dT5iACrU3fXbNjYMWSinj2OkGMSh508uC39dOhPwvNbHxJdPWDP2i9YTcGer3Hwr0Q0zwlqNWfgRql7HS+i/CBgLr9MjN84GxJiMIGn6CcqRVIEwcZlw/U+b28v0hv3IfDXQ1+QWSJpmYwRDJfkNdk7M/J5PwVKtAHRuuWs+jeyZ7JqAJCQVNOeICJ+AH633hmMbsM2leUY/eVTLdvSlF72ECJKVXkGnUSBsrLKQisTimzk0slYvKohQBLR76ZfC71EYwS3SysjBSEU4hLvOLSi3rHtN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(69590400008)(26005)(316002)(16526019)(186003)(8936002)(6486002)(6506007)(7416002)(4326008)(6666004)(478600001)(36756003)(956004)(5660300002)(2906002)(66476007)(2616005)(86362001)(66556008)(52116002)(66946007)(6512007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: bZasUjLPjnx8dd55AjGizeN8LO555MOrQfaRGOKu17g9nEap+frncfQQtQnFrMJLnDqxudgfUqOObEK/qHGQ4zF0IdVdWdM86vAphop5V4BMBhjp10IbQ7O5HIw2ZWucxxVDkrtGF65qUUvOtysomK3yTKlMllVdcXHrrNANhFz4gqEOtdOur/JAhi2ueSFrqYhna2VNrKFSPhIkeqvhj6vO/JKrdqpgsMw2hDukwnbn4MaRaipIzQq2GcPBLupzlxlyVmI0RnL1BaqeaXrh3x61BDnRNsCVUVAxqMNDVKSv/R2ns+DqWCqupHVnEsVr8/0Ez+1IFMtKfK+wmvmlg9ST4xeq1EHd7NglgIzi6Y2puOX5g27oioOiVqjIfJVJLqyauhpPTvPr07Ib+eEGRoVl5DJcTRhybBbLwnZbDahJd6UttzukkIS1oJWrT/l+7DKgoC52g79awq7pacWsRE/pLVHx2Y1j0YJAzFakJ2rhbPNdbQ5M7uOc8m2WT4pfbDZMWXbYr9NbH59rqg+pgG7XNDmVQm79/1AvtGJWPi7BI86hTQ6k5u/Uizq69MuO4xd2igh1qwQ3Pv2pm3TZbcCSvB+3HGEcwNGrmnfM6+O1cAFwUDDoIZdOs+txuXT/MbCJe3pb0kecW5/+dI63vA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55c2006-e54e-42e4-bceb-08d87fee18d2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 11:46:27.0062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVTSFIz8SY04f3/en9a0g7FN+uZNIT9rV+cfH33T1xuqvRZ/mBqdevlWOMP+AP5Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278
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
change for v5
- A minor change to move the function return valure description
  to a new paragraph.

New patch for v4.

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

