Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C312CEF776
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730606AbfKEImY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:24 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36787 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730598AbfKEImX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:23 -0500
Received: by mail-lj1-f196.google.com with SMTP id k15so8683545lja.3
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9FGG4dglC3msTlS8STfdQNYtPuiJ0zY4sPHcmwh6jRs=;
        b=Eocq4o1RahmI7xBGGi0LeANkfveIawsDDeNNcW5XPt/naKlIeRy8DAw9bbEybe8vfS
         Bq6pgaOgM7zwS6zd+aKMNJu2tsR/RW3HjOUkwbD5Q1xVCpuHfUGo0Krcygo0CEENf5ZE
         Q/oMv9WszGRESRA6+TVqGZ8P5+fAKk/6M0TlYr4WbCuUgDxF5H8/mJbFGJq4uM98rqUK
         zYpBptoqAQKaJ6gXr6mbxXCDnzH46ftLPlG8S48kmqN+LBsBKn44YYz1UY/QZh4LwQnX
         vBDeOf921FGp2Oy+aIenZF5zdOZ6SJy6X8XD+GE/cYpM4ah8FSV4bRLcwQdFhnjZ0ZYn
         Pbzw==
X-Gm-Message-State: APjAAAXJuR8cpgcCr3D5TbDGT5AlTDD8htgx36cojyZHpfxdaA3ghmnU
        x+zaaXZCUcAKkv66BOqCpWk=
X-Google-Smtp-Source: APXvYqygwxb2D1xl43Cz84w4im/t+p33xSopFYwcx//EojMuwkuMfwbG/Jwrs11Y45whh2Kfm+REnA==
X-Received: by 2002:a05:651c:20f:: with SMTP id y15mr6896085ljn.31.1572943340828;
        Tue, 05 Nov 2019 00:42:20 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id v21sm7793111lfi.74.2019.11.05.00.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:16 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPm-0004HI-3J; Tue, 05 Nov 2019 09:42:14 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 10/14] USB: legousbtower: drop unnecessary packed attributes
Date:   Tue,  5 Nov 2019 09:41:48 +0100
Message-Id: <20191105084152.16322-11-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the packed attributes from the two message structs whose fields
are naturally aligned and do not have any padding.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index c8ed8792b931..a9b08468a302 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -160,7 +160,7 @@ struct tower_reset_reply {
 	__le16 size;		/* little-endian */
 	__u8 err_code;
 	__u8 spare;
-} __attribute__ ((packed));
+};
 
 struct tower_get_version_reply {
 	__le16 size;		/* little-endian */
@@ -169,7 +169,7 @@ struct tower_get_version_reply {
 	__u8 major;
 	__u8 minor;
 	__le16 build_no;		/* little-endian */
-} __attribute__ ((packed));
+};
 
 
 /* table of devices that work with this driver */
-- 
2.23.0

