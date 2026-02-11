Return-Path: <linux-usb+bounces-33283-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHFKHetljGkFmgAAu9opvQ
	(envelope-from <linux-usb+bounces-33283-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 12:20:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C0123CFA
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 12:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB71F30045AE
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 11:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB37A36BCCF;
	Wed, 11 Feb 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z0MvZcBz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C2305E3B;
	Wed, 11 Feb 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808782; cv=none; b=MihfvMAMH9Wx36HG/GWEECgcmQFBd74xT8mMuOwbqgySC2WMu1epXVZap3BwR6Q7ifnB9p7fzvsLl9pBNX7W5vcpl/oasfj7l7oQnMHFPAyjHQoWzljc5P81eK3xmn3kZieCQj9DHvuzsKBSeO1K2uQHGI4QrcwVbn/rqfz5Pu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808782; c=relaxed/simple;
	bh=DzzyTELpgXsMtGnk5iF4hSBn6JjpWYLTSBVB+t5iEKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqX2vSU8Z5zzpWqTg+aoPNNhVOr0l9cc1nrRdNXqrEE5vemQ/0A7GVTkxEjFnQAoDGJiBrMTgeJgKxbRRmciSrMPPSp6d8JfDaTkew3IO8P65LCKQMxtYcbHm80iTfvdzqkoejVQ43bdV7P3bN5MhesYZUmwzw6utWpGczFvuYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z0MvZcBz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E14EC19424;
	Wed, 11 Feb 2026 11:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770808782;
	bh=DzzyTELpgXsMtGnk5iF4hSBn6JjpWYLTSBVB+t5iEKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0MvZcBzrPpAZgGEjx8QXw8uVmTQeYITIPoYKm/E9qwUzhrdniXiGuPcn9tS8yae2
	 9MjGuKcFaNi4ln6jOwbHMWKT3dBko0cBr2ZuTK9MwAqzDLVaieKd3ZWnJ9aLRc2B9E
	 Yhm0MDc78sFkeZfNCRp3iK38QJYevVKytggIWxf4=
Date: Wed, 11 Feb 2026 12:19:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: m.grzeschik@pengutronix.de, stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <2026021130-seminar-comma-5a7d@gregkh>
References: <20260211103628.3265850-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211103628.3265850-1-xu.yang_2@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33283-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: DF8C0123CFA
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 06:36:28PM +0800, Xu Yang wrote:
> When disable the root hub port, somehow the device is disconnected and
> re-connected again. This happens because usb_clear_port_feature() does not
> clear a truly happened port change. That says, in fact, port change event
> may happen after usb_clear_port_feature() is called. Then the subsequent
> port change event will have impact on usb device suspend routine.
> 
> Below log shows what is happening:
> 
> $ echo 1 > usb1-port1/disable
> [   37.958239] usb 1-1: USB disconnect, device number 2
> [   37.964101] usb 1-1: unregistering device
> [   37.970070] hub 1-0:1.0: hub_suspend
> [   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
> [   37.974412] usb usb1: bus auto-suspend, wakeup 1
> [   37.988175] usb usb1: suspend raced with wakeup event         <---
> [   37.993947] usb usb1: usb auto-resume
> [   37.998401] hub 1-0:1.0: hub_resume
> [   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
> [   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
> [   38.118645] hub 1-0:1.0: hub_suspend
> [   38.122963] usb usb1: bus auto-suspend, wakeup 1
> [   38.200368] usb usb1: usb wakeup-resume
> [   38.204982] usb usb1: usb auto-resume
> [   38.209376] hub 1-0:1.0: hub_resume
> [   38.213676] usb usb1-port1: status 0101 change 0001
> [   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
> [   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
> [   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> 
> To fix the issue, add delay after usb_hub_set_port_power(). So port change
> bit will be fixed to the final state and usb_clear_port_feature() can
> correctly clear it after this period. This will also avoid usb runtime
> suspend routine to run because usb_autopm_put_interface() not run yet.
> 
> Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port power")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/core/port.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index f54198171b6a..a47df5d32f7c 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -141,6 +141,7 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
>  		usb_disconnect(&port_dev->child);
>  
>  	rc = usb_hub_set_port_power(hdev, hub, port1, !disabled);
> +	msleep(2 * hub_power_on_good_delay(hub));

This feels like a hack, and you are just getting lucky.  Why this
specific amount of time, what guarantees that this is ok?

And why are you disabling a root hub port at all?  How is that even
guaranteed to work?

thanks,

greg k-h

