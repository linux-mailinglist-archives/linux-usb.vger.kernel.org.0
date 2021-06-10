Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B95B3A2162
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 02:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhFJAZ3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 20:25:29 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:40781 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhFJAZ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 20:25:28 -0400
Received: by mail-oi1-f180.google.com with SMTP id r17so173253oic.7
        for <linux-usb@vger.kernel.org>; Wed, 09 Jun 2021 17:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wqda7Y7VY751qiHwi67sa4oN0nY0qPs95IMKdq6kzvM=;
        b=hyD8x/fW6GsldHTArxMhnA3R2kAL+eRuDK38kF7nsv5rweEFUVlvRsFIq6YnB/7G7U
         uCY0EuD3R3D/Sq/7xCriTow2Z7n/EMAG1FrdVT/hthzlVPFZxKrrzzhzsNaBqqtrudiY
         OcE1q4nf7JwnnYlB0lO2frXfbpbs52WiGebqGZXaM8Q6i7iL/naSM8D6ZgJ+un3L+sfS
         WM1ETk/18IMXsa/7NKdO6HtTIBrljKQCE4WngS4rmUhG67CpTvNK22OnCkOu02jXjJxu
         pvkwKHxYTTVj/0YMDyz1cJxj4tS9qWJswwXS24ml9AurGJXhCX2qRUlNQHyUmtYdTHNk
         sFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wqda7Y7VY751qiHwi67sa4oN0nY0qPs95IMKdq6kzvM=;
        b=pjJeemXqm8z42JlQZ6YF7cc2g1Z6LrjupR8srH4ffyMXJI/xGeT/QLQ+XlHKzZL174
         tDnliXucjAXurESgMKWcjry+/xofU1qOskK3PHPe1FBszyDMioDzGnCfebajj9pyl6sh
         16qbrQGUdZnVQ0zEivVZ46AbWOE+/qL0oC3oCInzR1vaGxZBThZdqaPxcWOkRXT7xMKh
         5EsmghuMx/SJ+GmSyn1VLbHZL5svHHbOeXlmWAkozNsETUkjDbs8P/KBkmYYS84ThvwY
         lmX3TC0IImxxG2u8Chm1AvPhYhpdjpx4AA32OCMIkWo3uNo00a+mPuOqSS3QTiM5AkZl
         KPRA==
X-Gm-Message-State: AOAM5302pDavh5oaYho0YTYdJwXHYPp3o3EX4asEAOXX0YfWnQjgdMrW
        mE7jZ7ZusfSbwzCIkrxsvwkHZg==
X-Google-Smtp-Source: ABdhPJyNWi8kzQXPfxhp1H+j0xAp/kCFS4t+JKbUxUDX2zvHdnv+7i0GONlblnouQYxwNWuqlC0Kzg==
X-Received: by 2002:aca:3e06:: with SMTP id l6mr1521121oia.147.1623284541085;
        Wed, 09 Jun 2021 17:22:21 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z19sm319048oth.20.2021.06.09.17.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 17:22:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: typec: mux: Fix copy-paste mistake in typec_mux_match
Date:   Wed,  9 Jun 2021 17:21:32 -0700
Message-Id: <20210610002132.3088083-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the copy-paste mistake in the return path of typec_mux_match(),
where dev is considered a member of struct typec_switch rather than
struct typec_mux.

The two structs are identical in regards to having the struct device as
the first entry, so this provides no functional change.

Fixes: 3370db35193b ("usb: typec: Registering real device entries for the muxes")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Don't touch the typec_switch part of mux.c...

 drivers/usb/typec/mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 664fb3513f48..c8340de0ed49 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -246,7 +246,7 @@ static void *typec_mux_match(struct fwnode_handle *fwnode, const char *id,
 	dev = class_find_device(&typec_mux_class, NULL, fwnode,
 				mux_fwnode_match);
 
-	return dev ? to_typec_switch(dev) : ERR_PTR(-EPROBE_DEFER);
+	return dev ? to_typec_mux(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
 /**
-- 
2.29.2

