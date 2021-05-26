Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB9B39185D
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235039AbhEZNCr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234927AbhEZNCe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:34 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F38C06134C
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:02 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v12so1050553wrq.6
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0dnTAwnA+o8Rl6Vjmau/iU73tQSrbIJc4+Gm/DwQ8N8=;
        b=yzpRHfuAFiJ4nJRki9oj+LQQzpcpbJb2uP+be+5hC7r2Qt8OnrD6+KrKWDKnNuUj/c
         X55UMs7SbQnBOpSImIrawe7/2dcQyISDH40JFA60Z2tBxOvtul2Spxr5vriAA/ZJaPt9
         pdLTcjZIn65Y6qKc8dR9fSpEVO1Oq/m93HkkpCBlbiHBXct9w0gPMycwJ3HU8gxS8BxO
         KVZawzDCIphzcPs8olEFN2poev3L9YOHeEd29m/AJ3aFRFszSD7Xyd9PedF5TtQhttbB
         SbGbINnZMNlzcGX2BiDBqMSfcC+j8rlZNjDgJjaxrDO2S9OJZ9zBHKvuFts9EvndA0q3
         cbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0dnTAwnA+o8Rl6Vjmau/iU73tQSrbIJc4+Gm/DwQ8N8=;
        b=FofMeQ3GZ9eOZL6q5yDqa4ZceNANDZ/jYku0VgT8FaYGO92ynOlPlAS1MrXRm0r/Ge
         EHD1+tfCYbMTOH2i/0HHMfbfChxHTCfm7ElxFJaIPtzOx9WwR0B2QvEyhqIhD2OBs9kS
         xLTODtldXUNdSGehQhsGpz+Hkd8R0WlwdjQVPSzxQD36xSiXQ+OIL8O7LqAG9tRas35n
         bP1bwd9CSorXnE+An9/U6gI7Ul8tNgWw5oWAEOlTldrt0PV/kwyBxQsEYgZl7herRWn/
         q6wr37Y/B3ILw3z0MFVRiMbOnQ9dF7rUO6dbRUWFXu9JS79OH9OJQrMay8t9E8F58qc4
         SYeg==
X-Gm-Message-State: AOAM5314cKc8y/DmpyR9j8w7BQ8x47AEifUmqNU+p6awpQ/SoAfwuHvs
        GUrlm07JzFEPpvtJwlmlrL8L/vsQLERPHA==
X-Google-Smtp-Source: ABdhPJxb1ylryAcKdKx8sQgn4UqK0bwJM+U0craSVOZlcd77UaWqPnLsLAiePr+lGIqjKdwYVdmOtQ==
X-Received: by 2002:adf:efc7:: with SMTP id i7mr25188723wrp.421.1622034061209;
        Wed, 26 May 2021 06:01:01 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:01:00 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 14/24] usb: chipidea: otg: Fix formatting and missing documentation issues
Date:   Wed, 26 May 2021 14:00:27 +0100
Message-Id: <20210526130037.856068-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/chipidea/otg.c:25: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/chipidea/otg.c:78: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/usb/chipidea/otg.c:143: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/chipidea/otg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index d3aada3ce7ec2..8dd59282827b0 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -22,7 +22,7 @@
 #include "otg_fsm.h"
 
 /**
- * hw_read_otgsc returns otgsc register bits value.
+ * hw_read_otgsc - returns otgsc register bits value.
  * @ci: the controller
  * @mask: bitfield mask
  */
@@ -75,7 +75,7 @@ u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
 }
 
 /**
- * hw_write_otgsc updates target bits of OTGSC register.
+ * hw_write_otgsc - updates target bits of OTGSC register.
  * @ci: the controller
  * @mask: bitfield mask
  * @data: to be written
@@ -140,8 +140,9 @@ void ci_handle_vbus_change(struct ci_hdrc *ci)
 }
 
 /**
- * When we switch to device mode, the vbus value should be lower
- * than OTGSC_BSV before connecting to host.
+ * hw_wait_vbus_lower_bsv - When we switch to device mode, the vbus value
+ *                          should be lower than OTGSC_BSV before connecting
+ *                          to host.
  *
  * @ci: the controller
  *
-- 
2.31.1

