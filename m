Return-Path: <linux-usb+bounces-19408-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD5EA13B59
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 14:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD45F163ED0
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 13:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EB422B58A;
	Thu, 16 Jan 2025 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rMYTIe8F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BD022B585
	for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737035671; cv=none; b=fFzlWYzIyyQgJ+ux0M6bwXhBL4cnEb4EPn28yYqu1rAov6BJEF+owp8idnUTu8hcX27XHWY9LWzi6/VQK6sIbKOmAEopH/rrchO9SDeh3BD1DhyJV+r2rCrSah7xVNTJ7V/m4dZFqd/7HtlHmRk5xvDb9ArWPSUuSc0UJIsLBO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737035671; c=relaxed/simple;
	bh=FNJJD9zaL9tYqwWTeIV7vxHf0s0Y2Sf04iiJXfVPKQo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FQKb8BEiyM9fVPO8xPm9WRK+owGWqpaSkOs0snoPh0hmDolObAUGTvxNyMeYJzQVLWro7p0sTYKDJ/L0WpGlmrSdZlKfgs08cOn7k3nLUZHZLcpWIlYpLIwAinY+YHbVmlefQQ3adZYy0Nc2R15gUKMDSNXcPUxgimD7N6AWoGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rMYTIe8F; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2161d185f04so13889525ad.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 05:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737035669; x=1737640469; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBcwJTu+fcJiwVaAq8fITjD7AnDF8kvfA86ysnCa1q4=;
        b=rMYTIe8FmIboJgrrskfdFDge2n4JQCpqfJj6KjGbVCV495xIYtglN/7s3m+qEjVPEm
         6dXsXDMnDCQX5tTZAqSfXcresH6ji3hQ/In7YuXBPeG4vbr6RRIPM3DorHUpQ4iyxddB
         hA15VS/0UULSA0M6xES3aATOmz0T9fSI9SJd1IbQBwGcJElwbqfhrb0jD7Vnnl7jdokk
         tksUj5NzEHovgHU0fKbeFPNWHd5EupmcbavHrLEw8DS/Zf0wJiWlzwwb20XV6AIRuZin
         6paCTjPV+/snJlexmz4KWtfVGb4G6hQLR29zqxnDLA+cMLiETafAC2IY3XZ65ioEUqhZ
         KC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737035669; x=1737640469;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBcwJTu+fcJiwVaAq8fITjD7AnDF8kvfA86ysnCa1q4=;
        b=e/D7EZ7VyS2XF9Q3Eh8WVZam7j+1LPDQGXM/CVKSgDqVOgUE2bYoDNFmlS1znv2egz
         3m5DFCYjrY5uSOmkcuVhcGgPbA0mcbfJ9IGNtwJDqUFaZOGiNcRdmvsAezPXiyuxpya0
         XnsbtQnFlWem91p/D3MrtGucFtfGElSStp4hhm530cAoa4xqkIurJk/xYqTjRC92bkMY
         bWGDcacPK6NIrc4ywjoHVVTRW8ro8yjSg5fwr++GHchQAB4ZjvdAQmUxy+bbsx7Qgh7l
         8VsSs1gWODAu/iHcSJxKVVmi3hxV4firFdoYKKZRoFp9PStPC8e3YcTl7kk1wPOevrPR
         mXKA==
X-Gm-Message-State: AOJu0Yx0yjmOze5J+EjPu6TM8J7lElAecmRTHEmXvNkG0WxyXCzXFldJ
	4VCWAAvyJR1IDppA8Cs7r6p36WG8+GRiBwK659yJFXRbm9eut3QR0UjgQuEcYOS3s4MoZLiWwz5
	TbSlCRnLhJ8RC/g==
X-Google-Smtp-Source: AGHT+IFqmSXycg5rTI+nDAw3e/9Mk9f12jOfkBuGsUIM97ZO8VsDgl5Onr1+2lRYWdP+5PJgF5pKtlVtwNgxRRk=
X-Received: from pgf11.prod.google.com ([2002:a05:6a02:4d0b:b0:7fd:3ffb:bf1b])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7f8a:b0:1e0:d4f4:5b2f with SMTP id adf61e73a8af0-1e88d2f6a3dmr61959632637.32.1737035668832;
 Thu, 16 Jan 2025 05:54:28 -0800 (PST)
Date: Thu, 16 Jan 2025 13:50:13 +0000
In-Reply-To: <20250116135358.2335615-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250116135358.2335615-1-guanyulin@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250116135358.2335615-2-guanyulin@google.com>
Subject: [PATCH v8 1/5] usb: dwc3: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Separate dev_pm_ops for different power events such as suspend, thaw,
and hibernation. This is crucial when dwc3 driver needs to adapt its
behavior based on different power state changes.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/dwc3/core.c | 77 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 6c960ff30c92..0735881d4650 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2632,6 +2632,76 @@ static int dwc3_resume(struct device *dev)
 	return ret;
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
@@ -2649,7 +2719,12 @@ static void dwc3_complete(struct device *dev)
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
 
 	/*
-- 
2.48.0.rc2.279.g1de40edade-goog


