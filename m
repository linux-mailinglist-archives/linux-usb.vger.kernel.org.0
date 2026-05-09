Return-Path: <linux-usb+bounces-37185-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHfxBuBV/2mo4wAAu9opvQ
	(envelope-from <linux-usb+bounces-37185-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 17:42:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB1D50058C
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 17:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30EE1302A2DD
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 15:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0122E2D979C;
	Sat,  9 May 2026 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXyQ+qnN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792582580D7;
	Sat,  9 May 2026 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341270; cv=none; b=lMeXYmGIiarid/OMPOiZY6mEH/0eIuDcuzY7bxxNNe8kT0xJIdNrNCj7ovoJJEZvwMEt71n6eLnEixj7QpTexx3ZIGj4/znA1InZ3K4PtnR7izCdYJ4iA93siYlKpX/YeXchQF6dy2d0zBcwJ68jI1f4MfQZmbpzUgDRdd2BRqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341270; c=relaxed/simple;
	bh=Jmxi+vrtLZDU2oIr/LtcKcBWNd+h5gMKWGNqI3/0jlk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Yj2t9DEsrRUXXRXwRukSgrb9qp5o3jHnXXlbHZ7CmWsOo2/6Qn1ixXS+83Q5ti/OmEExdZmRXC7dg1TCCB4ex7blyPGffrpfsj9KSyqtdrnBJJ8fMYI0pq2cwUJiNVCEDP+ZbIvXc1aKyF/2JilPda1BVBHjM4xj/ARZdaKG3SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXyQ+qnN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D66DC2BCB2;
	Sat,  9 May 2026 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778341270;
	bh=Jmxi+vrtLZDU2oIr/LtcKcBWNd+h5gMKWGNqI3/0jlk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eXyQ+qnND7hs70lf00UodZGTKqR9PUS+rKvkvH435lKp1/W+LExiW4m6Rw24HwrlE
	 cBXU/D+4Qul0ZU5cZT0DT5NBUNRlVF6yzSFnNg4diShuQxvzS0mqVGRfMwZzMTgmbc
	 CKMgdZoBKd5mEim5w3bMGZdOUfag+4sX5Y6ikHlMgElANE442aYxItWffRYMn7uXbn
	 hPo0duNdNQrmWwIUdCS1gZJmsoLmxqj0/B+X/c6KPPCR3tmLbtrAe1VZA4fLu3MrsP
	 NwLBGN4D98NY4bRvnNa3NLOBpcQjdgFa4/EhTS5zCANxLO1iUObG4MrTS4JdthEYvY
	 zqZCeVin2D8uQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9E4643811A56;
	Sat,  9 May 2026 15:40:19 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 7.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <af7mlZd5JnKmFqzO@kroah.com>
References: <af7mlZd5JnKmFqzO@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <af7mlZd5JnKmFqzO@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.1-rc3
X-PR-Tracked-Commit-Id: 4fd44d47e8ab760eef11968d093200cce6752d95
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fe3e5bc9e3c280017d4ba05d7fcc8997029e53cd
Message-Id: <177834121846.1109995.16840231738688692453.pr-tracker-bot@kernel.org>
Date: Sat, 09 May 2026 15:40:18 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 6EB1D50058C
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-37185-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The pull request you sent on Sat, 9 May 2026 09:47:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fe3e5bc9e3c280017d4ba05d7fcc8997029e53cd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

