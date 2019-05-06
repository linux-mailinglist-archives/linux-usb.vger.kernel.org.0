Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB59814704
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfEFJDq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:46 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38525 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbfEFJDq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:46 -0400
Received: by mail-ed1-f67.google.com with SMTP id w11so14499289edl.5
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uBMN0crpS7ytOu7c5Dj91u7O5WFlNLACAuPS/rtkits=;
        b=A3r1o8YUw2x+4h4KVcmEfJHaRErygmtaJheNCr1535KyUx3MCZ+Ul3HirAxo5GVcbB
         faFw8z8r0IaW9nwu/7hmdrP3+EOddZHtamdcI1D+M2XMkrTItNAR+Hpp4950sN9eQcdJ
         C4SSb+TmmpPy1R8gG4XVYZtMovvlXrqhnlgpH81SiyqDR2vXRPhnq0su/2NTGyEnus3v
         yj9cPs/nUTIyWznrS50nKVuEy1NsQ6JLQoLugIZUM4BZ9GRbfbxtIMF1ss97MNI9bDhS
         ezKuYlrUMQZecivfkp5MdUxuZ+Y6ByWvvYYEl8qBWpma67Qdd6uslyjGYU/AbepvrZ13
         NMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uBMN0crpS7ytOu7c5Dj91u7O5WFlNLACAuPS/rtkits=;
        b=Mj9MU/sVFlv3ycyYzB7WyvR1rpBHeAd+tjp3xq18weGw/t/aTHD9HGVvAPtmhkXR+h
         sTr9kUZJjomZNP3j4Zmn1vCKkq/UczJ7A+Fsu5tNqbb48qlhFvA24oypPN7sA6Hraj6h
         U47D9NYuK/5F1bd7bwjR+hNuS3af1lMbbh39wjrDO0VWINPSfEwaIxIrFU43lvxl5G7D
         JuhAHxfY3i00tXhA/0bcxTgmBXfws1VcVr6ZheGhT4nzPLMrJq0ZQmR5C5yPmSlJ5o66
         uVewKaGZ4YIt6yV358+YUoVDcy9/4dOidaYAiFjAuSQasvGZ9mGD+32ZVqPgNGtr2lhB
         y5UA==
X-Gm-Message-State: APjAAAUY6IflP2clUJsXvKBlbeK9KDbG9sRB5E9hQA2PfWPnCrBs+ND5
        1REk1GbHe6SiT5wH8lR9a7mU7Z9fICg=
X-Google-Smtp-Source: APXvYqyZ2EJg3ASBfbMK6SCZxGOu2z+RU0OWq06PqGg1Vb5iT6zBtJVkOLR4GD4AhH6Poj89hJ778A==
X-Received: by 2002:a50:99ca:: with SMTP id n10mr24795574edb.279.1557133424550;
        Mon, 06 May 2019 02:03:44 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id m4sm2893784ede.0.2019.05.06.02.03.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:43 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 17/34] lsusb.py: cosmetic - replace tuples-as-"immutable lists" with regular lists
Date:   Mon,  6 May 2019 12:02:24 +0300
Message-Id: <20190506090241.169665-18-grawity@gmail.com>
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
 lsusb.py.in | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 73b4e67..f19401c 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -22,7 +22,12 @@ nohub = False
 showeps = False
 
 prefix = "/sys/bus/usb/devices/"
-usbids = ("@usbids@", "/usr/share/usb.ids", "/usr/share/libosinfo/usb.ids", "/usr/share/kcmusb/usb.ids", )
+usbids = [
+	"@usbids@",
+	"/usr/share/usb.ids",
+	"/usr/share/libosinfo/usb.ids",
+	"/usr/share/kcmusb/usb.ids",
+]
 
 esc = chr(27)
 norm = esc + "[0;0m"
@@ -145,20 +150,21 @@ def find_usb_class(cid, sid, pid):
 	return ""
 
 
-devlst = (	'host', 	# usb-storage
-		'video4linux/video', 	# uvcvideo et al.
-		'sound/card',	# snd-usb-audio 
-		'net/', 	# cdc_ether, ...
-		'input/input',	# usbhid
-		'usb:hiddev',	# usb hid
-		'bluetooth/hci',	# btusb
-		'ttyUSB',	# btusb
-		'tty/',		# cdc_acm
-		'usb:lp',	# usblp
-		#'usb/lp',	# usblp 
-		'usb/',		# hiddev, usblp
-		#'usbhid',	# hidraw
-	)
+devlst = [
+	'host',			# usb-storage
+	'video4linux/video',	# uvcvideo et al.
+	'sound/card',		# snd-usb-audio
+	'net/',			# cdc_ether, ...
+	'input/input',		# usbhid
+	'usb:hiddev',		# usb hid
+	'bluetooth/hci',	# btusb
+	'ttyUSB',		# btusb
+	'tty/',			# cdc_acm
+	'usb:lp',		# usblp
+	#'usb/lp',		# usblp
+	'usb/',			# hiddev, usblp
+	#'usbhid',		# hidraw
+]
 
 def find_storage(hostno):
 	"Return SCSI block dev names for host"
@@ -528,8 +534,7 @@ def main(argv):
 			print("Warning: option -w is no longer supported", file=sys.stderr)
 			continue
 		if opt[0] in {"-f", "--usbids-path"}:
-			#usbids = (opt[1], *usbids)
-			usbids = (opt[1],)
+			usbids = [opt[1]]
 			continue
 		if opt[0] in {"-e", "--endpoints"}:
 			showeps = True
-- 
2.21.0

