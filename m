Return-Path: <linux-usb+bounces-3888-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD850809CFD
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 08:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF0A91C20A5D
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 07:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61556101C9;
	Fri,  8 Dec 2023 07:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GuLLSIeJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4121F9D9
	for <linux-usb@vger.kernel.org>; Fri,  8 Dec 2023 07:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03163C433C8;
	Fri,  8 Dec 2023 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702019798;
	bh=5YUK8t9w037n35AhBalBiJVBnjskQoBHjAItMuNrfFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GuLLSIeJlAqkSkbdmyrerToxCOFUimcTX1TLNzeTTntMT6ft7GS39COWhNBNTC20G
	 XPV8F09wG27UAyYhCowm/1RM3gdI0rBEte61oDGRQQXrtC5nIXcQNdcPdzCbJqdCAe
	 cB9rmqd6FSvlWQdxWqhZ6h0/tbAmCeySrmuqAeG0=
Date: Fri, 8 Dec 2023 08:16:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Douglas Gilbert <dgilbert@interlog.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [Announce] lsucpd release 0.91 utility for USB Type-C
Message-ID: <2023120804-chowder-sampling-8ebb@gregkh>
References: <5f74a231-e0c2-4be6-ab90-6592f7cfa8df@interlog.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f74a231-e0c2-4be6-ab90-6592f7cfa8df@interlog.com>

On Fri, Dec 08, 2023 at 01:36:02AM -0500, Douglas Gilbert wrote:
> lsucpd is a command line utility for listing USB Type-C ports, partners
> and any associated PD objects. It is essentially data-mining the
> /sys/class/typec and /sys/class/usb_power_delivery directories. So
> lsucpd performs no magic and root permissions are not required.
> 
> lsucpd was originally announced in this post on 28 August 2023:
>   https://marc.info/?l=linux-usb&m=169325926403279&w=2
> That code has been tagged as 'r0.89'. There is also a 'r0.90' tag
> but it was not announced. This release is tagged as 'r0.91'. The
> code is available at this git mirror at:
>     https://github.com/doug-gilbert/lsucpd
> 
> Changelog since 0.89 [20230827] [svn: r9]
>   - add the first stage of JSON support
>   - add --pdo-snk= and --pdo-src= options to decode PDOs
>   - add --rdo= option to decode RDOs
>   - make preparations for PD revision 3.2

Nice!  Any thoughts about adding this functionality to the usbutils
package to make it all in one place?

thanks,

greg k-h

