Return-Path: <linux-usb+bounces-30988-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BF9C8D4EB
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 09:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BD9B0343AA5
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 08:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A86322C66;
	Thu, 27 Nov 2025 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7dBK9Ip"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63744320A00;
	Thu, 27 Nov 2025 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764231538; cv=none; b=fN2xloa9zFn3KxpXkB4kpvY+m4S72yDgHnkkfHAshsS4bte+4cSH1KU0T9HxxVNq8MpQGPHgm4JeOi/5xOJF3N7616yod2iFJAhd9TCO70adZtIXx3x0nTupUNJgnVefPhZNRLe/aKDGXNk21NDNqfl3usXtI8Wx/8vpR5ohjLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764231538; c=relaxed/simple;
	bh=juhnSF2HavJvkTWKtwSuexvU9Ui7blsIIbUnzgubhTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJHrP815XBr+hKNsmW/0CMUsK9sjDybVNYhGtt7LM3zgWQn1iBAK0cqVWaoh6X/5WbTcBEG3WlVzH7kbstRK1/V50vRWWVNC/q4eo5U39KbzyKw1b2wSwihFtWL2QuXk9fSVPewmBIFEBUcFRMix8jFtehN4jNT+22x4cWkd6VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7dBK9Ip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5B7C4CEF8;
	Thu, 27 Nov 2025 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764231538;
	bh=juhnSF2HavJvkTWKtwSuexvU9Ui7blsIIbUnzgubhTs=;
	h=Date:From:To:Cc:Subject:From;
	b=f7dBK9IpQVaHTm9vlHIa2QA3F8EbxHejGkIWx43jH70D9vBsFMFZ/Q8LW5QSwh/VO
	 rFNGhszpI79P17W2xeZpS3HKG1HV1pii3PdlPQ61LIjm3udZtnNGrje6V2HXKRnjnu
	 I+Smi3KJWK1zEoJtT1GWsLEOBhiyGPrHAWJJnrOcv1m6RQ5Mm9migmXUBFhOWiE2Ab
	 JKXiDDwKhkWbfiR9FPH43NTuHrl9KNjA1FdTmnBHh8ESG/m0d2M+FHtLWGOssN71N2
	 BdOBwOv9bzWl+zw5IrDuJnbw+ictkBv0BT2joenMn8guzdoSggbDXxC9t7OiOW8BYA
	 baGZHpFh95GbA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vOXDP-000000004Qn-2qVc;
	Thu, 27 Nov 2025 09:18:59 +0100
Date: Thu, 27 Nov 2025 09:18:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial updates for 6.19-rc1
Message-ID: <aSgJc4X9NRkWyNJ4@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.19-rc1

for you to fetch changes up to 072f2c49572547f4b0776fe2da6b8f61e4b34699:

  USB: serial: option: move Telit 0x10c7 composition in the right place (2025-11-26 17:09:30 +0100)

----------------------------------------------------------------
USB serial updates for 6.19-rc1

Here are the USB serial updates for 6.19-rc1:

 - fix belkin_sa and kobil_sct TIOCMBIS and TIOCMBIC ioctls
 - match on interface number for dual-port ftdi devices with reserved
   jtag port
 - do not log reserved ftdi jtag ports on probe
 - apply ftdi_sio NDI quirk remapping 19200 bps consistently
 - drop ftdi_sio NDI quirk module parameter
 - clean up ftdi_sio quirk implementations
 - add more modem device ids

Included are also various clean ups.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Fabio Porcedda (2):
      USB: serial: option: add Telit Cinterion FE910C04 new compositions
      USB: serial: option: move Telit 0x10c7 composition in the right place

Johan Hovold (16):
      USB: serial: belkin_sa: fix TIOCMBIS and TIOCMBIC
      USB: serial: kobil_sct: fix TIOCMBIS and TIOCMBIC
      USB: serial: belkin_sa: clean up tiocmset()
      USB: serial: kobil_sct: clean up tiocmset()
      USB: serial: kobil_sct: clean up device type checks
      USB: serial: kobil_sct: add control request helpers
      USB: serial: kobil_sct: clean up set_termios()
      USB: serial: kobil_sct: drop unnecessary initialisations
      USB: serial: ftdi_sio: match on interface number for jtag
      USB: serial: ftdi_sio: silence jtag probe
      USB: serial: ftdi_sio: rewrite 8u2232c quirk
      USB: serial: ftdi_sio: clean up quirk comments
      USB: serial: ftdi_sio: rename quirk symbols
      USB: serial: ftdi_sio: enable NDI speed hack consistently
      USB: serial: ftdi_sio: clean up NDI speed hack
      USB: serial: ftdi_sio: drop NDI quirk module parameter

Slark Xiao (1):
      USB: serial: option: add Foxconn T99W760

 drivers/usb/serial/belkin_sa.c |  42 ++++-----
 drivers/usb/serial/ftdi_sio.c  | 200 +++++++++++++--------------------------
 drivers/usb/serial/kobil_sct.c | 210 +++++++++++++++--------------------------
 drivers/usb/serial/option.c    |  22 ++++-
 4 files changed, 182 insertions(+), 292 deletions(-)

