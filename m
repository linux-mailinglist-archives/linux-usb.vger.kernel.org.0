Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBA014707
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbfEFJDv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:51 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46265 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfEFJDv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:51 -0400
Received: by mail-ed1-f68.google.com with SMTP id f37so14459440edb.13
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IOTxIu9UU7W+66H/k/UHJQRfeAApKOj9rT8/wHVrDlU=;
        b=hJen0wYbaKlBgTVCq/u8HCHHCjK1ivT2y3ThQTikE3nfJK3g6LnweqfuqZcPwzAH7X
         J73qmQhjsAdy/FXLOAZsDciSWbN5mu1ouOkOuPDX2jhuSMisO8Sqg4e8fEwsL6q0Hu2r
         r0ONYQxZTr3Z7/3vQmtZ5F/BZxtvOfbeb7iN93XHzsLO2Y5Qy5NpCxC7nhyL1+qdrTl7
         YFuET5wBxVnAegx3reSpNm+Pe4g702FPTU0rnZJYpcSfdTg/M4X33ZvAaC3JQUUA4D/x
         /dWLkB5MR6wkIu8CxfdTOrkVL2PoH2verYNOuRevSs0v6A7IX2oNlwLJV9ocDXgUfqGG
         0nOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IOTxIu9UU7W+66H/k/UHJQRfeAApKOj9rT8/wHVrDlU=;
        b=R45q7IVwpfxXV/ddvERraTZkIG4MT7ziUaTnG9VvC1jj+C7voQFxUYlyWMS73KgKzz
         QMYx4/sRr6sC7Dq7+7e2mQrGoOjQWh+HJb16uU0S5B/Igv7DYQGKoyXRr5l8tii/43/B
         /HXyFMJDDaSo0LiaLG/anxVZpsdAqtfr6wfcZnExSlftYlF8nNSbMjl6giPmHeJzNK3/
         8C63BPUTeD2+QoPb9FCND6BP9X7dnhKHwUtGPHa/FMQUu4Kl4fL1sG7CBxE1kL0EZMjI
         RK5eHTbkrmPry9d4JbWMh2nqAkVJGny+alZNEAl7qMMIZAEq0Sv7JIwNsDQFYKmfcEQD
         mj4w==
X-Gm-Message-State: APjAAAXYNHpDiu2hS9kMWB/KtMnOlgUl2jEd8scZT3gdxBTyz/XGHrAP
        Tf3xaX5rna+v0lmPpMH6MVHFN9Dw0gc=
X-Google-Smtp-Source: APXvYqz7VXQsDhdiTvzXLEq4xEiXXreMmYSxWRGQODUyHGHLD4ebjCBjpMV4JuDGPd6Sgy4OosoyEg==
X-Received: by 2002:a50:8803:: with SMTP id b3mr24965453edb.153.1557133429404;
        Mon, 06 May 2019 02:03:49 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id q5sm1456716ejm.63.2019.05.06.02.03.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:48 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 20/34] lsusb.py: move unrelated code out of try..except
Date:   Mon,  6 May 2019 12:02:27 +0300
Message-Id: <20190506090241.169665-21-grawity@gmail.com>
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
 lsusb.py.in | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index fc3e7a6..823cc8a 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -356,14 +356,12 @@ class UsbDevice:
 		try:
 			self.name = readattr(fname, "manufacturer") + " " \
 				  + readattr(fname, "product")
-			if self.name[:5] == "Linux":
-				rx = re.compile(r"Linux [^ ]* (.hci_hcd) .HCI Host Controller")
-				mch = rx.match(self.name)
-				if mch:
-					self.name = mch.group(1)
-
 		except:
 			pass
+		if self.name and self.name[:5] == "Linux":
+			mch = re.match(r"Linux [^ ]* (.hci_hcd) .HCI Host Controller", self.name)
+			if mch:
+				self.name = mch.group(1)
 		if not self.name:
 			self.name = find_usb_prod(self.vid, self.pid)
 		# Some USB Card readers have a better name then Generic ...
-- 
2.21.0

