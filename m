Return-Path: <linux-usb+bounces-2279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA437D9942
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 15:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1867C2824C1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 13:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A59319BA9;
	Fri, 27 Oct 2023 13:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nR3lp35A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE26179B2
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 13:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D07C433C7;
	Fri, 27 Oct 2023 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698411925;
	bh=zaYZfgzd/AUC8fNk4HRhMwBVjX0Qqbz90BBpInkqSlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nR3lp35AvSdzqeFRQP/1Qj/tqDzxQJ/Gy+5zQRyGUw3MKziIKxiZIpeMeg5Si/zcV
	 wfbLcZrWlVzUt3uQy0fHJKHhhc2A7zkDkOy8n8VHkQ9rsZem9PNn1tIBhhPCvTb7Ty
	 J9od5rZaTrNmQmz57A9YtOccGjTO+nqWlAy4ra78=
Date: Fri, 27 Oct 2023 15:05:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: LihaSika <lihasika@gmail.com>, Linux USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] set 1.50 as the lower bcdDevice value for "Super
 Top"-device in drivers/usb/storage/unusual_cypress.h
Message-ID: <2023102757-runner-huff-9640@gregkh>
References: <ZTsR-RhhjxSpqrsz@debian.me>
 <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
 <2023102704-stable-lid-c86a@gregkh>
 <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com>
 <ZTuzlUp3x8I_kqoS@debian.me>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTuzlUp3x8I_kqoS@debian.me>

On Fri, Oct 27, 2023 at 07:56:53PM +0700, Bagas Sanjaya wrote:
> On Fri, Oct 27, 2023 at 03:37:51PM +0300, LihaSika wrote:
> > > - Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
> > >    and can not be applied.  Please read the file,
> > >    Documentation/process/email-clients.rst in order to fix this.
> > > 
> > 
> > Oh right, Thunderbird wrapped the first line of the patch file -.-
> > 
> > Disabled wrapping, another attempt:
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Liha Sikanen <lihasika@gmail.com>
> > ---
> > 
> > diff --git a/drivers/usb/storage/unusual_cypress.h b/drivers/usb/storage/unusual_cypress.h
> > index 0547daf..7b3d5f0 100644
> > --- a/drivers/usb/storage/unusual_cypress.h
> > +++ b/drivers/usb/storage/unusual_cypress.h
> > @@ -19,7 +19,7 @@ UNUSUAL_DEV(  0x04b4, 0x6831, 0x0000, 0x9999,
> >          "Cypress ISD-300LP",
> >          USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
> > 
> > -UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
> > +UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0160,
> >          "Super Top",
> >          "USB 2.0  SATA BRIDGE",
> >          USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
> > 
> > 
> > 
> 
> Hi,
> 
> You have to use git-send-email(1) for the purpose of sending patches
> instead. Please see Documentation/process/email-clients.rst in the kernel
> sources for more information. And don't forget to address reviews from
> Greg's bot.

You don't have to use git send-email, that's not required at all, it's
just there to make things easier for some people.

thanks,

greg k-h

