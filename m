Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3004438DB8F
	for <lists+linux-usb@lfdr.de>; Sun, 23 May 2021 17:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbhEWPMD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 May 2021 11:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbhEWPMD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 May 2021 11:12:03 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B93C061574
        for <linux-usb@vger.kernel.org>; Sun, 23 May 2021 08:10:36 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i9so36888895lfe.13
        for <linux-usb@vger.kernel.org>; Sun, 23 May 2021 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=EWynCE8OhOIjHLWaP/8Crqc+nG4j3x+gGuXqGtO8EIA=;
        b=kcnSbiwNC7eQ7Ubykir7Vi2c57nJZwfxMv7QHOIQksQm8fR7pAM63qeWe0ca4Pg/C4
         s6+9IB/m21LS2K1Omokw9ieDH3meuI06zcmWI9zsFkNIp7ZlMgcM1KkFl44lZ3j7tz4a
         sIAdtsYrbD453u8Ufpq0xtM9thbhkPgwyX2XcE8LmJ1yyQ5ZW4JjVPb+aPRuUrwn0qn9
         5vDhWNOaf2G39nNpK9raehahYXxGoEEO0AY4zYKkSoKTOzw+mbl6QiHkT9CmbH4m9vwk
         BhW0ND/2RI4QH640ge+bqS0kp2ymkiO9h3KieKZCVzmuE/r5RwvR1BWXPvWIfr9qI5uG
         auVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=EWynCE8OhOIjHLWaP/8Crqc+nG4j3x+gGuXqGtO8EIA=;
        b=RzHpRHrThRicPAVdCqOUoIJlxGMTPcTSbYiw/Pv4gGDFU7+bbUcRPCb1OAES/iIZ2c
         UKA3BaPhKJrBovEbWXC2Z6uAF3KYvXNjskPGx0L3vTmjSoVXE1NAgnUnQskqImfhA7kD
         Op8yV8SCpbX8ezvzG9DX5eO+yuE4MV8tO5rVmQ3/IgxguhfOrHpNUAoadEl11c01Rg7A
         hHnOBMXiCFcP9cvu9FB+74fEPDFknC3zs6WXKIM35sU9d6PQcRIq9AsXTlX1GGdP5a73
         qDKqY73/noksQtU24dx12csGZugVPbDpGZ9fZQXfvfKon+9vmhMtDkO59pAhkhpoTTTp
         Id1w==
X-Gm-Message-State: AOAM532vs2RorZGMJEc1ijfsb+IDpUgShzOSS6sRkFBetPF4hJ5d9kNo
        yngzvUMQ/pSqddHdPaBEl7SVd7Qgd2Euz3Yz
X-Google-Smtp-Source: ABdhPJz2p8EslvUrHjCMyWi0/1iSL31GajHQAc+SPmkfK9ElfwXUIferoVg0Kkm5QmOrCmTIkHfPHA==
X-Received: by 2002:a05:6512:1c5:: with SMTP id f5mr4751820lfp.10.1621782634119;
        Sun, 23 May 2021 08:10:34 -0700 (PDT)
Received: from [192.168.1.64] ([93.185.29.233])
        by smtp.gmail.com with ESMTPSA id t202sm1181491lff.199.2021.05.23.08.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 May 2021 08:10:33 -0700 (PDT)
To:     mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
From:   Alexandr Ivanov <alexandr.sky@gmail.com>
Subject: [PATCH] xhci: Remove unnecessary condition from
 xhci_check_tt_bw_table
Message-ID: <a7ca3671-aaee-2b4e-ed90-208ba82baef8@gmail.com>
Date:   Sun, 23 May 2021 18:10:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove condition (old_active_eps == 0) from xhci_check_tt_bw_table
because the previous check of old_active_eps returns
from the function if old_active_eps is not zero.

Move the previous condition to the function beginning.

Signed-off-by: Alexandr Ivanov <alexandr.sky@gmail.com>
---
  drivers/usb/host/xhci.c | 10 ++++++----
  1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 27283654ca08..14aae87d6c8f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2329,16 +2329,18 @@ static int xhci_check_tt_bw_table(struct 
xhci_hcd *xhci,
      struct xhci_interval_bw_table *bw_table;
      struct xhci_tt_bw_info *tt_info;

-    /* Find the bandwidth table for the root port this TT is attached 
to. */
-    bw_table = &xhci->rh_bw[virt_dev->real_port - 1].bw_table;
-    tt_info = virt_dev->tt_info;
      /* If this TT already had active endpoints, the bandwidth for this TT
       * has already been added.  Removing all periodic endpoints (and thus
       * making the TT enactive) will only decrease the bandwidth used.
       */
      if (old_active_eps)
          return 0;
-    if (old_active_eps == 0 && tt_info->active_eps != 0) {
+
+    /* Find the bandwidth table for the root port this TT is attached 
to. */
+    bw_table = &xhci->rh_bw[virt_dev->real_port - 1].bw_table;
+    tt_info = virt_dev->tt_info;
+
+    if (tt_info->active_eps != 0) {
          if (bw_table->bw_used + TT_HS_OVERHEAD > HS_BW_LIMIT)
              return -ENOMEM;
          return 0;
-- 
2.31.1

