Return-Path: <linux-usb+bounces-17649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 257F59D0282
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2024 09:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 956A1B24C7D
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2024 08:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AB018858E;
	Sun, 17 Nov 2024 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b="b1BfGZmD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548E617BB21
	for <linux-usb@vger.kernel.org>; Sun, 17 Nov 2024 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731832352; cv=none; b=AS0GXQ9dTal4zxG1U3sfDIICWWjH9LzX21ASnfz+ZB/Dk0DR2w2ePsis7asHr2p68HeorUm884JRfBqk5f2bKZSvvcok4yzgkrdhUITnokjcHFxwjZRHwQiMJaXq+y4ucJ1gLqfg3ZudHCyz925LYjbogfm3S61jDO5hJveBW1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731832352; c=relaxed/simple;
	bh=pXHzeI/Gx2PAexegf0r4gW2+PvbHef/a8bLDzBEMcUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvarjBL7JdMi/ILm9O28BxQjYyiQaKDLAPJ8RAcqN8IvqBbY8MnnTVxE490nl0WO+sZ0U54fjRkwr2ySoWsorgT9cL3S/PT4g7qAUU9nTWToo0y/uFS8NXCZ6XeN72Xb0sR9KtzNRS/wPzmh5aqOU/CfCJLWYe0C8+kCHueVGAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name; spf=pass smtp.mailfrom=intelfx.name; dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b=b1BfGZmD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intelfx.name
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3824038142aso388467f8f.2
        for <linux-usb@vger.kernel.org>; Sun, 17 Nov 2024 00:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google; t=1731832349; x=1732437149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Q0LK28/34rKJsS2lihgn4HkLUleE9PLjRqMKlX+v/M=;
        b=b1BfGZmDod6e095bPWQ9M3zTw/NUjvdCLJsyqYrF04QvaqBd/j0qAyY5Nt8yERbOgz
         DhVtgRDjOsd6I/GUycGA6TEAC1W9QCV17ZJ+ZJcibsQhV6xRjtL0v74FhT4iFJ63ddEf
         SCFHB8z/K/MMHnvYJtm7P4a/4bVQiqU05OGv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731832349; x=1732437149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Q0LK28/34rKJsS2lihgn4HkLUleE9PLjRqMKlX+v/M=;
        b=pIfTB1jhMfeUo3lGvKu1HJ7GyVhyG5nvG13WR4TpVn9zUZEAFa2H6nABDQd/yc7REz
         MWLnXUZ11i29c3AsjEUljER1dOfeuWF6E58eTxO5IyQEDJC3TMhynm0e3ecMGyj52xcu
         2S8UWThCgee2ox0TnJDi0/M1nuAilDfeMComUdtTZYshNa2pIsCGgHO46bNyssNWy7AL
         h6c2gjL4C+csfIXmN+iV6WJanwzpiDMP/fsSahb1Ten20edv4UCytZ9w/BRI3OkRnSaw
         HtvEIsBjI0YiHEpFGbAy2gagRfkC5PwX7fUfWP6RXkeZZe2AwdixsDimjCuzGFHWjsYF
         3Afg==
X-Forwarded-Encrypted: i=1; AJvYcCUNJ9Bp8K1FnR1TPEht5+cIIeX4niolw+T1iTDlyKkn7rhuULV+oMh9eng5dcZ+Y8XB1Zgg0ZQ26AA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6qcSJgpG4sRC8oKjahKuEHJduPy8PXPF4igVnBp84el5ikLzH
	ghpEIl2pmDwKwV6qt3lD2z7rnPS7SalLIj94H8rI8ePxZvscr764v+Jtp8apQwCL+hrAM4mrd39
	T21E/eA==
X-Google-Smtp-Source: AGHT+IHM7o1qWLNYc3YaZlzqXtUAiKZiG8gYjY+V6LbMmsOL1mbBrL4607YU4H//0FQWLlmfScB+nQ==
X-Received: by 2002:a5d:6c6b:0:b0:382:6f2:df7a with SMTP id ffacd0b85a97d-38225a33468mr7001293f8f.34.1731832348703;
        Sun, 17 Nov 2024 00:32:28 -0800 (PST)
Received: from able.tailbefcf.ts.net (94-43-143-139.dsl.utg.ge. [94.43.143.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ae1685csm9466919f8f.83.2024.11.17.00.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 00:32:28 -0800 (PST)
From: Ivan Shapovalov <intelfx@intelfx.name>
To: linux-kernel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx@intelfx.name>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 4/5] USB: serial: qcserial: disable autosuspend for QDL configurations
Date: Sun, 17 Nov 2024 12:31:14 +0400
Message-ID: <20241117083204.57738-4-intelfx@intelfx.name>
X-Mailer: git-send-email 2.47.0.5.gd823fa0eac
In-Reply-To: <20241117083204.57738-1-intelfx@intelfx.name>
References: <20241117083204.57738-1-intelfx@intelfx.name>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a port of the corresponding change from the qcserial.c driver
distributed as part of the 9X50 SDK, tested using author's own EM7565
device.

Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
---
 drivers/usb/serial/qcserial.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index f1b0ef9935bb..b2ae0b16bc2b 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -257,6 +257,7 @@ static int qcprobe(struct usb_serial *serial, const struct usb_device_id *id)
 {
 	struct usb_host_interface *intf = serial->interface->cur_altsetting;
 	struct device *dev = &serial->dev->dev;
+	struct usb_device *usb_dev = serial->dev;
 	int retval = -ENODEV;
 	__u8 nintf;
 	__u8 ifnum;
@@ -289,6 +290,9 @@ static int qcprobe(struct usb_serial *serial, const struct usb_device_id *id)
 				retval = 0; /* Success */
 			else
 				altsetting = 1;
+
+			/* disable USB SS for QDL */
+			usb_disable_autosuspend(usb_dev);
 		}
 		goto done;
 
-- 
2.47.0.5.gd823fa0eac


