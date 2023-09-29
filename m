Return-Path: <linux-usb+bounces-762-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E6D7B3337
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 15:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 3D130283488
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 13:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDFE1A59E;
	Fri, 29 Sep 2023 13:15:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE3A1864A
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 13:15:11 +0000 (UTC)
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8E71AA;
	Fri, 29 Sep 2023 06:15:09 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 536AC83114;
	Fri, 29 Sep 2023 15:15:06 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: [PATCH RFC v3 0/6] ARM: pxa: GPIO descriptor conversions
Date: Fri, 29 Sep 2023 15:13:58 +0200
Message-Id: <20230929-pxa-gpio-v3-0-af8d5e5d1f34@skole.hr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJbNFmUC/02MTQ6CMBBGr0JmbU07tFBcmZh4ALfGBdIKEwwlr
 WkwhLvbdCPL7+e9FYL1ZAOcihW8jRTITSmUhwK6oZ16y8ikDMix5JrXbF5a1s/kWNlZVEbVUgs
 J6T57+6Ilq+5wu17gkcqBwsf5b9ZHkadsalD+TVEwzlBz9dS10bqR5zC6tz0OPjsi7rlqx2HiG
 i1lJY2olDE7btu2H3YkBS/cAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=ZXXO1MTt43BI/DSSWQXztjifMqczYVcjKstVvA9qX0I=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlFs3XN9glGVhCprsb0PWm1HcAGYFyGDzOu0HzY
 JvhdGErw+6JAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZRbN1wAKCRCaEZ6wQi2W
 4X7fEACVww75yICQbuA5WDOjhk2uNjgyy1dgzEwl89eSPHrcOhL9Zok+NYNBvU/CNESODuU7ZwT
 RI+zMRPVQ+9DvqOREpJTgd+Pa2giwr9utho2JxLAnFeiLjLYM54bVj7d89BzpqElKar39qKHS7Y
 z3XTlYVYVzegkbF2yjngvo6qRKBYP1nMd6+6oId6BqkarPd0r7KXvehiNs/pz/oiQxFMtEEdAQx
 VOyZQaN/ay+mZx6iZ8HQzrG10cAiSCb08m7+q5r/urspC0tY5EyShdU8NN2BLaknMYA0p9C6C+1
 pY6Hj8SqZcDu3oXNXHfhTM3/a7Xc6lZXipU6/AGCqOQ44+ywRGmM5KtK6BAhiuuIJfVf3ZlUoSd
 C7/kOfB2qaFiQkhM//a5CKiVVN5APdc8tOtbtmWXx7LLpupoA7rvdpbRCIehYTfkv0cjqWeY2S1
 pO1BoM2jTpx1A+7prtRWqCGyzKQwDgCJN1fBiUitlk5IOBMHEq88SWbjZbPRhRLDuBKM0gnDhxZ
 Ou8ojDacI/GQtL2ccuYsmmHriHPPYawFwC34rHzf0/l6EJKrjnsrKb0pjKQUoeEZ4TaDPZ2IHgz
 oDhXel8gygih5JXkv8yud1SPR1qJecHNK3IbLi3aLrk2ybbUFJW6C+yMuBSLqSwKM5tFcG4jEXV
 b6DUcB2h4MdaEMA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
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
Changes in v3:
- Address maintainer comments:
  - Use GPIO_LOOKUP_IDX for LEDs
  - Drop unnecessary NULL assignments
  - Don't give up on *all* SPI devices if hsync cannot be set up
- Add Linus' Acked-by
- Link to v2: https://lore.kernel.org/r/20230926-pxa-gpio-v2-0-984464d165dd@skole.hr

Changes in v2:
- Address maintainer comments:
  - Change mentions of function to function()
  - Drop cast in OHCI driver dev_warn() call
  - Use %pe in OHCI and reset drivers
  - Use GPIO _optional() API in OHCI driver
  - Drop unnecessary not-null check in OHCI driver
  - Use pr_err() instead of printk() in reset driver
- Rebase on v6.6-rc3
- Link to v1: https://lore.kernel.org/r/20230924-pxa-gpio-v1-0-2805b87d8894@skole.hr

---
Duje Mihanović (6):
      ARM: pxa: Convert Spitz OHCI to GPIO descriptors
      ARM: pxa: Convert Spitz LEDs to GPIO descriptors
      ARM: pxa: Convert Spitz CF power control to GPIO descriptors
      ARM: pxa: Convert reset driver to GPIO descriptors
      ARM: pxa: Convert Spitz hsync to GPIO descriptors
      ARM: pxa: Convert gumstix Bluetooth to GPIO descriptors

 arch/arm/mach-pxa/gumstix.c    | 24 +++++++-------
 arch/arm/mach-pxa/reset.c      | 39 ++++++++---------------
 arch/arm/mach-pxa/reset.h      |  3 +-
 arch/arm/mach-pxa/spitz.c      | 72 +++++++++++++++++++++++++++++++++---------
 drivers/usb/host/ohci-pxa27x.c |  7 ++++
 5 files changed, 91 insertions(+), 54 deletions(-)
---
base-commit: 6465e260f48790807eef06b583b38ca9789b6072
change-id: 20230807-pxa-gpio-3ce25d574814

Best regards,
-- 
Duje Mihanović <duje.mihanovic@skole.hr>



