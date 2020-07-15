Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 868D42208CE
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 11:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730795AbgGOJcW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 05:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730790AbgGOJcU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 05:32:20 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25EB7C08C5DB
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 02:32:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z15so1670921wrl.8
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 02:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LLJr1BBujxQgRf198E6OimaqdThx6WekIFuCOWBUZHE=;
        b=kr848DQ9ivIVfBHU6WJ8Wly8JL0ZbRIf1G3oj2WAD7ofS9XQNvwMS2e0gmX4WhVzKi
         D8jxSQC44EqtEw5q8u+Z/ZBHCwviGXkyI0Qg9St4qOfJ4GlXrtdZSweriaNAyUcqy6Jx
         rzzCf6Br8pwtRvpnhljycULVdv60T2JVS4og79hV89iNKWb0a/HI+Was+ROyYO1Umeij
         muJIBhE8XjmyQoDccGKD6GnIC+QYey0ZhjgZQxhZo4OPdfvo5vAkT+3iF/shc0GmpEit
         q5fVyQUAajS3Q9bmzwwkVJK4pAREl9iG0gxQI7B17lhvkJj6lyL2SNDqU5nDl2u3mVEf
         UZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LLJr1BBujxQgRf198E6OimaqdThx6WekIFuCOWBUZHE=;
        b=BwmRt3tjsqcexU5ybQunKjrV6LHZ7oWyqX42t2r3KqTHFmPPr+AlcL7NKybl2/sj14
         Dtl51O5dexQTM2zs33s8Y9FHj8wwmexH2iWAAiBPA+NqZxmAJOx3kDsTbwKMfzFOFfds
         xOVhmdgC4BHft62WhJ4WFcD2Fs3tKiNATT++/Tewy5eStldu8dOEH+fFbgyxkBi+EGSu
         uSahrvx09ke6jwr/mFNjbxPGkc0Fp+Lvcbo7rUkx4a4oIVo3HfUsPCoi4Ue3gdFTyD/W
         CuHxtsnGOd15ZQ0EpPSVI0bHAf9kNWWzsmysrakCCLvkmGTtLVbsUfeC/dVSjzAkR4+j
         UTvw==
X-Gm-Message-State: AOAM5322a7AyV2i5fBqD9oFdMcNQTA10xmlsdsAkyFlhHpv0bBhEU9FL
        h2qwpWuiclIV9uILA83+IG78tA==
X-Google-Smtp-Source: ABdhPJzeuYlG/tm0jxRW34wzZNpRlF352IlkECXOk6bLtk1cRbbPoxaw5zCmvUSrZuy8Wcsq493Kew==
X-Received: by 2002:a5d:4d8b:: with SMTP id b11mr10407200wru.341.1594805538872;
        Wed, 15 Jul 2020 02:32:18 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id s203sm2686991wms.32.2020.07.15.02.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 02:32:18 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v2 5/8] usb: class: cdc-wdm: Provide description for usb_cdc_wdm_register()'s manage_power arg
Date:   Wed, 15 Jul 2020 10:32:06 +0100
Message-Id: <20200715093209.3165641-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715093209.3165641-1-lee.jones@linaro.org>
References: <20200715093209.3165641-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A good attempt was made to document everything else.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/class/cdc-wdm.c:961: warning: Function parameter or member 'manage_power' not described in 'usb_cdc_wdm_register'

Cc: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
Changelog

v2: Fixed-up trailing whitespace (and enabled highlighting)

 drivers/usb/class/cdc-wdm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index e3db6fbeadef8..7f5de956a2fc8 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -940,7 +940,8 @@ static int wdm_probe(struct usb_interface *intf, const struct usb_device_id *id)
  * @intf: usb interface the subdriver will associate with
  * @ep: interrupt endpoint to monitor for notifications
  * @bufsize: maximum message size to support for read/write
- *
+ * @manage_power: call-back invoked during open and release to
+ *                manage the device's power
  * Create WDM usb class character device and associate it with intf
  * without binding, allowing another driver to manage the interface.
  *
-- 
2.25.1

