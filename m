Return-Path: <linux-usb+bounces-17769-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6517D9D4ADA
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 11:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69570B22CE4
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 10:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7D71CACC4;
	Thu, 21 Nov 2024 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrwIoJJQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397431C305A
	for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732184824; cv=none; b=bvAl5/8rwEnYcPba8KP4cKv3xNkG78NdYdHXtJPmHMA/GHkMx7ewjggdXZID5uAgMXHvllAszfNHEDiJx0cCrxVWYVKKTdFLI7Lr76RpuDQqyUnzOSmsEl57ISRf01fy5h6i2Gv6E8JaKCXl/VfaYmJshYng3FECWAYaRGwfAIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732184824; c=relaxed/simple;
	bh=ol38rtgD6TiT83XZiaFph72o/s0gnr6MqK8f0hrGRAU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oNzd874npt2hzSF7LUV5RXcmB1GA4sKZUb0RHAEjLUtPLY6O+kSrgLOTqNNTLjPRJn30ZPctsoULZc5Ys58Meh7t6hQLWvmNajrUl45endxhhl2Bhw3IZP5avvPXZEseHJKKTd0IAjgHidqn1JOmkJT8OCboW8RLZOOQrBeyVDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrwIoJJQ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e63c8678so702868e87.0
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 02:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732184820; x=1732789620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKh5cdiAPT+3ypK/yJi4evzNL6b+71cABocG0oJosKA=;
        b=MrwIoJJQ6dbHBuftJDbrTeuwn/pGtle0gmN2eTfhPcLTlABEPt/iqyoz3WyimcQmK3
         kCMnamsnTAsgsaIh1rtjLvh2zJDbvkZkOPFy4poqCv4txUJCX9SMsPzC6fFsybrYhNpX
         Ut8PVU0CC8dmQiCeKesEoEFmt/LHJ4Sfem9NTjqvcVfBikC2gkZDMFGegwHAPIz2N8rj
         PO0qiK08YZp+RtONusnJlHswNj8baOl1s0sE17IthXpk4xSPolz6othU/1wTLcx7qKF0
         G9JIJUgwn/F/XdQ/1xsibmGxqyLqTAqeqnP6lFqIRdKklbsIoE+8mLVoD6GjnIdEYCvQ
         rw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732184820; x=1732789620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKh5cdiAPT+3ypK/yJi4evzNL6b+71cABocG0oJosKA=;
        b=SrBJvbsubJHmmOARfYv3zCeGG82uwXaGMhKRD4fq04a/tOEh91tOY9VgsOGmkzqfpH
         RyLh3Ix1bnPO7gmC9b9o3TzurCYJynNvznf33/Ft0SNQyqOxKllS2FDdFzcUqmosKetu
         udv7IP5El94o4QeIwEj3neadLbAxJrqkQeWe10APUDb/bjr75t5ZgMb3sAN8k5s/BR/n
         RSyOYiuNUBlYl+ZaECIpw5yEnPjTEB9EUKbSNfrMhwKjGEOt7e2bl+a/GsAYviNYWKSW
         m8E0ataZSBncmDzMXreIZXLFlyLbgdlxW7fx/F8UV/rH3PxcMTSUUpK/msXs0x8pRT3r
         4i5g==
X-Forwarded-Encrypted: i=1; AJvYcCUSY5OPUc3UjNPk4ffudICwyjdh1OSIrog8BtZcT9+PpHqo2VaExsSu+uDZlvHET+FygOoN1v9RiCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl8qwvqvyNfNYZP1Kp9AQmCpksWME04gh/SodOr3oVy8HETRA6
	+rpVToXyCmT0AwmCDj7uD1BO3UX9TClIPAQft+QfTiCTlZUxqpDb
X-Gm-Gg: ASbGncsk3f+gC5tNbluxVaLRXRhPu3MIzhIej+cV5mHnpsAEUj2AU8Qb3Yfmte1UjCe
	h6THhbM7z/RGstO4XJ2uuhnrhFu9KdN2NHLkaANcefaXLDXBlY4oPeNBCOHq2XY6BtbR6ghWiEN
	b41BbihkxISb8akHaAxUDeqXpVqrrBlfBVO79V8mAmlmFY31QUyhUGYYC3EAeu7cj0jCXd16OUn
	JUhGcF0r12vXXRbUjgbdPyfQZiIEIn3W8Dgy65uzSahvXr+2nHD0CdY9Q==
X-Google-Smtp-Source: AGHT+IEf2Gqx4KTDZkI2OresQzBbblZ4TpLjqUgOKhE3l7aGcpZEnUy3HHe80S7LNC3Pfa7+H7LRYw==
X-Received: by 2002:a05:6512:baa:b0:539:d0ef:b3f9 with SMTP id 2adb3069b0e04-53dc136a8f0mr2401434e87.40.1732184819885;
        Thu, 21 Nov 2024 02:26:59 -0800 (PST)
Received: from foxbook (bfd3.neoplus.adsl.tpnet.pl. [83.28.41.3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd3fc9aesm933323e87.91.2024.11.21.02.26.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 21 Nov 2024 02:26:58 -0800 (PST)
Date: Thu, 21 Nov 2024 11:26:53 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: How are halted endpoints supposed to be handled in Linux?
Message-ID: <20241121112653.06ba4ee5@foxbook>
In-Reply-To: <b34b5ea0-2804-4692-bede-70ba9065c86c@rowland.harvard.edu>
References: <20241121001138.23a45f6c@foxbook>
	<20241121000216.kif557p3p6xyahax@synopsys.com>
	<b34b5ea0-2804-4692-bede-70ba9065c86c@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Alan,

Thank you for taking the time to answer. I'm beginning to regret not
asking this question earlier.

On Wed, 20 Nov 2024 21:31:29 -0500, Alan Stern wrote:
> > > Linux appears to ignore this part and only reset on STALL
> > > handshake, as advised in
> > > Documentation/driver-api/usb/error-codes.rst and practiced by
> > > drivers - they don't seem to bother with usb_clear_halt() on
> > > -EPROTO.  
> 
> This is generally a weakness in the drivers.  It would be nice if the 
> class specifications said what to do in these situations, but most of 
> them don't.

There is also proprietary hardware with no specification at all.

> > > On the HCD side, xHCI will:
> > > - give back the current URB with -EPROTO/-EPIPE status
> > > - reset the host side endpoint, clearing its toggle state
> > > - point the HC at the next URB if one exist
> > > - restart the endpoint without waiting for hcd->endpoint_reset()
> > > - ignore one subsequent call to hcd->endpoint_reset()  
> 
> This behavior is not correct.  See the kerneldoc for 
> usb_unlink_urb() in drivers/usb/core/urb.c, especially the section 
> labelled "Unlinking and Endpoint Queues".

OK, let's go through it.

 * But when an URB terminates with an
 * error its queue generally stops (see below), at least until that URB's
 * completion routine returns.

I don't see this working after xHCI adopted bottom half giveback, which
is asynchronous. As you are the maintainer of EHCI, which also uses BH,
how is EHCI dealing with it?

One way I see with existing APIs is to wait until the driver submits a
new URB, but are drivers prepared for this? Is EHCI doing the same?

 * It is guaranteed that a stopped queue
 * will not restart until all its unlinked URBs have been fully retired,
 * with their completion routines run

I think xHCI can currently guarantee that nothing is restarted until
any URB unlinked for any reason is given to the BH worker, but that's
all we have, and I just broke it in usb-next:

+               /* Try to restart the endpoint if all is done */
+               ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+               /* Start giving back any TDs invalidated above */
+               xhci_giveback_invalidated_tds(ep);

This is part of a legitimate bugfix patch tagged for stable. I should
have insisted on keeping it a separate change, but it seemed a good idea
at the time which would soon get implemented anyway... Maybe no more?

 * even if that's not until some time
 * after the original completion handler returns.

Not entirely sure what this means.

 * The same behavior and
 * guarantee apply when an URB terminates because it was unlinked.

Same caveat about BH asynchronicity in xHCI.

> In general, the only safe thing for class drivers to do when they get 
> one of these errors on a bulk or interrupt endpoint is to unlink all
> the pending URBs for the endpoint and then call usb_clear_halt() when
> they have all completed.  I know that usb-storage does this; I
> suspect that not many other drivers do.

Your suspicion isn't wrong AFAIK.

One more thing which is safe at least wrt data corruption is to simply
retry the same URB without resetting anything. But if an HCD wants to
do it, existing API gives no way to notify the driver and allow it to
opt out and handle things differently, so it mustn't retry forever.

> I suppose the USB core could take care of this automatically so that 
> neither the class drivers nor the HCDs would have to worry about it.
> If everyone agrees that this wouldn't lead to other problems, it
> could be implemented without too much difficulty.

This still appears to run into the double delivery problem that you
described in the discussion linked by Thinh Nguyen, particularly in
case of dodgy drivers for dodgy hardware.

Considering that, I'm not sure if automatically resetting anything on
-EPROTO is a good idea.

> > > I wonder what other HCDs are doing in this case, and what's the
> > > idea behind it all?  
> 
> As far as I know, they don't automatically send Clear-Halt requests
> to the device or automatically unlink anything.

That's what it looks like, grepping through drivers/usb/host. But my
question was mainly about -EPROTO. When should an HCD restart a halted
endpoint? Should it clear the sequence state? (probably not).

Regards,
Michal

