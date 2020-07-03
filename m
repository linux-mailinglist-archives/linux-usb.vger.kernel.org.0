Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68AA2213EC5
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgGCRml (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726904AbgGCRmh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:37 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7E9C061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:37 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j4so31132945wrp.10
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4LyTKYUD/bNIDavfKIyBUK2+LGfEs6fHGIsN/epbMTo=;
        b=j++rmjLVKGE8pJOki7KEkXap+ttuF0IaSJ6R4tm+0X3EML73Vhjgu0DH7+NuuLNCCD
         JyEYJgF4AJO9OF9F+dXlSbcsZ4hfZmufRZ7mHKpB0uGilNC44Gf015+rpII0D+viBkxj
         th5S9AKZbZ8/b3gT9djqWXTdE7pZIsUj4216ALlqOzZpsBv6E58rP1JsDo+zuz9pejHN
         838vbI10run4HOjp04xPaHKpJehh2FowRbeqDSSxGX/WpviiO0Cp2cyDOOqvHiaAasyk
         c14zkprb8zMmm9IuQ1yiY5UF103BP4+ILRruwvIcyNUtvwFlonPCnBrjhZIEnLf/lL0S
         2AdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4LyTKYUD/bNIDavfKIyBUK2+LGfEs6fHGIsN/epbMTo=;
        b=cotOg6y7bF6yvkdmWdV8gYu8IwyyOXE2y25GvpFGo6MVK5o71+tYTqEe7h34DI9yOc
         +e5V1g87KLZUoDFviFmKPP54DDwGG6oaSxv5JL6fSsgJ3cbnqqSFSFbATkhcEY5GM5+Q
         UYY6sAo1phKRmkO+dekp2EKTsuJi0N6r9eLpC71b3H/VL/G4phuai4rsGgA7rkG66K4j
         ik/NGmMa4nZkCA/XeeGfr3mI2JjD60xiTVuXHto0krMROPwd/242UzfKQKfGQv8qsua3
         pOh2sOqRmjp95MASChYhP+RPTwAUpIE+F9T1+bivzcXTLSC7hfhog4gVaxyZBW/QwSCP
         ++dg==
X-Gm-Message-State: AOAM533eM7nIG0m/E7LgmAxgdSk8vkta1cOYVcANVGESpx0KOeFI2el0
        OV56cwUAxN6d32WVHVSgTmmTWQ==
X-Google-Smtp-Source: ABdhPJwDyJ5bpWGdeInLOmwfSiVTjWV3CNpmNKaDGXCbrJXjPxmjv+Mf9nL5utsePleC77WQ0REJMw==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr37170423wro.214.1593798156340;
        Fri, 03 Jul 2020 10:42:36 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:35 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH 13/30] usb: host: xhci: Demote obvious misuse of kerneldoc to standard comment block
Date:   Fri,  3 Jul 2020 18:41:31 +0100
Message-Id: <20200703174148.2749969-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document the demoted function here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/host/xhci.c:1285: warning: Function parameter or member 'desc' not described in 'xhci_get_endpoint_index'

Cc: Mathias Nyman <mathias.nyman@intel.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index bee5deccc83d8..b90d61bb84144 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1271,7 +1271,7 @@ static int xhci_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 	return usb_hcd_map_urb_for_dma(hcd, urb, mem_flags);
 }
 
-/**
+/*
  * xhci_get_endpoint_index - Used for passing endpoint bitmasks between the core and
  * HCDs.  Find the index for an endpoint given its descriptor.  Use the return
  * value to right shift 1 for the bitmask.
-- 
2.25.1

