Return-Path: <linux-usb+bounces-37468-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCv3J/rKBmrynwIAu9opvQ
	(envelope-from <linux-usb+bounces-37468-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:27:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 632F454A8DE
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FADD30313A1
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C0E3E8C72;
	Fri, 15 May 2026 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLfpUYxt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9A93E9593;
	Fri, 15 May 2026 07:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830050; cv=none; b=UObQE2eZj2TrEVRfQyNJja45/XZHjLC5ls4z02BDFQ3ZvCGfQPNj4xU6xB4SxnpU1Rp0ea7dFJwo9Q8PzyrESoYdUYHK6mmOGiWuMiFPevJtFI7Y5GB2UA8rbtyiyOIZfcRuF1Ug5YvavB7tX9pDpginvw3rPqdP1BtNt1jyttE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830050; c=relaxed/simple;
	bh=C2MzLl5tVNoBX7fGXcA3mC1gjoODAPzIe6kg0I7sAUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrhgR/B7uhy3j0F9j4Nwp2fCSlwMIoewAeJpq0tWQRzjd4ZS/P4lPTxbsQNzytnDarLEo4RxFZlSak/om6zcspb/tX5QGtElkW46/1bgKJBCOBC5ozIzVkfCWwqQRtV3ct/FljBARt4ohPi/sAssc+kAvO3ElhHxzEVCPH8NRxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLfpUYxt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AECC2BCB0;
	Fri, 15 May 2026 07:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778830050;
	bh=C2MzLl5tVNoBX7fGXcA3mC1gjoODAPzIe6kg0I7sAUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLfpUYxtRrvhT3tg0kp1gG2re6deAp4LblHz+M96CRWXpijoTBrJ7bi5ZvbcFiLyA
	 XWXfbn3y4tmTIZKbZAqKXupoeMGA2tf4iFr8ljIf8NtWamgzchOeypeClsoA9bwV87
	 eUaGjk9ZtgKiZGa2R9CFFALEhM0cBKqFADisutB6Bv9Ni2qufdN9ywajsV+DICjmaM
	 Pa8mUjee6f+9mbtDveUbxtYpu9SRU9a9i4FoMSu6wX0wvXC4XW0utpfo3UXdOLmpUx
	 LZLX13QNgHjTu7Oe4WoT52PF5hGUTzHXHle/x3IqJGPRUxzxpK4apFxzUYhig+JHLD
	 KaWeBy7dg+Dmw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wNmxD-00000000LKM-3IBH;
	Fri, 15 May 2026 09:27:27 +0200
Date: Fri, 15 May 2026 09:27:27 +0200
From: Johan Hovold <johan@kernel.org>
To: zwq2226404116@163.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: Re: [PATCH v4] USB: serial: option: Add missing RSVD(5) flag for
 Rolling RW135R-GL
Message-ID: <agbK37fGBbiSCn3I@hovoldconsulting.com>
References: <20260515033105.7746-1-zwq2226404116@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515033105.7746-1-zwq2226404116@163.com>
X-Rspamd-Queue-Id: 632F454A8DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37468-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 11:31:05AM +0800, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
> 
> The RW135R-GL MBIM interface entry was missing the .driver_info = RSVD(5) flag.
> 
> Without this flag, the option driver binds to the MBIM interface
> and conflicts with the cdc_mbim driver, causing AT/MBIM communication
> failures. This matches the handling of other Rolling Wireless MBIM devices.

Please reply to this mail and explain why you think reserving interface
number 5 (i.e. the ADB interface) prevents the driver to binding to the
non-vendor MBIM interfaces number 0 and 1.

Don't send any new versions until you've explained this.
 
> This patch adds the missing RSVD(5) quirk for Rolling RW135R-GL (33f8:1003)
> to prevent the option driver from probing the MBIM control interface,
> which avoids conflicts with cdc_mbim and fixes communication failures.
> 
> This aligns with the configuration used by all other Rolling Wireless MBIM modems.
> 
> v4:
> - Fixes tag corrected

No, it's still using the wrong summary (i.e. the text inside
parenthesis). I already sent you the right one in an earlier reply, but
you can also look it up using git log.

> - Device table entry formatting aligned with existing pattern

Move the changelog after the --- line.

You also removed the usb-devices output from the commit message. Please
add it back.
 
> Tested successfully on multiple interface configurations:
> - mbim + diag + AT + pipe
> - mbim + diag + AT + ADB + pipe
> - mbim + pipe
> 
> Fixes: 01e8d0f74222 ("usb: serial: add support for Rolling Wireless RW135R-GL (33f8:1003)")
> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
> ---
>  drivers/usb/serial/option.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Johan

