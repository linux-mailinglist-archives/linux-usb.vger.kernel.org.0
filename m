Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBE594DBE08
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 06:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiCQFRh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Mar 2022 01:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiCQFRe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Mar 2022 01:17:34 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D10232104
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:02:20 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id u30-20020a4a6c5e000000b00320d8dc2438so5181456oof.12
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NavN5PfG0SoH7IP8V9kbX5XfpZ3HZw9He6gkjWERkCU=;
        b=qtWmzkS+MbsvdEN49AkaqqVHCU4OivQT2IM/YQx19Ui8pQvjGwCl2gerX4eY8jN4Xz
         eta+HJDU6usM+zn0aVi4c2Cxve4bDz8VMyi0mIga7ub4Nxis8Hg9QpGe8tRrjFRiovUZ
         RpCaOQIjY/aGfRWOfAA5eXgsrfKH/XL/aNwBysT5xwnhnX/lJj7WrCL7mDkpWJgRMOXx
         jkkaPVv5POeb86VP/cVFUVR7ORwx6cYvV8sRJ0fdmX2FsRB443GrjnTxDA45+QGy/9Ca
         G+zj5iVjEkcE9EsZqjnh0KmrI7ErnXS/BR40aBNMwUHPZ8FpB8vRkF55uBZ6kc78+gx4
         I3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=NavN5PfG0SoH7IP8V9kbX5XfpZ3HZw9He6gkjWERkCU=;
        b=UINDzjIDA85fGHOp1ey+dq5DUp+iu5GKkY5Z7jgoO3AkImPK7lkNmOnBUIYsLOs4LG
         0A6eCRAtX6gpJfNEDesvXHdXRO3JFyd5zrbymYk2msSfNV8ihBWSzFmLA+gOaLz50zfJ
         iL+2+H38Qrt8qxZZurB9zqEKWeEHt0kwk4aj4p1IVo57KU2V+AqnRTPQnpBC2YH29FfA
         /i+gzytmXpGhaiCCYqMBNEyhOGZ4naYKNr0LjgxLp/TpCGjK3iMz4IWNI/zA7RQlXdGz
         wSXfY2H1XDc3qAIhc0XUNuEv6+wFmeHKG3SriM3ffBh03wyyjp4+M0wVnB0mFwQUyVB6
         cP7w==
X-Gm-Message-State: AOAM533lbN5VwjHpQA8z+et061XmOOBR0Qt4nZV0AdunSzRB6O01SIVT
        wJrOD3OH2V8vmfPf6cScspZsa4YKlwg+MA==
X-Google-Smtp-Source: ABdhPJzyMuFf8xSvVZDsDQH2hBQGuE9Lvas0y9oGjv0VKJIy7ivAW9dg/qpKooxSURcRzQvhfOxTfg==
X-Received: by 2002:a17:90a:9ab:b0:1c6:34bd:3d96 with SMTP id 40-20020a17090a09ab00b001c634bd3d96mr3054092pjo.25.1647489347274;
        Wed, 16 Mar 2022 20:55:47 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id e6-20020a056a001a8600b004f78e446ff5sm5096734pfv.15.2022.03.16.20.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 20:55:46 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v4 7/9] sound: usb: remove third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 12:55:12 +0900
Message-Id: <20220317035514.6378-8-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317035514.6378-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220317035514.6378-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The third argument of usb_maxpacket(): in_out has been deprecated
because it could be derived from the second argument (e.g. using
usb_pipeout(pipe)).

N.B. function usb_maxpacket() was made variadic to accommodate the
transition from the old prototype with three arguments to the new one
with only two arguments (so that no renaming is needed). The variadic
argument is to be removed once all users of usb_maxpacket() get
migrated.

CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: Clemens Ladisch <clemens@ladisch.de>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 sound/usb/line6/pcm.c           | 4 ++--
 sound/usb/midi.c                | 4 ++--
 sound/usb/usx2y/usb_stream.c    | 6 +++---
 sound/usb/usx2y/usbusx2yaudio.c | 2 +-
 sound/usb/usx2y/usx2yhwdeppcm.c | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
index fdbdfb7bce92..6a4af725aedd 100644
--- a/sound/usb/line6/pcm.c
+++ b/sound/usb/line6/pcm.c
@@ -552,10 +552,10 @@ int line6_init_pcm(struct usb_line6 *line6,
 
 	line6pcm->max_packet_size_in =
 		usb_maxpacket(line6->usbdev,
-			usb_rcvisocpipe(line6->usbdev, ep_read), 0);
+			usb_rcvisocpipe(line6->usbdev, ep_read));
 	line6pcm->max_packet_size_out =
 		usb_maxpacket(line6->usbdev,
-			usb_sndisocpipe(line6->usbdev, ep_write), 1);
+			usb_sndisocpipe(line6->usbdev, ep_write));
 	if (!line6pcm->max_packet_size_in || !line6pcm->max_packet_size_out) {
 		dev_err(line6pcm->line6->ifcdev,
 			"cannot get proper max packet size\n");
diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 2c01649c70f6..fba498f9e7dc 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1285,7 +1285,7 @@ static int snd_usbmidi_in_endpoint_create(struct snd_usb_midi *umidi,
 		pipe = usb_rcvintpipe(umidi->dev, ep_info->in_ep);
 	else
 		pipe = usb_rcvbulkpipe(umidi->dev, ep_info->in_ep);
-	length = usb_maxpacket(umidi->dev, pipe, 0);
+	length = usb_maxpacket(umidi->dev, pipe);
 	for (i = 0; i < INPUT_URBS; ++i) {
 		buffer = usb_alloc_coherent(umidi->dev, length, GFP_KERNEL,
 					    &ep->urbs[i]->transfer_dma);
@@ -1374,7 +1374,7 @@ static int snd_usbmidi_out_endpoint_create(struct snd_usb_midi *umidi,
 		pipe = usb_sndbulkpipe(umidi->dev, ep_info->out_ep);
 	switch (umidi->usb_id) {
 	default:
-		ep->max_transfer = usb_maxpacket(umidi->dev, pipe, 1);
+		ep->max_transfer = usb_maxpacket(umidi->dev, pipe);
 		break;
 		/*
 		 * Various chips declare a packet size larger than 4 bytes, but
diff --git a/sound/usb/usx2y/usb_stream.c b/sound/usb/usx2y/usb_stream.c
index 9d0e44793896..a4d32e8a1d36 100644
--- a/sound/usb/usx2y/usb_stream.c
+++ b/sound/usb/usx2y/usb_stream.c
@@ -51,7 +51,7 @@ static int init_pipe_urbs(struct usb_stream_kernel *sk,
 {
 	int u, p;
 	int maxpacket = use_packsize ?
-		use_packsize : usb_maxpacket(dev, pipe, usb_pipeout(pipe));
+		use_packsize : usb_maxpacket(dev, pipe);
 	int transfer_length = maxpacket * sk->n_o_ps;
 
 	for (u = 0; u < USB_STREAM_NURBS;
@@ -171,7 +171,7 @@ struct usb_stream *usb_stream_new(struct usb_stream_kernel *sk,
 	out_pipe = usb_sndisocpipe(dev, out_endpoint);
 
 	max_packsize = use_packsize ?
-		use_packsize : usb_maxpacket(dev, in_pipe, 0);
+		use_packsize : usb_maxpacket(dev, in_pipe);
 
 	/*
 		t_period = period_frames / sample_rate
@@ -187,7 +187,7 @@ struct usb_stream *usb_stream_new(struct usb_stream_kernel *sk,
 	read_size += packets * USB_STREAM_URBDEPTH *
 		(max_packsize + sizeof(struct usb_stream_packet));
 
-	max_packsize = usb_maxpacket(dev, out_pipe, 1);
+	max_packsize = usb_maxpacket(dev, out_pipe);
 	write_size = max_packsize * packets * USB_STREAM_URBDEPTH;
 
 	if (read_size >= 256*PAGE_SIZE || write_size >= 256*PAGE_SIZE) {
diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index cfc1ea53978d..9cd5e3aae4f7 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -421,7 +421,7 @@ static int usx2y_urbs_allocate(struct snd_usx2y_substream *subs)
 
 	pipe = is_playback ? usb_sndisocpipe(dev, subs->endpoint) :
 			usb_rcvisocpipe(dev, subs->endpoint);
-	subs->maxpacksize = usb_maxpacket(dev, pipe, is_playback);
+	subs->maxpacksize = usb_maxpacket(dev, pipe);
 	if (!subs->maxpacksize)
 		return -EINVAL;
 
diff --git a/sound/usb/usx2y/usx2yhwdeppcm.c b/sound/usb/usx2y/usx2yhwdeppcm.c
index db83522c1b49..240349b644f3 100644
--- a/sound/usb/usx2y/usx2yhwdeppcm.c
+++ b/sound/usb/usx2y/usx2yhwdeppcm.c
@@ -321,7 +321,7 @@ static int usx2y_usbpcm_urbs_allocate(struct snd_usx2y_substream *subs)
 
 	pipe = is_playback ? usb_sndisocpipe(dev, subs->endpoint) :
 			usb_rcvisocpipe(dev, subs->endpoint);
-	subs->maxpacksize = usb_maxpacket(dev, pipe, is_playback);
+	subs->maxpacksize = usb_maxpacket(dev, pipe);
 	if (!subs->maxpacksize)
 		return -EINVAL;
 
-- 
2.34.1

