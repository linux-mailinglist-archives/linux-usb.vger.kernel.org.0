Return-Path: <linux-usb+bounces-6760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4F385B4A2
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 09:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C1381C220D8
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 08:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887645C8FB;
	Tue, 20 Feb 2024 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g+nggSxm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9101D5C5FD
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708416739; cv=none; b=YahD4WEHXOp8pvZUTb6wofmwyWGGD27JCiwlM3iT4OYhpNxi9bLi5s3zbeATWGsYWLwjqKkhRnrgUPObxM1AUM/E+MJCYB7mxEvoSUuqTiIZ+teLC8HgnZUzQs5EE1IB1wFccuvCLlp7mX71Q4mtA7dMcFDnrV+q0SUPCH/Tz3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708416739; c=relaxed/simple;
	bh=/rabM4Ojv3qXPABWhPOzcXvWzcE1bpcBe1707Z9xKgg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VdD7HBzFQXiw1nQeYsUYd5hboBG7Q/tZTeCn/8oaz+Cm+FngrS/Qo3sJPcKoaE2uULGdeAXQ+UuDgoGY2z9R6/ddgjL7hkkrdYtn7JtLsWOtsAza6QsaxRIOUkisnclnOgQjntvKTwiNujptKKJrkhKMOid4U5dmLVMCzFRF/Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--raychi.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g+nggSxm; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--raychi.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dced704f17cso371149276.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 00:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708416736; x=1709021536; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7NyTQc14Zf/h2SqeLHUekdRb34OTt1i2UvuEmj+OuFE=;
        b=g+nggSxmQkbCXvjQQMjfd+GJrhqjetnwR3vH3J7tBDV3Mki9t9r4v1QDZnCPz5OK88
         kG6dQSYSd73EVxG6bae7vMB7ZAP+fbZanubSs/NaF8qvgLPygjoSgLLS+ZUhO+TC3zy6
         lvYQcIoD1oYrhwiyo6s2bNb9OQ8/J7BgLzwxBN/iFSoax/63sS82m6waRJSSYe26oOp0
         c6DlUqQYAQEllT78ObvQYJg7nN5+WCor/I4P62AVuztaruIblbXmezvm6tTFkJlwmnzL
         DKyZW8x2J1vf+gOCdsx8h7krEexg/qz7i0R7bc9C29X9FUOcw8j4Qzg6iR+kmJ0iYi3x
         JpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708416736; x=1709021536;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NyTQc14Zf/h2SqeLHUekdRb34OTt1i2UvuEmj+OuFE=;
        b=Dke9n6HYihLmVFjc1z0k1IAtpo5n84Xn/DZkHmfH2mrPslspr3fujd9tjt75dNTKfi
         DmzyOR7MV404zgOKQgC7b4/24NLwekS8SCbyU9Zxi2UjmGXNotoNIpTr94XXnF7p4QKI
         Azv7VhTdUqchhvaJpcoSMZQNzbVzjFU0mm1DjWCrUEqsPYBg1yWiNduwBz+Q0qpAKmVm
         AbkcDDKyePNgdoodafSrZ6PiSe4IxLdyrKMz7cqE/0mPL6lwPnRyu9/pcrIMvOrzXACd
         A8q2uCJZ0Mj7VLf+i8dqqoK3Q0CEVoMf4tt4k2AZiahkmczYvbPpTRW578zBL7q3eGCd
         VyTg==
X-Forwarded-Encrypted: i=1; AJvYcCVSgnlT2uJzVNX5H9HHhY8Gk45HAxHI1PpE360G2mc+a5OYH89edUhegawkgX2GE5ivNWyPEV43NOxEwe6AjgVNaVzmqRYNn4CS
X-Gm-Message-State: AOJu0Yz2xp1nmFt6Jswn7CeSvgeK+oOAXsKevgEIV8myPjdogtlx89wO
	wbuu+rsvFzuyluahcbRyj92yUEPanUjhLRBre78vdhLwi/89W9F+3WA9EJQdFMif0BEYrI6MVKm
	AhA==
X-Google-Smtp-Source: AGHT+IHNQS6LSHevRMTxDokV0cAYaI5EkrQn4V1Y4tZL0I+ejqlFuzOyBy3AA2eQbWjAGfgyiPZewI6v+oY=
X-Received: from raychi-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:d899:e5b8:ba5f:3c9])
 (user=raychi job=sendgmr) by 2002:a25:abec:0:b0:dcc:94b7:a7a3 with SMTP id
 v99-20020a25abec000000b00dcc94b7a7a3mr495450ybi.12.1708416736722; Tue, 20 Feb
 2024 00:12:16 -0800 (PST)
Date: Tue, 20 Feb 2024 16:12:04 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240220081205.135063-1-raychi@google.com>
Subject: [PATCH] usb: dwc3: gadget: remove warning during kernel boot
From: Ray Chi <raychi@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	quic_uaggarwa@quicinc.com
Cc: albertccwang@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ray Chi <raychi@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The dwc3->gadget_driver is not initialized during the dwc3 probe
process. This leads to a warning when the runtime power management (PM)
attempts to suspend the gadget using dwc3_gadget_suspend().

This patch adds a check to prevent the warning.

Cc: stable@vger.kernel.org
Fixes: 61a348857e86 ("usb: dwc3: gadget: Fix NULL pointer dereference in dwc3_gadget_suspend")
Signed-off-by: Ray Chi <raychi@google.com>
---
 drivers/usb/dwc3/gadget.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 28f49400f3e8..de987cffe1ec 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4708,6 +4708,9 @@ int dwc3_gadget_suspend(struct dwc3 *dwc)
 	unsigned long flags;
 	int ret;
 
+	if (!dwc->gadget_driver)
+		return 0;
+
 	ret = dwc3_gadget_soft_disconnect(dwc);
 	if (ret)
 		goto err;
-- 
2.44.0.rc0.258.g7320e95886-goog


