Return-Path: <linux-usb+bounces-15109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1F7978BD5
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 01:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E11DC1C255A7
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 23:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D87518732E;
	Fri, 13 Sep 2024 23:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DpwEI7du"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f73.google.com (mail-vs1-f73.google.com [209.85.217.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C54E17C9B2
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 23:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726269717; cv=none; b=EGJDfC3PQrv14tK4DrnUMJUQhBBrSdOmpg3d8zR05FLi8DwixXbHnaMVMl5/MvzxcaFHeCr5TtI0JyhMRY4YA4Cu/2SZ23D4Vsitu3uoytnAoJbtQQ7rXRhI81/HRRe3QebaFaLzzJSi8+EqNdlJVhyRzTDN+E/NyGylVNtzkZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726269717; c=relaxed/simple;
	bh=ZR4zzrJ7VfwbKEOrB4Fz+3qk/wJzSD20AcrL3bdyVb8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JIt4toUKec8RgVZ1SpQ+806xLJmqBEOnXsPbXNqI73pSg9BkPwlPfKvAWpQIK22qx1LFup318zyCobGsSrnFAPdxPqUFTEkvlIHrobWsK77gnu1+C9tUiDD4NyE4wN9rov/CfziaPVddLB/SPLnsLJAQTBD11R3K/fjCVTJj2vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DpwEI7du; arc=none smtp.client-ip=209.85.217.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-vs1-f73.google.com with SMTP id ada2fe7eead31-49bcae71155so511412137.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 16:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726269715; x=1726874515; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MusCj4ir4PSCrsUEXUGtNPthWYDXOiereiA9bi88QOE=;
        b=DpwEI7duYilWb+J202kJ10d8j5vtcf0UdenX+6YAh7l30FCmd5vGiIoIkvVoz4UAJp
         h/5ThOk3BI3Pj1NA+d9NAHsmJ/YNQ8HCt00z1KFokyIOgc6921fxh4rUOTJwH4gDQNW0
         v2XVgAzIMpV3WtDALbnvFRaXFQJgHcchHyo3KFNAApvxQ6SsqsUZScLrY4K/eD19W3NV
         fElamm7glKAVc0OazkBtCn0xI4BUgPmH8QApQ8fGAg2VcbCw6KgjQLzY198BMdqK756O
         4uk1IrO7OL7bdYAklb/LcSizCOLPcdFgeifrhaER74A1Jq+7oQxAr2LnyPwjje9plIHp
         u6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726269715; x=1726874515;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MusCj4ir4PSCrsUEXUGtNPthWYDXOiereiA9bi88QOE=;
        b=vhMXhPbrdtDW/YwyKaoXHF2fF2EHAmFEIEb4OMqF27LnpQ4j1DHxR6mLRCyDYUqmNn
         xd6e3q0Q8jg5Urc4x/CFJAAZmTDv/BWygEeNGZdZnkCw5SmBME19XUhXRYPr4YO9NoRe
         Sxxj3VMWQECyJogWWYOrzhazmV09c2PPL0a7lG9cSNdn2/dhpwdlVZeYsvwCpRMHwKVD
         4fHi/k6to3Cqsk8G7w/XIstc+L6iqaMmu8xWFtCCAqSnmvp93wT1sRkSnaAP8+AIpyJb
         olWqlUhrt98oFgzqSuOsxCxKlumsf8J2dYeikRNgsXz5oxiw97kdTIVKeXkUdKc2adf7
         G5+A==
X-Forwarded-Encrypted: i=1; AJvYcCUOCgPDRXXcvfm0cQuIgS2lK3yW2aP4kRjQN/OQIRGlZuf6eniN5H7IAlcvgCMd45GRJKwBN3LeFik=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwYuKBOaEdkFJSoMPZnms94rsO9y7psXsre3hmAkKKu7iSAdVW
	026L35AWZ4nBOX0f2KyIpsFPC4NfLduko8IVhBxXNxsBjk7bgfYulvywu/SFWN/xP0Fyg3Ns5Aq
	bDA==
X-Google-Smtp-Source: AGHT+IFq2KBEKBhquBRGzPqSjJyQNiRU9Q5Fx5vMKbhgYYZh5gkNJeMsW9/caw6zOQuL6RVVlwtNRlFXUHI=
X-Received: from royluo-cloudtop0.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:bb8])
 (user=royluo job=sendgmr) by 2002:a05:6102:3e1a:b0:493:ba4a:6f8c with SMTP id
 ada2fe7eead31-49d4f6bb754mr205460137.3.1726269714995; Fri, 13 Sep 2024
 16:21:54 -0700 (PDT)
Date: Fri, 13 Sep 2024 23:21:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240913232145.3507723-1-royluo@google.com>
Subject: [PATCH v2] usb: dwc3: re-enable runtime PM after failed resume
From: Roy Luo <royluo@google.com>
To: royluo@google.com, Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	badhri@google.com, frank.wang@rock-chips.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When dwc3_resume_common() returns an error, runtime pm is left in
suspended and disabled state in dwc3_resume(). Since the device
is suspended, its parent devices (like the power domain or glue
driver) could also be suspended and may have released resources
that dwc requires. Consequently, calling dwc3_suspend_common() in
this situation could result in attempts to access unclocked or
unpowered registers.
To prevent these problems, runtime PM should always be re-enabled,
even after failed resume attempts. This ensures that
dwc3_suspend_common() is skipped in such cases.

Fixes: 68c26fe58182 ("usb: dwc3: set pm runtime active before resume common")
Cc: stable@vger.kernel.org
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/dwc3/core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ccc3895dbd7f..4bd73b5fe41b 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2537,7 +2537,7 @@ static int dwc3_suspend(struct device *dev)
 static int dwc3_resume(struct device *dev)
 {
 	struct dwc3	*dwc = dev_get_drvdata(dev);
-	int		ret;
+	int		ret = 0;
 
 	pinctrl_pm_select_default_state(dev);
 
@@ -2545,14 +2545,12 @@ static int dwc3_resume(struct device *dev)
 	pm_runtime_set_active(dev);
 
 	ret = dwc3_resume_common(dwc, PMSG_RESUME);
-	if (ret) {
+	if (ret)
 		pm_runtime_set_suspended(dev);
-		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
-	return 0;
+	return ret;
 }
 
 static void dwc3_complete(struct device *dev)

base-commit: ad618736883b8970f66af799e34007475fe33a68
-- 
2.46.0.662.g92d0881bb0-goog


