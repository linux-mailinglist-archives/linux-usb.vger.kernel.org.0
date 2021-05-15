Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A14381958
	for <lists+linux-usb@lfdr.de>; Sat, 15 May 2021 16:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbhEOO0f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 10:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbhEOO0f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 May 2021 10:26:35 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928E6C061573
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 07:25:20 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so3073451pjp.4
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zrpI9aqNSIZj2FkRvlmMmVIOsrsnr2kfjUz3pcuWzlU=;
        b=JYnTd5c3ZM93TbQWaZwvEpyPvzsAdVwVMbgsOiRECwuYaeSBwZ5kVf58GwxIJF+sBY
         +RcvkaMmNWYnFdL4QbJqIGGpsFdX89oAgsAjxiP0rSlzAzc0cshpdPGHKzXfERFQAuuB
         7D9uR+zfErSR816vAiRsXxHlzfZxYdh3nbGMXy4YfPVLPYTbq/v2Qv2r3/XIv4l5XmcV
         1DRwgRlNI86F7NgsrzBkiH7WRf7WmhUahp3xSfGNCxWnmpMMtRCPMg0MmFKMeLhVikLV
         lDAOvMHovFI3V98eq4mu+745LwGSvoqueiTb3jGy8iSTaqaNZJ1XKbogDZ+OIBxAHoa4
         ADSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zrpI9aqNSIZj2FkRvlmMmVIOsrsnr2kfjUz3pcuWzlU=;
        b=r1+GdH+HLMNPeA7B/j+Cx2paUGAglkQ2NuIlhdKhBpU+YL6EbzBHuBLzYSFFTB3N8A
         SyjEVpysAek0MwGcV1CCdOeEfSFzWX0cB2jpilBCIcexsUSW2SGXX+P34CYtIJx2UXg5
         0OgBbswkn4tL6yuHU1NpebaV3FXOVz91v/ER6lOt3HowJnu7dbFxoDZKx6fFxbtndKjG
         1/Y0aoN2HWxoFSxfkqoOjoq5LXOVD7jsfHFJPtfqaMdDHsTXELhYnIN9EX1E2426hMg4
         NujBzVpkAOcn++XToi4OJSpdupKe63sMnjwDs7A3UINf24Fy2u4JETOhauMWClMQAqnN
         9wgw==
X-Gm-Message-State: AOAM533TfzlBQkLvXq3OrktYTPsN63ShBT4yaG9BA2O7L2+/wVnzyg/w
        rjeLOUaTNpN9SwlVzh8DAgs=
X-Google-Smtp-Source: ABdhPJy0bA3exrRwW+1qXt3iwnUfjwqPHE40jFD67cMHRoR8+MqAJwjTMwCPksoL5rmAf5/44S9OpQ==
X-Received: by 2002:a17:90a:66c3:: with SMTP id z3mr17499268pjl.196.1621088720140;
        Sat, 15 May 2021 07:25:20 -0700 (PDT)
Received: from nuc.. ([202.133.196.154])
        by smtp.gmail.com with ESMTPSA id h9sm571602pja.42.2021.05.15.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 07:25:19 -0700 (PDT)
From:   Du Cheng <ducheng2@gmail.com>
To:     Hayes Wang <hayeswang@realtek.com>
Cc:     "David S. Miller" <davem@davemloft.net>, linux-usb@vger.kernel.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        Du Cheng <ducheng2@gmail.com>,
        syzbot+95afd23673f5dd295c57@syzkaller.appspotmail.com
Subject: [PATCH] net:usb:r8152: remove WARN_ON_ONCE() in rtl_vendor_mode()
Date:   Sat, 15 May 2021 22:25:13 +0800
Message-Id: <20210515142513.183623-1-ducheng2@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If from the userland, a dummy_udc (a virtual USB device for
debugging/device emulation) is configured to have a VENDOR_ID/PRODUCT_ID
combination that is supported by rtl8152 driver, and kernel tries to
match this dummy device with rtl8152 driver by probing, the
rtl8152_probe() function will cause WARN_ON_ONCE() in rtl_vendor_mode().
This causes kernel panic if panic_on_warn is set.

More specifically, this WARN_ON_ONCE() is triggered when the rtl8152
driver detects (and trys to switch on) the vendor specific USB
configuration, which is an expected behavior for supported USB devices.
Rtl8152 should also anticipate dummy_udc which can have arbitrary
configurations and interfaces.

Remove this WARN_ON_ONCE() so that rtl8152 is able to handle (or
gracefully refuse) an unsupported USB device during probing.

Bug reported by syzbot:
https://syzkaller.appspot.com/bug?id=912c9c373656996801b4de61f1e3cb326fe940aa

VENDOR_ID/PRODUCT_ID in question:
REALTEK_USB_DEVICE(VENDOR_ID_MICROSOFT, 0x0927)

Reported-by: syzbot+95afd23673f5dd295c57@syzkaller.appspotmail.com
Signed-off-by: Du Cheng <ducheng2@gmail.com>
---
This patch passed syzbot test.

 drivers/net/usb/r8152.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 136ea06540ff..247ac4b1b34c 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -8135,8 +8135,6 @@ static bool rtl_vendor_mode(struct usb_interface *intf)
 		}
 	}
 
-	WARN_ON_ONCE(i == num_configs);
-
 	return false;
 }
 
-- 
2.30.2

