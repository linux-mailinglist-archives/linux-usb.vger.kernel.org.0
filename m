Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1C6A146FB
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfEFJDe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:34 -0400
Received: from mail-ed1-f42.google.com ([209.85.208.42]:43589 "EHLO
        mail-ed1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJDe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:34 -0400
Received: by mail-ed1-f42.google.com with SMTP id w33so12159892edb.10
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wPYe8AEvox203xC4pk706hJnHgl5NuST2k2UK3voRQo=;
        b=pIyOXv+oAKmbMBsqsUiprOh1hdUnn3dmj18+nLOxjHR+TZpHPW7XG0BY20mqbk+aPc
         r9khx5IM3eoVAqGfpDutkrC/vlL+z0Ugi4qFmQ4CsPwFKKOx65k7qHIa77ndB8kopBs7
         0CHuir7d4YviuPKGxKQ8bdn5oinboH4W5S2kllroRyTWjT/bIBLkcsYpK46CqHsafi8m
         HQZAdJA++jGom6D1gIQ8/RaZs2QSrqD1iwF09ICB1WuVp+V2owfx1SSQbwYoNg2IVxpd
         /lRPWcQVUk82yT97f6qbncm1qr9u7aHUVqWyyuv6LWGuEtOxuH7xD2lNyRrduo/AavmA
         4ZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wPYe8AEvox203xC4pk706hJnHgl5NuST2k2UK3voRQo=;
        b=FW49pCFwCrNi+TSsz7kOO5ZVKjnKCT3ShGcxN0DIRbzq7ovE/8dhrVqmLWz+e4jv5y
         7Q+DzbwrB4Eyy8i2DxlWwd7BksnZa3IYaGNx5KQ+Zrc16G5nhiqogTBqdiaWQAOW5EaQ
         n4FvPkqqyZA5qlz+3pnm6rUvYkSWyJCNiPFjSVbzlaX80UHh7Z7i+HhHJnJbEYNY4/iv
         F/Tb3rahQqxIlSgp56Bc+AUQFPY7pKCrvpsxzZ/nWjlh0bSkQ7NtBlGbfRowBTt+RK9q
         F4XIAYzT7OgZTsRz9LouPG5Qi7F1vXoH6Pdh5FWbtTlINndXPiHChOMDCqkR0DKGjL0r
         zSMw==
X-Gm-Message-State: APjAAAVRlcvY3hbk/VsAJADZtq4ROQVMDN8l9LdZrPVBKQ2ygpLxdUqY
        VArUa3uR+Az4bgj29uIz6P9IIbc7tBA=
X-Google-Smtp-Source: APXvYqzU3Vy1zZYU/DsjjuuhSG+rmoORF1gfJhFB8+oFvfLd9IfKjJdFisq0J90MYup26snr/7UqHQ==
X-Received: by 2002:a17:907:104e:: with SMTP id oy14mr18241646ejb.253.1557133411923;
        Mon, 06 May 2019 02:03:31 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id g24sm246042ejr.60.2019.05.06.02.03.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:31 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 09/34] lsusb.py: use regular print() instead of hand-rolling the same thing
Date:   Mon,  6 May 2019 12:02:16 +0300
Message-Id: <20190506090241.169665-10-grawity@gmail.com>
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

Even sys.stdout.write(str(usbdev)) would have been better.

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 0d7ff95..93fe6b5 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -548,8 +548,7 @@ def read_usb():
 		root_hubs.append(usbdev)
 	root_hubs.sort(key=lambda x: int(x.fname[3:]))
 	for usbdev in root_hubs:
-		os.write(sys.stdout.fileno(), str.encode(usbdev.__str__()))
-		#print(usbdev.__str__())
+		print(usbdev, end="")
 
 def main(argv):
 	"main entry point"
-- 
2.21.0

