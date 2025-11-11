Return-Path: <linux-usb+bounces-30399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB822C4CD0F
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 10:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A10FA4FA458
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 09:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CB12F5478;
	Tue, 11 Nov 2025 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7XYB9UN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3192F3C39
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854698; cv=none; b=hwoI7j+bWbA2Cuujy28z+KjnphcF8I6eozNOkCs78QsSKwR6cgz0GVua8rYT//KzAjYGIrVm6jF/FslBjH6lr6T9HZUjP9WJjcBre5CEnv6pye+kHFYxcLNN5EmcBa23ssf83tcn7Ykd85quHQHmUj7I+Q2UV++d+HrGgvI8pC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854698; c=relaxed/simple;
	bh=Y7lFmqRsV4bZwQoIu6pserRumxE9CBFNv1k1mJeHTx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a/m7NQ/KdllfhhVUxkP8ZdE9ZYyLhfWn+Egpewz4Fkap/JNfbjStt7IhZwa4e9kYas5IY6ECTaD8DJWzUiegUIAYA+xhuFWl8lK3mzzYKWS12fB/IrJFi5HVoop2Q2abRJMm2ycG193DprANLGwPEtXGJj5C1Qo1J01KOfsvewU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7XYB9UN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762854696; x=1794390696;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y7lFmqRsV4bZwQoIu6pserRumxE9CBFNv1k1mJeHTx4=;
  b=J7XYB9UN1ml4YWnsr8BJ6yP3VnEbKUmzin/pntwOZSMVHBuTn/3TtdKG
   cCSkw2albbhSbimTYancsHJlfObR/UQIgBQ97p0oiceeKjgXLmJ+u/guy
   ZmEUvAVHIcZ6jCncj0w4sUJnXNt77dcVizFJxlZ9kPb+VqlYe0Dqq1NZz
   9hr9uc1zXx1eSbLtGDg6OAJ5aKi4ttKp/uMDjkROeXFGQexEktHMWsppF
   uK1beycsIzhJPArqKIgUHbZy4TX/BsgWNOLnkTW+6bDMgI8LkGG9/qPS+
   GpdZvIUKHj+ZAETu6j9V2Dnsg4Pa4KC+opuZsjhY07P3NkO/3Vg3U7Gny
   g==;
X-CSE-ConnectionGUID: j86vnKcMRZ+lkuqO+vBn1g==
X-CSE-MsgGUID: HHTZ4dwSSbmQVxuvnSuyHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67518667"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="67518667"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 01:51:35 -0800
X-CSE-ConnectionGUID: 6x7xOLpISGKlhw2iOlucbw==
X-CSE-MsgGUID: tbgCxjF/S2SvVvZCmXypDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="194117241"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.96])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 01:51:31 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3439311F983;
	Tue, 11 Nov 2025 11:51:28 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vIl1x-00000000Oip-0FXu;
	Tue, 11 Nov 2025 11:51:17 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bastien Nocera <hadess@hadess.net>,
	Bin Liu <b-liu@ti.com>
Subject: [RESEND PATCH 1/1] usb: Remove redundant pm_runtime_mark_last_busy() calls
Date: Tue, 11 Nov 2025 11:51:17 +0200
Message-ID: <20251111095117.95023-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> (MediaTek MTU3)
Acked-by: Peter Chen <peter.chen@kernel.org> (chipidea and cdns3)
---
 drivers/usb/cdns3/cdns3-gadget.c            | 1 -
 drivers/usb/cdns3/cdnsp-gadget.c            | 1 -
 drivers/usb/chipidea/core.c                 | 1 -
 drivers/usb/chipidea/otg_fsm.c              | 1 -
 drivers/usb/dwc3/core.c                     | 2 --
 drivers/usb/dwc3/dwc3-am62.c                | 1 -
 drivers/usb/dwc3/dwc3-imx8mp.c              | 1 -
 drivers/usb/dwc3/dwc3-pci.c                 | 1 -
 drivers/usb/dwc3/dwc3-xilinx.c              | 1 -
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 1 -
 drivers/usb/host/xhci-mtk.c                 | 1 -
 drivers/usb/host/xhci-tegra.c               | 1 -
 drivers/usb/misc/apple-mfi-fastcharge.c     | 1 -
 drivers/usb/mtu3/mtu3_plat.c                | 1 -
 drivers/usb/musb/musb_core.c                | 5 -----
 drivers/usb/musb/musb_debugfs.c             | 5 -----
 drivers/usb/musb/musb_dsps.c                | 1 -
 drivers/usb/musb/musb_gadget.c              | 4 ----
 drivers/usb/musb/omap2430.c                 | 1 -
 19 files changed, 31 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index d9d8dc05b235..168707213ed9 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -3251,7 +3251,6 @@ static void cdns3_gadget_exit(struct cdns *cdns)
 	priv_dev = cdns->gadget_dev;
 
 
-	pm_runtime_mark_last_busy(cdns->dev);
 	pm_runtime_put_autosuspend(cdns->dev);
 
 	usb_del_gadget(&priv_dev->gadget);
diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index 0252560cbc80..d37c29a253dd 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -1999,7 +1999,6 @@ static void cdnsp_gadget_exit(struct cdns *cdns)
 	struct cdnsp_device *pdev = cdns->gadget_dev;
 
 	devm_free_irq(pdev->dev, cdns->dev_irq, pdev);
-	pm_runtime_mark_last_busy(cdns->dev);
 	pm_runtime_put_autosuspend(cdns->dev);
 	usb_del_gadget(&pdev->gadget);
 	cdnsp_gadget_free_endpoints(pdev);
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 70597f40b999..fac11f20cf0a 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1375,7 +1375,6 @@ static int ci_controller_resume(struct device *dev)
 	ci->in_lpm = false;
 	if (ci->wakeup_int) {
 		ci->wakeup_int = false;
-		pm_runtime_mark_last_busy(ci->dev);
 		pm_runtime_put_autosuspend(ci->dev);
 		enable_irq(ci->irq);
 		if (ci_otg_is_fsm_mode(ci))
diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
index a093544482d5..929536dc96ec 100644
--- a/drivers/usb/chipidea/otg_fsm.c
+++ b/drivers/usb/chipidea/otg_fsm.c
@@ -629,7 +629,6 @@ int ci_otg_fsm_work(struct ci_hdrc *ci)
 				ci_otg_queue_work(ci);
 			}
 		} else if (ci->fsm.otg->state == OTG_STATE_A_HOST) {
-			pm_runtime_mark_last_busy(ci->dev);
 			pm_runtime_put_autosuspend(ci->dev);
 			return 0;
 		}
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 96f85eada047..d7f340f22595 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -282,7 +282,6 @@ static void __dwc3_set_mode(struct work_struct *work)
 	}
 
 out:
-	pm_runtime_mark_last_busy(dwc->dev);
 	pm_runtime_put_autosuspend(dwc->dev);
 	mutex_unlock(&dwc->mutex);
 }
@@ -2658,7 +2657,6 @@ int dwc3_runtime_idle(struct dwc3 *dwc)
 		break;
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index 9db8f3ca493d..e11d7643f966 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -292,7 +292,6 @@ static int dwc3_ti_probe(struct platform_device *pdev)
 	/* Setting up autosuspend */
 	pm_runtime_set_autosuspend_delay(dev, DWC3_AM62_AUTOSUSPEND_DELAY);
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	return 0;
 
diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 225d59e9c190..45c276a31d84 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -312,7 +312,6 @@ static int dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
 	if (dwc3_imx->wakeup_pending) {
 		dwc3_imx->wakeup_pending = false;
 		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE) {
-			pm_runtime_mark_last_busy(dwc->dev);
 			pm_runtime_put_autosuspend(dwc->dev);
 		} else {
 			/*
diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 39c72cb52ce7..ce7b76d24fb2 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -322,7 +322,6 @@ static void dwc3_pci_resume_work(struct work_struct *work)
 		return;
 	}
 
-	pm_runtime_mark_last_busy(&dwc3->dev);
 	pm_runtime_put_sync_autosuspend(&dwc3->dev);
 }
 #endif
diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 1e28d6f50ed0..0a8c47876ff9 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -383,7 +383,6 @@ static int __maybe_unused dwc3_xlnx_runtime_resume(struct device *dev)
 
 static int __maybe_unused dwc3_xlnx_runtime_idle(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
index 7e69944ef18a..9b53daf76583 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
@@ -2415,7 +2415,6 @@ int cdns2_gadget_resume(struct cdns2_device *pdev, bool hibernated)
 
 void cdns2_gadget_remove(struct cdns2_device *pdev)
 {
-	pm_runtime_mark_last_busy(pdev->dev);
 	pm_runtime_put_autosuspend(pdev->dev);
 
 	usb_del_gadget(&pdev->gadget);
diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 208558cf822d..06043c7c3100 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -670,7 +670,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	}
 
 	device_enable_async_suspend(dev);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	pm_runtime_forbid(dev);
 
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 5255b1002893..aa67f8b49928 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1399,7 +1399,6 @@ static void tegra_xhci_id_work(struct work_struct *work)
 		}
 
 		tegra_xhci_set_port_power(tegra, true, true);
-		pm_runtime_mark_last_busy(tegra->dev);
 
 	} else {
 		if (tegra->otg_usb3_port >= 0)
diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
index 8e852f4b8262..47b38dcc2992 100644
--- a/drivers/usb/misc/apple-mfi-fastcharge.c
+++ b/drivers/usb/misc/apple-mfi-fastcharge.c
@@ -134,7 +134,6 @@ static int apple_mfi_fc_set_property(struct power_supply *psy,
 		ret = -EINVAL;
 	}
 
-	pm_runtime_mark_last_busy(&mfi->udev->dev);
 	pm_runtime_put_autosuspend(&mfi->udev->dev);
 
 	return ret;
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 7b5a431acb56..cc8a864dbd63 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -431,7 +431,6 @@ static int mtu3_probe(struct platform_device *pdev)
 	}
 
 	device_enable_async_suspend(dev);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	pm_runtime_forbid(dev);
 
diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index c7234b236971..0acc62569ae5 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2031,7 +2031,6 @@ static void musb_pm_runtime_check_session(struct musb *musb)
 		if (!musb->session)
 			break;
 		trace_musb_state(musb, devctl, "Allow PM on possible host mode disconnect");
-		pm_runtime_mark_last_busy(musb->controller);
 		pm_runtime_put_autosuspend(musb->controller);
 		musb->session = false;
 		return;
@@ -2063,7 +2062,6 @@ static void musb_pm_runtime_check_session(struct musb *musb)
 					      msecs_to_jiffies(3000));
 	} else {
 		trace_musb_state(musb, devctl, "Allow PM with no session");
-		pm_runtime_mark_last_busy(musb->controller);
 		pm_runtime_put_autosuspend(musb->controller);
 	}
 
@@ -2090,7 +2088,6 @@ static void musb_irq_work(struct work_struct *data)
 		sysfs_notify(&musb->controller->kobj, NULL, "mode");
 	}
 
-	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
 }
 
@@ -2564,7 +2561,6 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 	musb_init_debugfs(musb);
 
 	musb->is_initialized = 1;
-	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
 
 	return 0;
@@ -2887,7 +2883,6 @@ static int musb_resume(struct device *dev)
 			error);
 	spin_unlock_irqrestore(&musb->lock, flags);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/usb/musb/musb_debugfs.c b/drivers/usb/musb/musb_debugfs.c
index 2d623284edf6..5092d62c2062 100644
--- a/drivers/usb/musb/musb_debugfs.c
+++ b/drivers/usb/musb/musb_debugfs.c
@@ -106,7 +106,6 @@ static int musb_regdump_show(struct seq_file *s, void *unused)
 		}
 	}
 
-	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
 	return 0;
 }
@@ -119,7 +118,6 @@ static int musb_test_mode_show(struct seq_file *s, void *unused)
 
 	pm_runtime_get_sync(musb->controller);
 	test = musb_readb(musb->mregs, MUSB_TESTMODE);
-	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
 
 	if (test == (MUSB_TEST_FORCE_HOST | MUSB_TEST_FORCE_FS))
@@ -216,7 +214,6 @@ static ssize_t musb_test_mode_write(struct file *file,
 	musb_writeb(musb->mregs, MUSB_TESTMODE, test);
 
 ret:
-	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
 	return count;
 }
@@ -243,7 +240,6 @@ static int musb_softconnect_show(struct seq_file *s, void *unused)
 		reg = musb_readb(musb->mregs, MUSB_DEVCTL);
 		connect = reg & MUSB_DEVCTL_SESSION ? 1 : 0;
 
-		pm_runtime_mark_last_busy(musb->controller);
 		pm_runtime_put_autosuspend(musb->controller);
 		break;
 	default:
@@ -304,7 +300,6 @@ static ssize_t musb_softconnect_write(struct file *file,
 		}
 	}
 
-	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
 	return count;
 }
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index a08ce96c08d3..e3935f18dd56 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -296,7 +296,6 @@ static void otg_timer(struct timer_list *t)
 	if (err < 0)
 		dev_err(dev, "%s resume work: %i\n", __func__, err);
 	spin_unlock_irqrestore(&musb->lock, flags);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index caf4d4cd4b75..d666c4292753 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1258,7 +1258,6 @@ static int musb_gadget_queue(struct usb_ep *ep, struct usb_request *req,
 
 unlock:
 	spin_unlock_irqrestore(&musb->lock, lockflags);
-	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
 
 	return status;
@@ -1642,7 +1641,6 @@ static void musb_gadget_work(struct work_struct *work)
 	spin_lock_irqsave(&musb->lock, flags);
 	musb_pullup(musb, musb->softconnect);
 	spin_unlock_irqrestore(&musb->lock, flags);
-	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
 }
 
@@ -1862,7 +1860,6 @@ static int musb_gadget_start(struct usb_gadget *g,
 	if (musb->xceiv && musb->xceiv->last_event == USB_EVENT_ID)
 		musb_platform_set_vbus(musb, 1);
 
-	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
 
 	return 0;
@@ -1916,7 +1913,6 @@ static int musb_gadget_stop(struct usb_gadget *g)
 	usb_gadget_set_state(g, USB_STATE_NOTATTACHED);
 
 	/* Force check of devctl register for PM runtime */
-	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
 
 	return 0;
diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index c35c07b7488c..48bb9bfb2204 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -151,7 +151,6 @@ static void omap_musb_set_mailbox(struct omap2430_glue *glue)
 	default:
 		dev_dbg(musb->controller, "ID float\n");
 	}
-	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
 	atomic_notifier_call_chain(&musb->xceiv->notifier,
 			musb->xceiv->last_event, NULL);
-- 
2.47.3


