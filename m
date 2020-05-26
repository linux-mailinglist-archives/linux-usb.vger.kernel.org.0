Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F5E1CB4FE
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2020 18:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgEHQ3q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 May 2020 12:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgEHQ3q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 May 2020 12:29:46 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBE5C05BD43
        for <linux-usb@vger.kernel.org>; Fri,  8 May 2020 09:29:45 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l18so2584441wrn.6
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2020 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+iuOH/WKVgDwlOpqLtEZz1Xk/okLvZZF5WbQRpij0D4=;
        b=AQt+ZF9/H2qk/OzomabTHPI7WvMlnn1Z6hG6gqNJIe5EizYLqFoDrDWpINidOLAgaq
         qkxTNC5J00AzTlAZQvnF/dbaHsDAfE/fqpCtkW3hlE9kjdjAD2q5eUUncCpBNBKPnrdk
         2wk+lL8bnj8EForOpu5KW38XHvLpS//BMB7EkbmGLPrMNq3FjPdICxV0v9XVmU+jc4kp
         1fEPrrVGBkose3eZ3JXKQscdx2Fq7231IQxf8FdX6I8EeAomwFNy7dhjmQ01wP6ryr5h
         eH5eNWJrEHOenSXHxlSlCIxzCFu3/8/Fr8Nu6qAxo7p87nmqcfk0mWMEd+JSCV8IHaUm
         FvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+iuOH/WKVgDwlOpqLtEZz1Xk/okLvZZF5WbQRpij0D4=;
        b=ZuJQ3BoqU7RTVrE9onYxzmxDrAY2EclvVAGsFDgR1HNwlDHjS/hvFpLiJl4F3acYYB
         iVsfhbENX3SPiSO8aU96nOTJOOAJAuQDptDZjEQLTRsx+MG/OM1dcprL7QwcPlZRcb2g
         VTyVJipSr88yvstID9TRydv72M1oOZUV65Keg44FkXLjYyxlQ/iLCI1GVZ/CB5R53Yod
         rRFtGPZvG+X71Ghf+33eZeNE3dBLkoKQv87tgF5VIImauO8hDY6NC7Rnxivhd10BhcZG
         eKD82QN+9op1TlHSvqcRVNBZtSOlEC01nGxrUPeM8pPUIr2k4Wm+1YcOJ0oH0QaH565O
         fGbA==
X-Gm-Message-State: AGi0PuYD5iIIcfEKTrv5A8RUu0Xl3ig8uQ0PHUHhtkuDkXwHvRzLBZcL
        c7vqPyplxnQZGzkMuYjoIgg/RQ==
X-Google-Smtp-Source: APiQypIvwEN8ANKN3qCA5nhSd3XIXtCZSkyca1PpubPK0GASNJT8ODNwqlF/DEWhTVLbHg8aa6qFlA==
X-Received: by 2002:a5d:61c5:: with SMTP id q5mr3933822wrv.398.1588955384626;
        Fri, 08 May 2020 09:29:44 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id w15sm3602749wrl.73.2020.05.08.09.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 09:29:43 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, bryan.odonoghue@linaro.org
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wen Yang <wenyang@linux.alibaba.com>,
        chenqiwu <chenqiwu@xiaomi.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: roles: Switch on role-switch uevent reporting
Date:   Fri,  8 May 2020 17:29:37 +0100
Message-Id: <20200508162937.2566818-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Right now we don't report to user-space a role switch when doing a
usb_role_switch_set_role() despite having registered the uevent callbacks.

This patch switches on the notifications allowing user-space to see
role-switch change notifications and subsequently determine the current
controller data-role.

example:
PFX=/devices/platform/soc/78d9000.usb/ci_hdrc.0

root@somebox# udevadm monitor -p

KERNEL[49.894994] change $PFX/usb_role/ci_hdrc.0-role-switch (usb_role)
ACTION=change
DEVPATH=$PFX/usb_role/ci_hdrc.0-role-switch
SUBSYSTEM=usb_role
DEVTYPE=usb_role_switch
USB_ROLE_SWITCH=ci_hdrc.0-role-switch
SEQNUM=2432

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Wen Yang <wenyang@linux.alibaba.com>
Cc: chenqiwu <chenqiwu@xiaomi.com>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/roles/class.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 5b17709821df..27d92af29635 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -49,8 +49,10 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
 	mutex_lock(&sw->lock);
 
 	ret = sw->set(sw, role);
-	if (!ret)
+	if (!ret) {
 		sw->role = role;
+		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
+	}
 
 	mutex_unlock(&sw->lock);
 
-- 
2.25.1

