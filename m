Return-Path: <linux-usb+bounces-36330-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Po9zLBS85Wk8ngEAu9opvQ
	(envelope-from <linux-usb+bounces-36330-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 07:39:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF3426E29
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 07:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 70B6B3004D99
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 05:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2A52D0C92;
	Mon, 20 Apr 2026 05:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rbwMqum1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F29713B7AE
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 05:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776663564; cv=none; b=o7RQom3y1Y2yKOorL9XVwIqaDnXnvAJCNtGMpshL7n+4c6lKaUimzU1EuIqDobF5+/ET2Kf8BOXU+xxXFsR8V2ixTQsP4u3IZlHPR+435nnMIDjgwk4gJDzcga1kbOq6taL9wcozFO5/ObI7lXJOKGm2OQ9287jPe4yEwVrBf/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776663564; c=relaxed/simple;
	bh=AKwFOI7MF+YfT1zbL6T7X2TF2aqmHkVv+0xo3PEsSBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wu4OJo0bs7R6HmvcL+SN8Ky4ybqeWqUowqBoUxgGpMctAkfhC8aRxbi7hD036v5JfiIedtMHnC0dupIe99J/RhaFvmqd4BibrfxxHP8Rnnam1sfKTtSR6XPjpN/71+83X2HRnHIWRM2RU8Jx8FhdZLFxCTbZkMCguJeYObE37VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rbwMqum1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583A1C19425;
	Mon, 20 Apr 2026 05:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776663563;
	bh=AKwFOI7MF+YfT1zbL6T7X2TF2aqmHkVv+0xo3PEsSBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbwMqum1ocJoBGBaHTvmueymNzTrWioC8as4elvIqjdYWWdRSC46V0gR6CnMrDyko
	 9NxWsNas8W37bf5VGyF7E4tNfPcTf8DKt86ijfBQQtZ2t3x0hRlmSO5vXYC8AauxdA
	 5w2QNYSTZ6vDWOgr88WkstzTs69mKi2P+ul0+Shk=
Date: Mon, 20 Apr 2026 07:38:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cristian Cocos <cristi@ieee.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: vhci_hcd: bulk streams
Message-ID: <2026042051-tile-pecan-048c@gregkh>
References: <935d4557704d963475364ed1fb033c20e8bb7cbb.camel@ieee.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <935d4557704d963475364ed1fb033c20e8bb7cbb.camel@ieee.org>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-36330-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
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
X-Rspamd-Queue-Id: E4CF3426E29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 19, 2026 at 02:25:32PM -0400, Cristian Cocos wrote:
> As of this writing, vhci_hcd does not support bulk streams. Are there
> any plans to enhance vhci_hcd so as to support bulk streams?

We have not seen any patches submitted for this.  If you need/want this
feature, feel free to contribute it!

thanks,

greg k-h

