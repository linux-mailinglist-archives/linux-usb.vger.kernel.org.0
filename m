Return-Path: <linux-usb+bounces-15692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0418399001F
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 11:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A04BE28528E
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 09:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A4E156C4B;
	Fri,  4 Oct 2024 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBxKzaAa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E0214A095
	for <linux-usb@vger.kernel.org>; Fri,  4 Oct 2024 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034913; cv=none; b=b3K4fZ60Hb+n4VteYlxPGVfe3L0yzBAerLmCt9hNy6cGeHmXtA8VFPdHo6i1ZLNOuCiiZ7IS/In2sSlg27H16KvwILB8kCdJmztovHFJIzC8ykObcu11a2WA3I/b3Im56SqIpiQ4QoBySXM1OD/hT4UtcNYWnOnOb8W5SKsH2yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034913; c=relaxed/simple;
	bh=zd76udQAsGVAs4t8tIKK/3pSzQdO5poc95QNHMpyW9c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LVNtXE2bBZaZYatdeC4XNrl5Q9dj0EB5rrU9yNNm1FYxYyhZstd4cNtES76IQzaDqsJHCdefcYyWxcKGlSz810xSe43XdRzUW7L0BkHCjQhLjg5d1dqQLEvmwcJT6DuD/yuQ+ARiSMQP6/sSbw8YUpEUrjc0BwUTCQoGh57nGzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBxKzaAa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034912; x=1759570912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zd76udQAsGVAs4t8tIKK/3pSzQdO5poc95QNHMpyW9c=;
  b=JBxKzaAaH2k9lSG7fKq0sgJRzx3T3C0zLbeQSQwJdSX/3sUfzU9/teEY
   fn4L6Y/VUsFFtcZHshYwYVzOtYFUVZ7Cvl3OXSzUQetkPikcwcdr8hy4k
   sUmAj/QXePvS3FQq5V/MCci3WW2ZIVC/D7g4q6J5JOj4uqf4nA6S6nNIM
   4PKHZjlpKbnFkGFotDC5qtXSbW1CU1X3mtSBmYTX/Qo4U/ZJlYZQJFjmy
   wm8+PdTHR6A+sxiXubAKxtmCg0XgpYvxDPKJ8mHIMUZUrYd1nFwiTtD1p
   s/hApRpJpDfot+pYRAHDDwbXVcRu2A4ClhQ/y67SlbrnrLNFMFMHQRM9K
   A==;
X-CSE-ConnectionGUID: M3SZWwsPR/SwFlGsF9gqSQ==
X-CSE-MsgGUID: V6HmapzZQ768YRHLPHXEog==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27136205"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27136205"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:51 -0700
X-CSE-ConnectionGUID: eVfAL0UaTSCZwMhvPQvy4A==
X-CSE-MsgGUID: zAEIMeY/RT+m9qVlfi1sgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105492089"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 435ED120E06;
	Fri,  4 Oct 2024 12:41:45 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoj-000Tgo-0q;
	Fri, 04 Oct 2024 12:41:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 45/51] usb: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:45 +0300
Message-Id: <20241004094145.114116-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/usb/cdns3/cdns3-gadget.c            |  2 +-
 drivers/usb/cdns3/cdnsp-gadget.c            |  2 +-
 drivers/usb/chipidea/core.c                 |  2 +-
 drivers/usb/chipidea/otg_fsm.c              |  2 +-
 drivers/usb/dwc3/core.c                     |  2 +-
 drivers/usb/dwc3/dwc3-am62.c                |  2 +-
 drivers/usb/dwc3/dwc3-imx8mp.c              |  2 +-
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c |  2 +-
 drivers/usb/host/xhci-mtk.c                 |  2 +-
 drivers/usb/misc/apple-mfi-fastcharge.c     |  2 +-
 drivers/usb/mtu3/mtu3_plat.c                |  2 +-
 drivers/usb/musb/musb_core.c                | 10 +++++-----
 drivers/usb/musb/musb_debugfs.c             | 10 +++++-----
 drivers/usb/musb/musb_dsps.c                |  2 +-
 drivers/usb/musb/musb_gadget.c              |  8 ++++----
 drivers/usb/musb/omap2430.c                 |  2 +-
 16 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index fd1beb10bba7..660bbf6d9f17 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -3250,7 +3250,7 @@ static void cdns3_gadget_exit(struct cdns *cdns)
 
 
 	pm_runtime_mark_last_busy(cdns->dev);
-	pm_runtime_put_autosuspend(cdns->dev);
+	__pm_runtime_put_autosuspend(cdns->dev);
 
 	usb_del_gadget(&priv_dev->gadget);
 	devm_free_irq(cdns->dev, cdns->dev_irq, priv_dev);
diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index 4a3f0f958256..47975436eec0 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -1948,7 +1948,7 @@ static void cdnsp_gadget_exit(struct cdns *cdns)
 
 	devm_free_irq(pdev->dev, cdns->dev_irq, pdev);
 	pm_runtime_mark_last_busy(cdns->dev);
-	pm_runtime_put_autosuspend(cdns->dev);
+	__pm_runtime_put_autosuspend(cdns->dev);
 	usb_del_gadget_udc(&pdev->gadget);
 	cdnsp_gadget_free_endpoints(pdev);
 	cdnsp_mem_cleanup(pdev);
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 835bf2428dc6..285cbb430e01 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1371,7 +1371,7 @@ static int ci_controller_resume(struct device *dev)
 	if (ci->wakeup_int) {
 		ci->wakeup_int = false;
 		pm_runtime_mark_last_busy(ci->dev);
-		pm_runtime_put_autosuspend(ci->dev);
+		__pm_runtime_put_autosuspend(ci->dev);
 		enable_irq(ci->irq);
 		if (ci_otg_is_fsm_mode(ci))
 			ci_otg_fsm_wakeup_by_srp(ci);
diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
index c17516c29b63..21d0eb6eed57 100644
--- a/drivers/usb/chipidea/otg_fsm.c
+++ b/drivers/usb/chipidea/otg_fsm.c
@@ -631,7 +631,7 @@ int ci_otg_fsm_work(struct ci_hdrc *ci)
 			}
 		} else if (ci->fsm.otg->state == OTG_STATE_A_HOST) {
 			pm_runtime_mark_last_busy(ci->dev);
-			pm_runtime_put_autosuspend(ci->dev);
+			__pm_runtime_put_autosuspend(ci->dev);
 			return 0;
 		}
 	}
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 9eb085f359ce..ec460e70082f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -265,7 +265,7 @@ static void __dwc3_set_mode(struct work_struct *work)
 
 out:
 	pm_runtime_mark_last_busy(dwc->dev);
-	pm_runtime_put_autosuspend(dwc->dev);
+	__pm_runtime_put_autosuspend(dwc->dev);
 	mutex_unlock(&dwc->mutex);
 }
 
diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index fad151e78fd6..dcc14c406f7f 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -282,7 +282,7 @@ static int dwc3_ti_probe(struct platform_device *pdev)
 	pm_runtime_set_autosuspend_delay(dev, DWC3_AM62_AUTOSUSPEND_DELAY);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 	return 0;
 
 err_pm_disable:
diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 64c0cd1995aa..c3b354f074c1 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -306,7 +306,7 @@ static int dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
 		dwc3_imx->wakeup_pending = false;
 		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE) {
 			pm_runtime_mark_last_busy(dwc->dev);
-			pm_runtime_put_autosuspend(dwc->dev);
+			__pm_runtime_put_autosuspend(dwc->dev);
 		} else {
 			/*
 			 * Add wait for xhci switch from suspend
diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
index 62fce42ef2da..aabe325069c6 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
@@ -2415,7 +2415,7 @@ int cdns2_gadget_resume(struct cdns2_device *pdev, bool hibernated)
 void cdns2_gadget_remove(struct cdns2_device *pdev)
 {
 	pm_runtime_mark_last_busy(pdev->dev);
-	pm_runtime_put_autosuspend(pdev->dev);
+	__pm_runtime_put_autosuspend(pdev->dev);
 
 	usb_del_gadget(&pdev->gadget);
 	cdns2_free_all_eps(pdev);
diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 3252e3d2d79c..c9d408860fce 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -671,7 +671,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 
 	device_enable_async_suspend(dev);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 	pm_runtime_forbid(dev);
 
 	return 0;
diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
index ac8695195c13..37be7548dc75 100644
--- a/drivers/usb/misc/apple-mfi-fastcharge.c
+++ b/drivers/usb/misc/apple-mfi-fastcharge.c
@@ -134,7 +134,7 @@ static int apple_mfi_fc_set_property(struct power_supply *psy,
 	}
 
 	pm_runtime_mark_last_busy(&mfi->udev->dev);
-	pm_runtime_put_autosuspend(&mfi->udev->dev);
+	__pm_runtime_put_autosuspend(&mfi->udev->dev);
 
 	return ret;
 }
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 6858ed9fc3b2..51ab1d360bf7 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -432,7 +432,7 @@ static int mtu3_probe(struct platform_device *pdev)
 
 	device_enable_async_suspend(dev);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 	pm_runtime_forbid(dev);
 
 	return 0;
diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index b24adb5b399f..f92b3a119f75 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2031,7 +2031,7 @@ static void musb_pm_runtime_check_session(struct musb *musb)
 			break;
 		trace_musb_state(musb, devctl, "Allow PM on possible host mode disconnect");
 		pm_runtime_mark_last_busy(musb->controller);
-		pm_runtime_put_autosuspend(musb->controller);
+		__pm_runtime_put_autosuspend(musb->controller);
 		musb->session = false;
 		return;
 	default:
@@ -2063,7 +2063,7 @@ static void musb_pm_runtime_check_session(struct musb *musb)
 	} else {
 		trace_musb_state(musb, devctl, "Allow PM with no session");
 		pm_runtime_mark_last_busy(musb->controller);
-		pm_runtime_put_autosuspend(musb->controller);
+		__pm_runtime_put_autosuspend(musb->controller);
 	}
 
 	musb->session = s;
@@ -2090,7 +2090,7 @@ static void musb_irq_work(struct work_struct *data)
 	}
 
 	pm_runtime_mark_last_busy(musb->controller);
-	pm_runtime_put_autosuspend(musb->controller);
+	__pm_runtime_put_autosuspend(musb->controller);
 }
 
 static void musb_recover_from_babble(struct musb *musb)
@@ -2564,7 +2564,7 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 
 	musb->is_initialized = 1;
 	pm_runtime_mark_last_busy(musb->controller);
-	pm_runtime_put_autosuspend(musb->controller);
+	__pm_runtime_put_autosuspend(musb->controller);
 
 	return 0;
 
@@ -2887,7 +2887,7 @@ static int musb_resume(struct device *dev)
 	spin_unlock_irqrestore(&musb->lock, flags);
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return 0;
 }
diff --git a/drivers/usb/musb/musb_debugfs.c b/drivers/usb/musb/musb_debugfs.c
index 2d623284edf6..bdb7a9dbe946 100644
--- a/drivers/usb/musb/musb_debugfs.c
+++ b/drivers/usb/musb/musb_debugfs.c
@@ -107,7 +107,7 @@ static int musb_regdump_show(struct seq_file *s, void *unused)
 	}
 
 	pm_runtime_mark_last_busy(musb->controller);
-	pm_runtime_put_autosuspend(musb->controller);
+	__pm_runtime_put_autosuspend(musb->controller);
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(musb_regdump);
@@ -120,7 +120,7 @@ static int musb_test_mode_show(struct seq_file *s, void *unused)
 	pm_runtime_get_sync(musb->controller);
 	test = musb_readb(musb->mregs, MUSB_TESTMODE);
 	pm_runtime_mark_last_busy(musb->controller);
-	pm_runtime_put_autosuspend(musb->controller);
+	__pm_runtime_put_autosuspend(musb->controller);
 
 	if (test == (MUSB_TEST_FORCE_HOST | MUSB_TEST_FORCE_FS))
 		seq_printf(s, "force host full-speed\n");
@@ -217,7 +217,7 @@ static ssize_t musb_test_mode_write(struct file *file,
 
 ret:
 	pm_runtime_mark_last_busy(musb->controller);
-	pm_runtime_put_autosuspend(musb->controller);
+	__pm_runtime_put_autosuspend(musb->controller);
 	return count;
 }
 
@@ -244,7 +244,7 @@ static int musb_softconnect_show(struct seq_file *s, void *unused)
 		connect = reg & MUSB_DEVCTL_SESSION ? 1 : 0;
 
 		pm_runtime_mark_last_busy(musb->controller);
-		pm_runtime_put_autosuspend(musb->controller);
+		__pm_runtime_put_autosuspend(musb->controller);
 		break;
 	default:
 		connect = -1;
@@ -305,7 +305,7 @@ static ssize_t musb_softconnect_write(struct file *file,
 	}
 
 	pm_runtime_mark_last_busy(musb->controller);
-	pm_runtime_put_autosuspend(musb->controller);
+	__pm_runtime_put_autosuspend(musb->controller);
 	return count;
 }
 
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index 9c7a8bbc0542..3d864c316043 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -296,7 +296,7 @@ static void otg_timer(struct timer_list *t)
 		dev_err(dev, "%s resume work: %i\n", __func__, err);
 	spin_unlock_irqrestore(&musb->lock, flags);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 }
 
 static void dsps_musb_clear_ep_rxintr(struct musb *musb, int epnum)
diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index bdf13911a1e5..9aa7e7398d32 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1251,7 +1251,7 @@ static int musb_gadget_queue(struct usb_ep *ep, struct usb_request *req,
 unlock:
 	spin_unlock_irqrestore(&musb->lock, lockflags);
 	pm_runtime_mark_last_busy(musb->controller);
-	pm_runtime_put_autosuspend(musb->controller);
+	__pm_runtime_put_autosuspend(musb->controller);
 
 	return status;
 }
@@ -1635,7 +1635,7 @@ static void musb_gadget_work(struct work_struct *work)
 	musb_pullup(musb, musb->softconnect);
 	spin_unlock_irqrestore(&musb->lock, flags);
 	pm_runtime_mark_last_busy(musb->controller);
-	pm_runtime_put_autosuspend(musb->controller);
+	__pm_runtime_put_autosuspend(musb->controller);
 }
 
 static int musb_gadget_pullup(struct usb_gadget *gadget, int is_on)
@@ -1855,7 +1855,7 @@ static int musb_gadget_start(struct usb_gadget *g,
 		musb_platform_set_vbus(musb, 1);
 
 	pm_runtime_mark_last_busy(musb->controller);
-	pm_runtime_put_autosuspend(musb->controller);
+	__pm_runtime_put_autosuspend(musb->controller);
 
 	return 0;
 
@@ -1908,7 +1908,7 @@ static int musb_gadget_stop(struct usb_gadget *g)
 
 	/* Force check of devctl register for PM runtime */
 	pm_runtime_mark_last_busy(musb->controller);
-	pm_runtime_put_autosuspend(musb->controller);
+	__pm_runtime_put_autosuspend(musb->controller);
 
 	return 0;
 }
diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index b4a4c1df4e0d..25ef19b05af6 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -152,7 +152,7 @@ static void omap_musb_set_mailbox(struct omap2430_glue *glue)
 		dev_dbg(musb->controller, "ID float\n");
 	}
 	pm_runtime_mark_last_busy(musb->controller);
-	pm_runtime_put_autosuspend(musb->controller);
+	__pm_runtime_put_autosuspend(musb->controller);
 	atomic_notifier_call_chain(&musb->xceiv->notifier,
 			musb->xceiv->last_event, NULL);
 }
-- 
2.39.5


