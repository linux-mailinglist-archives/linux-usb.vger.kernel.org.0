Return-Path: <linux-usb+bounces-11534-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 693B5911C86
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 09:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11B551F21D86
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 07:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41095169AD2;
	Fri, 21 Jun 2024 07:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="djf4P3yM"
X-Original-To: linux-usb@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D112D742
	for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 07:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718953983; cv=none; b=H/saWdInkveKH83aZSse9VTqJWWauGWePJwovGTQyn29xQCz9wEU6LBWcidtjGLfXAA9xLxHS5/TO02F0IHocN8sVXRL8y3ZTucKEEhyEyh1mNexI/nxcwuQJ1UgZklBPN2eEKWOfuADf35sloHuix0opazJm+DaHGxFGHMXg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718953983; c=relaxed/simple;
	bh=wxRBiIhg5aoWqiARpLcQnqg1nRX3qVzushTWogSq98I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/AvMoVoYhaea6NTvUAYoo+OLQuioLRXFfBvBEqz5qeq83bCcdJlzjw2NucgV+JGoXvNRGClr0Jtqf8icbz3rUX6ydvz1Cf4wQi3XnNTrmjdsXUCtbpfot0BQes4T/41D7Ye4pWhoqA4Ssw0YjB+ibm4HOUE5cVWxp+UdkTUcqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=djf4P3yM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FB6E6EF;
	Fri, 21 Jun 2024 09:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718953960;
	bh=wxRBiIhg5aoWqiARpLcQnqg1nRX3qVzushTWogSq98I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djf4P3yMpi8QWNPUo+Pd5NU413q9QK/tFT8Ho4ppFJI+BPF0Rw+s6bzFHfyJjstVp
	 WxaHBEOUUEnGmAbKE0POvy/nKzE01ktjIOZU1W7UTaQInBCLgeG/UZJOrz94KUwOBp
	 1mr3NHY/QJhsEtNUHOPLfX4RYpqiqxJUV/slENjE=
Date: Fri, 21 Jun 2024 16:12:52 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: Stalling non-0-length OUT control requests in Raw Gadget/GadgetFS
Message-ID: <ZnUn9HP052yimfYn@pyrite.rasen.tech>
References: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>
 <8b7aa23c-9976-46c2-b64f-1d4614aefe89@rowland.harvard.edu>
 <CA+fCnZd1UOqCiH7L1FMMqLhepiMSBfgVb-tXfc81F_VuX_zy4w@mail.gmail.com>
 <73838855-fe52-4d2f-a826-c5757f75bd92@rowland.harvard.edu>
 <ZnI376uuUb34I1go@pyrite.rasen.tech>
 <CA+fCnZc6CbnT18MJGNUfWuFfcqOhYKGZeU+rpnaZ7rim56Vnag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZc6CbnT18MJGNUfWuFfcqOhYKGZeU+rpnaZ7rim56Vnag@mail.gmail.com>

On Thu, Jun 20, 2024 at 02:57:34PM +0200, Andrey Konovalov wrote:
> On Wed, Jun 19, 2024 at 3:44 AM Paul Elder <paul.elder@ideasonboard.com> wrote:
> >
> > > > This series below is the one you're referring to, right?
> > > >
> > > > https://lore.kernel.org/linux-kernel/20190124030228.19840-1-paul.elder@ideasonboard.com/
> > >
> > > Yes, that's it.  I'm impressed that you were able to find it; I had lost
> > > track of it.
> > >
> > > > Do you know why it wasn't merged? (CC Paul). There are no comments on
> > > > the latest version I managed to find.
> > >
> > > I guess Felipe Balbi (the USB Gadget maintainer at the time) just wasn't
> > > very interested in fixing the problem.
> >
> > So that's why we never continued with merging it...
> >
> > Is it time to dust it off and try to upstream it again? :)
> 
> Thank would be awesome! :)
> 
> If you get around to it, I can add Raw Gadget integration on top and test it.
> 
> Do you know, what would be the better board to get with an MUSB UDC
> for testing? Ideally, something that supports the mainline kernel.

The one that I used last time was a Pandaboard ES, but also it was 4.18
back then so it's got a lot of dust...


Paul

