Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2E5EF777
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbfKEImZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:25 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36787 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730541AbfKEImY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:24 -0500
Received: by mail-lj1-f193.google.com with SMTP id k15so8683643lja.3
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+JzbMSGY3jZ4WIZf1NkEJrGRGPRKMC+8wvHR7emZd58=;
        b=LEe+aPIsU5d+7d1WLDDDcWve1bRO3014+rWNMtGMeOjejjMZprbTgkiy/ER7hkKW77
         TnnY/5xf4HbzlfYOSzmX9EMEf4u0Sg40S9hP9w/uW2c6dmEHKyJDj/I/5qHR6FCHS9Ey
         miPtnwBj/KzrsstLU90so/RmqnwAnNtVuZ1ko+1v5PShc9KnKZ1/4ssIOkbgcNACkKGw
         FyjD0XDszrUKCxQ/VN3z/lJ2MLGgLrxJwTP3sF0JjUhz3mvIIhrgJb31wa1/cymOCxnn
         Im4S4r3NTtomG7pSKbc0J6B2yXJjQGMJ+shmctwydXGAB/Q1FxO/C3Pk7a5hkPGOvI/S
         tHZQ==
X-Gm-Message-State: APjAAAXJcHbmlJw6Y4Rpm81XQUxrZfjisu6gD70MzR1g3xvZmaLp/6fQ
        3JR7klE/RcW3XRk7TtRJszCmCBqm
X-Google-Smtp-Source: APXvYqwHvuM6GHr3OfyUmMNbLhuwGn/OPKX0zqIsMhtM487o2ZzwhtstDihmMsiVj+FPV376CrejSQ==
X-Received: by 2002:a2e:b54d:: with SMTP id a13mr12909864ljn.4.1572943341842;
        Tue, 05 Nov 2019 00:42:21 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id b4sm8179464ljp.84.2019.11.05.00.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:16 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPm-0004HN-6O; Tue, 05 Nov 2019 09:42:14 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 11/14] USB: legousbtower: drop redundant endianness comments
Date:   Tue,  5 Nov 2019 09:41:49 +0100
Message-Id: <20191105084152.16322-12-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The endianness is already encoded in the type specifier so drop the
redundant little-endian comments from the message structs.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index a9b08468a302..03f6861dfdf0 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -157,18 +157,18 @@ MODULE_PARM_DESC(interrupt_out_interval, "Interrupt out interval in ms");
 #define LEGO_USB_TOWER_REQUEST_GET_VERSION	0xFD
 
 struct tower_reset_reply {
-	__le16 size;		/* little-endian */
+	__le16 size;
 	__u8 err_code;
 	__u8 spare;
 };
 
 struct tower_get_version_reply {
-	__le16 size;		/* little-endian */
+	__le16 size;
 	__u8 err_code;
 	__u8 spare;
 	__u8 major;
 	__u8 minor;
-	__le16 build_no;		/* little-endian */
+	__le16 build_no;
 };
 
 
-- 
2.23.0

