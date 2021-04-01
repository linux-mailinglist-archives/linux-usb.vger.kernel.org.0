Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84093522D2
	for <lists+linux-usb@lfdr.de>; Fri,  2 Apr 2021 00:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234936AbhDAWgM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Apr 2021 18:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234723AbhDAWgM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Apr 2021 18:36:12 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF200C061788
        for <linux-usb@vger.kernel.org>; Thu,  1 Apr 2021 15:36:11 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id j9so3194632wrx.12
        for <linux-usb@vger.kernel.org>; Thu, 01 Apr 2021 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4U2nL9QjvKiGF6omVp4A37Sds4R82N2PeBqJStbYldc=;
        b=Uza0EMA2Glg7QYmWPwKr7bEtGQEB6QPQZZwhdeOydUy3/GCSlCQTvJLQF0AH2BEuD9
         g1jPinOr9hTWuw9Qlc8Z+BpzITlNrihd/bWxfxvV2/QG4mSwf66ST66XJ5g+SjtZtawa
         ugTZJWrMu5nWGwanayECiamibYZRHBiyGQ9FCFcg3N/LdOePpVxmQ8UQ897jZbtxiX5W
         o7Tb3tbl2khyXvZK5N/Gw4c0Vkaz95iX8DN6D9L8pwcwF76MCDV0sq7eZbYEjP5ge3ht
         JsMCGMESqo/tXV9o12jWzQ6iC9oRkUZClIKRb13jiaRlZkY8mYSeT8q6kId0rAhVD/Gi
         xu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4U2nL9QjvKiGF6omVp4A37Sds4R82N2PeBqJStbYldc=;
        b=uL1hgstrR4mqvGKpta1AVZ9FSO0MV42ogqlUdF66lFF+UVbHgBd8vlFwlqs0PuIqfV
         h5yiXKf9FTUwi9YGNmj7kZRk1D3L5pxCDTDAkN/0OJxmtafu/2tTaH8ikcjYsgbedsYw
         ir4KfbtqtiNAxynlHLdv+tv5gz4UgCAy2ePCKMS2uP2CXo+YxYBUjecE5a9aS6YNgxIS
         ILb+BoRGsODJMF3QeVYX7WZLMcJHUXR0Ouhn87zVTi2V42r4dtsDbH+8DfIfXTBZ7zPj
         kK2K3sBBGX+/9NyRyzH/NfT79aAoXfBr4wppKvr9EYBTfNz1JXbFbbcfyrpAnpEgVi6s
         fWxQ==
X-Gm-Message-State: AOAM5311amcBpXe+Xmt5CwNDuvE0GUtGJ1TbwLgbZXHIL24mNatj5HKX
        kf4KsUkr3YPAn0c9BjvNOxGiBjTG4kFrvTYg
X-Google-Smtp-Source: ABdhPJw/C3ZrBCftCrOvZjL+ApQqQgKzWAVLMVHrv1u37S8D1wDTQsU2Mj8Wo5y1baoHQwAc7C+E9Q==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr12580365wrm.308.1617316570460;
        Thu, 01 Apr 2021 15:36:10 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id j26sm12380395wrh.57.2021.04.01.15.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 15:36:09 -0700 (PDT)
From:   Phillip Potter <phil@philpotter.co.uk>
To:     davem@davemloft.net
Cc:     kuba@kernel.org, wilken.gottwalt@mailbox.org,
        colin.king@canonical.com, bjorn@mork.no, jk@ozlabs.org,
        hkallweit1@gmail.com, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] net: usb: ax88179_178a: initialize local variables before use
Date:   Thu,  1 Apr 2021 23:36:07 +0100
Message-Id: <20210401223607.3846-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use memset to initialize local array in drivers/net/usb/ax88179_178a.c, and
also set a local u16 and u32 variable to 0. Fixes a KMSAN found uninit-value bug
reported by syzbot at:
https://syzkaller.appspot.com/bug?id=00371c73c72f72487c1d0bfe0cc9d00de339d5aa

Reported-by: syzbot+4993e4a0e237f1b53747@syzkaller.appspotmail.com
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/net/usb/ax88179_178a.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index d650b39b6e5d..c1316718304d 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -296,12 +296,12 @@ static int ax88179_read_cmd(struct usbnet *dev, u8 cmd, u16 value, u16 index,
 	int ret;
 
 	if (2 == size) {
-		u16 buf;
+		u16 buf = 0;
 		ret = __ax88179_read_cmd(dev, cmd, value, index, size, &buf, 0);
 		le16_to_cpus(&buf);
 		*((u16 *)data) = buf;
 	} else if (4 == size) {
-		u32 buf;
+		u32 buf = 0;
 		ret = __ax88179_read_cmd(dev, cmd, value, index, size, &buf, 0);
 		le32_to_cpus(&buf);
 		*((u32 *)data) = buf;
@@ -1296,6 +1296,8 @@ static void ax88179_get_mac_addr(struct usbnet *dev)
 {
 	u8 mac[ETH_ALEN];
 
+	memset(mac, 0, sizeof(mac));
+
 	/* Maybe the boot loader passed the MAC address via device tree */
 	if (!eth_platform_get_mac_address(&dev->udev->dev, mac)) {
 		netif_dbg(dev, ifup, dev->net,
-- 
2.30.2

