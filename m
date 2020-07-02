Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588C42126DB
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbgGBOsj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730003AbgGBOqv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:51 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EE43C08C5DD
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:50 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l17so27118414wmj.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kl7sz8QA1tp3BsjE/r0OSQuznzm9IU6toz3QDXE6srY=;
        b=C4y+MyvzGjWT5mo+mg50PzeIgmLfB6enO3CDM4ud6BHtsMBDG6WYTz5E/zlNT5bdVN
         uqOGQzeXk+cQ9C88ep5Os/SO4JLiJpIMBtkWnibMng/BdShwRCdWzGivNel5W0u3loQo
         kA9lKtjOxrgy/hdPR3YBZZdVmRYNRZQY5zkRqOB5KvC2jAoY0BasgzIweMUopiIXCw6h
         nSFj2pB8cwQoI/PgQzlyWAUKi0Zhb7CX58t3cqgORy4DcYy93PevYKZRsF7oDt5MeJUA
         mwb9uf/Cl44mu/3TC9lpgE4PNlm+bJknnnITiHC5ced76dYl7/QC6pirP7P+PJ8GC3NT
         LfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kl7sz8QA1tp3BsjE/r0OSQuznzm9IU6toz3QDXE6srY=;
        b=CenxT8MybAfi6GSuMztvrLQKhRrIQFV+rOVvKaqPkYzcPAYz1bKmH/uMJHJFWAbkKh
         XyW1/JCwo0sE3WKdz5P+eKAe5Z58G8LfXIWm1lrrFoPBGQto9OHVlDzhzru+UokR18vV
         fMmjrrf9IiN8oOdsBLPUiD276oHjDabM0+2DNlaQZEKuvjjzMHN9WB97hp+ykmtb2U3G
         Z86m/xdNsQJ4ZXR8i0bCUHEsyGG9s7NEe3h2vmydk4As7o5opxGGaMtcibRs8jjxHnnY
         netnupEgQEBIxQqcFK+ApQ9iPWWhTEqu0pOl2/1f90AQckjC5Ys+Bm73M1TgvvfEgLDX
         ubIg==
X-Gm-Message-State: AOAM533jMQHHr2xHQZjFKqF0XSMSHtGkUymBC+wNDU4lf9vplZy5GwwS
        t+z0Up/YzIBfbKpbqwfo+/nuAA==
X-Google-Smtp-Source: ABdhPJx7VJnF3IZsz1knssd5zApJ5vUeYhNVJHgmwD44/LNnJPIxKZZCahG6RssJD9o76EkSSK6XMA==
X-Received: by 2002:a1c:e914:: with SMTP id q20mr30734859wmc.145.1593701209352;
        Thu, 02 Jul 2020 07:46:49 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:48 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Pawel Jez <pjez@cadence.com>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 14/30] usb: cdns3: ep0: Fix a bunch of kerneldoc issues
Date:   Thu,  2 Jul 2020 15:46:09 +0100
Message-Id: <20200702144625.2533530-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add some missing function argument descriptions for 'ep', 'desc'
and 'zlp', and correct spelling/bitrot issues surrounding the
correct spelling of present args.

Fixes the following W=1 warnings:

 drivers/usb/cdns3/ep0.c:36: warning: Function parameter or member 'zlp' not described in 'cdns3_ep0_run_transfer'
 drivers/usb/cdns3/ep0.c:236: warning: Function parameter or member 'ctrl' not described in 'cdns3_req_ep0_get_status'
 drivers/usb/cdns3/ep0.c:236: warning: Excess function parameter 'ctrl_req' description in 'cdns3_req_ep0_get_status'
 drivers/usb/cdns3/ep0.c:411: warning: Function parameter or member 'ctrl' not described in 'cdns3_req_ep0_handle_feature'
 drivers/usb/cdns3/ep0.c:411: warning: Excess function parameter 'ctrl_req' description in 'cdns3_req_ep0_handle_feature'
 drivers/usb/cdns3/ep0.c:661: warning: Function parameter or member 'ep' not described in 'cdns3_gadget_ep0_enable'
 drivers/usb/cdns3/ep0.c:661: warning: Function parameter or member 'desc' not described in 'cdns3_gadget_ep0_enable'
 drivers/usb/cdns3/ep0.c:671: warning: Function parameter or member 'ep' not described in 'cdns3_gadget_ep0_disable'
 drivers/usb/cdns3/ep0.c:867: warning: Function parameter or member 'priv_ep' not described in 'cdns3_init_ep0'
 drivers/usb/cdns3/ep0.c:867: warning: Excess function parameter 'ep_priv' description in 'cdns3_init_ep0'

Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Pawel Jez <pjez@cadence.com>
Cc: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/cdns3/ep0.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
index 82645a2a0f529..5b3f682338e50 100644
--- a/drivers/usb/cdns3/ep0.c
+++ b/drivers/usb/cdns3/ep0.c
@@ -227,7 +227,7 @@ static int cdns3_req_ep0_set_address(struct cdns3_device *priv_dev,
 /**
  * cdns3_req_ep0_get_status - Handling of GET_STATUS standard USB request
  * @priv_dev: extended gadget object
- * @ctrl_req: pointer to received setup packet
+ * @ctrl: pointer to received setup packet
  *
  * Returns 0 if success, error code on error
  */
@@ -400,7 +400,7 @@ static int cdns3_ep0_feature_handle_endpoint(struct cdns3_device *priv_dev,
  * Handling of GET/SET_FEATURE standard USB request
  *
  * @priv_dev: extended gadget object
- * @ctrl_req: pointer to received setup packet
+ * @ctrl: pointer to received setup packet
  * @set: must be set to 1 for SET_FEATURE request
  *
  * Returns 0 if success, error code on error
@@ -653,6 +653,9 @@ void cdns3_check_ep0_interrupt_proceed(struct cdns3_device *priv_dev, int dir)
 
 /**
  * cdns3_gadget_ep0_enable
+ * @ep: pointer to endpoint zero object
+ * @desc: pointer to usb endpoint descriptor
+ *
  * Function shouldn't be called by gadget driver,
  * endpoint 0 is allways active
  */
@@ -664,6 +667,8 @@ static int cdns3_gadget_ep0_enable(struct usb_ep *ep,
 
 /**
  * cdns3_gadget_ep0_disable
+ * @ep: pointer to endpoint zero object
+ *
  * Function shouldn't be called by gadget driver,
  * endpoint 0 is allways active
  */
@@ -690,6 +695,7 @@ static int cdns3_gadget_ep0_set_halt(struct usb_ep *ep, int value)
  * @ep: pointer to endpoint zero object
  * @request: pointer to request object
  * @gfp_flags: gfp flags
+ * @zlp: add zero length packet
  *
  * Returns 0 on success, error code elsewhere
  */
@@ -858,7 +864,7 @@ void cdns3_ep0_config(struct cdns3_device *priv_dev)
 /**
  * cdns3_init_ep0 Initializes software endpoint 0 of gadget
  * @priv_dev: extended gadget object
- * @ep_priv: extended endpoint object
+ * @priv_ep: extended endpoint object
  *
  * Returns 0 on success else error code.
  */
-- 
2.25.1

