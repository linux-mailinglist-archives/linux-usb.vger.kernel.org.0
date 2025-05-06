Return-Path: <linux-usb+bounces-23766-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD04AAC7A4
	for <lists+linux-usb@lfdr.de>; Tue,  6 May 2025 16:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AC083B461E
	for <lists+linux-usb@lfdr.de>; Tue,  6 May 2025 14:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FD8281516;
	Tue,  6 May 2025 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bOOBZH5S"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF4D281503
	for <linux-usb@vger.kernel.org>; Tue,  6 May 2025 14:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540974; cv=none; b=VaVYh5l9tEDi15S2GdIW9gbCv29nUcooPxgi0z47xJUXVxpgHhLJcO7+9gtrXknLWl4wlZk6R00aWXcHnUa5RY/jGjtz6oCE3L25Y5CHPws/Fu86/W/eQ4zFMTRFYuQbrsGOxdt99YzxNToH8eb8pxDZvQNz+xyidri5dc85aVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540974; c=relaxed/simple;
	bh=zk5gSy1hcSc9bs73Qw0GCOjxgqJ+kBRb4B+VmzrsEl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUCbV/gqQ1WAP3JGpgJg6hW9O0MzIi2OYEzmPzJR4anZzjdtWrgwB4ZmlTOzevG3MfPEUx/TakiQj/+jI6Kg9Xh1U9s42uZXtg/eAAd25OXaIShicvHP36XXOBqIVLSFoI0sCVkGmwrnewGsGgeaISkqEBG4sb7rHXYToc3DaEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bOOBZH5S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB3DC4CEEB;
	Tue,  6 May 2025 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746540974;
	bh=zk5gSy1hcSc9bs73Qw0GCOjxgqJ+kBRb4B+VmzrsEl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bOOBZH5SvztpNj+eFugjDp8kyJga786KgIF+d+RTMa2MFYm65DcZwZPIj/VSdcH4k
	 sGe6pF9wywawYF7mSGxwTQdI3zkKAem+CgkSvMFyr3OB0AVBOMYteGTiD9QgGuQhK7
	 UQ1ZEAd7ws3LNUmieIeIx5YKQjr/Cf1Ae4mvmV+4=
Date: Tue, 6 May 2025 16:16:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Asaf Kampf <asaf.kampf@exodigo.ai>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"alon.barlev@gamil.com" <alon.barlev@gamil.com>,
	Yoav Derman <yoav.derman@exodigo.ai>
Subject: Re: ucsi_acpi: crash ucsi_reset_ppm [typec_ucsi]
Message-ID: <2025050621-embody-wobble-3610@gregkh>
References: <DU0P190MB1980848113ED5AD6E39C0A15E189A@DU0P190MB1980.EURP190.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0P190MB1980848113ED5AD6E39C0A15E189A@DU0P190MB1980.EURP190.PROD.OUTLOOK.COM>

On Tue, May 06, 2025 at 01:29:57PM +0000, Asaf Kampf wrote:
> [    0.000000] Linux version 6.11.0-25-generic (buildd@lcy02-amd64-027) (x86_64-linux-gnu-gcc-13 (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #25~24.04.1-Ubuntu SMP PREEMPT_DYNAMIC Tue Apr 15 17:20:50 UTC 2 (Ubuntu 6.11.0-25.25~24.04.1-generic 6.11.11)

This is a very old and obsolete kernel that can only be supported by the
company that provided it to you, sorry.  Please contact them as you are
paying them for support for this old beast.

sorry,

greg k-h

