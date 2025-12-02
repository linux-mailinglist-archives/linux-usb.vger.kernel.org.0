Return-Path: <linux-usb+bounces-31099-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF01C9AC53
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 10:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0665F346C64
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 09:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93B83081B5;
	Tue,  2 Dec 2025 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p4CY1+K/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF18307AC3;
	Tue,  2 Dec 2025 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764666056; cv=none; b=Br10QjpuWHY71uNQRzoe7g0bNahGMHWSpmjWE+VRszCJ8fCt8FNQV2JEuF/ZqRPBY7jaPYhtiJBMNIebRiJAQAMB7kJ4ZdgIr0l8m3LqAdRQ26aOtgUck2YFWMfpvWjO+3oGIgZ1SdjAW9TFf5fkRVLHjoC71Fmbaoqhp+XSZQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764666056; c=relaxed/simple;
	bh=6ieTPrgYGeHuzzDiXjmDJ/kMBPnVW5lRfNkQC1Nyp44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPuQUpw41R+B8xPtkOfuyx2Ov4Y2mJGliQiTWMKF766NQf19Lpyq/yb+GtCc1wDAr0tUFaSNR266+Sf23iygrax9VGMn23rQ481Kc1k056E1VFK4WEhwafyo9SKGTFpkhscd016/GE5CY8UlychIIx51qMXeuX+gq1NzThHsSTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p4CY1+K/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509D3C116D0;
	Tue,  2 Dec 2025 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764666055;
	bh=6ieTPrgYGeHuzzDiXjmDJ/kMBPnVW5lRfNkQC1Nyp44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4CY1+K/aJBlUPf7ZSsxt14o8juFtlG2zTQIIZo19EuHHjhob5hP40CGppmgY6swy
	 7Jd0bsnfn0xwmounTfhyXSsVvWzk/aJc9BKF3vNdqFvzoaTc+t923s/jLJ3g51vdpL
	 D/NGjwOqAy+XEUM5U6vOxrCJxWtiTv28O83m5aG4=
Date: Tue, 2 Dec 2025 10:00:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yi Cong <cong.yi@linux.dev>
Cc: stern@rowland.harvard.edu, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, yicong@kylinos.cn
Subject: Re: [PATCH] usb: linux/usb.h: Correct the description of the
 usb_device_driver member
Message-ID: <2025120247-gong-ranger-619c@gregkh>
References: <89c7cb17-c5bd-47e6-96b8-1108966b545d@rowland.harvard.edu>
 <20251202065917.309025-1-cong.yi@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202065917.309025-1-cong.yi@linux.dev>

On Tue, Dec 02, 2025 at 02:59:17PM +0800, Yi Cong wrote:
> On Mon, 1 Dec 2025 10:14:04 -0500, Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Mon, Dec 01, 2025 at 04:53:09PM +0800, Yi Cong wrote:
> > > From: Yi Cong <yicong@kylinos.cn>
> > >
> > > In the current kernel USB device driver code, only the name field is
> > > required to be provided; all other fields are optional.
> > > Use the command grep -rnw "struct usb_device_driver" to inspect
> > > how specific drivers are declared.
> >
> > That last sentence should not be part of the patch description; it
> > doesn't explain the patch's purpose or what the patch does.  (It's not
> > even correct, because the grep output doesn't show how the specific
> > drivers are declared.  It mainly shows the filenames and line numbers
> > where the declarations start.)
> >
> 
> Thank you for the reply!
> Do I need to update the commit message and send a new version of the patch?

Yes please.

