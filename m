Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA5727A112
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 14:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgI0MtS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Sep 2020 08:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgI0MtS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Sep 2020 08:49:18 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92A4C0613CE
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 05:49:17 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id e23so4648865eja.3
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=asWmuNPbv7O14B/CqJ1Q3xDQ3n30hKEpCeMHeYXCIHE=;
        b=AVFqeCvfsCAGsGp+CPkJIKaDP04FRBmne3+1Ji3H8JBJLqHTP57nXl39kk3Iq9G8OW
         k6Ig+zwFnCUW6LQy3LN1aQIUctzLFH58cJ4+jDRIkG8fRcDaJW+KHFTtnDVofuOZ1f6c
         uU4+DXcrojFBRC4upmYN8lsFfiRXnp18vc2qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=asWmuNPbv7O14B/CqJ1Q3xDQ3n30hKEpCeMHeYXCIHE=;
        b=Q0ONJhlOycnFXJ21G7FIMITodfvr+yrO16NzN9fzMOa8pM/QdK9vlD66Gn2NX4+4+Q
         VnYk3XaqxRWjiKXpHQR6esNd0YqDNDDgqLQ+zAqXuQeFBLumqXtOES4kZWyoF3S6D9OQ
         /iTwndnMaYVLscAuLfnXs7cfzjqFEYitxreybB10hewK7R9hn3yfyVgq31nEKTNRaC1Z
         HbeD2DtW3dDIyighY6fjLn6P9OYKSHMPRFNCUjm87C5AkBSuG7TTs7ePgeS8RnYS1iJW
         po4AAiK1ceTXe2alT56ddxW0nJmlz6OfWGERYekCfbwnF53MCD6PK+cvTI/oYDJAi4mI
         Pyuw==
X-Gm-Message-State: AOAM532dVEgIA8+jzc3GeW0rFLxKhAbvCzKvF9Y4zHTTfG57Rr/Uyrbs
        7tp8ZjByC3f1qGE3wsyZCx3vdg==
X-Google-Smtp-Source: ABdhPJw2vRQtNip6I3qzR/LkuWDKso34YvFFPDIKj0R45xCixJL+4qpfdkzWEKaS/RcOj0GwqSyAZQ==
X-Received: by 2002:a17:906:4a19:: with SMTP id w25mr10746155eju.199.1601210956480;
        Sun, 27 Sep 2020 05:49:16 -0700 (PDT)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id r16sm7234275edc.57.2020.09.27.05.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 05:49:15 -0700 (PDT)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     gregKH@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, davem@davemloft.net,
        netdev@vger.kernel.org, Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH RESEND v3 0/2] Use the new usb control message API.
Date:   Sun, 27 Sep 2020 15:49:07 +0300
Message-Id: <20200927124909.16380-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923134348.23862-9-oneukum@suse.com>
References: <20200923134348.23862-9-oneukum@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Re-sending these, now CC-ing the folks at linux-netdev.

Open coding, occasional improper error handling by the caller of
usb_control_msg() and not flagging partial read as an error requires a new API
that takes care of these issues.  It took the form of
usb_control_msg_send/recv() and this patch series is converting Pegasus and
RTL8150 drivers to using the proper calls.

Petko Manolov (2):
  net: pegasus: Use the new usb control message API.
  net: rtl8150: Use the new usb control message API.

 drivers/net/usb/pegasus.c | 61 ++++++++++-----------------------------
 drivers/net/usb/rtl8150.c | 32 ++++----------------
 2 files changed, 21 insertions(+), 72 deletions(-)

-- 
2.28.0

