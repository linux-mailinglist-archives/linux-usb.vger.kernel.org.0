Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBEBAB5F0
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2019 12:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393101AbfIFKdN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Sep 2019 06:33:13 -0400
Received: from mail-vs1-f74.google.com ([209.85.217.74]:48660 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393093AbfIFKdM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Sep 2019 06:33:12 -0400
Received: by mail-vs1-f74.google.com with SMTP id h11so653397vsj.15
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2019 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=zRWSVeb5W05ehvG18tGL2ilvhm06WavygbArZEKUTQI=;
        b=e7pIkQN5je/XEVAJp1MoyRIDbt8/QAUq8a0aCp2pl+5BXg7BlR/aBq3w90T2MHY/96
         or9LnLVsfQAUZ6WcUXquecLQbq7AfQsWuMOElN7QBSRip+pGen/0vei+ytkC3CNJZinh
         vjvxUb6OWztEm92a3kBKvDf11CljmbJB3v2KxZNkV/VYozO1TmGlmm23I9IpoQOrTVuU
         KIrchOfMYT8stFrHrJp1DKfwriVUxW14bM78ShdIhs0tjJTy+dDmHaIW84oKORn8v0ZX
         4yC+x8xCIbGrLZoNnDzQC0F1BaeVA5yf5HkHqFcHYHEfK+Lz+gk7RCeZkYQ0vZD44EvN
         fPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=zRWSVeb5W05ehvG18tGL2ilvhm06WavygbArZEKUTQI=;
        b=axN/qPvH+O+n7TT6tOQnZ6+aBwmnhNvtiqJz1XivGWyEe731W5OMSncJrOLX7G8nrJ
         9CGKflbyX2DyaN/47vQtucTqQiqCva5XjdGHPDJwVjWaY9XCkoI9+tDJxudP1ziG6yi5
         EKR+s4j3kk/tpulnaIoh45idlQzlXxgbj3RF7p7Kmx3LYh6u8SFpmzmTrSF3+LkbnrCY
         2pnjPiCpX/Gxhagro/6wlDkuRpfImoATnq3YaDT4cL1Kfi6rox7gbvpL8ia8l3AcegaO
         InIfKgXcmSvbAOx3DCr/V7qR5jApbYSOMNr2rTMvjd5RDEzL8qJpHHnPOy3ZDeJzyRZW
         HyGA==
X-Gm-Message-State: APjAAAUi8eVAOulYky7foRc4kpKSlw2vPPPiuVKVXehtg/L1+qtaT5iN
        zdN9KB/v7Hy+Br8xJWfEkVPwRuJOSLhWHA==
X-Google-Smtp-Source: APXvYqyJHDiCm82bWxKF42Am556t+80bDMIgVxh1wUlEMnXyARvko3CTErt5o23JS8NG+EzPGeJPZGvD+nkliA==
X-Received: by 2002:a1f:db43:: with SMTP id s64mr3568270vkg.67.1567765990854;
 Fri, 06 Sep 2019 03:33:10 -0700 (PDT)
Date:   Fri,  6 Sep 2019 11:32:34 +0100
In-Reply-To: <20190906103235.197072-1-maennich@google.com>
Message-Id: <20190906103235.197072-11-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190906103235.197072-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v5 10/11] usb-storage: remove single-use define for debugging
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, jeyu@kernel.org,
        joel@joelfernandes.org, lucas.de.marchi@gmail.com,
        maco@android.com, sspatil@google.com, will@kernel.org,
        yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
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

