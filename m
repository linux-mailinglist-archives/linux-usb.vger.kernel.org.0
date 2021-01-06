Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7912EBED7
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jan 2021 14:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbhAFNhs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jan 2021 08:37:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbhAFNhr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jan 2021 08:37:47 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086DFC06134D
        for <linux-usb@vger.kernel.org>; Wed,  6 Jan 2021 05:37:07 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id b2so4443801edm.3
        for <linux-usb@vger.kernel.org>; Wed, 06 Jan 2021 05:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XPEliyiRuzwI93toBkXa4QPlg8YPJqkoRZuOdRubluk=;
        b=yl0HYIR5s9MenDeT4XsNXJ9fEA/1e3mGH9GPClXe8s2vo04U6NlIXSOCBCfOh1cW1W
         KPILVUkOENIhmUci0DdSV25ZVvsVn5DnCMh7VPqGfvSljwjsw2N9dIDkUQlqNH+wG3Cj
         uvrpx7FGpg2RIp5k9hV3iugDKPnMU6NdIwu9Z7H/lOnXkHLuNhIq7loNcr5rz0NGoKTz
         w5y8JAW1bWwx0fsu2V949p6iaGFy3eOwH8egolkKXcxjQA+XvKq3Fvs5Hywu8Z31+QqS
         jDzg5rQSbGW242l4/jerjAtwm86dePEp0XitJltd4Lr+0Kc+6XEVB5QuNu7pUHtHvhu2
         Rx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XPEliyiRuzwI93toBkXa4QPlg8YPJqkoRZuOdRubluk=;
        b=sBGJCjAFyHiPHgM2rtcJByvK/Mo0JMxBvNzgAGFRp8pFV3FEFUK/2ZYyUI2P48ThyV
         3b/+EdREuH7z2CJnW0hjKbvzoVvUL8j9Z6d9qBgfJOVsMCMrGNvwBiKdWoBsGtasOf60
         De8OzFGBpVwq/A/C4LhFzRnkFLnxlEDJsEzolmZhkOu1LxqXCRxBtxA3ciP328unKnGr
         cW9CyqR54bqOAnfEd/Knp8b27vu5/bOSeCgvpYYfYbn6KeXC35/p0Xeh22SzeDpih3ef
         y3m7+6vUMwzrffvbBgKqvv5dz/I/40cqFasnLJ6X3+0KkT52ITYwfRKILIxH25D1o6Mx
         wBuQ==
X-Gm-Message-State: AOAM532u0zC0CLppObqchMtX+wLtTU9w0WyMBiw8OV8aD10w7MA4fRco
        VexZH1AVx89shSk0nVeXDrKwOg==
X-Google-Smtp-Source: ABdhPJx/1vvfuOLzmxE15pjnnC4c5wWRe3M9KBn0bmPu64n8eazDenjWMbbMPBHgvZ65ryOHyM5aWA==
X-Received: by 2002:a05:6402:ca2:: with SMTP id cn2mr3987735edb.137.1609940225772;
        Wed, 06 Jan 2021 05:37:05 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id n20sm1259275ejo.83.2021.01.06.05.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 05:37:05 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] usb: gadget: audio fixes and clean ups
Date:   Wed,  6 Jan 2021 14:36:47 +0100
Message-Id: <20210106133652.512178-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset is a collection of fixes and clean ups found while
working on the uac2 gadget. Details are provided in each change.

Changes since v1: [1]
 * Jack's patch added to the series (no more deps)
 * Warning [2] on Patch 3 fixed

[1]: https://lore.kernel.org/r/20201221173531.215169-1-jbrunet@baylibre.com
[2]: https://lore.kernel.org/r/202012291638.QiDQi3Gs-lkp@intel.com

Jack Pham (1):
  usb: gadget: u_audio: Free requests only after callback

Jerome Brunet (4):
  usb: gadget: f_uac2: reset wMaxPacketSize
  usb: gadget: u_audio: factorize ssize to alsa fmt conversion
  usb: gadget: u_audio: remove struct uac_req
  usb: gadget: u_audio: clean up locking

 drivers/usb/gadget/function/f_uac2.c  |  69 +++++++++++---
 drivers/usb/gadget/function/u_audio.c | 130 +++++++++++---------------
 2 files changed, 112 insertions(+), 87 deletions(-)

-- 
2.29.2

