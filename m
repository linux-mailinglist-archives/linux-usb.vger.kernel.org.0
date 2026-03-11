Return-Path: <linux-usb+bounces-34548-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKaoJ7NcsWlHuQIAu9opvQ
	(envelope-from <linux-usb+bounces-34548-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:14:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3132637BB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32FD93058B90
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 12:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1163D8114;
	Wed, 11 Mar 2026 12:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T8WBGX6p"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F753D648D;
	Wed, 11 Mar 2026 12:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231244; cv=none; b=Vx1XIoLhUyxbh9JphIMQlCZTog1z9pRD7S6r44XOJ+1q+0L/asdzmQEu8DUApHArBQLMsjI+uXVluvMM/C3L4yK7lHgLQHclgJ08I+FLlPGJQN4K0Q7ob1VfjNB5Xxs+sxFrB8t8Byut2lM013p2dIehU8gkdNvHoqn2+1Ir0n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231244; c=relaxed/simple;
	bh=PwGqk3+v7R+sLdxm5pk+5pTXm9MbGfoX5QFzpE+IBd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcwaJ1BL3YzRKQrt4MjHgDP+WZCln/TrHZlurDo8OL+a4cpbPMsHGKKEv+h2Osx61YfAo1/HWpM+YglfTyw37gulCCrd134gVvLcGS1j2bZM1+kcL3wH7zZ096HBjaA9mJbF5WrA5cAm3RhC+aVO5opTY45OvfTIVJUY1fi/gB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T8WBGX6p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E768AC4CEF7;
	Wed, 11 Mar 2026 12:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773231243;
	bh=PwGqk3+v7R+sLdxm5pk+5pTXm9MbGfoX5QFzpE+IBd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8WBGX6pA9/utK4xBTtzIT98h0VMcaJhSAPnB4nCAWe5KNI0To3xBatViS2ZcdcnT
	 yM0nGpttZJNNgf8R4jUcvpQvLTMiHpaQmi5d+Nu6TyLNHE9kiLnjmDqBggla0k73gh
	 wRTzlIMdhb7UlpERe9JYZIlmn3Szug/7c013MNns=
Date: Wed, 11 Mar 2026 13:14:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: opticon: fix UAF in write callback during
 port removal
Message-ID: <2026031137-amply-cardboard-581c@gregkh>
References: <aa_c0B9E7MPm_yqL@hovoldconsulting.com>
 <20260309142757.589802-1-fanwu01@zju.edu.cn>
 <20260310170424.19817-1-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310170424.19817-1-fanwu01@zju.edu.cn>
X-Rspamd-Queue-Id: EE3132637BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34548-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 05:04:24PM +0000, Fan Wu wrote:
> On Tue, Mar 10, 2026 at 09:56:48 +0100, Johan Hovold wrote:
> > How was this potential issue found? Are you using some kind of LLM or
> > other tool?
> 
> Hi Johan,
> 
> Thanks for the explanation. You're right — I missed the lifecycle guarantees
> provided by usb_serial_disconnect(), and since opticon_close() already handles
> the URB cleanup, this report is a false positive.
> 
> I'm currently researching static analysis techniques (CodeQL combined with LLM
> assistance) for detecting UAF bugs, particularly around cross-entry lifetimes.
> In this case, the analysis missed the subsystem-level guarantee that close runs
> before remove.

As is required, you always have to document this type of thing in the
changelog text.

thanks,

greg k-h

