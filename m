Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D1E48515C
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jan 2022 11:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235283AbiAEKqv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jan 2022 05:46:51 -0500
Received: from cable.insite.cz ([84.242.75.189]:38815 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235139AbiAEKqv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jan 2022 05:46:51 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id E6960A1A3D406;
        Wed,  5 Jan 2022 11:46:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641379609; bh=DlcRI+/hqOmQarKduOSzqlF1zr0S4HXOhKZ05KIzJzY=;
        h=From:To:Cc:Subject:Date:From;
        b=k9oA9dtyq3cYbOrJtbOsWB7kBOhr757qw9ZZUgIVNuoJP/3CC5ISOJqufzVblFfkx
         1e4KrsJZUqKSYEwnSt82NKMTq40cDjKCG2LTjCAKztgOFBp30jSn+5RALSIWnbl8jF
         QyTkj4m7yQQjhzN5d3Of61nsTgTJdL3hq8hqQMi4=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id f8HnXlmTljkw; Wed,  5 Jan 2022 11:46:44 +0100 (CET)
Received: from precision.insite.cz (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 7E561A1A3D407;
        Wed,  5 Jan 2022 11:46:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641379604; bh=DlcRI+/hqOmQarKduOSzqlF1zr0S4HXOhKZ05KIzJzY=;
        h=From:To:Cc:Subject:Date:From;
        b=guJu8IpSgNshCzwQO4L/wUEB/thloSZoUakWfCxSCDgAUFtZguSrzr0cFkwbOZEcc
         7vgB06WGXKoYV+FDY9MU1griqV/8ENdpBZRxcXBYxflSxI8laqw88a33aPixy1n2bp
         PkYW3XLABeDknDfzQVR//b12OoDFJ6jExzWMgPm4=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] usb: gadget: u_audio: Subdevice 0 for capture ctls
Date:   Wed,  5 Jan 2022 11:46:43 +0100
Message-Id: <20220105104643.90125-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Both capture and playback alsa devices use subdevice 0. Yet capture-side
ctls are defined for subdevice 1. The patch sets subdevice 0 for them.

Fixes: 02de698ca812 ("usb: gadget: u_audio: add bi-directional volume and mute support")
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---

Notes:
    v2: added Fixes tag to the message

 drivers/usb/gadget/function/u_audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 4fb05f9576a6..4561d7a183ff 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -1147,7 +1147,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			}
 
 			kctl->id.device = pcm->device;
-			kctl->id.subdevice = i;
+			kctl->id.subdevice = 0;
 
 			err = snd_ctl_add(card, kctl);
 			if (err < 0)
@@ -1170,7 +1170,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			}
 
 			kctl->id.device = pcm->device;
-			kctl->id.subdevice = i;
+			kctl->id.subdevice = 0;
 
 
 			kctl->tlv.c = u_audio_volume_tlv;
-- 
2.25.1

