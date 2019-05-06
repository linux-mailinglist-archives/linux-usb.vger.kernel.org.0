Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B27F514721
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfEFJEQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:04:16 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41816 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbfEFJEO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:04:14 -0400
Received: by mail-ed1-f66.google.com with SMTP id m4so14502977edd.8
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uOKSUizQoHwJ0tcObOgHvGf/HlY/Fg10Q080Wu8+IJY=;
        b=u2kKye0XB1PK7pfAPNPE50fyHSxSCtE/biuqrVyRwrwwmq+0qohxtEr04J9WhxuPI1
         6Knkd1Yw0yd0CQqR+g8FjeWlABna5HeQyBMRB/66bUeaS0fsTXOXBaaJV/eNpYjmAvm6
         W+xI9WMKVmxeUL/duVtjGddKmesI99JaYmD7y420If3gXR2HW9tlDtjefV18KkwI+EJC
         t3ZugUpQFBhB75cd3KdR+iCLEMiXXhzzu+jj6P8cYMddVOb9qt08cTM564ek8dqhfgx7
         CvyScIGxvf60zfR1J309ZOA1PNXQywLHbi/oCCirZqIATJnIQYNIeHiFYognTSlMZNzY
         jDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uOKSUizQoHwJ0tcObOgHvGf/HlY/Fg10Q080Wu8+IJY=;
        b=WqE3wjnWhQWmodhcffaYkIsOSf7HnOIrBjbR0jteWJ0YEstgaBZZP2BgMNzhuUmceG
         2qJuKoK+lJINH3PkviSfVbIW2diO4KC+xPXFsQOuVjvYFZJIxVp4MGMdt0Qf+hCy6QrO
         TAUQlXlTudpg26vvhKfnACEiTwNciB+nMzcKnEPdn7QgsIiT+RvxNwQCvK/Qeez5RvAq
         4rY+tIcceSYi51uNT9+/ElIGn2EmrpbYT+xd+pgIyuAdBnlnCF40nXdQBkR2PHDNeXUD
         3fWUXgubgrNWzEnvPDdaZvHrtZjGlZtqmn5HH01XrkY2sCETx9f4L5rB1VPIagT+HoMY
         BLDg==
X-Gm-Message-State: APjAAAWkmDg2ljSoES8wfmp1os7B7hXvq59J/JHuuoUiWNRGcQpsPHMg
        WJvloPo2O2o7ie/xM3OA8hm/p7ujtqg=
X-Google-Smtp-Source: APXvYqz+bxqL+kiGBj9HYhE580KDhhEqoywSlNI6wQ04jUHIR26GpbwkICw5PC33BPVurkE8EBrs6w==
X-Received: by 2002:a17:906:1e0f:: with SMTP id g15mr18105671ejj.241.1557133453325;
        Mon, 06 May 2019 02:04:13 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id b26sm1448824ejb.0.2019.05.06.02.04.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:04:12 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 34/34] lsusb.py: visually group USB-version-related fields
Date:   Mon,  6 May 2019 12:02:41 +0300
Message-Id: <20190506090241.169665-35-grawity@gmail.com>
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
 lsusb.py.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index c170ebb..ace837a 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -430,10 +430,10 @@ class UsbDevice(UsbObject):
 			indent = "  " * self.level
 			name = self.fname
 			plural = (" " if self.nointerfaces == 1 else "s")
-			body = "%s %02x %s%5sMBit/s %s %iIF%s (%s) %s" % \
+			body = "%s %02x %iIF%s [USB %s, %5s Mbps, %5s] (%s) %s" % \
 				(colorize(1, "%04x:%04x" % (self.vid, self.pid)),
-				 self.iclass, self.usbver, self.speed, self.maxpower,
-				 self.nointerfaces, plural,
+				 self.iclass, self.nointerfaces, plural,
+				 self.usbver.strip(), self.speed, self.maxpower,
 				 colorize(2 if is_hub else 1, self.name),
 				 colorize(2, "hub") if is_hub else "")
 			strg = "%-17s %s\n" % (indent + name, indent + body)
-- 
2.21.0

