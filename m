Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A806E3B914D
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 13:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236274AbhGALvX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 07:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236156AbhGALvX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jul 2021 07:51:23 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F0DC061756
        for <linux-usb@vger.kernel.org>; Thu,  1 Jul 2021 04:48:53 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so6781588pjs.2
        for <linux-usb@vger.kernel.org>; Thu, 01 Jul 2021 04:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uV014lyWot4q3dxJvgp7qp4hRNRtbOV39xG3WiDgjAA=;
        b=boitMiY6+yRilBgegCnp0jclEgFE/fEhk7DTEia3CbqWPILmlpFPou4y5fdncqJllr
         ZWRLvlReyDCGPgpjDervSm7lg7ZRxwGs3jZWO/yDaNR+Oa5+prXMjgsmlkQyJI4pDh2B
         t9ck43tZXS1NZdrQss73iJeBs8zSZxnlbZHZ2FH0FZIPBp9bnieUK/86Gp6sWFBfep3X
         cEWCa+stFwOVw91bLuBVFTLlp3+jReFbGgMfAXmlQtabuAEtrxP+J2PviRmhqzlqI/sB
         p5QD+d86e+ZolsZMlKrvB96EWZyn4oK+DO2+i0X6S4Vkd3ov5/DsybmyT0C365FpQFUc
         S/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uV014lyWot4q3dxJvgp7qp4hRNRtbOV39xG3WiDgjAA=;
        b=nFO4ZYqDPdRT3wuLUWBgEsjhNqc8vJAG0sSzOsqhNyxzloabMpGMwt5WwBt+W3YbZU
         q/0E4CxHzSbPExDyUv+eC187RyE6FgJImf8+HXLHeYUbHwQ2q7rG90osfjrSEeyXo8TR
         OA018hQXu8Y2GLLYAwnhCokJ5vTihz1z/ym6G4H5BeBsZ9tgfYiDfxZ+6u+mLPFX9w6b
         itscvsT3kQKe4a3327PIjbLLvrkbP11LLyInIuFhV6MqZqEBmQ7+sKFK8Adx0s80lBuh
         sxN38y3/Seup44z5et+FexMJCbS4ntqBpws+xERYvE8eePbK67lUJSIR/RvSAeDUy0i9
         /y7w==
X-Gm-Message-State: AOAM531cGNOK6Ib/4l3dkxQYBtuL0+yvYpqBUumql8ieu7knmi/LdRQx
        7KLArJTT8BQ1EK83xc0Pano=
X-Google-Smtp-Source: ABdhPJyPyhEiQrlqPqDi+zfmDaBnrTqlpF71Idbpr5PYH4+729aEXYo0FQaTtxXQerQW6iwPuYHibw==
X-Received: by 2002:a17:90a:e7d1:: with SMTP id kb17mr9357563pjb.95.1625140133050;
        Thu, 01 Jul 2021 04:48:53 -0700 (PDT)
Received: from athina.mtv.corp.google.com ([2620:15c:211:200:6c1:7d8f:dfdc:fc1e])
        by smtp.gmail.com with ESMTPSA id w2sm24600601pjq.5.2021.07.01.04.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 04:48:52 -0700 (PDT)
From:   =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
To:     =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Brooke Basile <brookebasile@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lorenzo Colitti <lorenzo@google.com>
Subject: [PATCH 4/6] usb: gadget: f_ncm: remove spurious if statement
Date:   Thu,  1 Jul 2021 04:48:32 -0700
Message-Id: <20210701114834.884597-4-zenczykowski@gmail.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210701114834.884597-1-zenczykowski@gmail.com>
References: <20210701114834.884597-1-zenczykowski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Maciej Żenczykowski <maze@google.com>

the current logic is:

  struct sk_buff  *skb2 = NULL;
  ...

  if (!skb && !ncm->skb_tx_data)
    return NULL;

  if (skb) {
    ...
  } else if (ncm->skb_tx_data)
    ...
  }

  return skb2;

Which means that first if statement is simply not needed.

Cc: Brooke Basile <brookebasile@gmail.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Maciej Żenczykowski <maze@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 77f55b3c805a..cab17ae4fa34 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1025,9 +1025,6 @@ static struct sk_buff *ncm_wrap_ntb(struct gether *port,
 	const int rem = le16_to_cpu(ntb_parameters.wNdpInPayloadRemainder);
 	const int dgram_idx_len = 2 * 2 * opts->dgram_item_len;
 
-	if (!skb && !ncm->skb_tx_data)
-		return NULL;
-
 	if (skb) {
 		/* Add the CRC if required up front */
 		if (ncm->is_crc) {
-- 
2.32.0.93.g670b81a890-goog

