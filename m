Return-Path: <linux-usb+bounces-8371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF82A88BDF0
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 10:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCD531C2CBC7
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 09:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25A55D480;
	Tue, 26 Mar 2024 09:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GRnO7qEe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1088C54BF0
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711444956; cv=none; b=VBN1FLMBKa04ZeN8wPud/fDzpFra40D7Wa4OL30Fvk2bO5px6MXhj75Erf7inDvqAIy5PP03UWk6c8cGy7YqhryKi/EWwwivvKYj4Kn0KSrBEy0NuKGxnJ4fBOJJXlkfwpw7vPD/rFfTT0uRGsfo1/djClN6t7m5JYEjU/rby9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711444956; c=relaxed/simple;
	bh=6mSWMQvCKrkHXni1J4QY1YHn2cOY4eErD6f0NKuLJjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLFrNPrHOaK1aslj2det2GteTy3VVNLylq4Um5ZJUMX6+VmHzKIvEsNFrJujZjO3YI9URs4Qrr1FCmCvljLZhL2xcTGZ0kphBN73ls/RpI3RdALIV0cTDp4pYOfW/PiDGB3UT+ZFEurV3WALr2I54BLu7kgS1JE/lC1QDv6eaTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GRnO7qEe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2851FC433C7;
	Tue, 26 Mar 2024 09:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711444955;
	bh=6mSWMQvCKrkHXni1J4QY1YHn2cOY4eErD6f0NKuLJjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRnO7qEeqvpt1vr2HyUMJSYTFLQt2j2O0Rr6vYpGHId6sXigKAM4GsoOECt7xyRG0
	 lGtdEYvvWIOasNbHIwAXBusVY5oM2Er9NO2zeyhJXa0fKpO3C5T5EC+UGAQYOtHdjd
	 rJhtDSmos02vrEenXY92SJkWHZSwns7Vs9BV+JdI=
Date: Tue, 26 Mar 2024 10:22:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] USB: core: Fix deadlock in port "disable" sysfs
 attribute
Message-ID: <2024032610-uptown-mammary-f0fb@gregkh>
References: <604da420-ae8a-4a9e-91a4-2d511ff404fb@rowland.harvard.edu>
 <f7a8c135-a495-4ce6-bd49-405a45e7ea9a@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7a8c135-a495-4ce6-bd49-405a45e7ea9a@rowland.harvard.edu>

On Fri, Mar 15, 2024 at 01:06:33PM -0400, Alan Stern wrote:
> The show and store callback routines for the "disable" sysfs attribute
> file in port.c acquire the device lock for the port's parent hub
> device.  This can cause problems if another process has locked the hub
> to remove it or change its configuration:
> 
> 	Removing the hub or changing its configuration requires the
> 	hub interface to be removed, which requires the port device
> 	to be removed, and device_del() waits until all outstanding
> 	sysfs attribute callbacks for the ports have returned.  The
> 	lock can't be released until then.
> 
> 	But the disable_show() or disable_store() routine can't return
> 	until after it has acquired the lock.
> 
> The resulting deadlock can be avoided by calling
> sysfs_break_active_protection().  This will cause the sysfs core not
> to wait for the attribute's callback routine to return, allowing the
> removal to proceed.  The disadvantage is that after making this call,
> there is no guarantee that the hub structure won't be deallocated at
> any moment.  To prevent this, we have to acquire a reference to it
> first by calling hub_get().
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Cc: <stable@vger.kernel.org>	# Needs the previous patch in this series

What "previous patch"?  I don't see this as a series even on
lore.kernel.org.

confused,

greg k-h

