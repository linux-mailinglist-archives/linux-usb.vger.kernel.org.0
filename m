Return-Path: <linux-usb+bounces-32346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C71D211A8
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 20:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5AB3075176
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 19:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C53D34F498;
	Wed, 14 Jan 2026 19:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhwwjpGQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F30340A49
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 19:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768420254; cv=none; b=UUNJ132p5rxIsmKn93XyrBIBuvWkGa9H76c9Q8zoPDiugbLtMhISRyyth5NrbVkTJGALF5iSFOuojkMCxAWF0+Eg0JNUFTa5P0Ijug1Lwa+lBXcbUDJOS//iOfwTkIcOV/si8Cs9kbEdk8Klwbr/XsP28Cw4MiFvPDxkbCUQ/D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768420254; c=relaxed/simple;
	bh=8mHTtru1b4+yfUATw6MSrif/Y0HQtfh84Kq8c5WhyfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpcsYcGFPg8GnG3DM201O67+KfEMooWGzF1wMFjNhrxFuii7Vy0uwIKnetJJN7pRF0gASoR/fRaAEFw7KkSjnQtSIHqAyKTL4O4b9u/fk8tcYNk6lV4JYCSat7rSgUb51U//5JU5kia3FxnCTXALC1M0QhBys4k5whRfcSTcs0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhwwjpGQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47796a837c7so1345455e9.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 11:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768420251; x=1769025051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=le6gqslkb/pdYWHP941oJWvDw7SCegBBL0bv3Ir0ZSE=;
        b=FhwwjpGQI3pdgkS4Gh1li0gjNu5y6LkxzLFDezH0W0WXvxUO9QPA8gRLfzxqZL1gQ5
         2DTWFUz6+9zy37IRsjvu6D4ZlaScy+p8fokOq/dSuvOeTH6m6OwY4Tg5V/OTy81QQpQb
         V2dd1+H+ZZYGYQeO2AJElJ3RAuVnK7m4txJ54Akj6mNQ1eikE2p3p7apIs1vp28HfmiS
         wmSRakQtovO6FOvKQiW8DNoX3bXkMXvGTG0VACuLZLdvl+3324JxqycDUIOr+CNHF2FB
         hmJropPofHunYgh4Q6aDtGXLK0fYxHkJCzIa7JExQL47OcOk9jGxKcsSAwbdiRPaYzYr
         rrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768420251; x=1769025051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=le6gqslkb/pdYWHP941oJWvDw7SCegBBL0bv3Ir0ZSE=;
        b=No2kxuy3sugp40GY40bpsjcIhs0xbebqrmserz3tYBEBVegbjTP5ya7t9ymrR/HXP4
         7fC5T2Kd52aixMbKGIe+4JYNZ/Ue7WChejjoTGoTDNXEdmD0vFxcs3oH+6N6o5HYh/WQ
         aeMm2saR3UE380N04Nchn9OASZjBffiLBjJNlbwkJdtaOXt91RZMbHSUUGTEI1I/Re/K
         E8eXTtOLOivbl1Pp73hcZFGyg+E1oaWrt+dX2V/HK44+wAztqfvV7JkPK7KFw3cv6nNr
         iRJbFQwY/PLHsTiPzC8LIJFJo+u+d4uidsLQC23knYGAA4TAefEvzchVhA7fx7q4vuTE
         5jwg==
X-Forwarded-Encrypted: i=1; AJvYcCUTw+GCpcyGWcMZvjGRZDU+urz1kK83Sq/BHwFxQzF5UrTQWYe1rgry8h35dgDyDU5IOF6HH0FFUAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIiIE5yWxqxKKfuW03bwffTKzCRCv1ZpUNwT3JhNMwmnLSXK/Q
	TWNPpQgV8VNZAbZxQ1zu3ySfvUULgERz6CLdpHAmOAMoGlrtiCBCdRee
X-Gm-Gg: AY/fxX6TmNBgP1gkneOHTT6gQh/ukWIIOT1Tzex+qa1t4Np1VsJKr86ECL07ngZtrWH
	+ddr0NvBshVrY4i/izFVBJZwEQCMBEDGytr4biLLA9C8EKttynsRmfSKPeJ9DTr3bHgJY9nx2sy
	e1LvR6ANXSlflyYnHc+6E56jr0x5qcJS8EMimh9rZ+LpVCkHjW42hijAQHtTaa3WLg/h9P1ztOj
	JAHJJh1UZt7BEYva8bihbr4cdUNlz/93/pE6GpBkb+mvIq3e2dLMJ9rX90u6WBwPICLZbUrISk/
	Bph6W71a3u0Sr/0X8xyXWWbS/nQsthlQ9FdTYQHNM/PujKLUkSOdx8lp1+LhixXuCVEMUDL91K6
	B2HbFuf/KIMfLcgpRfuZzanFKZiwU7a7myb4h9mSLZW+ywNlUPBUPEz470fsg4n5f3xqC/ybStf
	chXhO9EMpBmEiZ9n1ZthdPX3tDBzNS69ef/I3PEIl+9f48u1fU4VATv+JfKTdWCdGpVxNGOKZDk
	uuBg2eQqmQTeKh7
X-Received: by 2002:a05:600c:3544:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-47ee335494fmr49144015e9.15.1768420250456;
        Wed, 14 Jan 2026 11:50:50 -0800 (PST)
Received: from ?IPV6:2a06:5906:2639:e200:7139:7167:2ab3:2206? ([2a06:5906:2639:e200:7139:7167:2ab3:2206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47fd34d93dasm222835e9.2.2026.01.14.11.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 11:50:50 -0800 (PST)
Message-ID: <e8fac6ba-41fe-4695-bd30-b1e6c3235815@gmail.com>
Date: Wed, 14 Jan 2026 19:50:49 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Address race condition with Device::drvdata()
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, david.m.ertman@intel.com,
 ira.weiny@intel.com, leon@kernel.org, bhelgaas@google.com,
 kwilczynski@kernel.org, wsa+renesas@sang-engineering.com
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20260107103511.570525-1-dakr@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <20260107103511.570525-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/2026 10:34 AM, Danilo Krummrich wrote:
> Currently, the driver's device private data is allocated and initialized
> from driver core code called from bus abstractions after the driver's
> probe() callback returned the corresponding initializer.
> 
> Similarly, the driver's device private data is dropped within the
> remove() callback of bus abstractions after calling the remove()
> callback of the corresponding driver.
> 
> However, commit 6f61a2637abe ("rust: device: introduce
> Device::drvdata()") introduced an accessor for the driver's device
> private data for a Device<Bound>, i.e. a device that is currently bound
> to a driver.
> 
> Obviously, this is in conflict with dropping the driver's device private
> data in remove(), since a device can not be considered to be fully
> unbound after remove() has finished:
> 
> We also have to consider registrations guarded by devres - such as IRQ
> or class device registrations - which are torn down after remove() in
> devres_release_all().
> 
> Thus, it can happen that, for instance, a class device or IRQ callback
> still calls Device::drvdata(), which then runs concurrently to remove()
> (which sets dev->driver_data to NULL and drops the driver's device
> private data), before devres_release_all() started to tear down the
> corresponding registration. This is because devres guarded registrations
> can, as expected, access the corresponding Device<Bound> that defines
> their scope.
> 
> In C it simply is the driver's responsibility to ensure that its device
> private data is freed after e.g. an IRQ registration is unregistered.
> 
> Typically, C drivers achieve this by allocating their device private data
> with e.g. devm_kzalloc() before doing anything else, i.e. before e.g.
> registering an IRQ with devm_request_threaded_irq(), relying on the
> reverse order cleanup of devres [1].
> 
> Technically, we could do something similar in Rust. However, the
> resulting code would be pretty messy:
> 
> In Rust we have to differentiate between allocated but uninitialized
> memory and initialized memory in the type system. Thus, we would need to
> somehow keep track of whether the driver's device private data object
> has been initialized (i.e. probe() was successful and returned a valid
> initializer for this memory) and conditionally call the destructor of
> the corresponding object when it is freed.
> 
> This is because we'd need to allocate and register the memory of the
> driver's device private data *before* it is initialized by the
> initializer returned by the driver's probe() callback, because the
> driver could already register devres guarded registrations within
> probe() outside of the driver's device private data initializer.
> 
> Luckily there is a much simpler solution: Instead of dropping the
> driver's device private data at the end of remove(), we just drop it
> after the device has been fully unbound, i.e. after all devres callbacks
> have been processed.
> 
> For this, we introduce a new post_unbind() callback private to the
> driver-core, i.e. the callback is neither exposed to drivers, nor to bus
> abstractions.
> 
> This way, the driver-core code can simply continue to conditionally
> allocate the memory for the driver's device private data when the
> driver's initializer is returned from probe() - no change needed - and
> drop it when the driver-core code receives the post_unbind() callback.
> 
> --
> 
> Dependency wise we need a common Driver trait that describes the layout of a
> specific driver structure, such as struct pci_driver or struct platform_driver.
> Additional to this specific driver type (which was previously the associated
> type RegType of the RegistrationOps) it provides the offset to the embedded
> struct device_driver and the type of the driver's device private data.
> 
> This patch series contains two additional dependencies:
> 
>    (1) A fix for i2c::Driver::shutdown() to not free the driver's device
>        private data at all, which otherwise causes the exact same bug, and
>        is not necessary in the first place anyways.
> 
>    (2) Add the auxiliary::Driver::unbind() callback. Strictly speaking,
>        this is not a dependency, but without this patch the main fix of this
>        series leaves the remove() callback of the auxiliary bus
>        abstraction with either dead code or quite some code removed;
>        code that we would otherwise add back immediately afterwards.
> 
> --
> 
> [1] In fact, the cleanup ordering of devres is a separate challenge in
>      Rust, since it is technically unsound to rely on the driver to pick
>      the correct order. I am already working on a solution for this;
>      luckily this also has some synergies with optimizing the required
>      synchronize_rcu() calls required by the Rust Devres container
>      structure down to exactly one per driver unbind.
> 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=driver/post_unbind
> 
> Danilo Krummrich (6):
>    rust: i2c: do not drop device private data on shutdown()
>    rust: auxiliary: add Driver::unbind() callback
>    rust: driver: introduce a common Driver trait
>    rust: driver: add DEVICE_DRIVER_OFFSET to the Driver trait
>    rust: driver: add DriverData type to the generic Driver trait
>    rust: driver: drop device private data post unbind
> 
>   drivers/base/dd.c             |  4 ++
>   include/linux/device/driver.h | 11 +++++
>   rust/kernel/auxiliary.rs      | 41 +++++++++++++----
>   rust/kernel/device.rs         | 20 ++++----
>   rust/kernel/driver.rs         | 86 ++++++++++++++++++++++++++++-------
>   rust/kernel/i2c.rs            | 31 ++++++++-----
>   rust/kernel/pci.rs            | 27 +++++++----
>   rust/kernel/platform.rs       | 27 +++++++----
>   rust/kernel/usb.rs            | 27 +++++++----
>   9 files changed, 203 insertions(+), 71 deletions(-)
> 
> 
> base-commit: 8510ef5e3cfbd7d59a16845f85cd0194a8689761

For the I2C parts: Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>

Thanks
Igor


