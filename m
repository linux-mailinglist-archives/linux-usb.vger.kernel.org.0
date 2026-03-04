Return-Path: <linux-usb+bounces-34019-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBDZIyqaqGkGwAAAu9opvQ
	(envelope-from <linux-usb+bounces-34019-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 21:46:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F1A207B24
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 21:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 018B9300F7B5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 20:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6DD3750CA;
	Wed,  4 Mar 2026 20:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EZ6sHSez"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B08C24293C;
	Wed,  4 Mar 2026 20:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772657188; cv=none; b=ExijEkxP1QjN5mylf1ybveMVz8iI1poCcaIvFHfMSH5mDOnM/UE8HIOyNB32lUhx86sXYrh6Vbbl0Ulf5Rp/OIhOZM1ePX/87k7PocdT0WxsXjpA52r+Z0QoAh3d8tu+xEG+nE4qR9y8wQ+St7Emb40oUap5e/fpXjLhAKovWuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772657188; c=relaxed/simple;
	bh=hyjTjj0+B73bWM8z567dz4+PxRwCQl3Y/TAy7WBED8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuhwwO2uEZB+z9EUAjiWRe55xjFOdyMxzyey9CkpydJbhZ/L0NYyyERyTXUO8Sa5LJnetorSRXrdcyet5AAhqtpu9bN4JHp5Okllw1jh4JoDmMIdMQqJ1V0HnHvlWq4GVxY7AXwO6TfM0Ey6ln4qGqPM1Maaiz5cZ2elm4X97Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EZ6sHSez; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EABC4CEF7;
	Wed,  4 Mar 2026 20:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772657188;
	bh=hyjTjj0+B73bWM8z567dz4+PxRwCQl3Y/TAy7WBED8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZ6sHSezrRGJeaaLVTsYiIUp7qOWNS393chb47Z8eI9tU1rlP3tFpWUDTySEDQbon
	 JW/+5wAz+5cmajvyVMs0+MQUlYq8HqPyv6lUWioBhf66LgE5hdmhKfjvHzQsE46MXK
	 UyXwPMx6X8/3xAGhUodUcXiakRcoWoLucdx0oaSg=
Date: Wed, 4 Mar 2026 21:46:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: core: remove unnecessary goto in
 usb_create_newid_files()
Message-ID: <2026030432-thursday-sliced-4963@gregkh>
References: <20260304155812.4559-1-marusik.adamenko@gmail.com>
 <2026030412-trace-sneer-60bf@gregkh>
 <e8e05846-1af7-4cdf-8167-e566cf7db8c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8e05846-1af7-4cdf-8167-e566cf7db8c8@gmail.com>
X-Rspamd-Queue-Id: 25F1A207B24
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34019-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 09:35:42AM -0800, Mark Adamenko wrote:
> Thanks for responding,
> I wasn't suggested by any tool. I was advised that if I want to become a
> contributor, I should start by finding something small,

I recommend starting in drivers/staging/ and not causing unnecessary
churn in other parts of the kernel, as you learn the development
process.  That's what that part of the kernel is for.

Also, please don't top-post :)

thanks,

greg k-h

