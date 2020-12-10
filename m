Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5275C2D6992
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 22:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404708AbgLJVRx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 16:17:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404706AbgLJVRs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 16:17:48 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F0EC0613D6
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 13:17:07 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id r4so3435815pls.11
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 13:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LV0Dw31yyAP5jAfVhRThIAzxxlOQnv5oimA5Y/7MJ8w=;
        b=Qml+XfHV11xyFUrSDVpeuQ90D3/lSIbILP2Pr8h9EQc3dCFdN/PFuhbHUbFTYzg3G5
         U7BmrSW81dVg1sbDN1+pn6Z1P7d+6jskw2doPBhzQZcrQ++3lzR+0R85fxBs4qxQAcKc
         dD5n3fv6JAYmIS5r6jbqanDzCf1dbzzeNP5lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LV0Dw31yyAP5jAfVhRThIAzxxlOQnv5oimA5Y/7MJ8w=;
        b=pCu1xmDN7jSXyv+a3ZXEmh074PucHMflnilMXnikGZkIhJGzWEMQw/gQpqxWc826Ye
         xC05lOjhNN7vwATHN3Uyc4pq0whOpCfCA0uBc4L0iNIXEY2R0vF5ChtTwYjbIBIHFgyk
         nYz5CwDETLrK4OYRM6rUET64l2Feh1Y8vpD9FLmZ+rJcycuyouKuE11jcWhkOrrZ7t2y
         jCUX7WX00ZFMs+H/qcTwR8G0MijM+itxGEigV3DuaJQw4n6VOuLkUOm/WoI5Z1fX9B2H
         RmdYhjQBBjMy8FnaxYTeHq635Ow5/5+5Q7xLKQinuAM9iRrEaVauv6+F5No4B/+4QKMH
         kasg==
X-Gm-Message-State: AOAM531sd04hUTYQV7pn+jrgb19TLJakF9KjwroAQ4gTu/5aAXXd8Sul
        k/678UV4hWzFJzZNLx7UFQC4QCorEuI4wA==
X-Google-Smtp-Source: ABdhPJzRtjRgaltaTKa4mf0uNF34yuhkCIDTw8dnkQAlpD49E/WF4Gql/oLDsYiDhIWYAjMSJDWeLw==
X-Received: by 2002:a17:902:c195:b029:db:c725:24d1 with SMTP id d21-20020a170902c195b02900dbc72524d1mr7963995pld.28.1607635027115;
        Thu, 10 Dec 2020 13:17:07 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id c62sm3681653pfa.116.2020.12.10.13.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:17:06 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] usb: typec: Add class for plug alt mode device
Date:   Thu, 10 Dec 2020 13:16:54 -0800
Message-Id: <20201210211653.879044-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the Type C class for plug alternate mode devices which are being
registered by the Type C connector class. This ensures that udev events
get generated when the plug alt modes are registered.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

Changes in v2:
- Changed code to set the class member instead of bus.
- Removed the alteration to typec_bus.rst since it's not longer
  required.
- Updated the commit message and subject to reflect the change in code.

v1: https://lore.kernel.org/linux-usb/20201203030846.51669-1-pmalani@chromium.org/

 drivers/usb/typec/class.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 35eec707cb51..29d05b45cc9d 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -482,6 +482,10 @@ typec_register_altmode(struct device *parent,
 	if (is_typec_partner(parent))
 		alt->adev.dev.bus = &typec_bus;
 
+	/* Plug alt modes need a class to generate udev events. */
+	if (is_typec_plug(parent))
+		alt->adev.dev.class = typec_class;
+
 	ret = device_register(&alt->adev.dev);
 	if (ret) {
 		dev_err(parent, "failed to register alternate mode (%d)\n",
-- 
2.29.2.576.ga3fc446d84-goog

