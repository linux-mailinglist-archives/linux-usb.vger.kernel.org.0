Return-Path: <linux-usb+bounces-22234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5032A7342E
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 15:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 146093BFD5A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 14:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4658121770C;
	Thu, 27 Mar 2025 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bvLKFw2M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DCD21767D
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 14:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085026; cv=none; b=U7Hak83BG0aMz8bKjZ21rlBFPDAIrwiY5YpD5N0LqkYYbDq1zBxd04aQXyBvhVvqcYW/Va6RAkiLDlHddIzbpzfaaVKEg7foKw0nY1/eSWvSR5lFy6anvR2XIhwoVnPd1KHaJgzZT/3EcqiS6VR6ZAPT3r+lLBFmub6oYmqYs4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085026; c=relaxed/simple;
	bh=FMjn3PBCrIkcDy6h1GYGmCEGqAcDg9C0ZGWaMXOSL1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BqFf+HOkDOw9rjoJwq+lH4qts54A3xybjo9xNKqtiFoZ5r/WGjXTFUl8C7whsxkqlnjTsUOO4+i5I9P/yx/O9zGH0xkIjZ3rP7pDJb8PS3Hc5qcQ0Im89ZKYmxwn7Wv6WsuZGIssqCFxoVGJ8LT3YeyDxKWkMQnZhZKhaB/wFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bvLKFw2M; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3913b539aabso553710f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743085022; x=1743689822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pcxyyMzwk7n/+DPlY6qN839q1d9lfkdYO8LPY/iBB4=;
        b=bvLKFw2M+8Klx+Oh/iy8W5zgakShklDIYXr8Tbybb5k29dzJ4poFshB4D0YQIkZfZ6
         OARbNBOMKX3fUHo8PNiCZb7u71PhQn2wplRACMJNUIhkBqEn5H0PjaCIhTOGJwvJtz4X
         fgvdBSzAQQf16AFAgrNLEBrxR8V9rcdwN/Mso0h83g560gmxPDF8PfdzHptakzBul10k
         Nnya2lA5myv1w819Yjeoqmvpd0w86vXuI/isc0cMWgehVbP4J/p34CIplOOq/5Z2VI/O
         dU9YxP1wzuZ94HrJPIJNo50LH+njTFFURnXkio1N+iqtUZDI9d/BlyW0RjWv0curlK6W
         OkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085022; x=1743689822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pcxyyMzwk7n/+DPlY6qN839q1d9lfkdYO8LPY/iBB4=;
        b=SwOWE/K9oQ0J6JUQ//Ym/NkjMF3JMRgQhq+NwrxnQBAq0xh3IevpSHRUodi67Mkg2U
         AZi3h+mRK+c2xO9lK+qbnIHViy1SS0k9DYOLzgJr5SAFGseppLYA76ghjGt8Mbs06pgq
         bABHAzV0RsHUPHDmFNvYdJ/h/j14deO8wBKO35SR2tYptrSqBSA6BhprnfYR0X9C7G/e
         gytsMsaaFRUNGrW4FZaPV2puAv/J/RjbfvQ4+WeH9+a6zO6u8Z6pp1rUvNxG3RUNcaKk
         kT0bz4gU/Xt80PR0T6NYnhKdrvOP4qulWRfhFS4n9rhaUJhCRLAoHKXMJn57G/dSdK3y
         8DTg==
X-Gm-Message-State: AOJu0YzIkyg3151FwQJXjEXFX9E88XtBBk+GKzqW1tQuZRHoYnAHLruI
	P7ZhUQsB5/OO0Bo/yKaOAJGuwjjybS1lZtlrDilgu3yO2n3ubIcIfZI7cFp/1HkgNNh6ElGzCk+
	teLs=
X-Gm-Gg: ASbGncsvAaBINs9lQG2MnSg58pcYId4CZ5NkCs4Ygq7vOXG5yckvEEiWyxKJ8Wrpo/N
	mIgwtGOoLE/N1s3WJTXV+KBPnerezTmX422p5DIqJ96TkNn+oKBns+5hP5BfqOfkQcms2KpMkvu
	e9kD9cq6ubLHbrEaZcepSVpezm21Nj4LXk+IdgryXrTrXTSBs0h+fyCeIfNIJWE2lOJT6IXiK1N
	7gTalYHkZEq/dvdp6ndYadkpe9uX6gMypoP0T1hFcPcG06OXOlS3g2cBUHtBK8a+0/DndIzTfZz
	I6uh7I4rv45jilieGQZ+CvyeyAAM9kvHocvG1N2bzGdZaXRSC2epPd1RxoASfA==
X-Google-Smtp-Source: AGHT+IF/irwuEodx4D7xUKBA5kN6ZYxHeS1aZzgWqcSt+btQ+7WAk8JcnQ4xzAmPzYdQC619LJsesA==
X-Received: by 2002:a05:6000:1ac6:b0:390:f394:6271 with SMTP id ffacd0b85a97d-39ad176bc7emr3193106f8f.43.1743085021468;
        Thu, 27 Mar 2025 07:17:01 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm20112527f8f.75.2025.03.27.07.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:17:00 -0700 (PDT)
From: Frode Isaksen <fisaksen@baylibre.com>
To: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	Frode Isaksen <frode@meta.com>
Subject: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued twice
Date: Thu, 27 Mar 2025 15:15:26 +0100
Message-ID: <20250327141630.2085029-1-fisaksen@baylibre.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frode Isaksen <frode@meta.com>

Prevent dwc3_request from being queued twice, by checking
req->status.
Similar to commit b2b6d601365a ("usb: dwc3: gadget: prevent
dwc3_request from being queued twice") for non-ep0 endpoints.
Crash log:
list_add double add: new=ffffff87ab2c7950, prev=ffffff87ab2c7950,
 next=ffffff87ab485b60.
kernel BUG at lib/list_debug.c:35!
Call trace:
__list_add_valid+0x70/0xc0
__dwc3_gadget_ep0_queue+0x70/0x224
dwc3_ep0_handle_status+0x118/0x200
dwc3_ep0_inspect_setup+0x144/0x32c
dwc3_ep0_interrupt+0xac/0x340
dwc3_process_event_entry+0x90/0x724
dwc3_process_event_buf+0x7c/0x33c
dwc3_thread_interrupt+0x58/0x8c

Signed-off-by: Frode Isaksen <frode@meta.com>
---
This bug was discovered, tested and fixed (no more crashes seen) on 
Meta Quest 3 device. Also tested on T.I. AM62x board.

 drivers/usb/dwc3/ep0.c    | 5 +++++
 drivers/usb/dwc3/gadget.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 666ac432f52d..e26c3a62d470 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -91,6 +91,11 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
 {
 	struct dwc3		*dwc = dep->dwc;
 
+	if (WARN(req->status < DWC3_REQUEST_STATUS_COMPLETED,
+				"%s: request %pK already in flight\n",
+				dep->name, &req->request))
+		return -EINVAL;
+
 	req->request.actual	= 0;
 	req->request.status	= -EINPROGRESS;
 	req->epnum		= dep->number;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 89a4dc8ebf94..c34446d8c54f 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3002,6 +3002,7 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
 	dwc->ep0_bounced = false;
 	dwc->link_state = DWC3_LINK_STATE_SS_DIS;
 	dwc->delayed_status = false;
+	dwc->ep0_usb_req.status = DWC3_REQUEST_STATUS_UNKNOWN;
 	dwc3_ep0_out_start(dwc);
 
 	dwc3_gadget_enable_irq(dwc);
-- 
2.48.1


