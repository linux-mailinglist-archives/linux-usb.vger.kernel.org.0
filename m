Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADFCD379CE0
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 04:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhEKCV5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 22:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhEKCV4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 May 2021 22:21:56 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C94C061574
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 19:20:50 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id o127so10200046wmo.4
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 19:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xuTa9QW15qGiXDyJSX0tRXGvf5SWM0xvRVeBiOug06k=;
        b=i7lYHSxCAp8Vl/OeAjeY7LMeHaw5mZ1WtiPCUcwzpdP5CHRWlMxWuDsrwVYqBb8iBd
         tDQE8xCSRm/KR9WtgV80xhKkFShiX9K6pzqYKh1W/Wi3AmXuF1tR0bpkbOo0VbtZImmb
         r0/veegBml8h6KGoswqpFS1aDgWSXakeiYnzLfQw2mX4f0MShHo1FQmza/JHBY1ejHhc
         dqZXvvnSMKG0JkGM4DYJgRkRJXzp5kMqlD6CP+Q5rvzeasKpF3zi8VnxY6f1dlY2Oz4o
         05xciL2MAq0jX1CXl515qh1bRJA8LOZC+1x2z7AAguUFiQ8aEf25toNj9HsOiRse6nKS
         7BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xuTa9QW15qGiXDyJSX0tRXGvf5SWM0xvRVeBiOug06k=;
        b=UZY+v+ALJBbsvN86LrR6XNlp4zhadJUDgip+CGCfdfms6cZcUOT2vB3LhuK9vIrJ4k
         Qc/OwEGNcruHf1uhrbcf+S1zCl0u9L+AyFCnEz/4KWRg/f6G5MxEqPc6GzJXTqiOi0ue
         rnMQEIWP64z1v8SHYae6m/ltZsHGUMbrlRtj/pOQQyBTRvQ/+O+cCEOKlEe6+uEKzD2P
         jxicl9pXzbkCj3jXra1TZtOLQLODofFpCO0SmgZMyQCGKEPXI6FKScc+kQMTOzA0NcWu
         Lr4IoPA7a1J3Q3EJq0HES/DRjXBXNRmE2gDjqwPSnTjlxEO48Uvv8Ihnaj5/KZ2Mkpbk
         66gA==
X-Gm-Message-State: AOAM532l+NSghZQKE5g+fyn4KKHK5T4rwPRnc70sv1kiQVNnTQlMBy6j
        DrhrvXORL8AbhpN5tmQGvzzE4Q==
X-Google-Smtp-Source: ABdhPJw14UgfcrGDiiLvNNVTGMISbige7TlGV2DiH9OJZsi8ajDzT7akyZAfvav+u4BuhGW2YZ66dA==
X-Received: by 2002:a05:600c:28d:: with SMTP id 13mr2372696wmk.183.1620699649350;
        Mon, 10 May 2021 19:20:49 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t18sm11792981wmq.19.2021.05.10.19.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 19:20:48 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 2/2] usb: typec: tcpm: Add a description for the init callback
Date:   Tue, 11 May 2021 03:22:24 +0100
Message-Id: <20210511022224.1309077-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210511022224.1309077-1-bryan.odonoghue@linaro.org>
References: <20210511022224.1309077-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The init callback is the only callback in the tcpc_dev structure which
doesn't have a description. The code treats the callback as optional but,
we don't document that.

Let's add a description making clear the callback is optional.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 include/linux/usb/tcpm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 42fcfbe10590..452a0bb9ec50 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -58,6 +58,8 @@ enum tcpm_transmit_type {
 /**
  * struct tcpc_dev - Port configuration and callback functions
  * @fwnode:	Pointer to port fwnode
+ * @init:	Optional; Called by tcpm_port_register() and tcpm_tcpc_reset()
+ *		to set the TCPM driver into a known initial state.
  * @get_vbus:	Called to read current VBUS state
  * @get_current_limit:
  *		Optional; called by the tcpm core when configured as a snk
-- 
2.30.1

