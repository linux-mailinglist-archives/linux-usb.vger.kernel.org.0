Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C72D73EC123
	for <lists+linux-usb@lfdr.de>; Sat, 14 Aug 2021 09:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237332AbhHNHWx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Aug 2021 03:22:53 -0400
Received: from cable.insite.cz ([84.242.75.189]:50638 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237248AbhHNHWu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 14 Aug 2021 03:22:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 27D90A1A3D402;
        Sat, 14 Aug 2021 09:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1628925740; bh=DkcJHZNbIZZE4Jd2cA9F0v8ueW8ClGJm2XpwugboM8o=;
        h=From:To:Cc:Subject:Date:From;
        b=WjvE6v8kCpxv1kNxPKaXRrZU3tUAf8KhyaZ2pgYMu9fK0+tJ1w0qN7Qef255Q8q9h
         D+aCa2R95ZwTTPDhPqVTUFkimbWkJ82Mr+FJ3T5LZVtrihSa4xa6hDdMH+i08pHGWX
         rWnLxBPAr/sEMJrWoB68oDOOr6RJCia2/OqOxht8=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RJUE5jo2dDut; Sat, 14 Aug 2021 09:22:15 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id BFDE3A1A3D400;
        Sat, 14 Aug 2021 09:22:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1628925734; bh=DkcJHZNbIZZE4Jd2cA9F0v8ueW8ClGJm2XpwugboM8o=;
        h=From:To:Cc:Subject:Date:From;
        b=Gs4o6Ti7Qu+NTAgzaDlb8dldQt9a8jqYLFepWmXXHWgVfxHs8qRNmZVaj570WZGBZ
         HEK7iCuok/HPqVEmksTdme2jY0vtgGqlqgnS9VetbOX7vRbGQacDAaA8rx0vlVHS6s
         iKfDJYPDZs81Rd1QepAFueH+DDT072dzKEBeub8I=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH]  usb: gadget: f_uac1: fixing inconsistent indenting
Date:   Sat, 14 Aug 2021 09:22:14 +0200
Message-Id: <20210814072214.4893-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

 Fixing inconsistent indenting identified by kernel test
 robot.

 Signed-off-by: Pavel Hofman<pavel.hofman@ivitera.com>
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

