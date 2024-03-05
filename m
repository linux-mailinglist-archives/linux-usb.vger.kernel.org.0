Return-Path: <linux-usb+bounces-7577-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A28872A42
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 23:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6A35B285D0
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 22:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B515D3D0CA;
	Tue,  5 Mar 2024 22:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RE8tmbbc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D637E563
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709678172; cv=none; b=CWNMBl4t25mfq/GELqrzqPOVc3tQ9x5OPx6kd4TLOWIDqhC2O43ym/AEGaZsSJrOjacY953dyANnzS9Qgw8lCW6z5bHB5+sq3Gu+uKi6fkBIR3+9riJ6WR+zWd88asofqNEytLrddvLZO1J+hE59Y3w91lrP/5NqaFWZJ6Fb5xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709678172; c=relaxed/simple;
	bh=g55cu2cg6/g5DxUZcaY/hxqidlXJ4vwTOT97PDU99Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSW8aDbCl5sVYml7YjulykfSDwNQ3vprp/TCudCn87labfyCXmYxKi9vPcCOSzMrDpNsutUjbjiddfQ7ELNkwtY32vKjxmImq3QF5Lcp3OGz7jMey8V82VYomBmwahd+FtMiDmU+gw7rp7KWOzBr1voF2URnveKmzteiaN+Td+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RE8tmbbc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610CCC433C7;
	Tue,  5 Mar 2024 22:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709678171;
	bh=g55cu2cg6/g5DxUZcaY/hxqidlXJ4vwTOT97PDU99Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RE8tmbbcJCPatJ0bm2DbZCTtsCMeDPXd4v/yhJ5eIJ0csY3J47QyDdmQPfdqlXBwY
	 48RjPFc3ydjUA+0ND9WtQtMG9Z3Gfqtb39tVLP+LVXyoGLs5eIGkfYbfjIEjwA3PRb
	 VB2AHU4TtyFlRfIeF4u0le/9vdtH0MACGaZbiqfY=
Date: Tue, 5 Mar 2024 22:36:09 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Elbert Mai <code@elbertmai.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] usb: Export BOS descriptor to sysfs
Message-ID: <2024030535-bobsled-kinsman-330c@gregkh>
References: <20240305193356.118229-1-code@elbertmai.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305193356.118229-1-code@elbertmai.com>

On Tue, Mar 05, 2024 at 11:33:56AM -0800, Elbert Mai wrote:

<snip>

For some reason you forgot to cc: linux-usb@vger.kernel.org and only
sent this to me.  Added it back now...

> ---
> Changes in v3:
>  - Cosmetic only. Made a comment less confusing.
> Changes in v2:
>  - Rename to bos_descriptors (plural) since the attribute contains the
>    entire BOS, not just the first descriptor in it.
>  - Use binary attribute groups to let driver core handle attribute
>    creation for both descriptors and bos_descriptors.
>  - The attribute is visible in sysfs only if the BOS is present in the
>    USB device.
> 
> I've ran the prior patches against scripts/checkpatch.pl and it seems to be
> okay with the comment style. But I agree the comment could use some work.
> The point of the comment was to show that not checking for the descriptors
> attribute is intentional and not an oversight.
> 
> So here's a follow-on patch that hopefully made that particular comment a
> bit less confusing. Nothing else was changed.

I already applied your v2 patch, so I need a commit that goes on top of
that, unless you want me to revert your patch from the tree (I'd not
recommend that.)

Also, one thing:

> diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
> index 614d216dff1d..102ee4215e48 100644
> --- a/Documentation/ABI/testing/sysfs-bus-usb
> +++ b/Documentation/ABI/testing/sysfs-bus-usb
> @@ -293,3 +293,13 @@ Description:
>  		USB 3.2 adds Dual-lane support, 2 rx and 2 tx -lanes over Type-C.
>  		Inter-Chip SSIC devices support asymmetric lanes up to 4 lanes per
>  		direction. Devices before USB 3.2 are single lane (tx_lanes = 1)
> +
> +What:		/sys/bus/usb/devices/.../bos_descriptors
> +Date:		March 2024
> +Contact:	Elbert Mai <code@elbertmai.com>
> +Description:
> +		Binary file containing the cached binary device object store (BOS)
> +		of the device. This consists of the BOS descriptor followed by the
> +		set of device capability descriptors. All descriptors read from
> +		this file are in bus-endian format. Note that the kernel will not
> +		request the BOS from a device if its bcdUSB is less than 0x0201.

I moved this to the entry after the "descriptors" description in this
file, and dropped the "..." portion to show the correct string, as the
"..." doesn't make sense here, right?

thanks,

greg k-h

