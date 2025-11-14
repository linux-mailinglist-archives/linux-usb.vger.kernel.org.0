Return-Path: <linux-usb+bounces-30524-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3D7C5ED2A
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 19:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C65635D811
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 18:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD13D2D7DFB;
	Fri, 14 Nov 2025 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Du3z/o8u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877BF2D9780
	for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763143875; cv=none; b=qWM+5oPTiuvtlPr7fU96+2mPWzTb9jj5EL83m0r8EC1NAc2wtaBYt32tQUZlWUpBKl9RcySYz/sRV24VbNpad4LdSEOqV9Yxhcb7pndW4Kz+5R7XWt5S/yAL4Sc+09jfTaM0qGJlrOGVMQOsnnIfH4W7j/yvv6C/FteexnVWYbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763143875; c=relaxed/simple;
	bh=I6uxdokBRZqnPdGd9S7cHGda8JgKJBbwYuhyaVd0qoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2UA4KSuAyCl42ufgvHpwCwPZjBEJu/Wb24WtcuLI1UbQG8OSdejsMNOoVxq3h1HjnoCoZIkaR2N0VaBIXoxz1fHnfnA1W2NiMIjf50IFo3D2Wvj97zRxMDLZGWKm+EAi6mLSJVPwoXrkU7bjQgTVHtQqNYe43Fs1/1mUJ85Eo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Du3z/o8u; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88244d1559eso29541186d6.0
        for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 10:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763143872; x=1763748672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3VtcXesZLIerHs3waFi+zXYT/H/QCATlIs75FvgnJ2s=;
        b=Du3z/o8uswBu5w5dvUTD2+m3IFVVlS6Z+GxbOH2jO8zLCSeSKDuiDdfyzcv97YAwZL
         baC0HVdNMUSgcKsJhwx9bmC/GsP+DV2BLPUYCso1hKEt3AXirr+sX6CmWkNGtIVGZ+ut
         QAKjYP2QXEkCOuaj3RJX5Y3EBW++c5zP9AFbUfk+lMud6fi0TromaSDquX2lusJ7DAMX
         L1dBtqx7he+QmK0FvKA/UkeM9seByi4jO+Y4dkHUIBhpYaXYYbWT/dREB9/bHV2StYbl
         ML1SW7vvwCSH7MkPXJA/bfbMaDV+NtCMMCffRIvlHOPFyCKs+6cWo2Tu7b0i5WmHh2Mb
         Fp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763143872; x=1763748672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VtcXesZLIerHs3waFi+zXYT/H/QCATlIs75FvgnJ2s=;
        b=szuxt1YcFOAGKty8TItEDpa1aY7My9Wyml8DZtXNjgECJIuOKVoo2iOhobVf0ccvxt
         MF5AzKHIDVfoJKbcGKJBqvP43NRKav+/yVhLhFXMm0WJA0XOuGHQ57Rj9YkzdXNRury7
         gsdrW/0Kn5hoy8HW7z4EHS+ZwciWOzxM5jlQ+ZikS/6zq/H/llcN1Gl/FlpZcQeUDqVT
         D2dpzfItQkGKrpKJgScXCBs5jmkMOhhBD6GLRtucUh7QszhwSAondUFPy+O5bCHw5lTH
         DKGy/0ZeAJlMs3izDTiXPzxeqxAOLAg5Uj6wOuLNyfL1MwWTPBHuo/2cWyfdfY+OdD1N
         Mz4w==
X-Forwarded-Encrypted: i=1; AJvYcCVTg3ykoTEjWDavKQUl4QyTmt0OT2SgGeI67bjEU5YQ9DIAWkKbiX6R4bK5p4qk8o9mJHPHMuOnDMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgigD9INW0K4EPl2Hch425T3f5g3eBo70SHpUjDlepCVflOz4Z
	DCzEpxW91iDaCwE9OUTQw9utOmOsv0MCtBerby9HyY69jN+2/H8tDlfq
X-Gm-Gg: ASbGncvkwROREiHHAx/WuwWeB1ac9GzFbU3rrv0PsAX7hyCbVSL10l1c2A/yWF9Qn8v
	h0N6ocoslMYEjOfJZJpNdUx7Euy4wBejEByLV3Y8m28xs4k0E9iPIAZScnGguMYsuQYE6D+3DhJ
	UZYly+INDrZ70zUiIOna3WcfQ6Mrb7V0MgBbYXdNTAaHO1saUB+I2FkT+a/EK1VVFMyas+louqM
	olf1+KH21Wb6vsELWuP7eAWsShVk0g8+KGNLrkn79LIQbkcGCgT1ib0F5lY7ABRXNzI0g3Utb7/
	ZemJmbHuynET7lvsR4S6xRMu67EZj79jSqcFHheSN4A3c/yVGEZEdfokfTw3cTuvNg3PohumJFr
	bNCr6MiWvR5oBDiwdGbF8FZm14p9hKYU7k8LP/aqeg8s7wsyCrZ7dinfwbGVL6jYZ17aNB0NnTM
	Fc3WNOvScQRj0HhbB87Q==
X-Google-Smtp-Source: AGHT+IE86ItAnX1GO77Gd7Z1zaNg0qBIgEZl8jVRGlUImq9KAVIezvoDT3ilB2coFhcaqIZi1tjszw==
X-Received: by 2002:a05:6214:1256:b0:882:4488:497 with SMTP id 6a1803df08f44-88281967ebcmr100093496d6.34.1763143871784;
        Fri, 14 Nov 2025 10:11:11 -0800 (PST)
Received: from rpthibeault-XPS-13-9305 ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828613962esm35670476d6.0.2025.11.14.10.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:11:11 -0800 (PST)
Date: Fri, 14 Nov 2025 13:11:09 -0500
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: Oliver Neukum <oliver@neukum.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	linux-bluetooth@vger.kernel.org,
	Sachin Kamat <sachin.kamat@linaro.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: issue with devm_ methods in disconnect and freeing memory in
 btusb
Message-ID: <aRdwvZdbCEap6vuP@rpthibeault-XPS-13-9305>
References: <aee37797-a280-47ea-91ac-487ddc124ac7@neukum.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aee37797-a280-47ea-91ac-487ddc124ac7@neukum.org>

On Fri, Nov 14, 2025 at 09:03:45AM +0100, Oliver Neukum wrote:
> Hi,
> 
> looking at the change to btusb_disconnect() in 23d22f2f7176
> and the discussion leading to it I have doubts. Let me quote the change log:
> 
> -- quote --
> 
> Syzbot opens a usb device with out of order interface descriptors:
> Interface 3 (ISOC) in position 0, Interface 2 (DIAG) in position 1,
> Interface 1 (INTF) in position 2.
> So, ISOC is the first interface to get disconnected by usb_disconnect()
> -> usb_disable_device() -> ... -> btusb_disconnect().
> 
> I don't think this is a problem on hardware, where the bInterfaceNumber
> matches the position in the dev->actconfig->interface list; and in
> btusb_disconnect() it would only ever go into the first if
> statement: "if (intf == data->intf)" and not into any of the others.
> 
> -- quote --
> 
> Now, we cannot do this. The order disconnect() is called is arbitrary
> 
> 1. The order syzbot used is valid according to spec, albeit unusual
> 2. disconnect() can be triggered from user space via sysfs
> 
> We must always be ready to handle any arbitrary order.
> The code in the second branch of the if statement used to be perfectly correct.
> The actual breaking commit was 98921dbd00c4e by introducing devm_kzalloc()
> for memory allocation. That ties the lifetime of memory to the binding
> of a driver to an interface. In hindsight in a driver that binds
> to multiple interfaces, this is problematic. Hence I would propose
> to just revert 98921dbd00c4e. It seems to me that we have discovered
> a design limitation in the devm_ methods. What do you think?
> 
> 	Regards
> 		Oliver
> 

Hi Oliver,

I was under the impression that tying the memory lifetime to the INTF
interface was intentional since 98921dbd00c4e was from 2012, hence my
commit message in 23d22f2f7176:

-- quote --

There is a KASAN: slab-use-after-free read in btusb_disconnect().
Calling "usb_driver_release_interface(&btusb_driver, data->intf)" will
free the btusb data associated with the interface. The same data is
then used later in the function, hence the UAF.

Fix by moving the accesses to btusb data to before the data is free'd.

-- quote --

However, it seems that support for other interfaces was added
later, e.g. by 9d08f50401ac7, and out-of-band wakeup support even later
by fd913ef7ce619.

So, maybe it just wasn't considered?

The actual code changes in the patch itself shouldn't cause issues
unless calling device_init_wakeup() and gpiod_put() must actually be
done after releasing the interfaces. Which isn't immediately obvious
especially if tying the memory lifetime to INTF is intentional, where
calling them after leads to the UAF.

I've tested reverting 98921dbd00c4e locally, and it seems fine. I'll
send a new patch if the maintainers agree.

Raphael

