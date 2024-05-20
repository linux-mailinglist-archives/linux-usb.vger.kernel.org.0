Return-Path: <linux-usb+bounces-10351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FA68CA37D
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2024 22:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 755B31C210D3
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2024 20:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFA213A3EC;
	Mon, 20 May 2024 20:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IM2hdUYB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAC913A406
	for <linux-usb@vger.kernel.org>; Mon, 20 May 2024 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716237721; cv=none; b=A0I9QSH9BSU2cOQ/x5ta7lxzfR09a0O6jBLykZ3QdyVf43OK3KPx6gwTzlTZl9tO+yHhQ1m942+xrGIKRlNu8YwRsbNyLNfzHzFX5/tIcIsBMWLDoeFES5vH8PHAjuM9nUT3RI4eiGWnNwzAN0fVgL0cHRu5Vsa2Xu45UBQ74fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716237721; c=relaxed/simple;
	bh=KH7KLt1vLHj8lAyyx8nEvtd9Ch2hZ4E0zERhgbKhEpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZpqxKf8ELIDJpOr0vB6e0Hk4We+dW3vQavvqTr5UY0P/WTlaNPGd+7m8VGu5wavyuQOp/UlYA/ZT7Au7aVmLHBIy0Linu/oL7izSDhSYlrHNj0xjSLQ2C9F2TYjgKi2Vp4iINTEHQ3xRHAXnMpflw0dv4wVqEFqWacJRLVNNqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IM2hdUYB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ec486198b6so81097245ad.1
        for <linux-usb@vger.kernel.org>; Mon, 20 May 2024 13:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716237719; x=1716842519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAPtcTBq5rQklg7My1+KHMw3K3I6I7ZSFTklmvsLyz8=;
        b=IM2hdUYB3iWRPBR7kgABs1XQxgueTzVDUdNmzbFAYE7m7OZAFVOcUSoDbrAA7yTqM7
         zc+c5geP7Q/Cj6TKfe9YOtcrYCsOq7d2oOLKxxnvp6yA7q3WPjdeEKAJGsKVKiGcsRmk
         Waoz7RNRxB/ZWK654A1OXFr8jYXHTxHLnmiNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716237719; x=1716842519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAPtcTBq5rQklg7My1+KHMw3K3I6I7ZSFTklmvsLyz8=;
        b=rPXoyVeH5Sox+nWibFKXy6HwF/LG++kHUqA6HWznyuqBgpPE6VeKcwRjtlyosMRw4s
         xqtGa1vz6N915w95qwGNR1UEjzuExcdIKMS/LqAKYiXvGQY1jhHAlcMtmwftCCvNOEjV
         nFSXxaNDVO5LILzj8/Hli6AaOJ1boodE7PbIyrVHf1HVEQlDeS8IQU5cxpIM56PkCYkk
         o5UHSNunEDyMTFMKz9N8ILK8ggMUZBTKhCkzEMtjf2gBXHp4S2kN0H72eBdddXAHxZKe
         ysI40/jNFtIb0r13ACkAXnbA7SuynjTrVucD7tgLqDVS6Isg4Ym+fV+y42A0o+083qQx
         ZChw==
X-Forwarded-Encrypted: i=1; AJvYcCUSINolwkLJxkB90m7TWY9DTK5MOAel4lZTmX63fq/pjapg7Iv+Me545YPiHlNOsi+4Aif0FHau5WempFhGk93auoTWicCnTfY6
X-Gm-Message-State: AOJu0YzBhUT8t/z0ncNfto8EFvoyOQr7DOLadUnWdlT8NfymMPKfrXE3
	fBy9igq4uHall5FFT9eYExDRPZGgXKcjglcsLlcIX0/89wHD6ZMnAQtV+nucUA==
X-Google-Smtp-Source: AGHT+IGox8QB8PBU2tVVtMM4gyfbOeKz51VVq/e4AHSre+WZ4yCg3glyJBr+5bnclNzM/WQaC0MSjg==
X-Received: by 2002:a17:902:64d6:b0:1e4:5b89:dbfa with SMTP id d9443c01a7336-1f065fde55bmr228544205ad.41.1716237719595;
        Mon, 20 May 2024 13:41:59 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:cd20:112a:72ca:4425])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bbde9d7sm213068255ad.106.2024.05.20.13.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 13:41:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Hayes Wang <hayeswang@realtek.com>
Cc: danielgeorgem@google.com,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Grant Grundler <grundler@chromium.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next 2/2] r8152: Wake up the system if the we need a reset
Date: Mon, 20 May 2024 13:41:12 -0700
Message-ID: <20240520134108.net-next.2.Ic039534f7590752a2c403de4ac452e3cb72072f4@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240520134108.net-next.1.Ibeda5c0772812ce18953150da5a0888d2d875150@changeid>
References: <20240520134108.net-next.1.Ibeda5c0772812ce18953150da5a0888d2d875150@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we get to the end of the r8152's suspend() routine and we find that
the USB device is INACCESSIBLE then it means that some of our
preparation for suspend didn't take place. We need a USB reset to get
ourselves back in a consistent state so we can try again and that
can't happen during system suspend. Call pm_wakeup_event() to wake the
system up in this case.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/net/usb/r8152.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 6a3f4b2114ee..09fe70bc45d4 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -8647,6 +8647,13 @@ static int rtl8152_system_suspend(struct r8152 *tp)
 		tasklet_enable(&tp->tx_tl);
 	}
 
+	/* If we're inaccessible here then some of the work that we did to
+	 * get the adapter ready for suspend didn't work. Queue up a wakeup
+	 * event so we can try again.
+	 */
+	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+		pm_wakeup_event(&tp->udev->dev, 0);
+
 	return 0;
 }
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


