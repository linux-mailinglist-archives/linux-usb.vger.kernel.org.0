Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2069AA6C58
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2019 17:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729919AbfICPHy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 11:07:54 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:33844 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729905AbfICPHy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Sep 2019 11:07:54 -0400
Received: by mail-qk1-f201.google.com with SMTP id b67so7216600qkc.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2019 08:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=zRWSVeb5W05ehvG18tGL2ilvhm06WavygbArZEKUTQI=;
        b=EFphzrlXR0Q3X5gcyhY/QpNLUIKGO6Mu86Y7KiyAnZSAJCuL+nBTfH/jlK5erD7K2r
         W8pEWRT1FseJg9jN2oX0QQ+pK6swlE6nXwrBZ6Wb5ategvz0WdbO4zdMpl4JlgBIHf2v
         IzNy2RHxCVLFsD+LRUIe4g3TZB+8D3g68RwEhZjlWK09mvWkkYF7Yd6gbZ943ljGv0Pe
         1AAxqU/OY+EFee6I23XvaOzyBbuR/9P9VIte/Y05WhkZZKwnXhu3vmyH8723rsuiufZI
         mLPqCZpvo8SV8k8H0mF6pGEksWdC7a3+5KSIrnkafdHCyITOpeyiUevIBhWx42asYq9T
         wNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=zRWSVeb5W05ehvG18tGL2ilvhm06WavygbArZEKUTQI=;
        b=J6L8kNi0dq9+aCXRQWQIFCruf0zxvs2hHmLyn06KbayP0MAi/I1ZMz+oJSf/Hm31nx
         2bzOjXR/oUhR14iFv/ObIp/u3e/+mgrRlbflj/ZB4ODuUzIILcIdSzEQGaq9o1wMp9yg
         ewDa6uFQsB5nPuwJ/2PMmmR3xJvmrMHPYv7npHC5WkZDG71seBgl3rZm7xdpd2t+d7CD
         GWjXMd9d0nhg3O7QUKmff2oAePctKpAQBU4Gh4i5Aq4y+Ys0FkxNZoPgSJ6Jp8RJcwkk
         Ksq4mWeU8sW/UL/PRJYl7VOdEeAoF456HcpV0fOSRKWWvpEHjyCo8UoM4iKmFdixeYg0
         OpeA==
X-Gm-Message-State: APjAAAUZrUcrKeEm01LR+HcniHhGFWvO59tOC4DqtvQj/xVFxeMd5REz
        KsDAYMC9ajp5hMlBzz8CW5/zQRQ1QOANeA==
X-Google-Smtp-Source: APXvYqwXLQ60AAfU9iVgSfT4ANntf+V9n3+Zm6PoQo1JQsqHzpyZDSgMHAEiaguzYB+Iw7z7S32mkOrSiVC1PQ==
X-Received: by 2002:ac8:5296:: with SMTP id s22mr17672802qtn.139.1567523273051;
 Tue, 03 Sep 2019 08:07:53 -0700 (PDT)
Date:   Tue,  3 Sep 2019 16:06:36 +0100
In-Reply-To: <20190903150638.242049-1-maennich@google.com>
Message-Id: <20190903150638.242049-11-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v4 10/12] usb-storage: remove single-use define for debugging
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, jeyu@kernel.org,
        joel@joelfernandes.org, lucas.de.marchi@gmail.com,
        maco@android.com, sspatil@google.com, will@kernel.org,
        yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB_STORAGE was defined as "usb-storage: " and used in a single location
as argument to printk. In order to be able to use the name
'USB_STORAGE', drop the definition and use the string directly for the
printk call.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 drivers/usb/storage/debug.h    | 2 --
 drivers/usb/storage/scsiglue.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/storage/debug.h b/drivers/usb/storage/debug.h
index 6d64f342f587..16ce06039a4d 100644
--- a/drivers/usb/storage/debug.h
+++ b/drivers/usb/storage/debug.h
@@ -29,8 +29,6 @@
 
 #include <linux/kernel.h>
 
-#define USB_STORAGE "usb-storage: "
-
 #ifdef CONFIG_USB_STORAGE_DEBUG
 void usb_stor_show_command(const struct us_data *us, struct scsi_cmnd *srb);
 void usb_stor_show_sense(const struct us_data *us, unsigned char key,
diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 05b80211290d..df4de8323eff 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -379,7 +379,7 @@ static int queuecommand_lck(struct scsi_cmnd *srb,
 
 	/* check for state-transition errors */
 	if (us->srb != NULL) {
-		printk(KERN_ERR USB_STORAGE "Error in %s: us->srb = %p\n",
+		printk(KERN_ERR "usb-storage: Error in %s: us->srb = %p\n",
 			__func__, us->srb);
 		return SCSI_MLQUEUE_HOST_BUSY;
 	}
-- 
2.23.0.187.g17f5b7556c-goog

