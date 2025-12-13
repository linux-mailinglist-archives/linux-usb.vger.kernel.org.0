Return-Path: <linux-usb+bounces-31428-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE052CBB465
	for <lists+linux-usb@lfdr.de>; Sat, 13 Dec 2025 23:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42EC7300B836
	for <lists+linux-usb@lfdr.de>; Sat, 13 Dec 2025 22:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C402E6CA8;
	Sat, 13 Dec 2025 22:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhK7UJtS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C819A2080C1
	for <linux-usb@vger.kernel.org>; Sat, 13 Dec 2025 22:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765664066; cv=none; b=F7B4BS3cct16LriGTpPhNqjyE96aXSCdhp5HOv3eJM2GobgnH1DmUwCbUoOCwiKQwayZ5UtSrkXvCHwXyWgNCi+EQeUGVn7zkmFRzdzWudUCtCt1wDHkKelQohVZmVidV7A/I51CFuArMOxCKJjbTdZ6MZDoq606tFKnFjGaMnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765664066; c=relaxed/simple;
	bh=IrulDzi57n/yaskwyEHjfwEfdSp5VnPWem36VPxkOOU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cF8FVI2V27JUaICRD5gAE9ZnsIWl43bQWH+C5CpozNmcu6AKtJH5VSbk3fxowNI7niSPNLHc9hH30N9+t73l6ICSs8/i8SLwB8mh0ofQOVl4My2/fYgXmT+sajUgUJYcNDivD55JVRmWe70HJSuo4EVri516t02dBOFRI7QmcvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhK7UJtS; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47774d3536dso22597745e9.0
        for <linux-usb@vger.kernel.org>; Sat, 13 Dec 2025 14:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765664063; x=1766268863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giGcT3Fgg+GDU3z63heonDhCKMawwzdbyDK3O3Qf/K8=;
        b=VhK7UJtSjFAhyFSRMxcleel1EWzAxSqHYp0edvhxGLRT3+8qBSx253kGaoUCJ4ZS2D
         I7/i72c+BVPSxlx517Brx09xZgu6rrwrCfue4A2VLAy6GY9B/8Oo5wb5IqzLDzVlwzxh
         W9CwXgaB3NVlP7jG9zny+Re5DtY03U8ZKhT/kAU9qLiuJcvfZAAQjJaZ96tXTGVXwySl
         u+HarJSO1DFMhyM3SFSY3EYkH8nKJDKTBQn4TGddPPUn70ijH45B915g3fGvuzCuiCwO
         eb/XItKm5+vWUfGV7p6xtqowfNwqTeba9tGubdkVgsH45JIJL3WeQSOkzZ6buy/XF6vA
         GuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765664063; x=1766268863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=giGcT3Fgg+GDU3z63heonDhCKMawwzdbyDK3O3Qf/K8=;
        b=HmxWPvAa6szqgvCrr+v7muVIcRbcn0gn7n3E7GR7nH1Xgw1ds52k+dTUP9zzJQK4w8
         X8yuuQUjorgKuXyeyJ+ZqUZ1H6PqLn3amv3brYAwgP8xCXbP0GJ6V8ivhi6AULnxwsGV
         XE3Y+g+zTFrwX1abnMgi9Wpd6H+NIzAj588Ec9cNsGz1XOYTBjRXLV2NJdYgOXhhRc3W
         6xGaURHeAMCFVHznTHPxXvvjIXFRx4amue/F2yAmitDGI98HKe9COt4kxUxP+I6MDk5F
         i9HwP3fOvuSAS3SYO02BDE+EUTiByQk7B+oC5K99HR3ugxNz6wz0IamluoTHZbt0/aMC
         l/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWfmoTcMUBxXfVLUIwSSarqe2NbDzF6OZaOx5xlONfnBsihR4yavgJJUOvyF1VeQmmZq5ri6ekhfX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPOO1CGE43tj3Mko3SNmwr3ZlAg3p9sTpvO+SmbedZh72RVMV6
	1wMBbyXiV7qT1TmsoAwJyxCsYChKjg+19GTkhlHA82DUgyMzO9rdK60h
X-Gm-Gg: AY/fxX667Nqedx/dZ8dW3Hplvx8MhPctl7Hnr3j8sGTVcEz9lH0oAqiEvv2WkiF2GW4
	Q7n6NoonNqaKI8aSNLrcW5ciTuM7QebFEwISQC83KHllnzrtLtEuoJMVy6wr58Wd5BW/lP5/tAz
	0G/DL/9s411AqGdn8fD/Q7vStU4OhCshyRXLUGnVlK4qAn3+q/KHXQNys2d558k0GX5RJeJKrrL
	TXfg5TTx9gj+M6fpUTEUSlnYJg55hfoEganjdIHs+BuGFl4FTG4tpKE0BYfxJhrORvyq6m6oPw8
	aZkSFWpE8YXfo3Iv7CwPUYDwbz2Ga5QsiLm9RADz9NNlfAxgpsxkDY0n2NGZ6C6L+RKe3qpNFbu
	FYcVgYw+QHe4SNn2c9lQuOvkOOhiDAE9EILryERIkXVCwZL+mrXXmSCmMqvNtwyl6SbMTq7vlaF
	/N6YErbATaHOz1g1IK46tT9tCq795cv8LDQZ3Vj5SCIq4iBc4jXgPNyROfOeFk/EQ=
X-Google-Smtp-Source: AGHT+IGlrJtrpuVRtNu5xu7PjaZA4tl0Mfc0rjvZxILWh7EkMUMhN8Y0w5oS1WFrdUcu1OL6FpZg3w==
X-Received: by 2002:a05:600c:c101:b0:477:7588:c8cc with SMTP id 5b1f17b1804b1-47a89da461emr86627115e9.7.1765664062970;
        Sat, 13 Dec 2025 14:14:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f6f13bbsm38091375e9.10.2025.12.13.14.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 14:14:22 -0800 (PST)
Date: Sat, 13 Dec 2025 22:14:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Geert Uytterhoeven
 <geert+renesas@glider.be>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Luo Jie <quic_luoj@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v2 02/16] thunderbolt: Don't pass a bitfield to
 FIELD_GET
Message-ID: <20251213221420.10901610@pumpkin>
In-Reply-To: <20251213100136.3d83a236@pumpkin>
References: <20251212193721.740055-1-david.laight.linux@gmail.com>
	<20251212193721.740055-3-david.laight.linux@gmail.com>
	<aTzPT2kAt96ypGU-@yury>
	<20251213100136.3d83a236@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 13 Dec 2025 10:01:36 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Fri, 12 Dec 2025 21:28:31 -0500
> Yury Norov <yury.norov@gmail.com> wrote:
> 
> > On Fri, Dec 12, 2025 at 07:37:07PM +0000, david.laight.linux@gmail.com wrote:  
> > > From: David Laight <david.laight.linux@gmail.com>
> > > 
> > > None of sizeof(), typeof() or __auto_type can be used with bitfields
> > > which makes it difficult to assign a #define parameter to a local
> > > without promoting char and short to int.
> > > 
> > > Change:
> > > 	u32 thunderbolt_version:8;
> > > to the equivalent:
> > > 	u8 thunderbolt_version;
> > > (and the other three bytes of 'DWORD 4' to match).
> > > 
> > > This is necessary so that FIELD_GET can use sizeof() to verify 'reg'.
> > > 
> > > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > > ---
> > > 
> > > Changes for v2:
> > > - Change structure definition instead of call to FIELD_GET().
> > > 
> > > FIELD_GET currently uses _Generic() which behaves differently for
> > > gcc and clang (I suspect both are wrong!).
> > > gcc treats 'u32 foo:8' as 'u8', but will take the 'default' for other
> > > widths (which will generate an error in FIED_GET().
> > > clang treats 'u32 foo:n' as 'u32'.    
> > 
> > FIELD_GET() works just well with bitfields, and whatever you do breaks
> > it. I pointed that in v1, but instead of fixing it, you do really well
> > hiding the problem.  
> 
> It doesn't, pass 'u32 foo:6' when using gcc.

I've been trying to look up how _Generic() should behave for bitfields.
Basically it doesn't seem to be specified in the C standard.
Pretty much all you can do is force an integer promotion - and that only
works if the size is <= 32.
(I really hope there aren't any bigger bitfields lurking...)
But FIELD_GET() wants to check that 'reg' is 'big enough' to hold 'mask'.
An integer promotion breaks that for char/short.

I did try erroring on statically_true(mask > reg), but that throws up
a lot of false positives (even for non-constant 'reg').
It really is amazing that you get FIELD_GET(GENMASK(7, 0), val) instead
of 'val & 0xff' (and I don't mean code that want the low 8 bits of some
device register that is made up of lots of fields).

FIELD_PREP() does support bitfields (for 'val'), they get an integer
promotion applied.

There seems to be exactly one instance of 'reg' being a bitfield,
bloating all the other expansions for a trivially changeable line of
code is just stupid.

	David

> 
> 	David
> 
> > 
> > I see no reasons to hack a random victim because of your rework. So
> > NAK for this. 
> > 
> > In v3, please add an explicit test to make sure that bitfields are not
> > broken with new implementation.
> > 
> > Thanks,
> > Yury  
> 


