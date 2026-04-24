Return-Path: <linux-usb+bounces-36472-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE3xAAOb62naPAAAu9opvQ
	(envelope-from <linux-usb+bounces-36472-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 18:32:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F7C461519
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 18:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93F8B300FEE9
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 16:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D2633508E;
	Fri, 24 Apr 2026 16:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RnXbpDgP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EE74F5E0;
	Fri, 24 Apr 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777048316; cv=none; b=Y7w0LW84QvL7FudzQwXU2aQx4KAQDhv9bW5gSWlZpVQm0dLk1uuWGomBVztsrB3wqvWoQRAq/1Y7F/SogQdd6xJwMc2SAt5z3r01sqcHZs0e4XPJvkAU/aRe//nNXCNc0J91fMgdTdUzMWb5Ea9/rVAZUHFfqBmHwbHrHbtxf2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777048316; c=relaxed/simple;
	bh=H3PB4GezZDhLhVoGfLAORE8hfvdvlDfdNFCf9xAZg9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9/IHcJK7ZCnIXaddIUrEs7MA31N28PgFrTt07NEYXUjfmeX47k/dPa1l7fDTFZFEV6GuEhudLCN29E3bF8fcjMrv7m7FO6WvSAxcllMSz51q+ifpOqdE51e73sJcQVTKRi7ICpwnXkptphznfH0THdqpFL5RkeimCU+tc38SmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RnXbpDgP; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g2JPs6Wmxz9v7t;
	Fri, 24 Apr 2026 18:31:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777048305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H3PB4GezZDhLhVoGfLAORE8hfvdvlDfdNFCf9xAZg9w=;
	b=RnXbpDgPGWvC6Hq5ZCyqqsGsjfEWFT7EJib/H1q8nmgFiyzni6+/zY6GyTyX/q7WuRMg9A
	fws8zBq9+g72BR83lRIsMiD+FTS8vpXkjRsJw0kCYb7acUbtcuElBuYmiTq8ebezjYYK3x
	d6Ca9LTBDFo6wdZmwbnC63WLJaxDmB410ly0qd3IZap+eIYLugdqBweD2p7kywQNExxn1b
	BNzoHZPEezfly/lmI4fsY3pG6eTFgWYuvTm1Pbod03FqWJMrhIyedVlkcF4eqIMwBBfKwz
	qLYVW+D5KwtUUP7DPJ6fdGOmyvDxkoWUQ3i87NfD9kGitNhh3O+AdDku1kBuEA==
Date: Fri, 24 Apr 2026 18:31:41 +0200
From: Anthony Ruhier <aruhier@mailbox.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	usb4-upstream@oss.qualcomm.com, Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Jack Pham <jack.pham@oss.qualcomm.com>
Subject: Re: [PATCH] usb: typec: mux: ps883x: Power the retimer off when not
 in use
Message-ID: <aeuWdwF0xO6HDgvp@tour-anthony.aruhier.fr>
References: <20260420-topic-ps883x_unused_reset-v1-1-7aabf7004d2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-topic-ps883x_unused_reset-v1-1-7aabf7004d2a@oss.qualcomm.com>
X-MBO-RS-META: 3ief7gdfzsrmrtqda9c5rsy79xumtd76
X-MBO-RS-ID: 74a84421344d28f9e79
X-Rspamd-Queue-Id: 55F7C461519
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36472-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aruhier@mailbox.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:email,qualcomm.com:email,tour-anthony.aruhier.fr:mid]

On Mon, Apr 20, 2026 at 01:40:28PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> When there's nothing going through the retimer, there's no reason to
> keep it online. Put it in reset when possible to save power.
>
> Also, remove the register cache-compare optimization as it makes little
> sense now that the chip resets during almost all transitions and
> tracking the validity of that cache becomes a headache.
>
> Suggested-by: Jack Pham <jack.pham@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> --
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>

Tested-by: Anthony Ruhier <aruhier@mailbox.org>

Thanks a lot for this patch, on a Yoga Slim 7x (x1e80100) the power saving is
huge. The laptop would rarely idle below 6.9W, now it reaches 4.6W (same 7.0.1
kernel, the only difference is this patch). Screen off, the laptop was idling
at 3.5W, now it reaches 2W.

I tested that DP-alt and USB-C devices continued to work well with this patch,
and it works as expected.

--
Anthony Ruhier

