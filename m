Return-Path: <linux-usb+bounces-14237-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DAB9629D7
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 16:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 213DFB21087
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 14:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EA919D8A4;
	Wed, 28 Aug 2024 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CUzv/ywR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FE21898EC
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724854151; cv=none; b=eC1gXKR5dsWqEESHo6L+JQXnozOAPRC/l2swf1eMgCzdtYHLW6V9iABQUcWOohyKcV+dsJHruzmKbXgRPTHRmrkF5KsqDwrnpyiqLvNZNySENUuQ1WwCkwkps0DifxG6LCTV/pc1rmqDqVHmdfQiWuw3CTLigt23/jnTgL3/5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724854151; c=relaxed/simple;
	bh=WOdOnpf7m/iwndrnl7sIbQvn+os3jPlTjOyRoQ4Q6jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ul32fxG98es8As0NXhyuGAKVGBQp9lRGTa5fPgcs6SlRNVO2ot6fXvabhKkMV97Z5kpjF140saOejel6hIZ8ka2qlfUQv/Ad6ECXBcAx748if+Ezk/60yzTsra87YIDIt5EAheDvfD84vEtQduqgxjIR6A7RwuFqXx1vTUmMmYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CUzv/ywR; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-44ff7cc5432so50336221cf.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 07:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724854149; x=1725458949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u51CBonYU1HgV7ECF8ZgNqcs2WU2uO/eXvnpaymgIKE=;
        b=CUzv/ywRVV/Srbj8H3p8BBOMEB1XuBn4/cQAwPcuYgoJrqSY2r3tvPNG73dvJz+aoQ
         zUobCh2qLBEHDeP3DE8uufWSU6ysSY1qaBnYqTNAAoE1Gtp/AqsPpVrYwmfxlWxC+8Ei
         easYttNPLc9waD2SaVyFEMgbTVhjSigGVicnndlp3e7wr8obqBXu9ToqQctwSHDF3CHW
         iyiBcoag195jXKKkdYd3ogJQW2DOMDzu05egs2r008kbt5RGwUn7wcRpYD6mregOl4wd
         a+Naec3HvscSNgMX44ZD2SMxZl3IEmmS78RLXh4Kns86B569tU5CHEHc2dk0apNRUK9o
         i+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724854149; x=1725458949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u51CBonYU1HgV7ECF8ZgNqcs2WU2uO/eXvnpaymgIKE=;
        b=GzxA4847EuVg+HQV+DQCfg3GO+tVHUgHFRKWgDjO0oGjET9KuGNhEyJRaJlww1WjHC
         xWuMrXe+/iAHCjlS2V8i2CART6oTXys8HVQXJHlQcZy8QXfE+vdYCjjE/lnOVH9CyJ0p
         GeLbzb2tGT7qtw/IYUYsvySmjUeK1coW+ESQMUhA5D0p+6JxQQJVcsp2zv3npuCqnUYp
         BTKMohsspd/264AqymI9MElnYaQV1DHINF/HuuVYAq98ygj8EYMIUamKJesKE0mXpboi
         Lbnbv+OIZtmRw9nDjaKBHSU8M5prUDpeHOz2Wn6/Y7E5ckT/nZBQJCidmpXUrXDfZTwX
         n9uA==
X-Forwarded-Encrypted: i=1; AJvYcCU3152A7e7y14ak120xH9iBnnonHnXvSBwGEqqJqihpulXEdT28856mYsyJimAtuqSB3TQGfzQLkg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvHLrJgZmMVF3ZgQpec8YcM7R/oOVnHOVLe9wsYCZg3ROAZdH/
	fgFIWoQjM3MgJRFrA6d2cSQtUCYlsLB7cuhkL8w9vfJ3t2i0XE6kxS6Kv64Sew==
X-Google-Smtp-Source: AGHT+IFrGWnak+LjBNGL5be7F92I5fR40nlo/FF00dBfj1K7nJe1j7v7tWbAhF7k+CtaOeNqLzJ2wg==
X-Received: by 2002:a05:622a:1145:b0:453:5efa:74b8 with SMTP id d75a77b69052e-45509d367famr195767741cf.40.1724854148892;
        Wed, 28 Aug 2024 07:09:08 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-9.wrls-client.fas.harvard.edu. [140.247.12.9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-454fdfc0475sm62676241cf.8.2024.08.28.07.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 07:09:08 -0700 (PDT)
Date: Wed, 28 Aug 2024 10:09:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>, superm1@kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	mika.westerberg@linux.intel.com
Subject: Re: [PATCH 2/2] xhci: pci: Put XHCI controllers into D3hot at
 shutdown
Message-ID: <bb7bba27-ddb2-4c64-8a6b-3ce4e635320e@rowland.harvard.edu>
References: <20240712185418.937087-1-superm1@kernel.org>
 <20240712185418.937087-3-superm1@kernel.org>
 <20240827063206.GA879539@nchen-desktop>
 <4db33660-2720-471d-a017-1fca4c9b7268@amd.com>
 <20240828071303.GA921051@nchen-desktop>
 <bd380d71-4ebe-4889-9ed8-aeefec2b2b0e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd380d71-4ebe-4889-9ed8-aeefec2b2b0e@linux.intel.com>

On Wed, Aug 28, 2024 at 05:02:10PM +0300, Mathias Nyman wrote:
> > > > Hi Mario & Mathias,
> > > > 
> > > > According to xHCI spec v1.2: A.1.2 Power State Definitions:
> > > > 
> > > > 	Software shall place each downstream USB port with power
> > > > 	enabled into the Suspend or Disabled state before it
> > > > 	attempts to move the xHC out of the D0 power state.
> > > > 
> > > > But I have not found any USB core code does it, do you have any ideas
> > > > about it?
> > > > 
> > > > We have added the similar codes at non-PCI USB platform, but met above
> > > > concerns. In fact, we met kernel dump that the thread usb-storage try
> > > > to access the port status when the platform xHCI code has already put
> > > > the controller to D3.
> > > > 
> > > > Best regards,
> > > > Peter
> > > > 
> > > > 
> > > 
> > > This is pretty tangential to my patch.  But FWIW in case you missed we're
> > > going to discard this patch in favor of another approach in PCI core.
> > > 
> > > Regarding your point though If I'm not mistaken this should be handled by
> > > the Linux parent/child device model.  Each of the ports should be children
> > > of the hub they're connected to and the hub a child of the controller.  So
> > > when doing any actions that start runtime PM on the host controller the
> > > children need to first be in runtime PM.
> > > 
> > 
> > It seems there is no runtime PM suspend for xhci and USB core at
> > .shutdown currently. Alan & Mathias, please correct me if I was wrong.
> > 
> 
> I think you are right.  At shutdown we only halt the xHC.
> We don't force ports to suspend or disable state.
> We only put some selected xHC to D3
> 
> USB 2 ports might suspend themselves if there is no activity.
> 
> Doesn't seem like usb core hcd code, or hub driver does anything either.

That's right.  Host controller drivers are supposed to handle shutdown 
operations by themselves.  The USB core doesn't do anything.

Alan Stern

