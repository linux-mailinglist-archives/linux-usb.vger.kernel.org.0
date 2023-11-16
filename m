Return-Path: <linux-usb+bounces-2937-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C877EE741
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 20:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E81528115F
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 19:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBE63A8FE;
	Thu, 16 Nov 2023 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MYgweE7x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA55D5D
	for <linux-usb@vger.kernel.org>; Thu, 16 Nov 2023 11:14:54 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso879409a12.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Nov 2023 11:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700162094; x=1700766894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ooyanxwFqzoCUAfMi/r6dZ9KYIj04ackpf2tMZ7gBc=;
        b=MYgweE7xaJiMrldoUquE7MUmZvN7k1x6a/fq3BWiAgBQFPX0RfXEsaPiuL8k53TidJ
         3FyIft4xcTxMJQIaErSX/O4pXHmPG40pT1BaQkP/roFbx5S8v6l8RWj3Wzg7T2ynL9wJ
         8h8rYRtSEtJkxAgklnVBuVLTFGbRAhOnA1fUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700162094; x=1700766894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ooyanxwFqzoCUAfMi/r6dZ9KYIj04ackpf2tMZ7gBc=;
        b=M3yXYqzZUZ/+KxTMK5UXdYuzn8xz+sB2zGRck+iVAs9rmeMvv9bw3bBVBUygUKgLwA
         QPLYJYFUkzlMA4QmO6/cGZ4dZyeKPnC9dLnbhbifrT8+46l3DnBwmOKz79/WF9V1lSLs
         eu5udxN5+lCPcdxcR26FBDYorTwJau46pICMyQAjfJPzCuvwTP0LWAkaEFQuBXbZnB3i
         MlnNCQ0SaAfXXbyFUFPApJaCeVztS3IrOcfzPsC4as7SCR5sFJLciQI+OxSTTMUUbLJJ
         FraVfiwNCH2SIlpBZtKUCCyNzWUOxfXdlurGuqsg7uaIhEDhTEsEAJVtD3lURiVqbHga
         V9rw==
X-Gm-Message-State: AOJu0YwTnJs6cwpuQmf5tS1OPI3sPMy2jhLzqFn4aLOoUYGxpTDmQ+mf
	x8jQJ1rXy7VzSlK1qB3D9JqiqA==
X-Google-Smtp-Source: AGHT+IGAfGV4WxWqLDLspM0jS3yZw4d0yxTKsLfUOrh9ed6ze+tRrwpeFv52y0u49JMYBM9w8QyPUA==
X-Received: by 2002:a17:90b:3805:b0:27c:f845:3e3f with SMTP id mq5-20020a17090b380500b0027cf8453e3fmr18633338pjb.1.1700162094148;
        Thu, 16 Nov 2023 11:14:54 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x23-20020a17090a789700b0027ce48022cbsm1864300pjk.14.2023.11.16.11.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 11:14:53 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	Will McVicker <willmcvicker@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Chen <peter.chen@nxp.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Zhang Qilong <zhangqilong3@huawei.com>,
	Linyu Yuan <quic_linyyuan@quicinc.com>,
	John Keeping <john@keeping.me.uk>,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] usb: gadget: f_midi: Replace strlcpy() with strscpy()
Date: Thu, 16 Nov 2023 11:14:52 -0800
Message-Id: <20231116191452.work.902-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909; i=keescook@chromium.org;
 h=from:subject:message-id; bh=qZ5H5ERgauLMlg2cEGUYlQoQmkO6+yXxhj2mdEiuCF0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlVmospmeMBspQEgM+FphUPl4B+bJ0qhQQHcykG
 D0lENa7gk+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZVZqLAAKCRCJcvTf3G3A
 Jj1MEACh6czqKJMgVJfwjpK8ekF4SaN8AfvkxnsbBSk+s9wKz0ZGrYqtXRRaGmDhBslxgwJ3lBJ
 l1GwT571IrkrIhNERZ2uKVsB0yT4sitzGfcf+41ABRrgN2twySqSxLz32ZGBF99FxQ1ulQw1u6j
 AREUq8v8jvXBdJzPHw8ULVWiZxhE3KPzPGcZUHUEK/bcUgi0LDlo5zXqkK0DonkjEfb/rgwjqcv
 GUc3ws9YqCT9/Nj4QN1ylP1knTd8RsQuL120nfhhDoMHOvVOyp1YeliC/2qt5xKX0HXrPlzgGPC
 NIv5G5sOV7Z9ycWhbT2hO6ZEd1nLI0vcdmKiiMQfnw6BoGstrC5olvFxR4ZJF0QXMTyDlXBeD8B
 jgZyCDP4L1MOQHm9dAVrUZhe9c+C4O+TxsEkNja+4Tfe4KDWGoxOHXZ4rg9zrS/qFNfHj0GS4bU
 m9vOdsJbaEr866nVCCN9qHxgZftc5vmVow8mukAO1dwL+A7cIaPerpyB7BQclc2qkoEIonXTDWm
 ZDCyngIMTYc415tE5vN05Ws8+stoAJ55oJwXGrqiQuU2jbKvf6EZGYkkPiRbG29uGYtPxKWQGDH
 YOK7UDQnOF9xcDHSdOxpSmx3cOYbSUuqxIkA94ljgDBZUEiv9c6ms9Sgv4X4O2WXki5lIKvA2cl
 pMTbiTs /prBprlQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

strlcpy() reads the entire source buffer first. This read may exceed
the destination size limit. This is both inefficient and can lead
to linear read overflows if a source string is not NUL-terminated[1].
Additionally, it returns the size of the source string, not the
resulting size of the destination string. In an effort to remove strlcpy()
completely[2], replace strlcpy() here with strscpy().

In the unlikely (impossible?) case where opts->id was larger than
PAGE_SIZE, this will now correctly report truncation errors.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy [1]
Link: https://github.com/KSPP/linux/issues/89 [2]
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Will McVicker <willmcvicker@google.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Peter Chen <peter.chen@nxp.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: Zhang Qilong <zhangqilong3@huawei.com>
Cc: Linyu Yuan <quic_linyyuan@quicinc.com>
Cc: John Keeping <john@keeping.me.uk>
Cc: Azeem Shaikh <azeemshaikh38@gmail.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/usb/gadget/function/f_midi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 5335845d697b..20c6fbd94f32 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -1177,11 +1177,11 @@ F_MIDI_OPT(out_ports, true, MAX_PORTS);
 static ssize_t f_midi_opts_id_show(struct config_item *item, char *page)
 {
 	struct f_midi_opts *opts = to_f_midi_opts(item);
-	int result;
+	ssize_t result;
 
 	mutex_lock(&opts->lock);
 	if (opts->id) {
-		result = strlcpy(page, opts->id, PAGE_SIZE);
+		result = strscpy(page, opts->id, PAGE_SIZE);
 	} else {
 		page[0] = 0;
 		result = 0;
-- 
2.34.1


