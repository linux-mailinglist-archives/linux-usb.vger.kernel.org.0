Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8F441CF71
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 00:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347333AbhI2WuN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Sep 2021 18:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347236AbhI2WuJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Sep 2021 18:50:09 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA71C06161C
        for <linux-usb@vger.kernel.org>; Wed, 29 Sep 2021 15:48:28 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id az37-20020a05620a172500b0045e43348ee8so11256620qkb.19
        for <linux-usb@vger.kernel.org>; Wed, 29 Sep 2021 15:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ETcVWno/psejFFgEWsam5NI1lLczvhwOhyjFPnZZicY=;
        b=EghzBSYgJaumTGBJNjWIlqQkmELd14y20ZMqLBeHV1G43vyoHX7wZUtHS9Ck3OyXke
         SJxanL4NUMcG2yOWC0yktYmJtOqYlceftM6+fKTjzlp5v0RL0Vebi0WwQ4Pcr8M1FNBu
         ePRwE2Vy1dyMsGEFKDxhVwcXK5wlQGyY/RpekflN21IJzxBkhoUUyhj7ODMQL5SNi4yF
         dwNFomcEZiFu35kZnbSH8XNl0ihfsZere/O79Xbn2MF+7Hc4hXdf5+q+TkQuxfsc1wvn
         nyAObw/ixyyJgz3hPODjhD1k6kMPbQKYWt/emXaDstFNHpvJkMRTNk8RRjC3rnCUn31S
         tJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ETcVWno/psejFFgEWsam5NI1lLczvhwOhyjFPnZZicY=;
        b=qsFrVvUgdJH1uSUpg34+APHJ6pc4FedjV5MEp4L8KMGHEhwRlm/F4YzqqSHUJVWdcH
         5L/4CHreHSXVoYdrWFsEoVz1ZeDwlX2798UxSFp7h+lF9frL3q2+NO0ADfrw7IrirazM
         ZLY9qi+E9NxN40aP09z8CyXVJAo3b/jmS6adpoOVnmdN+1bUuuS6YQ7F9sARCGl1qjSe
         WxhNjYh7BKlx9od1a5MwZZrVixDC1I37ENcLrcjh43ABY0vbLTypxX+qvv/Zm74ReywK
         ZwjK6mFnMQhkZijE3gufEqpXNSGW531Xn5VA+XN/V6U7nv0Yjl82T7waBQ0W4zEkpcZS
         CAeQ==
X-Gm-Message-State: AOAM5327VEieCUwJ3D1N0ZdAyfllOkNvnAcT1NMHgqepIjwRUKlCO7bg
        NqhmY5JK2mQNbsbXO9rzhz5CFLOrb6yN
X-Google-Smtp-Source: ABdhPJz4dFZxZ37NcH6OGB5NWytbGQwJt62+4qAU4i+rz/Y1LnFor5rxegWAq8JofebiYEc/pO27ztkLBYHa
X-Received: from rajat2.mtv.corp.google.com ([2620:15c:202:201:d512:b04f:25a7:c7f])
 (user=rajatja job=sendgmr) by 2002:a05:6214:140c:: with SMTP id
 n12mr2370973qvx.39.1632955707380; Wed, 29 Sep 2021 15:48:27 -0700 (PDT)
Date:   Wed, 29 Sep 2021 15:48:22 -0700
Message-Id: <20210929224823.556943-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH 1/2] usb: hub: Mark root hubs on removable devices, as removable.
From:   Rajat Jain <rajatja@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rajat Jain <rajatja@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Chris Chiu <chris.chiu@canonical.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     levinale@google.com, bleung@google.com, rajatxjain@gmail.com,
        jsbarnes@google.com, pmalani@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently all usb root hubs are always marked as DEVICE_REMOVABLE_UNKNOWN
unconditionally. Let us try to help the users to identify the removable
root hubs, by checking the device on which the root hub sits. If the base
(parent) device on which the root hub sits, is removable (e.g. on
thunderbolt docks), then the roothub is also marked as removable.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
 drivers/usb/core/hub.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 86658a81d284..45d1c81b121d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2440,8 +2440,16 @@ static void set_usb_port_removable(struct usb_device *udev)
 
 	dev_set_removable(&udev->dev, DEVICE_REMOVABLE_UNKNOWN);
 
-	if (!hdev)
+	if (!hdev) {
+		/*
+		 * If the root hub sits on a removable device, mark the root hub
+		 * removable as well. This helps with the USB root hubs sitting
+		 * on the thunderbolt docks.
+		 */
+		if (udev->dev.parent && dev_is_removable(udev->dev.parent))
+			dev_set_removable(&udev->dev, DEVICE_REMOVABLE);
 		return;
+	}
 
 	hub = usb_hub_to_struct_hub(udev->parent);
 
-- 
2.33.0.685.g46640cef36-goog

