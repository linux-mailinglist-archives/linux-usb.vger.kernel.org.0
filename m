Return-Path: <linux-usb+bounces-36316-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DSBOej65GlZcwEAu9opvQ
	(envelope-from <linux-usb+bounces-36316-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 17:55:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D27424896
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 17:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AD583012308
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 15:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8974329BDBB;
	Sun, 19 Apr 2026 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkQqwm2w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1336628B4E2;
	Sun, 19 Apr 2026 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614115; cv=none; b=JtGGGz/YB/Z+nvhcVzRJiNCzfa57KnctYY/HgAXc4Px9FtxvMtvxTbvyFvSDImtlrMOx0ugnD/B/pj0m2zZc/clH06YVwi9vfj+eGVyUKfDw50IWCN+r24BoT/6zkFTNCVL1DNkcXPl6JP2/0ERuNXZe8zcenKF0HdIeAo/r/oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614115; c=relaxed/simple;
	bh=pHYYE565YbbalD0S8nWM7JEMhBy5KlynRueV2OYzQC0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gva5p3PxUCHF088oi6vS4tm+TlFcpNNtJQpzc+FBphLipBf6Fro9ycYlDoHg+I3oyjgInhVvuqzSW2T02cpUiUQZxJAB7DY1VttzMHJMelpEl8tjsw+ngqaTwC6Ximp6JaAkgJLipvmNKnFRXAAbrEi7WvpPooMdfMAS7yxl0Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkQqwm2w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E352FC2BCB8;
	Sun, 19 Apr 2026 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776614114;
	bh=pHYYE565YbbalD0S8nWM7JEMhBy5KlynRueV2OYzQC0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DkQqwm2w5onDVMnCZMnmo2JiBBgfCrNRUazrDIvxX+juMg8l8DpsVosDI+po+Jy7P
	 zm3iKg1NX/GhwVx8PJ0X7TJlg0KZKcl80vdUemOWFQZvMzu+VY9Ox0OQOGloYu8IyO
	 hijlbcpbFUejWtkFxuNdWqU0ialMRyfvBRZErZGlun60QG6MtSSueJMh0ftDpmz31F
	 UwOHbcKWiQK+LL1QEtXhh/EE1/5NWjnvV359Ih6pubWUXRFcNTdt3vESzm2xGxiGe8
	 hQ8u/Uc7CrTVwEarvKVluZrUPXXNSV5vwO6OoBaNJuZgxNF2MawDJ1+L9Aa/XupNOu
	 56VCjpU3lx42A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E08380CEF9;
	Sun, 19 Apr 2026 15:54:41 +0000 (UTC)
Subject: Re: [GIT PULL] USB/Thunderbolt driver changes for 7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aeTev23E6mRmbsJu@kroah.com>
References: <aeTev23E6mRmbsJu@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <aeTev23E6mRmbsJu@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.1-rc1
X-PR-Tracked-Commit-Id: 87117347a0e77f528f357faa2230d5caffcd1b4e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 99ef60d119f3b2621067dd5fc1ea4a37360709e4
Message-Id: <177661408027.808114.4323685788160666312.pr-tracker-bot@kernel.org>
Date: Sun, 19 Apr 2026 15:54:40 +0000
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36316-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A9D27424896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Sun, 19 Apr 2026 15:55:11 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/99ef60d119f3b2621067dd5fc1ea4a37360709e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

