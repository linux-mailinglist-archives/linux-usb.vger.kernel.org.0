Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9DE213EC4
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgGCRmk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgGCRmj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:39 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F7FC061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:38 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z15so22289154wrl.8
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7eNVLa4hjk02Jz2SQUwzwLQ41aN0q3Km5pJHjYU/rio=;
        b=vMQ8eZA1CVkGFvX8S60GAhdmZPsB9rQNsmkoQFo2oYnXndISyZCgsg+4zxHt6jdFwd
         +Jr9x7VcoLu8QL2a+ksPn6/BHqcB/BxvRdM7XeF5wlOqwC465GuHkedkU/DomxW3+G9g
         o8M4UHC7PgYI9IHEbJRrXkZRFEyibaCx5yj1L1IjA34jJhLJmOEFoWL5TSZB9xbQzti0
         n0hAtXHU95HcmA/LY31X2Wyr44VjZSdGjf22nMg2VaDPHj5pSMR0+rol5lpSmMDnkS6R
         L5lDo/RWgKUglug4pXnH6NcSkbqZmTV19sMvhpBHX+0z3HunhrUo4tR+y7awHGLQuWd5
         icMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7eNVLa4hjk02Jz2SQUwzwLQ41aN0q3Km5pJHjYU/rio=;
        b=dZLR9rE9T/da4BSo43vGLaiZY3nSyCtS6MdlN9S4QDXQb7EFsmMqjfx7+Pvk3b2qEd
         KBdo/WsOUlAFqcqK/tRI4oov+Zclt8vNEhu0HxapVO/s76T/LSHnshZHGSMFjrTpB87N
         er8fHWOK8T33TkvPQQKZV7LFlSKldqq2oqMj5YTCp2DwCFcAnl+bIi+wp1y14epg6KHz
         6koXvGH9eqbxD1rcMDXihj3z/heXwCeGZfVJJtvTed2/fUDKgM1/7LDpM2SbM3P7zlUi
         uAyjx7KlUvZYUC62yg2u3s756WNnonh3e8pEzcuI2VsCgG/oZqg3t3ZmPiKnwzsyOCT/
         sMDw==
X-Gm-Message-State: AOAM533vm8A+Yt9QTJe7xprXs1HY/AbF/wBVKJJJGJqRyteoPG6e/V1t
        7W0ornyucdOi4x3s5H3jXDg8Fs+bjE8=
X-Google-Smtp-Source: ABdhPJx2o0YkTTmj44f3mUJGFAhlHMkc6BactSo26Kbv16QRGRZrY63SVbxt7C9PpaVBYfWIgzuQSg==
X-Received: by 2002:adf:e50a:: with SMTP id j10mr40298877wrm.71.1593798157484;
        Fri, 03 Jul 2020 10:42:37 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:36 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH 14/30] usb: host: xhci-mem: Demote obvious misuse of kerneldoc to standard comment block
Date:   Fri,  3 Jul 2020 18:41:32 +0100
Message-Id: <20200703174148.2749969-15-lee.jones@linaro.org>
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

 drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'xhci' not described in 'xhci_ring_alloc'
 drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'num_segs' not described in 'xhci_ring_alloc'
 drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'cycle_state' not described in 'xhci_ring_alloc'
 drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'type' not described in 'xhci_ring_alloc'
 drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'max_packet' not described in 'xhci_ring_alloc'
 drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'flags' not described in 'xhci_ring_alloc'

Cc: Mathias Nyman <mathias.nyman@intel.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 9764122c9cdf2..fb221c0914780 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -352,7 +352,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 	return 0;
 }
 
-/**
+/*
  * Create a new ring with zero or more segments.
  *
  * Link each segment together into a ring.
-- 
2.25.1

