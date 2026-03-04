Return-Path: <linux-usb+bounces-33981-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MJcDWVHqGlOrwAAu9opvQ
	(envelope-from <linux-usb+bounces-33981-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 15:53:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EF0201F88
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 15:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43FC1301BDC4
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 14:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585A23AE6E4;
	Wed,  4 Mar 2026 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m81cN3oU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BAD29ACDB;
	Wed,  4 Mar 2026 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635917; cv=none; b=Ohds8+TK4e9wk5sm2TDI824QP2oGC8rEMLm/VfF4VxhlkH+3RUJWU8eIpXS21QRaBLeSYe1vYeZHnIbFZIBwlxZHv0WcMEG0MyUKtkGlne7sayI/fQen+Z4eDFfZNsFbgkn0Y5kEDqNsqrh0jlYA8WLPWiuwNdS6Y3IDZlS9P7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635917; c=relaxed/simple;
	bh=QHC2tAGxmxWw3VDJ9Th75w+1aKbI096hrieeiswOYlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdQu3io4cS+lsAeXN1zFeFq0ozQlQxmHCTd4PDyqj74bq5XNW/N71JsRBOqI78QIRCASQziZ7gKhQgi16L9zNT/x+JtENmw/dMlwehhcKvUV9jTIRy6D4k8nd3Hi5cKV+wi19+a63B3Bjis3oVwHD1inqlRhVR9Lrtbcjtzq+RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m81cN3oU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BCEFC4CEF7;
	Wed,  4 Mar 2026 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772635917;
	bh=QHC2tAGxmxWw3VDJ9Th75w+1aKbI096hrieeiswOYlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m81cN3oUmUwM6ecEeyWPyQ+K1jppAFTsneuqY8jVU3CW1AsTcUCH/6XQM6UWg5mF/
	 bltiIUbqFpnhOW3DBcKQdklcqg4sQyq/NsmLUbgTxWLcAjjScVtv4s5YxxtJsShCDO
	 kpijo9tw/eBxjn2UqOGtkQ95qPM5sKILmnt8GHQY=
Date: Wed, 4 Mar 2026 15:51:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: BaiKefan <baikefan@leap-io-kernel.com>
Cc: si.yanteng@linux.dev, seakeel@gmail.com, linux-usb@vger.kernel.org,
	alexs@kernel.org, dzm91@hust.edu.cn, corbet@lwn.net,
	linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
Subject: Re: [PATCH v5 0/8] Add Chinese translation for USB subsystem
Message-ID: <2026030412-mystify-ride-9103@gregkh>
References: <cover.1765180570.git.baikefan@leap-io-kernel.com>
 <20260303194105.00004696@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303194105.00004696@leap-io-kernel.com>
X-Rspamd-Queue-Id: D0EF0201F88
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
	TAGGED_FROM(0.00)[bounces-33981-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,vger.kernel.org,kernel.org,hust.edu.cn,lwn.net,leap-io-kernel.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 07:41:05PM +0800, BaiKefan wrote:
> Hi Yanteng and Alexs, 
> 
> A few months ago, I submitted a patch for the Chinese translation of
> the USB documentation. 
> 
> Following your suggestion, I forwarded it to the USB subsystem
> maintainer for further review, but I haven’t received any response yet.

I do not see the forward to the USB subsystem maintainer, where did that
happen?

thanks,

greg k-h

