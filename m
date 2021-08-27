Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEFE3F95E9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 10:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244497AbhH0IWZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 04:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbhH0IWY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 04:22:24 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3EBC061757
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 01:21:35 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id u16so9147909wrn.5
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 01:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L5Tu8QFS688eglOi28AIM/8ifdlv0qRcg6aeNLNabUQ=;
        b=PG47gky+dCHcd52Pa6D7SFvrmMPaEQgbJsLRwO49vaQYtBd10Xtl8onhpFVXv1sklI
         Gin+4uXcAZLb6ApQHZLuSQyHKYYaEaDyZLxT85onjO6Fkqt/y9zeiW6NyWzcc2RXgjDm
         sV0vhJoSSDBGwMoCWpoJk1mnRsVhF6rFm3Hjv5aFEQCHNLuzlZSGGwZOyERLBKRXiqBL
         uhBdkBjoru9d69hm+PZGpu9RPuvRnOUpS08EnQHIBYs6jbO6jLqaNzrQID2FuY04H7Ts
         980hzHBB1+jMdRuric16VZfTJBW8uY52rXIa3fNNfzjaYPhyFiNQ295/kqQvzJavFtN+
         Zvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L5Tu8QFS688eglOi28AIM/8ifdlv0qRcg6aeNLNabUQ=;
        b=mldvbkGBKxp7Zu38pokGLnr7VV0hC2s41V3RZol0j+Ob94LLgSm2TOpaV4FRac28jp
         6vJ+E1ei5jU73m3EvBHm/7aM3jEE6EirXaqMBdZQxcReyqH6eBOG6zppdy8gKqi5WpKh
         LKu3vvYymLXB53yt93kcc/i7JAomRMymBzW/lMwxe1TyM9XTjuZcS2gwD8btUDu9NcZd
         Dw7tfwWr1EW0/duLJCjwwt5z40ORUQ7o/Fmh4kb1O1kXqF81DM4S7qCNtLIyPlxrVoEp
         Xw6NRvNms1akOQvV9fj5Y2OPJmlhhHocQgsDCD2llkgazMe1nVgrIrplMmyFfL/rYzqt
         MYdg==
X-Gm-Message-State: AOAM5328d32TOZ+38NiGX+jJPaYZ7r5QuwFC6lT8+p6HVvlv+PfYiffP
        lYQpjoiFw+f+8PFu4dfgXvdbBw==
X-Google-Smtp-Source: ABdhPJx0t9oDYz8nbkjfphxVDATqv/XwiCeFNL9K6ph8VjbAx1e6NsxME8cq9mDVdnpeS3OkviVsbw==
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr8972508wrk.235.1630052494489;
        Fri, 27 Aug 2021 01:21:34 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id y1sm5177725wmq.43.2021.08.27.01.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 01:21:34 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dietmar Eggemann <deggeman@gmx.de>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 0/5] usb: isp1760: arm tc2 board isp1761 fixes
Date:   Fri, 27 Aug 2021 09:21:07 +0100
Message-Id: <20210827082112.4061086-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
Dietmar complained that the latest changes to this driver
broke booting his Arm TC2 board [0]. I did not have one of
that boards but Dietmar provided out of band help trying to
debug the issue, many thanks for that.

Meanwhile, yesterday I could get access (remotely) to one of
TC2 board and manage to fix the issues that were breaking
this to work on that system.

This is rebased on top of the latest (this evening)
usb-testing/(this morning) usb-next. If, and I am sure it is
too late to include in to 5.14, it should go to the first
5.14.y stable with this tag:

Fixes: 1da9e1c06873 ("usb: isp1760: move to regmap for register access")

Thanks again Dietmar for reporting and your help.

Cheers,
  Rui

[0]: https://lore.kernel.org/linux-usb/11ed5458-4b88-ad72-4497-89ff9346a40b@gmx.de/

Rui Miguel Silva (5):
  usb: isp1760: fix memory pool initialization
  usb: isp1760: fix qtd fill length
  usb: isp1760: write to status and address register
  usb: isp1760: use the right irq status bit
  usb: isp1760: otg control register access

 drivers/usb/isp1760/isp1760-core.c | 50 ++++++++++++++++--------------
 drivers/usb/isp1760/isp1760-hcd.c  | 33 ++++++++++----------
 drivers/usb/isp1760/isp1760-regs.h | 16 ++++++++++
 drivers/usb/isp1760/isp1760-udc.c  | 12 +++----
 4 files changed, 65 insertions(+), 46 deletions(-)

-- 
2.33.0

