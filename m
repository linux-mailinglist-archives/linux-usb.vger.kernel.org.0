Return-Path: <linux-usb+bounces-19610-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B02DA18A2A
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 03:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1927E3A0FAC
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 02:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C3A14A09C;
	Wed, 22 Jan 2025 02:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ml8OfI4C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f74.google.com (mail-ua1-f74.google.com [209.85.222.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DDB61FF2
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 02:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737513898; cv=none; b=a09gKEy+1X8HhSxD8y1noXNzE5JB9dLJKWC1XTqRATvX8JU0N2QbLXFoCM+DXFkmlCydWmvhfASKBLjAezJ3Yva3MuRO+zZn6EGlAfPNJZWhDnA+fZFkJq3KnySS8TQYR118HJq1YTHIJ0ME7N/MLF+3vAIQ847G67KKT4VVI+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737513898; c=relaxed/simple;
	bh=IRfCQlGNBI14dGgWbLUqBYq6UbkHZtsNZuki1VY/Pyk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=qLInCwnA7gBacd8iBiB5gpFIvj+W1+7RqwanvNMpTF6okWxINOJexMBNoCU2dwDoNb9FjbOg9XmGKv89/O107J433CvIf/DWYxZodcRmXrmOA+vEuNMnii1D90MLtFZpRtsNimVKh3Od1Y93ocC1q4/ZgeWU3qt1zO60zmtuFQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ml8OfI4C; arc=none smtp.client-ip=209.85.222.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-ua1-f74.google.com with SMTP id a1e0cc1a2514c-85c8a0d07f2so4653160241.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 18:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737513895; x=1738118695; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iYI4Is8tFz7183dmiA/Adb/IqIca/hVoNlpc9Jn5AMQ=;
        b=ml8OfI4COPwvkdpLLDqZy3pnfCsstBAIUqtODq3rfFvQ8ewji2uV9g90FS41DcPrJx
         3qxfI9RwJuB5/JVw3PLOjxcFok1NfiNIEjTLIvLIlM3aPmunZh2lzMEWzVgorySy/F/A
         vwGjKvpWFJydwyO1tUTqmVScvlo1WoIU0357+RqvtbcaLqhsaWT93jqg8MUr2gqnuau8
         ayPX7fS07BSRwlyYuQ6O5W7DWgX5dEmBYMVAahMvuMIkLd2qXhf+KeabypbWPC2VaIGz
         EicSXR/rDzK5ZdYMawhbKRFoS/B5T3+I0wb/U2qadniPPYzrv4/vsqXjYSPCI5khYYKS
         Oi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737513895; x=1738118695;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYI4Is8tFz7183dmiA/Adb/IqIca/hVoNlpc9Jn5AMQ=;
        b=JJMIOF/wlprQ0/nPkXX/wEZZAlWCaznfXOR3/k0AFweyuMB3VLey6o0c3386D7yIqZ
         /lB2iCxY6Gkg5sXMidhTSaJaAvkMz1knsfXZLlISuAR0a3Pvc5pPr7sE8PcItvb6LMRH
         9laRLd75ML4tkZYK5qEJMR5Y23vIbRsqqcDDdMONhqeL9eJ+hy2Ad3UBOBk21BwOmYB/
         pQ1q4deMiwhDeRY9HZ1DTlmTNF7T0Y6+QhXKX0FJh2iqkKKK3sgZHeRfovk7TmRsOlIX
         i13ajZEPXvPZcIA4uMkuQaNEHdEkUXFKZyjl6dr7hniL8rT4+Filsw35QOeKTg3PzLfw
         37fA==
X-Forwarded-Encrypted: i=1; AJvYcCULHqNu//lOnactE+jAwqkVbq7IVUwvAdtEUMxaOplawcAgulCjE6lysey4QFwFa/nc5x6bLK3z73I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjnTfBQ7PF34kedEupw/tW+ov+RpmFDG0+TfW/wXh/eA++R3nZ
	mu/jqhfAnjw2B5CjRiiLLZZL30B6R0ZfNOouGEtKCpUUQvbu16H2OoTSLxJUCnFQhkL5ZOQnUw/
	9/g==
X-Google-Smtp-Source: AGHT+IGr7CNqNXlep6s6g3pF24HHv2RMHWVEZzMyY4IQTETR5upITEMCVxNK1Q9bl605QUzRhf6J2ENJrBI=
X-Received: from vsbia19.prod.google.com ([2002:a05:6102:4b13:b0:4b6:1ac7:43de])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6102:3f03:b0:4b2:7534:f26e
 with SMTP id ada2fe7eead31-4b690c77e52mr16282688137.16.1737513895517; Tue, 21
 Jan 2025 18:44:55 -0800 (PST)
Date: Wed, 22 Jan 2025 02:44:52 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250122024452.50289-1-royluo@google.com>
Subject: [PATCH v1] usb: dwc3: gadget: fix gadget workqueue use-after-free
From: Roy Luo <royluo@google.com>
To: royluo@google.com, Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org
Content-Type: text/plain; charset="UTF-8"

`dwc3_gadget_soft_disconnect` function, called as part of
`device_del(&gadget->dev)`, queues a new work item to the gadget workqueue
after the workqueue has been flushed in `usb_del_gadget`.
This leads to a potential use-after-free issue.

To fix this, flush the workqueue in the `release` function before freeing
the gadget. This ensures that all work items are processed before the
gadget is destroyed.

Fixes: 1ff24d40b3c3 ("usb: dwc3: gadget: Fix incorrect UDC state after manual deconfiguration")
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/dwc3/gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index d27af65eb08a..12055e3af622 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4580,6 +4580,7 @@ static void dwc_gadget_release(struct device *dev)
 {
 	struct usb_gadget *gadget = container_of(dev, struct usb_gadget, dev);
 
+	flush_work(&gadget->work);
 	kfree(gadget);
 }
 

base-commit: f066b5a6c7a06adfb666b7652cc99b4ff264f4ed
-- 
2.48.0.rc2.279.g1de40edade-goog


