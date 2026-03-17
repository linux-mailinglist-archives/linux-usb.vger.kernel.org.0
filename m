Return-Path: <linux-usb+bounces-34910-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICfqI432uGk5mQEAu9opvQ
	(envelope-from <linux-usb+bounces-34910-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 07:37:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDF32A4572
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 07:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31364302411B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 06:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F53331204;
	Tue, 17 Mar 2026 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j66Oharq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C8B78F4A;
	Tue, 17 Mar 2026 06:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773729415; cv=none; b=GlWc6hn5xzNm6lF1rGoWGBTSaD/mCJ3ynTPqv+peqXIBVEw6SLLyotzZJfFoMRn9LL6DDpV18OILuXJCCXBFYl5P+YllAPK3kxrj2BP01A95sj4BYRonTY6IDHkSvb8w+L0c4qeE3P1/rcwXuL5HMKhw89DCWfQ+zisr21DnR+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773729415; c=relaxed/simple;
	bh=YbLwwKb7agPjKm/aMzjtrU0z9SLdgnIB/BDXniQH4E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJqjGw/N/zYqj8GHCTngsiu5UvF1IjygHohgLvcbaPTUHwaQoDGyDqOKFNDwp3bZCSpT+RjRYv7pav285sl7k/o+yesKZDVHCvSCb8r2/KrPcZf9NdmvgRxSE2QO82lbQvo5ntddcJ929IUh7vveQafDgtNksRU+TJA3CActXCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j66Oharq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02F8C4CEF7;
	Tue, 17 Mar 2026 06:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773729414;
	bh=YbLwwKb7agPjKm/aMzjtrU0z9SLdgnIB/BDXniQH4E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j66Oharq97jqQyQ7X+nYVUIdX1vroZw2KEOpvVyOZzpe7QH4Pf4ifnBxEUHmNPIus
	 8M5wfeojYtjWmqbPhgNN0LetsLtCkqmg08azVTO0LKwdNeKSkWgXlZb+Os+zZ1Xfr+
	 fZmBIPd38Nw933e2waNMhIbdAEoSsHQRlJugEIeI=
Date: Tue, 17 Mar 2026 07:36:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: hsyemail2@gmail.com
Cc: Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>
Subject: Re: [PATCH v6] USB: serial: nct_usb_serial: add support for Nuvoton
 USB adapter
Message-ID: <2026031717-drainable-unhappily-d3fe@gregkh>
References: <cb5abe7e-8795-46d0-b5cd-66e1bf34fd49@suse.com>
 <20260317061446.9528-1-syhuang3@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317061446.9528-1-syhuang3@nuvoton.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34910-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1DDF32A4572
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 02:14:46PM +0800, hsyemail2@gmail.com wrote:
> --- /dev/null
> +++ b/drivers/usb/serial/nct_usb_serial.c
> @@ -0,0 +1,1455 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024-2025 Nuvoton Corp
> + * Copyright (C) 2024-2025 Sheng-Yuan Huang <syhuang3@nuvoton.com>

It is now 2026 :)


