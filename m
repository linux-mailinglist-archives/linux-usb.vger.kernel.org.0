Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96A32CEA33
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 09:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387488AbgLDIvq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 03:51:46 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45538 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729244AbgLDIvp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 03:51:45 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so5667956ljc.12
        for <linux-usb@vger.kernel.org>; Fri, 04 Dec 2020 00:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bDXKraCZj9tEhUlYVZ7C8KxSuCwnY1NGnGNnV9ou2jU=;
        b=uoAvXOEMPKmesM9Gt6RqQHIurWGB/1PivDBOE+9cPdDhGpTgYHFzGSCsk0FF2kVFjy
         3a7TcX7EjDSuIbaVr/oD3+DsT5SJffS3A3F3lXFxAYsRJYCNmJ7NHt91H1ofTx7N6PVA
         OC99gqLX9n2ilwwICekVA7IEVlEm3xaZOaXQizHk9sGp4qourkHzBKyQqxfQG4J7Y+sk
         msfdYKBplfAkpfabJukLstU2snIPPKu4nGds8GYpAk4vsWSyDAE7CXagFHmPVZjkjAVV
         ZHceXuxuI+R7DfL5n9klnbK28B0iVdMRkqwFsDtXcO0s+qZz7qPndrBJqObdwpc1t3Kl
         eqsA==
X-Gm-Message-State: AOAM531e7rK74aBeTsRcuvW7yX2Yn/IwJUrE6dc0WBJ1g+7dPmzenfM/
        EaWbKva0CzeCUqcDbPtis9w=
X-Google-Smtp-Source: ABdhPJwzw3IGQwgxlpjLYzIMc8vDQ8iHWYIZl/jYhcmZ2DzwOOlnqlso2Gx9T37Uw4Gc8hMgJemSMw==
X-Received: by 2002:a2e:9a88:: with SMTP id p8mr2976289lji.266.1607071863625;
        Fri, 04 Dec 2020 00:51:03 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id d18sm1444758ljo.49.2020.12.04.00.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 00:51:01 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kl6oR-0005EX-6y; Fri, 04 Dec 2020 09:51:35 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Himadri Pandya <himadrispandya@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/3] USB: core: return -EREMOTEIO on short usb_control_msg_recv()
Date:   Fri,  4 Dec 2020 09:51:10 +0100
Message-Id: <20201204085110.20055-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204085110.20055-1-johan@kernel.org>
References: <20201204085110.20055-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Return -EREMOTEIO instead of -EINVAL on short control transfers when
using the new usb_control_msg_recv() helper.

EINVAL is used to report invalid arguments (e.g. to the helper) and
should not be used for unrelated errors.

Many driver currently return -EIO on short control transfers but since
host-controller drivers already use -EREMOTEIO for short transfers
whenever the URB_SHORT_NOT_OK flag is set, let's use that here as well.

This also allows usb_control_msg_recv() to eventually use
URB_SHORT_NOT_OK without changing the return value again.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/core/message.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index b08de9571f7a..30e9e680c74c 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -286,7 +286,7 @@ int usb_control_msg_recv(struct usb_device *dev, __u8 endpoint, __u8 request,
 		memcpy(driver_data, data, size);
 		ret = 0;
 	} else {
-		ret = -EINVAL;
+		ret = -EREMOTEIO;
 	}
 
 exit:
-- 
2.26.2

