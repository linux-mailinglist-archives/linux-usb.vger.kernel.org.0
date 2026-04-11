Return-Path: <linux-usb+bounces-36164-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UWcqKw2o2mli4wgAu9opvQ
	(envelope-from <linux-usb+bounces-36164-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 21:59:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 281F63E1931
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 21:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B09830071EE
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 19:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6683BC68A;
	Sat, 11 Apr 2026 19:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwTOclKo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE5378F59;
	Sat, 11 Apr 2026 19:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775937546; cv=none; b=WOcVQxzRsBehxr3RSa+oJxfuAZHKG6wy6pDKlz9i49WIvHkHOOB/WZ+cBMlll9yUgBkcnf8sqRjESCftll9THQr9BJxAwxmyoapAEsXTijh8dA52llLRp0pgLpmElfOV53wL9apvJkXKhSE/KNa6/5PszsREs9KWdjjYYCT23aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775937546; c=relaxed/simple;
	bh=tlQKUeqBnWDoHBLvEXDwg40j8drlgToAZnj6EDFu47w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GV7vnpjLOJavbkRpnOeTU5arS9xQIx9+1nKkRQbBLqioPKMpEMBx+oXLBJr9F2fb+AoJrypthMbAt2efXbVnIOYDGNvM/dpiXh4kk1jAKOHJ+UnIpY0ZsiLQdXnMqaQQ5qQ09SeSpjnTq5cj2dRyq5/IiGtKAM+L8YlLKxJDlwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwTOclKo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C901C2BCAF;
	Sat, 11 Apr 2026 19:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775937546;
	bh=tlQKUeqBnWDoHBLvEXDwg40j8drlgToAZnj6EDFu47w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZwTOclKoWU+2rF4eANYhM4Y4IA+meMof0QsmIzEE/wJMVhkXGxPgL4yxSmhxaPpmt
	 61rpaSKS6gVys1mf1lYEpDinn74JC0afpHzmBXScyQjlbMdc2UvKIitCWwPhlHWpd1
	 il3prLir+c4pNGNo7C0Ocigpbb1mfxWkkLC0GjCU8VqSpRQfGX/fM3Is1eF+BBytSh
	 UftKxgL+DAMLq801HJKRMNDoBQA3phhg+6pXCQuKS5ItTDxTZrZtZ6kSCED3AGvIbQ
	 PGwstR6K97JN9EZiKUt6N8NTVSABBYYsHWhzSYztqmsnoeEZwCfGxvlegUhZBcb74j
	 KRkjIl9OZMw4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DF23809A8B;
	Sat, 11 Apr 2026 19:58:41 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fix for 7.0-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <adofvBbhDgF_HUue@kroah.com>
References: <adofvBbhDgF_HUue@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <adofvBbhDgF_HUue@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.0-final
X-PR-Tracked-Commit-Id: 5a1140404cbf7ba40137dfb1fb96893aa9a67d68
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6b5199f4cf8d87e0952043c814cc3c6d45ae9ef6
Message-Id: <177593751959.3064778.7020803216705662365.pr-tracker-bot@kernel.org>
Date: Sat, 11 Apr 2026 19:58:39 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36164-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 281F63E1931
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Sat, 11 Apr 2026 12:17:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.0-final

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6b5199f4cf8d87e0952043c814cc3c6d45ae9ef6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

