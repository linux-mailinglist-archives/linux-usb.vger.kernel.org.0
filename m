Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BD4391861
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235106AbhEZNDA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234963AbhEZNCk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:40 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F69C06134D
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:04 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id q5so1051468wrs.4
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bL1w/TyfiFJcu/X6Y3NrGG0vEnjapJB2mxEC5b1yvwo=;
        b=nSRQrBuu15S//ToW697AAXBuwJM+LxUL4GiHmYPy//l6CON+A1BElVvQUu5vMiZZYg
         G/8yI0PsEWQBD6xfygXDcS0OL+alAAGIuwcGW04VcQADbHe8OY7f7RhCp/1la9QXoKZq
         bZ1ysZ3wduISXYz+dlUS8T74t0R2YxIC/RNBIlf0vec55AT/C2OwmMktvpQk5o36A6mq
         X0zqt/6VQF+BY6jBb174lUQuA5oesMI9k6zkQWFdlxKPc8Jhwq6aYfiZytZwLjkURApd
         b0jYcJsnvPCkyWZorl5jQs2Wg6oL2BNLKz0M9XuyafUAg0mu7ddCzVYfwCCQ9KGzxPz5
         Txyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bL1w/TyfiFJcu/X6Y3NrGG0vEnjapJB2mxEC5b1yvwo=;
        b=q570LpaF/whoykrYlZE7tYhKInt7CetEaR/zcnGEo41WMBrqp/cx0Q/v8RMhhmwUp/
         mwYNfM831J0Cw7kiKImoky2UW3W3DsaEsh3dPELINNEHXOEHE6QJjQjlbOgThsuPeowh
         KYo0s0a5esKq/Q8Uym0ffqHyacXz1lRKTRgQfTOwuLtpuRSaTJ6HksvF6D83p87qRY4L
         t56Lzv5A/Lm+dLH/9xCqe3rbQ8/j8aZNsozh032jUQ8Thhu+i7LIg4FeDRc81cRnJ2CC
         BOSQJNB8gaKaYcvkC96CwfXZhO8Hgkg7LesYaLpOoTkCGNWjzyyHl4DHI5jAUidHBVpX
         2P5g==
X-Gm-Message-State: AOAM530h6nN2q0ApM06RxLQ08ZbQ0MZFZm/EFGyhTSEuKYcA2Yv9izmG
        O3Gk7/BS401KmijZp3C0DSHPMA==
X-Google-Smtp-Source: ABdhPJzwc2Q3tnaigclY3/tzw7N8SkkIWVdQj0IOqM/IBRCMnxNpeFiqw6lLWakFupm7f/fCDKN0zw==
X-Received: by 2002:adf:f309:: with SMTP id i9mr33462818wro.307.1622034063292;
        Wed, 26 May 2021 06:01:03 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:01:02 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 16/24] usb: chipidea: udc: Fix incorrectly documented function 'hw_port_is_high_speed()'
Date:   Wed, 26 May 2021 14:00:29 +0100
Message-Id: <20210526130037.856068-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/chipidea/udc.c:247: warning: expecting prototype for hw_is_port_high_speed(). Prototype was for hw_port_is_high_speed() instead

Cc: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/chipidea/udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 393f216b91615..8834ca6137219 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -238,7 +238,7 @@ static int hw_ep_set_halt(struct ci_hdrc *ci, int num, int dir, int value)
 }
 
 /**
- * hw_is_port_high_speed: test if port is high speed
+ * hw_port_is_high_speed: test if port is high speed
  * @ci: the controller
  *
  * This function returns true if high speed port
-- 
2.31.1

