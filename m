Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B166C34DDA4
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 03:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhC3BhB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Mar 2021 21:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbhC3Bgz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Mar 2021 21:36:55 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50C9C061764
        for <linux-usb@vger.kernel.org>; Mon, 29 Mar 2021 18:36:54 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id z9so12852431ilb.4
        for <linux-usb@vger.kernel.org>; Mon, 29 Mar 2021 18:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzNccR4HUxtzv76VUIUuh/7Q61VVJFmqplYwomGLyxA=;
        b=VWMt8UzrYQCMai5lWUhxaNB0IKyJ5Jny5c5E1C17AOKV6026oFvmlM3tgR4yu9MkaJ
         5vh1CmtsMbzN/baQQoDBW0Kka9AZ67aWxOTf8GfMiWjPZoJGo4EJ72ilgcVxKcX3hOTF
         rXOcBv0TKwtl3tN8gNcGUIQs7voER0Xo11e1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzNccR4HUxtzv76VUIUuh/7Q61VVJFmqplYwomGLyxA=;
        b=CFCxQ2lJxxvhEy0AMzwxBx/bWxXIvloqXpFOGyzjrAaOBSg2JCw3X+vIHmTkAuCN8W
         joozhkfQBwGvj+4zEXDrmRoBkje15aE/hMQl5TJBGQgU9eGXbXrSmk3dR9ncvCQubAz6
         PI0AbmZJJEIvOnu0xbAmChYE63ziyqnZtrKHfSym0jxVYI593EPlF2VQdq6FT+5G9A2c
         tdEXsjHmpVyVQYo9DhlUXGxUx1lNGB8UwRbXVfvwdgQeiyzchPTAhoq0dpgkzBgBYlhf
         01ztM0kHZH23Q/b9gTI4tGLdrCg+T2t/2UZeIE8fsmSZAJWxzbTEi7CspWcjDGa8OLFS
         43VQ==
X-Gm-Message-State: AOAM530j0p623VNNYr++lxya0XnvZcfR+fe3DyxRMoGFoq1NQHVBAPWy
        foixbYRajHVd1qh5iJGwzAEUNg==
X-Google-Smtp-Source: ABdhPJzU99I0SfsEu+70stAiJPpSAbAjPW0NaSQ+OEhlaIJfKbNsuJpxZ2BXRFlZMXmGbpBMseFToA==
X-Received: by 2002:a05:6e02:13a6:: with SMTP id h6mr22250904ilo.86.1617068212740;
        Mon, 29 Mar 2021 18:36:52 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id i13sm10551696ilm.86.2021.03.29.18.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 18:36:52 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] usbip synchronize sysfs code paths 
Date:   Mon, 29 Mar 2021 19:36:47 -0600
Message-Id: <cover.1616807117.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fuzzing uncovered race condition between sysfs code paths in usbip
drivers. Device connect/disconnect code paths initiated through
sysfs interface are prone to races if disconnect happens during
connect and vice versa.

This problem is common to all drivers while it can be reproduced easily
in vhci_hcd. Add a sysfs_lock to usbip_device struct to protect the paths.

For a complete fix, all usbip drivers have to use sysfs_lock to protect
sysfs code paths and common event handler will have to use this lock to
synchonize with the sysfs paths in drivers.

This patch series adds sysfs_lock and uses it in vhci_hcd in the first
patch. Subsequent patches fix usbip_host, vudc and the last patch fixes
the common event handler code path.

Shuah Khan (4):
  usbip: add sysfs_lock to synchronize sysfs code paths
  usbip: stub-dev synchronize sysfs code paths
  usbip: vudc synchronize sysfs code paths
  usbip: synchronize event handler with sysfs code paths

 drivers/usb/usbip/stub_dev.c     | 11 +++++++++--
 drivers/usb/usbip/usbip_common.h |  3 +++
 drivers/usb/usbip/usbip_event.c  |  2 ++
 drivers/usb/usbip/vhci_hcd.c     |  1 +
 drivers/usb/usbip/vhci_sysfs.c   | 30 +++++++++++++++++++++++++-----
 drivers/usb/usbip/vudc_dev.c     |  1 +
 drivers/usb/usbip/vudc_sysfs.c   |  5 +++++
 7 files changed, 46 insertions(+), 7 deletions(-)

-- 
2.27.0

