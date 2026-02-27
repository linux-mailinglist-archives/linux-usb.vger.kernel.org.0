Return-Path: <linux-usb+bounces-33798-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INEQEvj9oWl4yAQAu9opvQ
	(envelope-from <linux-usb+bounces-33798-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 21:26:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9261BD9C9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 21:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF41230304AE
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 20:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9BA472788;
	Fri, 27 Feb 2026 20:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VzviUwIz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B0B3290C1;
	Fri, 27 Feb 2026 20:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772223985; cv=none; b=ln2E9cURPoGfDEHaSKrCLfNHMy8X3+nrIHCmPH0e7eldBKXz+IFPKuU/CnCPMCy+KR/nFm0z4QkTBkZoyg806OZL4sje11kaY+QeWql48X4EhftaMNRwr2xHavaseyGt4RHx6HD+aEqtkva05OXVpi2qmEpTiIeI1wHsOXIsamw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772223985; c=relaxed/simple;
	bh=2unjpw8DYYvP44oUA9VOrWv0VZGOIiDcwlO4Tig27pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZO3c1oAg1dC81LbfbA773MAwSls8Mmc6cUF4wOJYKGu+tp8cnuP6sXNCxjLDM6t4m3f32wY76ayzOLRlxeGGEQynoyEOgNGLrIEStce7tkVhZZMgaWqy4bnDPREXEyBXysp4FKmq1nXrpvuL3j9Wvh1fqGge7P3xAF0oeP8o/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VzviUwIz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B541C116C6;
	Fri, 27 Feb 2026 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772223984;
	bh=2unjpw8DYYvP44oUA9VOrWv0VZGOIiDcwlO4Tig27pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VzviUwIzABAPtz2kBrHyrSWtO2oFd8WwGbowaToY1hnelrcs2UHsXsEwHgA3Kwjgj
	 P+iBhz1EyjZVywwAw7Ga96yxXwpYN5J1jTZjPtzx0X3I3W2wJ44/Ql8w2IsbptEuxG
	 FSjlYINxaZHq39v4lv7Uc3HEWeh1J5g4je+Rgi+s=
Date: Fri, 27 Feb 2026 15:26:14 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkata Swamy Kassa <venkatswamy7@gmail.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
Subject: Re: [PATCH] usb: typec: hd3ss3220: Add sysfs attribute for USB role
 state
Message-ID: <2026022737-bunion-preflight-6a20@gregkh>
References: <20260227182454.761925-1-venkata.swamy.kassa@hexagon.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227182454.761925-1-venkata.swamy.kassa@hexagon.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33798-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: CC9261BD9C9
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 06:24:54PM +0000, Venkata Swamy Kassa wrote:
> The HD3SS3220 driver correctly detects USB Type-C cable attach/detach
> events and propagates the role to the USB controller. However, there is
> no way for userspace to query the current role state (device/host/none).
> 
> This becomes problematic when using udev rules to trigger scripts on
> role changes. The driver generates kobject change events, but the event
> itself doesn't contain the role information. Userspace needs to read
> the current state to determine the appropriate action.
> 
> Add a 'usb_role' sysfs attribute that exposes the current USB role as
> a string ("device", "host", or "none"). Also ensure sysfs_notify() and
> kobject_uevent() are called when the role changes, enabling userspace
> applications to poll() on the sysfs file or receive udev events.
> 
> This is useful for systems that need to:
> - Start/stop USB gadget functions based on cable connection
> - Switch between host and device modes dynamically
> - Monitor USB Type-C port state from userspace

Did you send 2 copies of this?

> Signed-off-by: Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
> ---
>  drivers/usb/typec/hd3ss3220.c | 32 ++++++++++++++++++++++++++++++++

You have to document new sysfs files.

But really, you just created a new user/kernel api for just a single
driver, are you sure that is a good idea?  Shouldn't you be using the
standard api for this instead as this is something that all of these
drivers need to handle.

And finally, a code comment:

>  static void output_poll_execute(struct work_struct *work)
> @@ -310,6 +336,12 @@ static int hd3ss3220_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto err_unreg_port;
>  
> +	ret = devm_device_add_group(&client->dev, &hd3ss3220_attr_group);

You just raced userspace and lost.  Please, if you are creating sysfs
files, do it as a default group for the driver, the sysfs core will
handle the logic for that properly instead.

thanks,

greg k-h

