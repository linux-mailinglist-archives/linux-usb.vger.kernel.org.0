Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6044213EDC
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgGCRn2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbgGCRmy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:54 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA271C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:54 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g75so32749650wme.5
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ar/8CXa0JGn4ACsDbJKg13GYxeqcnHfkQOqZqxVb5Xk=;
        b=ZJ9YkqRCR08W7D/BoyIV25JCVqlnsEAFqL/a7+GssUrikvJ3UgUMYFFVr4kb6PlfkP
         PbEu/8Uy/n+c6uq+uHe3+nd6v/dr7FD5VjlMHCvl3xObQ5xGJshqkgN+Jxtt7679kskB
         QR6eC0Jr+WTrpNO/QE2ddYQ3aCYDTWlt0Zmc8ijuvi1X7m1BFEK4o9ssVxNpSo5a9Lg3
         DI5y2oxQ+iaeIfSi30Qo4bcIEd+idvYXfrz7+waxin9TDsyAFkMhisTWqauwWGKu2Hv2
         tmRh3A+nSgtNzrT5raJfpL0gBQUD8a/vgo3jBXXMWiSgBaf1Aof3yoiB0TXmXdxMNFhE
         u9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ar/8CXa0JGn4ACsDbJKg13GYxeqcnHfkQOqZqxVb5Xk=;
        b=G7QdBq9IU7JkoQ1OciGFW8oKxfiW7+oni4ytbwlWCJg2QhwreIsD/+kGCNFNgyf3n9
         ARZCiimHuFt07vL+pADDHlRfXsyYCbhFwB8QZIPMAJMQ9nwRl+OvxQU4qmHK2Gy2FUUY
         2b2QP9KbD2lnAgIcihKBHQcwNi9sIPpU+p/ryTABHBPGXagsEiqyRast54zp+iKfpGJB
         oXwKS/8YY/vYOh46NtsER/04nBSJNRS8btKmA4VqCYs8Mb0bYsRrrIGB4Bo2ij2AWUGk
         8H7FaXm9nKshpVVbjdbm2MiYS3rCC0Ldxo7A/6MF5KmrKJPDmabwdroByfQB8OwpvAFO
         GgTQ==
X-Gm-Message-State: AOAM530sbT8vk5JKFECxvI8oER6HfgO8bvaHMZ8K4QfUn9FfOQ8Fs6F8
        8JJbkXEvq+dRRZb/y09ksh4ZuQ==
X-Google-Smtp-Source: ABdhPJz/OvxTAkEUca7rh74VV65Ur3XQuwUIc/y51MuJ27q7FM/HDh2vT2rioaHvtnLRjIXkbXLZig==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr40040224wmh.159.1593798173424;
        Fri, 03 Jul 2020 10:42:53 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:52 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Christian Lucht <lucht@codemercs.com>,
        Stephane Dalton <sdalton@videotron.ca>,
        Stephane Doyon <s.doyon@videotron.ca>
Subject: [PATCH 24/30] usb: misc: iowarrior: Fix odd corruption issue in the file header
Date:   Fri,  3 Jul 2020 18:41:42 +0100
Message-Id: <20200703174148.2749969-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Looks although Stephane's name was corrupted somehow.

Cc: Johan Hovold <johan@kernel.org>
Cc: Christian Lucht <lucht@codemercs.com>
Cc: Stephane Dalton <sdalton@videotron.ca>
Cc: Stephane Doyon <s.doyon@videotron.ca>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/misc/iowarrior.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index dce20301e367a..40e8c06894bff 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -9,7 +9,7 @@
 
  *  usb-skeleton.c by Greg Kroah-Hartman  <greg@kroah.com>
  *  brlvger.c by Stephane Dalton  <sdalton@videotron.ca>
- *           and St�hane Doyon   <s.doyon@videotron.ca>
+ *           and Stephane Doyon   <s.doyon@videotron.ca>
  *
  *  Released under the GPLv2.
  */
-- 
2.25.1

