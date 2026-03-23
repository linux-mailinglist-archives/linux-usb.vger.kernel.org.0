Return-Path: <linux-usb+bounces-35326-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCFPDvsfwWmTQwQAu9opvQ
	(envelope-from <linux-usb+bounces-35326-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 12:11:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D82F0F26
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 12:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C029301FD87
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 11:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586C7392828;
	Mon, 23 Mar 2026 11:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LOitR/Uw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC89435DA48
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263668; cv=none; b=H+lp+Dc8fvB4Z+NU3z+Cg8Ed4nQYu02vnX42dyrcBVuGT12f0YBdhJQzCnh+4DouoLr+0DaGZyJh4xORPGaRzVZlqFqVx8erjjYlwNK41rcCEbfUWL4FvDBhG9eZu0TXxmYO1BlUqVUneWhRzNgNKx7CXidMBF+1fP+IKf9SaVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263668; c=relaxed/simple;
	bh=nmrGbv7YSi00bJuhRth1MHe2mzP+KJM+8bqSrfs7Up8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMFTGnKzbyNwKz6P2kMbFYkHP1B47y3bUv8ocuBikEQnXKlebTrBbEc3w1U3mqNviBC8nmKPJbZeYYS9BfrQI7Lb6eTvvPgVGS1Y5JDWTJZnWUQj2TDav81GHLkEJ1vgMJJf3N2Iw15cW1FavJDFomjiCHW+WuCyBpqNX9Q6Cfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LOitR/Uw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9D8C4CEF7;
	Mon, 23 Mar 2026 11:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774263668;
	bh=nmrGbv7YSi00bJuhRth1MHe2mzP+KJM+8bqSrfs7Up8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOitR/UwO/ZtWgoDNikgpfaOUURqe/BxE4cLq4G7vKmOCmSRb/YRbKeFwCuh3ekrQ
	 /JIBud2opHA/Yxs7KqUF48jtzSlM1VuOrHghWVZVQ/gwg36nNWkuwCFNhqhqKh9Cjz
	 VKQ8/V0Ed9JJXUqAbtEqjxPISgg8UQqI6Je/rgG4=
Date: Mon, 23 Mar 2026 12:00:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Zimmermann <sigmaepsilon92@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Oops when rebinding f_hid while /dev/hidg* is still opened
Message-ID: <2026032337-resend-recolor-efc5@gregkh>
References: <CAN9vWD+13DHCyjq+7hYgTSDx87TLtKXV9-8GMnZPuZnYvjyANA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN9vWD+13DHCyjq+7hYgTSDx87TLtKXV9-8GMnZPuZnYvjyANA@mail.gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35326-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D0D82F0F26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 03:01:19PM +0100, Michael Zimmermann wrote:
> The steps are as follows:
> - setup an hid gadget via configfs
> - bind it via the UDC file
> - open /dev/hidg0
> - unbind it via the UDC file
> - bind it via the UDC file
> - close /dev/hidg0
> 
> This results in an oops (on a Raspberry Pi 4 running Fedora 43 with
> kernel 6.17.1-300.fc43.aarch64):
> + echo fe980000.usb
> [  273.407057] dwc2 fe980000.usb: bound driver configfs-gadget.g1
> + sleep 3
> [  273.624208] dwc2 fe980000.usb: new device is high-speed
> [  273.748314] dwc2 fe980000.usb: new device is high-speed
> [  273.811272] dwc2 fe980000.usb: new address 30

This bug has happened a lot on many gadget drivers, I think we fixed a
bunch of them already, can you verify this is still an issue on the
latest 7.0-rc4 or 6.19.y kernel release (6.17 is very old and obsolete
and insecure, don't run that thing...)

thanks,

greg k-h

