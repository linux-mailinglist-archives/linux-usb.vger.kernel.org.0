Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77828371E4C
	for <lists+linux-usb@lfdr.de>; Mon,  3 May 2021 19:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbhECRUQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 May 2021 13:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbhECRUN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 May 2021 13:20:13 -0400
Received: from mail-oi1-x249.google.com (mail-oi1-x249.google.com [IPv6:2607:f8b0:4864:20::249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE96C061761
        for <linux-usb@vger.kernel.org>; Mon,  3 May 2021 10:19:20 -0700 (PDT)
Received: by mail-oi1-x249.google.com with SMTP id c3-20020a0568081383b029010231e3ec8cso3473577oiw.22
        for <linux-usb@vger.kernel.org>; Mon, 03 May 2021 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=kRTl6/sXAc8KmXy+W6gst+5/cWsH2BSF7FQfc4l1psA=;
        b=m2KLbMxep4kkPHVGIQ5oukf6jcbNwITbQGZzOKSVEhd8hJc1DFOEcMkuFJA51Deqqf
         UCRvOcRF2JE4hfsQoZDyHjyaQ1mnwTo5ujmYt0dgrDqXqi7n5ZPGw72mJJvH0RgANX4A
         Cd0az3rN5tk3x1pVsZP/jx+CaIp3w/7ubw+Ly4Fmwi+0kapJ3tCLowLy7cDafhTzrD2K
         UcDKvE0YmxMwRaoRuv10fuwGb4uzMUyq8WHHDTfqQ5nvYllr6BEkSI0otfFw+o2a+D+S
         +hIASOWCkIon7/CgvIVk5dNUWzNKTFLFTMLKS3PN+SykECIiUuZb6aCw3b3xMqCB0AlF
         +CvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=kRTl6/sXAc8KmXy+W6gst+5/cWsH2BSF7FQfc4l1psA=;
        b=c1PL1cH1yD1jXTpPJ0M0LB93gLrA/d9UJLoYwPI3s0Z8Gsp9lz76fXDdHCau5huFVY
         CVo6Yf21r8jUOw53WkpcE14ZcVWBNDnZxSSg1LVlrKe/ROWcYjlWsofPehkqqlia/Xlw
         jVlmyZjr69Yqh+trtF+7Cf3+n8pMwpFbCNB2UrSbBfw177yE+9XNDofj72EAXldJ0V0+
         XMhl1JAjoCdqDz1SakbOuvre7eeXAyyd+3yYe2XetSKR6C++AaXOBh8uTm44c9nDJR2P
         mUUJfCBoCSLKvY76u76gZhB3aF1hYu2ynPlqBmvRf3rUoAF0njnGjOi4axrpMH/1D7Ew
         TijQ==
X-Gm-Message-State: AOAM5332ZvYV4TpU4V1yiQF2XIJmcveaTFODULXaWR2QEQ2uGlheNz8p
        1XDBoP0Q+NYMOADnhIdCi/u1GHlUdE9f
X-Google-Smtp-Source: ABdhPJzH0kwfJ8i7nTNUjn4IAvfrLK/3atJih6tzV9pw/3Yb4yFdo/q9o3upacsDzji3qn7xVu3I2XZNXGj4
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:7bdb:2b58:f6b1:a854])
 (user=kyletso job=sendgmr) by 2002:a25:76ce:: with SMTP id
 r197mr13677287ybc.23.1620062348857; Mon, 03 May 2021 10:19:08 -0700 (PDT)
Date:   Tue,  4 May 2021 01:18:49 +0800
Message-Id: <20210503171849.2605302-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: [PATCH] usb: typec: tcpm: Fix wrong handling in GET_SINK_CAP
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After receiving Sink Capabilities Message in GET_SINK_CAP AMS, it is
incorrect to call tcpm_pd_handle_state because the Message is expected
and the current state is not Ready states. The result of this incorrect
operation ends in Soft Reset which is definitely wrong. Simply
forwarding to Ready States is enough to finish the AMS.

Fixes: 8dea75e11380 ("usb: typec: tcpm: Protocol Error handling")
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index c4fdc00a3bc8..68e04e397e92 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2390,7 +2390,7 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
 		port->nr_sink_caps = cnt;
 		port->sink_cap_done = true;
 		if (port->ams == GET_SINK_CAPABILITIES)
-			tcpm_pd_handle_state(port, ready_state(port), NONE_AMS, 0);
+			tcpm_set_state(port, ready_state(port), 0);
 		/* Unexpected Sink Capabilities */
 		else
 			tcpm_pd_handle_msg(port,
-- 
2.31.1.527.g47e6f16901-goog

