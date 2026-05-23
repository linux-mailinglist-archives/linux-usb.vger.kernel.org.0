Return-Path: <linux-usb+bounces-37968-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNcgNsRmEWo2lgYAu9opvQ
	(envelope-from <linux-usb+bounces-37968-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:35:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A305BDF2E
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 467C3301A523
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 08:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B87346AC4;
	Sat, 23 May 2026 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0dW7p45"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3463723FC41;
	Sat, 23 May 2026 08:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525309; cv=none; b=BAHqFlmtIhjmFUCqMxZfAjjxs9KszV5bhP6lgKhMRwid4Zd+PR0ThcVJ9f/r47DMzv4MKx56uF9ucwUNUQll3zMcgYDrsu/PbC5Te9IGS3aJcwl6DIbnIybklfPz3A+A40cM5/b8c9XSMdL4TZ0mYa2fOL3/0vTC4Ahz+Q3K0eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525309; c=relaxed/simple;
	bh=VZmL4UpAzNuZvD9Q7drkb5i37CcPCBJdUMf7f+tvhrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F/P0W0laSAJk8Ur3CgiZSVr3CRmOaW+9LVqRKfnhcrTxjslcY6Im5Tbqs3uEvjwjOrDPINKGEyImdTKGPRINW2LtPfv8lqbBW3TDfKtGJdCvHwgdZrRw8J4oTV9uhGpMg+e9KDFOlozFzZuBNGfXvxadu/4jzeVPej7EdBGRX00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0dW7p45; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19321F000E9;
	Sat, 23 May 2026 08:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779525307;
	bh=j+krLquwL7mqJ1I7jEP1/X++eJehbYdoriFkzs2ttNA=;
	h=Date:From:To:Cc:Subject;
	b=V0dW7p45uPGbA/6SmZHH3peKWeopC5b4riFSdQ4p62BNN9Hx6wiXQaaT9y3aXnNWm
	 SP+dvl10tjMyQrHHarpdA3LUr64qRE094D4p7v6dcYRiYfiplw1gDKIia++yTvvR1R
	 6dnyakaG5dXRhbXuZxZBpvYwP33SebQYO5kprfQFVFife7YEPO0SaR0Nc0UhuaOfz5
	 1kaXtIGH1WgJrhT186t0jzFKSr7wSm5dz7g9WTp5ndyegYRuLOgIe6f+D/8mlVTG82
	 KK/W6Bka3/xghXEQUzzW4PE94jK7x3z5GWICUUZv0X6bIaSzPqGf/57Sw7ieBrsxl/
	 nuDFZvIJ781pA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wQhp3-000000049V9-1JcX;
	Sat, 23 May 2026 10:35:05 +0200
Date: Sat, 23 May 2026 10:35:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial fixes for 7.1-rc5
Message-ID: <ahFmuYsT3E8GcG5h@hovoldconsulting.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-37968-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 56A305BDF2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.1-rc5

for you to fetch changes up to 9f9bfc80c67f35a275820da7e83a35dface08281:

  USB: serial: cypress_m8: validate interrupt packet headers (2026-05-23 09:35:26 +0200)

----------------------------------------------------------------
USB serial fixes for 7.1-rc5

Here are a number of fixes for memory corruption and information leaks
due to missing endpoint and transfer sanity checks dating back to
simpler times when we trusted our hardware.

Included are also a fix for a recently added modem device id entry and
some new modem devices ids.

All but the last five commits have been in linux-next and with no
reported issues.

----------------------------------------------------------------
Jan Volckaert (1):
      USB: serial: option: add MeiG SRM813Q

Johan Hovold (8):
      USB: serial: digi_acceleport: fix memory corruption with small endpoints
      USB: serial: keyspan: fix missing indat transfer sanity check
      USB: serial: mct_u232: fix memory corruption with small endpoint
      USB: serial: mct_u232: fix missing interrupt-in transfer sanity check
      USB: serial: cypress_m8: fix memory corruption with small endpoint
      USB: serial: mxuport: fix memory corruption with small endpoint
      USB: serial: omninet: fix memory corruption with small endpoint
      USB: serial: safe_serial: fix memory corruption with small endpoint

Wanquan Zhong (1):
      USB: serial: option: add missing RSVD(5) flag for Rolling RW135R-GL

Zhang Cen (2):
      USB: serial: belkin_sa: validate interrupt status length
      USB: serial: cypress_m8: validate interrupt packet headers

 drivers/usb/serial/belkin_sa.c       |  3 +++
 drivers/usb/serial/cypress_m8.c      | 20 +++++++++++++++++++-
 drivers/usb/serial/digi_acceleport.c | 23 +++++++++++++++++++++--
 drivers/usb/serial/keyspan.c         |  4 ++++
 drivers/usb/serial/mct_u232.c        | 26 ++++++++++++++++----------
 drivers/usb/serial/mxuport.c         |  8 ++++++++
 drivers/usb/serial/omninet.c         |  9 +++++----
 drivers/usb/serial/option.c          |  9 ++++++++-
 drivers/usb/serial/safe_serial.c     | 11 +++++++++++
 9 files changed, 95 insertions(+), 18 deletions(-)

