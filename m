Return-Path: <linux-usb+bounces-18730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E229FA9E3
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 05:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A751A188573A
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 04:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED73B158DD9;
	Mon, 23 Dec 2024 04:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bJ33zz3Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189913C14
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 04:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734927941; cv=none; b=HDO9GRFmg1j/iJ1bqpBmW+TCiXZQNuWTFx0j30IEL/kUd7a0Wi1FJz1o5Rzaevqu/qD2k2iNZHQJYluhyNgW/M8yNtcKPVnlapEAXd/nMkBRMroeZ5ev5Lr3mg4oE1QPlJFRvroWruQHvGRX5v4ykjd7RMJX1t/9hxVWxfc8xcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734927941; c=relaxed/simple;
	bh=Dt/6G1gBVi9/Ss+7QkxzfKfIIjlPiS/7xPWbyG4wmIw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ca2nT7pb9GaamUQUoSrDuhHXPSU6zVmkuyX6lEguXctyRXrhzuazYijfJYXi5P5GIYI6yMJmzn5MLEOlhWFKfxGteBcPWew2DabahiLBwHzLMRlOBA6u7TGrNOGhJNrXvZAsHRDf/+6Rej2U3VTphnm5vEKUQ7WwgJm+EdXlh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bJ33zz3Q; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e3c7d56aa74so5111536276.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Dec 2024 20:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734927939; x=1735532739; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nXYKYtABjQvASnhvy1CxBifUm+NS+nA+aDm+BLX/Kss=;
        b=bJ33zz3Qn+dbV0nYsjsJXGzUeNJUyCmKwsJYlcak1fcx3VJqpwG0A8eelfh52dJi/B
         RlwA5gXWds/kzywqeG6VwPExSObJcqD5jqiWOsgKI/otcJT2f8uvh5C7DvX51fC+jWkF
         mpLsPYcqoMelVJqKeO+tEIGpAS1OWiVcFp4hj1Qlfw+GVnmGoc0EezeXwZNj+9hl+gYN
         6bcJmcwNKN8SXzAEjdCA4LwMep4yHlEBDu5yW+bmW0m4BL9hvyk4u6I1ZnvxujvHGc5W
         BA6pUs7RWzuyrR+ljBI93SJlPjo4mlYPjQ85LbZbwxWOuRUkdaqMWFuQ79jpG1lVRmaF
         orqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734927939; x=1735532739;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXYKYtABjQvASnhvy1CxBifUm+NS+nA+aDm+BLX/Kss=;
        b=FWfRU9yjJ2dtlKKbqUTYnIL+ohcqpEmpup9rOO02bi0B8tuJi8xhMCjhOqMGDYCU58
         R8c2zkPxs4FJMfBBu/OgEgGT4PcbBqhFY1xCfTrnnN26aQw4RjErYaQ/ezZLvD+1B2J0
         XIZMgliQu49/4mIB3PXFxa8/1u75O2+BHOUhKv+uPWHjEX52dfKZ4Ruo1kmxcJPraW1o
         6/1h1kqD4X4xZtg+TAsMFuN23CrCCFJIU+hHqyd7as0duJDEjtpoTYLB+OM2ZE1nHalX
         xHqGC1E+rIRp5wl6KZx8SA/juAR/00284gqMiVs3jOkQgEtaUnwuZbthYzsbBrFucf5s
         mbWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzUGcRqaunmptyli7e5dWDfZFEIPo88Casu8VBL37vDHbSoekGCJeQikA+jxJs/CVOhjJRSF1uSWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRMLG5y/Ebiz6BojLMKOHYDv7xnI8f897WNd96bcW0Jj3N3wYs
	vfczsj3rhxst2vKG4Q3Ze3ZAbJuxlvmhzMshKCPhEI9O4sivb2OvMnWSJB/jxefdizHfiTjABwS
	+9w==
X-Google-Smtp-Source: AGHT+IFoLae2jmi71eFzlj130XfqqDNx20si5wTaWwQE68vKXu2qpEeK3Njmu60R6Xg1E2Bop1uVQW9toz4=
X-Received: from ywbjt4.prod.google.com ([2002:a05:690c:7404:b0:65f:7dfb:a866])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6902:1502:b0:e53:64a6:2e02
 with SMTP id 3f1490d57ef6-e538c3cfdb4mr6533177276.34.1734927939117; Sun, 22
 Dec 2024 20:25:39 -0800 (PST)
Date: Mon, 23 Dec 2024 04:25:36 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241223042536.1465299-1-royluo@google.com>
Subject: [PATCH v1] usb: dwc3: gadget: Fix incorrect UDC state after manual deconfiguration
From: Roy Luo <royluo@google.com>
To: royluo@google.com, Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: badhri@google.com, andre.draszik@linaro.org, peter.griffin@linaro.org
Content-Type: text/plain; charset="UTF-8"

The UDC state in sysfs (/sys/class/udc/<udc>/state) should accurately
reflect the current state of the USB Device Controller.

Currently, the UDC state is not handled consistently during gadget
disconnection. While the disconnect interrupt path correctly sets the
state to "not-attached", manual deconfiguration leaves the state in
"configured", misrepresenting the actual situation.

This commit ensures consistent UDC state handling by setting the state to
"not-attached" after manual deconfiguration. This accurately reflects the
UDC's state and provides a consistent behavior regardless of the
disconnection method.

Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/dwc3/gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 83dc7304d701..fb4f6487c4ce 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2740,6 +2740,8 @@ static int dwc3_gadget_soft_disconnect(struct dwc3 *dwc)
 	__dwc3_gadget_stop(dwc);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	usb_gadget_set_state(dwc->gadget, USB_STATE_NOTATTACHED);
+
 	return ret;
 }
 

base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
-- 
2.47.1.613.gc27f4b7a9f-goog


