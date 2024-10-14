Return-Path: <linux-usb+bounces-16176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E78D299C478
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 10:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 244551C21924
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 08:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9AA158A04;
	Mon, 14 Oct 2024 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3U1mDPob"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960EE15884A
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 08:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896320; cv=none; b=kbL8uF+e7O4yYfYxJ2XoHB83Gl2yvv/DqoVW7EXD18Rpthg3V+xQYppQhl8osDQRJXT041y+Q3E1Wdt7xj9WfkYtKGK4s/Tvr+pZw/otl4bbhIBOk9c6Kd16gz9XqjTYOduipzPUGw+FdhNJk8ADSj+OrDem4KSCrI+Wo4K6DG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896320; c=relaxed/simple;
	bh=GMwCb54K5fwAFj7CdJY410A+DGpUZKZFwOlbLbNO1Rk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A69qecL028v+YWooHN1q88k8ldoqqXVhybqlYG86aniPWoghXhhCJ4osjMqbGCVdN+QA+JXr1OHA/v8GRmMqQOQ8HLcfxjv/QPJuxf6E0ImeZfn2jFN6m+Xi4mEv/CYvmG7o651MMEolDySPmdAoBWSEFEF9zko1EEuGS94B2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3U1mDPob; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e290b8b69f8so6708680276.2
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728896317; x=1729501117; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CBCkOZOzlb8OpyLWnTs3NTPuF3GCuKe+Ddcqr6JZX/0=;
        b=3U1mDPobFnGgHq84Pv0g6bNH0GHiZbP4HPFjkDevwtzcBDYQ794TIino5NpGFE9IW3
         anEo6nhGnK7VcLPVgFm8hG8xAMjNuTAp+qvKvjm+Oq/98CR4OYBtjPOm5f8VN503oKRC
         jqbT7IeKmKaBMmeFrkgM+d2R/FhW2n0f3I2jTxwoJZT6TBMw9vGrMKk86xXZjjw6LmeJ
         rZU8d1ZUBsg7bfVCtblTNMF+FSAO4XUgpohnznQ0Tp+7REd+gYvl5LgbIJc5GmpQTbvE
         89IPFq0ZaDwaED56YqOe3GltrxmBFjAiQFSwyQGK/tK0G/aVJUBcNxfgyn2uZWkbPsLR
         oe0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896317; x=1729501117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBCkOZOzlb8OpyLWnTs3NTPuF3GCuKe+Ddcqr6JZX/0=;
        b=sUNfCNvZU/snl6VIJb6HlEylW8YKioWdOavE6UoGbX1FhaH89PMOX7C4UqGAQ894zn
         TFxvqFBpPBPWa41HbquzHt1WjAWtkx7Lm6cDIovWkHW0jmQk2gG66M7UGZEOvsPx7VHX
         46KO4/xd3RanpV++1v0lwkaYyQ7bbp2OPu9hHrV9U8bSFWc9ZJznFa/y7tp4StpPwNDr
         wlVf0b/k6i/Z70fR6OcLDG7Reuf6x7vdJGGy6LyGGIgVRRqiBMXFVaZ4bgQY+4LT0CdA
         LH6dnBis4GjUL4MO5YSK9tmSJN64P96xeuRs/hej4Ga8aAyCKIgCt4xncGKh3BxEgr2b
         0y4w==
X-Gm-Message-State: AOJu0YxVBGiG9aMaQ4RjYXwewsliAe1lezg9vgrWFENfHMZhPjgAv9qy
	wfMQ6XRXa7peVKjvfJLtttZ9+eYZ4B+oWATRpJp7ST30SGjWM7oPQCuv15/lB48q4FhKjumUD43
	tX8q7uD+EHw/oxw==
X-Google-Smtp-Source: AGHT+IFsur8fmOZLkwe4HhkxKg7dnhiw5z6XfD/hxTsXEwag7FFm57X7hNgZDDjovJC655vxY59/fqhW7oMQlLM=
X-Received: from guanyulin.c.googlers.com ([fda3:e722:ac3:cc00:131:cd17:ac11:19c7])
 (user=guanyulin job=sendgmr) by 2002:a25:d344:0:b0:e20:2502:be14 with SMTP id
 3f1490d57ef6-e291a2024cfmr6856276.7.1728896317491; Mon, 14 Oct 2024 01:58:37
 -0700 (PDT)
Date: Mon, 14 Oct 2024 08:50:25 +0000
In-Reply-To: <20241014085816.1401364-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241014085816.1401364-1-guanyulin@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241014085816.1401364-2-guanyulin@google.com>
Subject: [PATCH v5 1/5] usb: dwc3: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, yajun.deng@linux.dev, 
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	dianders@chromium.org, perex@perex.cz, tiwai@suse.com, niko.mauno@vaisala.com, 
	andreyknvl@gmail.com, christophe.jaillet@wanadoo.fr, tj@kernel.org, 
	stanley_chang@realtek.com, quic_jjohnson@quicinc.com, ricardo@marliere.net
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, badhri@google.com, albertccwang@google.com, 
	quic_wcheng@quicinc.com, pumahsu@google.com, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Separate dev_pm_ops for different power events such as suspend, thaw,
and hibernation. This is crucial when dwc3 driver needs to adapt its
behavior based on different power state changes.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/dwc3/core.c | 77 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index b25d80f318a9..2fdafbcbe44c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2582,6 +2582,76 @@ static int dwc3_resume(struct device *dev)
 	return 0;
 }
 
+static int dwc3_freeze(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	int		ret;
+
+	ret = dwc3_suspend_common(dwc, PMSG_FREEZE);
+	if (ret)
+		return ret;
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	return 0;
+}
+
+static int dwc3_thaw(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	int		ret;
+
+	pinctrl_pm_select_default_state(dev);
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_active(dev);
+
+	ret = dwc3_resume_common(dwc, PMSG_THAW);
+	if (ret) {
+		pm_runtime_set_suspended(dev);
+		return ret;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static int dwc3_poweroff(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	int		ret;
+
+	ret = dwc3_suspend_common(dwc, PMSG_HIBERNATE);
+	if (ret)
+		return ret;
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	return 0;
+}
+
+static int dwc3_restore(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	int		ret;
+
+	pinctrl_pm_select_default_state(dev);
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_active(dev);
+
+	ret = dwc3_resume_common(dwc, PMSG_RESTORE);
+	if (ret) {
+		pm_runtime_set_suspended(dev);
+		return ret;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
 static void dwc3_complete(struct device *dev)
 {
 	struct dwc3	*dwc = dev_get_drvdata(dev);
@@ -2599,7 +2669,12 @@ static void dwc3_complete(struct device *dev)
 #endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops dwc3_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(dwc3_suspend, dwc3_resume)
+	.suspend = pm_sleep_ptr(dwc3_suspend),
+	.resume = pm_sleep_ptr(dwc3_resume),
+	.freeze = pm_sleep_ptr(dwc3_freeze),
+	.thaw = pm_sleep_ptr(dwc3_thaw),
+	.poweroff = pm_sleep_ptr(dwc3_poweroff),
+	.restore = pm_sleep_ptr(dwc3_restore),
 	.complete = dwc3_complete,
 	SET_RUNTIME_PM_OPS(dwc3_runtime_suspend, dwc3_runtime_resume,
 			dwc3_runtime_idle)
-- 
2.47.0.rc1.288.g06298d1525-goog


