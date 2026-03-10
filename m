Return-Path: <linux-usb+bounces-34387-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOuAKtrcr2kzdAIAu9opvQ
	(envelope-from <linux-usb+bounces-34387-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 09:56:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3601A247BA2
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 09:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AFA83003361
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 08:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADCA43C041;
	Tue, 10 Mar 2026 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arGnJWmx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEC13EDAB3;
	Tue, 10 Mar 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133011; cv=none; b=j+ki8FCsNy875/LtGBzghK/udJpRdbV9Wt0Jebn0cyRmjow2Z7gJ0yzhdcO9ad7Q8zSeR4iBjjCOeKg/7VwPcN4hn/D4w+bva8kiebW5YuidlvVifpTSTzupiHLnaEdpgJmhPCzR24OcuavDydoB4gO6NN3qD6GfTQxt1JgSFas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133011; c=relaxed/simple;
	bh=1PWoJHaon6nzdJBMh/5s/5A0x05ZpBntcw1fR6glc8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxrXBaXaN4tJbp2xy8V81o/40M0rJ7jsPYBJHzTDK0eW8DlYnvh9VzWp7iAX2eoLsn8H3TaH9AhpgZwZbtcX4bhbatYV9kVVGz5lohYd9mTqV+jlqw/N0eMWl+17Pau+xiA+SeLlE/ifa5g3GqTZ9NPNLkjJ9sWLYzv9gbD+HbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arGnJWmx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD4CC19423;
	Tue, 10 Mar 2026 08:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133010;
	bh=1PWoJHaon6nzdJBMh/5s/5A0x05ZpBntcw1fR6glc8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arGnJWmx1ZjZDejaTOe3qsJV164WQsdvrO0l22Snjl0d+TMWSeiJvardY2wUqFLqx
	 Drr4SlA9ZD3DYt6/F8sPcTjyiaCKQAwQDM0nVfESKY6gwL70MaBHGca6Ghytv5+FM4
	 fRdvBFbTlVBGaTZ5jPBtYkBu6lKtnp1Dna3e96FZpem7PuABgeT4Il9HipJng8U+fF
	 /5AESGuZh4XBnqcPTQi+kCwnv9o8u3QXS56ljNhe1C9b+gHxOMxrYaTZEh5RTTP+K1
	 t7mpUGogxyOQ34vrqv+hikNfTMzEd6EUb67sMLy1benzxfk+ZA2JYTw2cSsY5CbCxD
	 RPZAGLC2Ssufw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vzstU-000000007qz-0FJm;
	Tue, 10 Mar 2026 09:56:48 +0100
Date: Tue, 10 Mar 2026 09:56:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: opticon: fix UAF in write callback during
 port removal
Message-ID: <aa_c0B9E7MPm_yqL@hovoldconsulting.com>
References: <20260309142757.589802-1-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309142757.589802-1-fanwu01@zju.edu.cn>
X-Rspamd-Queue-Id: 3601A247BA2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34387-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,hovoldconsulting.com:mid,zju.edu.cn:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 02:27:57PM +0000, Fan Wu wrote:
> The opticon driver anchors write URBs to priv->anchor in opticon_write()
> and frees priv in opticon_port_remove() without first killing these
> anchored URBs. The completion callback opticon_write_control_callback()
> may dereference priv via usb_get_serial_port_data() and access
> priv->lock, priv->outstanding_urbs, and priv->outstanding_bytes after
> it has been freed.
> 
> If a write URB is in flight when the port is removed:
> 
>     CPU 0 (remove path)              CPU 1 (URB completion)
>     ---------------------            ---------------------
>     opticon_port_remove()
>       kfree(priv)  <--+
>                      |  --> opticon_write_control_callback()
>                      |        priv = usb_get_serial_port_data()
>                      |        spin_lock_irqsave(&priv->lock)
>                      |        --priv->outstanding_urbs  // possible UAF
>     return           |
>                      usb_free_urb()

This cannot happen as ports are always shut down before being
deregistered (see usb_serial_disconnect()).

It used to be possible to trigger something like this by manually
unbinding a port device through sysfs as root but even that's no longer
possible since commit fdb838efa31e ("USB: serial: suppress driver bind
attributes").

> Fix this by calling usb_kill_anchored_urbs(&priv->anchor) before
> kfree(priv) so that all in-flight URBs have finished before the private
> data is freed.
> 
> Note that opticon_close() already correctly kills anchored URBs; this
> fix addresses the port_remove path which was overlooked.
> 
> Fixes: 648d4e16567e ("USB: serial: opticon: add write support")
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>

How was this potential issue found? Are you using some kind of LLM or
other tool?

Johan

