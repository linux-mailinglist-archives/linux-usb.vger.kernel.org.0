Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36BAC3F1F93
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 20:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhHSSKZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 14:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhHSSKY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Aug 2021 14:10:24 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297C1C061575
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 11:09:48 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id h13so10429545wrp.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 11:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQwjsZNOUMrWFnt3K2UNjk6w80qkewmq3jv0/4YKne0=;
        b=KAspNOp8gVf05uxyJRlLkqLMds021Druu/nrUZjP+FDP6fkXmoOjGDdiDD6fWnoGil
         eWxkzY8/K6jUqGWFcFKg5g1WoTxJsiMKaXrbTjZ073y6WaGrypcE2pTZ0NXyDK1Gnol7
         ELFwR4yNQIG4ky7p9pJJMtO9MI3Tpa5qNFTIAnxXTQ0W3zhG3kY3NP0KZOgo8STVn9yM
         WFqg3BJXlLBB+L+5+Z2xncYuUGyY9sE408eAex3IFkdw+IAxiFkvbnMEbLBxpexhaOW+
         16iKTzSJ70uHxOoJOTEwYQ3ozS323fD2gXQ1PD/ziOgnrEl20nXLm3enLSl36cJxUIU1
         BijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQwjsZNOUMrWFnt3K2UNjk6w80qkewmq3jv0/4YKne0=;
        b=GQJGo5UH5xBQ3ZgnCCd4r4Y6L6qzXS1Z8YM/Kuew998RrnNrb03ZgwuiHSeRPKmRjV
         2TXZEG/RZbRPydpGW9l5Bl8MkcG6Vjg6RA5CBFrzAUvJulP7qSZb/y088m81qYMVypRG
         Zgz0YSUlmcVkxJPXgLIKso2T/9BiZzEMKVHII8zm1XnlWeqDlF96fL2ywitPSR5DEn6E
         sx9EVquo48ObujduW8lT7Fv278V4AkddPUDmUu0hJOf5x3V/FuN6fVIcdtiAba8CJ3Rw
         aXcBy8Rx89yQoGGTSHRP1ztzOuBgIFT9AF/lSnSEto6nV5dLc6Rk1kZ64Ckmy7d3Fj4o
         PiuQ==
X-Gm-Message-State: AOAM533GeV2X9i1bT0tpyhknqLPrGL3OS+ueT+vklWYV3FA54vXgspIz
        rrK10FOlmvVbvz0X6cLl0SVwAA==
X-Google-Smtp-Source: ABdhPJw3HqPpkivzp8qXHt1XNeUUK83Qb0rGzPzW37k/jYByMhzaPer8jH9bvgad1FZhsq3H3CE/Zw==
X-Received: by 2002:adf:dd92:: with SMTP id x18mr5545219wrl.123.1629396586802;
        Thu, 19 Aug 2021 11:09:46 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id h16sm3625668wre.52.2021.08.19.11.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 11:09:46 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 0/5] usb: isp1760: clang analyzer fixes
Date:   Thu, 19 Aug 2021 19:09:24 +0100
Message-Id: <20210819180929.1327349-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This are fixes for new and pre existing warnings noted by clang
analyzer in this driver which complains about some unused read values,
shift left using negative uninitialized slot numbers and zero
maxpacketsize.

Cheers,
  Rui

Rui Miguel Silva (5):
  usb: isp1760: ignore return value for bus change pattern
  usb: isp1760: check maxpacketsize before using it
  usb: isp1760: do not reset retval
  usb: isp1760: do not shift in uninitialized slot
  usb: isp1760: clean never read udc_enabled warning

 drivers/usb/isp1760/isp1760-core.c |  4 ++--
 drivers/usb/isp1760/isp1760-hcd.c  | 31 ++++++++++++++++++------------
 2 files changed, 21 insertions(+), 14 deletions(-)

-- 
2.33.0

