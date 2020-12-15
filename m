Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0272DB0AA
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 16:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730716AbgLOP6F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Dec 2020 10:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730707AbgLOP54 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Dec 2020 10:57:56 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E288CC06179C
        for <linux-usb@vger.kernel.org>; Tue, 15 Dec 2020 07:57:15 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 91so20350745wrj.7
        for <linux-usb@vger.kernel.org>; Tue, 15 Dec 2020 07:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DRJcfsrTjn/sTGt/O0JShReXD6f4V3EhoIS3OQlpvdA=;
        b=FLqMfbT4gqQW3tUeKMhsQ9AHP5poLjnC5DcCNnswTasS4kmUPTpBd9fqi/KJfzkfVR
         p3tgA4pUuxWhpdQofe+fhmr5OtcivHRpdAE+44/WL+qrUaW8+6KbtMt2aVU75bnIHAfk
         lvKX0OGypV1V306rVkIUULpmf8bK9QYVNUZKI/8DMS64fzLIJCuVdH3Ub8GBmI2FTtYT
         vvWUr6mTjEkIQ1ub0OqFHKUuQ1n65rHywfA5hkieGeopJfJBX1emIcWYGwPA9YI/DmzC
         NT71J83hum/lQHID2lcZIaXo59lvGvAJ8TuuXh1XAGZuurlLxsIXXXlt7iAgxbasY3EX
         PM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DRJcfsrTjn/sTGt/O0JShReXD6f4V3EhoIS3OQlpvdA=;
        b=m1giWggKqGo67Rf8s+AzUR/cmFwK2LJGERCu6zAfgu5rc88fpQZ1pGgw84fnATCM9r
         UIViE8se2FRdod4744tVVAc7K6tLJYS/0l5Ukkpg33dnDcmukj1MQ12kXhvzqdobiZqg
         cRTbBU9T7aUuyC2AQGykmTrXiMhDS2d618nma2NoKdhHZ0064CXn/1KEMX+K4hVHEhex
         NZT+hqwJpFLaqZ0JhvPQI1hH/icRlRuRhlw/P/iRL7RYdIQjGpJA2bIGYGPKtavU/fFl
         MuKjsRloCVosKEvmx0GL0FyOhiDLldyPP1t9hgTY4H3sy8aFhMBknGPs0FJa/rI4vOUy
         WVPQ==
X-Gm-Message-State: AOAM533Yhg7oZ/0EKF1CbZG9VgSKhGKkHdRi0WzU60YOImlg/I13H4AY
        v1aVNc1B0WEkE2swufFZfXA=
X-Google-Smtp-Source: ABdhPJyl8x9O4CG4eXMjv2vV3RSceRjiQPwkDv/4ecj7R2CMc8FHfNH6LrOFULbF2v4Jy/2iOw4WHQ==
X-Received: by 2002:adf:f6cc:: with SMTP id y12mr7073401wrp.35.1608047834646;
        Tue, 15 Dec 2020 07:57:14 -0800 (PST)
Received: from egonzo.toto.net.toto.net ([88.123.121.14])
        by smtp.gmail.com with ESMTPSA id c10sm38792018wrb.92.2020.12.15.07.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 07:57:13 -0800 (PST)
From:   Dave Penkler <dpenkler@gmail.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     guido.kiener@rohde-schwarz.com, john.harvey@non.keysight.com,
        jian-wei_wu@keysight.com, gabe.jones@ni.com, dpenkler@gmail.com
Subject: [PATCH 0/4] USB: usbtmc: Fix stale status byte ioctl
Date:   Tue, 15 Dec 2020 16:56:17 +0100
Message-Id: <20201215155621.9592-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The ioctl USBTMC488_IOCTL_READ_STB either returns a cached status byte
(STB) sent by the device due to a service request (SRQ) condition or
the STB obtained from a query to the device with a READ_STATUS_BYTE
control message.

When the query is interrupted by an SRQ message on the interrupt pipe,
the ioctl still returns the requested STB while the STB of the
out-of-band SRQ message is cached for the next call of this
ioctl. However the cached SRQ STB represents a state that was previous
to the last returned STB.  Furthermore the cached SRQ STB can be
stale and not reflect the current state of the device.

This set of patches separates out the behaviour into 3 ioctls:

[PATCH 1]
USBTMC488_IOCTL_READ_STB always reads the STB from the device and if the
associated file descriptor has the srq_asserted bit set it ors in the
RQS bit to the returned STB and clears the srq_asserted bit conformant
to subclass USB488 devices.

[PATCH 2]
USBTMC_IOCTL_GET_STB reads the status byte (STB) from the device and
returns the STB unmodified to the application. The srq_asserted bit is
not taken into account and not changed.

[PATCH 3]
USBTMC_IOCTL_GET_SRQ_STB only returns the status byte (STB) that was
originally sent by the device due to a service request (SRQ) condition.

This ioctl checks the srq_asserted bit of the associated file
descriptor. If set, the srq_asserted bit is reset and the cached
STB with original SRQ information is returned. Otherwise the ioctl
returns the error code ENOMSG.

The latter 2 ioctls are useful to support non USBTMC-488 compliant
devices. Time sensitive applications can read the cached STB without
incurring the cost of an urb transaction over the bus.

[PATCH 4]
Increase the API version number

Dave Penkler (4):
  USB: usbtmc: Fix reading stale status byte
  USB: usbtmc: Add USBTMC_IOCTL_GET_STB
  USB: usbtmc: Add separate USBTMC_IOCTL_GET_SRQ_STB
  USB: usbtmc: Bump USBTMC_API_VERSION value

 drivers/usb/class/usbtmc.c   | 85 ++++++++++++++++++++++++++----------
 include/uapi/linux/usb/tmc.h |  3 ++
 2 files changed, 66 insertions(+), 22 deletions(-)

-- 
2.29.2

