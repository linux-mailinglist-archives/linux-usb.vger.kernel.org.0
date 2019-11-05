Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15F7DEF76C
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730503AbfKEImR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:17 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38761 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727727AbfKEImR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:17 -0500
Received: by mail-lj1-f196.google.com with SMTP id v8so5148350ljh.5
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wZk4Kgf43x0wsTQIaAQzLC6Ozn9yJOh3cGXpmzunqSg=;
        b=YR86Ip0Juc/UOOflAE80yFNPF4AZfHIea/Z1jDWPU43IHy8Hf44rJKyKxTaywt3sDL
         KNb3l0GltdqzdCnFCWgGWmfKE7OGteP9ta55T/61OjfyNEuSSG6Da/stTcPmmLHg+/3l
         AUZhsmMTDVpO50yi418wiOtdyayPtnwMgulrvTbX2XHHlPMvx+PbU9BEpIFWZxAuDhF7
         wUBsGfqkNQv8ZiIxCYSH85GIr1RUWRwZxsfdijDNLtC6OqpUT5qjAkR2Hrf76HK1iTKe
         EeK2K5xcuEb3vfQtv1GvJML5axly+Ax+OhqfcH05eIPt4ek8+99mhlRPwsTvCa05RTg/
         +7HQ==
X-Gm-Message-State: APjAAAUO7sv2lIwDxROpswzk8AKyPPIN7qsVu/nYewX2s+QFW35K63S4
        aST4eXpmeVpYDqmMPRlxwGgyKTJr
X-Google-Smtp-Source: APXvYqwkgpjTBbUBW9617msa+K0Ov9gVWs9cPXw34P8ijnhPEGxJuW0YhYY8AXrsExjxao46sIYPNw==
X-Received: by 2002:a2e:9612:: with SMTP id v18mr21265785ljh.234.1572943334788;
        Tue, 05 Nov 2019 00:42:14 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id k6sm11739141lfc.72.2019.11.05.00.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:13 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPl-0004GZ-A8; Tue, 05 Nov 2019 09:42:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 01/14] USB: legousbtower: drop redundant MODULE_LICENSE ifdef
Date:   Tue,  5 Nov 2019 09:41:39 +0100
Message-Id: <20191105084152.16322-2-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The MODULE_LICENSE macro is unconditionally defined in module.h, no need
to ifdef its use.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 23061f1526b4..1be84dc13067 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -962,6 +962,4 @@ module_usb_driver(tower_driver);
 
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
-#ifdef MODULE_LICENSE
 MODULE_LICENSE("GPL");
-#endif
-- 
2.23.0

