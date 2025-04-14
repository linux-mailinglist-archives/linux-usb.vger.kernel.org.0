Return-Path: <linux-usb+bounces-23043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD8A88D12
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 22:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B27931895E83
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 20:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E487D1DFDBB;
	Mon, 14 Apr 2025 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="l8cL8YH3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E9B194A6C
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 20:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662502; cv=none; b=FJAuDtZDN2VptzyowTEmQu8ekZOHXg5x/MvPXQMFjV2VypeElfSstWovzf0h/mR8fCQueb71jgYa7/ZTTCtflu8TUafdR4I46tF6gymSbq0ctkzKahsHqP3bFtM6uiKgGm9y54zgRacPx/z1xxJObywOTkRDm8bjltKlrnYwt/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662502; c=relaxed/simple;
	bh=mJsv2tM/I8C66voig+fQdm4mxuvEjmzB9vpmbCCufdw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HLSWYB9vL6S7QLiKj0ONLneYRUPePbuoSzI50za3af1yqHJznK8+BWOdth7yAL1zNYyzh3JzahbXdAoe7eU9ScIti4A45yBAeqMdkD2/QgKgPH98uNEyYt5WOy5zWCBS2BUpSlxERSx3x1yIiEZlPMgjN9C0ry5kUBzFKzXYhqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=l8cL8YH3; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744662498; x=1744921698;
	bh=5qEU6hzSwCnesMZRIBLEpCHkGx+ziAMm4+Nl/oZk6/U=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=l8cL8YH3Dlx/HaA2tXeQfGdzsN0aU+S4SmL2c3K6Q92JGNmIvPA0Q/ez9PANUsnEp
	 2MB/TaXj620gElAURPuXCeuPyqN6DM2TyCkwortXofWuWbbiNoUQyRuYOybOHF0Bj7
	 430t2AKHMiFEmbmi+UpijCtaIbMStov8haRms291DDxNWI09vwmzO3hzx56KqChExl
	 XjcQAjz627O8KHoF0EFuYS/5gb24ZhZmjUYtkwS55JLR6wDPTwQ9/woQupTF3thC6M
	 qH3CreqFHaPoBX2uw5m6XihBKSNAthc3Fwe6wcBQHlV0oZyHL1s51jHuzf5Qakt5jZ
	 NgcPwRjytdDgg==
Date: Mon, 14 Apr 2025 20:28:10 +0000
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v2 RESEND 0/6] USB: serial: ftdi_sio: Code style cleanup
Message-ID: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: cc50f789df1fcf2fa6aebd54ffaea40d9690eb68
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series fixes spotted code style issues in ftdi_sio driver.

v2: Split the patch into smaller patches

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>

Dominik Karol Pi=C4=85tkowski (6):
  USB: serial: ftdi_sio: Remove space before comma
  USB: serial: ftdi_sio: Add missing blank line after declarations
  USB: serial: ftdi_sio: Remove superfluous space before statements
  USB: serial: ftdi_sio: Fix indentation made with spaces
  USB: serial: ftdi_sio: Fix misaligned block comment
  USB: serial: ftdi_sio: Remove space before tabs

 drivers/usb/serial/ftdi_sio.c     | 16 ++++++++++------
 drivers/usb/serial/ftdi_sio.h     |  2 +-
 drivers/usb/serial/ftdi_sio_ids.h |  4 ++--
 3 files changed, 13 insertions(+), 9 deletions(-)

--=20
2.34.1



