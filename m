Return-Path: <linux-usb+bounces-8059-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321A187F3D3
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 00:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE85CB20EFD
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 23:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F75F5D474;
	Mon, 18 Mar 2024 23:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PHlA5CWV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD3F5CDE2
	for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 23:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710803437; cv=none; b=j/ANQ1AbHC5geMQDd8uVaRGZcNn1a5okDr6NrSb1nyJZUbwsXH3ddO9ZPlT0pOSfau8mOI7uhHYVt/cjwh3tCuDUtlKLNW4fDTlh8eqzl/nsHEo7gHcutrO/hC+EF+jLLEGyUB9+LDGGjqpeeVjenBVR/xMyhjhxx2B9OnGI4ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710803437; c=relaxed/simple;
	bh=6jYhW6ydpdVij+ItUl9+t6eOIBUYAlhnMEs4srqkJUA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nWnp+qD2syjJf0byKluFUB6EZI2HYlfHbWPpc56++3d6fC7rvukIo/BnfE7PnlE+u544wXNOT8wIJ1456fJQgO6EOzJ+3cd1LI+xwRWQRCWPYKtCcBuIbSS3q20HcmZRxy2YMX6KOx9VQ66ESnSXE1pyRnbPzZaKZH3IbaDDb1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PHlA5CWV; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60cbba6f571so95208787b3.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 16:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710803435; x=1711408235; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tZvJyHjjeZb/3QPL6MnqU7na7/zPGmCJPMlCf4GgcJU=;
        b=PHlA5CWV0mAZt501cGC2jwcO0KzOhIqWh1tuZOPXl7P3MbBZtaJqNnGEqODNDADgTG
         T0okeAnLunL17DrsS6pU2wWwHYx62XFI+b6BCrApDloNEUW+VKANVM5blOmqZm1u0Xp9
         hwv04WEQwJYuNvEeD6tDSAgGpnF/M2WrzVfR4GCdwcUa/Iszz/9ctOMx91KwFoF58wdG
         EiYoTHDQEPDKLanYijik0uZqVMv9zpWZ3dNwbgSRsZY2alaSFE6N2OcyGkyd8iOxQPeV
         lcVb7A80OBmdupy9jf7z/eLV49r0yXhFSUk6NyPrR0PzSgKSkB9fzMio3EqNF8IHMFUn
         crCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710803435; x=1711408235;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZvJyHjjeZb/3QPL6MnqU7na7/zPGmCJPMlCf4GgcJU=;
        b=xDwL1/OAW3jOx7gT/QMwjXcjLl1g3WSSuzAJwGuWpdlbmza8bH9odXTRllVuozSC4Y
         GafNs02KFzCwKNpiKYJ8ObHFLJxZrF+CZezfUVMsmgjAtcoWZjPVZ8sM3WKgSDaHGXPw
         QrKZmbVGdPjwdvbyoni8QCbhscgHp0yNS6YvjLlTbfMZtGtK49E2gutq3mG9rDBa3YMD
         FPdtr0/95xn/Om1HzMjPXBO0JT866R1tFLCuEqxRYklVDcK0B5p6vvEbasK4rFT2Xv/r
         BxBoGYr4h3z0tkRI2Uk8J6yiKoxFuwYHgelTdeSkaWvIQeWwa5A8X2waT9dt+Iq3V4Xe
         i1vw==
X-Gm-Message-State: AOJu0YzvLfYfPg8UZWwqY/7zjX8Jr5WLWyqlyxZBcGesPRU5huy6nztw
	Z7KLCwMFdut2rOKMgN/D/mxqeraOf+E8p81zs77qUrQF4vGxOuqREQu4o2iGOkt/Sh+aeC7fYc2
	su6umFjFDZG6qaUnaGW9AHw==
X-Google-Smtp-Source: AGHT+IH73euqwF5jsoW328dNXM4qo380w3n37T5C8C32Ee+aaxPoawVFf4Jq8fPb3fV89pWUL7velSZ6dS5y+RcQpA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:248e:b0:dcc:54d0:85e0 with
 SMTP id ds14-20020a056902248e00b00dcc54d085e0mr3417030ybb.11.1710803435207;
 Mon, 18 Mar 2024 16:10:35 -0700 (PDT)
Date: Mon, 18 Mar 2024 23:10:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOnJ+GUC/x2NQQqDMBAAvyJ77oJJapF+pRSJyRr3kspuIi3i3
 w09zmFmDlASJoVnd4DQzsqf3MDcOgirz4mQY2Owvb33zoyoRXLYfhiFdxLFqjMmHxMVXGoOpfl YJyorCQY0dqA4OvcIfoDW3IQW/v5/r/d5Xl1slzl/AAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710803434; l=1534;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=6jYhW6ydpdVij+ItUl9+t6eOIBUYAlhnMEs4srqkJUA=; b=2ohvlrMEBBX4ty5GbUeu3anF0rb8vduud1G67Tjv5hvf0EarSHFWyMTU9rL5VEZPl79Lgy2nS
 N6K7HTiaa3DDlnd/w9onbZxW3Jlp56TX9ziuk4/QBAAVfrLI5YdAjuP
X-Mailer: b4 0.12.3
Message-ID: <20240318-strncpy-drivers-usb-gadget-function-u_ether-c-v1-1-e8543a1db24a@google.com>
Subject: [PATCH] usb: gadget: u_ether: replace deprecated strncpy with strscpy
From: Justin Stitt <justinstitt@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

Let's use the new 2-argument strscpy() as this guarantees
NUL-termination on the destination buffer and also uses the destination
buffer's size to bound the operation.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/usb/gadget/function/u_ether.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 3c5a6f6ac341..6e4ff64532c2 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -1032,7 +1032,7 @@ int gether_set_ifname(struct net_device *net, const char *name, int len)
 	if (!p || p[1] != 'd' || strchr(p + 2, '%'))
 		return -EINVAL;
 
-	strncpy(net->name, tmp, sizeof(net->name));
+	strscpy(net->name, tmp);
 	dev->ifname_set = true;
 
 	return 0;

---
base-commit: bf3a69c6861ff4dc7892d895c87074af7bc1c400
change-id: 20240318-strncpy-drivers-usb-gadget-function-u_ether-c-125ed8336ca5

Best regards,
--
Justin Stitt <justinstitt@google.com>


