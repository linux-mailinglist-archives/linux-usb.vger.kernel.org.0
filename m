Return-Path: <linux-usb+bounces-18464-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C299F1A32
	for <lists+linux-usb@lfdr.de>; Sat, 14 Dec 2024 00:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C865188E152
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2024 23:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2611F03E0;
	Fri, 13 Dec 2024 23:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="izMDvyiz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1C1E0DB0
	for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132962; cv=none; b=UVmMTLOYGd2iwFTRKKsgzGPajAh3xHzw7sf2vK5JuqhTUPAqOdKHj6d1TnZgdLpAlJk81vbueD43CZA5FjPyiFAzVolFON3mp12/6CKng7v7ByNJdZiw5aRaulZLeTtCoFQmfISUObAh1puWkNYaGvIzlZsnrEc1V5/8UNnLUsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132962; c=relaxed/simple;
	bh=At4yxUXPC5gCISpGbj4Jh8y2nbyqYWKzXfcEq34ABtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ij5xI/lfl06Wu8ZlBMK/S5UkvNnkNPJU5ObNuf7F9UA94dsSaPYTkuoTBSrjZZiNvFMbk8U9G41GS5bB9qBPXxB45TBbO9efT0z+pycUDf58EDuTbM14ojcGYdMK+CXLFFepw7l4uVSa35hOu5/cOGLO10/5C5EeQy/9in2gx/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=izMDvyiz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-728e1799d95so2767770b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 15:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734132958; x=1734737758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aNEDHH4018fnzzsqut871HqEVIOaY/MIH7LrGllh5I=;
        b=izMDvyizqTgy/JCX3GN/xUmStq5dYJgqnSUxZvoTk/EL8HrTI+oq0D11EVVeYQON7D
         QAyCvgCScbdMJRZh9uihMx9bahePiXq0fsF/vd76vgpOGioewLUfMohL/gUnRsoDlIIN
         GoCBpKlPgwtpprO5ycy1e+LQBp62Rr0mNoLqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734132958; x=1734737758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aNEDHH4018fnzzsqut871HqEVIOaY/MIH7LrGllh5I=;
        b=Hy9AC46eh3BoNDQXbK5OX4sJdMS7Xy9f4LcJ9MGbUKJVZZlZJqdYFHPNJKDYCu+xtB
         nwsbQZSY3tCjbbUARRHxuFYZQsNoe3iL78/SctQGywJChCySLVkkFc3bHYWIVirR/jxs
         /wOMXma0m9cZJhjifvMKN6qVpoCVd9Ie9kEI0niRk7Y+iSZL3JAt3IouYLyIAlL0ARdh
         iX3y6W7Ih4E1ACtoY3XDIntdbkFt9qHcx0PE7ITR7AvpCEffsDvpiQdOsvwa5vwYs44n
         b5XoMj1Pvs5+c1p8prG8e4/Cqy88qugx37F/MGw+7Oj95y1ocWcp0RZthVIkQy6QFWsN
         8Wqg==
X-Forwarded-Encrypted: i=1; AJvYcCUtA4bVwX92TnOlFAvsG31bXt25pr7XrW5C4CbR8MTEhHkOZ7H/gv1Ghfr5NfTsuNLbfsxeM/YZs2k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyay+khr/4Q2LX9zKKrPXHeIBVtItwc33NOxogFETyjb8UVMj2W
	wHBXOUBiU7ZdAJ9IbNqoIESV/sfu8Ns+9e66wyS38SuMr+xDqlwkds6sTDR4rA==
X-Gm-Gg: ASbGncuamy45iWVVI7BTZB9zTKpuPCn4W/Z3cd7moN4cFzD3x5jjWdXnIaIZZctYws7
	GrsN6JV6dYtJJVYQ5zldo0b5X4c5Wl2yS0mxwNIXa5elogtfEqYYBDjdxCsx8d6FtSgdYL3RyPd
	afJahM46Df5K2/gVZZ1yF7vciS73kVpvdL7WJOGPZZgMrpER7SsVo8fi2FXa1vxgWgP1phLybao
	S1Anz67PHDKHt7Xsug1TUq+0pylfZY6pVG76fu82Wu0inCqpZMfFAPUAtx6ShACTI7uSlTJ+eo3
	WQNEs55gQ+ElBQ94OzhIEaiGY5M7PRY=
X-Google-Smtp-Source: AGHT+IGuN3bapepIPxR4xf+sjr97DT0siePvsa4ASfkZeWVposaJaxMdiFV3aR4FrmX3VtJTvm6U/w==
X-Received: by 2002:a05:6a00:f8a:b0:724:f10b:e663 with SMTP id d2e1a72fcca58-7290be74313mr6956527b3a.0.1734132958609;
        Fri, 13 Dec 2024 15:35:58 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72918bad896sm336267b3a.143.2024.12.13.15.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:35:58 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	sboyd@kernel.org,
	pmalani@chromium.org,
	badhri@google.com,
	rdbabiera@google.com,
	dmitry.baryshkov@linaro.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Bill Wendling <morbo@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 4/8] usb: typec: Print err when displayport fails to enter
Date: Fri, 13 Dec 2024 15:35:45 -0800
Message-ID: <20241213153543.v5.4.I6cff9d767b0f8ab6458d8940941e42c920902d49@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241213233552.451927-1-abhishekpandit@chromium.org>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print the error reason for typec_altmode_enter so users can understand
why displayport failed to enter.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v5:
- Put dev_err on single line.
- Slip clang-format a washington to look the other way.

 drivers/usb/typec/altmodes/displayport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 3245e03d59e6..ac84a6d64c2f 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -252,7 +252,7 @@ static void dp_altmode_work(struct work_struct *work)
 	case DP_STATE_ENTER:
 		ret = typec_altmode_enter(dp->alt, NULL);
 		if (ret && ret != -EBUSY)
-			dev_err(&dp->alt->dev, "failed to enter mode\n");
+			dev_err(&dp->alt->dev, "failed to enter mode: %d\n", ret);
 		break;
 	case DP_STATE_ENTER_PRIME:
 		ret = typec_cable_altmode_enter(dp->alt, TYPEC_PLUG_SOP_P, NULL);
-- 
2.47.1.613.gc27f4b7a9f-goog


