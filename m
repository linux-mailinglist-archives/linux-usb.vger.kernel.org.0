Return-Path: <linux-usb+bounces-9305-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FE98A2890
	for <lists+linux-usb@lfdr.de>; Fri, 12 Apr 2024 09:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DD6A286F6E
	for <lists+linux-usb@lfdr.de>; Fri, 12 Apr 2024 07:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE84A4D9F6;
	Fri, 12 Apr 2024 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2TYcOGjC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AE34CE13
	for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2024 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908466; cv=none; b=a0NOzRIhMR3EIGCY+NtMh+xArjtSMtpDwslT9wPZx0pfZtLo1qujpTZu0ELMV+AjE0aTH2BHnfeXw2zq+8oV0nmzWeZPRvGIrol6C841F4cSIyDbMtpB8fTTylP5auQSBfiHFKkS5Fsx4LybwYdf4zQRN4gkglseS9B/PpjelMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908466; c=relaxed/simple;
	bh=lvtXVYtpRsB1UHPyUhWIEI7aNlNBPr0hFIZpOHVhaPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgRjrBaHCCL6bw28S1JjPTkn2WKlvmZtGPVEtGUTTHzjzANf45RmUj1lpUb0PX6d7sG4VrE7wRp3hF888HyjdmHPehG+IwDMdw/XAUx2EbvxC6ItX7jhZhwaFipjSi+Yz5h6C0BeVhSQAOxejspEdeyRIyfFYnwOpDX448zmcek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2TYcOGjC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924CEC2BBFC;
	Fri, 12 Apr 2024 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712908466;
	bh=lvtXVYtpRsB1UHPyUhWIEI7aNlNBPr0hFIZpOHVhaPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2TYcOGjC0d1CXe18QnPPVbWrKQ5ZW7x6t7Zlsu+PV2ijOp5c9p6AohjJlwLz8ntb5
	 Z8nTxAX/wYkw+kCkWkbb6Km9nrAOtGl1BCzaypJrEOdVxjdLQHn2TUwtXZXQlzE2vG
	 Dy9gkofIyS2FjkjlVnLpFc4vZTQxtUp0Ef7bwYzU=
Date: Fri, 12 Apr 2024 09:54:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Hardening the parser during enumerations
Message-ID: <2024041251-gratitude-open-c48c@gregkh>
References: <20240411124722.17343-1-oneukum@suse.com>
 <2024041116-unicorn-washbasin-ba17@gregkh>
 <45c446c7-bd69-4202-8de4-d3305fe83cda@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45c446c7-bd69-4202-8de4-d3305fe83cda@suse.com>

On Thu, Apr 11, 2024 at 05:37:13PM +0200, Oliver Neukum wrote:
> On 11.04.24 16:09, Greg KH wrote:
> 
> > Right now, we barely trust USB descriptors, if we wish to change this
> > threat-model, that's great, but I think a lot of work is still to be
> > done as you prove here.
> 
> Indeed. As this is fiddly and holes are easy to overlook,
> anything I've missed?

We have had loads of fuzzing on the basic "parse the descriptors" logic,
so that's looking much better than before.  If you have actual
test-cases for the series you have here, that would help as well (we
need to integrate the syzbot usb descriptor fuzzing logic into kselftest
one of these days) so that both you can test if the changes are needed
(as Alan is pointing out they might not be), and that we can ensure that
future changes do not break anything.

But once a driver takes over for the device, all bets are off, we are
just now possibly hope that the endpoint assignment logic in drivers are
correct (so any help there is always appreciated), but after that, the
size of the endpoints and other basic protocol handling is fully
"trusted" and odds are no error checking is happening anywhere in almost
any driver.

So that means you still can not treat USB devices as "untrusted" sorry.
Just like any other hardware device in Linux.  So the threat-model is
the same, we have to trust the hardware.

thanks,

greg k-h

