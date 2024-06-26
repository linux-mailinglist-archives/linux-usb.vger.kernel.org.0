Return-Path: <linux-usb+bounces-11711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA25C918EAC
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 20:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 712FB283D2F
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 18:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CB0190662;
	Wed, 26 Jun 2024 18:37:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D64CE17D365
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 18:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719427056; cv=none; b=u2WYhgH4DHOU1Lms8sDh0iDkPGbKfOzTULIeL4wacD/rrMmnXgyvQUqGkANgFWNHR4jkOkrpFZgx4h8g7Dn+woaQHZ8ArQm+yB6tyJhXmiAfF/PJo3Jo5TumBRDQwMXfFSgcAo5jjcy/RYBpQI/T+P+PSDaeFGrfhKXY1LVHieo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719427056; c=relaxed/simple;
	bh=ZpOoRtgSvBj0RFJdv620kR7AW7AEs03M198jSnOwfpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQfLOxe7dOz6P9gh947wHjCIUcieFnOjXBV4bcumd56Zw8G0gqzXJBvripIauhGIkE8ZsmyXDr2P8Bkc8Sb4yGVMQ2H7mp+/MOTAhlOj+yYslV5uyrNezKPThcLTOFUeO8Kcpw2jamDQGSBjH7eVnw+hgW+U4c9dn0u3iW4Aewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 713752 invoked by uid 1000); 26 Jun 2024 14:37:33 -0400
Date: Wed, 26 Jun 2024 14:37:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Reserved bits in bEndpointAddress
Message-ID: <6a65e9f5-1ef6-43fd-8b84-b733016fd7aa@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Oliver and others:

Syzbot has identified a bug in usbcore caused by our assumption that 
bits 4-6 in bEndpointAddress will always be 0.  Note that both the 
USB-2.0 and USB-3.1 specs say these bits are "Reserved, reset to zero".

But we don't check for this.  In particular, the endpoint_is_duplicate() 
routine in config.c compares the bEndpointAddress values of two endpoint 
descriptors without any masking, so differences in the reserved bits 
will cause the routine to think that the endpoints are different even 
when the number and direction bits agree.

There are three obvious ways of dealing with this:

	Reject invalid descriptors in which the reserved bits are 
	nonzero.  This might run into problems if later specifications 
	decide to store real information in those bits.

	Accept the invalid descriptors, but clear the reserved bits in 
	bEndpointAddress while parsing the descriptors.  This could also
	run into problems if those bits get used for something in the
	future.

	Accept the invalid descriptors, but mask out the reserved bits 
	when comparing the addresses in endpoint_is_duplicate().  This 
	might run into problems if any other routines assume that the 
	reserved bits are zero -- there's some questionable code in 
	devio.c's findintfep() and quirk.c's usb_endpoint_is_ignored(), 
	for example.

I'm inclined to go with the first approach.  If a later version of the 
USB spec uses those bits for something, we can adapt to it.

What do you think?

Alan Stern

