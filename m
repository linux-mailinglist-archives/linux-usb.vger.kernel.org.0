Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CF32CEA32
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 09:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbgLDIvp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 03:51:45 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45630 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729008AbgLDIvp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 03:51:45 -0500
Received: by mail-lf1-f66.google.com with SMTP id z21so6596411lfe.12
        for <linux-usb@vger.kernel.org>; Fri, 04 Dec 2020 00:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5qJZ64/W3SUdCuIAZlZyN5JHcoiEj8SDtkdhTPrWGzY=;
        b=kvwFJnj2gKTr75t+fK8sg9TAA+k1HV1APjK7c+ngx7HcdUwHaliGzMRGxXFuK+abSn
         4XTgU2k+RqcPNOuitZxVXhZm4w82PbSIarxxc8w+NDJHOcM5HWuekqriEMfb/10Nkc7X
         45Irjsf1Ql33x4kzpEV99qj09uaqxrkFPYQexzIGyVEeSGfDWXwsRASNYGcaqYfokcF1
         BI0yW/PKbW2qHOq5PRDClO2h3Y0vhDOJgouA9e5SzBEK+lDiMkbjUdnBq60x2/iANYn5
         P+1twV4Qeo0lsG67THVHCLXZpOIBhzNpV22mAJVJkXkOgM9pDIFTZncZXmW7uPgN++fF
         5uiA==
X-Gm-Message-State: AOAM530U32qu7QvpVB1gwbpyE0+u1ledmqFNmhXUDH3Sx3DcM616dxq8
        VxJEhkkppjf8p4eihQcOVCs=
X-Google-Smtp-Source: ABdhPJz3G5I2tjIJdJwd35OMNvx9F6DrlbxTzTR8ywANvidQGQ9YmWGETwFniHZoqugk5o6qXgUu2g==
X-Received: by 2002:a19:857:: with SMTP id 84mr3043215lfi.235.1607071863000;
        Fri, 04 Dec 2020 00:51:03 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o81sm1432484lff.279.2020.12.04.00.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 00:51:01 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kl6oR-0005ES-47; Fri, 04 Dec 2020 09:51:35 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Himadri Pandya <himadrispandya@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/3] USB: core: drop short-transfer check from usb_control_msg_send()
Date:   Fri,  4 Dec 2020 09:51:09 +0100
Message-Id: <20201204085110.20055-3-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204085110.20055-1-johan@kernel.org>
References: <20201204085110.20055-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A failure to send a complete control message is always an error so
there's no need to check for short transfers in usb_control_msg_send().

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/core/message.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index a04b01247117..b08de9571f7a 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -216,9 +216,8 @@ int usb_control_msg_send(struct usb_device *dev, __u8 endpoint, __u8 request,
 
 	if (ret < 0)
 		return ret;
-	if (ret == size)
-		return 0;
-	return -EINVAL;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(usb_control_msg_send);
 
-- 
2.26.2

