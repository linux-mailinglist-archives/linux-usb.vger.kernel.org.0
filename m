Return-Path: <linux-usb+bounces-32651-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKMPE5OLc2l0xAAAu9opvQ
	(envelope-from <linux-usb+bounces-32651-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:54:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBF377466
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BFC630421FF
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 14:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7796F1FDA61;
	Fri, 23 Jan 2026 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="s0rtAI4i"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE06C272816;
	Fri, 23 Jan 2026 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179935; cv=none; b=MtB83vV2a47uGNTcyBWq8X137P9hyokaI5LkiE+iemR7Z1HRE35HYutmDHzCsvSi55EAP6HdWqbE/EFfpFnSkzbb/tts/A0xohH+lLgMPzdbBvf3DevKhzMJImlfawo0QkbNlqJeY7jJLQVsuJpBEzEO1W2ZJZEuQXbkYi5Ly9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179935; c=relaxed/simple;
	bh=95HArh40wtcPOU5zHLV2BUqYIWkskWkANQxmuv6xw1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kh+nUtAtyKIKrjsd4yNfnAd187jmD5MZQ8JY5ifA9ifXvRKwLpZqksOt8sBQd4O/kKlgmcxC+ie48NnqUf5EC00qTPaerp0I/ge5vbgzL5+J2AiAYnYe6qkH5aow7rN7dgf0Hj7IfAptrehinLEYhmCb4ugbKrrjQHPHKmIKg2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=s0rtAI4i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7C8C4CEF1;
	Fri, 23 Jan 2026 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769179934;
	bh=95HArh40wtcPOU5zHLV2BUqYIWkskWkANQxmuv6xw1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0rtAI4icU7Qyp7LbPkomzzmWUL/chagjmsLpIj2W60/XepwZtSihSNlMqR/54SQi
	 dvduedT6rcmYZ5Lx7SMcU0d3DJAkAntysG6WAvnpFM5HactI/Ah2ZubtdgYbpYPs+2
	 s2nAn5DpYrjVm2WpbGdKB2zHgJAIqgACYaYGvL5E=
Date: Fri, 23 Jan 2026 15:52:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] usb: gadget: Add a prefix to log messages
Message-ID: <2026012339-landmine-risk-5c9c@gregkh>
References: <20260123142221.14285-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123142221.14285-1-jszhang@kernel.org>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32651-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: BCBF377466
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 10:22:18PM +0800, Jisheng Zhang wrote:
> I met some log as below:
> [  581.262476] read descriptors
> [  581.265558] bcdVersion must be 0x0100, stored in Little Endian order...
> 
> To be honest, if I'm not familiar with the usb gadget framework, I dunno
> which component is complaining. Add a prefix to log messages, so the
> above messages will be look as below:
> 
> [  581.262476] usb_f_fs: read descriptors
> [  581.265558] usb_f_fs: bcdVersion must be 0x0100, stored in Little Endian order...
> 
> Then solve similar issues for f_mass_storage and f_tcm.

These should all be using the dev_info() and like calls, not pr_*(), and
if that happens, then you will get the correct prefix.  Can you make
that change instead?

thanks,

greg k-h

