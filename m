Return-Path: <linux-usb+bounces-34571-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBieF3Z6sWk2vgIAu9opvQ
	(envelope-from <linux-usb+bounces-34571-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:21:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB63F26554F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC427305856D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B656237417B;
	Wed, 11 Mar 2026 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yLauF2L6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D82429DB86;
	Wed, 11 Mar 2026 14:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238877; cv=none; b=gLMbeEYgpNGDLlBj7gbU/ye9QEbZV6n0XuUXfV05QkFYuIojSatZ8x9Tt2t/L83UXZDa76S4p15W9u4qyFrlY7zTbGkfv2kBA6RNJt4vxzv82s51PT3tCM2uy5YNu9agAykgJnDUGCkicvZhxcRePZaNlHAGalmExWzPgx0aW+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238877; c=relaxed/simple;
	bh=UP3PbV2rdo09pgZAO6gal6+SbbUEGNzsKIU6D1w6gJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFW2UzcpoeAte53I54DbjA/BlwT56VVlPiUnNadDk4F7F4ABSLjYCg3qQ/JPTxKuSGDn7rJWf7/AKQDlShy7+KORV9YsT88Y6YJM8BdAsDJ0/uBgHeoyKRT8lJccE15UkMyavR8LU0/HHmf8X/y3zScAoMeQR29+Iphnii7FtLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yLauF2L6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CA2C4CEF7;
	Wed, 11 Mar 2026 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773238876;
	bh=UP3PbV2rdo09pgZAO6gal6+SbbUEGNzsKIU6D1w6gJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yLauF2L6pSiEgBDBnBBGg/Nb+AuzJPxJIK1yDolOzrWO197jaTP8cZvI4hljyG+Uy
	 8CEVbU69xg7kqs5dQmmbww6I/ZgiyhLqIMQzK77PFACVrQSOq9dqCg2jUME8HVfB3w
	 RwvRyxzOp+c8sT5auQOyzELXtCGwLtOO9476DczI=
Date: Wed, 11 Mar 2026 15:21:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Dave Penkler <dpenkler@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpib: lpvo_usb: rename driver symbol prefix
Message-ID: <2026031155-brownnose-voyage-b696@gregkh>
References: <20260305151729.10501-1-johan@kernel.org>
 <20260305151729.10501-3-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305151729.10501-3-johan@kernel.org>
X-Rspamd-Queue-Id: AB63F26554F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34571-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 04:17:29PM +0100, Johan Hovold wrote:
> The LPVO driver apparently includes a more or less verbatim copy of the
> USB skeleton driver.

Ick, and the copyright of that file was not referenced in this file
either :(

thanks for these changes, I'll go queue them up.

greg k-h

