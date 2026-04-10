Return-Path: <linux-usb+bounces-36132-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPfbMHXc2GnHjAgAu9opvQ
	(envelope-from <linux-usb+bounces-36132-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 13:18:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 630493D6112
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 13:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1531302455B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 11:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D7D39BFE0;
	Fri, 10 Apr 2026 11:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SN8Ln71K"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE89A39B48F
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819890; cv=none; b=ZCTOBEBKhb07gG5gQVYJPwnNt5B0Qg4BHb1B7vAR8IvK76dFnYBDdUinBeGeFjXZG4fWDMRQb9yWnGx2G8c01iF5nAIrgcUXnSn6LAvYzTnz1V/ZUPsUFW6JuJyBAvZRYYZu6JM+3+zVsBMqF3ATi26AYioQ6J+Sr2tLhG/FZ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819890; c=relaxed/simple;
	bh=XDA6xD5rN7g3F/woA9ggqxRt8ZENQ1k8vgd/GTiOhKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJLiFjYKw7MSuvPcT7W4khZkKmlUaJKseXAESZCPcVMurkrI0VOP9XAV6hNUPcmN1RAFoF+jeYERJkkUj94mjycLcKxfUbzxy24a8aF9E/W7ZPA8gP19m8wBBfRONkbmRTw0L7kamtPWKvkBC1tT2VXkKoyCzWR2BaqOV1A1BsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SN8Ln71K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0DBC19421;
	Fri, 10 Apr 2026 11:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775819890;
	bh=XDA6xD5rN7g3F/woA9ggqxRt8ZENQ1k8vgd/GTiOhKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SN8Ln71KIBlzBNGTGGrg0kKrnOAybTp0qJWtgYi80hiAAofELsWieMhR2jdbtxWkr
	 QVzg90yQ3NfFLDa2mWZ0u4sEX4I4BAAj41jL6c0WyTInweNYax5PGznZd8O9IN4sdW
	 gT1j54kK6dEPduQE9N0dTM5Bxhclo/VW/p5PRXR8=
Date: Fri, 10 Apr 2026 13:17:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v7.1 merge window
Message-ID: <2026041018-alongside-speller-70be@gregkh>
References: <20260410062553.GK3552@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410062553.GK3552@black.igk.intel.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36132-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 630493D6112
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 08:25:53AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:
> 
>   Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.1-rc1

Pulled and pushed out, thanks.

greg k-h

