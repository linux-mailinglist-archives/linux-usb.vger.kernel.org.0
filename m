Return-Path: <linux-usb+bounces-34585-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PlJIBCIsWmjCwAAu9opvQ
	(envelope-from <linux-usb+bounces-34585-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:19:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0D626653F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E94D6308667B
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866583DF008;
	Wed, 11 Mar 2026 15:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sk22TMKg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148A43BC68F;
	Wed, 11 Mar 2026 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242278; cv=none; b=TtddbzaCMyGuuLK5+ttgn1ZbMfvGR1Jpf1XRYEKPJy3+M4Z/qNmW68xiB9WlHv5sCnjbCfAgbLgzn1zcNwKxpe9DbD4exj0YKFoAxQCInlkJvf2Y7TdT62HtzCTPWJRz36Jg59iGf+cgNxfDKWNF+VJmBu/enQ06atiyZaRz5f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242278; c=relaxed/simple;
	bh=6Ub6CBjP8TOfO8QJnjvu4vca4w/SNVCz2hjnwYeEVMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ew9K1XvwG6Zy4TnsDf0jjMYalXgmhadPF9bqgLzuQspGrafCMe80HEPF2CWG0H1UFIKGwWiS2UF3TmHNb6cgV+I27TqdVrtam0hpj/7K7B+GWr0CXyhA3AoLBLiOxsYyKQ0oumLKMkgMscBi1u/lr9GVryAJAwAmiUlCeGsIEmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sk22TMKg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13F5C19421;
	Wed, 11 Mar 2026 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773242277;
	bh=6Ub6CBjP8TOfO8QJnjvu4vca4w/SNVCz2hjnwYeEVMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sk22TMKg9cXA+svkG8jFECtlJy6kX2oCPIo74jx0rdYQoSVia7vi4owk1fyP2cS0B
	 wFU9yStx9eU/6i+ngH5Jpo9O3ptkKuxG0YTN4XMkpA8KmG0eK+eRWUWXHTsYXFV4LM
	 arphWzk4JEi3T8+yc7hQ+ltF+eeTGBbnzdCZq50mytb9H7seHQ1H0WP8ngcjrug6q2
	 jX6kQkv+kf2pW/n4viKjhREBqqBcCGBUC5yMl6G6yHkTY5SONKQR9Cc73YjHqB52C3
	 XuEreB6b1/vbzDS0Vmx4yPlbDCAR0woyrau0Fov96jALHPjq8Fu3PGSF7ju+eEcA8v
	 p8oLU6F2kyxZA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w0LJr-0000000078G-1NMH;
	Wed, 11 Mar 2026 16:17:55 +0100
Date: Wed, 11 Mar 2026 16:17:55 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Penkler <dpenkler@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpib: lpvo_usb: rename driver symbol prefix
Message-ID: <abGHowwzLTvcJkLa@hovoldconsulting.com>
References: <20260305151729.10501-1-johan@kernel.org>
 <20260305151729.10501-3-johan@kernel.org>
 <2026031155-brownnose-voyage-b696@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026031155-brownnose-voyage-b696@gregkh>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34585-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: EE0D626653F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:21:13PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Mar 05, 2026 at 04:17:29PM +0100, Johan Hovold wrote:
> > The LPVO driver apparently includes a more or less verbatim copy of the
> > USB skeleton driver.
> 
> Ick, and the copyright of that file was not referenced in this file
> either :(

It is actually, just not at the top of the file as expected. The
skeleton driver is included verbatim including the copyright header and
include directives starting around line 1190.

Johan

