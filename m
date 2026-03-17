Return-Path: <linux-usb+bounces-34927-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJz2Dm5BuWnq9wEAu9opvQ
	(envelope-from <linux-usb+bounces-34927-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 12:56:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CCA2A9525
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 12:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D071C3048578
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 11:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44773B4EB3;
	Tue, 17 Mar 2026 11:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NR6uej+o"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF543B582E
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748573; cv=none; b=trruCk3/+U+XH1vNB19raZrfjYJo4LxlslF0npoeqkJsqy9gthfVLn9J+inlNAbR3FlYtrcA1XdnbGjMc0eqS2zPRf6uOGNKLT5OOXei0Z+7+VF1lAQBYqeZvaPVEyxLmGnHa5kN26k3yS2AzWCe6dsgBNzMGBJ00XnNMw5b0fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748573; c=relaxed/simple;
	bh=q+RI2zuh4+hLHWfQQKXOqEjxfTUitdZfcyQvIoeB9WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtPPAWZF7AyfTfK4DNhc5kHGD+atjUNdEjv/YKbNvmdsrWvT+IRNlbSxg4NmFLD2X04CMgIi1vP8coDwPlsLZawpnHhvJcn4XPxG2uni4Lf6QwRAHd4Uo3vWdSc99c5ikoC3x+RyfsgEOQePYvgMPkWAZQvN9qcD+3aNHmNGJRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NR6uej+o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67856C4CEF7;
	Tue, 17 Mar 2026 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773748572;
	bh=q+RI2zuh4+hLHWfQQKXOqEjxfTUitdZfcyQvIoeB9WM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NR6uej+oNFtj2qjycHob9rWoywURHBSwZVR+MuAAOINTcFnhJd80B3DKqviCcOd23
	 vtA2L1BMldD58fFDoX2ry9A2Uc+/PhhNCuf73h3TVyToIkX5gx9vB7+6APGqA9YfID
	 nHCPyURRJwzlWuAo44jml5HitGxGxqDRKd9nbTQ0=
Date: Tue, 17 Mar 2026 12:54:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fix for v7.0-rc5
Message-ID: <2026031743-superglue-console-170b@gregkh>
References: <20260317112341.GF2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317112341.GF2275908@black.igk.intel.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34927-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.879];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: D8CCA2A9525
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 12:23:41PM +0100, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:
> 
>   Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.0-rc5

Pulled and pushed out, thanks.

greg k-h

