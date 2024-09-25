Return-Path: <linux-usb+bounces-15410-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4522B98511B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 04:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67A951C22CE5
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 02:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1D3149C4B;
	Wed, 25 Sep 2024 02:51:03 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B0F647;
	Wed, 25 Sep 2024 02:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727232663; cv=none; b=NMWz+6b7Jcs7jCweBHxQ8aVob1lSUFAWkDKBjBpXVdcgwstXW1aqDF/ofCKAsmtcclca8wGoV14EJrX47AbEabP+TaDiFCwuMOkE92cMthzutC+x8xFFgQylqIcEnw9w+rPqJfQgBhbmyp/ARUBnDueJaoaS+IkCYqYz70LM1jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727232663; c=relaxed/simple;
	bh=X4i0ZHgtKU7Kwg4TLW6QIIbvLLD68f4+T4tliHc1Q8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SMVtvhzEir5tJp8eHDWalG5TB0S1jq5JBp5F9vm5ShgtrplTdiUQexD8gFjsQEbkzyZjDmITApkbaA5GBSK1G61UofFKNVn5h56TSOaIgHywdw1P2CZLpWovgwoy3DrqP02jK70K06ea659bn8mw81nFrUZkntRWWAS1umL7nQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f7d466be7ae811efa216b1d71e6e1362-20240925
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_TXT, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_UNTRUSTED, SA_LOWREP, SA_EXISTED, SN_UNTRUSTED, SN_UNFAMILIAR
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD
	AMN_C_TI, AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:18718b90-26fc-4408-8b40-5aaaf0e9f18f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-INFO: VERSION:1.1.38,REQID:18718b90-26fc-4408-8b40-5aaaf0e9f18f,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:82c5f88,CLOUDID:eff6b00a5657bc2d841e4c61fd906f9e,BulkI
	D:240925105050B74JZEQX,BulkQuantity:0,Recheck:0,SF:66|38|17|19|102,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: f7d466be7ae811efa216b1d71e6e1362-20240925
X-User: dengjie03@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1752275317; Wed, 25 Sep 2024 10:50:48 +0800
From: dengjie <dengjie03@kylinos.cn>
To: rafael@kernel.org,
	pavel@ucw.cz,
	len.brown@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	xiehongyu1@kylinos.cn,
	duanchenghao@kylinos.cn,
	xiongxin@kylinos.cn,
	dengjie <dengjie03@kylinos.cn>
Subject: [PATCH v2] USB: Fix the issue of S4 wakeup queisce phase where task resumption fails due to USB status
Date: Wed, 25 Sep 2024 10:50:41 +0800
Message-Id: <20240925025041.149206-1-dengjie03@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923100553.119324-1-dengjie03@kylinos.cn>
References: <20240923100553.119324-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reproduction of the problem: During the S4 stress test, when a USB device is inserted or
removed, there is a probability that the S4 wakeup will turn into a reboot.The following
two points describe how to analyze and locate the problem points:

1. During the boot stage when S4 is awakened, after the USB RootHub is initialized,
it will enter the runtime suspend state. From then on, whenever an xhci port change
event occurs, it will trigger a remote wakeup request event and add wakeup_work
to pm_wq, where the subsequent RootHub runtime resume process will be handled by pm_wq.

xhci runtime suspend flow：
S4 boot
   |->xhci init
       |->register_root_hub
	   |->hub_probe
	       |->callback = RPM_GET_CALLBACK(dev, runtime_suspend)   /* xhci RootHub runtime suspend */

xhci runtime resume flow ：
xhci_irq()
    |->xhci_handle_event()
	|->handle_port_status()
   	    |->if(hcd->state == HC_STATE_SUSPENDED)
		 |->usb_hcd_resume_root_hub()
		    |->set_bit(HCD_FLAG_WAKEUP_PENDING, &hcd->flags)   /* wakeup pending signal to be set */
  		    |->queue_work(pm_wq, &hcd->wakeup_work)
			|->hcd_resume_work()			       /* hcd->wakeup_work */
			    |->usb_remote_wakeup()
				|->callback = RPM_GET_CALLBACK(dev, runtime_resume)
				    |->usb_runtime_resume()            /* usb runtime resume  */
					|->generic_resume()
					    |->hcd_bus_resume()
						|->clear_bit(HCD_FLAG_WAKEUP_PENDING, &hcd->flags);
						  /* wakeup pending signal to be clear */

2. However, during the quiesce phase of S4 wakeup, freeze_kernel_threads() will freeze this pm_wq,
and between freeze_kernel_threads() and dpm_suspend_start(), there exists a very time-consuming
S4 image loading process. This leads to a situation where, if an xhci port change event occurs
after freeze_kernel_threads(), triggering the wakeup pending signal to be set,but it cannot
be processed by pm_wq to clear this wakeup_pending bit, it will result in a subsequent
dpm_suspend_start() where USB suspend_common() detects the wakeup pending signal being
set and returns an -EBUSY error, interrupting the S4 quiesce process and reverting to a reboot.

S4 wakeup
    |->resume_store
	|->software_resume()
	    |->freeze_kernel_threads()		/* will freeze pm_wq */
	    |->load_image_and_restore()
		  |->swsusp_read()    	        /* S4 image loading: time-consuming .
When an xhci port change event occurs at this point, it triggers the wakeup pending signal to be set.
However, since the pm_wq is in a frozen state, the wakeup_pending bit cannot be cleared.*/
   		  |->hibernation_restore
			|->dpm_suspend_start(PMSG_QUIESCE)
			    |->hcd_pci_suspend()
				|->suspend_common()
				    |->if (do_wakeup && HCD_WAKEUP_PENDING(hcd))  return -EBUSY;

Below is a description of the countermeasures taken to address this issue:
1. Considering the restore process that occurs after the quiesce phase during S4 wakeup,
which essentially resets all root hubs,checking this wakeup pending status in USB suspend_common()
during the quiesce phase is of little significance and should therefore be filtered out.

S4 wakeup restore phase
    |->dpm_resume(PMSG_RESTORE)
	|->hcd_pci_restore()
	    |->xhci_resume()		       /* reset all root hubs */

Fixes: 3904bdf0821c ("PM: hibernate: Freeze kernel threads in software_resume()")
Signed-off-by: dengjie <dengjie03@kylinos.cn>
---
v2:
	* Fix the formatting issues and function naming conventions in the v1 patch.
v1:
	* USB: Fix the issue of S4 wakeup queisce phase where task resumption fails
 	   due to USB status.
---

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index fb4d18a0b185..7723e7082a36 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -559,6 +559,11 @@ bool dev_pm_may_skip_resume(struct device *dev)
 	return !dev->power.must_resume && pm_transition.event != PM_EVENT_RESTORE;
 }
 
+bool pm_event_is_queisce(void)
+{
+	return pm_transition.event == PM_EVENT_QUIESCE;
+}
+
 static pm_callback_t dpm_subsys_resume_noirq_cb(struct device *dev,
 						pm_message_t state,
 						const char **info_p)
diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 77830f120834..af2c60049e4a 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -456,18 +456,25 @@ static int suspend_common(struct device *dev, bool do_wakeup)
 		/* Optimization: Don't suspend if a root-hub wakeup is
 		 * pending and it would cause the HCD to wake up anyway.
 		 */
-		if (do_wakeup && HCD_WAKEUP_PENDING(hcd))
-			return -EBUSY;
-		if (do_wakeup && hcd->shared_hcd &&
-				HCD_WAKEUP_PENDING(hcd->shared_hcd))
+		/* Considering the restore process that occurs after
+		 * the quiesce phase during S4 wakeup, which essentially
+		 * resets all root hubs,checking this wakeup pending status
+		 * in USB suspend_common() during the quiesce phase is of
+		 * little significance and should therefore be filtered out.
+		 */
+		if (!pm_event_is_queisce() && do_wakeup &&
+		    (HCD_WAKEUP_PENDING(hcd) ||
+		     (hcd->shared_hcd &&
+		      HCD_WAKEUP_PENDING(hcd->shared_hcd))))
 			return -EBUSY;
 		retval = hcd->driver->pci_suspend(hcd, do_wakeup);
 		suspend_report_result(hcd->driver->pci_suspend, retval);
 
 		/* Check again in case wakeup raced with pci_suspend */
-		if ((retval == 0 && do_wakeup && HCD_WAKEUP_PENDING(hcd)) ||
-				(retval == 0 && do_wakeup && hcd->shared_hcd &&
-				 HCD_WAKEUP_PENDING(hcd->shared_hcd))) {
+		if (retval == 0 && !pm_event_is_queisce() && do_wakeup &&
+		    (HCD_WAKEUP_PENDING(hcd) ||
+		     (hcd->shared_hcd &&
+		      HCD_WAKEUP_PENDING(hcd->shared_hcd)))) {
 			if (hcd->driver->pci_resume)
 				hcd->driver->pci_resume(hcd, false);
 			retval = -EBUSY;
diff --git a/include/linux/pm.h b/include/linux/pm.h
index 4c441be03079..dad87c9ecfee 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -758,6 +758,7 @@ extern void pm_generic_complete(struct device *dev);
 
 extern bool dev_pm_may_skip_resume(struct device *dev);
 extern bool dev_pm_smart_suspend_and_suspended(struct device *dev);
+extern bool pm_event_is_queisce(void);
 
 #else /* !CONFIG_PM_SLEEP */
 
-- 
2.25.1


