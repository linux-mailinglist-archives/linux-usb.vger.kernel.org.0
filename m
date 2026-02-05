Return-Path: <linux-usb+bounces-33123-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGQtJsvChGk45QMAu9opvQ
	(envelope-from <linux-usb+bounces-33123-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 17:18:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40324F51ED
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 17:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFBB3300461A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Feb 2026 16:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C3E436371;
	Thu,  5 Feb 2026 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gO23fcfc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF81393DF5;
	Thu,  5 Feb 2026 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770308297; cv=none; b=cNf5ZxZWzIi8dbZ7KWqknPnScwhxyL1VfVuVm+JvKKqdwFXHM5Agw1NuZOjiXC8CcwCgl4uy+K/bh+P3jaSnAZjbUskcd0rh3bh/uux5CHuZ+FvfoRYAHh7pnJGAKMJwtS8mQNp3BBS4VCXG4V3Gnm1hxWnhoZenhVYT/2tgaes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770308297; c=relaxed/simple;
	bh=3DRAbb6w7wdc0RMM1pSxhTseDz30EKsl9OCX2CqYv4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1eqNRnTFsPt1FEeapZ3AH6TFx9Z1mxt96Z3E19TlyqzTvKaIW/4mtX0gI7Pbe/yBEQPWp29qxGKVp6NyNqnDMdetb6h6KKMUHkzyAFFusefctAibtxyvNXdSXM6iPVB2UNnBP4kzYUeXz1rzUMT8W0kGOLjx5VA4KuFlCyjMvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gO23fcfc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B16C4CEF7;
	Thu,  5 Feb 2026 16:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770308296;
	bh=3DRAbb6w7wdc0RMM1pSxhTseDz30EKsl9OCX2CqYv4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gO23fcfcJPdCc3zgrS/I76qoPKumpMFdJkGVY7cJD2GxGy6jSvmi8s76HwhkA4Ye7
	 8/oeP+/REjqVqgo7lzuaRDjSJAHIFuRq53OY6uogdQKv++Ga/XLfmShMtDvrzfzl+Z
	 EM6HlG60Ycra5/jZ8vHvfW65s7Vnq5zKB2ivMMpc=
Date: Thu, 5 Feb 2026 17:18:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jan Remmet <j.remmet@phytec.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v2] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Message-ID: <2026020520-confider-selector-0b67@gregkh>
References: <20260127-wip-jremmet-hd3ss3220_vbus_split-v2-1-f615d4e88634@phytec.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-wip-jremmet-hd3ss3220_vbus_split-v2-1-f615d4e88634@phytec.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33123-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 40324F51ED
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 03:42:15PM +0100, Jan Remmet wrote:
> Check regulator state as peripheral and detach can disable vbus.
> Without this check we will try to disable the regulator twice if
> we disconnect host and then connect as device.
> 
> Fixes: 7e7025811579 ("usb: typec: hd3ss3220: Check if regulator needs to be switched")

This is not a git id in the tree :(

And how can this "fix" the same commit that this one is?

Totally confused...

How about starting over and picking the commit id, in the tree, that
this is fixing and sending that?

thanks,

greg k-h

