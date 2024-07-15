Return-Path: <linux-usb+bounces-12229-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D669319C2
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 19:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B110DB2242D
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 17:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E8350284;
	Mon, 15 Jul 2024 17:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SEaZWoBD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F761E50F
	for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721065523; cv=none; b=celK7agjlQPTw/XeiilLmfMLagsWcWqQOThBb4JqnXUv1rX7ePmSpfmltopcw5aiJ3vrzx+pVF4A5/l0m5Eo/L+zq4Zk2hIYlQzwWEW+xy4N1co2aWB81BJgEZh4j/vWdh4bFGnRjlW0bO+RFPcOBsL1B2t5k6AVbQPptXeyzx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721065523; c=relaxed/simple;
	bh=nOBlQgtAlgDItpnQdVd3V9sx/2XgibT5pIhRqxVWGsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuMDvfxiZgrpdKrzy7aiuplyPESyEA30wm4YpNXNvaq9RugdFWNZnX/F1yR5P1s+dYSJuibBWZ4k0XPC8RRYfIncFK6PpD9Of32FAD74eZbvxTao4oX1iN5Etj1mBwgXCgfCI1Kyu6d+Fr/Ex3QG4qPcr1HbGvGg79gswirYRXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SEaZWoBD; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-64b0d45a7aaso47425447b3.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 10:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1721065520; x=1721670320; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pWgMzMoGC1SSc45C4tLbWtle5jcf5t5Lok5AlzYR2Cw=;
        b=SEaZWoBDGhDDaUey9kwLxQ69CAObEkoZ8t4+w7xAu3DYK14wwlrClR6UpAsCAfUTrd
         sIky0eiZxW34l/VvLrm/4kaYVwA6wXwyhvqGoZx9QpuFCMkGRGwCJZlXl0koe5XhLwZQ
         NizB2HEOahduK3rnSu0I9yaXxuxNaCEHUXyk1x7Amkk406wgt0mSezqZxvCAI81xdSRq
         O+eNTXAjx0zFvuxhmpK7wEEZlmjFmNvVSqfY3AUVsB2aH1LMAWegJEExXkJ1IfhYFv6F
         Av4muanh+vNpNPuVHjnolSHhuUdz6/TIlsIK08rLDcL1MOxccaZqBV+7HIwBKP4WchtP
         f5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721065520; x=1721670320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWgMzMoGC1SSc45C4tLbWtle5jcf5t5Lok5AlzYR2Cw=;
        b=JJK6vb2W8U1rDwZX/qVNxZ4YrAhvbzGV28q3r0oIWO4qpoHyC+u7CcH4nNsDDRNFCA
         I10zfLCIFBALNL4LIxUoOurdyMURsic5zUywCKV6v1R1eALZAJoK5L7kPEoHkP6j3zF0
         0vyygFWWWRqV4f4YhLDa3PVeZjEI5v+fKPDkdFi1OZZY5GVVhrlWUiAH/ej/6WIOMjid
         KPq/adpHCj4UvPd2KPPEO5b+olXKOoQxXf4yUShwu7yhxAefVFpuZy7nR0QjrCig+bM8
         G8iE3lwEy0PiOa45+S8W/tHmLh305USrgIpdrUvYmaei1kj6yNocZ6zsEzu8IUtmcboQ
         XVsg==
X-Forwarded-Encrypted: i=1; AJvYcCUF0FgnBMvndQ60KBpjXRXNaIa/6hYaNNjFqVyz9eKbVrNWn1KXYm0Cg+mSz6BExKA8VdsZYfa0ZFmVByMVKN8DAhfXsZR26WM+
X-Gm-Message-State: AOJu0YzLG0OK6YEFp18g2w9izuHsdFikkU9g+bde44cmERjWPNxidQa7
	CL5bYCKtNB+PbZtJlB90eoIpSLYbIrLurdXltqfxhq3pD9OK4qzB6MkNfAY5GQ==
X-Google-Smtp-Source: AGHT+IGFlOEMQ5tIm5XeOu3THOlXOegaoO1kOuZJB7JlT87gjw2PQQxIn2cFTdcE4EK4n8OvQQs/VQ==
X-Received: by 2002:a81:8646:0:b0:652:e91f:a1bc with SMTP id 00721157ae682-66353dd10e7mr2223447b3.3.1721065520261;
        Mon, 15 Jul 2024 10:45:20 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160c6382esm218593085a.87.2024.07.15.10.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 10:45:19 -0700 (PDT)
Date: Mon, 15 Jul 2024 13:45:17 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ryan zhou <ryanzhou54@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, jikos@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid: usbhid: Enable remote wake-up based on device
 configuration
Message-ID: <dc4cb035-13a0-45ad-9234-1719890f4edc@rowland.harvard.edu>
References: <20240710231606.3029-1-ryanzhou54@gmail.com>
 <f0c789d8-8ae0-4a46-a5b3-aa9a5a758915@rowland.harvard.edu>
 <2024071104-rental-bleak-b273@gregkh>
 <CAPwe5ROTfQVQ2fF3ab05E51X+_5zFpSNK-qrEh-ev-WWBzY+DA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPwe5ROTfQVQ2fF3ab05E51X+_5zFpSNK-qrEh-ev-WWBzY+DA@mail.gmail.com>

On Mon, Jul 15, 2024 at 11:36:57PM +0800, ryan zhou wrote:
> On Thu, Jul 11, 2024 at 3:41 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Jul 10, 2024 at 09:47:39PM -0400, Alan Stern wrote:
> > > On Thu, Jul 11, 2024 at 07:16:06AM +0800, ryan wrote:
> > > > According to the USB protocol, the host should automatically
> > > > adapt the remote wake-up function based on the configuration
> > > > descriptor reported by the device, rather than only the default
> > > > keyboard support. Therefore, it's necessary to support other hid
> > > > devices, such as digital headsets,mice,etc.
> > >
> > > It's true that the host shouldn't try to enable remote wakeup if the
> > > configuration descriptor shows that the device doesn't support it.
> > >
> > > However, it's not true that the host should try to enable remote wakeup
> > > for devices other than keyboards with boot-protocol support.  History
> > > has shown that quite a few HID devices don't handle remote wakeup
> > > properly; the decision about whether to enable it should be left to the
> > > user.
> >
> > I agree, this patch isn't acceptable.  Ryan, why do you want this
> > applied?  What userspace control is missing to allow you to do this
> > today on your systems with no kernel changes for devices that you know
> > will work properly?
> >
> > thanks,
> >
> > greg k-h
> 
> 
> Many thanks to Greg KH and Alan Stern for reviewing the patch and
> replying to me.
> I'd like to start by asking Greg KH's question.
> 
> A1:This patch is expected to be applied to the USB digital headset,
> mouse, and keyboard,
> and we expect to wake up the system by operating them when the system
> has suspended.
> 
> A2:I've verified that user-space control does the trick, but
> Personally speaking, it's not a good solution.
> For each device plugged into the host, the user space needs to check whether
> it is one of the three and to enable wakeup.It may be better to enable
> wakeup when loading
> a HID class drivers, from my perspective. Could you please give me
> some advice if possible.
> 
> I have spent some time studying your responses, and learned a lot. I
> absolutely agree with many
> of your points, but still have some doubts.
> 
> Q1 for Alan Stern: Boot device includes a boot mouse and boot keyboard,
> why the patch(3d61510f4ecac) only enables boot keyboard by default,
> and in addation boot
> protocol is used in BIOS,why is it used as a wakeup judgment condition
> in the OS?

In general we did not want to enable wakeup by default for mouse 
devices.  We didn't want to have a situation where somebody puts their 
computer to sleep and then accidentally moves the mouse, and that 
causes the computer to wake up.

I don't remember the reason why only keyboards supporting the boot 
protocol are enabled by default.  Maybe we thought those were likely to 
be the most reliable ones.

> Q2: for Alan Stern:  As you comment 'History has shown that quite a
> few HID devices don't
> handle remote wakeup properly'  I consulted the USB20 Spec in Chapter
> 9.2.5.2 and it has
> this description:'If a device supports remote wakeup, it must also
> allow the capability to be
> enabled and disabled using the standard USB request'  So these devices
> that you're talking about
> are not compliant with the USB20 protocol specification to my mind. If
> so, shouldn't we
> support these non-standard devices.

Sometimes supporting a device means _not_ enabling it for remote wakeup, 
because its wakeup support is broken.

Alan Stern

