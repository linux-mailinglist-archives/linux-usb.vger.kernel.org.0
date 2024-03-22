Return-Path: <linux-usb+bounces-8172-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2403B886EC2
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 15:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65B7EB20F22
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 14:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8572747F7F;
	Fri, 22 Mar 2024 14:38:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 4D7C7433B3
	for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711118312; cv=none; b=XZWVbpzLkrNmguf0JVPUWt85URp3IaOpQwV2sgra/E2WaFoLiUuk6kK9WyRJRAMJHTe2H7WRM3KqKgmqqELXX+3NDtBtYdQMfa3qOfV7H/cEsRFzRQBZETgrTQkNDA2qE0UzdRojYJw9tHWH/An0/t/PoDkTYA6P1cnoHyqYfZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711118312; c=relaxed/simple;
	bh=3r7v095ouw39d4PdKpuAInEYq5heJvH/c8twfhfxMcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYIwOzZn+WmmNAHiEXNDdPa8y0B/w2wPmzfP3Z5cef4tDOTRl9Nzh2eSRKwYpliivcvQQyFNjF/PWyR9CGM1CtJz7T6ehXBRG+ZlOzZUPIIqd4Ti8y7A2R6ZSZRXOqPmrqpQUUJyw01LWtI2ZpEkut1M4V6WgXYI2X37XDUEac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 761017 invoked by uid 1000); 22 Mar 2024 10:38:26 -0400
Date: Fri, 22 Mar 2024 10:38:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
  lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: storage: isd200: fix sloppy typing in
 isd200_scsi_to_ata()
Message-ID: <26d483d0-a89c-4c33-99f2-455f0f13e6e5@rowland.harvard.edu>
References: <e8c20e3c-3cbe-b5c1-f673-0a7f22566879@omp.ru>
 <4e13319d-30a8-4274-bfa0-36d915b1e1ec@rowland.harvard.edu>
 <6425997a-669b-919d-af44-880a7ce28ffc@omp.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6425997a-669b-919d-af44-880a7ce28ffc@omp.ru>

On Fri, Mar 22, 2024 at 12:49:23PM +0300, Sergey Shtylyov wrote:
> On 3/22/24 3:57 AM, Alan Stern wrote:
> [...]
> 
> >> When isd200_scsi_to_ata() emulates the SCSI READ CAPACITY command, the
> >> capacity local variable is needlessly typed as *unsigned long* -- which
> >> is 32-bit type on the 32-bit arches and 64-bit type on the 64-bit arches;
> >> this variable's value should always fit into 32 bits for both the ATA and
> >> the SCSI capacity data...
> >>
> >> While at it, arrange the local variable declarations in the reverse Xmas
> >> tree order...
> >>
> >> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> >> analysis tool.
> >>
> >> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> >>
> >> ---
> >>  drivers/usb/storage/isd200.c |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> Index: usb/drivers/usb/storage/isd200.c
> >> ===================================================================
> >> --- usb.orig/drivers/usb/storage/isd200.c
> >> +++ usb/drivers/usb/storage/isd200.c
> >> @@ -1283,8 +1283,8 @@ static int isd200_scsi_to_ata(struct scs
> >>  
> >>  	case READ_CAPACITY:
> >>  	{
> >> -		unsigned long capacity;
> >>  		struct read_capacity_data readCapacityData;
> >> +		u32 capacity;
> > 
> > This is a bit peculiar.  Why bother to change the type of the capacity 
> > variable without also changing the types of lba and blockCount at the 
> > start of the routine?
> 
>    The reason is simple: Svace didn't complain about those.

You shouldn't trust automated code checkers too far.  Always verify 
their reports, and look around the vicinity to see if they missed 
something obvious.

>  I'll fix
> them up in v2 if you're not opposed to this patch...

Sure, go ahead.

Alan Stern

