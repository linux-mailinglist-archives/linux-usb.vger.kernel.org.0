Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BED851470C
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfEFJD6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:58 -0400
Received: from mail-ed1-f43.google.com ([209.85.208.43]:35419 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfEFJD6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:58 -0400
Received: by mail-ed1-f43.google.com with SMTP id p26so14501241edr.2
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pENoFwJXU/DYfjG3mg4pxypXdTYcNi3JSkJQW9PXzRs=;
        b=jykeUzIOq0th8gJ/vm4n0FWXFHXrXxhmkysAi+i9ChSmXKWhx4xTfmsJlZUlwUcnCP
         +wwG7jZrf5Zet4wsYJ6L2s2XMmy9LAWvhqT5INhys1mBsZZipaciTWZGKHSfC5iURFpy
         l9xV6YCkYjXnldFyR4kxS3XFkAGX5CaG6h+BpNKlSg0bR855AvYVg2+p07oYr9izM5m+
         gAOJ7t+43clShommEkREwqzfku/7MiEP/mrWi1YbQ6p+4S2sOvDdRLnAqnie0H1TN9aY
         NnbvVlTQUmGCZARBaSHGNpBWWq0Fg5A6ysN/InF6CoHsahvJQHAhWf1Z2Jvszlz74XeT
         nRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pENoFwJXU/DYfjG3mg4pxypXdTYcNi3JSkJQW9PXzRs=;
        b=jKRqDkYmIF6nN0RV0zsk73Am+vsnmLLT51MtYr8i5QPllNuq4kV/2V+kHdS5idzMgv
         zVppFIGaqXA8kDhAxzP7RcygCOHg45s2UdaZ400dimnMMiKZyqVjrgwZk6OyOPUG+DgV
         De98Ivs/C6sePKk6BgR+q58uqk9cp4pc/WcDSfXKsLUo/EZPiklf7miuDVQ6eoeWIfCL
         PDlMeQt8NsVsc1ZP1NbqUXGCsVwknjsv6m5UTP5CCKGvINGH18KFDPV8LO6YhGDlSvHi
         Jtt+YKLFV5OOFxY6hVt6pHC4YvtdFwmD6e8r+bYYB7yYUyDprH1taGep2BZkvd4DAZWE
         FMzA==
X-Gm-Message-State: APjAAAUjj9UFvcZlJYW5rOd25V62rneXkd2ZdrS3Ihf6Mgq6PGZPAhw1
        XJO2Q8/UY+wlVYpZqvdSDOT4DALUsUE=
X-Google-Smtp-Source: APXvYqyN+E6MzikRBUmdboPVfzU7K2zRgrM85EdSDFcLXtETK2e9mQTmUyIr9u07JR7z7v3Dc0Rfzg==
X-Received: by 2002:a50:b062:: with SMTP id i89mr24828105edd.85.1557133435863;
        Mon, 06 May 2019 02:03:55 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id w14sm1467746ejv.58.2019.05.06.02.03.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:55 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 24/34] lsusb.py: UsbEndpoint: indent is a class implementation detail
Date:   Mon,  6 May 2019 12:02:31 +0300
Message-Id: <20190506090241.169665-25-grawity@gmail.com>
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

The class knows how to format itself, so it should know how to indent
itself, like the other two classes do.

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 09363d3..b65cd80 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -238,9 +238,9 @@ def find_dev(driver, usbname):
 
 class UsbEndpoint:
 	"Container for USB endpoint info"
-	def __init__(self, parent, fname, indent=18):
+	def __init__(self, parent, fname, level):
 		self.parent = parent
-		self.indent = indent
+		self.level = level
 		self.fname = fname
 		self.epaddr = 0
 		self.len = 0
@@ -266,8 +266,9 @@ class UsbEndpoint:
 		self.max = int(readattr(fullpath, "wMaxPacketSize"), 16)
 
 	def __str__(self):
+		indent = self.level + len(self.parent.fname)
 		return "%-17s  %s(EP) %02x: %s %s attr %02x len %02x max %03x%s\n" % \
-			(" " * self.indent, cols[5], self.epaddr, self.type,
+			(" " * indent, cols[5], self.epaddr, self.type,
 			 self.ival, self.attr, self.len, self.max, cols[0])
 
 
@@ -309,7 +310,7 @@ class UsbInterface:
 		if showeps:
 			for dirent in os.listdir(prefix + fullpath):
 				if dirent[:3] == "ep_":
-					ep = UsbEndpoint(self, dirent, self.level + len(self.fname))
+					ep = UsbEndpoint(self, dirent, self.level+1)
 					self.eps.append(ep)
 
 	def __str__(self):
@@ -442,7 +443,7 @@ class UsbDevice:
 			else:
 				strg += "\n"
 				if showeps:
-					ep = UsbEndpoint(self, "ep_00", self.level+len(self.fname))
+					ep = UsbEndpoint(self, "ep_00", self.level+1)
 					strg += str(ep)
 				if showint:	
 					for iface in self.interfaces:
-- 
2.21.0

