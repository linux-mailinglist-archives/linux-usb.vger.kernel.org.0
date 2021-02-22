Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB40321570
	for <lists+linux-usb@lfdr.de>; Mon, 22 Feb 2021 12:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhBVLwy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 06:52:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbhBVLwt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Feb 2021 06:52:49 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1700BC061786
        for <linux-usb@vger.kernel.org>; Mon, 22 Feb 2021 03:52:09 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id o9so16141372yba.18
        for <linux-usb@vger.kernel.org>; Mon, 22 Feb 2021 03:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=OF1T440M439fHwXuUnr6E+We3kKdtH2NyZbidv2tW2I=;
        b=FmqczpbJE4Ec1YHLu4ZwTS9WkwKr2wmLLxMIyUdvdJ2q64KYqgw4LxQJlYnBAGaruA
         FhlIQOCiYCGMFFL4zTTc0iTubO2T4arPlLNTjhAMmdQzzlOXHCZoHbjWfTVeF/dgGGw8
         4vzFlTfyRkWzU8RCQGk+WFNLn6Tle1yjjYFPXphM0FmNpLNWMag0k+iHBbuPmrJe2pwh
         mcbA9G2K+QRQR0JnGj8qMlelSJsPkQhiIvlwFxQuvmPhLirbI3PRZNe025c2OsqT0Byj
         nNVbx7RLET52POSLxKFVSg6wXlKYDwRGzHtDXk+9Q8sJ43nqpN70b3KwIP3enKGBAx7I
         KkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=OF1T440M439fHwXuUnr6E+We3kKdtH2NyZbidv2tW2I=;
        b=UhqLkwIGiL55bN45R3nspxLiB/ky/CmXMwsPZ4mkgHxflxnP8x2JkH1Q+kKZweHpzO
         URTv46+sql+HTTvunr4BXQ5CLynqGCiRzwAJD3PHiDt7qUc7gzQvHSTyqyDs46HxN4+3
         ET1o3orTw7pSEAsrwKK91yc8of4iEtCfiNt+ZVcBhoaeR8TwQgVEIf6YVWENp97z57HM
         vMR+5OEy7W/F89zq0y104im9OikgK4pcDnqoF637hTINZ8OGPJlOjUkDwu7Kc2xTauKi
         HLZ2nVu/EkRApJ8J0dgTuYVd5PaXc/853UHpyM5RY/HaZOQd69KUYcW3iB8gHT3CjPnO
         2c6Q==
X-Gm-Message-State: AOAM531nd4a4gZlLBVI4a9DqLf1GMtBPlO9EUaMQVGKQtWrePxPzQQ36
        Tkx6+SygRcivxaVGwA6hdXH+xhS/n+w=
X-Google-Smtp-Source: ABdhPJyrpXuERU1y7VFX6l925lRRqJ42IDH7Wskcr0Fd49K7VGoxi9ktCmomPT2ssLHy+mdvsby2WU0Q+kA=
Sender: "raychi via sendgmr" <raychi@raychi.tao.corp.google.com>
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:9c8c:8669:7daa:43ff])
 (user=raychi job=sendgmr) by 2002:a25:d17:: with SMTP id 23mr1551512ybn.387.1613994728329;
 Mon, 22 Feb 2021 03:52:08 -0800 (PST)
Date:   Mon, 22 Feb 2021 19:51:47 +0800
Message-Id: <20210222115149.3606776-1-raychi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH 0/2] an additional path to control charging current
From:   Ray Chi <raychi@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kyletso@google.com, badhri@google.com, Ray Chi <raychi@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, VBUS draw callback does no action when the
generic PHYs are used. The patches add an additional path
to control charging current through power supply property
POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT.

Ray Chi (2):
  usb: dwc3: add a power supply for current control
  usb: dwc3: add an alternate path in vbus_draw callback

 drivers/usb/dwc3/core.c   | 15 +++++++++++++++
 drivers/usb/dwc3/core.h   |  4 ++++
 drivers/usb/dwc3/gadget.c | 10 +++++++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

-- 
2.30.0.617.g56c4b15f3c-goog

