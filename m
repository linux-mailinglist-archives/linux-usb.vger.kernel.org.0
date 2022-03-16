Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCAA4DB60B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 17:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357496AbiCPQVU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 12:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245166AbiCPQVS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 12:21:18 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E42325C71
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:20:02 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d18so2207301plr.6
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NavN5PfG0SoH7IP8V9kbX5XfpZ3HZw9He6gkjWERkCU=;
        b=aRtq8m6AplfkGdQM8vHchSXJey9gLA1J0kI7EntQwE9Bb0FR1WAX74A9Uxz1PIf2Zc
         uBiS05P2FGFeYZOfdploJDsS4XgPAAwkRsmVtBmGzkDkHLsFqxx927TVzs9vF1atAtsy
         q2UP94kXKt6RXpocnEhjQPM2apmfRsDKPPBRlNiRrBRlZIIprCAQQuRc1ASiSvPWajGp
         plNFZlroXgiGrFelvjZE45x40m5ENxuRs9U+gt/pkiqafevV7Z8e6YvReBPtXOduPsvz
         GU1MVBZx/GGHrGw4KFxzqFObscD2LwgfDMaXrTAvf6aBLCq9I5BJcbfAjQGcfaIuPWfd
         n3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=NavN5PfG0SoH7IP8V9kbX5XfpZ3HZw9He6gkjWERkCU=;
        b=UaN1NJ1evGLZPWJKap00unt5itSu7gkUslM8+LoUFFSkIY8VQJL3JoxIxlfIKU5eV5
         RySojwwNf8oHPZKoCIh38p+YcS3fc/AjJM3Y05BeuJvyjDEeJZ7Di0xmtImXcFKeGhzO
         Vb/qNaEvVQosutmNee6M0G/6oKJdbAVL/RvbteDvClXX7WWVzgitTnTlkrkUlJCDB4+a
         CJRyunmuT44uvwpDXpAml0YdGG3Vv40QxhtU0RkP1P4GZ8VSn/DLTnmEuQtM3MHAm7t5
         p4SNygnAoOG5coTk/KTfe1VAX/ueZNts7QZQWrI9071qH1xpKG9sWaw9Q8pviO2UVJzP
         VHIQ==
X-Gm-Message-State: AOAM533LcOoohux6Wgq98xI+4aslLfYLmrezuE9JUAGWnNEYE/IxoSt2
        Ai5ElhCJzVR7txRYavmCYwI=
X-Google-Smtp-Source: ABdhPJyrZZcXt4g/e8ADdwQu64NTcx4pQjMASNJEOEfddB6A/mhFdbe/GCAIxz7Ccpm96jqDghYc4g==
X-Received: by 2002:a17:90a:4214:b0:1bf:6ae9:f62a with SMTP id o20-20020a17090a421400b001bf6ae9f62amr10966061pjg.64.1647447601567;
        Wed, 16 Mar 2022 09:20:01 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id mt15-20020a17090b230f00b001bf191e6f08sm2988374pjb.9.2022.03.16.09.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 09:20:01 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v3 7/9] sound: usb: remove third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 01:19:33 +0900
Message-Id: <20220316161935.2049-8-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316161935.2049-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220316161935.2049-1-mailhol.vincent@wanadoo.fr>
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

