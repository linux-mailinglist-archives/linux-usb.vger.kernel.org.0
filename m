Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F391C26AE
	for <lists+linux-usb@lfdr.de>; Sat,  2 May 2020 17:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgEBPxO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 May 2020 11:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgEBPxN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 May 2020 11:53:13 -0400
Received: from mail-ot1-x362.google.com (mail-ot1-x362.google.com [IPv6:2607:f8b0:4864:20::362])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3773C061A0F
        for <linux-usb@vger.kernel.org>; Sat,  2 May 2020 08:53:13 -0700 (PDT)
Received: by mail-ot1-x362.google.com with SMTP id j26so5094825ots.0
        for <linux-usb@vger.kernel.org>; Sat, 02 May 2020 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=footclan-ninja.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I4lpNAVGaRE4y7I/DvtIkD9a+y/AhW0J4S2h5DhYWcU=;
        b=eF5aD3eQaFLfSaCVSzr+hsdnGLLWDBRrM29f9WnbpPXgHpR2R6Ys6VFcEv0SBbxBvC
         x5Jv9QgJr3RkEQcfR5d/jj6FfoXtu04CqWn4Avfc31kN6ZsFTIlAlrkEzkS9gl7/uD5p
         x8BuxDibkPaQCKj7uYWINuxRlPyydfS2D13tqLVoOt0mxd8CBTYuEneCgUO2iBXkfWoV
         kbNz2UWUVIpjJNRG35DaN7LfnbBACeC/GooxLCR+lBA1z0vw+EbsJjAXHsU+29XQdfNn
         kTzOskiZX4hF/9nwq5eH70LH4QkAI5Scj8mhnps4NkM2Bf7vs5ZMJgXhe6YZjuF+dR08
         f+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I4lpNAVGaRE4y7I/DvtIkD9a+y/AhW0J4S2h5DhYWcU=;
        b=ClPUmZVR2V2eZKmD9BzrS93oeMz16SWTKlXydGPSpvnouWQadXGW1FxL66TUPxfqkt
         VFppG4MexjTyFYV7BMSwMchGjwQNrV2sgfX4IXbx3vy0y9OkQlI9ACpoYzDjt9qwjvi4
         XOlmgS0hPcEoVL8wffi+RhkaZRfmKDDN9peLdMit5967bGDIsYVhyCX9sIZnTqTqgjHP
         EFritNMmBHCmTC4iKQb0thHIv3itH7mqL6BXIFRKfXaIIk6Nre7ODilNCDBzndb3VeAN
         HwVBKFl1YZtxCAR8SAxAvEXpR/byjIGxQelok5L+YuKyUwT4wRvdAx/RQV6uyLxkAGEE
         JtTg==
X-Gm-Message-State: AGi0PuYV61/pmUyofX0/PF18o53Dc+LiW3bFRNZKGOdTHz0IzaIOQFI4
        oG1bIBEQnn8GJOs/5VjO7W7/sbLsX31w89318OD+eqb7xwgazA==
X-Google-Smtp-Source: APiQypL9yBY5YBqEJi0A9Ktx/4u1HlE+pywv0Z0JzNnbdkLEwmpTGIlJUcteGVidiB8KwK8fbcW90uO15gFy
X-Received: by 2002:a9d:7d91:: with SMTP id j17mr7742822otn.342.1588434792936;
        Sat, 02 May 2020 08:53:12 -0700 (PDT)
Received: from localhost.localdomain (pa49-195-101-57.pa.nsw.optusnet.com.au. [49.195.101.57])
        by smtp-relay.gmail.com with ESMTPS id s12sm702441oou.7.2020.05.02.08.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 08:53:12 -0700 (PDT)
X-Relaying-Domain: footclan.ninja
From:   Matt Jolly <Kangie@footclan.ninja>
To:     =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Matt Jolly <Kangie@footclan.ninja>
Subject: [PATCH] net: usb: qmi_wwan: add support for DW5816e
Date:   Sun,  3 May 2020 01:52:28 +1000
Message-Id: <20200502155228.11535-1-Kangie@footclan.ninja>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for Dell Wireless 5816e to drivers/net/usb/qmi_wwan.c

Signed-off-by: Matt Jolly <Kangie@footclan.ninja>
---
 drivers/net/usb/qmi_wwan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 6c738a271257..4bb8552a00d3 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1359,6 +1359,7 @@ static const struct usb_device_id products[] = {
 	{QMI_FIXED_INTF(0x413c, 0x81b3, 8)},	/* Dell Wireless 5809e Gobi(TM) 4G LTE Mobile Broadband Card (rev3) */
 	{QMI_FIXED_INTF(0x413c, 0x81b6, 8)},	/* Dell Wireless 5811e */
 	{QMI_FIXED_INTF(0x413c, 0x81b6, 10)},	/* Dell Wireless 5811e */
+	{QMI_FIXED_INTF(0x413c, 0x81cc, 8)},	/* Dell Wireless 5816e */
 	{QMI_FIXED_INTF(0x413c, 0x81d7, 0)},	/* Dell Wireless 5821e */
 	{QMI_FIXED_INTF(0x413c, 0x81d7, 1)},	/* Dell Wireless 5821e preproduction config */
 	{QMI_FIXED_INTF(0x413c, 0x81e0, 0)},	/* Dell Wireless 5821e with eSIM support*/
-- 
2.26.2

