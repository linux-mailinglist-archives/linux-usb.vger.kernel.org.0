Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C03447A5FB
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 09:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhLTIZv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 03:25:51 -0500
Received: from cable.insite.cz ([84.242.75.189]:40833 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229827AbhLTIZv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 03:25:51 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 1FF8FA1A3D40C;
        Mon, 20 Dec 2021 09:25:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639988749; bh=4OReWYNWtGWkkIdlPU08sx5H+R+qLS85r9ZPvLOz62Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lRNaX3LmT+QkgYBmjLu8gQIdmLNQNcMmOXprUEzEJco6KNpv7YWN155ANZDIZ+94K
         UHZyYbJ+0gLP6IgE3UX09ak4s0Jh4tQTzCRml9Bj5B1PuvGr8xynvdzFOCqxcJKw8c
         l9xUN/DBWs4s3NoPDakFYwBcDoeNwTE1buRS9VfQ=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id d68Mj07ll8-k; Mon, 20 Dec 2021 09:25:44 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id C42AFA1A3D401;
        Mon, 20 Dec 2021 09:25:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639988744; bh=4OReWYNWtGWkkIdlPU08sx5H+R+qLS85r9ZPvLOz62Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PovdHsbs0q+D2K3mD4uqqbBXkyt6QbVXCrI+jyRiXRHeUWLgC4wLe48a4ry2/6c5t
         EK3nME9hNyRvttiX4HEK/DieF6BoPVQFulvwms4xf57LofIiLwfc6tWQKSXULrErCc
         doWy/6Ye8BlJkhFAg8DPgoFBMXhEr2W8D6+JXa+I=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 01/11] usb: gadget: u_audio: Subdevice 0 for capture ctls
Date:   Mon, 20 Dec 2021 09:25:32 +0100
Message-Id: <20211220082542.13750-2-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220082542.13750-1-pavel.hofman@ivitera.com>
References: <20211220082542.13750-1-pavel.hofman@ivitera.com>
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

