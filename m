Return-Path: <linux-usb+bounces-31520-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6DBCC575B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 00:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 238D93052B22
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 23:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8520D33FE04;
	Tue, 16 Dec 2025 23:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rt846+Tq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACFF33D4E1
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 23:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765927422; cv=none; b=fibZVoZ1YwFJgBYOOJpK+D2CxaNm+MIRdCvQEgKosQ1lkEppjrhzKH1fzpocCDmQ4YiVo+o3X4CDP7sqM6BuOBvozKutCQasTlln5/+LX9zKKUkY3kJw5x0HL6+d2wQ9efpvUwqUaNqbF/XSVghoPUPxQXkZdXVu5Uy9ejip35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765927422; c=relaxed/simple;
	bh=p2Le98Oihmg/I5e6cqTCv7nZ6Bf6ATtna7X7az6/Szw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sk4YeT693OUUr3yIdtqPVxZiwgERRvbhVaBy1A9HsYCNoteDK6+tHcLQ5DOA/VFMjzyhUjj9KNRRgJk1sPwzIeRHRF6zUj8yo4mAZPsvn3TTiSL+SKI2kAe7k/qmXDcJOEqabbiq20pihH6F3akWvVOOrE1ttKgGklAWh5IkG6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rt846+Tq; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3f5aaa0c8d7so3754974fac.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 15:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765927419; x=1766532219; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6tR426XIRMqRtFk2rP7biIuhLUYaP3KajXpeq25hMx4=;
        b=Rt846+TqnTnOJsXu0NNxyd/O/GfFYqfK5Ol6nguZYjffY0PbTkHmTskiHGUOs5RWnc
         g9fBC1AA9ayR4Jts4WOq00BrokSZDzU649xt9vjKSDDoupk2Wc+AG7DLq/4uPRM4zq7n
         Yf8ibijqcJqhSsqFYSXiOe4c/qgYqam57o+bKQ2ZeDuw4QNuSZy1pTltB4tEm5sfCZw0
         OTrfNxmz+AC7uVc5r9OOHMlG0RlSSCE8Yb/lW0ZgphSktuYG4w9onG+ZNxpPwLy5YZoc
         L/J/cLwGYE/FLHdi2qC58TanjbFWevX0mn0y74A6hc2coCV7foToZI9+kF/oztyyzLwN
         xT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765927419; x=1766532219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tR426XIRMqRtFk2rP7biIuhLUYaP3KajXpeq25hMx4=;
        b=OvVfHHrDJ0mVGBbKfIEtQpVeEk24UKmyu0iTF6LWTf4V2H7yNfqJ+t9tKmY9YskFaX
         lU7wMqF6nsFX1/7U8Ngh6ekQW5T3pbxVyeP6AbX5gpLe/37fkLQwFN7+23eHcdabLRmZ
         WMyVWGkE7a3BnZnkV4C5oe3AUEb2FmuUz8mGdoEcNlDmqpTkCTpKDfIO/p8PJTLn+8Fh
         eRYU2Ts9UwGqF9dcPsVlDXrswNNhyTe+hzUi4VZScQ45PKG5gi9im8YglMIZw2ZwTLQv
         nNLyMLCgA1+6qRuhQM3Y6SbEdkgfG8BEUKTe5II0uErfexkVXCHak+Elpe61NwreTSqR
         VVqA==
X-Forwarded-Encrypted: i=1; AJvYcCUthkswXET/0XJHZUjYLOi2jxVghHSlngPRB2ah74T33X4mgz67bBJZ4bGJyJx6V31i+wVGJigfOTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuDQUGFczNjgubJKEbnuBvVasnd+FeAw4UJZTxYupB3kkEt5dS
	kQVfLVnp4jYfgMN+9yIDx60vVwmURChh/+nTqcJyl7Me+JkpKMeKB0ZwfbC2UOYMaElkw3F0zAB
	dFh0OsFx3zVDnLVUG6WocCunZdjxtucA=
X-Gm-Gg: AY/fxX5jJUbh1IpJcWXwL6tevUqnGCeVAVLYbKURx3AYEE7iq/XRCPX/2f6aTFf+MvM
	qi1/XG/DKPpL7RinMpPwPBRCKddtQvMXrNfKxcKM+9rUlrUdcQ4B52qm3kf/Bw2kCu7gAcvG8lC
	kn/bGkYwYdNSD7YF9dD03ols9eypM9xAitf7jbtCen2HIpantNwLFXpfIoypiAEWDEn6oL87eG0
	uGEEcgNziIzEf04JyypyND8tKL0x15tnMYkvJPPa1Tqn+vJwE9BN6Nznu5XHk3G+OQ6kDps
X-Google-Smtp-Source: AGHT+IFVlIqs93eHMoHC0M0yx2toIitcXtSfLRUcuxvp301PLZ3twqBTDuQXP9Ek1V5+Rwg8y0UfTwir7t3yFpYy4r8=
X-Received: by 2002:a05:6820:2294:b0:65b:579c:8479 with SMTP id
 006d021491bc7-65b579c8cd6mr4626167eaf.75.1765927419075; Tue, 16 Dec 2025
 15:23:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <69412f2b.a70a0220.104cf0.034b.GAE@google.com>
In-Reply-To: <69412f2b.a70a0220.104cf0.034b.GAE@google.com>
From: Raka Gunarto <rakagunarto@gmail.com>
Date: Tue, 16 Dec 2025 23:23:27 +0000
X-Gm-Features: AQt7F2o3k_WNMGHaMAPIqq6wt5gOmu1NHXvbiYv5er6CvAA0ZWNkDAGzR0yNd-c
Message-ID: <CACUOwmJSqHu+ZxaKat7uD0X7O483omE56xYkKDU+a=dGs_n-BQ@mail.gmail.com>
Subject: Re: [syzbot] [net?] [usb?] memory leak in rtl8150_set_multicast
To: syzbot <syzbot+8dd915c7cb0490fc8c52@syzkaller.appspotmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, petkan@nucleusys.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

async_set_registers() does not free the urb and req on the
usb_submit_urb() call fail path. Fix by freeing both objects.

Reported-by: syzbot+8dd915c7cb0490fc8c52@syzkaller.appspotmail.com
Signed-off-by: Raka Gunarto <rakagunarto@gmail.com>
---
 drivers/net/usb/rtl8150.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 278e6cb6f4..0f6c700a85 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -211,6 +211,8 @@ static int async_set_registers(rtl8150_t *dev, u16
indx, u16 size, u16 reg)
                if (res == -ENODEV)
                        netif_device_detach(dev->netdev);
                dev_err(&dev->udev->dev, "%s failed with %d\n", __func__, res);
+               usb_free_urb(async_urb);
+               kfree(req);
        }
        return res;
 }
--
2.25.1

