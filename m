Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C490146F5
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfEFJDX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:23 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41705 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJDX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:23 -0400
Received: by mail-ed1-f67.google.com with SMTP id m4so14500433edd.8
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xX4DsuxrmfjbuJPHYKyNHPQ/kUmOzf27hbzKJTjyNVw=;
        b=q9opdJ7UOXx4WwGuCx5pKQpRqnfAG8qfbVMpxs4BgD/StNh5HP2FnlgVL9Ii4L/cI7
         IxOvIo9PzX3tRfDBCsquD1USDjHwi1EJ5zG9ebnp62W3oav9RlKLjTIHETXeih4ZQR5d
         Lv8PvElPNmXtuhIh2LhwW9yVjFdc95/TZ6a5qt03l1Yf94SFruxbL15ssrTfiecP2uY6
         k57Kusr588mlVIYvFopOkGH7csma2jLOuSL3Mw/Usiz1v/E30df1Z6pUF8P9mrN+Ij4x
         8XpSwskwMCujihUfpeKcWl0EkIgf+kHoMKhEyhTscIvsgJ73/7arWHCQ9C1C7r686IGZ
         bQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xX4DsuxrmfjbuJPHYKyNHPQ/kUmOzf27hbzKJTjyNVw=;
        b=J3D7iKQOHNZYjmcE+y2itDQXQRx8nTA/qRXbZ0IHhXU1IxA1WcuIDoexb+si12eYGc
         jXwigMsngyNAnFIvwA+42R6Hmjzgp8ZvEVdYURpJwqFCpZkbN6m7sLxOwjstlNf7Tfc/
         gG9sI5y9IpS+a9dljDQf4nTcbxeGIjxIFlZblO1wKGeX6jHU++kxrjgeuCzK2HrTEWqz
         Zw0Q9YIe03Ux9jXNPxZhi0fYca0aITFLIS98NGakdWwItYjgXpgzSXvoET+Is8cqjOwy
         yDv9/O/Jg63BXpOKTBq/46ylC4/Db61ekaapTt7PZwV7dOIUWV52pUMYUuAncaR3AE1L
         y7kw==
X-Gm-Message-State: APjAAAUBxUObXVAnmKmlFs8WLm+0vVEcvg1ZrG/Y4XvJ7wg+oqwJXPVd
        EPNT2MaxOdIBzExBT5veMn7Gj7lWShU=
X-Google-Smtp-Source: APXvYqwfWsQaH1Z04jic0Tflhj0nY2B9vpbDMRxJLlByi9jdtrbzHK2GSy8dUhyuQEpK2gZ6t0ahgg==
X-Received: by 2002:a05:6402:28f:: with SMTP id l15mr24898284edv.242.1557133400860;
        Mon, 06 May 2019 02:03:20 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id y5sm1300302ejc.41.2019.05.06.02.03.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:20 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 03/34] lsusb.py: improve usage text
Date:   Mon,  6 May 2019 12:02:10 +0300
Message-Id: <20190506090241.169665-4-grawity@gmail.com>
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
 lsusb.py.in | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 278980d..e54ee75 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -565,18 +565,20 @@ def fix_usbclass():
 def usage():
 	"Displays usage information"
 	print("Usage: lsusb.py [options]")
+	print()
 	print("Options:")
-	print(" -h display this help")
-	print(" -i display interface information")
-	print(" -I display interface information, even for hubs")
-	print(" -u suppress empty hubs")
-	print(" -U suppress all hubs")
-	print(" -c use colors")
-	print(" -e display endpoint info")
-	print(" -w display warning if usb.ids is not sorted correctly")
-	print(" -f FILE override filename for /usr/share/usb.ids")
+	#     "|-------|-------|-------|-------|-------"
+	print("  -h            display this help")
+	print("  -i            display interface information")
+	print("  -I            display interface information, even for hubs")
+	print("  -u            suppress empty hubs")
+	print("  -U            suppress all hubs")
+	print("  -c            use colors")
+	print("  -e            display endpoint info")
+	print("  -w            display warning if usb.ids is not sorted correctly")
+	print("  -f FILE       override filename for /usr/share/usb.ids")
+	print()
 	print("Use lsusb.py -ciu to get a nice overview of your USB devices.")
-	return 2
 
 def read_usb():
 	"Read toplevel USB entries and print"
@@ -602,7 +604,7 @@ def main(argv):
 		(optlist, args) = getopt.gnu_getopt(argv[1:], "hiIuUwcef:", ("help",))
 	except getopt.GetoptError as exc:
 		print("Error:", exc)
-		sys.exit(usage())
+		sys.exit(2)
 	for opt in optlist:
 		if opt[0] == "-h" or opt[0] == "--help":
 			usage()
@@ -636,7 +638,7 @@ def main(argv):
 			continue
 	if len(args) > 0:
 		print("Error: excess args %s ..." % args[0])
-		sys.exit(usage())
+		sys.exit(2)
 
 	if usbids[0]:
 		try:
-- 
2.21.0

