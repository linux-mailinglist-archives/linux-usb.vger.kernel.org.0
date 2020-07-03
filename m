Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE78213ECD
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgGCRmx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbgGCRmu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:50 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4569C08C5E0
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:49 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id q5so33547083wru.6
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=piaZjSKwN5mcD2WCsbLuxlkVKn2CDEU6jf4+7AdAFG0=;
        b=Dl3E5r/+ISNoKksiACvDF+AOJrMn8bNdiaS9+MMjXnyV7h+/tY761qxP6vpaTVO5hV
         m7KXm2vbCYtzbm/e6PB6/xlexgvuvMv3oDf8axHZks1ki2lYz/sQ7w+DyCufp4t32Pme
         Xbfd0e387SdGAJ9oE7JpPgQyS3h+Nutxu1tQoz0vTADACnL6ioQfDw+aA9HjCBXED5v4
         g0b4fm2MWSHFmv8lLrjJQqZyfvkM73myX3Tj/9pWFpkuw0jo2WZNxJ5/GxdTXjsJUejg
         JZ8HaIXZf6UoZA4CWj2d/5xj2lDYNjttntoG3XyQ0pLG7APG05lj0DVBGSJEos+i/Isv
         V5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=piaZjSKwN5mcD2WCsbLuxlkVKn2CDEU6jf4+7AdAFG0=;
        b=eswb2IsD69SSqk0i31oDt+qyfOzjT85F4PvVv79M8NVj8LV/jB2hayhFrj2So1uJaU
         MpVCi+MFTQEo+Xx051+eYmE/o64n6Kcea2S0H+CNhf97Y+r1WFJ4VddHwue+L0AQAdLZ
         7M0mVo5XeVBXAj2H6NstX2V3V8MuLbeu/Vvb+BqsBGG8oaRZ9/XO8AFKNEIllPMDKz7Q
         HRUtXy188O4VZBObzi2aZ1Ydi9WEsbc+VxCQJpkLwq/EbcP333itCrByEe0tXKEpakYR
         NRI5snGXBI46YbMtstNbxk8sR0qGsNCx70ycshxyxM0N8npmXkSgC9OaN8/Aiynnj9vJ
         wCKw==
X-Gm-Message-State: AOAM530tXYT4VyHvq9RB94rD5CKoetv9NHTUpp7b44J5hq0D0PmwFxP5
        amHfhF+fN+bVi22lm14BTnHV7Q==
X-Google-Smtp-Source: ABdhPJxhEOpZuuHTnIVb62hGJQJQm3MlFDlRAJw3+Es5D9qbc2oy4oi5j5/PHHfCqHf75Lcu2tEXCg==
X-Received: by 2002:a5d:4986:: with SMTP id r6mr36384666wrq.424.1593798168464;
        Fri, 03 Jul 2020 10:42:48 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:47 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 21/30] usb: typec: altmodes: displayport: Supply missing displayport.h include file
Date:   Fri,  3 Jul 2020 18:41:39 +0100
Message-Id: <20200703174148.2749969-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the header file containing a function's prototype isn't included by
the sourcefile containing the associated function, the build system
complains of missing prototypes.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/typec/altmodes/displayport.c:511:5: warning: no previous prototype for ‘dp_altmode_probe’ [-Wmissing-prototypes]
 drivers/usb/typec/altmodes/displayport.c:551:6: warning: no previous prototype for ‘dp_altmode_remove’ [-Wmissing-prototypes]

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/typec/altmodes/displayport.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index d617663b981dd..7b20073d7fc0a 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_dp.h>
+#include "displayport.h"
 
 #define DP_HEADER(_dp, cmd)		(VDO((_dp)->alt->svid, 1, cmd) | \
 					 VDO_OPOS(USB_TYPEC_DP_MODE))
-- 
2.25.1

