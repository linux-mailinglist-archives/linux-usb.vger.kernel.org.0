Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B51B21269D
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729964AbgGBOqn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729952AbgGBOql (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:41 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDADC08C5DF
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:41 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id j18so27093242wmi.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J+kkMZUiAX6to3IhikTDOCe6yGlOLBFelQGfEcxa7J0=;
        b=oYqkVV24P/d5VFn+vZ+xu7zEz2T3MyeSa9GQ7xEp2PIkR7HOZmXSWQOfkdMwfoCcHF
         ML71NeDp1hvfAL0OmhVnekBhkJTyf/UBwHCpBramw4Q753VTpYPN/yq6UN4vGUP6nUPA
         gy215GDrhK3vUkq/z0z6i8XYbjgER+KlYeuFAQld6Dfh8HOex73FM2icUOHaoXcYjQkO
         yinUBmWL3w38DB7AiNpJyvnFg01Nxe0ByKys8XaXwumSrB14MyGneKgiaWXOnTYSwx0+
         EyyRZhoCTLrVExgy08RIiE5WQ12iMr43K1LrkrW8+qvyFiOIcGcxrRQ+n6MJ3wo430/Y
         5zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J+kkMZUiAX6to3IhikTDOCe6yGlOLBFelQGfEcxa7J0=;
        b=IsenJDt4VAU0fG8YHl78WqcquWjd7kxYD2cRThSk9/05HleE9zv+gL6sS72da1EvT2
         qGL7ERQ47E+V/rq11tNbw6XVQH6FldlcCHNKTX4JVmhNZwRyECJdbR2ESbASsRW8HeKA
         YB3OC8grv/BvFNKmx9dOPUPSvtqBgBF43+R53kLF/0p6ELeNpCunZrYuGMlZotHxGJbU
         i/gpML19mXTikEdH4KiMSWN40Md/tx8vo03cispkCf4LkqKKlMz8u+6F5JBuY/Bcw1QZ
         q5Rb1+l8gd5C2A2aFZF0qoiCQKBQHhtQUmsT1uJmzddWHl0X2DB8QwUiuiK44Cchif2v
         l09Q==
X-Gm-Message-State: AOAM532SCtVBbEgOYkT+Jf59bkZ+6meptpbd4InxGFB2gXQsmYQeyaO4
        abcHPl/E7awfbb7Z25tN4LP8tA==
X-Google-Smtp-Source: ABdhPJy7iRwFbgv6eglAJpDWU4n/odEIBwNiUgvkoNtAwDcc/kbXS66Nd69xNj3S9P4CnYRcEag4EA==
X-Received: by 2002:a1c:7306:: with SMTP id d6mr23108453wmb.113.1593701199996;
        Thu, 02 Jul 2020 07:46:39 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:39 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 06/30] usb: dwc3: ulpi: File headers are not doc headers
Date:   Thu,  2 Jul 2020 15:46:01 +0100
Message-Id: <20200702144625.2533530-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Demote ulpi.c's file header to a standard comment block.

Fixes the following W=1 build warning:

 drivers/usb/dwc3/ulpi.c:18: warning: Function parameter or member 'a' not described in 'DWC3_ULPI_ADDR'

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/ulpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/ulpi.c b/drivers/usb/dwc3/ulpi.c
index f62b5f3c2d67d..e6e6176386a4b 100644
--- a/drivers/usb/dwc3/ulpi.c
+++ b/drivers/usb/dwc3/ulpi.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * ulpi.c - DesignWare USB3 Controller's ULPI PHY interface
  *
  * Copyright (C) 2015 Intel Corporation
-- 
2.25.1

