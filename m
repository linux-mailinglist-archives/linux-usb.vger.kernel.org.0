Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBB74C969B
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 21:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238268AbiCAUZJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 15:25:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239235AbiCAUYh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 15:24:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039992715;
        Tue,  1 Mar 2022 12:22:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6189560C1E;
        Tue,  1 Mar 2022 20:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47531C340EF;
        Tue,  1 Mar 2022 20:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646166146;
        bh=4D4dbyGkdRwtaAw9y25zBM3qrwnZWcTagBLefzKVXZU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xa3pOiKt3/mqHocfrmqHQWdDyO+1xHPX6M5+kRPVZkYOW62HvOdA32PY5hfmVm2Uc
         JY0pkUGgk6r//XLl8ZTaJFuUVgTP770ppIJrdZ24IyPzHAEVMMhJF/rLLjBjF4xjhY
         CI6eoxvS0L2k9Gr3y63XKqodhq6kni/zgpVxSFg+NP70KNBq9e1qQteB1+uZ1Er/b+
         j6f2qB30RSQyBcFLLszmAWFfW0+IRy5tIkuqzW/HJOsVLIFu33EiAfrITvvFbsudhp
         zrwlNzukYrfLznhXuYCTPzMB4Z+LL4b6JzD4biDGygiubtqNM7mpi7TopCcvgyZs1d
         5l0ksh6sl4rFQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>,
        Grant Grundler <grundler@chromium.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, kuba@kernel.org,
        andrew@lunn.ch, arnd@arndb.de, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 2/6] sr9700: sanity check for packet length
Date:   Tue,  1 Mar 2022 15:22:06 -0500
Message-Id: <20220301202212.19419-2-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301202212.19419-1-sashal@kernel.org>
References: <20220301202212.19419-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Oliver Neukum <oneukum@suse.com>

[ Upstream commit e9da0b56fe27206b49f39805f7dcda8a89379062 ]

A malicious device can leak heap data to user space
providing bogus frame lengths. Introduce a sanity check.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reviewed-by: Grant Grundler <grundler@chromium.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/sr9700.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/sr9700.c b/drivers/net/usb/sr9700.c
index aadfe1d1c37ee..f4c4df01874c3 100644
--- a/drivers/net/usb/sr9700.c
+++ b/drivers/net/usb/sr9700.c
@@ -409,7 +409,7 @@ static int sr9700_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 		/* ignore the CRC length */
 		len = (skb->data[1] | (skb->data[2] << 8)) - 4;
 
-		if (len > ETH_FRAME_LEN)
+		if (len > ETH_FRAME_LEN || len > skb->len)
 			return 0;
 
 		/* the last packet of current skb */
-- 
2.34.1

