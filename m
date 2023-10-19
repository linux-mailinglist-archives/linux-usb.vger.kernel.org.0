Return-Path: <linux-usb+bounces-1927-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8A57D0218
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 20:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A58E1C20E3B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 18:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E980A315AA;
	Thu, 19 Oct 2023 18:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xkm6eTaN"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6353225BD
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 18:53:28 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8852126
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 11:53:25 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7b9e83b70so548427b3.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 11:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697741605; x=1698346405; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DyQHvM95HzGRCxeWunB7tnMEVIbhnA6GxZYPEGZ3s5U=;
        b=xkm6eTaNtsjs+HJXEUlElu5vhTymoSfxNT0absM0habw/xtAX1c3D5bSxyuin/7asr
         2AE4QyyFp2jnCVhX2o5I16I1ZOUvSs2aAeJdczNCPHLFj0VKfk3evfjuMiajB7j8C2T5
         0MzfYpxsmmV+nqQq4HXseRd47nlDPWVLHANr5SydXkEzruDYnDmDlEdnt5Mll8wkM0qq
         67e3abOc4hU+57LpQ7NkBS4HNfdKbAaFvIXH+Smxj7ohFplqUvtX4FNWI1IgtLgM0e55
         GH69dae+SMAsjo8TXSBrkVOqpF3QHdpqA97tgmDMUuMpEJhaJVFkX5BsvjO8HKjevlm3
         DPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697741605; x=1698346405;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DyQHvM95HzGRCxeWunB7tnMEVIbhnA6GxZYPEGZ3s5U=;
        b=EB1G9MnP5tTKdv0PTZtiz2Y+0xMzp8Wx6wHGZeIOkVFwhFsJS6PVHgYjRx54rJPYEY
         9x696gbqjxe2WxoASf7ERTG36mI78pwLkgoMroa5uIRsmpgoCRbAqmAPwZH/1p3lN962
         dqSrQoYV8i4qGK0q534dQ7PFdEK2X+oSzgZyBadtlBqa3fi1cpCBuHhiH93CnwBJ2W7j
         Cgzt4pp4qKRRNHACzeZ8cwM9Jy60OnFSbhBDXS3F6Je3D6TROhq3bHiIf5K3AzObn6we
         iLfX46FktZ1pWcQlxQEsjo5HCJlP5dAlQb20rXq0o8PIqxz4cxfI7/wcL0EXwO0dHlyM
         bq5w==
X-Gm-Message-State: AOJu0YxiVWRA2iIeeBPyJoLtkk1Y6wZv3XEnFLk5tpwo0bOk/kfwFSVo
	eFffYVD3to1ePnu0ru8VC8W12dlCQdr1
X-Google-Smtp-Source: AGHT+IFclY7hMwdqtJ3ewebhsgfj//VgCG2RsctDrmCmuFeXerbKUgpKq+uTzS3kQUbdx0LNzm8ZIitW0NUQ
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a05:690c:a9b:b0:5a7:b95c:a58f with SMTP id
 ci27-20020a05690c0a9b00b005a7b95ca58fmr96863ywb.1.1697741604917; Thu, 19 Oct
 2023 11:53:24 -0700 (PDT)
Date: Thu, 19 Oct 2023 11:53:15 -0700
In-Reply-To: <20230930184821.310143-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230930184821.310143-1-arakesh@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231019185319.2714000-1-arakesh@google.com>
Subject: [PATCH v6 0/4] usb: gadget: uvc: stability fixes on STREAMOFF.
From: Avichal Rakesh <arakesh@google.com>
To: arakesh@google.com, dan.scally@ideasonboard.com, 
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com, 
	m.grzeschik@pengutronix.de
Cc: etalvala@google.com, jchowdhary@google.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

We have been seeing two main stability issues that uvc gadget driver
runs into when stopping streams:
 1. Attempting to queue usb_requests to a disabled usb_ep
 2. use-after-free issue for inflight usb_requests

The four patches below fix the two issues above. Patch 1/4 fixes the
first issue, and Patch 2/4 and 4/4 fix the second issue. Patch 3/4
is only there to make the diff in 4/4 cleaner.

Avichal Rakesh (4):
  usb: gadget: uvc: prevent use of disabled endpoint
  usb: gadget: uvc: Allocate uvc_requests one at a time
  usb: gadget: uvc: move video disable logic to its own function
  usb: gadget: uvc: Fix use-after-free for inflight usb_requests

 drivers/usb/gadget/function/f_uvc.c     |  11 +-
 drivers/usb/gadget/function/f_uvc.h     |   2 +-
 drivers/usb/gadget/function/uvc.h       |   6 +-
 drivers/usb/gadget/function/uvc_v4l2.c  |  12 +-
 drivers/usb/gadget/function/uvc_video.c | 231 +++++++++++++++++-------
 5 files changed, 189 insertions(+), 73 deletions(-)

--
2.42.0.758.gaed0368e0e-goog

