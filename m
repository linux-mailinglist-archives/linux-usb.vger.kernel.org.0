Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC513EEA92
	for <lists+linux-usb@lfdr.de>; Tue, 17 Aug 2021 12:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239518AbhHQKHw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 06:07:52 -0400
Received: from cable.insite.cz ([84.242.75.189]:58802 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239505AbhHQKHA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Aug 2021 06:07:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 113C9A1A3D401;
        Tue, 17 Aug 2021 12:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1629194762; bh=Y+tSKwLyRHTZr75kFLtkesP4w091uQTqC1mgwaHTzP8=;
        h=From:To:Cc:Subject:Date:From;
        b=nwzIgHSBDTX1ssXYPhzN/1xVh7DwrnjLkQhoC9ea6KaeSX48XfLqKJ4bOEcRbWpyp
         vw1tS+2A7h3NmvBG7d1LP+eHOuVROCL9FiQe2ZT+w1hTU0Deo/ElC67Lz+S+g2T5YK
         FfX4B8im27cCA6x+LTZLSnB7ep33LxLScxdp7BsE=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UbkPVfvhoWCo; Tue, 17 Aug 2021 12:05:56 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 8A18AA1A3D400;
        Tue, 17 Aug 2021 12:05:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1629194756; bh=Y+tSKwLyRHTZr75kFLtkesP4w091uQTqC1mgwaHTzP8=;
        h=From:To:Cc:Subject:Date:From;
        b=TOWa2JjYwzexE1QxrLZazbfjkjtKExbEnbUm0WyC1mNjEFmFm8UNON/RaeOyR7AXq
         RVsYAFk0TGkHWBaA5frUmYiPbSDECDPBgRXRwfF5+2Z5HWty+hnMLDnPNn352WeMzL
         nPzwZSD3EXRb4mg8KGkaunu22aWUWuHq+I+DT6Do=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH v2] usb: gadget: f_uac1: fixing inconsistent indenting
Date:   Tue, 17 Aug 2021 12:05:55 +0200
Message-Id: <20210817100555.4437-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixing inconsistent indenting identified by kernel test
robot.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/f_uac1.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 3b3db1a8df75..5b3502df4e13 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1084,24 +1084,24 @@ static int f_audio_validate_opts(struct g_audio *audio, struct device *dev)
 
 	if (opts->p_volume_max <= opts->p_volume_min) {
 		dev_err(dev, "Error: incorrect playback volume max/min\n");
-			return -EINVAL;
+		return -EINVAL;
 	} else if (opts->c_volume_max <= opts->c_volume_min) {
 		dev_err(dev, "Error: incorrect capture volume max/min\n");
-			return -EINVAL;
+		return -EINVAL;
 	} else if (opts->p_volume_res <= 0) {
 		dev_err(dev, "Error: negative/zero playback volume resolution\n");
-			return -EINVAL;
+		return -EINVAL;
 	} else if (opts->c_volume_res <= 0) {
 		dev_err(dev, "Error: negative/zero capture volume resolution\n");
-			return -EINVAL;
+		return -EINVAL;
 	}
 
 	if ((opts->p_volume_max - opts->p_volume_min) % opts->p_volume_res) {
 		dev_err(dev, "Error: incorrect playback volume resolution\n");
-			return -EINVAL;
+		return -EINVAL;
 	} else if ((opts->c_volume_max - opts->c_volume_min) % opts->c_volume_res) {
 		dev_err(dev, "Error: incorrect capture volume resolution\n");
-			return -EINVAL;
+		return -EINVAL;
 	}
 
 	return 0;
-- 
2.25.1

