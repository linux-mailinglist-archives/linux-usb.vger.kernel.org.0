Return-Path: <linux-usb+bounces-12923-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87513946D82
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 10:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88089B20CB8
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 08:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC55200C7;
	Sun,  4 Aug 2024 08:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YKgBOs71"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D90FFC19
	for <linux-usb@vger.kernel.org>; Sun,  4 Aug 2024 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722761201; cv=none; b=tWkUPBu5BbUYoH9UcrOeYlRj8SZrvKxnsfNYbRSUd3+2d7G05pUlWV4uwycTJN2kBY22j7zRJ31y+2o3jmQhoTpYGrTEL6AQWMs99KgR9mlK204SKz/6zLyX41mIlQheeny9M+mAJ3Ccqtj2GjRTMHkkEMdwYsgLHOG6zmhtejo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722761201; c=relaxed/simple;
	bh=uIWyX7Iu+tfviez0bkoOq9uUhA73cj3V2rpJKZK5jac=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=C7y9ObNBTXVMQv0ajHnKUg8avNL5lyRpRsdTOjHkD4dIhoFf5IH66dXVgvdky3ODzYikIOEgwQCEXFjkUNDh2y24c8J9ZIapsT8a98ODsm4NIst6SzTJBJd9IRFzoD5Fzvm2uciQ3J1gl5QLByjNrMBSQ8i7Xcsu1Ovp7ocpuzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YKgBOs71; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6698f11853aso191769077b3.0
        for <linux-usb@vger.kernel.org>; Sun, 04 Aug 2024 01:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722761198; x=1723365998; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6M8YW/97huclA1gW/TKnb65DL5qWt+ctRlGI3kyliqY=;
        b=YKgBOs71jvwvsnpwmbKCJo8US0/ESfePBlVplFg1xo8si6lXFjS7bsH+Vo+fU0v+xj
         ljsXnKAzImPc9YziCE3QGueD0TaQS8RYQHWK03l/+60BLJUmMZYTljcWX5GDuhvVCj+P
         b0IABo27Ez/25Q6/hcTwPf5al6SgjNVdW9uYYDQWfakQHDYzrkjOCztNOy7qsa4l7GaY
         t1P5qXPGqThFYPPqq7yUNKeLipXLCCSTijAb6J2zao+LWxlpACGJxgfKSOb44FWnvOqT
         hpdzWH3YHGIv4ROt1kkjiBtREzElAw6tifdMxma4De437SwXRM/mATNLF1NzrXTD3AI3
         8CcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722761198; x=1723365998;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6M8YW/97huclA1gW/TKnb65DL5qWt+ctRlGI3kyliqY=;
        b=ZsS8CB9+rKDzIrbhAJuH5lfKVooPji0MnPFxgcGXFmTep+p9tagBqwz474eJkjjT3F
         hcmZTEkGB63Dly2xb2UjVBSN6ceVIvU4lyMz9yBaBQGfzCAYJog6o6zjp4Vf4tuKPblI
         8/j2uXhBqJ86yU4K+m4lRG1HzlYYSeyPZZ5oM7J4/Y4ffbFf7Xb6FL28gR/rKHr5lsWc
         d90jBLzPRL3eZzbSKwr737UVPE2oWANBTcfJ/EUHrM1n3goB3KIg+ZuLJZQHYVfZY0md
         +9AirK2RKNM/XUcX9AWtv1+1pX+aabVWaQxTT9nsvDlgTDkAmKgdWuaKOtE99pAoPBfQ
         4mqg==
X-Forwarded-Encrypted: i=1; AJvYcCVWQKJgHqDCHTQQgXvdkdHBWitggIkdm+8198SssP9+G+VWDoGC9zNwTYp5muEcN+Z3TS1nygquLy3YwNOQXBKTN964rsGqpS2+
X-Gm-Message-State: AOJu0YwM5xHMTC29dNNMef/Zqiovw8NQ0uiZOx6liIPeykmYW6n7awab
	HjeK7kLbgfrzYgSNEwoOG8DzKmkgMH2IHgmAPq9sUZSVUR61kow96vM+t/sDKB5taa0Zyz7Vmvd
	xxJ4w2Q==
X-Google-Smtp-Source: AGHT+IH03c2j+KIKSgCeHiW2+Q2D2XoDioOLAw2DF1Ifv/CEZPmxrzYO5GKrG0RoK1ZbsxIYZM0OeTaUeK5p
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:a7:c:a95c:c83d:79ae:99df])
 (user=kyletso job=sendgmr) by 2002:a05:690c:112:b0:65c:4528:d91c with SMTP id
 00721157ae682-6895964bcebmr8198927b3.0.1722761198530; Sun, 04 Aug 2024
 01:46:38 -0700 (PDT)
Date: Sun,  4 Aug 2024 16:46:12 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240804084612.2561230-1-kyletso@google.com>
Subject: [PATCH v3] usb: dwc3: Runtime get and put usb power_supply handle
From: Kyle Tso <kyletso@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, raychi@google.com
Cc: badhri@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	royluo@google.com, bvanassche@acm.org, Kyle Tso <kyletso@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

It is possible that the usb power_supply is registered after the probe
of dwc3. In this case, trying to get the usb power_supply during the
probe will fail and there is no chance to try again. Also the usb
power_supply might be unregistered at anytime so that the handle of it
in dwc3 would become invalid. To fix this, get the handle right before
calling to power_supply functions and put it afterward.

dwc3_gadet_vbus_draw might be in interrupt context. Create a kthread
worker beforehand and use it to process the "might-sleep"
power_supply_put ASAP after the property set.

Fixes: 6f0764b5adea ("usb: dwc3: add a power supply for current control")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Tso <kyletso@google.com>
---
v2 -> v3:
- Only move power_supply_put to a work. Still call _get_by_name and
  _set_property in dwc3_gadget_vbus_draw.
- Create a kthread_worker to handle the work

v1 -> v2:
- move power_supply_put out of interrupt context

 drivers/usb/dwc3/core.c   | 29 ++++++++++++----------------
 drivers/usb/dwc3/core.h   |  6 ++++--
 drivers/usb/dwc3/gadget.c | 40 +++++++++++++++++++++++++++++++++++----
 3 files changed, 52 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 734de2a8bd21..82c8376330d7 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1631,8 +1631,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	u8			tx_thr_num_pkt_prd = 0;
 	u8			tx_max_burst_prd = 0;
 	u8			tx_fifo_resize_max_num;
-	const char		*usb_psy_name;
-	int			ret;
 
 	/* default to highest possible threshold */
 	lpm_nyet_threshold = 0xf;
@@ -1667,12 +1665,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 
 	dwc->sys_wakeup = device_may_wakeup(dwc->sysdev);
 
-	ret = device_property_read_string(dev, "usb-psy-name", &usb_psy_name);
-	if (ret >= 0) {
-		dwc->usb_psy = power_supply_get_by_name(usb_psy_name);
-		if (!dwc->usb_psy)
-			dev_err(dev, "couldn't get usb power supply\n");
-	}
+	device_property_read_string(dev, "usb-psy-name", &dwc->usb_psy_name);
 
 	dwc->has_lpm_erratum = device_property_read_bool(dev,
 				"snps,has-lpm-erratum");
@@ -2132,19 +2125,24 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	dwc3_get_software_properties(dwc);
 
+	dwc->worker = kthread_create_worker(0, "dwc3-worker");
+	if (IS_ERR(dwc->worker))
+		return PTR_ERR(dwc->worker);
+	sched_set_fifo(dwc->worker->task);
+
 	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
 	if (IS_ERR(dwc->reset)) {
 		ret = PTR_ERR(dwc->reset);
-		goto err_put_psy;
+		goto err_destroy_worker;
 	}
 
 	ret = dwc3_get_clocks(dwc);
 	if (ret)
-		goto err_put_psy;
+		goto err_destroy_worker;
 
 	ret = reset_control_deassert(dwc->reset);
 	if (ret)
-		goto err_put_psy;
+		goto err_destroy_worker;
 
 	ret = dwc3_clk_enable(dwc);
 	if (ret)
@@ -2245,9 +2243,8 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc3_clk_disable(dwc);
 err_assert_reset:
 	reset_control_assert(dwc->reset);
-err_put_psy:
-	if (dwc->usb_psy)
-		power_supply_put(dwc->usb_psy);
+err_destroy_worker:
+	kthread_destroy_worker(dwc->worker);
 
 	return ret;
 }
@@ -2258,6 +2255,7 @@ static void dwc3_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(&pdev->dev);
 
+	kthread_destroy_worker(dwc->worker);
 	dwc3_core_exit_mode(dwc);
 	dwc3_debugfs_exit(dwc);
 
@@ -2276,9 +2274,6 @@ static void dwc3_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(&pdev->dev);
 
 	dwc3_free_event_buffers(dwc);
-
-	if (dwc->usb_psy)
-		power_supply_put(dwc->usb_psy);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1e561fd8b86e..3fc58204db6e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -993,6 +993,7 @@ struct dwc3_scratchpad_array {
 /**
  * struct dwc3 - representation of our controller
  * @drd_work: workqueue used for role swapping
+ * @worker: dedicated kthread worker
  * @ep0_trb: trb which is used for the ctrl_req
  * @bounce: address of bounce buffer
  * @setup_buf: used while precessing STD USB requests
@@ -1045,7 +1046,7 @@ struct dwc3_scratchpad_array {
  * @role_sw: usb_role_switch handle
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
- * @usb_psy: pointer to power supply interface.
+ * @usb_psy_name: name of the usb power supply interface
  * @usb2_phy: pointer to USB2 PHY
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to array of USB2 PHYs
@@ -1163,6 +1164,7 @@ struct dwc3_scratchpad_array {
  */
 struct dwc3 {
 	struct work_struct	drd_work;
+	struct kthread_worker	*worker;
 	struct dwc3_trb		*ep0_trb;
 	void			*bounce;
 	u8			*setup_buf;
@@ -1223,7 +1225,7 @@ struct dwc3 {
 	struct usb_role_switch	*role_sw;
 	enum usb_dr_mode	role_switch_default_mode;
 
-	struct power_supply	*usb_psy;
+	const char		*usb_psy_name;
 
 	u32			fladj;
 	u32			ref_clk_per;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 89fc690fdf34..1ff583281eff 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -30,6 +30,11 @@
 #define DWC3_ALIGN_FRAME(d, n)	(((d)->frame_number + ((d)->interval * (n))) \
 					& ~((d)->interval - 1))
 
+struct dwc3_psy_put {
+	struct kthread_work work;
+	struct power_supply *psy;
+};
+
 /**
  * dwc3_gadget_set_test_mode - enables usb2 test modes
  * @dwc: pointer to our context structure
@@ -3047,22 +3052,49 @@ static void dwc3_gadget_set_ssp_rate(struct usb_gadget *g,
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
+static void dwc3_gadget_psy_put(struct kthread_work *work)
+{
+	struct dwc3_psy_put	*psy_put = container_of(work, struct dwc3_psy_put, work);
+
+	power_supply_put(psy_put->psy);
+	kfree(psy_put);
+}
+
 static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
 {
-	struct dwc3		*dwc = gadget_to_dwc(g);
+	struct dwc3			*dwc = gadget_to_dwc(g);
+	struct power_supply		*usb_psy;
 	union power_supply_propval	val = {0};
+	struct dwc3_psy_put		*psy_put;
 	int				ret;
 
 	if (dwc->usb2_phy)
 		return usb_phy_set_power(dwc->usb2_phy, mA);
 
-	if (!dwc->usb_psy)
+	if (!dwc->usb_psy_name)
 		return -EOPNOTSUPP;
 
+	usb_psy = power_supply_get_by_name(dwc->usb_psy_name);
+	if (!usb_psy) {
+		dev_err(dwc->dev, "couldn't get usb power supply\n");
+		return -ENODEV;
+	}
+
 	val.intval = 1000 * mA;
-	ret = power_supply_set_property(dwc->usb_psy, POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT, &val);
+	ret = power_supply_set_property(usb_psy, POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT, &val);
+	if (ret < 0) {
+		dev_err(dwc->dev, "failed to set power supply property\n");
+		return ret;
+	}
 
-	return ret;
+	psy_put = kzalloc(sizeof(*psy_put), GFP_ATOMIC);
+	if (!psy_put)
+		return -ENOMEM;
+	kthread_init_work(&psy_put->work, dwc3_gadget_psy_put);
+	psy_put->psy = usb_psy;
+	kthread_queue_work(dwc->worker, &psy_put->work);
+
+	return 0;
 }
 
 /**
-- 
2.46.0.rc2.264.g509ed76dc8-goog


