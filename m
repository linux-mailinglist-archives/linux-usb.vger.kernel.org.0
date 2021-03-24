Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36CD0347687
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 11:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbhCXKw3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 06:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhCXKv7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 06:51:59 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC7FC0613DE
        for <linux-usb@vger.kernel.org>; Wed, 24 Mar 2021 03:51:59 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id v186so14356256pgv.7
        for <linux-usb@vger.kernel.org>; Wed, 24 Mar 2021 03:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RHAm+76/M2ERnBpqBJ8Unh6sng0ndd/2/ck/dYLnYiM=;
        b=ho/mqtW7Z41cxn8EjFhy44T0xgx2WYhKkJ9tk4gjM8c1lXyncVdPmLmZGfrKkRBSFm
         lCrI/5g/00U4MI1yx3U+rr+ooTZJxqciHZMM9iA6pgnJUgYhOeXMoAQzMtPTH9umJNzD
         joX8SumJ+wMTE1hkUodlJw8RUJ/AQNYTnfaLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RHAm+76/M2ERnBpqBJ8Unh6sng0ndd/2/ck/dYLnYiM=;
        b=NYvSXfOd7hntM6zOWhAsOZwWOqcw7oCg/sRsd1UgY2SvJXLJy4sDgXnRGv/UeZAR0E
         8uakudcuS3c8eChHewp+ePjzpn/ocfIc8Gfq/5Js8gq8sr/M+wR/ezDwQp7N/C0eC3uD
         oOiun0iKupnfp9n/8tFQYSPmH4pSO+Y9UkMUXcxg9P4Ew3DNfr+OWGRExMbx/IxKyOiy
         psJBsx/8lTPLPk5Eq7iDxE02+9gXPgY8zFiDNakPLnZu2j8bKdX6tZ8O3qZ3dhni8Ud9
         SeZwnuIGq6ThLFGE9s0sz7UjkHX2QcCPh7ahSPj4paPqNVvta4eXZ2bdLmLFgnhukE7p
         KTsw==
X-Gm-Message-State: AOAM5334H5TwURW+LM5DXnvl1lYy38TxBrmN/E+4cj0E9/pcNLJHMwYq
        mkdDdg2wbGV5scwYyFrVwZY9xyJKUSkFkg==
X-Google-Smtp-Source: ABdhPJw7V/f4oA9bNMIjIGhevVeob1pCiQHINzu/+yEXvfZBK2PFTdAsJCoe5M+5Y9r3sMqaK2BSxg==
X-Received: by 2002:a63:d309:: with SMTP id b9mr2454981pgg.96.1616583118899;
        Wed, 24 Mar 2021 03:51:58 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:5820:ad58:4021:85])
        by smtp.gmail.com with ESMTPSA id w4sm2107371pjk.55.2021.03.24.03.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 03:51:58 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc:     Olivia Mackintosh <livvy@base.nu>, linux-usb@vger.kernel.org,
        Dmitry Panchenko <dmitry@d-systems.ee>,
        Dylan Robinson <dylan_robinson@motu.com>,
        Joakim Tjernlund <joakim.tjernlund@infinera.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Alexander Tsoy <alexander@tsoy.me>, linux-kernel@vger.kernel,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gregor Pintar <grpintar@gmail.com>,
        Ikjoon Jang <ikjn@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Apply sample rate quirk to Logitech Connect
Date:   Wed, 24 Mar 2021 18:51:52 +0800
Message-Id: <20210324105153.2322881-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Logitech ConferenceCam Connect is a compound USB device with UVC and
UAC. Not 100% reproducible but sometimes it keeps responding STALL to
every control transfer once it receives get_freq request.

This patch adds 046d:0x084c to a snd_usb_get_sample_rate_quirk list.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=203419
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d3001fb18141..176437a441e6 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1521,6 +1521,7 @@ bool snd_usb_get_sample_rate_quirk(struct snd_usb_audio *chip)
 	case USB_ID(0x21b4, 0x0081): /* AudioQuest DragonFly */
 	case USB_ID(0x2912, 0x30c8): /* Audioengine D1 */
 	case USB_ID(0x413c, 0xa506): /* Dell AE515 sound bar */
+	case USB_ID(0x046d, 0x084c): /* Logitech ConferenceCam Connect */
 		return true;
 	}
 
-- 
2.31.0.291.g576ba9dcdaf-goog

