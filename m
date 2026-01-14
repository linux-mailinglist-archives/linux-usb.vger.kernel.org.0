Return-Path: <linux-usb+bounces-32315-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 775F0D1D07B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 09:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABD923045485
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 08:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877C537C0FB;
	Wed, 14 Jan 2026 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/7U1NoD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004A335F8AF
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768378270; cv=none; b=VBd0ngS3ily/FEDZN0RqGdxR/VsyDq6NcZ0atTUX1esQ1/95L3KofIUSb2cTu2hNkQFYLIkaeQE+qFThK/KRq+LYunEZFWduiayjkPlIVMPssE/+rTc4RYjYwQWG9PY4l2yvjqy/IAhk8+mx+FmSUunxjEgZQHE3DLuCPk5RfvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768378270; c=relaxed/simple;
	bh=Hb7ceaTeivR5urdB5AA77JIF1//DwtyGxzQxlMKUbUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S6FSt11PqkQFQW/JDvn3QzDB6irq7GSajvpriJbzMbHF2ZkaXbbCgEos8QMTjLxXzDIVRSm5/3xpAftsTf8NECMp3JrqkeKTcxoe/71BrsmHBEIGYii/Sv06Mblscc6vJJ6Xx5n66evTdy6W9vYg5DDsb8AYUet04PHXv9x4Xeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/7U1NoD; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34f63b154faso256411a91.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 00:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768378266; x=1768983066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrBOS5eH8s+cAF+LrmXQgQpKlTUB93zAcRN2powL0Ws=;
        b=e/7U1NoDK7HbTyqriwmGy4tTNR/uUsWwYAxvCk06AkQF8MtKFHJtB2Ybzf3Y0PJHy7
         43MIkph++ybxTT15a9Nqy4vm891N3ripIaeItDJcrAyGW1cJ8hQu8iFpK56fu4SE5mn6
         WAGnxutim6C+mc1hWJjBzigeyCBz6yawPqYO5Wfcnc5Qd7OywHICmJHVWZMS3x98b0PA
         UhpUNpWfpmoNUf3/wFtPEka0CQxf9NbzHmo/uYSy4tL7uIwe13H8NqJTFlVI/7IPIowZ
         RyQvYyIk2RHlrosLiRaLPkS8NNXl7pZW+TXCUiwRP5bCbu/fBUjZwRO1ywmCvuIl7agY
         vBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768378266; x=1768983066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrBOS5eH8s+cAF+LrmXQgQpKlTUB93zAcRN2powL0Ws=;
        b=n3TCYsLs5e0cMoLEIs5xvsrIbh5h2mPUHhCxNQEO7rwRcVlY8eR8T+a8h4f17rlTb0
         hKtyMUjR97r81OUMmDCKO3WGzMlzcUeolK04lf9nFxGGeF2g4N+ecfkgNZk5gctlMBG/
         ZPTSp0Esuh0ofC2WDhsEO7yMWNSdWE/1oY+AC17UzQpHyd2ThUIgRNv+fRuE6W0k50+U
         pz6DSUI82lfP5w2Q4dc7hL3iiSx3cdUwWwWw9BaiYzveRGgtg1KbtQYYmDzvqjjtXcgA
         4tnFeOjkd5aQsI+wbhDKr+NDeEObg5XA0CHNkV+qdI7k+vkz8Imk8XU9HuPJXN94KZQ0
         e6ug==
X-Forwarded-Encrypted: i=1; AJvYcCXnARz7rgYwS/BX7aiRIFyO1HQvXQmY83Xz0l9RrdpnXO5L8NnyieDh1YKEYqS3DmKjNXmpgEu2X3w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0EvwLrEbJzzxGfOTO0PGr7H4dF8DYl52j4MJtvyBCs5hIiXUr
	7qYGi2N3Npn6KjHtVFqa1Lw/LzPrQJXh3Df7ET9rGhB3RZrtQOJXaMvV
X-Gm-Gg: AY/fxX6q+qPSiB3vPfJXJo1hje4V9h1XmX+1eu62c9QbbNAAIxC7+HW53b0zrMFYVkX
	GXeaEjA1/koDZ9rywTKgUEWc0p7/NgtBpOVE77uUvZC59ngnJstJtv6I3VJXSYk4AM6kp5F+560
	56rUQSMft/x94p1dfzBYuoMbVCk11ghj94HLkpeu5+DSSKNh/dlvlAcvuGruKTKXTT+M/LwrnKq
	ckvDgxGf48QGXAeTsx0L8KzgtQ9N3HMvKJfOl98274xsC12R+sUcSA8YCtRrdp8Pefuz7RIEqzX
	qDQNHk2mWQGvewsEKYmMkdMVUFfBIoQ02Ryfn1uNghBhUgWtEZI0XUsUq9LmkWmz/80hCi0S5H+
	d6NwIiRLg33tW49UOGd6worPCA1STQN6CIEVRC6p996Us1LMMK7I9vvYNfcTkJwuDXzW6k1hyU2
	wUjbQEXUUGSQ==
X-Received: by 2002:a17:90b:58cb:b0:338:3156:fc3f with SMTP id 98e67ed59e1d1-3510913ccd3mr1305979a91.4.1768378265722;
        Wed, 14 Jan 2026 00:11:05 -0800 (PST)
Received: from MiniPC.. ([47.246.98.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109d88f0esm1199575a91.5.2026.01.14.00.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:11:05 -0800 (PST)
From: weipeng <coderlogicwei@gmail.com>
To: oneukum@suse.com
Cc: anna-maria@linutronix.de,
	coderlogicwei@gmail.com,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
Date: Wed, 14 Jan 2026 16:11:00 +0800
Message-Id: <20260114081100.830758-1-coderlogicwei@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a53fa501-dff1-4732-92c1-fab8e66ef886@suse.com>
References: <a53fa501-dff1-4732-92c1-fab8e66ef886@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026-01-13 20:23, Oliver Neukum wrote:

> what prevents the following sequence:
> 
> i2c_tiny_usb_disconnect() -> module unload -> i2c_tiny_usb_release()
> 
> As far as I can tell, this can happen and you'd execute already
> freed memory.

Hi,

I got it. It can be solved by using wait_for_completion in the module exit
function to wait for all the i2c_tiny_usb_release() to be done.

But after think twice, I think it is not a good idea. Because that would be
too complicated for a driver. Almost all the usb drivers does not do like this.
They just call release functions in the disconnect() rather than put all the
release works to another task. So I think the key point is not the disconnect().

The key point is the i2c subsystem:

> void i2c_del_adapter(struct i2c_adapter *adap)
> {
> ...
> /* wait until all references to the device are gone
>  *
>  * FIXME: This is old code and should ideally be replaced by an
>  * alternative which results in decoupling the lifetime of the struct
>  * device from the i2c_adapter, like spi or netdev do. Any solution
>  * should be thoroughly tested with DEBUG_KOBJECT_RELEASE enabled!
>  */
> init_completion(&adap->dev_released);
> device_unregister(&adap->dev);
> wait_for_completion(&adap->dev_released);
> ...
> }

The i2c_del_adapter() will wait for all the users to put the reference of the adapter.
It is not a good idea. We can't control the users. So the i2c_del_adapter() can wait
for any time.

Best Regards

weipeng

