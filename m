Return-Path: <linux-usb+bounces-35758-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OoiKGJtzGmlSwYAu9opvQ
	(envelope-from <linux-usb+bounces-35758-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 02:57:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 077E43734EF
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 02:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57D853025732
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 00:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4311F257855;
	Wed,  1 Apr 2026 00:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uywcxVNs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBF1224B1E;
	Wed,  1 Apr 2026 00:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775005010; cv=none; b=UoIrAl6LKd9g3uTHBHhDR1Zjg3sWAui3EVYuatmg/IPb81L8buAsiprqfnV0ES39v4gYbhpn28FvBZaDD4TPHNDVnTym2F12AbC847Il2PsNCOzoObVJ0ARb7/qUvVrfTcnqI+iacnlcf+RhP/9XnOG0A/UAZSIfqXJkxhAgwno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775005010; c=relaxed/simple;
	bh=AQ2Pn1q455DvqVaoh2xsL2iQtnXLWolK4tmzrltYPz0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LiiYVPKPoi1t2Towp+imlKDM+juoKjdtthCwTv7CYt7EyiVr2H8acTvVO1mUhlqbDBD4RPZD18BiBseUMSbghNfY9fHTfk4tAB8aZ+qPVtVB/0SDloPYlRQQMpItxHYxRhmBTiJuNT10+GPEogq0pPVT4GP14H4b54D7lVrVuZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uywcxVNs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B118C2BCB0;
	Wed,  1 Apr 2026 00:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775005010;
	bh=AQ2Pn1q455DvqVaoh2xsL2iQtnXLWolK4tmzrltYPz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uywcxVNsFYVt1voo+N3xRP6VFKlLhyoiQu2RXpiA5brXISY09I78LBUHAH/4x1zgX
	 sXC4t5+oO9vKQKntWjpfVj7u6L90rxZwM2GgTPdNSQhpvExMKltEKvxW4Ta0aZc3d7
	 AQ3yxSidjM1w5SWrvOgQmX8Dn2ToK/3UoAq4lXzA90ilmnM960BYxemwHcQwS602Fq
	 HO/VyLpapm2l6fkv7b7eoXlSvHtVCDrxRBxkeLTzsCz3ZU5hRgeOWBkUyz6WdmORXl
	 iv9SdmLeL/N4fn/intJ45HMkPfl7BC9bIZ1bViG+41kBSazO0GsolL/22QiPUu0LcL
	 1PZJIfk7wMcog==
Date: Tue, 31 Mar 2026 17:56:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/2] r8152: Add support for 5Gbit Link
 Speeds and EEE
Message-ID: <20260331175649.729e60a7@kernel.org>
In-Reply-To: <50dc7e8c-6c6d-47d1-866e-677638b4deaf@birger-koblitz.de>
References: <20260324-rtl8157_next-v4-1-034312b12de5@birger-koblitz.de>
	<20260329193449.2764517-1-kuba@kernel.org>
	<50dc7e8c-6c6d-47d1-866e-677638b4deaf@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35758-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lkml.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 077E43734EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 17:38:02 +0200 Birger Koblitz wrote:
> > Are there missing switch cases for NWAY_5000M_FULL in the hardware UPS
> > flag configurations, such as r8156_ups_flags?  
> This question has now been raised the third time, see here:
> https://lkml.org/lkml/2026/3/24/1902 and here https://lkml.org/lkml/2026/3/19/1765
> However, while I share the concern, I cannot provide a better answer than
> the first time or second time.

Apologies for the repeats, I tend to send out the full review as
soon as I spot at least one chunk that looks plausible. 
I should do better but re-checking the AI reviews takes so much 
of my time already.. :(

