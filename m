Return-Path: <linux-usb+bounces-24565-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F4AD1060
	for <lists+linux-usb@lfdr.de>; Sun,  8 Jun 2025 00:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A42DD3ACB07
	for <lists+linux-usb@lfdr.de>; Sat,  7 Jun 2025 22:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D89820ADD6;
	Sat,  7 Jun 2025 22:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cCozPKiy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0771A239F
	for <linux-usb@vger.kernel.org>; Sat,  7 Jun 2025 22:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749336483; cv=none; b=fX+1BZI+eKq+Q/ddMc/8aR1Wdy2sb4dNbv21wQZPA9dj//1bolCBDLYTVYZ9+LSt0Qfwn73DSu6h2w4q9oDnv/jlaucP4Kkib/YyjpZUk4srd7opd0wCaSrZTnzmN8aR+Uv9gjEkyqSMuSecysGMF1q35vC+aiCjVdj6WtUG5D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749336483; c=relaxed/simple;
	bh=/Fy/nW9OiVtT8uxbpQbL+4fFCzKa95apeIKmTE7VAFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y6h+YWnW9Xsf6b7TpNHo7SoEfRHdsYjJiZ5LV6j6aQH+YQV7LwV0PRk2J3wsBN7zxt54srlwfD7KxUrKOxrk8LN0/zwRJcNNtnHEG9nLNIOJRSlsd8woFRgaHAxUpZUqMsLZO/eV/ByzVK5P49Qv9LCv7LiIgXAJnS8V071kfRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cCozPKiy; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso588723066b.3
        for <linux-usb@vger.kernel.org>; Sat, 07 Jun 2025 15:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749336478; x=1749941278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qczp5FmoFG1M1v3fyvNDLe4WYftbg83lfesrzOgMfXc=;
        b=cCozPKiyCXucrne2Lqxp3Gak+wQxB4XsPGMBctEwiGUsQUlKVEJQO3aZKoVmPRS6Tq
         A1/JS8B1jpD7GQljY76yFxigutGmLbbj7QP2UMTe8l2v44EySqyGpntjkUdxkK5EkITE
         ynAFj/GCovyv998yA5TX7xFHGHCxhfC7iNUcssjbsN5TcZ/vkoiKIF8gm43xMo7TAAxt
         8IKwpXRYbEN2gRqFIQKxKXLXQvhSejuLkMLxLKU/pocQZsMdUZXQLYX3tx2PQ4wAeNjG
         pRoyfQFKYyR+YnXCDSA5XVEE5dnkO4PZNgHzZJqVvigL7TUE+6x946BCz89syuOMRzU8
         9P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749336478; x=1749941278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qczp5FmoFG1M1v3fyvNDLe4WYftbg83lfesrzOgMfXc=;
        b=takeXJSerYkojYA76RWaj9O6IJmPGlHpRiahw8kVQRVrpnJLovoSmqLkTvgPPmyKbE
         fRGVnPUcMmTUzJVzARQMl5uBfB8KAj0d7HFAn86RpIqMthGNTnTFx4r1mK19xAr1ljRN
         QLpaZW4TXp3m6StWm4lBNT7Y4Zh0XBSSjVW5BCOloZXC1JTHGsilzZ0YyhJvFDGyr3Qe
         /hiRymPLZVOeM9Nxou91SXY7OWwy+HtgwK5dRHW6y6zOYvSF+WZyOl67qLxXKoJiQUFx
         yGsE2tCteIqOUqHLd386/eqH3X/wcI8BUeu5DmJkufw7kiOfnRdiMVUAdY3tBbUILXav
         EVVw==
X-Gm-Message-State: AOJu0Ywfo63MlDc8Z8g6+fiI4DJwkfZclVg0pM+ZYGJKilhfh8fOKHEJ
	dn6ipD6QTHx3T1Ak+906siWwCLBK99uVzHjgriS+i4ID38fHZu9ekdXbLdGX8TNPrmA=
X-Gm-Gg: ASbGncvR6py5uYl50JjP591Ekq73JI3gY2zGvA4PiN+ArRJWdFWjV1i4Dv5zfbTtaAn
	XFDFbTL+c/uXG7oIxp3OKaTT0rSCai9NC8isqp8mn/1cKJjGdVk0QjpeRvhDwMVZdBidI4Itv83
	ZY4ASL4Bdo1oqY7Vupziu/iAEu/tAcxfbI6USkkLEy5hyf8XNsr8qKnMH4UoBmx2BFSfGM2LVsy
	9eG4+3WkSB3OE5NukDTqWxNgocj7vwZ7qgUhwlLSRb31rKYc7M/UqU6y1JZfIlxx4G9a/MBCkbs
	DRBxoeRt6+HjINEQD9BKxfm7l0nXJcKHIEwIxXTxHkEQ72y/umzpVw+hLT9wM0qlVmU=
X-Google-Smtp-Source: AGHT+IGdpeCCT321N9wG/RSugGN7S6TZ/72B+qWT65PFz5F7Yefdeo3cKVuD06LOdUQW/F61eYyxDw==
X-Received: by 2002:a17:907:7248:b0:ad8:8529:4f9b with SMTP id a640c23a62f3a-ade1aa07b54mr732528866b.38.1749336478063;
        Sat, 07 Jun 2025 15:47:58 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ade1d7542bcsm327160066b.32.2025.06.07.15.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 15:47:57 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: usb: gadget: Reindent numbered list
Date: Sun,  8 Jun 2025 00:47:46 +0200
Message-ID: <20250607224747.3653041-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4127; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=/Fy/nW9OiVtT8uxbpQbL+4fFCzKa95apeIKmTE7VAFk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoRMGUT6SBRf3qEsfPeMbxAcrKfNAhOeXCsHIlT LIgpGGkxqKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaETBlAAKCRCPgPtYfRL+ TjpaCACV9rC0Aku7EgtA57HF8WYiAIG8ViZ3FwD5Gh/pPLnVV11e63Wd2nvMB7Yk55hhGzzwO/9 Etekyst31SJj0vBdIIP5MTYbue8wP/w+MWmuZq6ClnFD1PwuLaP7HU4lwWnfTMw629GYQT8f0Cv s05sfqtru6JHsMJ2JHpyWbdCSY5yQGCzhq0r/fsrDLVyn/wGmbc6Qy6KF7Prezxm4SJepsmm281 2STYLIOvye4XPZO2+56/Y+O3bEBsDeV8Eh30f6EIyKOixbOIXhjSREyEdBY4Pp5XLkxUbPVszeW Wtx3qfEqzLsD94dIBmtiJxm1/Ylof0Vc0HVwD4b4XlaTyObW
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Paragraphs that are part of a numbered list must be indented to render
correctly in html. Do that right here. There are only whitespace changes
in this patch.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

not sure this is worth to be backported, so I didn't add a Fixes: line.
If you really want, the commit that should have fixed that is probably
d80b5005c5dd ("docs: usb: convert documents to ReST").

To see the wrong rendering, look at the numbered list at the end of
https://docs.kernel.org/usb/gadget_configfs.html before this patch is
applied. There only the paragraphs numbered 3 and 5 are
ordered lists (with one item each 🙄).

Best regards
Uwe

 Documentation/usb/gadget_configfs.rst | 35 +++++++++++++--------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/Documentation/usb/gadget_configfs.rst b/Documentation/usb/gadget_configfs.rst
index 868e118a2644..f069d2a0d092 100644
--- a/Documentation/usb/gadget_configfs.rst
+++ b/Documentation/usb/gadget_configfs.rst
@@ -369,18 +369,18 @@ For more information on configfs please see
 The concepts described above translate to USB gadgets like this:
 
 1. A gadget has its config group, which has some attributes (idVendor,
-idProduct etc) and default sub-groups (configs, functions, strings).
-Writing to the attributes causes the information to be stored in
-appropriate locations. In the configs, functions and strings sub-groups
-a user can create their sub-groups to represent configurations, functions,
-and groups of strings in a given language.
+   idProduct etc) and default sub-groups (configs, functions, strings).
+   Writing to the attributes causes the information to be stored in appropriate
+   locations. In the configs, functions and strings sub-groups a user can
+   create their sub-groups to represent configurations, functions, and groups
+   of strings in a given language.
 
 2. The user creates configurations and functions, in the configurations
-creates symbolic links to functions. This information is used when the
-gadget's UDC attribute is written to, which means binding the gadget
-to the UDC. The code in drivers/usb/gadget/configfs.c iterates over
-all configurations, and in each configuration it iterates over all
-functions and binds them. This way the whole gadget is bound.
+   creates symbolic links to functions. This information is used when the
+   gadget's UDC attribute is written to, which means binding the gadget to the
+   UDC. The code in drivers/usb/gadget/configfs.c iterates over all
+   configurations, and in each configuration it iterates over all functions and
+   binds them. This way the whole gadget is bound.
 
 3. The file drivers/usb/gadget/configfs.c contains code for
 
@@ -388,13 +388,12 @@ functions and binds them. This way the whole gadget is bound.
 	- gadget's default groups (configs, functions, strings)
 	- associating functions with configurations (symlinks)
 
-4. Each USB function naturally has its own view of what it wants
-configured, so config_groups for particular functions are defined
-in the functions implementation files drivers/usb/gadget/f_*.c.
+4. Each USB function naturally has its own view of what it wants configured, so
+   config_groups for particular functions are defined in the functions
+   implementation files drivers/usb/gadget/f_*.c.
 
 5. Function's code is written in such a way that it uses
-
-usb_get_function_instance(), which, in turn, calls request_module.
-So, provided that modprobe works, modules for particular functions
-are loaded automatically. Please note that the converse is not true:
-after a gadget is disabled and torn down, the modules remain loaded.
+   usb_get_function_instance(), which, in turn, calls request_module.  So,
+   provided that modprobe works, modules for particular functions are loaded
+   automatically. Please note that the converse is not true: after a gadget is
+   disabled and torn down, the modules remain loaded.

base-commit: e271ed52b344ac02d4581286961d0c40acc54c03
-- 
2.47.2


