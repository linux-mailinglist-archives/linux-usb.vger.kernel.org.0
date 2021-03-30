Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B982834E2B4
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 10:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhC3IGc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Mar 2021 04:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbhC3IGX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Mar 2021 04:06:23 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92C4C061764
        for <linux-usb@vger.kernel.org>; Tue, 30 Mar 2021 01:06:22 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id f17so5743369plr.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Mar 2021 01:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ohWyba0j454EaOcs1wMSu7zcUbDYhtyMLYsDEhrXDGs=;
        b=jqo9lLZ7GcMnZC5ZBsguOjSYs6hFI12Dfmn60MxS5gDNrO/+nY8Vn2rY4ywOySIC/k
         QaZ3yvUp/zWMoXGE5D5p0Wf3cwyP0fPTwORkzq7VIU3Tn8pSVeL7osPiN9DAw4zCbc+T
         H9uaV6epPrQ2WddQgw6oq0J+rbn8f5L+2JWKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ohWyba0j454EaOcs1wMSu7zcUbDYhtyMLYsDEhrXDGs=;
        b=M5VX6rxMo+/A1FqBz6gOoU/oqP5bx8WwFzBcbhuS02Ozt4FQ6e0wERCfteCims8Yp0
         gS65wv1csi7qQqnxjJ9VpmNWFwATA76/eyt0g6ozidbVpYOIO+NNRIUEGQyvbTa6vYqf
         96JMynhHncrkMMc14nuJ54XHrYnNs7KFO5ldWWjYGUt3ceHA35sJvxxQcwdgTAmHj+kZ
         qhtSGxCgZeGKofd9MRw3tywd74FkgeiLsZHfmRVHnlGkiffTncMByaH3amrrsGObfNr/
         6uM6IvQrlMaQUzxx72tvl3XHou0hLbVaa6rTepIipsXU+KyiWRh+48ab+byRnJvl1Wx4
         Gfxg==
X-Gm-Message-State: AOAM532r45x5KRky+Ak2tBPH/8h19cjrOEbySAQRqeOr4QA2oiunShN3
        uGHFT7nJwp1FCQ624mFjDAoSmfDgAsFcrQ==
X-Google-Smtp-Source: ABdhPJybMW7B8cavgdFxhd4SwS24cBzLl6Y5MZwunkIgjR2DOE2qND49L/uJeWGi9/heazJekmcuZw==
X-Received: by 2002:a17:90b:e01:: with SMTP id ge1mr3199883pjb.117.1617091582045;
        Tue, 30 Mar 2021 01:06:22 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:49fb:d79d:bee6:d970])
        by smtp.gmail.com with ESMTPSA id f23sm19118913pfa.85.2021.03.30.01.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 01:06:21 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-usb@vger.kernel.org
Cc:     Ikjoon Jang <ikjn@chromium.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] usb: xhci-mtk: relax peridoc TT bandwidth checking
Date:   Tue, 30 Mar 2021 16:06:15 +0800
Message-Id: <20210330080617.3746932-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series is for supporting typical full speed USB audio headsets
with speaker, microphone, and control knobs together.

With current implementation, such a device cannot be configured
due to xhci-mtk's bandwidth allocation failure even when there's
enough bandwidth available.

Ikjoon Jang (2):
  usb: xhci-mtk: remove unnecessary assignments in periodic TT scheduler
  usb: xhci-mtk: relax periodic TT bandwidth checking

 drivers/usb/host/xhci-mtk-sch.c | 120 +++++++++++---------------------
 drivers/usb/host/xhci-mtk.h     |   2 -
 2 files changed, 41 insertions(+), 81 deletions(-)

-- 
2.31.0.291.g576ba9dcdaf-goog

