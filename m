Return-Path: <linux-usb+bounces-14757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE5F96E707
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 02:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62AE01F23E68
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 00:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9047A12E7E;
	Fri,  6 Sep 2024 00:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HnwAqC9p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFDE1BC59
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 00:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725584288; cv=none; b=QgDIMTvq3w0D8Mc4hb/BidHAp6j5x8fKDSghJegaPZ3/DUV5P9FCbYQhfzg3gU2+MhQEO2hUJa5o/QlXmW81y+4VBedXfZUTwSG89obVMsodUchUxtf5DlI2A3qFzLHqPQrNruDXsc0LT63KySOingFJkiY3IT3Y+1tSxIU6GZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725584288; c=relaxed/simple;
	bh=dY+RGFX+cNu9X2vO0IcaDdSj9wfnP28ZjHbh6T05zQU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eAiiIzh1zw6qjJcY9fY8H1ubnCcoe3Y/FC2so8c/4jOCxMYC8pF0iU2YWJ/4CcPxdz3FoJJmsDCrPeFOhkmdXF7pWVDvUf+p0HO6fewDUx+Mf2YmCz2aodSRl0Aglli2ostqSNlM/FlKMvpH+WReYq7wOJo6p2zYwUsmMqA8z38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HnwAqC9p; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6db24526096so63850627b3.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2024 17:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725584286; x=1726189086; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZUr9RBTogku73PpkKtYXYUmUx+8qMZI1152dmkaX1tc=;
        b=HnwAqC9p6Kh0iUKAaMi7M4wid0/oynrEKGOqasDKvcTR26nhvBBZULVlhTeC7oP9M3
         A6V3XwjVsY/HfbpJSw9kByr+YS/+ty4kSTyz/zkaTw0cdLZdCYztw9dNp9VNaV6qIXRL
         yinrg6XX8B1O+hoicsJeArVZPEC+SjdN2QwXTqr3GB7/oPTYbJuk/zbwqNmqrEhVK1Qn
         ++hBwXtbcwrW7ej99HsbaOK8hSNUQRurh6clMKqAyd/LSiiKldbb8D210Ycxb5ZLMQ5s
         lkVvK4pXAd9fL7dc817j3SdYjc5BxcFUiLva1nRyErw6w4hTx7870wl7vD+VNycXxtEi
         oyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725584286; x=1726189086;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUr9RBTogku73PpkKtYXYUmUx+8qMZI1152dmkaX1tc=;
        b=dCWmsdPQj3/+IKXpHfeTswvfkQWhuqVw5/hEqfJLvgK440gWgnx4RZJdRjoZTZOZXL
         b6MZ3mfUxKEl02fRMaU7vonciIYBDqLkSAuWy3t64/7S6mgwg3FLe0grcOhjLT/SkFN4
         uIVjwVoLg08wX1av01mVWTciw6E3j9GswxGIDm2fEb1H/sFAiUTNE1OYMDovQ+1KtwNZ
         OqLzkJBev/02Bt7Fv/yzmhBcDEye57JiRFqLDXzpl3XBdxxvUmsF03Am6F3QR3fYHed7
         7wPqou3yG+pt4d2LvR8zV/jcI1zK7hQLbh6H1iEHiHmOT7iWbNfX/L1RIFYEqIZlFGPO
         WajQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8wKJk5YDoSQwIx955Q0gTNnnCUlxVMXH9Z7TNcTxSJjlQx9/TQWD/Qj+OOtb2shMzQj2fEUetXVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbyoVu3APK4JiUFrKH9X4BjZH8cCuUNuMV8QaYLO6VBg1m9AUu
	ekib0tD2QunNEwsa5Wez1OxWEA/kY4Ckm3X3SXOg/9sfKqyx+f4Y+XgfGKOFga37Od7NSlL6Y0R
	0ag==
X-Google-Smtp-Source: AGHT+IFVaGdYnqoxmzpMhrlWdS8//ypdRlOXtb1ajgUGqzHC+RrjmGKaMalfJQrOLZyrYX6KIzs5g5zguF4=
X-Received: from royluo-cloudtop0.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:bb8])
 (user=royluo job=sendgmr) by 2002:a25:aa90:0:b0:e16:57bc:ac26 with SMTP id
 3f1490d57ef6-e1d3489de68mr2283276.5.1725584285560; Thu, 05 Sep 2024 17:58:05
 -0700 (PDT)
Date: Fri,  6 Sep 2024 00:58:03 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240906005803.1824339-1-royluo@google.com>
Subject: [PATCH v1] usb: dwc3: re-enable runtime PM after failed resume
From: Roy Luo <royluo@google.com>
To: royluo@google.com, Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	badhri@google.com, frank.wang@rock-chips.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When dwc3_resume_common() returns an error, runtime pm is left in
disabled state in dwc3_resume(). The next dwc3_suspend_common()
should be skipped as the device is already in suspended state but
it's not because power.disable_depth is non-zero.
Ensures runtime PM is always re-enabled even after failed resume
attempts.

Fixes: 68c26fe58182 ("usb: dwc3: set pm runtime active before resume common")
Cc: stable@vger.kernel.org
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/dwc3/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ccc3895dbd7f..1928b074b2df 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2537,7 +2537,7 @@ static int dwc3_suspend(struct device *dev)
 static int dwc3_resume(struct device *dev)
 {
 	struct dwc3	*dwc = dev_get_drvdata(dev);
-	int		ret;
+	int		ret = 0;
 
 	pinctrl_pm_select_default_state(dev);
 
@@ -2547,12 +2547,11 @@ static int dwc3_resume(struct device *dev)
 	ret = dwc3_resume_common(dwc, PMSG_RESUME);
 	if (ret) {
 		pm_runtime_set_suspended(dev);
-		return ret;
 	}
 
 	pm_runtime_enable(dev);
 
-	return 0;
+	return ret;
 }
 
 static void dwc3_complete(struct device *dev)

base-commit: ad618736883b8970f66af799e34007475fe33a68
-- 
2.46.0.469.g59c65b2a67-goog


