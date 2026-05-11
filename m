Return-Path: <linux-usb+bounces-37217-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJKVAzxCAWpwTAEAu9opvQ
	(envelope-from <linux-usb+bounces-37217-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 04:43:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE2E507452
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 04:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C07653016ECB
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 02:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF092FE56A;
	Mon, 11 May 2026 02:42:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022084.outbound.protection.outlook.com [52.101.126.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DC135A53;
	Mon, 11 May 2026 02:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778467372; cv=fail; b=jlAixu0zThTRzyRGV6GBUpWQGVEV3u4dtWf/YLnIXxgqpwWngLduyMTWFT9JNy4YKx4MrWI3/+Owp4vtupN6TunU5HyOM4Uu6Ns+CGMEfY2V1apEWTZ9v3j4ZPU4HPIO81PQfh/QVmdJrc6BXq8GWDzMbSXoeRm3rdoATbjWUjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778467372; c=relaxed/simple;
	bh=GV4gXQx5jbxuCVjm8mUd/4KykdtSqek7FNlCVx+LzvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=au/e90uQlCObQSDVRNYVLL4enUFKHxL1brsBXHPWOpVPx15JGWALDc3Nx6E/hlSMTbdcNXt6H3WvCwYNKGKPFDbHmHMEGzPjk9kPI6OVoPNdgM6zoA14IDo9qPeDmNamMy+/9uyrHVliYnkYe1b1YVB1hbYbtLbkloXMpM7vygE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAjupzD3TGBo93e4mhkHoajsXIKptP/e7H1L0IkXEK4WrxA07Hs3+mu+S+JF9vT87xIESdgtyauhCZIn4Rh2sD9GDvAOhUqo81Ri2SUfNb+t6bWQrNPe/jpHpI2HW/zUDfELEOuHXFgX5kdZ7VPEWZpmOgT+ftRdCg6JjDfRbuCJiUJoufvZtQ9po78NYtdEV11/ZK2QO5bs5JKmMd/rZyCMRpwVBxiVGn9admasGLxuoJXne/pHwCL+JNfZDzmzVkh8/YAn26goiAoD0WyEO0m/9vX40ItIF1WC6Wn4sx1FxPLjaj1WYq4UCbUh9tR+HjULF0GJN6hJCWBSIImqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rpRvIS476whQLIs8abcw5QkrNfW2cp6+S/j1nH8wJY=;
 b=vr9rArvwIIRSaVO5mJAdWswL/sVv3wXqKJWqKb1JQfOMSJ1tlbMK5PqhDUgGO6QrWcoS+R9jrw8DS2so/sOxEDzXGtXzzErSuFCozYgFKSXCoCgxZxW3kqSRXMMj7fSgxGGfRdmpXRzqu4MmbYYtD8/c1CA6jPqY6yTgNU1NfgMPAp50Wje6jR+lsbfuRPGwxdV59atzUK0QaX0S3g2mryTnlsFdHsB4Ar74hAh92FsfqlYxh1jCoiVbW/cZvHXdwPwRnvjDuAo7cXiB935To/TZKp3xQfjRbQBWmFif6zbJpwPE5HeTCBmzdRLKfTqIouC6pmFSEkX0jGIG8gYQlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4PR01CA0023.jpnprd01.prod.outlook.com (2603:1096:405:2bf::16)
 by SEZPR06MB5000.apcprd06.prod.outlook.com (2603:1096:101:48::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Mon, 11 May
 2026 02:42:47 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:405:2bf:cafe::65) by TY4PR01CA0023.outlook.office365.com
 (2603:1096:405:2bf::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Mon,
 11 May 2026 02:42:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 02:42:46 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 30D9B4126F92;
	Mon, 11 May 2026 10:42:45 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	pawell@cadence.com,
	rogerq@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH 1/4] usb: cdns3: plat: Expose platform core driver as library
Date: Mon, 11 May 2026 10:42:41 +0800
Message-ID: <20260511024244.981941-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260511024244.981941-1-peter.chen@cixtech.com>
References: <20260511024244.981941-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|SEZPR06MB5000:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c29838a3-749c-4b73-7ed7-08deaf06fc17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XdLR35iDm5ydSB/VruY+10R+cwvkXysdwmyTT1VCP4WkDcKvtEPA7ap2bBbtMyOsVF3pqdiKeR2nWpubFnVxbFyDpPrPTBlX58gZ34R9jDaaFXdqEqKv6NQDg2MfJkWRo3XWCaWb3351K1B1s9dBdEOLLxZekF+BCmC63dY8OtGZF5XLUXlGfKYJ0OZ/nNh/k3uNzMu+dvdEivFCSxbrOmjOtc2fbKw/in5MrXzXK4fBgDrwmVzXhFwCix6SA6YiZfebm+w9aHM4A90JaZZfqdDYcXUgrdcQo01Z9b6ONyNE6YK7H8DaSpPXXO40fJk13cU9Y/ytfBboPDoPOaYdDdaJ3YLR7+IVZ7zRSOt8658nKEqSpUpNOOhLgVN6+UUwMX+2f3Ly6ao2NOPO3bmxeZZRVBsOgk8nctjx1POj2B4ezXDjvEYnTPcbbJp28divJC3rD3g2qUn0lAFQ+kpzOKGFxlrhcgah/+SpfOvUKgvjWtkG6JIIOASdGk27CsrFmlEJTJRirD8UvCCCfUXP+iqmOIRlI13qDo/4IhuQXg0ndK0ebZQgs+TCff7374BWMG7ntbeZmwpqH0r4DnjqaIGAh6gw2jc8UbeCjFHg++6INmE8vw7zY5EntgCwI1+SL7DtbbOlsgEwDpJrQOquKhSgsOIEFk5cBS8o4pk1G1bruGliRSF/aDftetowDWZFdpNYYGb573VrRcgS2i0IFmY5PPdUQF0pqoOYugARg04=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(3023799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F9uWI+Q3OuFNpzoWZ1fwesAMmotw654tuCWI+KFP3FfTF9ASZMGHCdSMZBifa/9orbKRNnWQRQwTgdBt3xCzQdmckeziw24q2wwSqvCBUmIKTFzZczQjOhHGrKiEYe1YgXcz3bkHxnEYs2p8nhIEA31qpuU+DY0cBlDSUtS03PwgYwo/7f7K37TCPhGIcaqsyKwxiADDLv1LnGynXT6S3C5dk4/Ev8/vyNJxvnxQXg9BL6N3CoqC1LYiG+UulN23hWwzLl2UBBEhJQhY9lmpAnxjp7JKhg2fsohG6cfH8cxpWNhBk/v1VAHVzRHTumNHSIxBrlVH+Fs5ze4AbIfmMIm0SQ5vgosDlapNVUI5Oi7zO94O4b1+sfdwtyPK0Ik/x9HmUDkwPf/kgjfB0+QDq7kkAcfn4HXmEdtlpzgXPBQkTl/2jnWAR6hyT0OVMjCx
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 02:42:46.3732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c29838a3-749c-4b73-7ed7-08deaf06fc17
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5000
X-Rspamd-Queue-Id: 8FE2E507452
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[cixtech.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37217-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.595];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Split the Cadence USB3 platform probe/remove and PM paths into
cdns3_core_probe(), cdns3_core_remove(), and exported runtime/system
sleep helpers so SoC glue (e.g. Sky1) can instantiate the core on the
same platform_device deterministically.

Add glue.h documenting struct cdns3_probe_data and the public entry points.

Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 drivers/usb/cdns3/cdns3-plat.c | 138 ++++++++++++++++++++++-----------
 drivers/usb/cdns3/glue.h       |  51 ++++++++++++
 2 files changed, 144 insertions(+), 45 deletions(-)
 create mode 100644 drivers/usb/cdns3/glue.h

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 3fe3109a3688..2219cbff1c59 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -21,6 +21,7 @@
 
 #include "core.h"
 #include "gadget-export.h"
+#include "glue.h"
 #include "host-export.h"
 #include "drd.h"
 
@@ -59,29 +60,21 @@ static int cdns3_plat_host_init(struct cdns *cdns)
 }
 
 /**
- * cdns3_plat_probe - probe for cdns3 core device
- * @pdev: Pointer to cdns3 core platform device
+ * cdns3_core_probe - Initialize the Cadence USB3 platform core
+ * @data: Controller context and platform device supplied by the glue layer
  *
  * Returns 0 on success otherwise negative errno
  */
-static int cdns3_plat_probe(struct platform_device *pdev)
+int cdns3_core_probe(const struct cdns3_probe_data *data)
 {
+	struct platform_device *pdev = data->pdev;
 	struct device *dev = &pdev->dev;
-	struct resource	*res;
-	struct cdns *cdns;
+	struct cdns *cdns = data->cdns;
+	struct resource *res;
 	void __iomem *regs;
 	int ret;
 
-	cdns = devm_kzalloc(dev, sizeof(*cdns), GFP_KERNEL);
-	if (!cdns)
-		return -ENOMEM;
-
-	cdns->dev = dev;
-	cdns->pdata = dev_get_platdata(dev);
-	if (cdns->pdata && cdns->pdata->override_apb_timeout)
-		cdns->override_apb_timeout = cdns->pdata->override_apb_timeout;
-
-	platform_set_drvdata(pdev, cdns);
+	dev_set_drvdata(dev, cdns);
 
 	ret = platform_get_irq_byname(pdev, "host");
 	if (ret < 0)
@@ -195,14 +188,41 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(cdns3_core_probe);
 
 /**
- * cdns3_plat_remove() - unbind drd driver and clean up
- * @pdev: Pointer to Linux platform device
+ * cdns3_plat_probe - probe for cdns3 core device
+ * @pdev: Pointer to cdns3 core platform device
+ *
+ * Returns 0 on success otherwise negative errno
  */
-static void cdns3_plat_remove(struct platform_device *pdev)
+static int cdns3_plat_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cdns *cdns;
+	struct cdns3_probe_data probe_data;
+
+	cdns = devm_kzalloc(dev, sizeof(*cdns), GFP_KERNEL);
+	if (!cdns)
+		return -ENOMEM;
+
+	cdns->dev = dev;
+	cdns->pdata = dev_get_platdata(dev);
+	if (cdns->pdata && cdns->pdata->override_apb_timeout)
+		cdns->override_apb_timeout = cdns->pdata->override_apb_timeout;
+
+	probe_data.cdns = cdns;
+	probe_data.pdev = pdev;
+
+	return cdns3_core_probe(&probe_data);
+}
+
+/**
+ * cdns3_core_remove - Tear down the Cadence USB3 platform core
+ * @cdns: Controller context previously initialized by cdns3_core_probe()
+ */
+void cdns3_core_remove(struct cdns *cdns)
 {
-	struct cdns *cdns = platform_get_drvdata(pdev);
 	struct device *dev = cdns->dev;
 
 	pm_runtime_get_sync(dev);
@@ -213,24 +233,30 @@ static void cdns3_plat_remove(struct platform_device *pdev)
 	phy_exit(cdns->usb2_phy);
 	phy_exit(cdns->usb3_phy);
 }
+EXPORT_SYMBOL_GPL(cdns3_core_remove);
+
+/**
+ * cdns3_plat_remove() - unbind drd driver and clean up
+ * @pdev: Pointer to Linux platform device
+ */
+static void cdns3_plat_remove(struct platform_device *pdev)
+{
+	cdns3_core_remove(platform_get_drvdata(pdev));
+}
 
 #ifdef CONFIG_PM
 
-static int cdns3_set_platform_suspend(struct device *dev,
-				      bool suspend, bool wakeup)
+static int cdns3_set_platform_suspend(struct cdns *cdns, bool suspend, bool wakeup)
 {
-	struct cdns *cdns = dev_get_drvdata(dev);
-	int ret = 0;
-
 	if (cdns->pdata && cdns->pdata->platform_suspend)
-		ret = cdns->pdata->platform_suspend(dev, suspend, wakeup);
+		return cdns->pdata->platform_suspend(cdns->dev, suspend, wakeup);
 
-	return ret;
+	return 0;
 }
 
-static int cdns3_controller_suspend(struct device *dev, pm_message_t msg)
+static int cdns3_controller_suspend(struct cdns *cdns, pm_message_t msg)
 {
-	struct cdns *cdns = dev_get_drvdata(dev);
+	struct device *dev = cdns->dev;
 	bool wakeup;
 	unsigned long flags;
 
@@ -242,7 +268,7 @@ static int cdns3_controller_suspend(struct device *dev, pm_message_t msg)
 	else
 		wakeup = device_may_wakeup(dev);
 
-	cdns3_set_platform_suspend(cdns->dev, true, wakeup);
+	cdns3_set_platform_suspend(cdns, true, wakeup);
 	set_phy_power_off(cdns);
 	spin_lock_irqsave(&cdns->lock, flags);
 	cdns->in_lpm = true;
@@ -252,9 +278,8 @@ static int cdns3_controller_suspend(struct device *dev, pm_message_t msg)
 	return 0;
 }
 
-static int cdns3_controller_resume(struct device *dev, pm_message_t msg)
+static int cdns3_controller_resume(struct cdns *cdns, pm_message_t msg)
 {
-	struct cdns *cdns = dev_get_drvdata(dev);
 	int ret;
 	unsigned long flags;
 
@@ -277,7 +302,7 @@ static int cdns3_controller_resume(struct device *dev, pm_message_t msg)
 	if (ret)
 		return ret;
 
-	cdns3_set_platform_suspend(cdns->dev, false, false);
+	cdns3_set_platform_suspend(cdns, false, false);
 
 	spin_lock_irqsave(&cdns->lock, flags);
 	cdns_resume(cdns);
@@ -293,26 +318,37 @@ static int cdns3_controller_resume(struct device *dev, pm_message_t msg)
 	return ret;
 }
 
-static int cdns3_plat_runtime_suspend(struct device *dev)
+int cdns3_runtime_suspend(struct cdns *cdns)
 {
-	return cdns3_controller_suspend(dev, PMSG_AUTO_SUSPEND);
+	return cdns3_controller_suspend(cdns, PMSG_AUTO_SUSPEND);
 }
+EXPORT_SYMBOL_GPL(cdns3_runtime_suspend);
 
-static int cdns3_plat_runtime_resume(struct device *dev)
+int cdns3_runtime_resume(struct cdns *cdns)
 {
-	return cdns3_controller_resume(dev, PMSG_AUTO_RESUME);
+	return cdns3_controller_resume(cdns, PMSG_AUTO_RESUME);
 }
+EXPORT_SYMBOL_GPL(cdns3_runtime_resume);
 
-#ifdef CONFIG_PM_SLEEP
+static int cdns3_dev_runtime_suspend(struct device *dev)
+{
+	return cdns3_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int cdns3_dev_runtime_resume(struct device *dev)
+{
+	return cdns3_runtime_resume(dev_get_drvdata(dev));
+}
 
-static int cdns3_plat_suspend(struct device *dev)
+#ifdef CONFIG_PM_SLEEP
+int cdns3_pm_suspend(struct cdns *cdns)
 {
-	struct cdns *cdns = dev_get_drvdata(dev);
+	struct device *dev = cdns->dev;
 	int ret;
 
 	cdns_suspend(cdns);
 
-	ret = cdns3_controller_suspend(dev, PMSG_SUSPEND);
+	ret = cdns3_controller_suspend(cdns, PMSG_SUSPEND);
 	if (ret)
 		return ret;
 
@@ -321,18 +357,30 @@ static int cdns3_plat_suspend(struct device *dev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(cdns3_pm_suspend);
+
+int cdns3_pm_resume(struct cdns *cdns)
+{
+	return cdns3_controller_resume(cdns, PMSG_RESUME);
+}
+EXPORT_SYMBOL_GPL(cdns3_pm_resume);
+
+static int cdns3_dev_pm_suspend(struct device *dev)
+{
+	return cdns3_pm_suspend(dev_get_drvdata(dev));
+}
 
-static int cdns3_plat_resume(struct device *dev)
+static int cdns3_dev_pm_resume(struct device *dev)
 {
-	return cdns3_controller_resume(dev, PMSG_RESUME);
+	return cdns3_pm_resume(dev_get_drvdata(dev));
 }
 #endif /* CONFIG_PM_SLEEP */
 #endif /* CONFIG_PM */
 
 static const struct dev_pm_ops cdns3_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(cdns3_plat_suspend, cdns3_plat_resume)
-	SET_RUNTIME_PM_OPS(cdns3_plat_runtime_suspend,
-			   cdns3_plat_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(cdns3_dev_pm_suspend, cdns3_dev_pm_resume)
+	SET_RUNTIME_PM_OPS(cdns3_dev_runtime_suspend,
+			   cdns3_dev_runtime_resume, NULL)
 };
 
 #ifdef CONFIG_OF
diff --git a/drivers/usb/cdns3/glue.h b/drivers/usb/cdns3/glue.h
new file mode 100644
index 000000000000..67cd1073b555
--- /dev/null
+++ b/drivers/usb/cdns3/glue.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * glue.h - Cadence USB3 DRD glue header
+ */
+
+#ifndef __DRIVERS_USB_CDNS3_GLUE_H
+#define __DRIVERS_USB_CDNS3_GLUE_H
+
+#include <linux/types.h>
+
+#include "core.h"
+
+struct platform_device;
+
+/**
+ * struct cdns3_probe_data - Parameters passed to cdns3_core_probe()
+ * @cdns: Cadence DRD controller context (allocated by the glue driver)
+ * @pdev: Platform device for resources and IRQs
+ */
+struct cdns3_probe_data {
+	struct cdns *cdns;
+	struct platform_device *pdev;
+};
+
+/**
+ * cdns3_core_probe - Initialize the Cadence USB3 platform core
+ * @data: Controller context and platform device supplied by the glue layer
+ *
+ * Performs resource mapping, PHY setup, cdns_init(), role setup, and runtime PM
+ * configuration for the standard platform binding of the Cadence USB3/USBSSP DRD IP.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cdns3_core_probe(const struct cdns3_probe_data *data);
+
+/**
+ * cdns3_core_remove - Tear down the Cadence USB3 platform core
+ * @cdns: Controller context previously initialized by cdns3_core_probe()
+ */
+void cdns3_core_remove(struct cdns *cdns);
+
+/*
+ * The following callbacks are for glue drivers to invoke from their own
+ * &dev_pm_ops, so platform-specific work can wrap the shared controller logic.
+ */
+int cdns3_runtime_suspend(struct cdns *cdns);
+int cdns3_runtime_resume(struct cdns *cdns);
+int cdns3_pm_suspend(struct cdns *cdns);
+int cdns3_pm_resume(struct cdns *cdns);
+
+#endif /* __DRIVERS_USB_CDNS3_GLUE_H */
-- 
2.50.1


