Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B86A489247
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 08:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241578AbiAJHlr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 02:41:47 -0500
Received: from cable.insite.cz ([84.242.75.189]:35536 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241192AbiAJHhy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jan 2022 02:37:54 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id D4DAAA1A3D402;
        Mon, 10 Jan 2022 08:37:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800270; bh=GPcVcdFkqjEXbwzMoJHQc6JNsONk1lTO11d99kX4NsQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b4AOvgO89J7RqEy/A2RBgZidc9mRTyZtfVRH4IH9xOpcsllQG60st+uCMX638i1HZ
         Vk6dlknknTxF9jEIFriRTPOb2QgnjFt4VpJnSP4jp/oen4NoVK+zmGq0g1RfPqybQf
         qpWiMxAI/1Jy0QhCy5IhRLopVCOhRUJ/SlABjAQY=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VkQJwq1VUdTf; Mon, 10 Jan 2022 08:37:44 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id EA274A1A3D401;
        Mon, 10 Jan 2022 08:37:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800264; bh=GPcVcdFkqjEXbwzMoJHQc6JNsONk1lTO11d99kX4NsQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bm99REXEZP+iijqlaPr9PzkCxqXJEsIkzBgmQDw41EfINbzCXybml0235Htda9Z36
         VXCH4VcMnc1mSnSFXM6Oqf+lEvHnXVuPrOpeYWBY4v2mJD5FIYu2sXgIW+EqOrjsfC
         +01wTfw85Ia4JbQpJMVL2YZ/SWAzmkX8pG33sF80=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 01/10] usb: gadget:audio: Replace deprecated macro S_IRUGO
Date:   Mon, 10 Jan 2022 08:37:33 +0100
Message-Id: <20220110073742.394237-2-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110073742.394237-1-pavel.hofman@ivitera.com>
References: <20220110073742.394237-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use octal digits as suggested by checkpatch instead of the deprecated
macro.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
v3: new patch
---
 drivers/usb/gadget/legacy/audio.c | 36 +++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/gadget/legacy/audio.c b/drivers/usb/gadget/legacy/audio.c
index a748ed0842e8..5ec477ffab7f 100644
--- a/drivers/usb/gadget/legacy/audio.c
+++ b/drivers/usb/gadget/legacy/audio.c
@@ -22,32 +22,32 @@ USB_GADGET_COMPOSITE_OPTIONS();
 
 /* Playback(USB-IN) Default Stereo - Fl/Fr */
 static int p_chmask = UAC2_DEF_PCHMASK;
-module_param(p_chmask, uint, S_IRUGO);
+module_param(p_chmask, uint, 0444);
 MODULE_PARM_DESC(p_chmask, "Playback Channel Mask");
 
 /* Playback Default 48 KHz */
 static int p_srate = UAC2_DEF_PSRATE;
-module_param(p_srate, uint, S_IRUGO);
+module_param(p_srate, uint, 0444);
 MODULE_PARM_DESC(p_srate, "Playback Sampling Rate");
 
 /* Playback Default 16bits/sample */
 static int p_ssize = UAC2_DEF_PSSIZE;
-module_param(p_ssize, uint, S_IRUGO);
+module_param(p_ssize, uint, 0444);
 MODULE_PARM_DESC(p_ssize, "Playback Sample Size(bytes)");
 
 /* Capture(USB-OUT) Default Stereo - Fl/Fr */
 static int c_chmask = UAC2_DEF_CCHMASK;
-module_param(c_chmask, uint, S_IRUGO);
+module_param(c_chmask, uint, 0444);
 MODULE_PARM_DESC(c_chmask, "Capture Channel Mask");
 
 /* Capture Default 64 KHz */
 static int c_srate = UAC2_DEF_CSRATE;
-module_param(c_srate, uint, S_IRUGO);
+module_param(c_srate, uint, 0444);
 MODULE_PARM_DESC(c_srate, "Capture Sampling Rate");
 
 /* Capture Default 16bits/sample */
 static int c_ssize = UAC2_DEF_CSSIZE;
-module_param(c_ssize, uint, S_IRUGO);
+module_param(c_ssize, uint, 0444);
 MODULE_PARM_DESC(c_ssize, "Capture Sample Size(bytes)");
 #else
 #ifndef CONFIG_GADGET_UAC1_LEGACY
@@ -55,58 +55,58 @@ MODULE_PARM_DESC(c_ssize, "Capture Sample Size(bytes)");
 
 /* Playback(USB-IN) Default Stereo - Fl/Fr */
 static int p_chmask = UAC1_DEF_PCHMASK;
-module_param(p_chmask, uint, S_IRUGO);
+module_param(p_chmask, uint, 0444);
 MODULE_PARM_DESC(p_chmask, "Playback Channel Mask");
 
 /* Playback Default 48 KHz */
 static int p_srate = UAC1_DEF_PSRATE;
-module_param(p_srate, uint, S_IRUGO);
+module_param(p_srate, uint, 0444);
 MODULE_PARM_DESC(p_srate, "Playback Sampling Rate");
 
 /* Playback Default 16bits/sample */
 static int p_ssize = UAC1_DEF_PSSIZE;
-module_param(p_ssize, uint, S_IRUGO);
+module_param(p_ssize, uint, 0444);
 MODULE_PARM_DESC(p_ssize, "Playback Sample Size(bytes)");
 
 /* Capture(USB-OUT) Default Stereo - Fl/Fr */
 static int c_chmask = UAC1_DEF_CCHMASK;
-module_param(c_chmask, uint, S_IRUGO);
+module_param(c_chmask, uint, 0444);
 MODULE_PARM_DESC(c_chmask, "Capture Channel Mask");
 
 /* Capture Default 48 KHz */
 static int c_srate = UAC1_DEF_CSRATE;
-module_param(c_srate, uint, S_IRUGO);
+module_param(c_srate, uint, 0444);
 MODULE_PARM_DESC(c_srate, "Capture Sampling Rate");
 
 /* Capture Default 16bits/sample */
 static int c_ssize = UAC1_DEF_CSSIZE;
-module_param(c_ssize, uint, S_IRUGO);
+module_param(c_ssize, uint, 0444);
 MODULE_PARM_DESC(c_ssize, "Capture Sample Size(bytes)");
 #else /* CONFIG_GADGET_UAC1_LEGACY */
 #include "u_uac1_legacy.h"
 
 static char *fn_play = FILE_PCM_PLAYBACK;
-module_param(fn_play, charp, S_IRUGO);
+module_param(fn_play, charp, 0444);
 MODULE_PARM_DESC(fn_play, "Playback PCM device file name");
 
 static char *fn_cap = FILE_PCM_CAPTURE;
-module_param(fn_cap, charp, S_IRUGO);
+module_param(fn_cap, charp, 0444);
 MODULE_PARM_DESC(fn_cap, "Capture PCM device file name");
 
 static char *fn_cntl = FILE_CONTROL;
-module_param(fn_cntl, charp, S_IRUGO);
+module_param(fn_cntl, charp, 0444);
 MODULE_PARM_DESC(fn_cntl, "Control device file name");
 
 static int req_buf_size = UAC1_OUT_EP_MAX_PACKET_SIZE;
-module_param(req_buf_size, int, S_IRUGO);
+module_param(req_buf_size, int, 0444);
 MODULE_PARM_DESC(req_buf_size, "ISO OUT endpoint request buffer size");
 
 static int req_count = UAC1_REQ_COUNT;
-module_param(req_count, int, S_IRUGO);
+module_param(req_count, int, 0444);
 MODULE_PARM_DESC(req_count, "ISO OUT endpoint request count");
 
 static int audio_buf_size = UAC1_AUDIO_BUF_SIZE;
-module_param(audio_buf_size, int, S_IRUGO);
+module_param(audio_buf_size, int, 0444);
 MODULE_PARM_DESC(audio_buf_size, "Audio buffer size");
 #endif /* CONFIG_GADGET_UAC1_LEGACY */
 #endif
-- 
2.25.1

