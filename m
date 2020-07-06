Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A11421589E
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729570AbgGFNgL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729268AbgGFNdy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:33:54 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6177EC08C5E1
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:33:54 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id w3so29666612wmi.4
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WegnVZ9DGyLW+kA2xpWSNAlVRAFvD3JLviW2wF/jZ6s=;
        b=xT+yupj9MavimR1wa5EZqEYTVTre9t7Il8BFvnEd4FOqKCV1obJEBkXayBjU4VTUpX
         EjG552aZP/iWzX7n5uCIBks2UnXw89KPGuPpFaGTfGBxeYUsPeDHCRpN2j7upHhRcoYp
         LKHDSdNN49TKwN3vrQQ3LH7oPAr3gSKkrpECRhZdCSuAfuNJxBkCyB4HSP+vs2T3balU
         /FH7pNPZ2YwlCJegT6qTrUN/oM2ejngS3tbIbVpgI0Y4EN1R+c5gIurEWJ+OMaofmHf4
         Xrrez6/t4LlVxxsjlS3b8/S+W4A2pXlnJB+OuOGyM5adoBRjPyRVSYVu37lfQ1r3xGMk
         vtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WegnVZ9DGyLW+kA2xpWSNAlVRAFvD3JLviW2wF/jZ6s=;
        b=Jfy7i5/iG6yfXVKzbRt2K07ci68WpVHy/ADPR4x6bzzLAG/la0AUETkkIys6/1fgcO
         3yTQ8rMwMHeM8KBZI7ux6MzxcAuhOiD2jtg0tyuuXCVY2Zg/gg3VuwyuYXZ55BgIAqCa
         lXcErOKrZUwDoXzhU/UWtSmpZQfpVrpFLKox3G6OVaW17epi3FVu7l/7g4vzGUSDIVR9
         ByGmOViy49bRB38FT+7UotdNwh7sPRxCIMf2z2990PhVlPdj6j/6tutK691IbL1lCHqi
         hUCs/CWMR9Iul80gSHfKCJXIRzajNUbODy64nuJ3dmjR2blrmtFSdU6Gt/CvYJ0y+RET
         DB7g==
X-Gm-Message-State: AOAM530+6DChqUw3DEcgJW3LKwxxD4RL5Q8Jx8oBd6vp94L3LkwCvFvs
        eZxD0J4sQbaSDi/TtsQSaQrAYg==
X-Google-Smtp-Source: ABdhPJyatwtDUIcCOL7ndILXzFNTrMtzJVDI0NWp8JnniRlD+OLzf4loG/6E3grgYnwIqqMACnTmYg==
X-Received: by 2002:a1c:48:: with SMTP id 69mr51473365wma.32.1594042433108;
        Mon, 06 Jul 2020 06:33:53 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:33:52 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Juergen Stuber <starblue@users.sourceforge.net>,
        David Glance <davidgsf@sourceforge.net>,
        david <david@csse.uwa.edu.au>,
        legousb-devel@lists.sourceforge.net
Subject: [PATCH 07/32] usb: misc: legousbtower: Demote function header which is clearly not kerneldoc
Date:   Mon,  6 Jul 2020 14:33:16 +0100
Message-Id: <20200706133341.476881-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/misc/legousbtower.c:280: warning: Function parameter or member 'dev' not described in 'lego_usb_tower_debug_data'
 drivers/usb/misc/legousbtower.c:280: warning: Function parameter or member 'function' not described in 'lego_usb_tower_debug_data'
 drivers/usb/misc/legousbtower.c:280: warning: Function parameter or member 'size' not described in 'lego_usb_tower_debug_data'
 drivers/usb/misc/legousbtower.c:280: warning: Function parameter or member 'data' not described in 'lego_usb_tower_debug_data'

Cc: Juergen Stuber <starblue@users.sourceforge.net>
Cc: David Glance <davidgsf@sourceforge.net>
Cc: david <david@csse.uwa.edu.au>
Cc: legousb-devel@lists.sourceforge.net
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/misc/legousbtower.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 8aca55c4c95f1..f922544056de4 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -271,7 +271,7 @@ static struct usb_driver tower_driver = {
 };
 
 
-/**
+/*
  *	lego_usb_tower_debug_data
  */
 static inline void lego_usb_tower_debug_data(struct device *dev,
-- 
2.25.1

