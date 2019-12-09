Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCCA116B20
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 11:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfLIKek (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Dec 2019 05:34:40 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37666 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727421AbfLIKej (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 05:34:39 -0500
Received: by mail-lf1-f68.google.com with SMTP id b15so10279248lfc.4
        for <linux-usb@vger.kernel.org>; Mon, 09 Dec 2019 02:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=64DqL3IzZjciHWWJLUTKeX5nAWdg61GDZhAuYNVZBxE=;
        b=fuRB4N00AOC2wnGfYA8ZaE+p3L4uglqU+9qEosyU3UoYWjG96QQSfjWspVo5HfH7tl
         G3+2KoQ1RS0P632vlbP8gdxLL7t3ypFeaqF0Lr8S03/XPkcwG74SQGnJF6zgfDmxQ+1B
         y6EI6yW8KhH36xcebyHpwPv41kZ4kHf/ujteO6oFT9X7dqQfuoSVRkGFF/YQ7zFgZAGb
         CXMun9LpnIPr8DQVFSFVPOFYRS17cQx+18TgkIVMYvAMfYob2nYRarWh5W5Ys7E5WAAi
         d9qEyjcn7Eko6+dEWGMPllm2hVgk4uonmM+Dh2UX7qz+ozHQXTWn480Q5Y5pBp0e1qSE
         4XQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=64DqL3IzZjciHWWJLUTKeX5nAWdg61GDZhAuYNVZBxE=;
        b=JHCHW8Kd5uRH5dTaMzy9gpNLgX4hwLY4PHoYQhp+Yv3zumPdUlrS6PJdLh2tCbicDe
         AMpl592LAY9gsNYG6NxKQhzVF5iKXcBIBRoBK9AOuQH90Usz5IHEn60CaBnP+Qpsbhwb
         zAfS2p6kHsPKEw/EJAwKJpghl5gEnI/OWw1+kWhUWHgOOGrgEjMEzHztuKz/ng07OvKe
         yiGfp4O9w6dvkuSlX6QCPLcYEhoBDqtXT2SLfEo4ZZy1E9XK/kYew9FNsD5HTcpnZw0N
         jFrJqEXow/o9cayDzEGt8C1rSXM9/XHsmh9ukUg0o2PIlCpaGI1aTolO0CooJbbqkZSv
         DQ6A==
X-Gm-Message-State: APjAAAVwuVSxijDlDvIYb8v1EnvyD+wzcz+0HdcdKyo1aC+4KTmgoyNm
        gJTpKY6pkjQ184f5p+iUMbV7RjWW
X-Google-Smtp-Source: APXvYqwbmEOV4AJZPHFhJ2jiOCulHhkqHTmsdlP7FMayUMfBGVRlEjvDDoKvkd73K4N3sa9UgrF12w==
X-Received: by 2002:ac2:5337:: with SMTP id f23mr1864639lfh.192.1575887677598;
        Mon, 09 Dec 2019 02:34:37 -0800 (PST)
Received: from google.com ([2620:0:1043:12:60fa:1524:8dd0:6d])
        by smtp.gmail.com with ESMTPSA id s16sm5221396lfc.35.2019.12.09.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 02:34:36 -0800 (PST)
Date:   Mon, 9 Dec 2019 11:34:35 +0100
From:   Lionel Koenig <lionel.koenig@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>, Takashi Iwai <tiwai@suse.de>,
        Jonas Stenvall <jonas.stenvall.umea@gmail.com>
Subject: [PATCH] USB: gadget: u_audio: Initialize capture memory
Message-ID: <20191209103435.GA55498@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Using USB audio gadget in capture mode with an non blocking API may
result in getting uninitialized memory samples. That ensure that the
memory is initialized to 0 when the stream is prepared.

Signed-off-by: Lionel Koenig <lionel.koenig@gmail.com>
---
 drivers/usb/gadget/function/u_audio.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 7ec6a996af26..6d708494ca77 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -317,6 +317,14 @@ static int uac_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static int uac_pcm_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	memset(runtime->dma_area,  0, runtime->dma_bytes);
+	return 0;
+}
+
 /* ALSA cries without these function pointers */
 static int uac_pcm_null(struct snd_pcm_substream *substream)
 {
@@ -331,7 +339,7 @@ static const struct snd_pcm_ops uac_pcm_ops = {
 	.hw_free = uac_pcm_hw_free,
 	.trigger = uac_pcm_trigger,
 	.pointer = uac_pcm_pointer,
-	.prepare = uac_pcm_null,
+	.prepare = uac_pcm_prepare,
 };
 
 static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
-- 
2.24.0.393.g34dc348eaf-goog

