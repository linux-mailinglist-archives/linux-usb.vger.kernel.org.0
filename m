Return-Path: <linux-usb+bounces-17806-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 348849D6731
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2024 03:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA3411616A8
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2024 02:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6E82D057;
	Sat, 23 Nov 2024 02:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Nri/fbzk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F3B817
	for <linux-usb@vger.kernel.org>; Sat, 23 Nov 2024 02:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732329552; cv=none; b=oEj4AOHCF+7jvBvpHWJ2KhM3s1/l/+QikhANuFi5BrVi1AI6zgSA1MtUOfITBrcwCw+S+5DDdCVduJmLKLe+QOzZKUcEUnYgHPZHjWdXe4s+lu/ki0MQvbC6276I+wohncONC/8SmYYlSbBf1WwfnG5owUodanAsoEJTb8jKjjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732329552; c=relaxed/simple;
	bh=kC4rn+OA6GK1SCTmeP6i9rwpfxQ4jTwo8wE53O4k/Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqQIT3ngr6FYZnW9x4ZyQmQZLuHo64LP4wAe5YRqtCgtr6eAJ1uGz/Vf0hFAlEaqetrabzuEUfcsf642eFcmf9HsDZGIgNE8lalTqCnOvdeY4yEWQyTQ87pGMC1CCHNeAT7XZnqwJsODx+m0zr9XQl5cDhBcVhNp29iNHZYPXrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Nri/fbzk; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-46097806aaeso18175461cf.2
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 18:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1732329549; x=1732934349; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=flj1oheU2betwTSuRbz5hWYpT/8uyM4nLv4x9JJzr7g=;
        b=Nri/fbzkV/ny/tNwCp2Fv5qQ6WuVP2e8O8zkeaIWqn36lBsXK3+Pu1qBwOyik2XQmh
         llEkuRGkj0/gPeYJPxSmXC8CqYYZo8PC58hTjPjnW3Doae3eWrqOWoZh1Sl0/QE2YkjA
         7DJykhrI5m+rn6KQX0pbkwPY1A/3EeFCirVhGf+ekGp7szPwGHIR/PdACh/17inhvsSx
         Sh6EDofl48LlphuXTZDKZMi3YOtqTe/tEojFh+1ZideDGgE0ta2Lts934a4TjPxrr4Hr
         X9zSssVihmGsMpUOaG3TQbb12/HjKWqS/UVjV00T5nRbui43gDsO5eqx7WbQASE8nw9g
         1Pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732329549; x=1732934349;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flj1oheU2betwTSuRbz5hWYpT/8uyM4nLv4x9JJzr7g=;
        b=DrHy1mNI0o4/sojjxDj89L+gOARfgbwmzXF53D7ECBIZqMR6SfhzWNbc8EE409eWbQ
         z5+QlKqVTV8U3QzVBIBVRllvLNYwE0pLO4S3EQ7rrw7FQzwODakvL9/Sjbq9N1ZK4a5e
         sbJ2IiYUgbcGKSioPPZ8nVIiYmGoxrJ1l/zb0BKF2vHYD/PGv1ssQqVcNfTnpwkOCS2f
         409grRIKJiZfG/UTEiDH9fPITfe7DnlfYLJUzHx0BSqupwOgUslRwcg8DqT+ITM17NHW
         oarF4YKsMm2HWnPRxXehiFc2scI6GK/jbsi2rcMWx/UI/6T/uOsSsYzeakr5GNI9gq7o
         F8Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWNI/XaPUf+xZwzZQrv0UygELmu8KAVTkJLpb/wGVDmoWSHAtdzjRNeT4wyBI+iKnbQf55LeYeC/WI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWdAZ+LAvmojfq3FaZ58c0hHxk8j56JJjBZVmlpwB5Gfw0jd01
	RycXBHj+Gq/EdySSJlWZk/MghJiyKU8N3U+6cj7qLgM69ZduAHsVZjIljT5vbw==
X-Gm-Gg: ASbGncvtx1ScjrL5+2j9nicS6T12dQaDjh8CrLVr7rcwwxPGu2WZ58p8KypA1+4MFkL
	G8AJ2zFBfzIY4KBXkL9XPJi4gSlkjvhe8TjUo3ukx4fWNa66HTnFYCTHl+1E78DQOU7ZN3wxgxo
	7m1dR9A/Uv85fTbpuREnICDqu6Id6p/JmzoOJbXu4KFn+BnaOd/sRZ3Ux+3sn6iPcBbX8HQEa+u
	Is2gh8X2h7v2cu3xmwvkYTk6cKCwtzGGjeq8R+vgNUY/sW2o4s=
X-Google-Smtp-Source: AGHT+IHuWDSg57GwZrAgVbVvAHdtZLcRyFBoWKaUOeQHIr9/hVM5vpqALsn27vQsJOPQtWCjeUWVuA==
X-Received: by 2002:a05:622a:107:b0:458:3a5a:94a5 with SMTP id d75a77b69052e-4653d52257dmr64607761cf.2.1732329548944;
        Fri, 22 Nov 2024 18:39:08 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::7cc6])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c417f27sm19276201cf.51.2024.11.22.18.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 18:39:08 -0800 (PST)
Date: Fri, 22 Nov 2024 21:39:05 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: How are halted endpoints supposed to be handled in Linux?
Message-ID: <c682221a-2688-4938-89f7-923907f5a996@rowland.harvard.edu>
References: <20241121001138.23a45f6c@foxbook>
 <20241121000216.kif557p3p6xyahax@synopsys.com>
 <b34b5ea0-2804-4692-bede-70ba9065c86c@rowland.harvard.edu>
 <20241121112653.06ba4ee5@foxbook>
 <0dd70803-a074-4859-8cc9-5bd210d12536@rowland.harvard.edu>
 <20241122135733.3d040c0d@foxbook>
 <eb3bae13-dd89-4c84-a4c9-4fb49348928c@rowland.harvard.edu>
 <20241123002535.368f1d72@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241123002535.368f1d72@foxbook>

On Sat, Nov 23, 2024 at 12:25:35AM +0100, Michał Pecio wrote:
> On Fri, 22 Nov 2024 14:28:58 -0500, Alan Stern wrote:
> > > > Note that some class drivers treat -EPROTO as a fatal error.  That
> > > > is, they don't retry and their completion-resubmission loop breaks
> > > > down.  
> > > 
> > > Well, that's on EHCI.  
> > 
> > No, it's the behavior of the class driver and is independent of the 
> > type of host controller.
> 
> xHCI has been doing things differently for over a decade as far as I
> see, and it seems to implement the usb_unlink_urb() rules absolutely
> literally (restart when everything is given back), except for the BH
> delay problem added later.
> 
> Maybe it was a common "idiom" before xHCI, but it seems to rely on
> undocumented behavior, and other undocumented behaviors exist today
> that sloppy drivers might depend on.

I think you're misunderstanding what I wrote.  I meant that several 
class drivers have completion handlers that look like this:

	urb_complete(struct usb_urb *urb, int status)
	{
		switch (status) {
		...
		case -EPROTO:
			dev_warn(dev, "USB communication error\n");
			return;
		...
		}

		/* Process data from the URB */
		...
		usb_fill_bulk_urb(urb, ....);
		usb_submit_urb(urb);
	}

The driver works by resubmitting a single URB over and over again.  But 
when there's a -EPROTO error, it doesn't resubmit and the loop stops.  
The driver doesn't do anything more after that; it becomes useless.

This behavior has nothing to do with EHCI or xHCI or any other type of 
host controller.  And overall it works, because -EPROTO errors hardly 
ever occur except when a device is unplugged.

> So I don't know, it seems risky either way.

This approach is only a little risky, in the sense that the driver 
might die in a situation where it didn't really need to -- but that 
outcome is most unlikely.  There is no risk of further communication 
errors or data corruption.

Alan Stern

