Return-Path: <linux-usb+bounces-31915-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2318ACF3B05
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 14:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C5A1306F260
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 12:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE37A33468A;
	Mon,  5 Jan 2026 12:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EIly0e4B"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F1F333739;
	Mon,  5 Jan 2026 12:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767617016; cv=none; b=alL0mX9GJ0s0GNm0JYmizb4sCiJRFzD/7fBTJFcqM5KWYswNd6grSrI+jWvUp1PaEZHtSi/nxTKslM7EmO/qUXQj8yn/rrWuIMb2zg6d6rj7AP345A+T+bBcAm8uXRyO+1joLm7+T9dLJbFXk5mltX+XUgyHJFBI9Yj73BK+n8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767617016; c=relaxed/simple;
	bh=7VCroK5P5aS7SrkgzF7tTIz8dSPZ5zIxqE9VnbURsn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxpH2/sNydtwIjZH+0BarK7nk3kQzBQdbiUoe/CsQppmDC1BBfBV3KdxTjvDFBMILeLugPEZ4E6l736Of483jnXvGNkFQfPZ85GfQqvenzb2eZ/E8pcsQfF0KtiauDboerYa8rq+bXjeSPSD2daVMUZjop0rpF4uxzEgTj0w/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EIly0e4B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77EDCC116D0;
	Mon,  5 Jan 2026 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767617016;
	bh=7VCroK5P5aS7SrkgzF7tTIz8dSPZ5zIxqE9VnbURsn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIly0e4BMugq252tVtf9sP8Pr89BnvbFdQNRPd8XVzCB/Kc1bU1noMSdDL5k1P1HD
	 CobLQGyZmOQheyQJ8KBWRrWxblni4J/f88GySinELC8x/4hroH/i3Tr71Zse9FYBwn
	 83CVHC4ibDFV9VWZt9PePKEkxLWeH/RqWIxhsUw0=
Date: Mon, 5 Jan 2026 13:43:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: dwc3: Log dwc3 instance name in traces
Message-ID: <2026010515-profile-overhead-a90f@gregkh>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <20260105115325.1765176-4-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105115325.1765176-4-prashanth.k@oss.qualcomm.com>

On Mon, Jan 05, 2026 at 05:23:25PM +0530, Prashanth K wrote:
> When multiple DWC3 controllers are being used, trace events from
> different instances get mixed up making debugging difficult as
> there's no way to distinguish which instance generated the trace.
> 
> Append the base address of dwc3 controller to trace events, so that
> the source instance is clearly identifiable.
> 
> Example trace output,
> before ->  dwc3_event: event (00000101): Reset [U0]
> after  ->  dwc3_event: 0a600000: event (00000101): Reset [U0]

Why not use the device name instead?  That will be unique in the system.

thanks,

greg k-h

