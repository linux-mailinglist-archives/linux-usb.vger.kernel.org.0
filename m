Return-Path: <linux-usb+bounces-35051-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKPdNqi2umlWawIAu9opvQ
	(envelope-from <linux-usb+bounces-35051-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:28:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9842BD227
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1540C30FA004
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 14:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2613DA7FF;
	Wed, 18 Mar 2026 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TUihieB4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1953DA5D3;
	Wed, 18 Mar 2026 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843064; cv=none; b=CgLDzqLevI/5qpzu+Y5+Oic+zJAGiWQTtV8pzFVHly/+XZHCMYFL7qGpQLSkf0O7dn5uMHxZ3iiuYt4iv/pyrhnOwW9gOA3gXWF//gXcPukhaz1PQHBgk+n923jMKwpCjgBFp2f2+POOe2022E990uWRDGSQPc+yrJObvqbw9Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843064; c=relaxed/simple;
	bh=vAtr78oJYr5MldzDgKeEeuiZPlRQiX14HXxdltXPPoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cll3Cd2FMV8kndNYapduZjRMw93SC5s8A6lbLIeadc+K3ul1DwpI6lHBkd+enruusP1vH4/buOKSkvCHWOGNLpYl5TI5OQRz3KzHbypHLavEEF1NIo2UaCG5YUNV9FvT7OT+Y5RkvND/fvPMQz614uZFrndLPwQysr9EQfkZNWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TUihieB4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F96C19421;
	Wed, 18 Mar 2026 14:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773843063;
	bh=vAtr78oJYr5MldzDgKeEeuiZPlRQiX14HXxdltXPPoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TUihieB4pe/3REli7xpBXL08UlYR9OF8PDwgmghzFTrwlcYvgIIAN3EmiEn6Onhx6
	 ItY16qcXPxV0GzzVV9DpI51sErebJqa4+wD1dsXQgk6dc65fu/uzloBe5A4Y+v0rQy
	 GpT+kaUWmH/m35Tgay8tncfJmB6jQcNDn7p7tZk4=
Date: Wed, 18 Mar 2026 15:10:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Loke Forsberg <loke.forsberg@gmail.com>
Cc: linux-usb@vger.kernel.org, khtsai@google.com, raubcameo@gmail.com,
	kees@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_ncm: replace kzalloc with kzalloc_obj
Message-ID: <2026031829-tinkling-replay-a53f@gregkh>
References: <20260316092505.8841-1-Loke.Forsberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316092505.8841-1-Loke.Forsberg@gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35051-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.889];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,gmail.com,kernel.org];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A9842BD227
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 10:25:05AM +0100, Loke Forsberg wrote:
> Replace kzalloc(sizeof(*ptr)) with kzalloc_obj(), to improve type safety.
> 
> Signed-off-by: Loke Forsberg <Loke.Forsberg@gmail.com>
> ---
> Changes in v2:
>   - Remove GFP_KERNEL flag as kzalloc_obj() defaults to it

Any reason you did not even test build this?

Please be more careful in the future.

greg k-h

