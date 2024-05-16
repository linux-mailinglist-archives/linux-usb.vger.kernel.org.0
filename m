Return-Path: <linux-usb+bounces-10299-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C7D8C7AC4
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2024 18:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FAF72842FA
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2024 16:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D7D53392;
	Thu, 16 May 2024 16:58:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id F287B4A3D
	for <linux-usb@vger.kernel.org>; Thu, 16 May 2024 16:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715878711; cv=none; b=TMTyFajKK2CEAGsXrJdW25gFlk5SagktcT/4oW1MEim+Fzvn6sUEK+Yf2FwCljX0dY49T2u3c6Gz1/QaMB0V85ORTiR6ugmN1rh2pgQ+euhTu5zbArDBnfgMFzApxtK7unfvMY2mbVbmbW6fGID0qewdIqE/aRHcu/8dC2qo5bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715878711; c=relaxed/simple;
	bh=zsAZ9FAWeDRI/6d+5JXKACEDoJ7hIP4QeCdfYA25SlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6fvSOaR1EgCDaZJk3232aoXLhQvWkXFEihvQCA/3e1G5zJZKj/JLi+5vBtcRHE7TNAfAGU2Mmi90mWt+XcnM9Qi2iRf4TAkRW1AFMwa+eODZAIWR1niCUZ3pfluRkvDD1Z7Gq3twUxDElxuiooxvKNeyT6kwZ0bLYZ6lp3oCxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 272556 invoked by uid 1000); 16 May 2024 12:58:25 -0400
Date: Thu, 16 May 2024 12:58:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  USB list <linux-usb@vger.kernel.org>
Subject: Re: revisiting the issue of hardening the USB enumeration parser
Message-ID: <549323ac-e550-4921-a770-e0961b3b9151@rowland.harvard.edu>
References: <b94e5037-19da-4cc9-9a8a-28df8ada4795@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b94e5037-19da-4cc9-9a8a-28df8ada4795@suse.com>

On Thu, May 16, 2024 at 03:48:41PM +0200, Oliver Neukum wrote:
> Hi,
> 
> you convinced me that my last attempt to look at the parser
> was fundamentally flawed. Instead I went top down from parsing
> the configuration down to endpoints. I found one major issue.
> 
> static int find_next_descriptor(unsigned char *buffer, int size,
>     int dt1, int dt2, int *num_skipped)
> {
>         struct usb_descriptor_header *h;
>         int n = 0;
>         unsigned char *buffer0 = buffer;
>         /* Find the next descriptor of type dt1 or dt2 */
>         while (size > 0) {
>                 h = (struct usb_descriptor_header *) buffer;
> 
>                 if (h->bDescriptorType == dt1 || h->bDescriptorType == dt2)
>                         break;
>                 buffer += h->bLength;
>                 size -= h->bLength;
>                 ++n;
>         }
>         /* Store the number of descriptors skipped and return the
>          * number of bytes skipped */
>         if (num_skipped)
>                 *num_skipped = n;
>         return buffer - buffer0;
> }
> 
> This is called from multiple sites on chains of descriptors.
> We do have a check for overflowing the buffer in the while statement.
> However, there is no guarantee for make progress. If at some point
> in the chain we arrive at a descriptor of neither type we are looking
> for and a bLength of 0, size will remain constant and the loop
> will go on forever.
> 
> AFAICT this is guarded nowhere outside the function against.

You didn't notice this code in usb_parse_configuration() (starting 
around line 659):

		header = (struct usb_descriptor_header *) buffer2;
		if ((header->bLength > size2) || (header->bLength < 2)) {
			dev_notice(ddev, "config %d has an invalid descriptor "
			    "of length %d, skipping remainder of the config\n",
			    cfgno, header->bLength);
			break;
		}

The inner parentheses in the "if" condition aren't necessary, but the 
second half of the condition protects against zero-length descriptors.

> So how about the attached patch?

It's not necessary.

Alan Stern

