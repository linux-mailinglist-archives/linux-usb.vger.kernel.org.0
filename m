Return-Path: <linux-usb+bounces-8485-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BDA88E9FB
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 16:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39664B32DD0
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 15:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09F513473B;
	Wed, 27 Mar 2024 14:47:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 92DC2381A4
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711550852; cv=none; b=eni62nLIuBTlR23qwL8IvOm/bQ4ooL79X2mExU/VEJIYAjmAwRxYXgkU7KUAhtM1NfgGwgU+BvPyxoefllFH1juz/xdl6U/CIW+BAPndh+yKP0nHRueoLpvheG93/+iJyvxaEnIDX1263Q+FXEW4Ql9NwjviXtnrsp5EXSLJwCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711550852; c=relaxed/simple;
	bh=C7oX77vRzV+r2kymKY9RSJMFYgjT+ng+qxKVuRitl/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyGWiyVVAeN+urfFObLZR4dhDcCQYEeDqdkRqepQztvhc2AeftBbJqrdUYIJ1kkwB9vxHju8fTaWgO6Q/nTn/KHZuQs0Gk4uLof1dxKaTWd1Upsf3H9Z9dfjDSTOsfCAnVkoOmyzpEGMzSbGMtv/x5i2Px+c90oT3lJRAdmgUa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 928621 invoked by uid 1000); 27 Mar 2024 10:47:24 -0400
Date: Wed, 27 Mar 2024 10:47:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: USB list <linux-usb@vger.kernel.org>
Subject: Re: doubts concerning error handling in usb_parse_interface()
Message-ID: <c370898d-5614-4726-ab15-7ea06ae9bbe0@rowland.harvard.edu>
References: <72aeb263-fe7a-4637-82ec-043a6f9104c7@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72aeb263-fe7a-4637-82ec-043a6f9104c7@suse.com>

On Wed, Mar 27, 2024 at 03:16:24PM +0100, Oliver Neukum wrote:
> Hi,
> 
> while looking at this strange CVE
> https://github.com/wanrenmi/a-usb-kernel-bug?tab=readme-ov-file
> 
> I came to look at usb_parse_interface():
> 
>         /* Parse all the endpoint descriptors */
>         n = 0;
>         while (size > 0) {
>                 if (((struct usb_descriptor_header *) buffer)->bDescriptorType
>                      == USB_DT_INTERFACE)
>                         break;
>                 retval = usb_parse_endpoint(ddev, cfgno, config, inum, asnum,
>                                 alt, num_ep, buffer, size);
>                 if (retval < 0)
>                         return retval;
> 
> If this fails catastrophically, we bail out
> 
>                 ++n;
> 
> If not, we count the endpoint as success

Not as a success -- see below.

>                 buffer += retval;
>                 size -= retval;
>         }
> 
>         if (n != num_ep_orig)
>                 dev_notice(ddev, "config %d interface %d altsetting %d has %d "
>                     "endpoint descriptor%s, different from the interface "
>                     "descriptor's value: %d\n",
>                     cfgno, inum, asnum, n, plural(n), num_ep_orig);
>         return buffer - buffer0;
> 
> However, looking at usb_parse_endpoint() no errors are returned.
> Should the check just go or have we dropped something important?
> This code looks quite suspect, as we happily count duplicated endpoints
> and endpoints with invalid addresses as successes.

True, the return value isn't an error code.  The two lines that do the 
checking should be removed.

Each time usb_parse_endpoint() is called, it consumes one endpoint 
descriptor.  Maybe an invalid or duplicate descriptor, but still an 
endpoint descriptor.  So n (in the caller) is the total number of 
endpoint descriptors encountered.  The actual number of endpoints we 
use, generally a different number, is stored in alt->desc.bNumEndpoints.

Alan Stern

