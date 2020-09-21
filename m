Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2792272672
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 16:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbgIUOAF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 10:00:05 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40286 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbgIUOAF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 10:00:05 -0400
Received: by mail-lf1-f66.google.com with SMTP id m5so14129333lfp.7
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 07:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QeNREgn/VBFyeE24M7SC8hPxyEUzwzXz3H+WzHOfyA8=;
        b=VaWg0KccWh2iTrvGn3X2EsuHqbEM7OMPgKKBOyHAOYgnaNr39/6hGGeRzW4MB8+urq
         oL+kZOFkPRDNN0C/oHNOkrAODSCDC1JNbFZ2FemG0ZItb6KPJTIOO9lCyPYTCHaYZskd
         B2LZLe6CS/S2uF42gS8uUv2fVs1IdA+QwYnljVg8d5nDSRtmJXtqQvvjBtXJAs0DdmgT
         krpwN2gCByVX30fDUSLDWdr/QPBwLPr3kP0iqdboiT8MOBrUCn6DAas5qcUppCvzOwax
         7HJjIuVaZh+AZvDlqglZHFlxPrRhUf0Ckiho0tNdTdKuBSkUwVvowPgmpvCyHLyk0Ysi
         KDfA==
X-Gm-Message-State: AOAM530OgEtCwwBQIIbpRGnARORDUZSUP85NPwXRhLLityJdcCEwdGY0
        91YKKvK7edHXvOq764Jiwxs=
X-Google-Smtp-Source: ABdhPJyh55m81LxK+3KDLEWRsL2Kcu587mqoByGkpYzlEOYWzN0SGP6JbwghNNl7WHwUWL+sqLz8xw==
X-Received: by 2002:a19:521a:: with SMTP id m26mr35819lfb.133.1600696802810;
        Mon, 21 Sep 2020 07:00:02 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id y21sm2728739ljk.110.2020.09.21.07.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:00:01 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kKMME-0006Go-WC; Mon, 21 Sep 2020 15:59:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 1/4] Revert "cdc-acm: hardening against malicious devices"
Date:   Mon, 21 Sep 2020 15:59:48 +0200
Message-Id: <20200921135951.24045-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921135951.24045-1-johan@kernel.org>
References: <20200921135951.24045-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 2ad9d544f2497a7bf239c34bd2b86fd19683dbb5.

Drop bogus sanity check; an interface in the active configuration will
always have a current altsetting assigned by USB core.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 7f6f3ab5b8a6..e28ac640ff9c 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1196,9 +1196,6 @@ static int acm_probe(struct usb_interface *intf,
 		return -EINVAL;
 	}
 
-	if (!intf->cur_altsetting)
-		return -EINVAL;
-
 	if (!buflen) {
 		if (intf->cur_altsetting->endpoint &&
 				intf->cur_altsetting->endpoint->extralen &&
@@ -1252,8 +1249,6 @@ static int acm_probe(struct usb_interface *intf,
 		dev_dbg(&intf->dev, "no interfaces\n");
 		return -ENODEV;
 	}
-	if (!data_interface->cur_altsetting || !control_interface->cur_altsetting)
-		return -ENODEV;
 
 	if (data_intf_num != call_intf_num)
 		dev_dbg(&intf->dev, "Separate call control interface. That is not fully supported.\n");
-- 
2.26.2

