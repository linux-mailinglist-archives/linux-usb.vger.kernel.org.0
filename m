Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C9F3F9960
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 15:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245160AbhH0NM7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 09:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245091AbhH0NM6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 09:12:58 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CE2C061757
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:12:09 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so4368419wma.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eYOFwmYn6X1M2E8a7MDAaGt4zsmBWTktrmci5tNJESE=;
        b=U8xD8hFT+228lDVAICpxn3cRIE3EYgA3OhTKjqjLJrdGig0YJcajxuLcDAMxmjhscH
         q/9eLXuDKakVYVWXQiyrbLPXWH1nAjIf4L5og2sa2GEwaAgjVeadZgMaIZrZRh+f+ztL
         olHwE+CsrtoySiJW5OgiFL/GUlVM8oI1gQQ8rZ4BG4IJ6D3kUEp3MjIrDZjtOO/24oWP
         SneP5qGz59dlAyBefYcbT1CaIKDhIAWgHv0uThWQvvq4Oytg6Qgc6q3bAgfQcaTrKDu/
         6e+uCnyvr8oF7OBlXfae39FrKB5fHnLUjU+7LsInUDN9dsWSJdDjoK+vx8eDQywzodab
         935A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eYOFwmYn6X1M2E8a7MDAaGt4zsmBWTktrmci5tNJESE=;
        b=rbJBKEYGJNgbIyxnZwzS04SR7Ju04l080NVGE6mnAGNQIM3M72eLvvumdQV/ZBI0ok
         UsV+o8NW987W/NjKAj7OVPhts6JeqK7wqsfBNpyugxwnlVQW4sy4BTL1YcRP7pX1vh2F
         VVzGo9PgWVv4di8+b71nuP3pJfU0zn/fSwP2KCyYDTYyBn0OwwlB+8l4GliaxAWZBaE5
         exESS0EYply01do1hmlKGFGADHN7MVaa79oQbGxWdCsm5bZSOp2SFTmsqD243HQBoGKk
         u2EVBUzD/xnXo8M4DBEy/csJ7fHgc67bl8jceqY+ogR9U5TNePdvAgUL5fguGMhrTsgw
         L2+g==
X-Gm-Message-State: AOAM531TCt4m/JTORTrMEHH0S/tURV8wTyMZ3fCAgL7qkhAmjF6tmvcF
        ak4n5fxo0Fem8lkKVuFK3gM9dQ==
X-Google-Smtp-Source: ABdhPJx2fN4/WvBY9qlZQ1iL62WOosqZRU68OJgw5WzhUWFkBAxtLLfyfcODRqTwdGvPZeuw8el98w==
X-Received: by 2002:a1c:23c7:: with SMTP id j190mr19822713wmj.1.1630069928029;
        Fri, 27 Aug 2021 06:12:08 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c7sm5279349wmq.13.2021.08.27.06.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:12:07 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 0/5] usb: isp1760: arm tc2 board isp1761 fixes
Date:   Fri, 27 Aug 2021 14:11:49 +0100
Message-Id: <20210827131154.4151862-1-rui.silva@linaro.org>
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

v1[1]->v2:
Dietmar:
 - change email from gmx.de to arm.com
 - add tested-by tag

[0]: https://lore.kernel.org/linux-usb/11ed5458-4b88-ad72-4497-89ff9346a40b@gmx.de/
[1]: https://lore.kernel.org/linux-usb/f9f1ceb6-6db5-8ef1-944d-381bdf65599a@arm.com/T/#t


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

