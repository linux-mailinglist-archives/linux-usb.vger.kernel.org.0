Return-Path: <linux-usb+bounces-37178-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMi2HMnm/mlLzAAAu9opvQ
	(envelope-from <linux-usb+bounces-37178-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 09:48:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E74FE914
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 09:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E13BA301B705
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 07:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BE53806C7;
	Sat,  9 May 2026 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KAvTYgOL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22A73148D2;
	Sat,  9 May 2026 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778312897; cv=none; b=oHOokmzgjjiAcIXc1T7jf0fW/4Yx6MWx00LulrXu36J5kcy+u+Ej+uPfp+NSKk02uCpyXH6Dfx+yKPXw4N32qGU6oX5LLq3ArWNrPr3KUBiZfvtaHDxqh4AKTx8wMEEjNhfZEVP09WiCqfxRiK5Slgw/g9f29U/iFJ8DVM3zig8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778312897; c=relaxed/simple;
	bh=+bxuBYXJ2dSaZ5ODbSmVYN7KzsX16xgxp628RjMjAsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i29jpiT6wNDsdC8VAyrNgRf4xzlSORWOwToYFFZm3/GtZMaMGBRbTGKJICNiWPyG1ejpjDqwTaJ5ycg/VeBvc9H8FiPg0aHPjcRUHNkKR28kbvfSRtkb8OsRH5OyKeZcmpJikKcoSCtdn+GgJEKB1VOQdd3w0yimJ7rTyiVsh+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KAvTYgOL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3270C2BCB2;
	Sat,  9 May 2026 07:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778312897;
	bh=+bxuBYXJ2dSaZ5ODbSmVYN7KzsX16xgxp628RjMjAsM=;
	h=Date:From:To:Cc:Subject:From;
	b=KAvTYgOL32X86hDh3CgdjjAG4cqrnN26HhEXGTRU4hIk6eKIRibDf2xXADGhri3V2
	 IKAJZjeGrIUR1iOqr3yrA3R2zQ/LZpFZtXOBfQ8OCvtWHDLKjk/gnvksAfvSGSTGBh
	 eVFtYXx1kWpPcRCo/7Pawwfah8+sdKlaC+dwSp8Y=
Date: Sat, 9 May 2026 09:47:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 7.1-rc3
Message-ID: <af7mlZd5JnKmFqzO@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: BE8E74FE914
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_FROM(0.00)[bounces-37178-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.1-rc3

for you to fetch changes up to 4fd44d47e8ab760eef11968d093200cce6752d95:

  Merge tag 'usb-serial-7.1-rc3' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus (2026-05-08 17:18:43 +0200)

----------------------------------------------------------------
USB driver fixes for 7.1-rc3

Here are some small USB driver fixes for 7.1-rc3 to resolve some
reported issues, and a new device id.  These are:
  - usblp driver heap leak fixes
  - ulpi driver memory leak fix
  - typec driver fixes
  - dwc3 driver fix
  - omap dma driver fix
  - new option driver device id addition

All of these have been in linux-next for over a week with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Aaro Koskinen (1):
      USB: omap_udc: DMA: Don't enable burst 4 mode

Amit Sunil Dhamne (1):
      usb: typec: tcpm: reset internal port states on soft reset AMS

Fabio Porcedda (1):
      USB: serial: option: add Telit Cinterion LE910Cx compositions

Felix Gu (1):
      usb: ulpi: fix memory leak on ulpi_register() error paths

Greg Kroah-Hartman (3):
      usb: usblp: fix heap leak in IEEE 1284 device ID via short response
      usb: usblp: fix uninitialized heap leak via LPGETSTATUS ioctl
      Merge tag 'usb-serial-7.1-rc3' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Selvarasu Ganesan (1):
      usb: dwc3: Move GUID programming after PHY initialization

Xu Yang (1):
      usb: typec: tcpm: fix debug accessory mode detection for sink ports

 drivers/usb/class/usblp.c         |  3 ++-
 drivers/usb/common/ulpi.c         |  5 ++++-
 drivers/usb/dwc3/core.c           | 12 ++++++------
 drivers/usb/gadget/udc/omap_udc.c |  4 ----
 drivers/usb/serial/option.c       |  4 ++++
 drivers/usb/typec/tcpm/tcpm.c     | 27 ++++++++++++++++++---------
 6 files changed, 34 insertions(+), 21 deletions(-)

