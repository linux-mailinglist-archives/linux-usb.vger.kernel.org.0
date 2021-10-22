Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487194378AA
	for <lists+linux-usb@lfdr.de>; Fri, 22 Oct 2021 16:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233046AbhJVOGE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Oct 2021 10:06:04 -0400
Received: from cable.insite.cz ([84.242.75.189]:49197 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232327AbhJVOGE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 Oct 2021 10:06:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 4014EA1A3D401;
        Fri, 22 Oct 2021 16:03:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1634911425; bh=xC9k0iD3llnzQmKgOoWoExk+O1DBpNbx4KrLumWlgLM=;
        h=From:To:Cc:Subject:Date:From;
        b=b/utRTkaLPN4lGPBkZRhdgeDzcZb9FgtQhCoucHHMzlQqDVati0vPAQURnCKFvIHk
         pfzvL1far3om6hOqLH4ObZvKmXxbkMFucIjginQ6vlkBX3lOnS7OeqXJvMiPam1u+9
         AwYp56qYPLWiY/FWaqFsyudhYWGcVpGoIgNjK9rQ=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pN1xfmaTdTfq; Fri, 22 Oct 2021 16:03:40 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id C081CA1A3D400;
        Fri, 22 Oct 2021 16:03:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1634911420; bh=xC9k0iD3llnzQmKgOoWoExk+O1DBpNbx4KrLumWlgLM=;
        h=From:To:Cc:Subject:Date:From;
        b=Ie8aP8g+C4Co15LbjaXtDMFXblfqkHkwooDTRpHDB7g0ufl+S5aM4qNYOlJXmfjXo
         /c5Pm7xKIz58yyGnVwpsuyGu0te/UetFwcc9yMmp+AHajl/IMM9m0Vt+MU+tJvKUDC
         ahwwOSti3OySvsv5tviqnSkXemJzjsytgc6cWECI=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb:gadget: f_uac1: fixed sync playback
Date:   Fri, 22 Oct 2021 16:03:39 +0200
Message-Id: <20211022140339.248669-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The u_audio param fb_max was not set to its default value in f_uac1.c.
As a result the maximum value of Playback Pitch ctl was kept at 1000000,
not allowing to set faster playback pitch for UAC1.

The setting required moving the default constant UAC2_DEF_FB_MAX from
u_uac2.h to FBACK_FAST_MAX in u_audio.h as that header is common for
f_uac1.c and f_uac2.c.

Fixes: 6fec018 ("usb: gadget: u_audio.c: Adding Playback Pitch ctl for
                 sync playback")
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---

Notes:
    * for usb-next

 drivers/usb/gadget/function/f_uac1.c  |  1 +
 drivers/usb/gadget/function/f_uac2.c  |  3 ++-
 drivers/usb/gadget/function/u_audio.h | 10 ++++++++--
 drivers/usb/gadget/function/u_uac2.h  |  1 -
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 5b3502df4e13..03f50643fbba 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1321,6 +1321,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 		audio->params.c_fu.volume_res = audio_opts->c_volume_res;
 	}
 	audio->params.req_number = audio_opts->req_number;
+	audio->params.fb_max = FBACK_FAST_MAX;
 	if (FUOUT_EN(audio_opts) || FUIN_EN(audio_opts))
 		audio->notify = audio_notify;
 
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index a5eedd88eee6..74d8b30ca176 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 
 #include "u_audio.h"
+
 #include "u_uac2.h"
 
 /* UAC2 spec: 4.1 Audio Channel Cluster Descriptor */
@@ -1936,7 +1937,7 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 	opts->c_volume_res = UAC2_DEF_RES_DB;
 
 	opts->req_number = UAC2_DEF_REQ_NUM;
-	opts->fb_max = UAC2_DEF_FB_MAX;
+	opts->fb_max = FBACK_FAST_MAX;
 	return &opts->func_inst;
 }
 
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 001a79a46022..8dfdae1721cd 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -14,11 +14,17 @@
 /*
  * Same maximum frequency deviation on the slower side as in
  * sound/usb/endpoint.c. Value is expressed in per-mil deviation.
- * The maximum deviation on the faster side will be provided as
- * parameter, as it impacts the endpoint required bandwidth.
  */
 #define FBACK_SLOW_MAX	250
 
+/*
+ * Maximum frequency deviation on the faster side, default value for UAC1/2.
+ * Value is expressed in per-mil deviation.
+ * UAC2 provides the value as a parameter as it impacts the endpoint required
+ * bandwidth.
+ */
+#define FBACK_FAST_MAX 5
+
 /* Feature Unit parameters */
 struct uac_fu_params {
 	int id;			/* Feature Unit ID */
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index a73b35774c44..e0c8e3513bfd 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -30,7 +30,6 @@
 #define UAC2_DEF_RES_DB		(1*256)		/* 1 dB */
 
 #define UAC2_DEF_REQ_NUM 2
-#define UAC2_DEF_FB_MAX 5
 #define UAC2_DEF_INT_REQ_NUM	10
 
 struct f_uac2_opts {
-- 
2.25.1

