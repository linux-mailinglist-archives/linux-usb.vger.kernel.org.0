Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442412EB6C1
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jan 2021 01:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbhAFAQ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 19:16:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbhAFAQ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 19:16:57 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8A7C061793
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 16:16:16 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d26so840894wrb.12
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 16:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s9qDKqRXS/pzZqFMpxdsgZwVLxjM4iRHYGg6n80J9BU=;
        b=DJBm8e3udqvkK+jXPtg9e/ZJDdIkdf4PqcmFz+Yy5tW0ay3cAYL1HnGMIevObGpFYy
         PMgSos/2lq9Sv92e3lw0D5XyDm6c1oM2PPmeh8ffGczKaWWEPARuMDOwJ54DL2Gqb4eC
         vG3lxl9bsnYCWRGkL7c1jaF+lbFrikrSWLKFKzbWLAm23pDYN5VHlHViXdJpNVinRb+8
         pvv5cTV9TK2mO1iP+Vk6cduPhrD0XFwLGTnvvU/bOD2cRyNrXq6cEXeSGIaT5pvPXtRD
         UIPXriOfSKvx7YHImU+WJY3VQaaHJNDc8gat9nY+9IX37O2nFzm7fTyVYAvzB8D65q6o
         uMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s9qDKqRXS/pzZqFMpxdsgZwVLxjM4iRHYGg6n80J9BU=;
        b=UeHgLLj9WFfvgKI+frE5IW6FcliJZQ70q6I+YkDMpVx5Gof6g2ifEn/Ssq/THD2uUI
         dih0Cax/wHErnStnA18FJR3frW33EXrfRzqPA8H1lb2jGQ4Zw/F3liSBMOWfyk0FY1R6
         7FkBR3fbYYG8KgD4h30Bdu20fTeDrjyBCJ4VBCUKSlSV/+dSfiNye17lZ2xebM1LPe1X
         Ss8Bjjn61o5OaBtz6tfIOmh/bEAfhpR0ml+3lFRS1A/lSPvDsJCDYl6NvMRbuRcSRtBc
         /l2ah91cPC0nBqT1UmwbKhQWh4kydV3BIw5gxvoAgsjixdXTjHnUZHsUwVN/IhWy7IRN
         l+KQ==
X-Gm-Message-State: AOAM532T9YL5l4GwCmRJot6cllCtRJcVl6Mm1mHXLwqXvb8dFqDY47Xg
        C7tjVO4fUeZnqRJ6RLsiYgRvZK9fYDI=
X-Google-Smtp-Source: ABdhPJyhnJXHVKI3fbgx+5oEJug4oBvsFLnl9/TafQN5ODlAga3xjkc7OcgkfPjkISrHLb6E3bp9zg==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr1813039wro.292.1609892175258;
        Tue, 05 Jan 2021 16:16:15 -0800 (PST)
Received: from morpheus.roving-it.com.com (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
        by smtp.googlemail.com with ESMTPSA id r13sm855574wrt.10.2021.01.05.16.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 16:16:14 -0800 (PST)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] usb: typec: Fix copy paste error for NVIDIA alt-mode description
Date:   Wed,  6 Jan 2021 00:16:05 +0000
Message-Id: <20210106001605.167917-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The name of the module for the NVIDIA alt-mode is incorrect as it
looks to be a copy-paste error from the entry above, update it to
the correct typec_nvidia module name.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Ajay Gupta <ajayg@nvidia.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/altmodes/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
index 187690fd1a5b..60d375e9c3c7 100644
--- a/drivers/usb/typec/altmodes/Kconfig
+++ b/drivers/usb/typec/altmodes/Kconfig
@@ -20,6 +20,6 @@ config TYPEC_NVIDIA_ALTMODE
 	  to enable support for VirtualLink devices with NVIDIA GPUs.
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called typec_displayport.
+	  module will be called typec_nvidia.
 
 endmenu
-- 
2.29.2

