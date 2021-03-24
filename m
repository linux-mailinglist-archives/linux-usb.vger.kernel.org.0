Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4440234850A
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 00:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhCXXHA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 19:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238941AbhCXXG7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 19:06:59 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38AAC061763
        for <linux-usb@vger.kernel.org>; Wed, 24 Mar 2021 16:06:58 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id j26so6173iog.13
        for <linux-usb@vger.kernel.org>; Wed, 24 Mar 2021 16:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h4nsP5iuSvLRUSUoVyhkKNOJvSrZQbNgl007uSGB9Jk=;
        b=Nm1q6owNG5rx+/fwQyP3HWBenPMSaXplLjhEAlA3MxdK0J/q3Q5IKEUOeu9EbPftDx
         qwADRNgOrFS/7Jey+oH6I2UMDtxfytpDtXH/RepLF78ZfL378dyChrXQpViPlstLQFve
         ukdj4wEbMxN9my+RyGreh1NL6r2cuymInq9kU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h4nsP5iuSvLRUSUoVyhkKNOJvSrZQbNgl007uSGB9Jk=;
        b=bBEj9GnKbmKxmr1O3v2I+awDT7WCGR/d2b1yROIH1ChAVezzR0/J/OOznnClUOakFV
         eZNg8xgZkCfKtbJzJ6Jgdqsn0GjEEp++z7P6MEF/UySM6WkDT6Yk8UwA8RioQfVJnZwM
         ZmYKgffBKYCamW2nMvPX3JAT2Es5UCWkJ6PAUCiPhhotcPuoth5gRFNrZUyBTs4FP+8L
         H7WBxN/9BKqtkY+KCx10govxv9OdhGfcx37V8Im5GmNkll/jqW2dSkSxriPooE8WGoGa
         nkh4VSTR3aDP2+Y+5zbuX4OlRkGFvZZWG5ZORUP8EeFQSPJLSeMAH3bBo/MiGx7+28NH
         mafg==
X-Gm-Message-State: AOAM5339FN1nczo9ewXe5SBbEU2MrR8ZLd6P62de8hr+uaih8rUkmE9i
        xPYmryiZfr31J2KeiccPLRnNvg==
X-Google-Smtp-Source: ABdhPJyS+92HCc3ZBxTa2EOIEXTFs5p8NK2Hu4c2/ZOCCFrNy5I2JuIXSsPRUWGuP6UZtTqU2ZvIQg==
X-Received: by 2002:a6b:650f:: with SMTP id z15mr4183159iob.128.1616627218256;
        Wed, 24 Mar 2021 16:06:58 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id t8sm1638249ioc.12.2021.03.24.16.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 16:06:57 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+3dea30b047f41084de66@syzkaller.appspotmail.com,
        stable@vger.kernel.org
Subject: [PATCH] usbip: vhci_hcd fix shift out-of-bounds in vhci_hub_control()
Date:   Wed, 24 Mar 2021 17:06:54 -0600
Message-Id: <20210324230654.34798-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix shift out-of-bounds in vhci_hub_control() SetPortFeature handling.

UBSAN: shift-out-of-bounds in drivers/usb/usbip/vhci_hcd.c:605:42
shift exponent 768 is too large for 32-bit type 'int'

Reported-by: syzbot+3dea30b047f41084de66@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/usb/usbip/vhci_hcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 3209b5ddd30c..a20a8380ca0c 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -594,6 +594,8 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				pr_err("invalid port number %d\n", wIndex);
 				goto error;
 			}
+			if (wValue >= 32)
+				goto error;
 			if (hcd->speed == HCD_USB3) {
 				if ((vhci_hcd->port_status[rhport] &
 				     USB_SS_PORT_STAT_POWER) != 0) {
-- 
2.27.0

