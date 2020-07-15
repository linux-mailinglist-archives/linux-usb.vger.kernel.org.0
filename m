Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4830B2208D9
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 11:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730763AbgGOJcQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 05:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgGOJcP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 05:32:15 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CFBC061755
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 02:32:14 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 17so4872412wmo.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=easFprA1rlXP+l9tcr/n/hbQjfY4p+URdQB+bt/vLVk=;
        b=kgCdXMjbGP82TXbjFkxf/2lpaClvJKN/LS7/ueUYl0t9EesCTDJfExfKSVdPJyLnpI
         mNcg+6XK9vjLQBI0TmsKAlocgw/bqTjmQHBO0KtCWxV1u5kdLAavgH1N/J3AWWNmzmvN
         +zjfJ100UTrvp4EJ/cExnGTPeICQKkKq5igA0enZNlm78zQVXTzpS6ZjnNTZlLxw31S+
         +HXFBE/AsjuKE/OD1e1P8Bs5M0+RG7GdA27HkDiSKQHJ+xI23vDB/wQbucsQJzCFFNvW
         RYobiCqAlVK2T63+0sgwVQU26AvHkqo6Vq0OQ79jEojfAL4V6fsjjUH/KVhlr3WgRwRl
         xewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=easFprA1rlXP+l9tcr/n/hbQjfY4p+URdQB+bt/vLVk=;
        b=Xufe9FgNn1KYJPxNy4xcDOBtbUX2fTSgM2l5s1hIPL2B0yky6TivfAtYA9A7luxyYf
         YBtASoZTb01PQ6v7qAAt8sYVYIL2eN17XSonVPyW36+iQCSNZBeawZ8uAg9IZldyX/cy
         e5Gg0uStWyrLrFitKGEoiNm1YDBPb81z4ap51CVbIjQoKzVTJHAcRHWSz8pA/hUx11ze
         Ho6VQ9+JJHgjIrG5ncNzs9B0TdJJW/oREwS4/jXbvVTaIXLI1q66Pb4v9g9UJlvJm+7J
         r0wPWdwKel9g/L+LmWUX9/WsgLm4CKMVDf8phq7XM37imwIQ5lXQY2eMGi324jz7ACH0
         86EA==
X-Gm-Message-State: AOAM533uH2NQICkX6wET1GC+88QZc2Iyvi+H4kTsrZMO3QN/xNXsNpni
        KP7M1UbO1A8c9racbVCMeiFT7Q==
X-Google-Smtp-Source: ABdhPJwg8dRgDgK/PgoS2WBYF+uhV5nacvXxeFhiZpmGdsw3/hGyoVy0nupsk/XEgqvxhoGTIjI46Q==
X-Received: by 2002:a1c:7d85:: with SMTP id y127mr7961510wmc.181.1594805532762;
        Wed, 15 Jul 2020 02:32:12 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id s203sm2686991wms.32.2020.07.15.02.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 02:32:12 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 0/8] Mop-up left-behind fixes for W=1 warnings in USB
Date:   Wed, 15 Jul 2020 10:32:01 +0100
Message-Id: <20200715093209.3165641-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is the last of them.

Some have been re-written, others fixed-up.

See the in-patch changelog for the details.

Lee Jones (8):
  usb: dwc2: gadget: Make use of GINTMSK2
  usb: dwc2: gadget: Avoid pointless read of EP control register
  usb: mtu3: mtu3_trace: Function headers are not suitable for kerneldoc
  usb: mtu3: mtu3_trace: Supply missing mtu3_debug.h include file
  usb: class: cdc-wdm: Provide description for usb_cdc_wdm_register()'s
    manage_power arg
  usb: c67x00: c67x00-hcd: Demote obvious misuse of kerneldoc to
    standard comment blocks
  usb: misc: sisusbvga: sisusb_init: Remove genunine unused static const
    arrays
  usb: misc: sisusbvga: Move static const tables out to different
    include file

 drivers/usb/c67x00/c67x00-hcd.c            |   6 +-
 drivers/usb/class/cdc-wdm.c                |   3 +-
 drivers/usb/dwc2/gadget.c                  |   3 +-
 drivers/usb/misc/sisusbvga/sisusb_init.c   |   1 +
 drivers/usb/misc/sisusbvga/sisusb_init.h   | 662 --------------------
 drivers/usb/misc/sisusbvga/sisusb_tables.h | 688 +++++++++++++++++++++
 drivers/usb/mtu3/mtu3_trace.c              |   3 +-
 7 files changed, 697 insertions(+), 669 deletions(-)
 create mode 100644 drivers/usb/misc/sisusbvga/sisusb_tables.h

-- 
2.25.1

