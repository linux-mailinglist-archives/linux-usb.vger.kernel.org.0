Return-Path: <linux-usb+bounces-34803-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DIxCC+atWn82QAAu9opvQ
	(envelope-from <linux-usb+bounces-34803-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 18:26:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAF528E23D
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 18:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7316C305263B
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 17:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9D429A9C3;
	Sat, 14 Mar 2026 17:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USBEeuHs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904602773E5;
	Sat, 14 Mar 2026 17:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773508997; cv=none; b=Kk7RaNEylsKcCIVV442tWErBtDPwcWAAweX285IqnwYjWxt+2yS7Ky0dDafHDuMilJzjEv4mrZE1Eif8BRfWZ34ccySR6yXRdFP4+KeenpnHdvOuJGSv72inO2zgplmzY8t4DMcd0N7XgRxk8M7j4Wy6MoY+tKNZaIARGsOafks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773508997; c=relaxed/simple;
	bh=VCRy2+DEvO45RFXAfweziVvcPV9UABO2btNCIKmoA18=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HZ4ioCYyvY0UXcm1ueC3OQpo9Ncoji+BQ2wCauXe965JGTxmu4yWi228l64fYK+0RLG/9KEEtYz7yy7fpT/geU7GIqzFqdBJx7npXtVfy0USdE9Ahscup1doCSJW60aepKz5XZZB5z6ATu7q0X+jjMyrGZc59xbf11FOhZuEVlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USBEeuHs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DFBC2BC9E;
	Sat, 14 Mar 2026 17:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773508997;
	bh=VCRy2+DEvO45RFXAfweziVvcPV9UABO2btNCIKmoA18=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=USBEeuHsRMWa7bFBuUF0uefxuoNHH7QANvWdcZP/en8bHqrVKAd6+0mIy5qanV+gK
	 X+fr7AzLYLjZgvLdj29hUD5eCOTkzCLcuxQQIw5zSMAAmcXLhpGTc2BqaoHiGadiof
	 CWi5Kys47/dKSot3Ythj0qjWSBS7MwG3QJ7ykXXb0CmArZReZqaQw8s6UxJFMnhCkD
	 Qg5wP5YDcYKPqphZ/funb2h0PDnOCDDxCFUPdQJO/P74bx6VO2e+PZTLOu2pF8sRK/
	 k+0Lj3Ohj02zcWhbl6Sy04e/bHeEIAqdTVfFCGyPTF069SAb53gmH9sOMqOuHANM8g
	 AuKJYSSDJBsVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F713808200;
	Sat, 14 Mar 2026 17:23:12 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 7.0-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <abVLpuXaT8KcBt3J@kroah.com>
References: <abVLpuXaT8KcBt3J@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <abVLpuXaT8KcBt3J@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.0-rc4
X-PR-Tracked-Commit-Id: d0d9b1f4f5391e6a00cee81d73ed2e8f98446d5f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 69237f8c1f69112cca7388af7fab6d0ee45a2525
Message-Id: <177350899130.1738937.7374876281299896490.pr-tracker-bot@kernel.org>
Date: Sat, 14 Mar 2026 17:23:11 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34803-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BAF528E23D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Sat, 14 Mar 2026 12:51:02 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.0-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/69237f8c1f69112cca7388af7fab6d0ee45a2525

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

