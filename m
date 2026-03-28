Return-Path: <linux-usb+bounces-35615-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BOpOeP7x2mIfwUAu9opvQ
	(envelope-from <linux-usb+bounces-35615-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 17:03:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7843434F165
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 17:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A42FE301B162
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 16:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36EE395DB4;
	Sat, 28 Mar 2026 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rhShdjgA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA28D396B68;
	Sat, 28 Mar 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713820; cv=none; b=WR++tkW1zdZyrhAkZF0B22m/L2VJicB8dCxGkRBecg2cPzssGIXlkDQfLcrOm449RIZJlACFbTg8FT/meJhJrgqZ1BYZX3iqbb/iWNje8cdChGWERV+l1b98bDhZIxw6FXBQ1cZZl37OIWx1Kf42tbk/el6IRVrtBWTAQDI9smM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713820; c=relaxed/simple;
	bh=OUG1cT55RhpZRDRllJn6TQgHhKE+14/e2xYUYI2tBHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7NyQyrAnexmJ2BxFJYmG4Gk2smVIebiPbPrUNQbFwYuGTQuzOXEezZG/h1eYashM5yNEAqZQL372I93hJPLyNjEdlob5M5S7PZxyvktcErCpPW8ANwU0MjJCI++Mhyzgx4Kv+uyvCUN5cIeT3g7Qqip4rfmAouKXetlPUMBSjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rhShdjgA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E356C4CEF7;
	Sat, 28 Mar 2026 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774713820;
	bh=OUG1cT55RhpZRDRllJn6TQgHhKE+14/e2xYUYI2tBHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhShdjgAswb0N29q9pJI1Y1KTXN0DzSmhQ6/Hch4/vSX94z1u/NGa3EuJBW62VA5C
	 17y+APSwISLfjBEVSO3DXYa2eceHJyQwPdgiXIwXX2zHfDqTGCZ53aA0tXPkf405d5
	 duYTpn2QbYIY528267rZ90qHIQl6g7CPUmq19paI=
Date: Sat, 28 Mar 2026 17:03:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "yongchao.wu" <yongchao.wu@autochips.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: gadget: fix NULL pointer dereference in
 ep_queue
Message-ID: <2026032859-gave-smokeless-a5f4@gregkh>
References: <20260328143842.57315-1-yongchao.wu@autochips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328143842.57315-1-yongchao.wu@autochips.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35615-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
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
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 7843434F165
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 10:38:42PM +0800, yongchao.wu wrote:
> When the gadget endpoint is disabled or not yet configured, the ep->desc
> pointer can be NULL. This leads to a NULL pointer dereference when
> __cdns3_gadget_ep_queue() is called, causing a kernel crash.
> 
> Add a check to return -ESHUTDOWN if ep->desc is NULL, which is the
> standard return code for unconfigured endpoints.
> 
> This prevents potential crashes when ep_queue is called on endpoints
> that are not ready.
> 
> Signed-off-by: yongchao.wu  <yongchao.wu@autochips.com>

Please use your name, not your email alias, for the From: and
signed-off-by lines.

thanks,

greg k-h

