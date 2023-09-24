Return-Path: <linux-usb+bounces-545-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D005E7ACAED
	for <lists+linux-usb@lfdr.de>; Sun, 24 Sep 2023 19:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id B064C1C20A91
	for <lists+linux-usb@lfdr.de>; Sun, 24 Sep 2023 17:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DC7D52C;
	Sun, 24 Sep 2023 17:17:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4DBDDA0
	for <linux-usb@vger.kernel.org>; Sun, 24 Sep 2023 17:17:21 +0000 (UTC)
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC306FF;
	Sun, 24 Sep 2023 10:17:18 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id BBAE082064;
	Sun, 24 Sep 2023 19:11:25 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: [PATCH RFC 0/6] ARM: pxa: GPIO descriptor conversions
Date: Sun, 24 Sep 2023 18:42:53 +0200
Message-Id: <20230924-pxa-gpio-v1-0-2805b87d8894@skole.hr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA1nEGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCwNz3YKKRN30gsx8XePkVCPTFFNzEwtDEyWg8oKi1LTMCrBR0UpBbs5
 KsbW1AHrYMDBfAAAA
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Russell King <linux@armlinux.org.uk>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=B9DP0CxfWMcnVFBkaCnG2gUKEhrfXwj6FqG5mvPhN24=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlEG27bNYu4Fa4414ypkowuQ+gQAtFotUwZOv2q
 d1cTD9kvnCJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZRBtuwAKCRCaEZ6wQi2W
 4ZjQEACo4c4VxqU5rJUdrlr21h4lHp2LcaxM93RzM0JC/NtD2NhGy0N78D0zdx014gLbvRFYIAA
 bZfzf8MOK5SZLUJacCUt2kfxb+wUD3AjCEuS4zjfqhTtGbmR3GFWNun3v4IWmbg1f2h/1wUCMhU
 6nuEx0mtnZlQGwEC8AecRbC1LEcby7IG6Jpj251OYz4xOj+KOZdS1zGpWXQj4D4GASTuTrxqwx2
 uF4+iOkIcE/4zwB4EjYnPtLA6uJIUknSjvedyTZoJ7rD5Hx9T4NWfMl93gzKVnxztoh5di4RGb3
 Ky+tp/JDFU3kQzn0kWbg7CqJNcu3rMF3aUbdvcwKv7qSnCiUWJwhfyElAXChEtJG2latdW2P382
 aMVDogpHYPteq/D1rsyygF2Wi/RlyvBt1OpuQ7oNp5shyrcMigNI5KBvblMWxQRXPfH9FLeVmsU
 aiiM+33n4pZxl2uQaEzpsV/nP1kJuiZ0i664df1bfhllpd47n0vO8b5nmKt6TR8Lb+b/Qo2skUG
 WklpXKEHAbyPFyrrar2UeObzm7s9/1r7Kt4FWuat/+7nBA85QB1rqly/Da4LtO7LE9FnY5AYjTJ
 VT1UfzHTr2l8XIQl/G5onxdXjlkWrYNVrO2xgiFOsCSYnyIOazi2pTb5JejNJB/En1I3rQ4Xw7g
 FunsLXRK7+2dlbA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello,

Small series to convert some of the board files in the mach-pxa directory
to use the new GPIO descriptor interface.

Most notably, the am200epd, am300epd and Spitz matrix keypad among
others are not converted in this series.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
Duje Mihanović (6):
      ARM: pxa: Convert Spitz OHCI to GPIO descriptors
      ARM: pxa: Convert Spitz LEDs to GPIO descriptors
      ARM: pxa: Convert Spitz CF power control to GPIO descriptors
      ARM: pxa: Convert reset driver to GPIO descriptors
      ARM: pxa: Convert Spitz hsync to GPIO descriptors
      ARM: pxa: Convert gumstix Bluetooth to GPIO descriptors

 arch/arm/mach-pxa/gumstix.c    | 24 ++++++++-------
 arch/arm/mach-pxa/reset.c      | 40 +++++++++----------------
 arch/arm/mach-pxa/reset.h      |  3 +-
 arch/arm/mach-pxa/spitz.c      | 68 +++++++++++++++++++++++++++++++++---------
 drivers/usb/host/ohci-pxa27x.c | 10 +++++++
 5 files changed, 92 insertions(+), 53 deletions(-)
---
base-commit: ce9ecca0238b140b88f43859b211c9fdfd8e5b70
change-id: 20230807-pxa-gpio-3ce25d574814

Best regards,
-- 
Duje Mihanović <duje.mihanovic@skole.hr>



