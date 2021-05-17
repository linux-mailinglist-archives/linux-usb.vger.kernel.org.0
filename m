Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7982386BB8
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 22:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244524AbhEQUyF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 16:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33680 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244517AbhEQUyE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 May 2021 16:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621284767;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=76uFxF6tDNi0nKdQA2asyMgYE2LMBW+B8Yl0fD6nlcE=;
        b=YIi1XVKG1iAc5fjnNHDqc8vMbNdFhVK9p29W4iQZ9Kra5KSReYoiJ00dGl/uFI6SqY4rxP
        HYx3zOgjHZz8gdtg2C+Krta6aryHdvgA9wBufPvt65pfpKdJrzS0clDHnt5h4TiKrjZD60
        yGm6Xd68Sq2rzecLTDNsNudfEw1mWjY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-VEaSClB7O6mUCtUGkvuYmw-1; Mon, 17 May 2021 16:52:36 -0400
X-MC-Unique: VEaSClB7O6mUCtUGkvuYmw-1
Received: by mail-qv1-f71.google.com with SMTP id f17-20020a0cf3d10000b02901eda24e6b92so5739190qvm.1
        for <linux-usb@vger.kernel.org>; Mon, 17 May 2021 13:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=76uFxF6tDNi0nKdQA2asyMgYE2LMBW+B8Yl0fD6nlcE=;
        b=Yos1M8k0ybxU+axEdKJpop+K8HTYSwmruBgF/Q9SC2ovEyoscjoknKoTTjRoTP3cYS
         OdXByRhkSkQrKvqp73eIGoMrl8XRwae8w0+L/YAVgNfG9iEmP/wyF9QoW6KWd4N31Rh0
         UYTNok9mMW+fnftRk345Z5y0UI5Qz2u7sqrv85A83fMawbj9JT2MY/fXuXJyII4pfn/v
         3NX/9qWnYShgU0uP9OlWEkApOvMl0dq23t9ddXv2NeyrynHnasyBYivnGbzeDou9ZibG
         UBi9V2ivtOxTpWqKt1PR95/UUIXOkwq5Krhv8x1ni9RrvG8jEdR7xweKV1YByw7HT8aQ
         OrMg==
X-Gm-Message-State: AOAM530oslOq7Wu6tTIYyIZHKxZHDqVBZZ0/JoNxa8j/o3j5uLptSo0u
        uYqXk1pAzKY7XFi2P9Y+r90QyO53A0e63RXFKPECJec5E37BEwSjaIjq2W6h1e8jtBhULzNloZA
        3qNGLDfjVcS2LNjTP/qZy
X-Received: by 2002:a05:6214:6f1:: with SMTP id bk17mr1774861qvb.37.1621284755704;
        Mon, 17 May 2021 13:52:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS9/fVzT+mCCgEItgc7xkN4bp5oRWkMsPDBBsnWCAFRzegq9r1DPFcBWA1wUkCG1o1cJ77sA==
X-Received: by 2002:a05:6214:6f1:: with SMTP id bk17mr1774849qvb.37.1621284755564;
        Mon, 17 May 2021 13:52:35 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id t11sm11341683qkm.123.2021.05.17.13.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 13:52:35 -0700 (PDT)
From:   trix@redhat.com
To:     gregkh@linuxfoundation.org, masahiroy@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] USB: select WWAN_CORE for USB_WDM
Date:   Mon, 17 May 2021 13:52:31 -0700
Message-Id: <20210517205231.1850314-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Link is failing with
cdc-wdm.c: undefined reference to `wwan_port_get_drvdata'

Add a select of WWAN_CORE to USB_WDM configury similar to
what is done for drivers/net/mhi_wwan_ctrl.c

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/class/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/class/Kconfig b/drivers/usb/class/Kconfig
index d3f5162bd67ef..e5714fddf1642 100644
--- a/drivers/usb/class/Kconfig
+++ b/drivers/usb/class/Kconfig
@@ -30,6 +30,7 @@ config USB_PRINTER
 
 config USB_WDM
 	tristate "USB Wireless Device Management support"
+	select WWAN_CORE
 	help
 	  This driver supports the WMC Device Management functionality
 	  of cell phones compliant to the CDC WMC specification. You can use
-- 
2.26.3

