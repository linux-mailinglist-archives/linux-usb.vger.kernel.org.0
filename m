Return-Path: <linux-usb+bounces-36068-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGoyILIH1mnbAQgAu9opvQ
	(envelope-from <linux-usb+bounces-36068-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 09:45:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE7F3B8813
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 09:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06E683093001
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2026 07:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80862387350;
	Wed,  8 Apr 2026 07:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7pG7TKD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E44F34C130;
	Wed,  8 Apr 2026 07:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634041; cv=none; b=B3jE2ojI+o5kI2vHSLkmdkECa4wdCSdoggVqC8mH62GDC2XAKlMiUGP2GXw1nDFiL3mebjwTsodbHeX8C1UAODLU9WRKLEN8xi8z4jzAX7apzaBU1jx1tTSeROF6LQD8I0RoSQDXgiRItQb7DL1AFyr7cuYIKzeU0RjQS0JdWdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634041; c=relaxed/simple;
	bh=6SYZt/lCG85IlbJV/NN01x1cg/EhC/PTzMct7PabP/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNblKLghs/9ZpE7XDa6D4uxo2WODq3NKCoDV6GOuc7uytVWmM66YH4bR+bur6gz+yIYwm4VoPGSnu2I1pJp1gMXX8Id2Yf0JAriBPWLPW2CVRToihkZ0OGvOtGvQSXq2vGzGfW9mD3MpxLJ6HvMicaGfuCujIYIE0ZXL9hHVrg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7pG7TKD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5413C19424;
	Wed,  8 Apr 2026 07:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775634040;
	bh=6SYZt/lCG85IlbJV/NN01x1cg/EhC/PTzMct7PabP/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7pG7TKD87s9ex6fYqlupUOgWhsh9u52LbP/s8dcDqlx0t6NxtHf0JL20p2bXhNTB
	 tiKbk6uRpGKkt+cX3NJIPXv6MPOHzHmZark96nQA9Bjsp3cGuh2w76TkNjWeDkZ4If
	 hyfAn+bv0E1wCbK7q7HDo4DorVnBgEhh9OGLqcAbik7eFDsppK2iFm+X0GuFMCqsIf
	 jrO3vKpSMMbkigouf8C5Mp5at+iRCjOxt8YWfUTzLQl9uqkIWI6W48zGJO5efTfCZy
	 IlRADRG0gO1Hb4ZLYQGS9txfZH4zqjF7JjIX4fCm4A9kdk2R8uZjgdQURgyaF+scOc
	 +ro8gX2dTeLIA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wANWg-000000001wu-1dTM;
	Wed, 08 Apr 2026 09:40:38 +0200
Date: Wed, 8 Apr 2026 09:40:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: iuu_phoenix: fix iuutool author name
Message-ID: <adYGdvE7_UXIReWh@hovoldconsulting.com>
References: <20260407192342.1054359-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260407192342.1054359-3-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-36068-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hovoldconsulting.com:mid,linux.dev:email]
X-Rspamd-Queue-Id: 0BE7F3B8813
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 09:23:43PM +0200, Thorsten Blum wrote:
> The original iuutool author is Juan Carlos Borrás - fix the spelling.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> https://github.com/jcborras/iuutool/blob/master/AUTHORS

Applied, thanks.

Johan

