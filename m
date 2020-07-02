Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C1F2126B6
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730098AbgGBOrH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730088AbgGBOrF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:47:05 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CCFC08C5DD
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:47:05 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id j18so27095532wmi.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ksR11Jmvb7SL0E2lHCNJ8PR7e/D9ZxRofBGhwA7ldY=;
        b=zmksYIBaxrCz5zyc7rriRGYaT0Dcm87ZjU1pdpSJu/hULGsdNsjYb6FUiXXBfIhkak
         bpo7SVVHW5OF5iVWGKwXmW+Trqf5MfMEdS7OTZHjDlp5LV2Rh74zx5NoFQsV5EjpswdF
         J8a5P0Eee+MW/Ki2PC56ZGCds6qtVFuWuvgEp2BbisXPWlfPlpCKJRaFEXgmvJoCs/RG
         IY2zGwduN8XSqswG+he9Rbtj1V2NqNzniFGoIU8N4R9AxWWk2q38GxfZTHzjUk35Fuxs
         CGW0402bmXhkN253lJNUGipofaJfzUZSGFnUwKYsQQ269MeS0IEzGDIUZTx5OQxqFjrk
         xBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ksR11Jmvb7SL0E2lHCNJ8PR7e/D9ZxRofBGhwA7ldY=;
        b=iVvFJfS+h/UCCz6hFxT7DV0/6wBfgvOHi274O3qlupcvCGDM3oQROouySLt2oI/yod
         o6jVXhBV/c7icUV6yApAnEtvvd79EMjg96SeqvwjmGgcz9UWW7oETVoAYI5tMLSM7gt4
         DwbpNtVM6cQI97OpEkiOwKckNRDs2kPoX8Wu+g+1OPNs8doEH5KGq+2NKpFpC4JEvF6z
         lUS6MjL38p2IsmE9+m4i7WLQLV6mMkjqPo4tPoEHXeTqxopKwBUgXRmK5/nrFIj3Aly+
         ZnRbO/gbQKk6RIu34aUTmo+2vQW8Q9vgLRZI5hiBJ8J+c4STprXijxlRgrnzjcG/vYrt
         nB7A==
X-Gm-Message-State: AOAM5313rhU0xC1zM3onx5a7H2dJLHotZVxIADe1YZJpTY/vrF8UxpQe
        9YyazggimvJgmjQG8892ZqRmHA==
X-Google-Smtp-Source: ABdhPJwmdFlL7RkkYFdFbYW5E+P0S/O3Mbkj0vldn7UPZvUiB5nbMpzJlLHg5XaYehkEIQxF9v3LEg==
X-Received: by 2002:a7b:c348:: with SMTP id l8mr34582906wmj.54.1593701223995;
        Thu, 02 Jul 2020 07:47:03 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:47:03 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Peter Korsgaard <jacmet@sunsite.dk>
Subject: [PATCH 26/30] usb: c67x00: c67x00-ll-hpi: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Thu,  2 Jul 2020 15:46:21 +0100
Message-Id: <20200702144625.2533530-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document any of the functions here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/c67x00/c67x00-ll-hpi.c:269: warning: Function parameter or member 'sie' not described in 'c67x00_ll_usb_clear_status'
 drivers/usb/c67x00/c67x00-ll-hpi.c:269: warning: Function parameter or member 'bits' not described in 'c67x00_ll_usb_clear_status'
 drivers/usb/c67x00/c67x00-ll-hpi.c:404: warning: Function parameter or member 'dev' not described in 'c67x00_ll_write_mem_le16'
 drivers/usb/c67x00/c67x00-ll-hpi.c:404: warning: Function parameter or member 'addr' not described in 'c67x00_ll_write_mem_le16'
 drivers/usb/c67x00/c67x00-ll-hpi.c:404: warning: Function parameter or member 'data' not described in 'c67x00_ll_write_mem_le16'
 drivers/usb/c67x00/c67x00-ll-hpi.c:404: warning: Function parameter or member 'len' not described in 'c67x00_ll_write_mem_le16'
 drivers/usb/c67x00/c67x00-ll-hpi.c:443: warning: Function parameter or member 'dev' not described in 'c67x00_ll_read_mem_le16'
 drivers/usb/c67x00/c67x00-ll-hpi.c:443: warning: Function parameter or member 'addr' not described in 'c67x00_ll_read_mem_le16'
 drivers/usb/c67x00/c67x00-ll-hpi.c:443: warning: Function parameter or member 'data' not described in 'c67x00_ll_read_mem_le16'
 drivers/usb/c67x00/c67x00-ll-hpi.c:443: warning: Function parameter or member 'len' not described in 'c67x00_ll_read_mem_le16'

Cc: Peter Korsgaard <jacmet@sunsite.dk>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/c67x00/c67x00-ll-hpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/c67x00/c67x00-ll-hpi.c b/drivers/usb/c67x00/c67x00-ll-hpi.c
index e1fe3603140a8..7a214a3a6cc70 100644
--- a/drivers/usb/c67x00/c67x00-ll-hpi.c
+++ b/drivers/usb/c67x00/c67x00-ll-hpi.c
@@ -262,7 +262,7 @@ u16 c67x00_ll_get_usb_ctl(struct c67x00_sie *sie)
 	return hpi_read_word(sie->dev, USB_CTL_REG(sie->sie_num));
 }
 
-/**
+/*
  * c67x00_ll_usb_clear_status - clear the USB status bits
  */
 void c67x00_ll_usb_clear_status(struct c67x00_sie *sie, u16 bits)
@@ -395,7 +395,7 @@ int c67x00_ll_reset(struct c67x00_device *dev)
 
 /* -------------------------------------------------------------------------- */
 
-/**
+/*
  * c67x00_ll_write_mem_le16 - write into c67x00 memory
  * Only data is little endian, addr has cpu endianess.
  */
@@ -434,7 +434,7 @@ void c67x00_ll_write_mem_le16(struct c67x00_device *dev, u16 addr,
 	}
 }
 
-/**
+/*
  * c67x00_ll_read_mem_le16 - read from c67x00 memory
  * Only data is little endian, addr has cpu endianess.
  */
-- 
2.25.1

