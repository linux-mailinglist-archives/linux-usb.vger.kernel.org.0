Return-Path: <linux-usb+bounces-5381-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AB48372B1
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 20:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83B07B333ED
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 19:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FABD47A48;
	Mon, 22 Jan 2024 18:53:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 839013A8C4
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 18:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705949635; cv=none; b=kWbdULzPEDthRnl7snvS1RCEMDc7nJ1CChc4CZ4IKhBIvXz+b00SuUn26hWI6cGP/d3AJLUgxLKQ53dYnIEP4Z0A4EE/i5e9josDRDMFEi5VpBT2yh8T+Udj+39y7h1zFlVDkjFNh2wL77y0FjyxiANnhphCjv75YdUTtXG7I4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705949635; c=relaxed/simple;
	bh=piEF+f+AACkRyKM9RN7HnKPDwMsimDLbHduLXROh4B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZRJ33VXN5wMtMMLaAn4exPQiFgb6TRC0GxQYLBGD7pGvuSDP8Dtjft0irofLAn6ExF5/Q09okwlJ8zmSl4ZGOq/4UP+4duocFSP2clrtUi95/C6Qpq5785WqNSWT4gHcv6JQebyan/ZNqeLjiKri1PiYbh2pya+tPs4VQL+mbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 146125 invoked by uid 1000); 22 Jan 2024 13:53:51 -0500
Date: Mon, 22 Jan 2024 13:53:51 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] usb: storage: freecom: drop useless assignment in
 init_freecom()
Message-ID: <0ce435c2-5ee4-4d3b-b6e2-f185f1d34749@rowland.harvard.edu>
References: <4d3fb70f-bf2f-96cc-a8fb-1ef658a24920@omp.ru>
 <2023120412-observing-affluent-9432@gregkh>
 <b96dc0cc-86da-425b-86b8-39566f594d83@omp.ru>
 <cc7434e0-804c-82d6-3f57-dcceef8b461e@omp.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc7434e0-804c-82d6-3f57-dcceef8b461e@omp.ru>

On Mon, Jan 22, 2024 at 09:26:51PM +0300, Sergey Shtylyov wrote:
> On 12/7/23 7:16 PM, Sergey Shtylyov wrote:
> 
> [...]
> >>> In init_freecom(), the results of usb_stor_control_msg() calls are stored
> >>> in the local variable and then printed out by usb_stor_dbg() (if enabled),
> >>> except for the 1st call, the result of which is completely ignored.  Drop
> >>> the useless assignment.
> >>
> >> Instead, you should check the return value and handle it properly, don't
> >> just drop the checking entirely, that's not good.
> > 
> >    Hmm... I wonder if you'd actually read the patch...
> >    I'm not dropping any checking because there's none, even at the further
> > call sites of usb_stor_control_msg() -- the most init_freecom() currently
> > is doing is printing out the result of the calls...
> 
>    Alan, haven't heard your opinion on this patch... What do you think?

Oh, sorry about that.  There's nothing wrong with the patch.  None of 
the return values in that function are used for anything other than 
debug log messages.  (It's a little surprising that the original author 
of this driver didn't put any error checking here.)

Greg, feel free to merge the patch.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

