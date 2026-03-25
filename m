Return-Path: <linux-usb+bounces-35429-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iImjJ2WRw2mCrgQAu9opvQ
	(envelope-from <linux-usb+bounces-35429-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 08:40:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3548D320D6C
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 08:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AF7C304EAB6
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 07:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B350436A009;
	Wed, 25 Mar 2026 07:35:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023117.outbound.protection.outlook.com [40.107.44.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D58C36828B;
	Wed, 25 Mar 2026 07:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774424113; cv=fail; b=oaoap1rS430s7fopIcr4KjaN4c4IsCNujMswLJaJDwFZNg9iWISW1ADKhyGJAc0UEYlRh7KmAeQZGpmZF153bDuDWUTIkDHh0UU45m4PwMQRqTTonToEgcj77BbBNOdLXjEctLgeEFsvxF31P311QprLyyWTyZUM7lmUVnUkrYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774424113; c=relaxed/simple;
	bh=e70LNC4DXB/DQJdSbRVcQpeCVR/9SCIBrfY5ozr9bqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELWMyGoKx2wxB1lZN3L9qoS5ax22HmbBgT0GsNVgQLjCoLxKdIzdEua14BzwFSA4xHSv4VsfKB7debCu+ITVsM8DTzsjEQ4s6xUd6WaVw5PP0rBEJnyxQ1Hn3wd1a50ms2jL9+SCjma18uMEFLaaqqkbAIH8ZyR1M6pjWEWTU4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjgcZoQ2EHx9/IaIzAVq/PA17mMjLJ3vCAz9nYkI9YoumXVmBifqIyjH8zmZyeYZ1hG3awgYHACe3kShAroXp/JEEbS7ej7WLgTBNlBNeinkY/ln9kon5HEtA+v1UFMeQ7tpo8mBXMEqObt+STVM0AJs6RVoStocKTRD3jRIeYRtKhOYLtdXEbVUZkcZjIjsr+ulTMtQf/ak/pXrVQvuNQXzICK99pcc4c7C48cBwRT3BPEr4lFh+nb0vCEikuuhF/wbz97vn5tS7K8ZmOt7Cy6ZBFQ+Y64rYl/6VLtqZAFMcP8M5pfk07/WhQm316ZU/SaoptD6w3REK3t/Uxo4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=126z42EW8hnqgtvBDzphjXIgnxoNtdfvRo9Kla6L414=;
 b=Sps9J7XV8djGoQNmHo78Udmd+NCTvHze8ZQlcfz1pluhd7gbfvrx1pC8364y3xMdw1CfBsg2Gn2akLsCqBJF647FgAEMkIcTk8Nsl8TAELNu331NzjLEw3GK59bFeZKqX3sB3/cOneRLNsyx/Zg3SOLw9fni9nQBuA45kmoxBF/VNdBoB02/XK7OgZKh8FiY5s0xI3hGT5iqAn5tj19CBuo7fYpnFbg67fi93z883YUVUGdt7hVEMX/uQSvb4iMtXZ/Py5HFxMsotQZpbm9tuexAGcyf+k3uKMrknKFONSpQcYrh7gfVVrGURWDX0sG+ULB+D4BLwPg7q/0zU9A8GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0011.apcprd02.prod.outlook.com (2603:1096:3:17::23) by
 TYSPR06MB6435.apcprd06.prod.outlook.com (2603:1096:400:47c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 07:35:05 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:3:17:cafe::bf) by SG2PR02CA0011.outlook.office365.com
 (2603:1096:3:17::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 07:35:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 07:35:03 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1F18D40A5A9E;
	Wed, 25 Mar 2026 15:35:01 +0800 (CST)
Date: Wed, 25 Mar 2026 15:35:00 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Pawel Laszczak <pawell@cadence.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"rogerq@kernel.org" <rogerq@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"cix-kernel-upstream@cixtech.com" <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v2 2/2] usb: cdns3: Add USBSSP platform driver support
Message-ID: <acOQJMLwyT7QtCIQ@nchen-desktop>
References: <20260316064831.274865-1-peter.chen@cixtech.com>
 <20260316064831.274865-3-peter.chen@cixtech.com>
 <PH7PR07MB9538B73EB7746CED9A094447DD48A@PH7PR07MB9538.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PH7PR07MB9538B73EB7746CED9A094447DD48A@PH7PR07MB9538.namprd07.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|TYSPR06MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: b07d1415-866f-4a82-83cf-08de8a41075e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|7053199007|22082099003;
X-Microsoft-Antispam-Message-Info:
	ulE96E4yuuhwgso3gcbF0vFA90HNmIZ5EsDgnoRl53U7sEXElIdHaNXQXJIRg9ryfLhbJAGOvVNVlUi+Zr90jmyb2ijGGvVYQhZwVkHFyTmZRfrTi2+ZXCbLCtgBSuSfH+uh/S58o19oAHWzPm5uj48pQTQZfHFgih9I/AdSqD/a9qhD1C1YBJFR4FbU1dvDiXG0qCDEc3xCkG8+3hBZKY3N7Mj6GDrGr6xwtLpmUHIOQL++qcCdrqYpV1uq6mFsLlfaWLiJmGWimK3//L7TtJVGX+ujC04jbf2rwkUJiwpMmATXIEQWUV6hoQDwigiaHNo790afFG9x1r3Ve8AcxLFBFx3yHz28kWk8GOhWue8MT7eUxEYkosAj6SEy3TFy76ywmR/XdHzMFOElPRLkKwsBxq7Oyd5OaxfV6UYW7L6sXSd/EGuvWnASY3KuQ9SkHPNTV42ds0W0nAD6bW7OnDV8O6yWnEub+xG4fpD7xrIs0Y4c9ZxWMw6ymNnNAh9wliu8x7gMJ4lkNrDVxTPSQdgdLyNx1mhMJsRGNTHO6OCRJ4wx6Q9Q27fWoxa2q8MYa5mXqXNvTSEb4ejDyADRC9qYebBWg0kwqDZThmhltQSCUOgX0qKuP2RlJTO2vrUooochmdsxsSAJ1XMfKwAqcwKIuWTq6BUhihWyWYMHToseZCDXpSHwQrqb7B5ZSVTHks6gq6nlAEL8IiRUHA9x6AOSafKwG48RPPofrL3F+335PzpqwNF86i4avGTmG1PYn0tyw3ltqX6g8LFgZJA3FQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(7053199007)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KUOQuacqQ2DcxmP1cPZUsLJ8Wt7P1RfS2qASTuSV701b2TLTvRILL9DceuqdzLxUxx1RD14fXR3dXkUxn4KNOWpazmdu/sPFQ4jVjDj/AZ6lWem3Y4X31GDOR4Yvf5Sx/zfs0AS4Zp8EncyFgBnWyTmnN9r8SStxI1Dbw1rfRRmNUon7Le0UGOkQZb8TN2pWRMi5wxsqaM2SnttKwU7N4jtrlRY26Y46aVHqdZpHDa77PJ7+TikFwy47RQRjlFxgaCVw9/8yzQKHB+4mjzHcSjTpNLg1/cwd327jMrxQ4rliR96+E8IxP0J+W6oTHE+AUpCA75EGYkXca7CHA2XyeWxKUk2vkp5+ciEcPDgXCApIfp7PIIoCsBZbf5pKa5/x+7lIsbcim4qfb7e9Gw98T+anlEuDcJyiFZ0Hg4wL/mA6DCvOeh4+PHFYpXAAl+mG
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 07:35:03.1699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b07d1415-866f-4a82-83cf-08de8a41075e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6435
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[plat_info.id:url,plat_info.data:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cadence.com:email];
	TAGGED_FROM(0.00)[bounces-35429-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[cixtech.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3548D320D6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-24 12:10:43, Pawel Laszczak wrote:
> >
> >+static int cdns3_plat_gadget_init(struct cdns *cdns)
> >+{
> >+      if (cdns->version < CDNSP_CONTROLLER_V2)
> >+              return cdns3_gadget_init(cdns);
> >+      else
> >+              return cdnsp_gadget_init(cdns);
> >+}
> >+


> >@@ -143,12 +153,15 @@ static int cdns3_plat_probe(struct platform_device
> >*pdev)
> >       if (ret)
> >               goto err_phy_power_on;
> >
> >-      cdns->gadget_init = cdns3_gadget_init;
> >-
> >       ret = cdns_init(cdns);
> >       if (ret)
> >               goto err_cdns_init;
> >
> >+      cdns->gadget_init = cdns3_plat_gadget_init;
> 
> The call to the following function could have been placed in cdns_init.
> Then assigned of gadget_init  should be above of cdns_init.

No. It needs to know cdns->version before assigning gadget_init to know correct
.gadget_init for USBSS or USBSSP. And cdns->version is decided at cdns_init,
and former cdns_init API includes cdns_core_init_role which calls cdns->gadget_init.

Peter

> 
> Besides,
> Acked-by: Pawel Laszczak <pawell@cadence.com>
> 
> Pawel,
> 
> >+      ret = cdns_core_init_role(cdns);
> >+      if (ret)
> >+              goto err_cdns_init;
> >+
> >       device_set_wakeup_capable(dev, true);
> >       pm_runtime_set_active(dev);
> >       pm_runtime_enable(dev);
> >diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-
> >gadget.c
> >index 6b3815f8a6e5..8db7eee528a1 100644
> >--- a/drivers/usb/cdns3/cdnsp-gadget.c
> >+++ b/drivers/usb/cdns3/cdnsp-gadget.c
> >@@ -2075,3 +2075,7 @@ int cdnsp_gadget_init(struct cdns *cdns)
> >
> >       return 0;
> > }
> >+EXPORT_SYMBOL_GPL(cdnsp_gadget_init);
> >+
> >+MODULE_LICENSE("GPL");
> >+MODULE_DESCRIPTION("Cadence CDNSP DRD Driver - gadget");
> >diff --git a/drivers/usb/cdns3/cdnsp-pci.c b/drivers/usb/cdns3/cdnsp-pci.c
> >index 566d94e49102..432007cfe695 100644
> >--- a/drivers/usb/cdns3/cdnsp-pci.c
> >+++ b/drivers/usb/cdns3/cdnsp-pci.c
> >@@ -1,6 +1,6 @@
> > // SPDX-License-Identifier: GPL-2.0
> > /*
> >- * Cadence PCI Glue driver.
> >+ * Cadence USBSSP PCI Glue driver.
> >  *
> >  * Copyright (C) 2019 Cadence.
> >  *
> >@@ -16,7 +16,19 @@
> > #include <linux/pci.h>
> >
> > #include "core.h"
> >-#include "gadget-export.h"
> >+
> >+struct cdnsp_wrap {
> >+      struct platform_device *plat_dev;
> >+      struct resource dev_res[6];
> >+      int devfn;
> >+};
> >+
> >+#define RES_IRQ_HOST_ID               0
> >+#define RES_IRQ_PERIPHERAL_ID 1
> >+#define RES_IRQ_OTG_ID                2
> >+#define RES_HOST_ID           3
> >+#define RES_DEV_ID            4
> >+#define RES_DRD_ID            5
> >
> > #define PCI_BAR_HOST          0
> > #define PCI_BAR_OTG           0
> >@@ -26,16 +38,16 @@
> > #define PCI_DEV_FN_OTG                1
> >
> > #define PCI_DRIVER_NAME               "cdns-pci-usbssp"
> >-#define PLAT_DRIVER_NAME      "cdns-usbssp"
> >+#define PLAT_DRIVER_NAME      "cdns-usb3"
> >
> >-#define CHICKEN_APB_TIMEOUT_VALUE       0x1C20
> >+#define CHICKEN_APB_TIMEOUT_VALUE     0x1C20
> >
> > static struct pci_dev *cdnsp_get_second_fun(struct pci_dev *pdev)
> > {
> >       /*
> >        * Gets the second function.
> >-       * Platform has two function. The fist keeps resources for
> >-       * Host/Device while the secon keeps resources for DRD/OTG.
> >+       * Platform has two function. The first keeps resources for
> >+       * Host/Device while the second keeps resources for DRD/OTG.
> >        */
> >       if (pdev->device == PCI_DEVICE_ID_CDNS_USBSSP)
> >               return pci_get_device(pdev->vendor,
> >PCI_DEVICE_ID_CDNS_USBSS, NULL);
> >@@ -48,11 +60,12 @@ static struct pci_dev *cdnsp_get_second_fun(struct
> >pci_dev *pdev)
> > static int cdnsp_pci_probe(struct pci_dev *pdev,
> >                          const struct pci_device_id *id)
> > {
> >-      struct device *dev = &pdev->dev;
> >-      struct pci_dev *func;
> >+      struct platform_device_info plat_info;
> >+      static struct cdns3_platform_data pdata;
> >+      struct cdnsp_wrap *wrap;
> >       struct resource *res;
> >-      struct cdns *cdnsp;
> >-      int ret;
> >+      struct pci_dev *func;
> >+      int ret = 0;
> >
> >       /*
> >        * For GADGET/HOST PCI (devfn) function number is 0,
> >@@ -79,146 +92,105 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
> >       }
> >
> >       pci_set_master(pdev);
> >+
> >       if (pci_is_enabled(func)) {
> >-              cdnsp = pci_get_drvdata(func);
> >+              wrap = pci_get_drvdata(func);
> >       } else {
> >-              cdnsp = kzalloc_obj(*cdnsp);
> >-              if (!cdnsp) {
> >+              wrap = kzalloc_obj(*wrap);
> >+              if (!wrap) {
> >                       ret = -ENOMEM;
> >                       goto put_pci;
> >               }
> >       }
> >
> >-      /* For GADGET device function number is 0. */
> >-      if (pdev->devfn == 0) {
> >-              resource_size_t rsrc_start, rsrc_len;
> >-
> >-              /* Function 0: host(BAR_0) + device(BAR_1).*/
> >-              dev_dbg(dev, "Initialize resources\n");
> >-              rsrc_start = pci_resource_start(pdev, PCI_BAR_DEV);
> >-              rsrc_len = pci_resource_len(pdev, PCI_BAR_DEV);
> >-              res = devm_request_mem_region(dev, rsrc_start, rsrc_len,
> >"dev");
> >-              if (!res) {
> >-                      dev_dbg(dev, "controller already in use\n");
> >-                      ret = -EBUSY;
> >-                      goto free_cdnsp;
> >-              }
> >-
> >-              cdnsp->dev_regs = devm_ioremap(dev, rsrc_start, rsrc_len);
> >-              if (!cdnsp->dev_regs) {
> >-                      dev_dbg(dev, "error mapping memory\n");
> >-                      ret = -EFAULT;
> >-                      goto free_cdnsp;
> >-              }
> >-
> >-              cdnsp->dev_irq = pdev->irq;
> >-              dev_dbg(dev, "USBSS-DEV physical base addr: %pa\n",
> >-                      &rsrc_start);
> >-
> >-              res = &cdnsp->xhci_res[0];
> >-              res->start = pci_resource_start(pdev, PCI_BAR_HOST);
> >-              res->end = pci_resource_end(pdev, PCI_BAR_HOST);
> >-              res->name = "xhci";
> >-              res->flags = IORESOURCE_MEM;
> >-              dev_dbg(dev, "USBSS-XHCI physical base addr: %pa\n",
> >-                      &res->start);
> >-
> >-              /* Interrupt for XHCI, */
> >-              res = &cdnsp->xhci_res[1];
> >-              res->start = pdev->irq;
> >-              res->name = "host";
> >-              res->flags = IORESOURCE_IRQ;
> >+      res = wrap->dev_res;
> >+
> >+      if (pdev->devfn == PCI_DEV_FN_HOST_DEVICE) {
> >+              /* Function 0: host(BAR_0) + device(BAR_2). */
> >+              dev_dbg(&pdev->dev, "Initialize Device resources\n");
> >+              res[RES_DEV_ID].start = pci_resource_start(pdev,
> >PCI_BAR_DEV);
> >+              res[RES_DEV_ID].end = pci_resource_end(pdev,
> >PCI_BAR_DEV);
> >+              res[RES_DEV_ID].name = "dev";
> >+              res[RES_DEV_ID].flags = IORESOURCE_MEM;
> >+              dev_dbg(&pdev->dev, "USBSSP-DEV physical base addr:
> >%pa\n",
> >+                      &res[RES_DEV_ID].start);
> >+
> >+              res[RES_HOST_ID].start = pci_resource_start(pdev,
> >PCI_BAR_HOST);
> >+              res[RES_HOST_ID].end = pci_resource_end(pdev,
> >PCI_BAR_HOST);
> >+              res[RES_HOST_ID].name = "xhci";
> >+              res[RES_HOST_ID].flags = IORESOURCE_MEM;
> >+              dev_dbg(&pdev->dev, "USBSSP-XHCI physical base addr:
> >%pa\n",
> >+                      &res[RES_HOST_ID].start);
> >+
> >+              /* Interrupt for XHCI */
> >+              wrap->dev_res[RES_IRQ_HOST_ID].start = pdev->irq;
> >+              wrap->dev_res[RES_IRQ_HOST_ID].name = "host";
> >+              wrap->dev_res[RES_IRQ_HOST_ID].flags = IORESOURCE_IRQ;
> >+
> >+              /* Interrupt for device. It's the same as for HOST. */
> >+              wrap->dev_res[RES_IRQ_PERIPHERAL_ID].start = pdev->irq;
> >+              wrap->dev_res[RES_IRQ_PERIPHERAL_ID].name =
> >"peripheral";
> >+              wrap->dev_res[RES_IRQ_PERIPHERAL_ID].flags =
> >IORESOURCE_IRQ;
> >       } else {
> >-              res = &cdnsp->otg_res;
> >-              res->start = pci_resource_start(pdev, PCI_BAR_OTG);
> >-              res->end =   pci_resource_end(pdev, PCI_BAR_OTG);
> >-              res->name = "otg";
> >-              res->flags = IORESOURCE_MEM;
> >-              dev_dbg(dev, "CDNSP-DRD physical base addr: %pa\n",
> >-                      &res->start);
> >+              res[RES_DRD_ID].start = pci_resource_start(pdev,
> >PCI_BAR_OTG);
> >+              res[RES_DRD_ID].end = pci_resource_end(pdev,
> >PCI_BAR_OTG);
> >+              res[RES_DRD_ID].name = "otg";
> >+              res[RES_DRD_ID].flags = IORESOURCE_MEM;
> >+              dev_dbg(&pdev->dev, "CDNSP-DRD physical base addr:
> >%pa\n",
> >+                      &res[RES_DRD_ID].start);
> >
> >               /* Interrupt for OTG/DRD. */
> >-              cdnsp->otg_irq = pdev->irq;
> >+              wrap->dev_res[RES_IRQ_OTG_ID].start = pdev->irq;
> >+              wrap->dev_res[RES_IRQ_OTG_ID].name = "otg";
> >+              wrap->dev_res[RES_IRQ_OTG_ID].flags = IORESOURCE_IRQ;
> >       }
> >
> >-      /*
> >-       * Cadence PCI based platform require some longer timeout for APB
> >-       * to fixes domain clock synchronization issue after resuming
> >-       * controller from L1 state.
> >-       */
> >-      cdnsp->override_apb_timeout = CHICKEN_APB_TIMEOUT_VALUE;
> >-      pci_set_drvdata(pdev, cdnsp);
> >-
> >       if (pci_is_enabled(func)) {
> >-              cdnsp->dev = dev;
> >-              cdnsp->gadget_init = cdnsp_gadget_init;
> >-
> >-              ret = cdns_init(cdnsp);
> >-              if (ret)
> >-                      goto free_cdnsp;
> >+              /* set up platform device info */
> >+              pdata.override_apb_timeout =
> >CHICKEN_APB_TIMEOUT_VALUE;
> >+              memset(&plat_info, 0, sizeof(plat_info));
> >+              plat_info.parent = &pdev->dev;
> >+              plat_info.fwnode = pdev->dev.fwnode;
> >+              plat_info.name = PLAT_DRIVER_NAME;
> >+              plat_info.id = pdev->devfn;
> >+              plat_info.res = wrap->dev_res;
> >+              plat_info.num_res = ARRAY_SIZE(wrap->dev_res);
> >+              plat_info.dma_mask = pdev->dma_mask;
> >+              plat_info.data = &pdata;
> >+              plat_info.size_data = sizeof(pdata);
> >+              wrap->devfn = pdev->devfn;
> >+              /* register platform device */
> >+              wrap->plat_dev = platform_device_register_full(&plat_info);
> >+              if (IS_ERR(wrap->plat_dev)) {
> >+                      ret = PTR_ERR(wrap->plat_dev);
> >+                      kfree(wrap);
> >+                      goto put_pci;
> >+              }
> >       }
> >
> >-      device_wakeup_enable(&pdev->dev);
> >-      if (pci_dev_run_wake(pdev))
> >-              pm_runtime_put_noidle(&pdev->dev);
> >-
> >-      return 0;
> >-
> >-free_cdnsp:
> >-      if (!pci_is_enabled(func))
> >-              kfree(cdnsp);
> >-
> >+      pci_set_drvdata(pdev, wrap);
> > put_pci:
> >       pci_dev_put(func);
> >-
> >       return ret;
> > }
> >
> > static void cdnsp_pci_remove(struct pci_dev *pdev)
> > {
> >-      struct cdns *cdnsp;
> >+      struct cdnsp_wrap *wrap;
> >       struct pci_dev *func;
> >
> >       func = cdnsp_get_second_fun(pdev);
> >-      cdnsp = (struct cdns *)pci_get_drvdata(pdev);
> >+      wrap = pci_get_drvdata(pdev);
> >
> >-      if (pci_dev_run_wake(pdev))
> >-              pm_runtime_get_noresume(&pdev->dev);
> >+      if (wrap->devfn == pdev->devfn)
> >+              platform_device_unregister(wrap->plat_dev);
> >
> >-      if (pci_is_enabled(func)) {
> >-              cdns_remove(cdnsp);
> >-      } else {
> >-              kfree(cdnsp);
> >-      }
> >+      if (!pci_is_enabled(func))
> >+              kfree(wrap);
> >
> >       pci_dev_put(func);
> > }
> >
> >-static int __maybe_unused cdnsp_pci_suspend(struct device *dev)
> >-{
> >-      struct cdns *cdns = dev_get_drvdata(dev);
> >-
> >-      return cdns_suspend(cdns);
> >-}
> >-
> >-static int __maybe_unused cdnsp_pci_resume(struct device *dev)
> >-{
> >-      struct cdns *cdns = dev_get_drvdata(dev);
> >-      unsigned long flags;
> >-      int ret;
> >-
> >-      spin_lock_irqsave(&cdns->lock, flags);
> >-      ret = cdns_resume(cdns);
> >-      spin_unlock_irqrestore(&cdns->lock, flags);
> >-      cdns_set_active(cdns, 1);
> >-
> >-      return ret;
> >-}
> >-
> >-static const struct dev_pm_ops cdnsp_pci_pm_ops = {
> >-      SET_SYSTEM_SLEEP_PM_OPS(cdnsp_pci_suspend,
> >cdnsp_pci_resume)
> >-};
> >-
> > static const struct pci_device_id cdnsp_pci_ids[] = {
> >       { PCI_DEVICE(PCI_VENDOR_ID_CDNS, PCI_DEVICE_ID_CDNS_USBSSP),
> >         .class = PCI_CLASS_SERIAL_USB_DEVICE },
> >@@ -230,13 +202,10 @@ static const struct pci_device_id cdnsp_pci_ids[] = {
> > };
> >
> > static struct pci_driver cdnsp_pci_driver = {
> >-      .name = "cdnsp-pci",
> >+      .name = PCI_DRIVER_NAME,
> >       .id_table = cdnsp_pci_ids,
> >       .probe = cdnsp_pci_probe,
> >       .remove = cdnsp_pci_remove,
> >-      .driver = {
> >-              .pm = &cdnsp_pci_pm_ops,
> >-      }
> > };
> >
> > module_pci_driver(cdnsp_pci_driver);
> >@@ -245,4 +214,4 @@ MODULE_DEVICE_TABLE(pci, cdnsp_pci_ids);
> > MODULE_ALIAS("pci:cdnsp");
> > MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
> > MODULE_LICENSE("GPL v2");
> >-MODULE_DESCRIPTION("Cadence CDNSP PCI driver");
> >+MODULE_DESCRIPTION("Cadence CDNSP PCI wrapper");
> >diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> >index f0e32227c0b7..10f00b6c3c83 100644
> >--- a/drivers/usb/cdns3/core.c
> >+++ b/drivers/usb/cdns3/core.c
> >@@ -80,7 +80,7 @@ static void cdns_exit_roles(struct cdns *cdns)
> >  *
> >  * Returns 0 on success otherwise negative errno
> >  */
> >-static int cdns_core_init_role(struct cdns *cdns)
> >+int cdns_core_init_role(struct cdns *cdns)
> > {
> >       struct device *dev = cdns->dev;
> >       enum usb_dr_mode best_dr_mode;
> >@@ -197,11 +197,14 @@ static int cdns_core_init_role(struct cdns *cdns)
> >               goto err;
> >       }
> >
> >+      dev_dbg(dev, "Cadence USB3 core: probe succeed\n");
> >+
> >       return 0;
> > err:
> >       cdns_exit_roles(cdns);
> >       return ret;
> > }
> >+EXPORT_SYMBOL_GPL(cdns_core_init_role);
> >
> > /**
> >  * cdns_hw_role_state_machine  - role switch state machine based on hw
> >events.
> >@@ -469,14 +472,8 @@ int cdns_init(struct cdns *cdns)
> >       if (ret)
> >               goto init_failed;
> >
> >-      ret = cdns_core_init_role(cdns);
> >-      if (ret)
> >-              goto init_failed;
> >-
> >       spin_lock_init(&cdns->lock);
> >
> >-      dev_dbg(dev, "Cadence USB3 core: probe succeed\n");
> >-
> >       return 0;
> > init_failed:
> >       cdns_drd_exit(cdns);
> >diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
> >index 801be9e61340..dc8c4137de15 100644
> >--- a/drivers/usb/cdns3/core.h
> >+++ b/drivers/usb/cdns3/core.h
> >@@ -45,6 +45,7 @@ struct cdns3_platform_data {
> >       unsigned long quirks;
> > #define CDNS3_DEFAULT_PM_RUNTIME_ALLOW        BIT(0)
> > #define CDNS3_DRD_SUSPEND_RESIDENCY_ENABLE    BIT(1)
> >+      u32 override_apb_timeout;       /* 0 = use default (e.g. for PCI) */
> > };
> >
> > /**
> >@@ -119,14 +120,14 @@ struct cdns {
> >       struct cdns3_platform_data      *pdata;
> >       spinlock_t                      lock;
> >       struct xhci_plat_priv           *xhci_plat_data;
> >-      u32                             override_apb_timeout;
> >-
> >       int (*gadget_init)(struct cdns *cdns);
> >+      u32                             override_apb_timeout;
> > };
> >
> > int cdns_hw_role_switch(struct cdns *cdns);
> > int cdns_init(struct cdns *cdns);
> > int cdns_remove(struct cdns *cdns);
> >+int cdns_core_init_role(struct cdns *cdns);
> >
> > #ifdef CONFIG_PM_SLEEP
> > int cdns_resume(struct cdns *cdns);
> >diff --git a/drivers/usb/cdns3/gadget-export.h b/drivers/usb/cdns3/gadget-
> >export.h
> >index c37b6269b001..0cb600e2b5d2 100644
> >--- a/drivers/usb/cdns3/gadget-export.h
> >+++ b/drivers/usb/cdns3/gadget-export.h
> >@@ -10,7 +10,7 @@
> > #ifndef __LINUX_CDNS3_GADGET_EXPORT
> > #define __LINUX_CDNS3_GADGET_EXPORT
> >
> >-#if IS_ENABLED(CONFIG_USB_CDNSP_GADGET)
> >+#if defined(CONFIG_USB_CDNSP_GADGET) &&
> >IS_REACHABLE(CONFIG_USB_CDNSP)
> >
> > int cdnsp_gadget_init(struct cdns *cdns);
> > #else
> >@@ -22,7 +22,7 @@ static inline int cdnsp_gadget_init(struct cdns *cdns)
> >
> > #endif /* CONFIG_USB_CDNSP_GADGET */
> >
> >-#if IS_ENABLED(CONFIG_USB_CDNS3_GADGET)
> >+#if defined(CONFIG_USB_CDNS3_GADGET) &&
> >IS_REACHABLE(CONFIG_USB_CDNS3)
> >
> > int cdns3_gadget_init(struct cdns *cdns);
> > #else
> >--
> >2.50.1
> 

-- 

Best regards,
Peter

