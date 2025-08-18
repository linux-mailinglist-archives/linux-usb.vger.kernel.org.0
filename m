Return-Path: <linux-usb+bounces-26960-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A68EB2995F
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 08:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E68BC1896A42
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 06:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5B22727F4;
	Mon, 18 Aug 2025 06:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qvCJJjsr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f73.google.com (mail-lf1-f73.google.com [209.85.167.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F58B23AE9A
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 06:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755497291; cv=none; b=UGyMJJszk/orU7nf7m6CPseBK2n8Vxu/kyuJiuFbWclahQJEXb7V01picrU6eDBNOqGb5ClHE0WaBYpMYhRR46Um+xJkEdKCvlqdxmSc5jhmSXi2AoeEDz9GNxjMTzDV7jMK2AkOUzQRM6aHtIlNM0JwPfdYF5LdIZ4969eP2zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755497291; c=relaxed/simple;
	bh=EngOo9UQfEus4XJDxqngZ7VXC4E4SAALrw09aOuYgNM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cUzN6vs05FIPP8yzuin5pwSttr2WQYTkfnx6XH6fdLwYDXET+5ztXpGE9rMN9k1EsuE0Dx9DVNBM1tYmK53+6FI6oTXVyf2Tk8zWwLJ4modnpAtPrzOAsXSdCE8msoUiSnjircVT9G2JELKz3PffG2cTONe/v65yxG5u53O4+9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qvCJJjsr; arc=none smtp.client-ip=209.85.167.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-lf1-f73.google.com with SMTP id 2adb3069b0e04-55ce50901a1so1982105e87.0
        for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 23:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755497288; x=1756102088; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BWT2t+jJBK9sAdHInrc6uLNTa9GVH1OTBmeM2Ig7zEg=;
        b=qvCJJjsruqhY+OXpYmjWrwRptPCFF9b+VJ2xkHCMZZIEROmZDmsgdDIR8+si30vLFL
         i6kJFEDXrdwGuGHpileuGfHfzO9l2/Q6cpHOrkZMe40pRwylZtiSj897A5wPkrqOuWWa
         9Ov52gZVGQ6Q2uEb7OXik/1orS4U1pjG7bDTDnFirVmbmx0QNLwGpy2tUOClS8xCd+Sp
         9X10Lopo1+QBO/7nCRsOZiYPzILXQuCzMCJfw/rfOPAD6DVc+SM2w1tu7fGvw9wU9Edg
         CZj/v4zQerAcrmz6JkP/vtsVqmrFgMaZ9CcJUBlRwFnxfx+r/XyBZpXl9vsw9mcd/w0n
         48mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755497288; x=1756102088;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWT2t+jJBK9sAdHInrc6uLNTa9GVH1OTBmeM2Ig7zEg=;
        b=VERmXU0hxRQM7kQ0WAz/wFM8lHtKbGRkzNcfH6uM/uxqu+bfYy7dLbGrgZ976viXZQ
         qg1vcjUlKsHJbuufrMAjTEe4wj67eO08aK64sO1ASIUw4VB2IrGXmYVADxdozvWrSWwi
         qb5CXn1tD4eJb918G7JHFqlu4kj775mm4amuMSp+OWQukRgcsI8fO5bMIaU7a48ARtXE
         9Gki8kN8fEzScgYJVIFhuUFcILuzsl8GcWs9L4qMS8et+lG76lzOw7gWnnEctAJsIugf
         xcwazRCKq1ho3gJmKGLzoxbwRwsQTLsvv5aQtncx93nsfBSYWyHsi3OxyGOxK3BBljN0
         VtxQ==
X-Gm-Message-State: AOJu0YzGOuW0kliGAYUiyeyXXcan83A7DzZmvmfDvHTZ2bDTmrSVGFdr
	Y6GgWTRJq0zyIUF0LQ76lv55Dn3+JL+ToAcsjsrMvTPXSa5xViidkLFXtPEBLc5nZ2djq8+SyOA
	MBEm7WA==
X-Google-Smtp-Source: AGHT+IGGCOCCwfaMWb0F0aVjzApbARLSap43w9ZIM8SzF+Jg1lTj8MlMhGeg/mQmq64RFP52blM58FjhNWU=
X-Received: from ljhz3.prod.google.com ([2002:a2e:9643:0:b0:330:95d2:fc9f])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:15a1:b0:55b:8a78:ac2
 with SMTP id 2adb3069b0e04-55ceeb5a631mr2871024e87.42.1755497288394; Sun, 17
 Aug 2025 23:08:08 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:07:35 +0800
In-Reply-To: <20250818060757.2519126-1-khtsai@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818060757.2519126-1-khtsai@google.com>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
Message-ID: <20250818060757.2519126-2-khtsai@google.com>
Subject: [PATCH 2/2] usb: dwc3: Refactor dwc3_mode_show
From: Kuen-Han Tsai <khtsai@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="UTF-8"

Use dwc3_mode_string as the single source of truth for mode-to-string
conversion.

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/dwc3/debugfs.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index ebf03468fac4..d18bf5e32cc8 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -402,6 +402,7 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = s->private;
 	unsigned long		flags;
 	u32			reg;
+	u32			mode;
 	int			ret;
 
 	ret = pm_runtime_resume_and_get(dwc->dev);
@@ -412,18 +413,15 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
 	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
-	switch (DWC3_GCTL_PRTCAP(reg)) {
+	mode = DWC3_GCTL_PRTCAP(reg);
+	switch (mode) {
 	case DWC3_GCTL_PRTCAP_HOST:
-		seq_puts(s, "host\n");
-		break;
 	case DWC3_GCTL_PRTCAP_DEVICE:
-		seq_puts(s, "device\n");
-		break;
 	case DWC3_GCTL_PRTCAP_OTG:
-		seq_puts(s, "otg\n");
+		seq_printf(s, "%s\n", dwc3_mode_string(mode));
 		break;
 	default:
-		seq_printf(s, "UNKNOWN %08x\n", DWC3_GCTL_PRTCAP(reg));
+		seq_printf(s, "UNKNOWN %08x\n", mode);
 	}
 
 	pm_runtime_put_sync(dwc->dev);
-- 
2.51.0.rc1.163.g2494970778-goog


