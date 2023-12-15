Return-Path: <linux-usb+bounces-4221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D640481519B
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 22:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0556A1C23538
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 21:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D57147F63;
	Fri, 15 Dec 2023 21:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X5mIv3ff"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4297F47776
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 21:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--arakesh.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5c6bdaba750so1980591a12.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 13:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702674471; x=1703279271; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bDHNy6mRe16xdviFUOtx/SHX4cJgboHVcJcVFUnLuxc=;
        b=X5mIv3ffaTBYfvThLWYS4xlLcNwHbT/OvDPbCQuXaYXw+GIDY5MyFc7k+bkv56PIeg
         JR6PrxZFu6p8w21q6Tx1G5JpNUKkuluSjLS3GyIPfSWrKEsWc6nprq4Qjji/+L59gTWP
         h63jOMtec4ypTWzMMmNemEKoyUndWUYsiN9tnubylZK6IppTwBtQRcQNbQj7RluBh5/N
         A9qrJrHfAEjRgo5ZiPVpCeXOuXSYhpvgYsi5g0bLJ/7KmbDhL1DYC/5bqufosJKD7RY5
         gjX04h0zxXbDW4ntlW/SDvB/YWdaZ9vGS9Av4fhlanOSOb0nZ5jBR/8FFu//9JYRFgXA
         PO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702674471; x=1703279271;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bDHNy6mRe16xdviFUOtx/SHX4cJgboHVcJcVFUnLuxc=;
        b=SmhkOisrGTPv1EsbyVUB2OsebT19rwrfZsS7E2KuwH/fbURe5V+SqoGsP7/HJc2Gum
         RlKdjmWEKke3mLPU79qyQEINh4ugdGDXBtf7u2b3aHMVIA+U+vzinPomV88RETpJLixX
         NqqSbfUEl3QNshKk4FoovT+SX+K4bvKpxkkWyoNFCpWnj+KiFlxy69UdCILLO7MkEZd0
         reUa9JL9cWtfgGN9lxejmxzT0A/RI+xnunLTyDk6nwuAc9MUHDvpOnUdT7eEGh5c+x1I
         +u20CXZl589e85NB9EsokeiA7ghv/BUGpBMCIjQ2IGHU1cPBEf75GSWiKXriRTtPou6j
         lNPw==
X-Gm-Message-State: AOJu0YwTTzGIS6HLWKO4A4fVfLMVvkOwAvjevEED8Y5nvBgV2CCCePY+
	KE6YbtjGLEvJVER+D6fEztLsvOe7bylq
X-Google-Smtp-Source: AGHT+IEVNERXxBpC9/CMzL2+e3kQZhTjNVGETkGI/CL2fBrtHmSOi/pzYtE/XurBLzXLfMl6dY0o/bJJGNz+
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a17:90b:2243:b0:28a:c111:2119 with SMTP id
 hk3-20020a17090b224300b0028ac1112119mr1059647pjb.3.1702674471575; Fri, 15 Dec
 2023 13:07:51 -0800 (PST)
Date: Fri, 15 Dec 2023 13:07:44 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231215210746.821494-1-arakesh@google.com>
Subject: [PATCH 1/2] usb: gadget: uvc: Fix use are free during STREAMOFF
From: Avichal Rakesh <arakesh@google.com>
To: dan.scally@ideasonboard.com, gregkh@linuxfoundation.org, 
	laurent.pinchart@ideasonboard.com
Cc: etalvala@google.com, jchowdhary@google.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Avichal Rakesh <arakesh@google.com>
Content-Type: text/plain; charset="UTF-8"

There is a path that may lead to freed memory being referenced,
and causing kernel panics.

The kernel panic has the following stack trace:

Workqueue: uvcgadget uvcg_video_pump.c51fb85fece46625450f86adbf92c56c.cfi_jt
pstate: 60c00085 (nZCv daIf +PAN +UAO -TCO BTYPE=--)
pc : __list_del_entry_valid+0xc0/0xd4
lr : __list_del_entry_valid+0xc0/0xd4
Call trace:
  __list_del_entry_valid+0xc0/0xd4
  uvc_video_free_request+0x60/0x98
  uvcg_video_pump+0x1cc/0x204
  process_one_work+0x21c/0x4b8
  worker_thread+0x29c/0x574
  kthread+0x158/0x1b0
  ret_from_fork+0x10/0x30

The root cause is that uvcg_video_usb_req_queue frees the uvc_request
if is_enabled is false and returns an error status. video_pump also
frees the associated request if uvcg_video_usb_req_queue returns an e
rror status, leading to double free and accessing garbage memory.

To fix the issue, this patch removes freeing logic from
uvcg_video_usb_req_queue, and lets the callers to the function handle
queueing errors as they see fit.

Signed-off-by: Avichal Rakesh <arakesh@google.com>
---
 drivers/usb/gadget/function/uvc_video.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 98ba524c27f5..e5db1be14ca3 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -277,8 +277,7 @@ static int uvcg_video_usb_req_queue(struct uvc_video *video,
 	struct list_head *list = NULL;
 
 	if (!video->is_enabled) {
-		uvc_video_free_request(req->context, video->ep);
-		return -ENODEV;
+		return -EINVAL;
 	}
 	if (queue_to_ep) {
 		struct uvc_request *ureq = req->context;
@@ -464,8 +463,15 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 		 * and this thread for isoc endpoints.
 		 */
 		ret = uvcg_video_usb_req_queue(video, to_queue, !is_bulk);
-		if (ret < 0)
+		if (ret < 0) {
+			/*
+			 * Endpoint error, but the stream is still enabled.
+			 * Put request back in req_free for it to be cleaned
+			 * up later.
+			 */
 			uvcg_queue_cancel(queue, 0);
+			list_add_tail(&to_queue->list, &video->req_free);
+		}
 	} else {
 		uvc_video_free_request(ureq, ep);
 	}
-- 
2.43.0.472.g3155946c3a-goog


