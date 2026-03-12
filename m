Return-Path: <linux-usb+bounces-34632-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IBFMxQcsmnjIgAAu9opvQ
	(envelope-from <linux-usb+bounces-34632-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 02:51:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B2C26C072
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 02:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B646730F43F2
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 01:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C0C35DA7B;
	Thu, 12 Mar 2026 01:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Rb9SpgXp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3483382E8
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 01:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773280170; cv=none; b=EpWt9stH6hg9dPPmZo8qvB7NoFTRz/JfFChiDYpwLO928Ic8+m//l61l0S2P6C8wpt8mYGi2QCdqQgBUxXfZo23Ul8k+vDx/xeJcvP1SxDYFc/fZlE8RMZe+LFC4sh2Qxpw79s8dx0A8GNzSj3R9qLAYirrA1bjG3UP9CthItbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773280170; c=relaxed/simple;
	bh=sg7gUVhWAGyq4Ocoi50L5enU863PLbHg+FG+jMYp8Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoZMMMDZdSARrLuyp8Lp4yGSFZarQ6KgMuYJVwckP3H7IH6Iqi4qj3fWM0s7jMcNQ72FnwlVQFS1HZ488D6ztG22AOPkVwBwX7oPcKNKjXuy/qUrCGHiZEuj4fy6yvT4T9EbPskvK42FBSJzlxhwJf44BZ0CLmMUa8bgh9hV5wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Rb9SpgXp; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89a6e6225e4so6089406d6.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 18:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773280168; x=1773884968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DZYpMBU+epN9jlXRUo7yqnJXWGzaaOFGKntJmfeKYhQ=;
        b=Rb9SpgXpIceVCnufpnr//aRGKZh8XCmJq85NkgdIxqGcHY2UvzhDIjvIWznTjC1615
         MSM01gqk+oXh0R3Wyr9wV6S4hCcxticHG8+n6ogLh5FuILIwr5Qv3rdft2zmuMJrBPxx
         9qWRKxIUbZu7J+VfsOtYfDRlqbgAvqORpVT7Ydnapnije3x+gIrai/tZDe36k6IKJFWC
         AKGLeBUQCCxinJq2iTy0+xYxnIncX3nmsr6Dh88QA8IXaXutgJf60DsbkIqD6uoGuwgr
         0PtjKXVgeBojlF35K1kpj+X9OsCcRuPNoJX9YlBs89lBTnaHbPoqRUqO/JRzxiE9/gTr
         yS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773280168; x=1773884968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZYpMBU+epN9jlXRUo7yqnJXWGzaaOFGKntJmfeKYhQ=;
        b=LksHkdxeUvfjMYb7ymQ8/+FOS7gLdXZWtmivizoV7NVJ4VpkQkzL/GwhlNHED9LAOD
         psLt41KUxjUoLOr9Wqr974Y8xTCXV3La6bpjcKMUiHZ0dBhVsPW31pLpiob5uWmYmUrU
         au2/TKca+QsfCIXavBF/99eJDEHa5gTCxvmXnCYN5hsb8VO81EMQ0WA4M7sN8MfUaNfL
         M0JA4Eiak0DEUA2rSgAFhnIGaMNMk7E8tWY0SwHfSGpi1BRiMHE2I+pYG78upXxMwqGH
         AS/JS2gQkp90MSmcGIcO4r7SM7sTLfYHZhJi/p0X05m1zEmjdUV4fiNyuX0qAGRUeUlB
         usVQ==
X-Gm-Message-State: AOJu0YyBiymxz1Lr2J4Nn7QA/T5f1kJr7jAJbkwemJA6xXQRd4R8kajU
	jCvQpKnR+aUbRmLtEoVBDJCUQTh2975sAFhYMjCGncWjO4ErlMvMxgibafDnVYIsjQ==
X-Gm-Gg: ATEYQzwAznVXi8qLmLVwsZFW8u19TsbyqFJzQ7uB5Q0HrC7/qgMcg0vSXR6jIkbR+Bc
	pwbQ9qka6cQMSOp6lNUoaHAvh+jYmtQL2dNfzMs2FiN74EEOyAb+1jbrzflUMkYoPNV1kA+QEHF
	qkOdN1i6wYBSV7gD5hw1xl0Dnggcy130NGXC1yAvaBHPgO0pfy5AKcs4/jNW7f810fBPuribVpQ
	nampeqdAYlJs0afWfatFaSGGe1e6g87+zSUI54TCwLchhmTayuvGll081/4EmriKbMKXMEXXZ0f
	wLKa8WrTGekeC6Ayiywtu0+AtT0TTG8RbwycG2kpH4w2zi6PVUkxLeADQjtkkrL+5jeEwNqe7Ek
	PaQo10aav2pROAHWgBqcbdjH3yvrOlowY6/a2YY2VB/qnYTootwjkoD2ghhwLjSKtQLdupX2H6c
	IGAaF0eZ0m6gXBVwaTISvq0UQo
X-Received: by 2002:ad4:5c6f:0:b0:899:ebc3:cdbb with SMTP id 6a1803df08f44-89a66a86037mr67955336d6.35.1773280168265;
        Wed, 11 Mar 2026 18:49:28 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beda63sm24797046d6.18.2026.03.11.18.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:49:27 -0700 (PDT)
Date: Wed, 11 Mar 2026 21:49:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: USB list <linux-usb@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Do we want to reset intfdata in the error case of probe
Message-ID: <6511e504-0454-4ad1-812d-8fd661855e23@rowland.harvard.edu>
References: <615187c2-3c93-4de8-87c8-df840b6f451c@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <615187c2-3c93-4de8-87c8-df840b6f451c@suse.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-34632-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 30B2C26C072
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 09:42:22PM +0100, Oliver Neukum wrote:
> Hi,
> 
> usb_probe_interface() reset intfdate to NULL, if probe() fails.
> Hence a question arises. Do we want to depend on it? That is,
> should handling intfdata be removed from the error handling
> of the probe methods of drivers?

I can't see that it really makes any difference.  In fact, I don't 
recall any requirement that intfdata must be NULL when no driver is 
bound -- the only guarantee is that it will be NULL when a probe routine 
is called.  We could just set it to NULL there, one place, and remove 
all the other places that set it to NULL.

Except, of course, for places where a driver might rely on the 
NULL/non-NULL distinction for tracking purposes, when it might bind to 
multiple interfaces.

Alan Stern

