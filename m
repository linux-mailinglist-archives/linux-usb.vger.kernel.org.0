Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6C9964E905
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 11:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiLPKCz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 05:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbiLPKCx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 05:02:53 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204C14875F
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 02:02:51 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bp15so2662985lfb.13
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 02:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5sAxrJWcs3zIEeBiXZKc9Ib8aUSZa5pC5TT0RxtYE5s=;
        b=qoHJS/q8oWu14hlgLqcdYBXr2uEq1y4yg44EDaGDDiggna844cAXCXsJb5HJ7nHFcn
         PXqvmxe6aUGjLDDYiP1eoROM9BiU8RGTEQseCdmO+SH6+Bg2+1qjNiG2RP07ZmmJ6HOV
         0yw8beDxDMgK1pIwXE3Z7JPt83jbeb7OgWRNcyzBl+T0Uv8uiPDDPjTuG6BdfLzXI9nm
         7s2jjjVhp4GDI0EIksCDBxxyR7g6x9T8l0Ebn10G57O83qUi+H0fbuAHF1YU/Pys8zY7
         6XkFIgGpuyabLrImHofG0Fa88qZg5djHn2Y2iDURARpYaFBgHcZxBlQS4oKdQXjXWROU
         RxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sAxrJWcs3zIEeBiXZKc9Ib8aUSZa5pC5TT0RxtYE5s=;
        b=1m2z55tmfOn+9rROVutJ4foJChp4TYfJH6XFNhOMtpx+S1Ym09KaUTAGcojQuDcTcL
         bEHwn9uwaFla1sPz+Rkk6w4XOUJF+Xwxh0ZZLEmh5ffQV/twbW5NIGwUJzECGTe5f8H/
         xX8+GMZFh/cl15NvxL2EyB9brJDjhLG4ZWPwA3M4d55lQ1whr00rI23F/d1px+jZ3fjC
         L6vAB3CxNqgVXmgud2okZ6Vx4Bzzl+BL4eu+OjJimZItzHclHjDbf7hNza6xRITMWs/C
         57hrxed0mR7EAbWF+iNT+9wP1ZtqNK6/HMi70zQq9V76VL42FS06+EBXS1LNxugkSMfL
         K1Rw==
X-Gm-Message-State: AFqh2kom2SCND1p3sncDL4JiGlY8MQfOiD8EJIkyoIfID/sJufJyP3xb
        fvW2Xdal+tser2ch19nKS5g5u8ftCCM=
X-Google-Smtp-Source: AMrXdXtWDTypYqJiD00KY5ZBgHiuLFDCor+o5QZHp+AuT4Git7TpS966J+QGbe3AVFakzffpXhCDAQ==
X-Received: by 2002:ac2:5a1c:0:b0:4c0:2c1e:1d5b with SMTP id q28-20020ac25a1c000000b004c02c1e1d5bmr386365lfn.63.1671184969322;
        Fri, 16 Dec 2022 02:02:49 -0800 (PST)
Received: from localhost.localdomain (dl5zkyyyhqvp---tn498y-3.rev.dnainternet.fi. [2001:14ba:4e68:8000:66c:59ff:fe0b:c778])
        by smtp.gmail.com with ESMTPSA id d16-20020a056512369000b004b4bab7d5a9sm177684lfs.46.2022.12.16.02.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 02:02:48 -0800 (PST)
From:   Artem Egorkine <arteme@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Artem Egorkine <arteme@gmail.com>
Subject: [PATCH 1/2] sound: line6: correct midi status byte when receiving data from podxt
Date:   Fri, 16 Dec 2022 12:02:38 +0200
Message-Id: <20221216100239.577805-1-arteme@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A PODxt device sends 0xb2, 0xc2 or 0xf2 as a status byte for MIDI
messages over USB that should otherwise have a 0xb0, 0xc0 or 0xf0
status byte. This is usually corrected by the driver on other OSes.

This fixes MIDI sysex messages sent by PODxt.

Signed-off-by: Artem Egorkine <arteme@gmail.com>
---
 sound/usb/line6/driver.c  |  2 +-
 sound/usb/line6/midi.c    |  2 +-
 sound/usb/line6/midibuf.c | 42 +++++++++++++++++++++++++++++++--------
 sound/usb/line6/midibuf.h |  2 +-
 sound/usb/line6/pod.c     |  3 ++-
 5 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index 59faa5a9a714..4dbe7bce3ee8 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -304,7 +304,7 @@ static void line6_data_received(struct urb *urb)
 		for (;;) {
 			done =
 				line6_midibuf_read(mb, line6->buffer_message,
-						LINE6_MIDI_MESSAGE_MAXLEN);
+						LINE6_MIDI_MESSAGE_MAXLEN, 1);
 
 			if (done <= 0)
 				break;
diff --git a/sound/usb/line6/midi.c b/sound/usb/line6/midi.c
index ba0e2b7e8fe1..335f8d531548 100644
--- a/sound/usb/line6/midi.c
+++ b/sound/usb/line6/midi.c
@@ -56,7 +56,7 @@ static void line6_midi_transmit(struct snd_rawmidi_substream *substream)
 
 	for (;;) {
 		done = line6_midibuf_read(mb, chunk,
-					  LINE6_FALLBACK_MAXPACKETSIZE);
+					  LINE6_FALLBACK_MAXPACKETSIZE, 0);
 
 		if (done == 0)
 			break;
diff --git a/sound/usb/line6/midibuf.c b/sound/usb/line6/midibuf.c
index 6a70463f82c4..ba7a2243cf68 100644
--- a/sound/usb/line6/midibuf.c
+++ b/sound/usb/line6/midibuf.c
@@ -9,6 +9,22 @@
 
 #include "midibuf.h"
 
+/* #define DUMP_BUFFERS */
+
+#ifdef DUMP_BUFFERS
+static void dump_buffer(char rx, const u8 *data, int length)
+{
+	const char* type = rx ? "rx" : "tx";
+        printk(KERN_DEBUG "%s packet: [", type);
+        for (; length > 0; ++data, --length)
+                printk(KERN_CONT " %02x", *data);
+        printk(KERN_CONT " ]\n");
+}
+#else
+#define dump_buffer(rx, data, length) /* nothing */
+#endif
+
+
 static int midibuf_message_length(unsigned char code)
 {
 	int message_length;
@@ -20,12 +36,7 @@ static int midibuf_message_length(unsigned char code)
 
 		message_length = length[(code >> 4) - 8];
 	} else {
-		/*
-		   Note that according to the MIDI specification 0xf2 is
-		   the "Song Position Pointer", but this is used by Line 6
-		   to send sysex messages to the host.
-		 */
-		static const int length[] = { -1, 2, -1, 2, -1, -1, 1, 1, 1, 1,
+		static const int length[] = { -1, 2, 2, 2, -1, -1, 1, 1, 1, -1,
 			1, 1, 1, -1, 1, 1
 		};
 		message_length = length[code & 0x0f];
@@ -125,7 +136,7 @@ int line6_midibuf_write(struct midi_buffer *this, unsigned char *data,
 }
 
 int line6_midibuf_read(struct midi_buffer *this, unsigned char *data,
-		       int length)
+		       int length, char rx)
 {
 	int bytes_used;
 	int length1, length2;
@@ -148,9 +159,22 @@ int line6_midibuf_read(struct midi_buffer *this, unsigned char *data,
 
 	length1 = this->size - this->pos_read;
 
-	/* check MIDI command length */
 	command = this->buf[this->pos_read];
+	/*
+	   PODxt always has status byte lower nibble set to 0010,
+	   when it means to send 0000, so we correct if here so
+	   that control/program changes come on channel 1 and
+	   sysex message status byte is correct
+	 */
+	if (rx) {
+		if (command == 0xb2 || command == 0xc2 || command == 0xf2) {
+			unsigned char fixed = command & 0xf0;
+			this->buf[this->pos_read] = fixed;
+			command = fixed;
+		}
+	}
 
+	/* check MIDI command length */
 	if (command & 0x80) {
 		midi_length = midibuf_message_length(command);
 		this->command_prev = command;
@@ -222,6 +246,8 @@ int line6_midibuf_read(struct midi_buffer *this, unsigned char *data,
 		this->pos_read = length2;
 	}
 
+	dump_buffer(rx, data, length + repeat);
+
 	if (repeat)
 		data[0] = this->command_prev;
 
diff --git a/sound/usb/line6/midibuf.h b/sound/usb/line6/midibuf.h
index 124a8f9f7e96..8342e45046b0 100644
--- a/sound/usb/line6/midibuf.h
+++ b/sound/usb/line6/midibuf.h
@@ -23,7 +23,7 @@ extern void line6_midibuf_destroy(struct midi_buffer *mb);
 extern int line6_midibuf_ignore(struct midi_buffer *mb, int length);
 extern int line6_midibuf_init(struct midi_buffer *mb, int size, int split);
 extern int line6_midibuf_read(struct midi_buffer *mb, unsigned char *data,
-			      int length);
+			      int length, char rx);
 extern void line6_midibuf_reset(struct midi_buffer *mb);
 extern int line6_midibuf_write(struct midi_buffer *mb, unsigned char *data,
 			       int length);
diff --git a/sound/usb/line6/pod.c b/sound/usb/line6/pod.c
index cd41aa7f0385..d173971e5f02 100644
--- a/sound/usb/line6/pod.c
+++ b/sound/usb/line6/pod.c
@@ -159,8 +159,9 @@ static struct line6_pcm_properties pod_pcm_properties = {
 	.bytes_per_channel = 3 /* SNDRV_PCM_FMTBIT_S24_3LE */
 };
 
+
 static const char pod_version_header[] = {
-	0xf2, 0x7e, 0x7f, 0x06, 0x02
+	0xf0, 0x7e, 0x7f, 0x06, 0x02
 };
 
 static char *pod_alloc_sysex_buffer(struct usb_line6_pod *pod, int code,
-- 
2.38.1

