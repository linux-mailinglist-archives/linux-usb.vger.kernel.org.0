Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE01213ED2
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgGCRnD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbgGCRnC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:43:02 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E99C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:43:01 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z15so22290265wrl.8
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pvsQ2j2MIPqkZ3jkOQAkyhlMqXenxaz7Doasiynl+ug=;
        b=k1VNV8Cq6YZ7ALXAmL5SY7ZkZfumiTzDFOzauoO28aylJDHFQFNlPWaN6vTjNXCwp7
         8pA/rt/83pE8YtL+zcZUXuRVoFtqfnp7lThQHbVkywE49Yko32o288yP4Ap725xsFmNy
         u0AbX34iOhF9iVrTlF8M8O98Bhmq3RhZ3ArhLg8gNPwyg1MQHzEQ5ATD7+W4aHbxOjxR
         +IiPmILgTdIinpTc97X9LofUDKxr/mU/xEmv+I8GeMYxioHZvlDPcbe3YiTbDW9rluOS
         r9aQUCOhNZ2UIoi4q2atKUd2YUrddfAmU//sgzTcbNN2qn9sssku+0kCWIRhF7YoIcKS
         hZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pvsQ2j2MIPqkZ3jkOQAkyhlMqXenxaz7Doasiynl+ug=;
        b=aIWEFsRw6ld+g1PY35AhIRlkB6LrqYp3yr15HtcibAoarqlUpPS6EBvSg4WWz/uqdh
         QzP+qYgcqxmb3NHo36MmP/eeVE88dWLfdxAJkqi9XMMoOppBBZtf9EIolhBHPMy51IrY
         8r2yvAWFWCAdzqVihU0xNlqczMwcKRjmiz+rmVpTQzdg4vGLPBF6Wp4LVD5ImBMpaq6A
         KxOhvOkG0WPVVG9lQK3iuwZQy9BfNk90+M/qf/6mw0ohQg5Pkbpw73hvCKEJTgkx+ndF
         WOCG1vZxhU62miEqMcBfXaa9tLZpHMAoQqymRDU5WMxiffy2QcOC2gQwVkuiisOCJzSE
         VcQQ==
X-Gm-Message-State: AOAM531TMTFPYoRzso4znjkJKHhuH9OIU/zrJq32Fgabv2xe3MM+YEjA
        GGSvu7GpfIyDs1kfy86TFKm80uLj4OY=
X-Google-Smtp-Source: ABdhPJz1kSkGpmf1AnLPdELh2Lnx7y6qmm+BDs31oGtdoZk4KTfJ9gMkrVTg58SfWr2MzMbZhcatcg==
X-Received: by 2002:adf:f203:: with SMTP id p3mr9397409wro.331.1593798180531;
        Fri, 03 Jul 2020 10:43:00 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:59 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, Bin Liu <b-liu@ti.com>,
        Ravi B <ravibabu@ti.com>, Kumar Gupta <ajay.gupta@ti.com>
Subject: [PATCH 28/30] usb: musb: musb_dsps: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Fri,  3 Jul 2020 18:41:46 +0100
Message-Id: <20200703174148.2749969-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document any of the demoted functions here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/musb/musb_dsps.c:44: warning: cannot understand function prototype: 'struct dsps_musb_wrapper '
 drivers/usb/musb/musb_dsps.c:102: warning: cannot understand function prototype: 'struct dsps_glue '
 drivers/usb/musb/musb_dsps.c:169: warning: Function parameter or member 'musb' not described in 'dsps_musb_enable'
 drivers/usb/musb/musb_dsps.c:195: warning: Function parameter or member 'musb' not described in 'dsps_musb_disable'

Cc: Bin Liu <b-liu@ti.com>
Cc: Ravi B <ravibabu@ti.com>
Cc: Kumar Gupta <ajay.gupta@ti.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/musb/musb_dsps.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index 88923175f71e5..71660491557f8 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -36,7 +36,7 @@
 
 static const struct of_device_id musb_dsps_of_match[];
 
-/**
+/*
  * DSPS musb wrapper register offset.
  * FIXME: This should be expanded to have all the wrapper registers from TI DSPS
  * musb ips.
@@ -96,7 +96,7 @@ struct dsps_context {
 	u32 rx_mode;
 };
 
-/**
+/*
  * DSPS glue structure.
  */
 struct dsps_glue {
@@ -162,7 +162,7 @@ static void dsps_mod_timer_optional(struct dsps_glue *glue)
 
 #define USBSS_IRQ_PD_COMP	(1 << 2)
 
-/**
+/*
  * dsps_musb_enable - enable interrupts
  */
 static void dsps_musb_enable(struct musb *musb)
@@ -188,7 +188,7 @@ static void dsps_musb_enable(struct musb *musb)
 		dsps_mod_timer(glue, -1);
 }
 
-/**
+/*
  * dsps_musb_disable - disable HDRC and flush interrupts
  */
 static void dsps_musb_disable(struct musb *musb)
-- 
2.25.1

