Return-Path: <linux-usb+bounces-33445-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCOQJL4nlmnxbQIAu9opvQ
	(envelope-from <linux-usb+bounces-33445-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:57:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D75D159AAA
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2C3F301DD49
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 20:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B1434A3D8;
	Wed, 18 Feb 2026 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QKWAR4ii"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21FE349B17;
	Wed, 18 Feb 2026 20:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448217; cv=none; b=BEcEfPw9PzFd4uo3i5eSBqKqzYyRldWaIRaKaSbW6WenCbD8T8mHh9REqryqznFtxNyS9lTnRU9dlrM5UhOmLCjAsCucmaj9I49uMmDtDp1t0Jx/FikmswMuGZL8D76HisuI8au0mrKksGFiyxSwGBHsWLgTwdPUwszvkPp3nw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448217; c=relaxed/simple;
	bh=hvzHI9QplxYwif9r3uiA3HN4vVujEKrQGKUKEAccDpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+WTQK3y7zj9KbmQoJNcH/dSzOj9SLamzS717LeFPNucu+Yw+As5ttgIOa/+KPcy7T+59LOQY2vMyEFqs3Zam3Tjs6RA+k9wMwRC0yx4d4b85hNAXIWNP3Z2Tklbb/fDmC2g0sijq1wHIsZchdZS98VPedbHBCjnbPN/whfLiKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QKWAR4ii; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8424C116D0;
	Wed, 18 Feb 2026 20:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771448217;
	bh=hvzHI9QplxYwif9r3uiA3HN4vVujEKrQGKUKEAccDpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKWAR4iirx+bOjL9LeMb3PYM+D2Qv6QcATjg0qx2W2p839MjqdM3esvP44WDZZBpg
	 BMYSnMuV4zJBVROIq8blmcmCX7lwuYPm+/slY3FYhJDn3oWCZGFDoXDF08jpAV7Gi9
	 FpfoMhwyzAPfMetl/HBssrQXzAwu+k9eE7bhsVwI=
Date: Wed, 18 Feb 2026 21:56:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: typec: tcpci: Make tcpci_pm_ops variable static
Message-ID: <2026021821-iodize-trolling-3bde@gregkh>
References: <20260216110403.159945-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAPTae5Kyaems-3HEGQ8hhgkiRVPJgjecGCHQ4iRF242k+L_d8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPTae5Kyaems-3HEGQ8hhgkiRVPJgjecGCHQ4iRF242k+L_d8A@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-33445-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 3D75D159AAA
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 12:35:04PM -0800, Badhri Jagan Sridharan wrote:
> On Mon, Feb 16, 2026 at 3:04 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> >
> > File-scope 'tcpci_pm_ops' is not used outside of this unit, so make it
> > static to silence sparse warning:
> >
> >   tcpm/tcpci.c:1002:1: warning: symbol 'tcpci_pm_ops' was not declared. Should it be static?
> >
> 
> Thanks for sending the patch Krzysztof !
> Can you also please add "Fixes:" and "Cc: stable@vger.kernel.org" ?

Why would a sparse warning fix need either of those?  Are you wanting to
just pre-load my "WTF" email bot to go off?  :)

thanks,

greg k-h

