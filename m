Return-Path: <linux-usb+bounces-32320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 070D1D1D410
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 09:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09C1D300D430
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 08:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560903803CF;
	Wed, 14 Jan 2026 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3mbw00g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D6037F8C9
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380694; cv=none; b=VZTgPCtFrtfOpedOQSszGg1kHT2mq3OgVonnJLRSMtin0nBaNlpcE6UFHY4/kNBmV4FvUifbB6JZO3Z3uWUtNqFMhqE91KrBtuyhtt2PEL7OFlRCi+YWiiR1Uec9D19B2ZYR+TRDPclbuJCGoIOw6NOcgLky3hRT4lg7GcDeb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380694; c=relaxed/simple;
	bh=OE9GZ1UPGg7x7F49i2t3FY2UpVoS6kq5wHMQbbxduyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V2jiVnYE4EF30xHaD8UG9gqGclSVlF6AkJ77TatwiyfS1sDdUKqiYXcE6uk4vHOUD2EUaIXKSIO3YNKv1dDQg/pR7RWnqi4JOkx3Cwfx5K4/8Xjr2eEMW6rKT91L7hHwK/YPJvlMSGxGVXRzsNhwsYmAe59Ji098rpC3+HFXTh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3mbw00g; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b90db89b09so412790b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 00:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768380691; x=1768985491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAEfI6V7TMd6SFDq7Kd7N1hzP70TqG2e4M3DDJvaCMY=;
        b=R3mbw00gYLLw44nuQc11i1E/7eT9u4cd2W/vxYoNh+xu5XuaS4N+8civsS+orTiATw
         SIa1c033rU9SUh6DP7s2HgSNuvX4Xnjcr+Jltx66HF18Hh9LljzM9z+s4qhtjwJJHmPX
         OZgpHQxsi7YYzq5p61n6wTaghmRrhQGX4AN1WZf9fp+UWAVnXAynJWqFfsqrLwErASMn
         IzezYCvAPHMCtUSj8PN2ZWhyFM/EOgtR+joNA30SMnO2K2GlEk8IB4EbApAcFHYW+zaa
         3zq94v2UXITZWb0U6D9KqWuIOcwZWhQNO6Ix5yHGBgjiA4QFOSN/rByPOPiWJGAAPXj9
         aNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380691; x=1768985491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oAEfI6V7TMd6SFDq7Kd7N1hzP70TqG2e4M3DDJvaCMY=;
        b=coN2tJmZi1ZxCKkD7z9J2k0ttPIqfVClRFbJOGK3kh186NatfR5qxK6O13GjwrUzVe
         DGBT1bPtc0aLfWU2owmjvuvrbUm9CJTKdGI7e3wxYI/kOuqquKMdeHaK6cHQGY04xpxj
         NlOmrgkngJ2OmsREzayUwSUp85hvAuwx3Zem46H0qNvZ3Tl2ASwjXeSDXghKXoHXHQLw
         DY64/Q4uvC9jGIWcABPnygpZ+lJYCSeNd/n9Xt01ipEqIsebfvHMaboFNjNWK2ZNmtPi
         RBjgoC1l/Q/ggz2Q/ld6rvM6LfRke1MIGEzsEud4OGPM5uSnhaXMCUDPr4D4EYhlqRyy
         8Gzw==
X-Forwarded-Encrypted: i=1; AJvYcCWoG6EqewczrtTB4Ox83EDJ/WDqkI4hQV2aM+Fze6Ijz9H59YDJDcPzloeNGIhuuxrMSR3amY06y3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWo6Poj8RK9fGG7UElNmSWxOrafHdwzUyKjSu6+fts9zc5S9r
	FxVhjyFODnPwq1zxvIgTHDKgQ3gGwUeqGzhNwe7rFvlkNHilgtUnQZY/
X-Gm-Gg: AY/fxX4E211P5RByFg/DEHnP2vt6J/gDgWZhBBUXk/ir4UPip8a0BBI8ou8d0W/TZ+L
	9OhdTXN+w7yfk2DblR8MY2+WxOgANy0VFRhbFobGaabYXN4SoMW70gUWjZUeQsShkTUiMIZajj1
	HuFSN64AdHB0AedhrBdstgyc4AUbLbMC9hoa6dnarFFnKDhJmijNCeQigzm7UNw9LiJKDbO1CqN
	CCGmru/NSitnGQdJmmLUrTRy8EqTlN3lruI5E/PtOkKB5WN5WLRMKxYhXf5tHPnt8PQGAQkrom6
	vpDMZfvDjhO6jeoVSk5UEcNCecW/QhoWqWwmkX5IbKVJI+d07B4b7LT+LGzli2ifH4ej2tMsPBC
	0a/DR3t2ZhubbMKsWt6g7LxujhrHtLER3f49lZ4aOOvx/LmY01L9U07LhaDU9d9XMnaofBOz8Fv
	vfHXc2PApIWg==
X-Received: by 2002:a05:6a21:164a:b0:342:8c38:ec2 with SMTP id adf61e73a8af0-38bed0b2884mr1498192637.1.1768380691048;
        Wed, 14 Jan 2026 00:51:31 -0800 (PST)
Received: from MiniPC.. ([47.246.98.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52fc9bdsm22557474b3a.32.2026.01.14.00.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:51:30 -0800 (PST)
From: weipeng <coderlogicwei@gmail.com>
To: oneukum@suse.com,
	linux-i2c@vger.kernel.org
Cc: anna-maria@linutronix.de,
	coderlogicwei@gmail.com,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
Date: Wed, 14 Jan 2026 16:51:25 +0800
Message-Id: <20260114085125.859740-1-coderlogicwei@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8bed5082-0aef-4dee-8239-c3e8aba50f9f@suse.com>
References: <8bed5082-0aef-4dee-8239-c3e8aba50f9f@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

i2c_del_adapter in i2c-core-base.c:

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

This issue looks like caused by i2c_del_adapter(). It waits for too long so
it may cause the hung.

Thanks,
weipeng

