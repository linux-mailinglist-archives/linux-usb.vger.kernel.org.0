Return-Path: <linux-usb+bounces-17300-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F28D99C014A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 10:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 967F2B219AA
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 09:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4960F1E1328;
	Thu,  7 Nov 2024 09:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fjVWYLPM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C621C18785B
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730972361; cv=none; b=J3fdYCr2ZnXL4E1WmMDAWPM4owFQ7SRCP6xRdJgY7a5fIA05xH6HKZQeQOcKqRfkVn+V2ELKn7Dgmw6PPIAv5xb5iP0zQO+GjS/dDyf1TI0bfFVZD3MWrmXYnt9nyUQoJacNFZ5xzmBFAuw7v7v8NOfXcnrcLpHCSwlH07dF8+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730972361; c=relaxed/simple;
	bh=jcr+9kC2aXHfy+vEaQ260XikxslCb38CX6gnSja27ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bt1blDFwJ6gv3Q/isKSguRzB+9zGeyQHMZbTxQE7npBPRa+uJy2oYKBNa8w8CP21Mnogrj1HPH6GKnHeS85vplUQBiDc9N21C9ru9utaY8PShzXyaHulJD1iRu5LXhLHjt4/ft03OXjEUg2uFQySxt1oJuoo7evFhpGyd2XwzPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fjVWYLPM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B99C4CECC;
	Thu,  7 Nov 2024 09:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730972361;
	bh=jcr+9kC2aXHfy+vEaQ260XikxslCb38CX6gnSja27ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjVWYLPM54n3zA6kd6zDU6frMKiTzZsxxk3UbWDthaWBwnxA3UQKx+ANPpNPRUPgK
	 jTZIACddrYN3ISs/3VE/fH2mpcG/T+kK6YqwEv7RFXX8LJ9I0jDQHnv5PJ7300jKT9
	 drWVKx2q5pFAg8GN0/ymX6wF80PUFR+gDXEGvo8c=
Date: Thu, 7 Nov 2024 10:39:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v3 1/3] usb: misc: ljca: move usb_autopm_put_interface()
 after wait for response
Message-ID: <2024110709-relocate-excuse-288d@gregkh>
References: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
 <2024110743-dragonish-jokingly-8459@gregkh>
 <ZyyAZaUNJ0kCEHG7@linux.intel.com>
 <2024110710-duckbill-commodity-d1b5@gregkh>
 <ZyyJNneC_jjoJIQw@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyyJNneC_jjoJIQw@kekkonen.localdomain>

On Thu, Nov 07, 2024 at 09:32:38AM +0000, Sakari Ailus wrote:
> Hi Greg,
> 
> On Thu, Nov 07, 2024 at 10:03:56AM +0100, Greg KH wrote:
> > On Thu, Nov 07, 2024 at 09:55:01AM +0100, Stanislaw Gruszka wrote:
> > > On Thu, Nov 07, 2024 at 09:16:01AM +0100, Greg KH wrote:
> > > > On Thu, Nov 07, 2024 at 08:37:16AM +0100, Stanislaw Gruszka wrote:
> > > > > Do not mark interface as ready to suspend when we are still waiting
> > > > > for response messages from the device.
> > > > > 
> > > > > Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> > > > > Cc: stable@vger.kernel.org
> > > > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > > > Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
> > > > > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > > > > ---
> > > > > v2: fix handing error of usb_autopm_get_interface(),
> > > > >     add R-b, T-b tags from Hans
> > > > > v3: add A-b tag from Sakari
> > > > > 
> > > > >  drivers/usb/misc/usb-ljca.c | 12 ++++++------
> > > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > > 
> > > > For some reason you aren't sending this to the usb maintainer to be
> > > > applied, oh well...
> > > 
> > > Sorry, I thought sending patches to the mailing list is sufficient
> > > to get them applied. 
> > 
> > Please work with the Intel internal group to get their approval and
> > review before sending out your next round of patches for this, as they
> > know how to catch trivial stuff like this before forcing others to point
> > it out :)
> 
> Stanislaw's choses recipients are aligned with get_maintainer.pl output,
> sauf some who posted occasional cleanups. If that list wasn't correct, then
> there's something to fix in MAINTAINERS.

Nothing is wrong with MAINTAINERS:

	$ ./scripts/get_maintainer.pl --file drivers/usb/misc/usb-ljca.c
	Wentong Wu <wentong.wu@intel.com> (maintainer:INTEL LA JOLLA COVE ADAPTER (LJCA) USB I/O EXPA...)
	Sakari Ailus <sakari.ailus@linux.intel.com> (maintainer:INTEL LA JOLLA COVE ADAPTER (LJCA) USB I/O EXPA...)
	Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
	linux-kernel@vger.kernel.org (open list)



