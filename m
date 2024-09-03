Return-Path: <linux-usb+bounces-14510-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D13396930E
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 07:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE8DBB21BCD
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 05:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9F51CB527;
	Tue,  3 Sep 2024 05:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rhXcyiOj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7811CDFDD
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 05:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725339683; cv=none; b=ndNvajGvBuGDq8X9j1KbWrgMerKOYrhAS5YayqczmKjQUtETUw/XR+wKONL+07NBIErfc5rO0HkJ+xJjoVniL8m8+bgToJwZi6zOxf+/P8EwPoGevmDr/iHJ8/TNj8izv/ZMr4r7IJYeQIyCN0aEYbnQt9SfTM9C9n533UdlE/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725339683; c=relaxed/simple;
	bh=ZMJnMajbUt93foKRo2W29PWr9qDmGBpxfeA4osXVn0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnrH4hOqmnO5vcX065NZK8jbJpaYDrUuYTWUYeWIVFjkKrp0Qb8rj9wU02RANea/MoB1Nvf2/w0f+BjceKdmG2P59zvS0/tipLdIM4xi1S+FejFmM/sxVukBSTE17SbdSPMCK/q4j02Q2cut/eYMXuKdj8V4JgmHUfGXF9hKsVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rhXcyiOj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E0BC4CEC5;
	Tue,  3 Sep 2024 05:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725339682;
	bh=ZMJnMajbUt93foKRo2W29PWr9qDmGBpxfeA4osXVn0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhXcyiOjAYPNUltv1/b8WKiE7DNEN0+3TU3BEdXIuyy1cy9HbQqECbYF4FzKZfDx1
	 ikTQS8SfYnyxNp9TSekm0k2zV5Udb0XOCsdm4xyrbbbKC47ag2FkcnrVYHucERX3o3
	 tJ80/gJFvs8cvQLGBUYuW+QafPsFn7OTdC+Za16A=
Date: Tue, 3 Sep 2024 07:01:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saad Shabbir <saadshabbir735@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Why it is not sending my simple Mouse
Message-ID: <2024090300-shortness-feminize-9fdc@gregkh>
References: <CAKPak7kA6Xn2Gbrv==CJbyTBHx6V9JyWXPgJPAM3wtfx5ohD_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKPak7kA6Xn2Gbrv==CJbyTBHx6V9JyWXPgJPAM3wtfx5ohD_A@mail.gmail.com>

On Tue, Sep 03, 2024 at 01:50:55AM +0400, Saad Shabbir wrote:
> https://github.com/vadimgrn/usbip-win2/wiki#ude-driver-list-of-devices-known-to-work
> 
> HID_DEVICE_SYSTEM_MOUSE
> HID-compliant mouse
> 
> i cant understand why it is not sending my mouse through the IP.
> 
> it is sending my USB Storage Sandisk,
> 
> C:\Program Files\USBip>usbip.exe list -r 192.168.0.124

There is not much we can do here for Windows questions, sorry.

best of luck!

greg k-h

