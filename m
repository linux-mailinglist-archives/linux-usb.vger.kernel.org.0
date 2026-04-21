Return-Path: <linux-usb+bounces-36398-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CVLOI2l52kI+wEAu9opvQ
	(envelope-from <linux-usb+bounces-36398-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 18:27:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9C643D570
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 18:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3865302AF2A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 16:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE6E377555;
	Tue, 21 Apr 2026 16:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpM8ijQc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9782374E73;
	Tue, 21 Apr 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788868; cv=none; b=cc8zzUFxmzanO4mT+E4J3/MABQ0Svr1c7cPW0/cw6dbgf3KJjqaeLJbpWu6SnDApo9Bh5QQINv9peFRyMsp692CmZRbwaMJpeCbf1lzWPBHALQOuAdhrlJXysQg+Ogpn4zwecjR1tZsLsnKfqXivyEpFctBUhqPdT8VV7HiGLt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788868; c=relaxed/simple;
	bh=ddWGhFzjEXQESeoHCh3VyJ6n4+xSdQgSj9qEoccxP5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbhzV6PCC9QMe1XAXhDfri/DXR4LSRHYa1xTSYHRyh4JZ4I/mgbDKK4u7ee1A9Uwz7YPAahPG3kLZekqUQ2yI7vo4CJESyhEKuP9UXaADdUkhgsks+mEMXq8Pv5D5nlMPWsutFGIZbZ4egL8O/3+PVc94xOf9pYIgCwtmgggN78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpM8ijQc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA18C2BCB0;
	Tue, 21 Apr 2026 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776788868;
	bh=ddWGhFzjEXQESeoHCh3VyJ6n4+xSdQgSj9qEoccxP5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpM8ijQcBWrKNkHDT5oAo5ZzMOBYtMwdYIdA9M9Sm8pe55YTfGX3xmDHyBbUucQHg
	 LEW0cv3FCHEGHajRzvWVb73KvjPhy/b8kuU4rMJopS4FmTrcJgUBGadb0799KHOVaa
	 qY+0v55HEe/Zo+aGrEBMPYKrp0sumoopb0oXprvk4TNfcm8Ebo0srdwAKE1mFdVF5e
	 DOS8hFb0VQWTHHoQVnERKNyym9uf9lCgbbrdjYqnqDuF3yTo35gNCsslfrkt8IvWNX
	 ihthy+cmMz3qUYh+2wxNUmdCguuYCW2N+Vz3x5ijC5ckkV4eGpuI8WI8yEjwjE1bu4
	 V+L5zgoCxMyZw==
Date: Tue, 21 Apr 2026 09:27:48 -0700
From: Kees Cook <kees@kernel.org>
To: Bingquan Chen <patzilla007@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, security@kernel.org
Subject: Re: [PATCH] usb: gadget: configfs: fix 1-byte OOB read in
 ext_prop_data_show()
Message-ID: <202604210919.03157F8@keescook>
References: <20260421141010.5607-1-patzilla007@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421141010.5607-1-patzilla007@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36398-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF9C643D570
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 10:10:10PM +0800, Bingquan Chen wrote:
> In ext_prop_data_store(), for unicode property types, the data buffer
> is allocated via kmemdup() with size 'len', but data_len is inflated
> to len*2+2 to account for the UTF-16 encoding and a 2-byte null
> terminator. The null terminator is not actually stored in the data
> buffer.

Isn't the problem the "+2" in the size calculation? The terminator is
never stored nor used.

-- 
Kees Cook

