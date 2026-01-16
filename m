Return-Path: <linux-usb+bounces-32426-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6163D2F71C
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 11:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD03030116DB
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 10:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D83328260;
	Fri, 16 Jan 2026 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cw7ULLq0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50841E0DE8;
	Fri, 16 Jan 2026 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558778; cv=none; b=TE5qxcVZdk7zSU3R6vst1lcdJGXR/PRH7d/WXhY9lWDZBsJpog6dcVqvS1/p3TFB1V9eIe33GWtkyNKMOnpvx5y1kTHxv+t8PnTo217AgJIxqfsBfYLMwwSSrJlBenuUAlPkdhSXDR3HoneNSwg8507oQQ8qsGPD3bYsRNICejY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558778; c=relaxed/simple;
	bh=F87RsPoWr/pYEzbtWKws6LhcryLOBXf4XlFgfTMkDho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uYXXVY1mOsnG5Nrb0QJKoTkBRUDm4/j0ytJRgoiZbO4Chn9PCnPBgzaLaQgam85udu87PNqRT2PoimXReTocL7bVNvJzUsjuk2oEDIXcA5xiY/aEaE8gBLvUVNYgiTJZ7WqutjgukhVrDEROTe3T4+inQ2rb+GUaBzaRtZMnQzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cw7ULLq0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CBF9C116C6;
	Fri, 16 Jan 2026 10:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768558778;
	bh=F87RsPoWr/pYEzbtWKws6LhcryLOBXf4XlFgfTMkDho=;
	h=Date:From:To:Cc:Subject:From;
	b=Cw7ULLq0Z7to/f/nymQWNVd+TC9bGZZYf/J5siU/CCCEIi7Fl3SW0On3Hgp0Lwas9
	 SKPX+pAt9HS3wbBFJ1GsIJX4wS6QeT88rGSw5ggsvAQ1khHvluXk/TA5J8gOo4MGRO
	 xez9hndvnpHXuf9TAubUnM1nsmE8snO4Xl8Grdp3LI7Q36vTQSE0bOd1bFtEmV1vUy
	 fOYQ2sq6cNyLnr0Vp/j0J/OYg+RjghCfrw5Es4mRpvlHknlb+MD33DGAw4z6vu8eDM
	 +duO2WiCY2X1OemZCk96O0rhvRrj9lU6rySUt+ztJx9/vK5KeM8WxgrGDgg43Cmx2i
	 ls94HGHb6Ak9g==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vggvW-0000000063V-286l;
	Fri, 16 Jan 2026 11:19:34 +0100
Date: Fri, 16 Jan 2026 11:19:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial fixes for 6.19-rc6
Message-ID: <aWoQtivAkG0Dt2pn@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da:

  Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.19-rc6

for you to fetch changes up to cd644b805da8a253198718741bf363c4c58862ff:

  USB: serial: f81232: fix incomplete serial port generation (2026-01-13 15:59:07 +0100)

----------------------------------------------------------------
USB serial fix for 6.19-rc6

Here's a fix for an f81232 enumeration issue that could prevent some
ports from being enabled (e.g. during driver rebind).

Included are also some new device ids.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Ethan Nelson-Moore (1):
      USB: serial: ftdi_sio: add support for PICAXE AXE027 cable

Ji-Ze Hong (Peter Hong) (1):
      USB: serial: f81232: fix incomplete serial port generation

Ulrich Mohr (1):
      USB: serial: option: add Telit LE910 MBIM composition

 drivers/usb/serial/f81232.c       | 77 ++++++++++++++++++++++++---------------
 drivers/usb/serial/ftdi_sio.c     |  1 +
 drivers/usb/serial/ftdi_sio_ids.h |  2 +
 drivers/usb/serial/option.c       |  1 +
 4 files changed, 51 insertions(+), 30 deletions(-)

