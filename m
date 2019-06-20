Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8454C65A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 06:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfFTEvE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 00:51:04 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39909 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbfFTEvE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 00:51:04 -0400
Received: by mail-pf1-f195.google.com with SMTP id j2so930585pfe.6
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2019 21:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WkSbKTSnwbwieV5SPCqiiL22l5NXSMRUwdSAtK7QwhE=;
        b=TmzHjYOKQR1VqvFIqy9MuHqanoyVfKqm8zxmcadDfGn/pSNBv5bhEBN1yRj79g9Vkm
         Sh/D4gMWybFZqkKGwO6oDAoj/H/2GCw5XGunpNwBLZgVxAIWdKjIpcy2dbvROg1HPMgK
         lxfaqh40lIee44+G7rMAGCZD6WuK+q8fwC8WZHwY9nhRs32sINUmd/P7SQ/zQt1mv8We
         1orJuMxw0gW987OLCzHmFvO/igr/CLYZcGu6HhIMQRYAWNqIJTxKHi3pqAxKdLdbWpu8
         uxsXEDgoMqfvEJ/lMyAykBYs8F3vZNgpBuCBCAydfb4rEFbcYR+2D3u7s/uTmLqS+7XR
         IvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=WkSbKTSnwbwieV5SPCqiiL22l5NXSMRUwdSAtK7QwhE=;
        b=eOwcl5StHZp8RpGX9EV6W98eoKcLbYByzUw3B7xSj1gWuoMzQlSZYrF4GQk3H0a2IL
         YkTI2WVZJhwZfXhmu7O+6axKYzfNI0EzMWCsQtcYRXpyhFKcaCP0EMb1b4g+ppm9A71j
         ejoglIqOofQhxEwNTswgVTO+ca+SIOeaKa0896lx+fBKFUiaOmUE0dksuWGoNIUKWlzM
         V4azh1QyX7TNHMtPzOVUDVqEH1pG++fp9UV0ZjrAdIw8rukyHOR9RA0ft46qRlF6uRic
         DyG6ig0kobrvshL1EsGMAbwfp1SAOTAd+1tBsJfB0z5yJU9IsZeRek2y9ONgudQvA/i2
         /+cA==
X-Gm-Message-State: APjAAAXNy+VZ5vPxioHX3V30S8klaLEm+WnwAvheJJLKUEq0R3ompIqk
        Ckd00JVXWB3OK9AjOrGMSErvyU9aJMY=
X-Google-Smtp-Source: APXvYqyHxS6aoEn7Ty40Sv/QPGs2d3C2EnNsOAZJcDwBCoxtxQelRb+x1UpkK8LSGM2gRb4Wz0+ORQ==
X-Received: by 2002:aa7:9aaf:: with SMTP id x15mr77736728pfi.214.1561006263576;
        Wed, 19 Jun 2019 21:51:03 -0700 (PDT)
Received: from mn.cs.uvic.ca (S01061cabc0a516f3.gv.shawcable.net. [24.69.190.94])
        by smtp.gmail.com with ESMTPSA id d4sm3020459pju.19.2019.06.19.21.51.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 21:51:02 -0700 (PDT)
Received: by mn.cs.uvic.ca (Postfix, from userid 1000)
        id 0D7B54650F5; Wed, 19 Jun 2019 21:51:02 -0700 (PDT)
From:   dmg@turingmachine.org
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Daniel M German <dmg@turingmachine.org>
Subject: [PATCH] usb: Replace snprintf with scnprintf in gether_get_ifname
Date:   Wed, 19 Jun 2019 21:50:38 -0700
Message-Id: <20190620045038.24941-1-dmg@turingmachine.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Daniel M German <dmg@turingmachine.org>

snprintf returns the actual length of the buffer created; however,
this is not the case if snprintf truncates its parameter.
See https://lwn.net/Articles/69419/ for a detailed explanation.
The current code correctly handles this case at the expense
of extra code in the return statement.

scnprintf does returns the actual length of the buffer created
making the ?: operator unnecessary in the return
statement.

This change does not alter the functionality of the code.

Signed-off-by: Daniel M German <dmg@turingmachine.org>
---
 drivers/usb/gadget/function/u_ether.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 737bd77a575d..329b4d2861ee 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -1004,9 +1004,9 @@ int gether_get_ifname(struct net_device *net, char *name, int len)
 	int ret;
 
 	rtnl_lock();
-	ret = snprintf(name, len, "%s\n", netdev_name(net));
+	ret = scnprintf(name, len, "%s\n", netdev_name(net));
 	rtnl_unlock();
-	return ret < len ? ret : len;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(gether_get_ifname);
 
-- 
2.20.1

