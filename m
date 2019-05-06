Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96BF6146F3
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfEFJDW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:22 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:35967 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfEFJDV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:21 -0400
Received: by mail-ed1-f47.google.com with SMTP id a8so14504207edx.3
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4g2fz+lhg0ZYXSPDhdu5BPPMfft69rvVxH//Z3CzWcI=;
        b=dLAdp4Vvr6CR3MAHXlBQIuuYsd8Xot3UIqLvbu94TCGGNjZN1106zUBR5rgcShyBW/
         IUO2TYiLL7enXY5Wmfato/9PCOugozI9rJ0mrDCDHEuwjaTipn7B6dAzAFajGN398lJR
         qsWuLwTMNvUY5+/arN1x6YnpIF0losXKWq9Y5vjo8AAWxVlBorY84UjzjUsmrtElw2ro
         b65XoT1naoFU9kNiNW3l3ooSvuzdIqVW/b0WZQlBS5GcS3WSts0YYzJZM/VclsoLN5Vs
         UUJqmwPc4BSeSHIQ8J2sOh0tlal6UpVma7wnJ18TrRNkRL/9lT7kVttM5tHM/VsLp4Ru
         3sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4g2fz+lhg0ZYXSPDhdu5BPPMfft69rvVxH//Z3CzWcI=;
        b=qVlOralFokra+TqQ7YMmUpbr3XZMtbfV7hf9U/Hn1mjq2lmbq01MPwvrWGevZwlC3a
         n0iFNRCO1WOkaCRJUHIEx3KQunjZ5YM2s4HI1rZb6lCUQ5iJhtom+ZElEdnvgPJFRZHt
         6z+BcWy2OoUdIbWgy68sEBlI+MDbl4LcQCFloSt9Utx37QehHVErSMZgzfec/LLc9o1w
         YKCP1t4tzhxr9pQ7B/Xm04ow3qIYxXafmkAIPPwc7+tbnOha6vzcYMqDjca2y0Dp81ZX
         /sV752elZildNXgQXeich8/EEtU6X9rUr/GU0cHUT99W08tlVNq8sqk6L3npoRDqkfaB
         3ijw==
X-Gm-Message-State: APjAAAWT8RGDmcNQWzQmq2u7kOQ5DWL+jQPHkaRyHtDpvIymyrSs3BWK
        n5yvDpg/n2+nZUQ5d4ffvJOvz3XSwGo=
X-Google-Smtp-Source: APXvYqzadgs9jyOQ1/dscK5/1/lR2VFmf2MVoLe5fAHiqsuD4dQGhwoBzjyS3BK70bxPkFjFoEcIfg==
X-Received: by 2002:a17:906:d92e:: with SMTP id rn14mr6821213ejb.249.1557133398909;
        Mon, 06 May 2019 02:03:18 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id h10sm2879181ede.21.2019.05.06.02.03.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:18 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 02/34] lsusb.py: sort toplevel entries
Date:   Mon,  6 May 2019 12:02:09 +0300
Message-Id: <20190506090241.169665-3-grawity@gmail.com>
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
 lsusb.py.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lsusb.py.in b/lsusb.py.in
index ccbfadb..278980d 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -580,6 +580,7 @@ def usage():
 
 def read_usb():
 	"Read toplevel USB entries and print"
+	root_hubs = []
 	for dirent in os.listdir(prefix):
 		#print(dirent,)
 		if not dirent[0:3] == "usb":
@@ -587,6 +588,9 @@ def read_usb():
 		usbdev = UsbDevice(None, 0)
 		usbdev.read(dirent)
 		usbdev.readchildren()
+		root_hubs.append(usbdev)
+	root_hubs.sort(key=lambda x: int(x.fname[3:]))
+	for usbdev in root_hubs:
 		os.write(sys.stdout.fileno(), str.encode(usbdev.__str__()))
 		#print(usbdev.__str__())
 
-- 
2.21.0

