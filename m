Return-Path: <linux-usb+bounces-2234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0D07D8981
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 22:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF21BB2138D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 20:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690473CD08;
	Thu, 26 Oct 2023 20:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aggK5mRY"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A973C6B4
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 20:09:33 +0000 (UTC)
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ba])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E832C1B1
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 13:09:31 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1698350483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i2fWBBG9mLsogb4ThmIrsmZJLekVVeeZs1stUDz5bLY=;
	b=aggK5mRYNgfUFifJAY6PRh8UPuM4z6Xtj3PW/t5bGjwxdH0d2b88z3eQ04wjdZNzx8+X7+
	pp2Lo/wHupV12uFZ5T97mtTvwIi9LO814iRGBsuURqZ/lhC1GtSS5BYEx+l4Y9srIl1Hrm
	coM2+KKYuNpZtBh3w08FwqxN4x/sPSk=
From: andrey.konovalov@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] usb: raw-gadget: don't disable device if usb_ep_queue fails
Date: Thu, 26 Oct 2023 22:01:13 +0200
Message-Id: <3c5df3dddb67623b4aeb11c5546370363e65d8e2.1698350424.git.andreyknvl@gmail.com>
In-Reply-To: <0db45b1d7cc466e3d4d1ab353f61d63c977fbbc5.1698350424.git.andreyknvl@gmail.com>
References: <0db45b1d7cc466e3d4d1ab353f61d63c977fbbc5.1698350424.git.andreyknvl@gmail.com>
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


