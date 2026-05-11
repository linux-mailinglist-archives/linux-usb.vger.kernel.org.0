Return-Path: <linux-usb+bounces-37233-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAuXNKCIAWpJcwEAu9opvQ
	(envelope-from <linux-usb+bounces-37233-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:43:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 320BF50971E
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2307307CACF
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 07:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B5E382385;
	Mon, 11 May 2026 07:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rYYxZLV2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D5937106A;
	Mon, 11 May 2026 07:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484550; cv=none; b=R3GPvo4XsdQvY8MV9kH0JM5voVL1ZQTdOztgz7kfV/5Co5SoRJrmTg9YLZDkqW+IOTPSylU6XQZiuLnR4Y7GP9qV199VSEXrD1PeCBybpURoAG15Nsfnp44VYSsADxp8TLYbvS38UBtHyRmIrIHWkqLk2+vR2YeFB6PdIZx9IbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484550; c=relaxed/simple;
	bh=/JhDqShkknd0qrxAZQr9/uWOZb/ADlbOFBJz/oFt9/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUchv6wjwGfLQyi6Z2LLL4Zbc1Q6NVWwcTNbQdty/AQv/fI8A29ZTagxYgR10ZPTJLMCTJN35pG4nSi5tK6QLQRkzs9QBH0NFBWQiDyPppiqtMlfIj18PxU1axKR8DbCQ1PWdGyJBPcpKRIL5t2ObMA77s/d9suNiapPryJr7dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rYYxZLV2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19DFC2BCB0;
	Mon, 11 May 2026 07:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778484550;
	bh=/JhDqShkknd0qrxAZQr9/uWOZb/ADlbOFBJz/oFt9/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYYxZLV2YWg/+PXTyNDFEL/J+nP/b1c28L+9asstd+jqvMF/8cHv6z/tEPT1NA/FC
	 d+I9HuKbeNMXHBspirURBFCmdmDXiqlbifhlN1x4vxhjgEMvyEc8cKso6GvX8u0zSK
	 h2i2mEIdNn+tEWfi8AolgAxh7rpKqE/+KnNkTRWY=
Date: Mon, 11 May 2026 09:29:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] USB: serial: clean up include directives
Message-ID: <2026051159-pastel-unquote-b47a@gregkh>
References: <20260511071448.611875-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511071448.611875-1-johan@kernel.org>
X-Rspamd-Queue-Id: 320BF50971E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37233-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 09:14:40AM +0200, Johan Hovold wrote:
> Include directives tend to be copied from existing drivers when new
> drivers are written. Clean up the driver include directives to avoid
> having to point out unnecessary includes when reviewing new drivers.
> 
> Johan
> 
> 
> Johan Hovold (8):
>   USB: serial: drop unused tty_driver includes
>   USB: serial: drop unused tty_flip includes
>   USB: serial: xr: add missing uaccess include
>   USB: serial: drop unused uaccess includes
>   USB: serial: drop unused moduleparam includes
>   USB: serial: garmin_gps: drop unused atomic include
>   USB: serial: add missing atomic includes
>   USB: serial: whiteheat: drop termbits include

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

