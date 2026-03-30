Return-Path: <linux-usb+bounces-35679-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Al6BQCJymn09gUAu9opvQ
	(envelope-from <linux-usb+bounces-35679-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 16:30:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCC635CDCE
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 16:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6A18308FCF4
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 14:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D26A3A63FD;
	Mon, 30 Mar 2026 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d2BHhW9J"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5523A1A55;
	Mon, 30 Mar 2026 14:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880599; cv=none; b=RBx97EYlYEECwDth4i76tWnmA0B0q9PqzhEW7wODrpQUFlSOvnp8EBLzJQDguHm7BCy5vFenWEJ0ziPwI3TBdu8TAMRYgOL9Jhg85+ERFsnKr7LoNWGBTAYNJG6KYclWv2lLqsx8gMSkfPv2PnsD/Z04qMBHFtkb/Eh5IAcbprw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880599; c=relaxed/simple;
	bh=QC+pTKlsj+pIL5hgPnFCbIm0LkCZd/Qv1iNv5xCBGZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImYgYfxTLfmqvxBPbTkUVXDVmlHqJGAwh4QE0tLN/YaODV1Zi7sya++/bYfTV4TZRb3N5W+ZeeCKepY4IYN/AQbwdXpreRWneW19q4l0H/F2M4ZbG6LLNfPgvxLbMQmDQBt6WsVpO1ljBwQIpmLyqP3XPPHXFJbB6rsuHLM96WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d2BHhW9J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BB4C4CEF7;
	Mon, 30 Mar 2026 14:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774880599;
	bh=QC+pTKlsj+pIL5hgPnFCbIm0LkCZd/Qv1iNv5xCBGZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2BHhW9JCMuf57+665WmO1Oi2sW1rPSfgMklFMX/iiRd+yEiEEWxBl7srQYZjj/vP
	 zy28YoYgkt12AvGlsYwry1t2D7WrX4x0gFowYBD9n+jfu5skGeh6oTwTcA18rOJKxi
	 O/T3BmN2hDT5uoBq37aa9edimnuV1eHAzNhHuxJI=
Date: Mon, 30 Mar 2026 16:23:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v2] usb: gadget: rndis: validate query and set message
 buffers
Message-ID: <2026033008-jimmy-banknote-f4b4@gregkh>
References: <20260323080845.40045-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323080845.40045-1-pengpeng@iscas.ac.cn>
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
	TAGGED_FROM(0.00)[bounces-35679-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 6CCC635CDCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 04:08:45PM +0800, Pengpeng Hou wrote:
> rndis_set_response() already checks the host-controlled
> InformationBufferOffset/InformationBufferLength pair before using it,
> but the QUERY path still passes the same fields straight into
> gen_ndis_query_resp(). The parser also does not verify that MsgLength
> fits the actual EP0 request buffer before dispatching the message.
> 
> Pass the actual request size into rndis_msg_parser(), reject messages
> whose MsgLength exceeds the received buffer, and apply the same offset
> and length validation to QUERY and SET requests before dereferencing the
> embedded information buffer.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> v2:
> - add commit message context and fix rationale
> - no code changes

Have you tested this?  I remember lots of issues like this in the
protocol, so this might not be the only one in here.  I really just want
to delete this code entirely, but some people really like to talk to old
obsolete Windows systems :(

thanks,

greg k-h

