Return-Path: <linux-usb+bounces-35347-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ8DKLiawWlNUAQAu9opvQ
	(envelope-from <linux-usb+bounces-35347-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 20:55:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF402FCAFF
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 20:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 794E3304F326
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 19:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0B73DEFE8;
	Mon, 23 Mar 2026 19:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCbguMzL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2BD3DDDB4;
	Mon, 23 Mar 2026 19:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774295634; cv=none; b=U8AxIIABCY7Fa23CWbWflScW04ZJq/Ch/pdBd+weM9jWFAZZaJl/4F3ewcqLFilZ6oXJeVYsWQT8UVvdBb6VvypgXADkeaqqr9Wr7HrlEKfs9+eHqzmkYPrSzjjb9jE12zCPy/TcYohlnxdRNb9q+aJFEsW5OB5yd6DJ+4j8pv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774295634; c=relaxed/simple;
	bh=BCVSpSm5pSP3gfVq77yZ/sQqddygnhE84/LBzJZ0XLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkJl74Szj1LSUuEl827kJL32Lx8zB0B1ykQShxnpqdOtJmOPGMQFSNcRJorOFItnMmeiXd3fBOZwAyLILi8lIz+jY4ZPAk0VSCZ07YTw8AW+PkgRx85stlf3x1Ck4pZFFffAFawTSWsKwkmhfFpEewbspa6NSUqbs/nnr23+1XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCbguMzL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4478C2BC87;
	Mon, 23 Mar 2026 19:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774295633;
	bh=BCVSpSm5pSP3gfVq77yZ/sQqddygnhE84/LBzJZ0XLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCbguMzLN+9A9yPxnxdl7dEiI3+dMThJ/1b4wXqEKUfsaeP9aOpZB+FUzuJ/Lld1S
	 Qd47WFA+ZJDX/ZJQqo8kvhWhNN+ICDCHBaWH3JWsCQkXe/6nEt9sttGeK+6JJtEUJS
	 TQ6ZWttW4X/ELY3gDU/3Hq/uOC1f9v6FqpReTpM0j+pQLhaVhpENUwkAPw5GSDtjpk
	 qOYsw6TwGow/P9141FpMkj2QSiSFBOVt5+sXbUxBtP+2JvZ3rmEIGtvIcJDp5h2wLA
	 EB2oWQfmXxN5RxIMU1nsdqUqYQFiMwfhd0bPAaERWHFrKkU6XU6rKvU1Zss/8e5sOp
	 BTLRVvkEgP+kg==
Date: Mon, 23 Mar 2026 14:53:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: usb: ti,usb8041: Support nested USB hubs
Message-ID: <177429562997.1298085.2356270487297460503.robh@kernel.org>
References: <20260313141220.1843488-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313141220.1843488-1-alexander.stein@ew.tq-group.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35347-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tq-group.com:email]
X-Rspamd-Queue-Id: 3FF402FCAFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Mar 2026 15:12:19 +0100, Alexander Stein wrote:
> Onboard USB hubs might be nested. Add the reference for the generic
> usb-hub.yaml binding and lift the restriction on peer-hub.
> A (downstream) hub might only be connected on USB High-Speed lines.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/usb/ti,usb8041.yaml   | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


