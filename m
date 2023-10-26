Return-Path: <linux-usb+bounces-2223-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BE47D84B4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 16:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60D751F231FD
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 14:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D98D2EAF6;
	Thu, 26 Oct 2023 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XBvI+jgF"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085BF2E41F
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 14:29:33 +0000 (UTC)
X-Greylist: delayed 322 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 26 Oct 2023 07:29:32 PDT
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5F4128
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 07:29:32 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1698330247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i2fWBBG9mLsogb4ThmIrsmZJLekVVeeZs1stUDz5bLY=;
	b=XBvI+jgFgfBTEd3SPlLvylwAVqtL0K0PzVa2uIgN3YzHxGBA567eUeA+uGIeE8BOOgyigz
	EEbDUIErsoIamX7fErA4whB0G/ptZmzumkL5O2Zkht57Ue4sMRFqaoyeA1ElapIU6H4wDM
	Ro3JhkWurPuVf/RtAJtc7ru+TEaPdDA=
From: andrey.konovalov@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] usb: raw-gadget: don't disable device if usb_ep_queue fails
Date: Thu, 26 Oct 2023 16:24:00 +0200
Message-Id: <3c5df3dddb67623b4aeb11c5546370363e65d8e2.1698329862.git.andreyknvl@gmail.com>
In-Reply-To: <0db45b1d7cc466e3d4d1ab353f61d63c977fbbc5.1698329862.git.andreyknvl@gmail.com>
References: <0db45b1d7cc466e3d4d1ab353f61d63c977fbbc5.1698329862.git.andreyknvl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Andrey Konovalov <andreyknvl@gmail.com>

During device operation, the host might decide to reset a device emulated
via Raw Gadget. In this case, if the device emulation code has endpoint
requests queued, usb_ep_queue will fail with -ESHUTDOWN. Currently, this
disables the Raw Gadget device and makes the emulation code unable to
proceed.

Do not disable the Raw Gadget device if usb_ep_queue fails.

Signed-off-by: Andrey Konovalov <andreyknvl@gmail.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index ce9e87f84911..daac1f078516 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -693,7 +693,6 @@ static int raw_process_ep0_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
 		dev_err(&dev->gadget->dev,
 				"fail, usb_ep_queue returned %d\n", ret);
 		spin_lock_irqsave(&dev->lock, flags);
-		dev->state = STATE_DEV_FAILED;
 		goto out_queue_failed;
 	}
 
@@ -1080,7 +1079,6 @@ static int raw_process_ep_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
 		dev_err(&dev->gadget->dev,
 				"fail, usb_ep_queue returned %d\n", ret);
 		spin_lock_irqsave(&dev->lock, flags);
-		dev->state = STATE_DEV_FAILED;
 		goto out_queue_failed;
 	}
 
-- 
2.25.1


