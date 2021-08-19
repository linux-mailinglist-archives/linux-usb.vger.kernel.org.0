Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582C23F2376
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 00:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236105AbhHSXAS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 19:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhHSXAR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Aug 2021 19:00:17 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C140C061756
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 15:59:41 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id e186so9769892iof.12
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 15:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vTZIfOHRyXqbRj0vGMmgdDyUBJVGJoNZm2wLqjm5mWE=;
        b=MGinE0QLP4WwLR3nsv+V+OQ+QbzraAYbOU4lYI4XNKd8JTtQJH9CypndKoxrNG16Hb
         dkXRH8WunA5gaFa7bmherR7mr7l2zL8GWYxXQZV9Rsg4sltApZdowjhSISCl0sXGFt+U
         EXF2QV324JhglufxMSGTeoLzDyP+EVgECqI3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vTZIfOHRyXqbRj0vGMmgdDyUBJVGJoNZm2wLqjm5mWE=;
        b=Oq645HvVLu+iYbcmZf98nIn/q3zU4bszJkL7tAzLUrZwq2o5qcoEOVHjO11jGTkoiP
         TsaY2sPPEtifgAlrBu3024je9FYpnLLH8aNyjwHSdKTTJlh7oJ/gO5AWq4iybg9CEC89
         FCMOd70ZapVY/duccRLWQjRXzgtf52bSuTeDksNbKEqtUcldyKZBJQcb/4BeoNFRUKLp
         kMoFYnwVRvjkfcO5j0J4b0DFeyaqfywuG7UhFUTqrp/Y2wqEtwI6alEJkszE0FR+525r
         Su9bNWmQO3gvNQWbDMeQruLmVRYB7z28slZuOtOAB1ULdrmqJakQpH13dy0OCPa7SHMr
         MrZQ==
X-Gm-Message-State: AOAM530T2BoNbKQulGZUsXRPgCsjKLLmQi9MAwlJHhpIKOaJyjfH3ZtA
        WznHmTVWPJ4+94Uj0IWqxWtjwQ==
X-Google-Smtp-Source: ABdhPJxouRhLae2784WA0Y++VSaZ3KpxP3Du54Wek2AnvB0xsPH0YxAkXPEcnD5qMMZB/OMCbmsqsw==
X-Received: by 2002:a5d:990f:: with SMTP id x15mr13576695iol.200.1629413980537;
        Thu, 19 Aug 2021 15:59:40 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id u15sm2374814ion.34.2021.08.19.15.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 15:59:40 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     valentina.manea.m@gmail.com, shuah@kernel.org, msbroadf@gmail.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usbip:vhci_hcd USB port can get stuck in the disabled state
Date:   Thu, 19 Aug 2021 16:59:37 -0600
Message-Id: <20210819225937.41037-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When a remote usb device is attached to the local Virtual USB
Host Controller Root Hub port, the bound device driver may send
a port reset command.

vhci_hcd accepts port resets only when the device doesn't have
port address assigned to it. When reset happens device is in
assigned/used state and vhci_hcd rejects it leaving the port in
a stuck state.

This problem was found when a blue-tooth or xbox wireless dongle
was passed through using usbip.

A few drivers reset the port during probe including mt76 driver
specific to this bug report. Fix the problem with a change to
honor reset requests when device is in used state (VDEV_ST_USED).

Suggested-by: Michael <msbroadf@gmail.com>
Reported-and-tested-by: Michael <msbroadf@gmail.com>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/usb/usbip/vhci_hcd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 4ba6bcdaa8e9..937f28f3d579 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -455,8 +455,14 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			vhci_hcd->port_status[rhport] &= ~(1 << USB_PORT_FEAT_RESET);
 			vhci_hcd->re_timeout = 0;
 
+			/*
+			 * A few drivers do usb reset during probe when
+			 * the device could be in VDEV_ST_USED state
+			 */
 			if (vhci_hcd->vdev[rhport].ud.status ==
-			    VDEV_ST_NOTASSIGNED) {
+				VDEV_ST_NOTASSIGNED ||
+			    vhci_hcd->vdev[rhport].ud.status ==
+				VDEV_ST_USED) {
 				usbip_dbg_vhci_rh(
 					" enable rhport %d (status %u)\n",
 					rhport,
-- 
2.30.2

