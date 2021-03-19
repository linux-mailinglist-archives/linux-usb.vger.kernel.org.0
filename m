Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D33D341D4E
	for <lists+linux-usb@lfdr.de>; Fri, 19 Mar 2021 13:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbhCSMsk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Mar 2021 08:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhCSMsH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Mar 2021 08:48:07 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A005DC06175F
        for <linux-usb@vger.kernel.org>; Fri, 19 Mar 2021 05:48:06 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id z2so8987878wrl.5
        for <linux-usb@vger.kernel.org>; Fri, 19 Mar 2021 05:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lLM567jy++V5tj0JbTzI0pIXAnLeH2flx+y9MhQyRIc=;
        b=ZSDgmVBlygnWez8XhQnS2IGPakLEpKjAS592kRCM71MM4Foxb5sfZXQsG9FYTMiX/q
         JtSms6yGHYk/QGWHaftDnv24X9TZrOOuF6Y5SwfuL5hfKqWhk5iW4C/2ZkOxAbsRrZgY
         Ln4nwaCXlgl8MbnCEIY1/t1B32DNUmh6eLjJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lLM567jy++V5tj0JbTzI0pIXAnLeH2flx+y9MhQyRIc=;
        b=fj8/fmPaO4vVT+nP5NUSvIIjEF0ob5mYrad0U6QZMGB3zEkUyZhp72MyEFeSm6rqqk
         I8HpQKjuYUiVYPKWgN1qHLIWqdBCPM9veklWP+ORfVr7xF6woQvXiwh8RH7H89ck4YuL
         CWIEUFsDmnHnd/vCBXaojf5HKX2BoWcDk7FuzIARRU+bCnmvP7iarYh3bztAWOm1ZUcZ
         udTJTW0WmO9TyRtoYYLfhvhBcWU+yGgbARQoSzFqo5me5fhgeD7xi0WtwDnwDx1zosft
         YuWsk1PICFt7AelfbqGRCwjROeCn9xaaRsIZqiu9EZ7CFcyQoS55t6WoO2IGnUTnYzEu
         I+nA==
X-Gm-Message-State: AOAM5315toxCw/0o5OEFP/sGseaoUecwsIO6pMu1onTHazXryYaiedJr
        bx7ikWWLIvWGbvmDdxsQJIwS7y8B4l4q41A3uzg=
X-Google-Smtp-Source: ABdhPJxdGJ+3oolwhSHgdJHaTFCj0frBhJX8jzAl/USYvyaFK971/SYPNmsV+Fd0x6EcBVkotbN2hA==
X-Received: by 2002:adf:90c2:: with SMTP id i60mr4406446wri.75.1616158085063;
        Fri, 19 Mar 2021 05:48:05 -0700 (PDT)
Received: from vpa2.c.googlers.com.com (230.69.233.35.bc.googleusercontent.com. [35.233.69.230])
        by smtp.gmail.com with ESMTPSA id t8sm7970599wrr.10.2021.03.19.05.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 05:48:04 -0700 (PDT)
From:   Vincent Palatin <vpalatin@chromium.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Vincent Palatin <vpalatin@chromium.org>
Subject: [PATCHi v2] USB: quirks: ignore remote wake-up on Fibocom L850-GL LTE modem
Date:   Fri, 19 Mar 2021 13:48:02 +0100
Message-Id: <20210319124802.2315195-1-vpalatin@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This LTE modem (M.2 card) has a bug in its power management:
there is some kind of race condition for U3 wake-up between the host and
the device. The modem firmware sometimes crashes/locks when both events
happen at the same time and the modem fully drops off the USB bus (and
sometimes re-enumerates, sometimes just gets stuck until the next
reboot).

Tested with the modem wired to the XHCI controller on an AMD 3015Ce
platform. Without the patch, the modem dropped of the USB bus 5 times in
3 days. With the quirk, it stayed connected for a week while the
'runtime_suspended_time' counter incremented as excepted.

Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
---
 drivers/usb/core/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 6ade3daf7858..76ac5d6555ae 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -498,6 +498,10 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* DJI CineSSD */
 	{ USB_DEVICE(0x2ca3, 0x0031), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* Fibocom L850-GL LTE Modem */
+	{ USB_DEVICE(0x2cb7, 0x0007), .driver_info =
+			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
+
 	/* INTEL VALUE SSD */
 	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
 
-- 
2.31.0.rc2.261.g7f71774620-goog

