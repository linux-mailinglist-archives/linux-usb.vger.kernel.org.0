Return-Path: <linux-usb+bounces-3923-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 941DD80ADE0
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 21:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 256A8281875
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 20:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CC857891;
	Fri,  8 Dec 2023 20:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C4BlyNZu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEBA10E0
	for <linux-usb@vger.kernel.org>; Fri,  8 Dec 2023 12:32:09 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6cedc988cf6so742698b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 08 Dec 2023 12:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702067528; x=1702672328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2mQlIlH8/Z8tgvJ/zwHnI8QH4gOVcIFjCJw+TXnnTk=;
        b=C4BlyNZuX0vmWiywMiDGcgYLLtThyzY7EqukTWLvqaoLBkfEkaOCCAlU9XXuJPMOqF
         MxSr6/JUGCvuEKavfvhjy+99Y2Y66ayNTY8LzDl2kIvmsfphNMKQpAmheuyYS5KuXkhT
         Met10JV2pE+2z7KRmybincabz6tU+eRbChw0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702067528; x=1702672328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2mQlIlH8/Z8tgvJ/zwHnI8QH4gOVcIFjCJw+TXnnTk=;
        b=p7YJVz2R/Xn7rTZBYCp+TTGhcELeJVLGIR5BEQGG+bP3+zWhY+MdQ7S0PtcDfloOmK
         TtW/G+9mtY4bo8uSe5RLWScIWHac1FIoftKKjJyUn1ESXzuzpmeBUCYedgd8D86rnJ71
         2edd+zjBO3/3JVS9f2/LDBYQjDreSAqDV1jsJ288RGdtNcA0hGk7Y8HboBKaMbZxBY5L
         Gp6Ikos+XxHIT8EiwxVgS+0MK9/a4UeYI9ALU18yBvVo86md83K1gnAo3fJXxF5lFtMd
         dHvPtLQ4kzRL6JidivDcOwpC/D5rB/U2bKUhKJe1kheTZqbQL5974CUJir+xH+3nYmxP
         rm7A==
X-Gm-Message-State: AOJu0YxWXgWa3+G1IkDyWJPBRnKyvz6zAVS7vU3q/rXXHBuzrdpSPCps
	wfMfFM7A6i3Q3cj9I8gntqOZD6Nd3yTa6vUSiKO7+SI4
X-Google-Smtp-Source: AGHT+IECgUmTr570zRuFQm0Wq6yqwNKiCLWdOUXopkyxmxMUTqTpcoylkRBQTtmdDdr1KFvNsC8w6w==
X-Received: by 2002:a05:6a00:2387:b0:6cb:bc06:b058 with SMTP id f7-20020a056a00238700b006cbbc06b058mr775362pfc.0.1702067528378;
        Fri, 08 Dec 2023 12:32:08 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e1ca:b36e:48ba:c0e0])
        by smtp.gmail.com with ESMTPSA id n24-20020aa78a58000000b006ce4965fdbdsm1995691pfa.116.2023.12.08.12.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 12:32:07 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Eric Dumazet <edumazet@google.com>,
	Grant Grundler <grundler@chromium.org>,
	Brian Geffon <bgeffon@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Hayes Wang <hayeswang@realtek.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: core: Fix crash w/ usb_choose_configuration() if no driver
Date: Fri,  8 Dec 2023 12:31:24 -0800
Message-ID: <20231208123119.1.If27eb3bf7812f91ab83810f232292f032f4203e0@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's possible that usb_choose_configuration() can get called when a
USB device has no driver. In this case the recent commit a87b8e3be926
("usb: core: Allow subclassed USB drivers to override
usb_choose_configuration()") can cause a crash since it dereferenced
the driver structure without checking for NULL. Let's add a check.

This was seen in the real world when usbguard got ahold of a r8152
device at the wrong time. It can also be simulated via this on a
computer with one r8152-based USB Ethernet adapter:
  cd /sys/bus/usb/drivers/r8152-cfgselector
  to_unbind="$(ls -d *-*)"
  real_dir="$(readlink -f "${to_unbind}")"
  echo "${to_unbind}" > unbind
  cd "${real_dir}"
  echo 0 > authorized
  echo 1 > authorized

Fixes: a87b8e3be926 ("usb: core: Allow subclassed USB drivers to override usb_choose_configuration()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/usb/core/generic.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index dcb897158228..365482347333 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -59,15 +59,19 @@ int usb_choose_configuration(struct usb_device *udev)
 	int num_configs;
 	int insufficient_power = 0;
 	struct usb_host_config *c, *best;
-	struct usb_device_driver *udriver = to_usb_device_driver(udev->dev.driver);
+	struct usb_device_driver *udriver;
 
 	if (usb_device_is_owned(udev))
 		return 0;
 
-	if (udriver->choose_configuration) {
-		i = udriver->choose_configuration(udev);
-		if (i >= 0)
-			return i;
+	if (udev->dev.driver) {
+		udriver = to_usb_device_driver(udev->dev.driver);
+
+		if (udriver->choose_configuration) {
+			i = udriver->choose_configuration(udev);
+			if (i >= 0)
+				return i;
+		}
 	}
 
 	best = NULL;
-- 
2.43.0.472.g3155946c3a-goog


