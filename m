Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6177A381C5E
	for <lists+linux-usb@lfdr.de>; Sun, 16 May 2021 06:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbhEPEL0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 May 2021 00:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbhEPEL0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 May 2021 00:11:26 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6166C061573
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 21:10:11 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so2844562oto.0
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 21:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p+n8knY1AhNlxa/4+sSt2iV2/z4kOsoddvvQNZinhOI=;
        b=dIQD4Jg5OvVLbM85iRn9Wdb6zWoSJHOTRqfAMo16awQaPc84wIm5fJKmUMkeXyoWPC
         u1ZSvTuvXkR2KGo7JUt1vlxp4GAI8jhmfhVlzBYKDzujdi8XYqvs7GUPL7rHAWGLboDX
         WWOSm2IcE3WwKNS9Kg8qBCPxrUqu4uWTFfXApERU8Ba9Z6BN9Q6WsxMTPnxZw4RYq7X2
         SBju5rpw82tNnKdPGS9EGUmi59yjTTvv+8xxpfHlXYs7uM3bwp148OobiJGIVGSsU2od
         1uHzsfJRsMU1kUit2KRvozOCC9aq29AeWAbEaB5NLP7/m+jcDWF7JQ1Zch4ora2UHdLk
         XSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p+n8knY1AhNlxa/4+sSt2iV2/z4kOsoddvvQNZinhOI=;
        b=KzHIRToB5pWixFnnjylC4Dx092JmSRci/xMCXEalvWMGMwV2YGhMq6IKvIAylwQNnk
         9Pks9FE5JPgFK7SxVdYhxaLGJSAqa+wEuqTZzbd7Bv92hf5x0VPgXjHipDGtA//H/QwQ
         RvVeHzKHKVcWba6kFzzRGDqwheXsoB2FCwPZnqpf2D8KYSSqmyoWsOLx8qEnd86HybaU
         1gdx0FxZDlbZWwyP/QEnG6ZSf+s6VASrhDmwSmdEAqHf6aMlWgoINPHUKzkv6KqsUNiC
         TZvXmTkYFVFYhIXVIbAGD/oUNp41PFsD5lkWV5LxmY6kwkzf91CHprqc0+hSla2i7lCE
         UOFA==
X-Gm-Message-State: AOAM5337l2as0/BqO3nvYXAcrMnkwlNY4A3vpbVIrJiJDOkrnxbJ9KDA
        vnewzN5TMfx06R1oHL2IxZ9kgQ==
X-Google-Smtp-Source: ABdhPJymZi3sghq5YuyzycKcrFI71wfKLE9hWfVerC6WpNoOizAM1mbVDM9d5CoJ63ya1C6+ZQvGPg==
X-Received: by 2002:a9d:491:: with SMTP id 17mr45588270otm.184.1621138210984;
        Sat, 15 May 2021 21:10:10 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r19sm2358369ooj.5.2021.05.15.21.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 21:10:10 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Berg <bberg@redhat.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Clear pending after acking connector change
Date:   Sat, 15 May 2021 21:09:53 -0700
Message-Id: <20210516040953.622409-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It's possible that the interrupt handler for the UCSI driver signals a
connector changes after the handler clears the PENDING bit, but before
it has sent the acknowledge request. The result is that the handler is
invoked yet again, to ack the same connector change.

At least some versions of the Qualcomm UCSI firmware will not handle the
second - "spurious" - acknowledgment gracefully. So make sure to not
clear the pending flag until the change is acknowledged.

Any connector changes coming in after the acknowledgment, that would
have the pending flag incorrectly cleared, would afaict be covered by
the subsequent connector status check.

Fixes: 217504a05532 ("usb: typec: ucsi: Work around PPM losing change information")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 282c3c825c13..f451ce0132a9 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -694,8 +694,8 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	ucsi_send_command(con->ucsi, command, NULL, 0);
 
 	/* 3. ACK connector change */
-	clear_bit(EVENT_PENDING, &ucsi->flags);
 	ret = ucsi_acknowledge_connector_change(ucsi);
+	clear_bit(EVENT_PENDING, &ucsi->flags);
 	if (ret) {
 		dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
 		goto out_unlock;
-- 
2.29.2

