Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7A076336A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jul 2023 12:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233718AbjGZKXK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jul 2023 06:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233848AbjGZKXG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jul 2023 06:23:06 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1321FEF
        for <linux-usb@vger.kernel.org>; Wed, 26 Jul 2023 03:22:59 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52229f084beso5297208a12.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Jul 2023 03:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690366978; x=1690971778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEuTaTQFI9rXtiEpwE0knAYyiaKxr6tHRk4WYnst6bY=;
        b=1CAAAKselEdqRJvj0TXl7P+hikboWmvENxB9im9VVosC+/xF+4wREP5vNl6Vh47Kg1
         NICA4c9Nx5uhmZGJv4bbG0YDVLMuFrucCTv+rSBw267VkUJjSyiIsJuK3A0ftVaaF9TO
         Eortw2vWz5qa/Gg9nHlCwKE80UkLZA3Ko6+PGIH2qJZeC1ef5piA3vqX8ZmBmyPV2MjD
         atjJAJ3u++XfuSDbuxY/QRumPxc2ars9LjF3d8vPzbbkBR+CWhI1QVHR/FXVz2jKSzN6
         FFXf9KPwDj7a1xr8W9IZzHjK76Mmapobh8hKzbwfab4twVUiZzLX91svddF9LvgLF3xN
         oFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690366978; x=1690971778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEuTaTQFI9rXtiEpwE0knAYyiaKxr6tHRk4WYnst6bY=;
        b=PWY2LjETMLxIA76t0noR+LoXq+5VeaK/z7Zprko+8q7QXb/Gb5GgPmtazjjfsSmXpk
         RV9rzdrYtjNRbDPoWyQVAmJxH31WG4YpS0jzVcHzufPG6DClVpsOE+QZvyKshtwCwVYs
         Y56db+OiX8xoYzOGb/3gbq8qomwxC7xKRwQOQKrYXx/eyzVQDePSW9ApbXFCV/lDN6xM
         ku5s5re5sZyfpJRFk0MwpCDbO+Za0OtWYZ2QAtC5j5F8+YRDO7RVY6Xxj/W9+OK5P9LI
         q9l0mcCHSFJwQoBJfS1VCkz9g2gRE5FgrPVllU+2iW7kFIwcvbdbBdCZMTxUGePr9s0l
         4M7Q==
X-Gm-Message-State: ABy/qLbFmqC4GIgiC95AjXzpsbZdYwF+f3+Oi5DQbF2xhkhpTxcXK5f0
        kqsskMH+CbYgn0pDMyZdsT+qTw==
X-Google-Smtp-Source: APBJJlEYL8b5oDJRsB2EGBjsiKrf9yDHeXV6UJ8pUIVj9RlN2KXNKafk0x1as7ptiTx2oOxQ25TtkQ==
X-Received: by 2002:a17:906:76d4:b0:99b:8c6f:f3ab with SMTP id q20-20020a17090676d400b0099b8c6ff3abmr1497951ejn.13.1690366978069;
        Wed, 26 Jul 2023 03:22:58 -0700 (PDT)
Received: from blaptop.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q16-20020a170906b29000b00992316f0690sm9450258ejz.74.2023.07.26.03.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 03:22:57 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     hminas@synopsys.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 0/1] DWC2 DMA issue
Date:   Wed, 26 Jul 2023 12:22:51 +0200
Message-ID: <20230726102252.2236314-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For context, I am trying to reduce latency of UAC2 gadget
and one way to achieve it is to reduce the number of USB requests.
The SoC on the board I use (vim3l) use a DWC2 IP.
If I enable the UAC2 gadget with 3 requests, every ms I get data from isocronous
in endpoint and everything works fine (I can listen what come from the interface)
But if use only two requests, then, what I listen is hugly!
What I noticed is that after two sucessful USB transfer, I get a ZLP.

I suspect that happens because in dwc2_gadget_fill_isoc_desc, we may update
the DMA descriptor whereas it is already owned by the DMA.
On completion of a request, the gadget queue the request that has been completed.
The DWC2 driver clear DEV_DMA_L bit of last descriptor and add a new descriptor to DMA.
In that way, we never stop DMA and keep the endpoint enabled while we are
feeding it with data.

If we use three or more request when we start the gadget, the DMA has three descriptors
and when queue a new one, DMA is processing descriptor L-1, the driver update descriptor L
and the descriptor L+1.

But when we only have two requests, the DMA has only two requests and when we queue
the request on completion, DMA is processing descriptor L, the driver update it and add
the descriptor L+1. Instead of using the new descriptor, the DMA raise a BNA interrupt,
the controller send a ZLP to host and the driver re-initialize the endpoint to prepare
the next transfers.

The patch try to fix it. I am not conviced so far this is the best fix so
I am open to any suggestion.

Alexandre Bailon (1):
  usb: dwc2: Don't set DEV_DMA_L by default for isoc transfer

 drivers/usb/dwc2/gadget.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.41.0

