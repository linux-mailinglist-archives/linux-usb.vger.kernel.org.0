Return-Path: <linux-usb+bounces-34570-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD+kIAR6sWk2vgIAu9opvQ
	(envelope-from <linux-usb+bounces-34570-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:19:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA672654EC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8922C308EB9D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0A036DA13;
	Wed, 11 Mar 2026 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wf7WzOW1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486F3274B42;
	Wed, 11 Mar 2026 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238743; cv=none; b=h/rzSNx4rm5IXck3qlKNTWACixuMYkLiRJIIDpuRYBfAMAfQdFWA445+Zin+gDN2wH2BROUJt08E0mN1s16FD+xuz+qhUYUO3djOfRlCm46qlmv7OQWlQ/bdkbGDsE+lYN5yc33PQ858fpj8fx4eivR6zoTFIA+tgqkz97tYeDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238743; c=relaxed/simple;
	bh=/sk99tCwuu/9AUz7BoXM5pAgmalSJ1+HPib99dYb6wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOQUTfV98kp910acoizDxtbWYVtlNyFzoyUAj7p0QoF6LTe3iyKV+fkKTmPf8qLqX4HsFhvnZg0Nmv0pi/e+MFUoUufbpJRwsn/d2aTT/HJLndX+ZzMqM/gikSdiyPZqi73uWekY/9a/pDVWvIzK01HlFfNSlail64xRHvi7Zc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wf7WzOW1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3E0C4CEF7;
	Wed, 11 Mar 2026 14:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773238742;
	bh=/sk99tCwuu/9AUz7BoXM5pAgmalSJ1+HPib99dYb6wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wf7WzOW1lvNCBVkJss5PThkD10FmrBxezfPv9SpYCj9rP+w+zxAh62JkGxXqNXg89
	 y4IXYv90em1adWGARyISnrJKG+H96KI+JDMztX/yatM34iM06V+0gM1UFyeyPJVleL
	 iAEfOOwPTujtg+xK+qUdy+vKbV7GObzdeYpzvlhI=
Date: Wed, 11 Mar 2026 15:18:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
Cc: peter.chen@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, 18291782795@163.com
Subject: Re: [PATCH] usb: chipidea: scope ci_ulpi_resume() to CONFIG_PM
Message-ID: <2026031109-hardhat-dispersed-6b5c@gregkh>
References: <20260309084523.718431-1-pengpeng.hou@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309084523.718431-1-pengpeng.hou@isrc.iscas.ac.cn>
X-Rspamd-Queue-Id: 2BA672654EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34570-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,163.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:45:23AM +0000, Pengpeng Hou wrote:
> In current linux.git (1954c4f01220), ci_ulpi_resume() is defined

No need to reference the tree like this, that's not the normal way.

> and declared unconditionally. However, its only in-tree caller is within
> ci_controller_resume() in drivers/usb/chipidea/core.c, which is already
> guarded by #ifdef CONFIG_PM.
> 
> Match the helper scope to its caller by wrapping the definition in
> CONFIG_PM and providing a no-op stub in the header. This fixes the
> config-scope mismatch and avoids unnecessary code inclusion when
> power management is disabled.

How much does this actually save?  Why is only resume() needed to be
#ifdef here, not suspend?

thanks,

greg k-h

