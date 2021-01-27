Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B927E3059E1
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 12:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236891AbhA0Ld0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 06:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236749AbhA0LbI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jan 2021 06:31:08 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395FAC061221
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 03:26:13 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id i9so1317929wmq.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 03:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HRGqS1Ub4m0YbvVmKTGmVzBFWciGxN2mIYxOHlmuFFQ=;
        b=aFxHUHZG0if3sG9m3uw+QqOVHvX6FbbHalFoG7h6dCnk8s42nSq/jKBdsJWQ0Hbq4p
         Z1SlStAl/veU82UOU+zuLWWwwPLQ3cGM4aWLgam854/2L3ZjWICBDEz8GSvXFWMtWsCw
         Czr1b/cwT6ymhR4o6GQV05OUSWK+jB0PPmbzyMn97mKM6dRLyTMzBxAm/9pvaE+vm+oV
         T2X1eeb0gUgd1xgKH2lKqpimfTvBfTzOfy4i8/qK8IEUbSGBt1z/FaOn6uDoIwgZt4sj
         362O5PTo2SMXRygxmUwFf4dcnefnUgODnQurChgh1grzCXnDzJn5TQwuWRiFYMVZ8Y4k
         N77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HRGqS1Ub4m0YbvVmKTGmVzBFWciGxN2mIYxOHlmuFFQ=;
        b=BwzOdog09/kK6YmQTzkC6jMnXRUa4BvrbQ2BAwuRUd6qd56dQh0Pzm08rq6CEsF1MJ
         6BmQMXwz4rwXkVEU3ZXA4c12zpmPFk2pvDsiH6b+3Y9r9NIW5gY4IIPZ6i2ltJ4riD21
         SpNYNMSj6CF8BQ1sqdm5dXBKfxHtp7AxqldO+pLD0mZD80OJaec21V5vlfXMygFS1BLp
         ykrLhbbqPBAOV/eFBXsC/0G2vtXLZOWszT6SHc2uuZU3gTQF7ISEnf0ZvqkRwjQ13BrQ
         6TvYC+/Fek10a84s83bayFsuc9j00PQvrZYd2WQv3pstlumXQIRP/Qu8h1vhz902T68c
         xqNQ==
X-Gm-Message-State: AOAM533i8ie2NUSutHTz6JU/hdR9BHO5dzgSAMlucNf9rzuOXvO3Eq6e
        /OIe0L/9MMQ/Uq9/w5F78SyB1w==
X-Google-Smtp-Source: ABdhPJzG1p4TDwfwkVY8TRuVEWbSgCecvhUfiUzcBZpZEG7669W9TlG+ARfXy+Ebey91FVQPSqnGog==
X-Received: by 2002:a1c:dd08:: with SMTP id u8mr3766904wmg.121.1611746772007;
        Wed, 27 Jan 2021 03:26:12 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id m2sm2040065wml.34.2021.01.27.03.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 03:26:11 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 11/12] thunderbolt: tunnel: Fix misspelling of 'receive_path'
Date:   Wed, 27 Jan 2021 11:25:53 +0000
Message-Id: <20210127112554.3770172-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127112554.3770172-1-lee.jones@linaro.org>
References: <20210127112554.3770172-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/thunderbolt/tunnel.c:841: warning: Function parameter or member 'receive_path' not described in 'tb_tunnel_alloc_dma'
 drivers/thunderbolt/tunnel.c:841: warning: Excess function parameter 'reveive_path' description in 'tb_tunnel_alloc_dma'

Cc: Andreas Noever <andreas.noever@gmail.com>
Cc: Michael Jamet <michael.jamet@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/thunderbolt/tunnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index dcdf9c7a9caed..37943b0379abc 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -830,7 +830,7 @@ static void tb_dma_init_path(struct tb_path *path, unsigned int isb,
  * @transmit_path: HopID used for transmitting packets
  * @receive_ring: NHI ring number used to receive packets from the
  *		  other domain. Set to %0 if RX path is not needed.
- * @reveive_path: HopID used for receiving packets
+ * @receive_path: HopID used for receiving packets
  *
  * Return: Returns a tb_tunnel on success or NULL on failure.
  */
-- 
2.25.1

