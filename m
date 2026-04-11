Return-Path: <linux-usb+bounces-36156-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gwB6Isof2mnEyggAu9opvQ
	(envelope-from <linux-usb+bounces-36156-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 12:17:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0163DF458
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 12:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4491F30265A2
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 10:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5D8332EB1;
	Sat, 11 Apr 2026 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bhj4RAK0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E49294A10;
	Sat, 11 Apr 2026 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775902655; cv=none; b=tVv2t3y/pVXvoC2YzSeyDQkvwzG4tVa1l4BxFNOndvYwqhagZBZbgTZfnCwTPIKH/SyBJos+98zxqDQJ0NvQ3f9YcRq4+2mNx3hbPG4/WqtClNJR98pLK5cHYGhFCm1IDePkAJtQtdsPKCFdoBtCk3amyWVO8XBnd+yuKWzPgW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775902655; c=relaxed/simple;
	bh=wBXz9AnYy0R44YB5BpTwYTu1aNletIurdPCT1+9WUCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SEP/bkvF7X4istXPwOQZEF1W+ww6/FjUO7xRo1i8vsrDH5Y7DKUrgFYXhBfMN1h30NFBALxE4N33T/peuSTT0uP07lOmD/hVpbGEpfDsEr3Wj1VNFmn+JQdS4O38kdblcK8S16GzMl8sdXiGlE+Imuu6zkw4JShbptOaOABSyn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bhj4RAK0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63319C4CEF7;
	Sat, 11 Apr 2026 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775902654;
	bh=wBXz9AnYy0R44YB5BpTwYTu1aNletIurdPCT1+9WUCc=;
	h=Date:From:To:Cc:Subject:From;
	b=bhj4RAK0zv6spoLX2T8ZGksQTr0cWYah655x1XjRCMjjFj41CV8Nmt8Ufr7iLCJR5
	 MkSBB/Ma7ZwwOk7ufEEurqT+oLaMiPwhbcwyhXsVU0fzcYWkYbp6cCmgc+IGIcPmB5
	 isSkegzR7yn8U9Pb4d1i5xXlgM8MMOTDWUI2cA6o=
Date: Sat, 11 Apr 2026 12:17:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fix for 7.0-final
Message-ID: <adofvBbhDgF_HUue@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36156-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kroah.com:mid]
X-Rspamd-Queue-Id: CF0163DF458
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 591cd656a1bf5ea94a222af5ef2ee76df029c1d2:

  Linux 7.0-rc7 (2026-04-05 15:26:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.0-final

for you to fetch changes up to 5a1140404cbf7ba40137dfb1fb96893aa9a67d68:

  usb: typec: ucsi: skip connector validation before init (2026-04-07 13:35:44 +0200)

----------------------------------------------------------------
USB fix for 7.0-final

Here is a single USB fix for a reported regression in a recent USB typec
patch for 7.0-final.  Sorry for the late submission, but it does fix a
problem that people have been seeing with 7.0-rc7 and the stable kernels
(due to a backported fix from there.)

This has been in linux-next this week with no reported issues, and the
reporter (Takashi), has said it resolves the problem they were seeing.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Nathan Rebello (1):
      usb: typec: ucsi: skip connector validation before init

 drivers/usb/typec/ucsi/ucsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

