Return-Path: <linux-usb+bounces-17762-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8F89D45BC
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 03:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6643C2837E4
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 02:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D7D5FEE6;
	Thu, 21 Nov 2024 02:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="A779FzdD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E700823099A
	for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 02:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732156298; cv=none; b=uJcjJOHxwbqh3SJ880FGPDF0sfkBGzbjNph2soq1KV5cUWDSW+QnSfT0T8sJ6m5OuBn+K5deNo4QccZYuTasxL3crG4/NojtONq7vYWfkw8OputduwVRRUPlNzF7Ji3r8dxct1ykn6RQNnQl/WDr/ilikFK2bnAypMPqP955nNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732156298; c=relaxed/simple;
	bh=ZOyJBsG3126Uj/W9OSYCKTg5Qz9Osk1kl/sWK6J+79Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhUHU2wozIpYJTD8EweuVyE9jX+e99nc7FgeIwMvyjkYtN7uec+kWEttnWCA3J9EcLuqn5oDu3U5UECoevAy0wokTUbc02tV5/vrGAZY6W0KguARQxk7NY/6YAg9OBnE4LqpmMPoElKpZlQs0u0N0jI6Zbr+QMZAq95lWSVco3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=A779FzdD; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b35b1eb7e3so108551685a.1
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2024 18:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1732156295; x=1732761095; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+9vtQ2LO5oNPt5zEJfLvCY25xBV4TGDKppsmB5XiA8=;
        b=A779FzdDziB/wXqjaU4UnO+dJLJXue4+VnFGe/XTDgqEItTdtZMmH+z03GYIyJe/oZ
         13+WnnX3GaoCzOrVI4K9Erb5Vk6lNeurwOejxPD0MOybFJ0lJHbHwJ36fwGyoe5yEmnU
         esVvP5Icz1VV7VhzJk7+GWdUe3hfWDEkaXy6U1IFB6hmwZToSr12RiNUV/uDFXSqpMjp
         qGAPIQxHSD9csmUwefExdlfeK5IzJhtcN7GqoWMlm4h4z3L7X9Ill5DeUXHhPFHqI5gQ
         tIx6otwPoR6eYUH6mw7rj5J2T5dKX73+u2f0rUuH/o7IQ1Ba6kV+phq73/81TaNnoqZ9
         ZK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732156295; x=1732761095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+9vtQ2LO5oNPt5zEJfLvCY25xBV4TGDKppsmB5XiA8=;
        b=kEORVBV/+3r6sXR/p2OAi5RPHIBxfdYsKTopSP+N+ZmNdWkj4FEWkw+KVX7LpouIvV
         0cL6R2Hk31t2Te9PTLqUR20yXX8Fafrq1Z2V1sIB0PWDTiKetbNQvPSXmyAAT+gD9lT6
         KxLl346ABwJGbO4sD+6LGdcj3SsfPfLYj07j5TMhwYEq37BdqVdxgbYVnob7aoWbjSPh
         hgTzAoazRUQvh9zeDnJpuCekW1wV84kNTDg4V25sw4APXt0NKgMR/na8zsBFMUzW5eo0
         SlEO0ZeMZk5j01Z5Q54dYFeZkdxu2iFfQ//c3bF4BTm/weSASCTBd90/aK55KNNICbN4
         dKLA==
X-Forwarded-Encrypted: i=1; AJvYcCVFTDXLDSo/UUR7Nu8KwFdqOOCLz26W5LAmM44b/e5GBCPuUhztI6ukCiehNVjcc+9UIuIcEBdpJxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTNOysOMHBwysy5grIZ59H9a++ovF7ii1/PD9AtwQRYCa3Lhyr
	ASqoGRV6gCIqOdTTQQlIcFRK3zstEb2Q9IYzCZjORh11au+ne14kq71x7ZL88Q==
X-Google-Smtp-Source: AGHT+IE3kKJuCc+qQn3juNDYScHOej35QMrwxHLoesFI1+x3r1BZPOgjrrJAFzLzQ+aAEqGTx30+FQ==
X-Received: by 2002:a05:620a:44d1:b0:7b1:4762:8a with SMTP id af79cd13be357-7b50c11a882mr337264985a.3.1732156295648;
        Wed, 20 Nov 2024 18:31:35 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::24f4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b479d2dc8fsm157860585a.11.2024.11.20.18.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:31:33 -0800 (PST)
Date: Wed, 20 Nov 2024 21:31:29 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: How are halted endpoints supposed to be handled in Linux?
Message-ID: <b34b5ea0-2804-4692-bede-70ba9065c86c@rowland.harvard.edu>
References: <20241121001138.23a45f6c@foxbook>
 <20241121000216.kif557p3p6xyahax@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241121000216.kif557p3p6xyahax@synopsys.com>

On Thu, Nov 21, 2024 at 12:02:19AM +0000, Thinh Nguyen wrote:
> ++Alan
> 
> Hi,
> 
> On Thu, Nov 21, 2024, Michał Pecio wrote:
> > Hi,
> > 
> > I have been wondering about it after seeing how it's done in xhci_hcd,
> > which looks wrong to me.
> > 
> > USB 2.0 spec 5.7.5/5.8.5 states that halt condition due to either STALL
> > handshake or "transmission error" should cause both the device and host
> > endpoints to be reset. I presume "transmission error" means any error
> > detected by the HC which causes it to halt, various examples exist.

The spec is unfortunately vague about what a halt condition is, although 
it apparently intends the various sorts of transmission errors to count.

> > USB 3.0 just refers to USB 2.0.
> > 
> > Linux appears to ignore this part and only reset on STALL handshake, as
> > advised in Documentation/driver-api/usb/error-codes.rst and practiced
> > by drivers - they don't seem to bother with usb_clear_halt() on -EPROTO.

This is generally a weakness in the drivers.  It would be nice if the 
class specifications said what to do in these situations, but most of 
them don't.

> > This wouldn't necessarily be bad in itself, but:
> > 
> > On the HCD side, xHCI will:
> > - give back the current URB with -EPROTO/-EPIPE status
> > - reset the host side endpoint, clearing its toggle state
> > - point the HC at the next URB if one exist
> > - restart the endpoint without waiting for hcd->endpoint_reset()
> > - ignore one subsequent call to hcd->endpoint_reset()

This behavior is not correct.  See the kerneldoc for 
usb_unlink_urb() in drivers/usb/core/urb.c, especially the section 
labelled "Unlinking and Endpoint Queues".

In general, the only safe thing for class drivers to do when they get 
one of these errors on a bulk or interrupt endpoint is to unlink all the 
pending URBs for the endpoint and then call usb_clear_halt() when they 
have all completed.  I know that usb-storage does this; I suspect that 
not many other drivers do.

I suppose the USB core could take care of this automatically so that 
neither the class drivers nor the HCDs would have to worry about it.  If 
everyone agrees that this wouldn't lead to other problems, it could be 
implemented without too much difficulty.

However, as you point out, in general there's no way for the host to 
know whether the device accepted the failed transaction.  This means 
that proper recovery requires knowledge of the higher-level protocol, 
which only the class driver is aware of.

> > For STALL, I think it's a little awkward, but acceptable. The ultimate
> > result appears to be that all pending URBs are given back with -EPIPE
> > and things start moving again after usb_clear_halt().
> > 
> > But if the device isn't stalled, the next URB may execute right away if
> > the failure was transient. This makes it impossible to ensure in-order
> > delivery on bulk OUT pipes, because one URB is skipped and the driver
> > has no reliable way to retry it before some later ones may get executed.

Just so.

> The class driver will know of this error, and the retry/recovery should
> be done at the class driver base on this error and not from the HCD.

Agreed.  The minimum requirement is that the endpoint does not restart 
until all the pending URBs have completed, whether through explicit or 
automatic unlinks.

> > This behavior also creates an opportunity for toggle mismatch, and as
> > far as I understand, the hardware will resolve it by silently dropping
> > one packet. Another could be dropped if usb_clear_halt() were called.
> > 
> > 
> > Either I'm missing something, or it seems quite broken?
> > 
> > I wonder what other HCDs are doing in this case, and what's the idea
> > behind it all?

As far as I know, they don't automatically send Clear-Halt requests to 
the device or automatically unlink anything.

Alan Stern

