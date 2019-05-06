Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31EB0146F1
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfEFJDU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:20 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42670 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJDT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:19 -0400
Received: by mail-ed1-f66.google.com with SMTP id l25so14489876eda.9
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JON3Dio96d9dcGmyfqo17vVf8uN8qhqFE9dTi6PUO80=;
        b=DnBTwLHfwUWYs+S9TiC0m46b55sy4r3GnTnVZjTtkYP3XRWX6ZnAESgA/YapHzrq+7
         1V3Qa1+tGHNvcYwBp4FsbD8zS9UhJ98NWgFz/wkGR82Ti88qc1jatDS45dJN73FilNYu
         2VKJuigGzz8OYR2/c/EWXxFyyEcqzxekENTjUpwLWvhg0ffdSlDFBIcwWyGCqjYYtReC
         G9+pM06ACrPByx4OgGQOIvqfa1LpnCWjjM/RlK/4hPKbWT4Hwv5+A/C0gIHsTNOvUFlj
         79esFcALdZPsvqs83DDqLWMB+TfAx97BQLUJt626qnzD+YuU7N5jwUojfZzECFtM8ZbU
         J2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JON3Dio96d9dcGmyfqo17vVf8uN8qhqFE9dTi6PUO80=;
        b=rP2go4vdkI6vhw5jabm2vsl5jbDTcdzlFcxiYrsKfgW8Wx70F76wZBRWgyAGxETo9w
         /2JVVhSDqfg8VBlqy7CSAlosO09xxx0qPgxLsU/gxxDesSaL/SUSsZmF+NmnXUWXLBnp
         ecACXEUMozEbkLrV2BryUVzyN57yl6N/Okw8CJHlYapKshPDRAye6fwh95rfGDHRuSie
         06VSVK1siuhYQ2h/IHePMEEEA7w8aVWObMArAN8jWr9ZcRmKdBFtan0dv93wQ2/uirsH
         E011rtz53YrQmP0jRllTkk6ReHIKUf/iYtk7rLdiuYgBEi7GWBqffFgQ+9lqly9TWzv4
         e40Q==
X-Gm-Message-State: APjAAAWH/qsRaf71pKHus6NSPSNd424pUoTExoRqOwJy+lSezHoMk4Sy
        Cf5ED5lJNqUkFvzctdEjR84UViWwyP4=
X-Google-Smtp-Source: APXvYqyjmd3oUFk8SX3xRavuCj4aLRmBoUafaaHgWeGVgZXHgivlnLNA1aktoJg3hbdbfoeC/QUcAg==
X-Received: by 2002:a50:b3a6:: with SMTP id s35mr23745643edd.220.1557133397392;
        Mon, 06 May 2019 02:03:17 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id z32sm2872801edz.85.2019.05.06.02.03.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:16 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 01/34] lsusb.py: sort devices and interfaces numerically
Date:   Mon,  6 May 2019 12:02:08 +0300
Message-Id: <20190506090241.169665-2-grawity@gmail.com>
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
 lsusb.py.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lsusb.py.in b/lsusb.py.in
index b85d770..ccbfadb 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -477,6 +477,9 @@ class UsbDevice:
 				usbdev.read(dirent)
 				usbdev.readchildren()
 				self.children.append(usbdev)
+		usbsortkey = lambda obj: [int(x) for x in re.split(r"[-:.]", obj.fname)]
+		self.interfaces.sort(key=usbsortkey)
+		self.children.sort(key=usbsortkey)
 
 	def __str__(self):
 		#str = " " * self.level + self.fname
-- 
2.21.0

