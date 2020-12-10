Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946CE2D588C
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 11:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388922AbgLJKsd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 05:48:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729557AbgLJKsd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 05:48:33 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A20FC0613CF
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 02:47:53 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id d2so3681524pfq.5
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 02:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/1CLF3jhgzuG8CXsCmdXZEYaITzNoEWk6wc5CrYfURY=;
        b=MYtZnMZka/yCtbeqjEtHPQMPRp1pS+LV5yBBJOSv5CxwHvamurnZGghYtmeuTU8F61
         sDFbaTQ5Vh11gbpI41KxB+fM6OZ66qRVUMM00yzvye7KdgyP9tov+Pi9eAdXP0k5Qz7R
         uSrEc6Xw6liW70X0OkD8dzvMZDS8DkyvuyhmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/1CLF3jhgzuG8CXsCmdXZEYaITzNoEWk6wc5CrYfURY=;
        b=top355HWUG/WKZpNh4VClLwmCzwBxGp4gIaom087XkYZs7/KSuf7N2c1nLSGNexGDx
         eEBnSL5d+48IcoKVlBLvtFkHVga6yNo3ZqouZm/RVFsPeLouMLQxHIu5Rik8Sc5k4ZYi
         G+1m9ckBU4D66jC8gKfBLgzDf4R4+lODn6Kib/5BqEMfn4jXsd+8ilsmGh8UdbG5fn3K
         q0vVnCRyrheg9YzC1+N3MSOqlLjub8SMFepa3EoLEuCp/otLJbHIi2qjZfe2hmj+pdNP
         IHgdfbuG7aAfU5rJtBPAFkFiS1TraUcHP6eSAVStyRsIiwVQ9nPxtJUJZJLvWSTN6BkI
         FZfQ==
X-Gm-Message-State: AOAM531I9xACQ5hpitD8s6UY/feyB67hJ6Z9HX3UGouLj2zf2MlkRb+0
        qEfx8vdOmw5PrOjjYoWp/BGBIOpx3zWJDw==
X-Google-Smtp-Source: ABdhPJz1UOPyHnOnpgetFP3LmdV2keXwZM75/Y/XQxXs0IUr220E0wzUZTDhvJvtJum/Y71jRrXerg==
X-Received: by 2002:a62:d142:0:b029:19e:6b61:7f80 with SMTP id t2-20020a62d1420000b029019e6b617f80mr6244596pfl.9.1607597272744;
        Thu, 10 Dec 2020 02:47:52 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:f693:9fff:fef4:a8fc])
        by smtp.gmail.com with ESMTPSA id y1sm6386658pff.17.2020.12.10.02.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 02:47:52 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
Cc:     Zhanyong Wang <zhanyong.wang@mediatek.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Release allocated periodic bandwidth data from reset_bandwidth()
Date:   Thu, 10 Dec 2020 18:47:44 +0800
Message-Id: <20201210104747.3416781-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


xhci-mtk releases allocated TT bandwidth data only when whole
endpoints of a device are dropped as there're only {add|drop}_endpoint()
hooks are defined. This patchset adds more hooks and releases all
bandwidth data from reset_bandwidth() path, not drop_endpoint().


Changes in v2:
- fix a 0-day warning from unused variable
- split one big patch into three patches
- bugfix in hw flags

Ikjoon Jang (3):
  usb: xhci-mtk: code cleanups in getting bandwidth table
  usb: xhci-mtk: delay association of tt and ep
  usb: xhci-mtk: fix unreleased bandwidth data

 drivers/usb/host/xhci-mtk-sch.c | 180 ++++++++++++++++++++------------
 drivers/usb/host/xhci-mtk.h     |  13 +++
 drivers/usb/host/xhci.c         |   9 ++
 3 files changed, 133 insertions(+), 69 deletions(-)

-- 
2.29.2.576.ga3fc446d84-goog

