Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 521A734B8E4
	for <lists+linux-usb@lfdr.de>; Sat, 27 Mar 2021 19:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhC0S3J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Mar 2021 14:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhC0S22 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Mar 2021 14:28:28 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABD6C0613B2
        for <linux-usb@vger.kernel.org>; Sat, 27 Mar 2021 11:28:28 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id c1so8832507qke.8
        for <linux-usb@vger.kernel.org>; Sat, 27 Mar 2021 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=X45eDZbZ1G5E6KWs205oaawTbgGY1el7OrtpH5YicfE=;
        b=ugBxdy+F95hbZdPyYjmqGeP8SzM+DpBjPRJZcPWXytAsY1k+nz3/8EKi34dAH9WOBg
         23hoCetgwrEkMDIboJ+4+Z4mrYhyyYZxlXvpgKT54j1EKY1sDk9/smndOFswRCIFpTY+
         SZ6ct7ocSEBXCaOmqM/wxEgSvOliAgLLwVdQK+qBOlQSdnyD6ibZc/1S4RuhA8cc5bMV
         vLh+a1vqhaDn+kpaEJ6Zyr/ewdJtTfy4Rq2wvX7CS9kkek4x7jv/NWYNWB0XLm/cQkeW
         G2jQYOOV4sirkaBvtBstS9mrZXpBteQV9Xlra+qmxPsUOIBbuc8ImsV/YTIYhQ1/ZgC9
         czlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=X45eDZbZ1G5E6KWs205oaawTbgGY1el7OrtpH5YicfE=;
        b=J7GjArNi5vDtjOKDdjBBQDcIVGn72aYZHwmiRLJOANS1oZ+xDEPK0fdkt9CFrcCcTk
         wc9N0DtUZPdZhE6taqVTqQ0lxiPngf4xOyITb0tjxWEQOFJf7uIUIU37nXWT47bfZR7z
         8x01jLIMKKjhZx1y4pKodi9oHOKNnEklhHFDPrtj3cu33Msj83kTn+bJZUuDm8FJ7zCF
         KpiWb+w+tDVzCfnK3QFhG5/AkSS4rxLHFDHBAK1Y/OUXKxJcpEjv0P4EyJpeVe5WLTuH
         S27n0vmcxcWFmN5eAVR6MMGj8x/14/paAEt2fhZvU4SQ3PQK1sd8JiMVYCt+Yy/8wnHQ
         RXwA==
X-Gm-Message-State: AOAM533k21EUJJFotV3wRweuKs0mgR8TaijB76+AAt8eU2zygnZ5EWqu
        MQg8vcuo9/EH9HWy4+nKpAG0AlnF6Ew=
X-Google-Smtp-Source: ABdhPJzFbYU/AO5bbpshyBr3fNe2qpIRy0A3unQtF6tfkrKAfdwwJE+s0kUa34JdIl7oU+m1+xqLYG86Ams=
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:493c:e5b:69c:54cb])
 (user=raychi job=sendgmr) by 2002:a05:6214:18d2:: with SMTP id
 cy18mr18945606qvb.50.1616869707507; Sat, 27 Mar 2021 11:28:27 -0700 (PDT)
Date:   Sun, 28 Mar 2021 02:28:09 +0800
In-Reply-To: <20210327182809.1814480-1-raychi@google.com>
Message-Id: <20210327182809.1814480-3-raychi@google.com>
Mime-Version: 1.0
References: <20210327182809.1814480-1-raychi@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH 2/2] power: supply: Fix build error when CONFIG_POWER_SUPPLY
 is not enabled.
From:   Ray Chi <raychi@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, sre@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kyletso@google.com, badhri@google.com, Ray Chi <raychi@google.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The build error happens when CONFIG_POWER_SUPPLY is not enabled.

h8300-linux-ld: drivers/usb/dwc3/gadget.o: in function `.L59':
>> gadget.c:(.text+0x655): undefined reference to `power_supply_set_property'

Fixes: 99288de36020 ("usb: dwc3: add an alternate path in vbus_draw callback")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Ray Chi <raychi@google.com>
---
 include/linux/power_supply.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index 81a55e974feb..b495b4374cd0 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -426,9 +426,16 @@ static inline int power_supply_is_system_supplied(void) { return -ENOSYS; }
 extern int power_supply_get_property(struct power_supply *psy,
 			    enum power_supply_property psp,
 			    union power_supply_propval *val);
+#if IS_ENABLED(CONFIG_POWER_SUPPLY)
 extern int power_supply_set_property(struct power_supply *psy,
 			    enum power_supply_property psp,
 			    const union power_supply_propval *val);
+#else
+static inline int power_supply_set_property(struct power_supply *psy,
+			    enum power_supply_property psp,
+			    const union power_supply_propval *val)
+{ return 0; }
+#endif
 extern int power_supply_property_is_writeable(struct power_supply *psy,
 					enum power_supply_property psp);
 extern void power_supply_external_power_changed(struct power_supply *psy);
-- 
2.31.0.291.g576ba9dcdaf-goog

