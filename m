Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73AAE14701
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbfEFJDn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:43 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33797 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbfEFJDn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:43 -0400
Received: by mail-ed1-f67.google.com with SMTP id w35so12828254edd.1
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UJrQd8tuwULo7vs/XHd8Fzf5uhNHQyowUwB3UoVt+F4=;
        b=HRrZgN6wj0vrjoE21Y/gLuz/l26htBdLhjsH0MnovElzN62xql+MSAM+R9+HWiHxcw
         g5xvLJ43wVAv4css2pdhvVhmT2SYIYGKlWtgHVVnrFFhHRK8bhLHlz9fbOaP+TEboOPr
         od9zsVy0VSaa0mVztKB6sz0lXHpFqECelTWZjnA7JK8EwH810WyvlbbxakPOnIh5pb3Q
         tD2+mVK16v8VnbuXShCiB4hS86DrEeVQ0lDSdAAWZXxmuDWj/JRy7WdWCzPgEBVsWBEL
         fI3mKvPAM8GJDGUYVqzXYKcTWwXUi9nCJkhCDTpv7xnfFdp7E/2W4IuaGFAQq8D0K6+Z
         /CEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UJrQd8tuwULo7vs/XHd8Fzf5uhNHQyowUwB3UoVt+F4=;
        b=kHTkT6KdMRxeRMh4BtEAXssksGV6H7fzBZMvVPbxpZTZ/c7LySTuagAczhRf3e/Xnf
         YPH4q+ispXQnRlHaWB2tTJl7xMlgqBHLjGC6yNgWBpz+Re9ifu+XKn2pFcFX5Oqcits0
         miq6Vr2sjZvcuJIIREWJYgEPdlLppWE1H4cT9AGCYA/0TSpgWADEU9nxhFvN9OURh0VD
         hOSQeriiQBcpXUTBU43brv0idq5HQmW4AlVZy4GyxiJ0ePlfk/fzJR+uhMgEwir23GdD
         BCO2yEH0xn38KW1DOiNj51kXMaeTIN2EF8kayugEJwezuzHsJzbqiehbX/m5PrxMxJK2
         tIkg==
X-Gm-Message-State: APjAAAWKAgl61Xiu4lamUiCbC2vqOY/+Va/rnmD6t2vfxyh+hKXhLut5
        gdwMTaBDnnVuQ7fCICudblYlA/WHHiY=
X-Google-Smtp-Source: APXvYqwk5nEO649VugMJ1DRcqDFzgSSE6HURzMb6+w/ZN0YqkUb3+nVog7pp6rUQI1QPRnGvt0V+vQ==
X-Received: by 2002:aa7:d144:: with SMTP id r4mr24430416edo.87.1557133421412;
        Mon, 06 May 2019 02:03:41 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id r18sm1497067ejh.92.2019.05.06.02.03.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:40 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 15/34] lsusb.py: insert class FF:FF:FF into usbclasses to avoid special casing
Date:   Mon,  6 May 2019 12:02:22 +0300
Message-Id: <20190506090241.169665-16-grawity@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506090241.169665-1-grawity@gmail.com>
References: <20190506090241.169665-1-grawity@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 83f9143..e1a30d7 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -156,6 +156,7 @@ def parse_usb_ids():
 			usbclasses[cid, did, prid] = UsbClass(cid, did, prid, strg + ":" + ln[6:])
 			continue
 		mode = modes.Misc
+	usbclasses[0xFF, 0xFF, 0xFF] = UsbClass(0xFF, 0xFF, 0xFF, "Vendor Specific")
 
 def find_usb_prod(vid, pid):
 	"Return device name from USB Vendor:Product list"
@@ -172,8 +173,6 @@ def find_usb_prod(vid, pid):
 
 def find_usb_class(cid, sid, pid):
 	"Return USB protocol from usbclasses list"
-	if cid == 0xff and sid == 0xff and pid == 0xff:
-		return "Vendor Specific"
 	lnlst = len(usbclasses)
 	cls = usbclasses.get((cid, sid, pid))
 	if cls:
-- 
2.21.0

