Return-Path: <linux-usb+bounces-34711-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Lc0HNYjs2nMSgAAu9opvQ
	(envelope-from <linux-usb+bounces-34711-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 21:36:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3886027952D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 21:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01C0832B17DA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 20:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA8B3B0AD5;
	Thu, 12 Mar 2026 20:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lMuiSR+J"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F1C37F005;
	Thu, 12 Mar 2026 20:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773347385; cv=none; b=lpO//Wq7OWgaIEfvyqB+cL0VMTBnfbhEPNswvZrMV0WzSwc456qQv8wPmmrNlSOcf2I2S1XWfd/iyrU7a6DUfsD0jtnfHt5LV8YBTKajZEmIokeipbmSNkfpC0Xb9C5x5GFYSN7zuiChIDEcQE/o+EZDKjq+erM73O9/vZInZXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773347385; c=relaxed/simple;
	bh=OeSPbYTv0Aj1DpFgIcaJfrT+uel9Zdmr4NY9DIfWpJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7cl2Ri/kCw7LNK8SmChxxf5TrYmel/jXaScXiJ2QLNOicuIBKGZUlv+MuMQGsLZEAGq+ra8oIh6NOFGwhF0D8PTARVC2KTlpQfpK2wHB3/rC3mkZYY7ALgOyuZVEFJ9pNKVPtzv68M1PEyoD91DJA7KT9eqxLKWRnZowpBXHaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lMuiSR+J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D512BC4CEF7;
	Thu, 12 Mar 2026 20:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773347385;
	bh=OeSPbYTv0Aj1DpFgIcaJfrT+uel9Zdmr4NY9DIfWpJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lMuiSR+JxfrOafAaczhnm6zteuPpH/khIQwy78Io3OblsbmPolz86H/6MkhVNjjXs
	 rourOVkUNj3Mi0L74fuZFr3X51CuOwr8UvCp/Z/FVWPP3fzc0twMeEzg2CmtQmgMVU
	 AMAfpbzjVu+lSAp8tOdjOpjG2deU9PbbIbOFIqA0=
Date: Thu, 12 Mar 2026 21:27:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v2 2/2] usb: typec: tcpci: support setting orientation
 via GPIO
Message-ID: <2026031239-icky-volumes-f4f3@gregkh>
References: <20260312-support-setting-orientation-use-gpio-v2-2-59c523a09f12@nxp.com>
 <20260312191243.3479247-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312191243.3479247-1-Frank.Li@nxp.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34711-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 3886027952D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 03:12:41PM -0400, Frank Li wrote:
> From: Frank Li (AI-BOT) <frank.li@nxp.com>
> 
> 
> > +		err = orient_gpio ? 1 : 0;
> 
> AI: Redundant ternary. Use `err = !!orient_gpio;` or `err = orient_gpio != NULL;`
> for clarity.

Better yet, never use ? :, just spell it out with a real if statement.
And ick, do NOT do that last option, go kick your AI bot, that's horrid.

thanks,

greg k-h

