Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A2C2D9716
	for <lists+linux-usb@lfdr.de>; Mon, 14 Dec 2020 12:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407674AbgLNLHU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Dec 2020 06:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390255AbgLNLHN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Dec 2020 06:07:13 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE0AC061793
        for <linux-usb@vger.kernel.org>; Mon, 14 Dec 2020 03:06:32 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id o13so5954566lfr.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Dec 2020 03:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dV2ATFpp82f3puHBoSuNF7OINlKucj96jVBrKaQtfvk=;
        b=f2zr68kFm8jY1AIIkhcI8flmhCXrjq8nD+QkC+7U9EqeZLFcIbySZOo2BHAk3hD8fG
         K79sb/0u402Nept/UUANSfr21h7AQ0SvB0wJatlEOIHVLZs84k61wEkTujTjGJyBF55O
         xGLXiRw3UYofkjx+JYBbpzVtNwldfIrCdSHVAQi72Oxstvl6cKnAbzzc/oXyoL97/wiR
         KDhnDlUg2r+K7NrLy+RHpWt205dAPg+Wb6gX5w2f39V+TmM9UGM/3/2+yGf/PANppb5V
         PNet7nk22ZsNj7P32cgfSwDu9qsdliNpz7qUY2bu5O8RXZiqNEJERRtKsKQigM1v+Dye
         8omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dV2ATFpp82f3puHBoSuNF7OINlKucj96jVBrKaQtfvk=;
        b=az+3gyVlvS4uW82BepE+xjimlEkDWI/YpwueQ+IICDj+v+H7EyRDihB1SCA2PXYd3t
         zEXF6OGypJgNTJ2YcNbJqpOgRky3Le3HbeLcKYxBC8ylj34uYiTgkezH9f2+kkJ5//dD
         mC+BW420rmPWHNnz8s8Q67a8fMGPxqRCPL9BV5ImV86U+M8tl/DS3u/EBRxARLxUd+L4
         hQlt39Oenxo6KTtsH8MQu3l/XUWQ5ke1x0YPKRtXhRm5hgiEDnZXt6q3t8teK5JKeSth
         1WtDnZJ0fWKQsBY2S0ejnWwpWjNAGLjFJOM0olvrGQTtq/Py1+HMw5b/O017xZyVep2/
         V18A==
X-Gm-Message-State: AOAM531QQmtfeFu8b9Yva7B4+KgFjRH9VvmGOxxYTPRD0nKpXuK6ynjn
        0n0ROHhy2bx3kyJpdlDVgalpa77NJXHLWp55
X-Google-Smtp-Source: ABdhPJx9dYzZhY3Lo8Qf63HhlVJtwo0GTXla3Lptn2PZGE9qiNMUMosq3WfCQtTZfSv1N5pNNiAAhw==
X-Received: by 2002:a19:ed6:: with SMTP id 205mr9757848lfo.159.1607943990877;
        Mon, 14 Dec 2020 03:06:30 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id h21sm183488lji.89.2020.12.14.03.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 03:06:30 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 0/2] usb: dwc3: drd: Check graph presence for extcon
Date:   Mon, 14 Dec 2020 13:07:39 +0200
Message-Id: <20201214110741.8512-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dwc3 shows error message on probe if port node wasn't found in PHY
controller node. But that is actually a valid case for the role switch
mode and OTG mode. This patch series makes sure to hide that error
message and also does a bit of refactoring for that code. Similar patch
(for different subsystem) already exists in kernel tree:
commit ea5bc3b15e0f ("drm/of: Make drm_of_find_panel_or_bridge() to
check graph's presence"), and the whole `of_graph_is_present()' function
was implemented exactly for this kind of situation.

In v2 submission this was a single patch. But in offline discussion with
Andy Shevchenko it was decided it's better to split it into two patches
in order to provide the minimal change for further possible backporting,
and then do all style related changes on top of it in the second patch.

Sam Protsenko (2):
  usb: dwc3: drd: Avoid error when extcon is missing
  usb: dwc3: drd: Improve dwc3_get_extcon() style

 drivers/usb/dwc3/drd.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

-- 
2.29.2

