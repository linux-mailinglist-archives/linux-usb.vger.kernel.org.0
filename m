Return-Path: <linux-usb+bounces-8060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C389787F404
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 00:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B4A31F22C2A
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 23:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE515F866;
	Mon, 18 Mar 2024 23:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g312OvpS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2588A5F85B
	for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 23:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710804716; cv=none; b=nz7gqqznUmANic3Qlx01WGO7GKYF/ERDn/YSrwSLJP714Kx5q2EVLpacVPGo84m/ZakvPKA9/JsM5s9uIhR2dxDeQ/1tuTOvqtJSdRqfcb8JWa8vOBeFijCu6iVcUtw9dP1lI+WTbQ8OBMWlm7LX7FWyFfTWWB5ZS4mYtjCqmlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710804716; c=relaxed/simple;
	bh=G8PXI75wyQJnt2jt/Qu4uZ0MJ2bX8a6fiwFYVwQxj54=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ai7dxSEee5ac0qpn9DUtnrrBrKnLQOKSlIDL8Xll6RK2p1yClBB5fFTe0FWubP89zIVWUqJk1heTonSxLQuMoNRGffV7qz7ZNfPwx+4OOHMHP4X62BJcJaftLGeQJ5BEoML9ZfgR84UWiTaxyGpR0V/v1KRsrSnfzXW3Lj2W/e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g312OvpS; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60a54004e9fso90987717b3.3
        for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 16:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710804714; x=1711409514; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/hYA0yVMfoXQX/tkABnkiVaF9F5w17dveHRWbK7K11I=;
        b=g312OvpSjuJfepmmeO/udfNfk+GkHNuEYN4qSpOB8eCCEfIV5Dpya11fRrUQ6GOpmb
         jICcI55fNhFIgRHHL/3z7KhgnEDd8pVBysMy6XBO+zOx84nwtzTb2VtT4ci+Yu6vpWMA
         Li5giSBYl/gtym+/kbcDtOte79YprYHwRkxfCRjga2dCXfFVBY4geTm0Vcvv9hUnwtf1
         RA7QzxzZdBB2I0fGtK9vcCN91NdHW5iGQV4QcnZEKRxg0bB4kg+UYuVYUwBT3W45fLfT
         ZIkJfbX5ZdMjaa09rT/I/gtiPWcXeIdxhKZpxBV8IpNoVPLSekPqATaplXCoc0kpwsap
         zHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710804714; x=1711409514;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hYA0yVMfoXQX/tkABnkiVaF9F5w17dveHRWbK7K11I=;
        b=VDD/5I+XDh3EiGtOuDknAIxgujXTrL7c/8Q+f+aM/fB/7MwVM81FNeqfg0KDaqqewt
         forv6PwfGwDEXrZlGtu93Vh6ZGnALhhtlVChwtx790lZWIVNCZkkzO9BHPveg31cFsRT
         3HCKKTUA3cGVR4ADnuLbQQMqgGF/Dkw/3tAS1aW5TBVXwX5ZVwkKCouULbi3syS/oGCY
         YIOmdFaoorVESpMUnFT8BM36qhCHv+wbbzGRq2PgGEAb5KgM87dby3Aa0v8vPdQRBkfv
         dSwWA0o6uVcCncj7yNVkk7fKf4QHUBa8G8KEmaE0BKA3w1BKnXoBH1Vbp7PtNU8vYpTC
         WS1A==
X-Gm-Message-State: AOJu0Yzogu9gVF8HhhFL1MIDSAGZcF9kmqsl9ZZb+1JA9LHL7sirr12h
	FL0dbMIqYnhLf8Mp3b+N1HtfMtaSo7YkYitECjXCOrI5UCuswDFzLK6y1WObLVMJNw15nt3lGJ8
	vyM+J3moOEKF+s+CVY2LKYQ==
X-Google-Smtp-Source: AGHT+IEcyEAm6+e1Tg0ayOlUnAb8GesMaSFK451Mqcd23PrLdQzWt457SqIzUIwgEynyMrhJc0UBWt78TjqL2Zdx7A==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:e09:b0:dc6:dfd9:d431 with
 SMTP id df9-20020a0569020e0900b00dc6dfd9d431mr147939ybb.1.1710804714301; Mon,
 18 Mar 2024 16:31:54 -0700 (PDT)
Date: Mon, 18 Mar 2024 23:31:53 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOjO+GUC/x3NTQrCMBBA4auUWTuQn4riVURKnIwxC9My04RK6
 d0NLr/NezsoS2aF27CDcMua59JhTwPQO5TEmGM3OONG4+0VdZVCyxej5MaiWPWJKcTEK9ZI+Gl T9XGiWRgJz4bDZXTOW0vQk4vwK2//3f1xHD/Njti4fgAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710804713; l=1939;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=G8PXI75wyQJnt2jt/Qu4uZ0MJ2bX8a6fiwFYVwQxj54=; b=SMrdYSJzX+MnSMD6sDqSBZWTY/HYEMo0XCaDfBfrmOfM9iiDJ5YOsiltw5Ae6VKsEq2hKUaoK
 nbWYum1TQMPCB9YQhj00veQ+IrIgkGxFZd78icvbRcCsqYhL2pjR+Dz
X-Mailer: b4 0.12.3
Message-ID: <20240318-strncpy-drivers-usb-gadget-udc-mv_u3d_core-c-v1-1-64f8dcdb7c07@google.com>
Subject: [PATCH] usb: gadget: mv_u3d: replace deprecated strncpy with strscpy
From: Justin Stitt <justinstitt@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

Let's opt for the new 2-argument version of strscpy() which guarantees
NUL-termination on the destination buffer and simplifies snytax. The
NUL-padding behavior that strncpy() provides is not required as u3d->eps
is already zero-allocated:
|	u3d->eps = kzalloc(size, GFP_KERNEL);

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/usb/gadget/udc/mv_u3d_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/mv_u3d_core.c b/drivers/usb/gadget/udc/mv_u3d_core.c
index 2a421f0ff931..e1dd5cf25d08 100644
--- a/drivers/usb/gadget/udc/mv_u3d_core.c
+++ b/drivers/usb/gadget/udc/mv_u3d_core.c
@@ -1307,7 +1307,7 @@ static int mv_u3d_eps_init(struct mv_u3d *u3d)
 	/* initialize ep0, ep0 in/out use eps[1] */
 	ep = &u3d->eps[1];
 	ep->u3d = u3d;
-	strncpy(ep->name, "ep0", sizeof(ep->name));
+	strscpy(ep->name, "ep0");
 	ep->ep.name = ep->name;
 	ep->ep.ops = &mv_u3d_ep_ops;
 	ep->wedge = 0;
@@ -1337,7 +1337,7 @@ static int mv_u3d_eps_init(struct mv_u3d *u3d)
 			ep->ep.caps.dir_out = true;
 		}
 		ep->u3d = u3d;
-		strncpy(ep->name, name, sizeof(ep->name));
+		strscpy(ep->name, name);
 		ep->ep.name = ep->name;
 
 		ep->ep.caps.type_iso = true;

---
base-commit: bf3a69c6861ff4dc7892d895c87074af7bc1c400
change-id: 20240318-strncpy-drivers-usb-gadget-udc-mv_u3d_core-c-50ea7422311c

Best regards,
--
Justin Stitt <justinstitt@google.com>


