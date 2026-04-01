Return-Path: <linux-usb+bounces-35771-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BMTCK7nzGk/XwYAu9opvQ
	(envelope-from <linux-usb+bounces-35771-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 11:38:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B545E377CBE
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 11:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2FB0B304743A
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 09:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A623C870F;
	Wed,  1 Apr 2026 09:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/PmXfUp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A778A3A3818;
	Wed,  1 Apr 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036277; cv=none; b=IUBjVIsRLQgPeCyF9E+zqhhFoGM4CWHst9c2CveaomKa1ZUyuxQ9tocDfpOWIUTh2XT3qi08Q1dg2dvOyEAkys5aLu/lvAC0rLtmUIPXI8FZUKO8AADGfQGtTwPUHlX37iDF7Iut8exRY62PQyiGVAQD1i3QQfoe/cEiBPtx3Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036277; c=relaxed/simple;
	bh=hoV9ME0rS4i+vhlYDBHMt0e/K7pfCdUhDXbh1zssXVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLp0zORTjfU2QX8uBOh2C0EMJIMVESWmW8Dlv38/U5c1drWFrZTZKYSmXURBTy+uC82YqmGr57BmThzDdPucOds9M7TvPKPnfXmmsyNxrq4ZJsFCVNI0/fnN5I8XcdScwFzm/0m1YGKQjGg3m0G6q6GO5lvQSR596gFn0034o/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/PmXfUp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A19C4CEF7;
	Wed,  1 Apr 2026 09:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775036277;
	bh=hoV9ME0rS4i+vhlYDBHMt0e/K7pfCdUhDXbh1zssXVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/PmXfUpAkK+HeQ1qhSU4qjtktfUmdjkcaPzG3uaZklV0NV3QoFm3BtYXYTcDVn3O
	 rf9IBVlUkOGovlI2VnhxDmfEHUVnGX/BWXlNH3k/73BmlPgqSDm3QV9ErV+UTO2kGN
	 lFA9kfgwMWIbJi1c/lCZawjvKC9riPymtWiT5TVa9tQoYoMaY1KhMzgtP8gJ6waHGI
	 Z6ff6mxJ/bPrDsE8xSE3ye2gHowtbtwn9WYwUD+YrlcEnHBOe15fICHkqAMRyeXILz
	 irgQS6aIFcJx/ERAp2WaKSWievoISx8QrWTi/dRtbxKEGVDexxTkOb/vjwzHezBX4P
	 KAvNeJM+zXfhA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w7s1K-00000009Q0L-3LLi;
	Wed, 01 Apr 2026 11:37:54 +0200
Date: Wed, 1 Apr 2026 11:37:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Ernestas Kulik <ernestas.k@iconn-networks.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: option: Add MeiG Smart SRM825WN
Message-ID: <aczncmprci2o2bfw@hovoldconsulting.com>
References: <20260323143753.686561-1-ernestas.k@iconn-networks.com>
 <20260324110716.970023-1-ernestas.k@iconn-networks.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324110716.970023-1-ernestas.k@iconn-networks.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-35771-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: B545E377CBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 01:07:16PM +0200, Ernestas Kulik wrote:
> This commit adds support for the SDX62-based MeiG Smart SRM825WN module.

> v2: Use SRM825WN instead of SRT853, which is based on it.

Thanks for the update. I removed the changelog when applying (it should
generally go below the --- line so that it does not make it into the
commit message).

I also reworded the first sentence to use imperative mood (see
Documentation/process/submitting-patches.rst).

> Signed-off-by: Ernestas Kulik <ernestas.k@iconn-networks.com>
> ---

Johan

