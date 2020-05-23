Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38921DF488
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2020 06:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387562AbgEWEMQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 00:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgEWEMP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 May 2020 00:12:15 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F650C061A0E
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2020 21:12:15 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ci21so5853185pjb.3
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2020 21:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gEbiXPOVzb6l609iXNKKkbZ9NpmGZQsueDMQ1EDDZ9s=;
        b=NckDMGHMskW1gWZnB4u4TCZi03QywErgjTEeoCcEP1lCZtUJXH1X6w/A58bfy6Wq1s
         VzCAscttd/0oSduppqZw4RtDIFJ5Dafn+F/gwezXE7mC+aM4GpsiCmTFbtHnc30FPOnC
         TQMqW6dkk7vWOVpC3NV2yJ4C5iZPloiDGyBOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gEbiXPOVzb6l609iXNKKkbZ9NpmGZQsueDMQ1EDDZ9s=;
        b=uiE8xnUM0dOQKs9enmP5QJGoiU/66OjJeg/dXhQRmlJh56y20VrqsE4QAU5K/ZVroF
         dFTG4iOjdDLeqm4jNZaX+Lg2mhWrSrZ7oaFT/oDApwcjaVHB/8G4+TW5HG5XZW5TjUjP
         PEotdXSpq0l6A6OFWcWjhiCBuLs9AHlLUGpLl8KTRCTbZfcYM/15WipMoL3cooKHJ8eu
         lK3nFgqvmCvy0iO/QnERy61OH0j50KDhEh7TtoQck7luDoApJ1PsGr4uehmMKB6NQoFV
         H4UXC+p/5VNQBW52l15CqJzRow3pshwg8oAZlRn/d0W/IICEFpybomSKPxlW/euZy4jA
         75sQ==
X-Gm-Message-State: AOAM533ftmnsMVj3QlnuMavyEJgOmKOFnhi+/91nrhEctFRZJjTtf4+F
        T7eDYkpD75hZndXSKPgqXH+xlA==
X-Google-Smtp-Source: ABdhPJyzSVHR+OuuJlxIZf66mUdu8x7cQ6x8OpG1RuDyYZsBABX4xWRimyeWBsQ3DY+83Pr7ASzQWA==
X-Received: by 2002:a17:902:6b09:: with SMTP id o9mr16542135plk.100.1590207134669;
        Fri, 22 May 2020 21:12:14 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id h7sm7075741pgn.60.2020.05.22.21.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 21:12:14 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     enric.balletbo@collabora.com, bleung@chromium.org,
        groeck@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org (open list:DESIGNWARE USB3 DRD IP DRIVER)
Subject: [RFC PATCH 0/1] usb: dwc3: Extcon hotplug support to of-simple
Date:   Fri, 22 May 2020 21:12:00 -0700
Message-Id: <20200523041201.75217-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some platforms like rk3399 would like to power on the USB PHY layer only
when external devices are connected. This patch introduces optional
support for extcon USB_HOST events, so that child devices are
populated/depopulated when external devices are connected/disconnected,
respectively.

This is also useful since some PHY drivers like phy-rockchip-typec only
configure their Type C Phy on power on; if they are only powered on once
at boot by dwc3, these drivers will not be able to reconfigure their PHY
for peripherals plugged in later, like (Display Port) DP monitors.

I thought I’d send out an initial RFC patch, for comments and feedback
about the approach. Depending on feedback, we can refine this approach
and modify the bindings file.

Thanks,

Prashant Malani (1):
  usb: dwc3: of-simple: Add extcon support

 drivers/usb/dwc3/dwc3-of-simple.c | 149 +++++++++++++++++++++++++++++-
 1 file changed, 146 insertions(+), 3 deletions(-)

-- 
2.27.0.rc0.183.gde8f92d652-goog

