Return-Path: <linux-usb+bounces-30522-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A50CC5E1D5
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 17:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 733F84ECF95
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 15:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E306340A67;
	Fri, 14 Nov 2025 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="h9DFs4jn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D5333F8CC
	for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 15:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763134429; cv=none; b=H0hOWB5CMB34w015nDFIgdqKtrhDsT+13AzejhIlcam2j8km3Sr2Bock8CRjFL4O5VQidvmjlPOwLLVkDx/k0cOwvvhMVWB/uIZ6dINA8yqXPNfbQCW7mI20GVCMvgz8ZCVhwN9WZof2uP6BX3ITlKIopmzcP01SIg2Bd9HjoYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763134429; c=relaxed/simple;
	bh=ilhlp9rFrxZhGXHKshrWIfcqQf/ksy4FmU0Hte7e14c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EV0r5xePRtPETBRHTDovNL40CfGZC1nCHi/grUYQLejiIRUQES0CIENbavUVzQMCiIiTuss45HjGocW0LZlo7nwdQZphyr/cku5V9Jui3lkC+LChmTGvrFF3M19aiq/gB/uALZPGdTmZjQVJdu7SpM45iiUWn4HhrSmSc/29XFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=h9DFs4jn; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4edb029249aso17667431cf.2
        for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 07:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763134427; x=1763739227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cltf9foH7wOTNjVjNTJlhY7XR2KMjkOrmjly/G7r4W8=;
        b=h9DFs4jnmiEtRaz+6f4WnzafAE3ezujnpumMMGFzGzJT0RyBa3UgcHsB5d31ivBz5o
         pi3jeQy1fqe8XXPlwKRojxgMR/uurpnbsxwaVVYgsJEb309uGAjcrUlq4ioogVN27jlY
         V1L3qnhHOlnTk163K843Lk16XdsCiIx82awbZBRWr6Gk/reCfXYPoU7aZre9RfAGal2y
         tl5ms+s+wPkqcX8HGbUO+Xt9c1h7KERAI5VgenCpBjH5Nq5G2pi02tkpJOrxNjpuW9mD
         ZXJ8lAH37Z+tfN4dP+xwE5LtW41UimQcP7c7KP4g0qVrgRaI7SYvsm2OdiLOw8AOh8gK
         HCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763134427; x=1763739227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cltf9foH7wOTNjVjNTJlhY7XR2KMjkOrmjly/G7r4W8=;
        b=P4f622rO8km8MohTU5YRz86OvBR5i/0uPrM0G8ubhP80b50fhkA+hkEFStrojHTs2c
         8MUA0Hah3/9GT5p8A6n9/j4QCRdlSBWqyS/swpoOqhGq5UkLvnytlFs4davyQinlghd0
         gO322uSu97l0yo4YOLzeQefOlGsUb6WImpMvp/lxfOv9V0P8VOObTwKTxMTZRXjuJE/t
         1l1ePf1IwMAztxTsKwniJBso2LQuoySNZSHcdghxcph3gHUPJgXFqVehiciK7q199VBL
         xdyJ8h237yfKd7SdcybssMR2IJz7vYItTwTOUZKIUJFerDK76ZX1GO1twnYK+8E5exnM
         Oy2w==
X-Forwarded-Encrypted: i=1; AJvYcCXEKHloMbCqAcw7IJRM+x8jVb32bdpj26XvtMvUO0z4mHzIM/UWTqF2ridxqD0q/aW9MOYh3wfbBv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlxt7zvp3aHx+HQVzPwPL+hAhxcLod9P940p4N325B7UmojnNv
	t45JaR61U83Uecm/rKPZBfqwBWvX5fOQmvsxfBSdXjkzC6qz1j6QuuOj0x9NvtKisQ==
X-Gm-Gg: ASbGnctbt448oixT3KxZoxSd6mudfq+NfK0+GE1bEB2sekBU2F3SHbs76DiqRCHNH0S
	U3n+nUOSPN62Bw8TtPHiz1x0O5NBw/fBcjgkFvIow6xnYj3ABKyCiC6Cn60IPsYHldl2dI9+WCV
	S/ZymB6guSwTt3HVSg4fVV/nfT8uaTrmz2SuTDqbX0hmIHC22E8dwqfQN/FXZgcK2zMiVTA7gj5
	3O97trLBudI6lte44/5Xlw9EVC0Bzq/GmT4tkmNs1/GrdvbH7yqgQRFrsVeWP1Y/YNjCDb1B702
	LwH1SuQIiBdL1slGOJQCZi+K0KbTKlv3L4rXu04MMlaefT3iQ7Kn1K7BotsAxCGe9VzabSR/AYI
	jXOwTlA4U0l3MaLr0w+aCiKTSJ5WbyNF5TI8SdpCyxv8NesfJAJrfQDCjtoRQs6vVtdBVO8cY3P
	LCfQ==
X-Google-Smtp-Source: AGHT+IET+BblS9+VAQ5xrANcwslgNyvra5gdLrulD4qtuZZ3MgiyTbSF9eYid5FOR/RDUPJA4Lf2wg==
X-Received: by 2002:ac8:7d94:0:b0:4ed:e337:2e52 with SMTP id d75a77b69052e-4edf20569bfmr65044771cf.30.1763134427102;
        Fri, 14 Nov 2025 07:33:47 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88286558347sm32688446d6.40.2025.11.14.07.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 07:33:46 -0800 (PST)
Date: Fri, 14 Nov 2025 10:33:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jimmy Hu <hhhuuu@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Kuen-Han Tsai <khtsai@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Roy Luo <royluo@google.com>, Robert Baldyga <r.baldyga@samsung.com>,
	Felipe Balbi <balbi@ti.com>, linux-kernel@vger.kernel.org,
	badhri@google.com
Subject: Re: [PATCH] usb: gadget: udc: Fix permanent block caused by
 'deactivated' flag
Message-ID: <88731999-35e0-4717-b5d0-9ebed9baf814@rowland.harvard.edu>
References: <20251114080841.829128-1-hhhuuu@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114080841.829128-1-hhhuuu@google.com>

On Fri, Nov 14, 2025 at 04:08:41PM +0800, Jimmy Hu wrote:
> When setting a new USB configuration, some functions (e.g., UVC) can
> call usb_function_deactivate() to set the `gadget->deactivated` flag
> to `true`, intentionally blocking enumeration until a userspace
> daemon (e.g., UVC service) is ready.
> 
> This `deactivated=true` state becomes a permanent block if this flag
> is not cleared by usb_function_activate() (e.g., UVC service failure
> or config set while unplugged). This blocked state persists even if
> the cable is plugged/unplugged, as the vbus_event_work() handler is
> still blocked by the `gadget->deactivated` flag, preventing pullup()
> from being called.
> 
> This patch fixes this by modifying vbus_event_work() to clear the
> `gadget->deactivated` flag *before* usb_udc_connect_control_locked().
> This breaks the permanent block, so pullup() can now be called.

I do not believe this is the right approach.  It will fail in situations 
where the cable is plugged in and then unplugged before the function 
driver is ready -- the deactivated flag will be cleared while the driver 
still is not ready.

The proper fix is to make sure that the situation never arises.  In 
other words, if the ucv driver calls usb_function_deactivate() then it 
must guarantee that it will call usb_function_activate() at an 
appropriate time later.

Another approach would be for the composite driver to keep track of 
which function drivers have called usb_function_deactivate(), and have 
it automatically clear the deactivated flag once those drivers are all 
unbound.  But this wouldn't be necessary if the function drivers all 
behaved properly.

Alan Stern

