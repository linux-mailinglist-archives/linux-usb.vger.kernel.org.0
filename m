Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA8347FAA5
	for <lists+linux-usb@lfdr.de>; Mon, 27 Dec 2021 07:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhL0GvJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Dec 2021 01:51:09 -0500
Received: from cable.insite.cz ([84.242.75.189]:50941 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229490AbhL0GvJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Dec 2021 01:51:09 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 07F86A1A3D403;
        Mon, 27 Dec 2021 07:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640587867; bh=4OReWYNWtGWkkIdlPU08sx5H+R+qLS85r9ZPvLOz62Y=;
        h=From:To:Cc:Subject:Date:From;
        b=sgNRSJAm44f2zHbGxd0cEo0WOcMFDY/Ex6f/SksPiZnVYgcb7V15735LFBSIWRcSf
         2pb0xyiTguH0P5JydQLiDhqmNismCJo+6gw1QcjjEfprOLfXAWuO4vbh1KJR+tlkVa
         xS+qUvvIoOeEMnH+fGyjPkBi7YvCViuOYGvBnO2Q=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XTMwIyuNlW0a; Mon, 27 Dec 2021 07:51:02 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id AFA48A1A3D402;
        Mon, 27 Dec 2021 07:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640587861; bh=4OReWYNWtGWkkIdlPU08sx5H+R+qLS85r9ZPvLOz62Y=;
        h=From:To:Cc:Subject:Date:From;
        b=PW1rtqZ785pz44KDVzycPw5+aCcjBfXizCKynjxGpICJRIjEvdPdaZ+z06BH8SGBZ
         ukUOQY+M7oEFvcrYWQRT4+G8VmypjZTh32T3Pr3ofPVcbwTlZRoWKL6UGsIHZ0qJCW
         rH+quF7UopePqCy5ZUJoJpjF6F3Mwq+riVfQ9s/k=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: gadget: u_audio: Subdevice 0 for capture ctls
Date:   Mon, 27 Dec 2021 07:51:00 +0100
Message-Id: <20211227065100.20873-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Both capture and playback alsa devices use subdevice 0. Yet capture-side
ctls are defined for subdevice 1. The patch sets subdevice 0 for them.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/u_audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index c46400be5464..4f6c0049c534 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -1145,7 +1145,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			}
 
 			kctl->id.device = pcm->device;
-			kctl->id.subdevice = i;
+			kctl->id.subdevice = 0;
 
 			err = snd_ctl_add(card, kctl);
 			if (err < 0)
@@ -1168,7 +1168,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			}
 
 			kctl->id.device = pcm->device;
-			kctl->id.subdevice = i;
+			kctl->id.subdevice = 0;
 
 
 			kctl->tlv.c = u_audio_volume_tlv;
-- 
2.25.1

