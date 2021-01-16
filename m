Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A492F8BA4
	for <lists+linux-usb@lfdr.de>; Sat, 16 Jan 2021 06:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbhAPF1v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Jan 2021 00:27:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbhAPF1u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 16 Jan 2021 00:27:50 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BD9C061795
        for <linux-usb@vger.kernel.org>; Fri, 15 Jan 2021 21:27:10 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id r9so10751139otk.11
        for <linux-usb@vger.kernel.org>; Fri, 15 Jan 2021 21:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=65B8jFD6BKFmJUeoWeobGFq6gPhtjsSr7YxcrTW/Fp0=;
        b=kXDQkXgVTVI48hf4p4oPNGsaWGParpa8LVwU7SMSh2i8Xsj8P639loalTcpFDjXKRD
         Lc+PTSseLBbl7bFnLs3TnbNdc/rX2Ybqm+sGI3hjbh+5XafX2Q+9oW1f++dn5u3CSNe+
         Koa/fLIjKFh69pViNa00CQaVGeELaRNiFDba4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=65B8jFD6BKFmJUeoWeobGFq6gPhtjsSr7YxcrTW/Fp0=;
        b=gdRLZzGW+pl0XIQ/xY7GIdXOdJ4VHB5KAZ1CnXpNhleEscq8JfDijyKXjp9bcsZY7U
         4HTcHx6hN7ayePiB7AEX4gtps811lf4IRf+WNA78eg1211KcjRxU9QVKR2ganxXRoHJv
         ROZpVGDs7Mj8oD/VG8VswH5Crc5unLjlFaoDIbFHDBFvWe2l8z4W6J/LC3bDyTBTFvHh
         atWHuAz6BHy1W792ZDqkYUwxxFkHYHJjkKbn9FFUnhaebroMMVG3bwjRvIlpLYyqMCCB
         DgmUhGy9bkfEbrBBuLHnWjXh1UUkKTJdfrjT1axAsKjb91HqtjXWT8qCSFb0nse+2M13
         nv2A==
X-Gm-Message-State: AOAM533JgkwZcfTGE5MpBP4Pne09wgQ371NcP0T8ajYm/RXxUeyGNBDN
        gdSGU2dBX1vkrC4gLFUDFRRS5w==
X-Google-Smtp-Source: ABdhPJxWni1pJN6MYFmoXxWJUxOhCrlI1Nj4Gm9F4WAeR9V/pjOxcWCarLuEAXHd7GsRoHS1uEl37Q==
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr11346084otm.231.1610774828045;
        Fri, 15 Jan 2021 21:27:08 -0800 (PST)
Received: from grundler-glapstation.lan ([70.134.62.80])
        by smtp.gmail.com with ESMTPSA id 94sm2359230otw.41.2021.01.15.21.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 21:27:07 -0800 (PST)
From:   Grant Grundler <grundler@chromium.org>
To:     Oliver Neukum <oliver@neukum.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Grant Grundler <grundler@chromium.org>
Subject: [PATCH 2/3] net: usb: log errors to dmesg/syslog
Date:   Fri, 15 Jan 2021 21:26:22 -0800
Message-Id: <20210116052623.3196274-2-grundler@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210116052623.3196274-1-grundler@chromium.org>
References: <20210116052623.3196274-1-grundler@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Errors in protocol should be logged when the driver aborts operations.
If the driver can carry on and "humor" the device, then emitting
the message as debug output level is fine.

Signed-off-by: Grant Grundler <grundler@chromium.org>
---
 drivers/net/usb/usbnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 1447da1d5729..bc7b93399bd5 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -887,7 +887,7 @@ int usbnet_open (struct net_device *net)
 
 	// insist peer be connected
 	if (info->check_connect && (retval = info->check_connect (dev)) < 0) {
-		netif_dbg(dev, ifup, dev->net, "can't open; %d\n", retval);
+		netif_err(dev, ifup, dev->net, "can't open; %d\n", retval);
 		goto done;
 	}
 
-- 
2.29.2

