Return-Path: <linux-usb+bounces-6889-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C573985FACA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 15:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65BB31F219FC
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 14:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FD313AA48;
	Thu, 22 Feb 2024 14:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gQDn0V9i"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C40137C31
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708610816; cv=none; b=eoxpIR5kydkxoy+alLtos0DqIY319tWHcwgxsj8EelqeX8y36vn47GdYPvv3TubKJSXcV3vL7F6vJ22OhuoMz9eZKyW8cm/e2FobNcVieERhnTVqeL3KHZorLW+oqxah3miUBsOyRJD6Q95W6kn8xAT61TOMuLU/QdNWB34bdLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708610816; c=relaxed/simple;
	bh=BbhVA6T1YOwq5lQ/N7dR7+msu9fLXXqG7J8o/dm45dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJCjrWoMESowxN7x6jNHqw+winwtJBzwJlwZgCkzKdXNUKhYyKXe+U5hsK/fn7KOcyXjTGqQex05+zFkLryjv16djuRiZD4HNe2Hx/7a3H4JVfnjf5v+ZmXst5tzhEvFBnjSz6VQiE8vU0y1BODN4TfGx45OhSQpRQcNK6FxUVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gQDn0V9i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0370C433F1;
	Thu, 22 Feb 2024 14:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708610816;
	bh=BbhVA6T1YOwq5lQ/N7dR7+msu9fLXXqG7J8o/dm45dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQDn0V9i/SeYAqLA/PTNDtc7qmg4T4XFiHO95qCQxpURLv+Ps7o/w+6YI9fsCJB/J
	 VVrtgzWwfrf6p9G1Mzhw9T/G0fAEuEjrwW/LSPRU8UtSZN0Zq0Rx4s6md284Rrj8iB
	 s2u4QG+rNdMUmufh3o73GltqF+YF1pMk05tdIBRM=
Date: Thu, 22 Feb 2024 15:06:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Subject: Re: [PATCH 1/2] usb: usb-acpi: Set port connect type of not
 connectable ports correctly
Message-ID: <2024022238-caddie-fanning-8ab5@gregkh>
References: <20240222133819.4149388-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222133819.4149388-1-mathias.nyman@linux.intel.com>

On Thu, Feb 22, 2024 at 03:38:18PM +0200, Mathias Nyman wrote:
> Ports with  _UPC (USB Port Capability) ACPI objects stating they are
> "not connectable" are not wired to any connector or internal device.
> They only exist inside the host controller.
> 
> These ports may not have an ACPI _PLD (Physical Location of Device)
> object.
> 
> Rework the code so that _UPC is read even if _PLD does not exist, and
> make sure the port->connect_type is set to "USB_PORT_NOT_USED" instead
> of "USB_PORT_CONNECT_TYPE_UNKNOWN".
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Does patch 2/2 need this?  If so, why isn't it marked for stable?

thanks,

greg k-h

