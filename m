Return-Path: <linux-usb+bounces-4761-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF5B824A79
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 22:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48D1D1F235D1
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 21:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4D92CCA6;
	Thu,  4 Jan 2024 21:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gXVti8pJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0449F2C870
	for <linux-usb@vger.kernel.org>; Thu,  4 Jan 2024 21:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--arakesh.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-28c05e74e36so982983a91.0
        for <linux-usb@vger.kernel.org>; Thu, 04 Jan 2024 13:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704405017; x=1705009817; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w5MKHKztC7x8oMRAwxikjHpMa6UtBIIOu9HjDctnSZc=;
        b=gXVti8pJDnBaztizqwCBnrrOGp3l+lNkHIDaIfOu4+f4Q8RoTqLwcsV2vE9YaExgCp
         nAfvCMe9z6iK1EW5yFFJu4YezqjFHn6SqCc4sQKLzgcDxRkKDOIs3Crk7cfU8+XiRUfl
         sPr964entFWYV+EvUXIf1nSveBPiZ3q7ghTegEenQ78LAviL5CuLKdx5MaA63IAYVEm7
         Ut2U0a8KTipMLVIxXAqt/Tc6NLbBzjhUxled52FovWam+eECJD8rtf9Y3lbiz4bJJO5r
         89SJHv48De5Ad2C5UQzAPwvMXbIVhnF8maFwC4+aU4OYqPUuQrwqsvhxyO+zrAlAexwT
         /YPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704405017; x=1705009817;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5MKHKztC7x8oMRAwxikjHpMa6UtBIIOu9HjDctnSZc=;
        b=nnznxMVXjTMJIfF6dFDFi5aAPdTv8ZihhVGP51ARf6RoRxdEVengy3CstUugun6Vzu
         xBYYFyu7MAiqw1F6LwsznSjf+f8ziJ9CbzSZOGn99Wt3YS/uZigYztGRJ17AUKkCc6s+
         ASLh++Rq7V2oR7KoofcJ2V68mfSthJb6s3D6lHXpYC371COGL/RrGQHjCmUtblTHJDF6
         0LOlW5klH2cchI5L6vLVcEexXnMd0M2UeeRYv98t9PHnTggFXEKcyg0mJ+yXJ4fkkZRg
         5nK5tZ8bMaUoIwm+4US8LyFkFNgK4th7YWIeCLR52CwvnpQZr4ANGGDKmzLIQ0j93E7R
         /GHw==
X-Gm-Message-State: AOJu0YwII4XbT4sOHcXqUSggmy+5fyaAgwC2nZewSXTHy/gi2eXR4zDq
	ht06oB+gsxWh2EY0GQN/Nzix084K+pnmeMLlTvI=
X-Google-Smtp-Source: AGHT+IFJzA6S63F1o2X9Uiv6Huk3vPIJcT/iIlX8KNpC6tCCwRjEHHHRnKAeZKFUnf9T5VCq5PftZj5WddSt
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a17:90b:33ce:b0:28b:e0cd:64a4 with SMTP id
 lk14-20020a17090b33ce00b0028be0cd64a4mr13149pjb.3.1704405017283; Thu, 04 Jan
 2024 13:50:17 -0800 (PST)
Date: Thu,  4 Jan 2024 13:50:09 -0800
In-Reply-To: <20240104215009.2252452-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231215210746.821494-1-arakesh@google.com> <20240104215009.2252452-1-arakesh@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20240104215009.2252452-2-arakesh@google.com>
Subject: [PATCH v2 2/2] usb: gadget: uvc: Remove nested locking
From: Avichal Rakesh <arakesh@google.com>
To: arakesh@google.com, gregkh@linuxfoundation.org
Cc: dan.scally@ideasonboard.com, etalvala@google.com, jchowdhary@google.com, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When handling error status from uvcg_video_usb_req_queue,
uvc_video_complete currently calls uvcg_queue_cancel with
video->req_lock held. uvcg_queue_cancel internally locks
queue->irqlock, which nests queue->irqlock inside
video->req_lock. This isn't a functional bug at the
moment, but does open up possibilities for ABBA
deadlocks in the future.

This patch fixes the accidental nesting by dropping
video->req_lock before calling uvcg_queue_cancel.

Fixes: 6acba0345b68 ("usb:gadget:uvc Do not use worker thread to pump isoc usb requests")
Signed-off-by: Avichal Rakesh <arakesh@google.com>
---
v1 -> v2: Add "Fixes" tag.

 drivers/usb/gadget/function/uvc_video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 7f18dc471be3..dd3241fc6939 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -469,13 +469,15 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 			 * Put request back in req_free for it to be cleaned
 			 * up later.
 			 */
-			uvcg_queue_cancel(queue, 0);
 			list_add_tail(&to_queue->list, &video->req_free);
 		}
 	} else {
 		uvc_video_free_request(ureq, ep);
+		ret = 0;
 	}
 	spin_unlock_irqrestore(&video->req_lock, flags);
+	if (ret < 0)
+		uvcg_queue_cancel(queue, 0);
 }

 static int
--
2.43.0.472.g3155946c3a-goog

