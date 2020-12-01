Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7202CA543
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 15:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728969AbgLAOLk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 09:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgLAOLk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 09:11:40 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD81C0613CF
        for <linux-usb@vger.kernel.org>; Tue,  1 Dec 2020 06:10:54 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id f18so3088671ljg.9
        for <linux-usb@vger.kernel.org>; Tue, 01 Dec 2020 06:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HFGFmdJ0or5UBzSH3w9vnwCEhMuT+QLjNJnjA0S7R9w=;
        b=CloyGQowqy6w6Gr1l/RppL3OPlWJ/6rDNYxcFDNwPefgadWFfVIWorkMMfu2elBpWI
         B6rj3VjWa8YuDRF4EMJ1QP6XQBJxErdZ6Ds5jDWeWEzddPRVk3SXOU6/LtlZbt3m9cDa
         BWaZ/5J0E6Lk4gmPyMVmyReZWNBCFJhcNaiUoLFSKdVXI9kh9rZHRiczwcQiG32lvTsB
         7BbRNpQL5cfgML6fGn+i06OeDKehWYab9vQ6LqMDd5c1s9zTbMFod2k3v8k2abR89LjH
         aVZ8mIEir0T3LasJQdTSVkvKCdiLt960WdIdtqbyFoQNmWJtd0qOm+sShZjr+sXT7T7X
         zXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HFGFmdJ0or5UBzSH3w9vnwCEhMuT+QLjNJnjA0S7R9w=;
        b=Ty0aci3+EmmIA24yBu6u7rH+LLzLHb8B4YbpncPwU0RptdrI+wDuFlDbDUyVI1AdsN
         t+g2Oa291k8NTDyF5TcZotRnBVt7N9yDqc++bVij9ex3NNSzZqFX6hNyAPmn2NHOK7/a
         shglilJqurvlSAPGq/8XvQ8QFn7Ub0OqpnuWbkDCflUbhtRTY+lk/YvAzJAAWUK18dzF
         WlFPFJWhUKfBc/RnmnZWUimA7fZUOxjWnCVV3dy+FxdN65DSZJCWZbTPLKql6DlruLZH
         C44KvU6G6+FtrXpvOgQr/1H56V+AEocpPcmcA/sOnchYrH9Z+jblImDpzJPjcIPUPzim
         WF7g==
X-Gm-Message-State: AOAM533TVcJk/lxkJnnxCMUEhQwbdP4ox+M1uO2+MfdYcogj2J87MOLI
        iYs25mhBLV0hlpbGyJ7Br3ZOE2V77V0UDZVe
X-Google-Smtp-Source: ABdhPJyD5jA9/phkEbj2Y3saoaxSZZMco7jn2fbg28h75Bq+NmxLx1JCpISn9le+epYYZj/N5dv53Q==
X-Received: by 2002:a2e:9b16:: with SMTP id u22mr1354430lji.382.1606831851120;
        Tue, 01 Dec 2020 06:10:51 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id c19sm213140lfr.182.2020.12.01.06.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 06:10:50 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH] USB: serial: ftdi_sio: Helpful error on GPIO attempt
Date:   Tue,  1 Dec 2020 15:10:48 +0100
Message-Id: <20201201141048.1461042-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The FTDI adapters present all potentially available GPIO
lines to userspace, and they are often also visibly
available on things like breakout boards. These are
appetizing targets for random GPIO tinkering such as
bit-banging or other industrial control over USB.

When a user attempts to use one of the GPIO lines, they
can get the opaque error -ENODEV, because the flashed
configuration says that the line is not in GPIO mode
but another alternative function.

We had one user run into this, debug and finally fix the
problem using ftx-prog.

Give the user some more helpful dmesg text and a pointer
to ftx-prog when the error occurs.

Reported-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/serial/ftdi_sio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index e0f4c3d9649c..405fec78f2fc 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1841,8 +1841,11 @@ static int ftdi_gpio_request(struct gpio_chip *gc, unsigned int offset)
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 	int result;
 
-	if (priv->gpio_altfunc & BIT(offset))
+	if (priv->gpio_altfunc & BIT(offset)) {
+		dev_err(&port->dev, "FTDI firmware says line is not in GPIO mode\n");
+		dev_err(&port->dev, "if you really know what you're doing the flash can be reconfigured using ftx-prog\n");
 		return -ENODEV;
+	}
 
 	mutex_lock(&priv->gpio_lock);
 	if (!priv->gpio_used) {
-- 
2.26.2

