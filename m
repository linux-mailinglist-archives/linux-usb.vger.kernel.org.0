Return-Path: <linux-usb+bounces-36137-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFamEinx2GnrjwgAu9opvQ
	(envelope-from <linux-usb+bounces-36137-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 14:46:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F0F3D7A65
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 14:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F390303701A
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 12:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE5E223323;
	Fri, 10 Apr 2026 12:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6HXl4YB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DE3CA4E;
	Fri, 10 Apr 2026 12:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825063; cv=none; b=ocdOyY2ZsU3rZKJ9K2NWXJeZYimwbta2ulxyd4dRb5mmy3LaZP7PrFDoZt/7XMAx9X5hGcvJ0C5kJuMlEZW96N9mpGfhbcQLLXx1+/XT+RQj/fAv18I/8QZMW5G2qL0S7V2kp+EsxyBMRKpeZSMNYwEU5/05gMaBFfiLJS6v9dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825063; c=relaxed/simple;
	bh=VFbaYhmbD7iLzoYfPC2pmu/ZD1mH/qbppVKe9jNhUM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0gQSuHAXaOTORDOzSrpoIgr948Lox5Ia0LD0wVsvay+/bTeIheJ4b0ei/+w/ODja7tibfoMwd3RzD6WaxFH849fm3k8h7P2lF51CYTBIQTAJprXm/UCmM/nHHWPrv7nA+Uvy7q1BtOGsm6aM/ZG2eomHTD2GxZpw9/wHTJ5EfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6HXl4YB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E70CC19421;
	Fri, 10 Apr 2026 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775825063;
	bh=VFbaYhmbD7iLzoYfPC2pmu/ZD1mH/qbppVKe9jNhUM8=;
	h=Date:From:To:Cc:Subject:From;
	b=B6HXl4YBp7MoFbTsjZYRkgaBkIBKDrUwz+MzOuEqTfh4jnBMudQTm9PL95q9wxU0z
	 5cWqffMWW/IS/gPIYsxOjBq8cSkxCw2QkE38qsbREqNtlVVuFnlqVOwvOmwV/okNxL
	 AouQopD7ZZBT9VpWArpCBWJK98pki3OgZbPfv01TxnPFwr+o3N9pu5HS+kExRT3760
	 N1HDuv1jUYhEexCATfUDUPWEmOcxdqGh4PxLNcKqvh7IW2yYs+2dD1Ruw8IWBW72Vn
	 VN25wdV2608cW76eXOeogzWJat2xs8W1E+7bCFJemmhDeWy0SLECCZEg+k7bG8Zhqy
	 NcPaBZyUNYaXQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wBBDh-0000000017V-0HF8;
	Fri, 10 Apr 2026 14:44:21 +0200
Date: Fri, 10 Apr 2026 14:44:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial updates for 7.1-rc1
Message-ID: <adjwpTq07DQKRqD2@hovoldconsulting.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36137-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D5F0F3D7A65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c:

  Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.1-rc1

for you to fetch changes up to 37d9c4c055c3b3357c61dba2335ab21340e33553:

  USB: serial: iuu_phoenix: fix iuutool author name (2026-04-08 09:37:43 +0200)

----------------------------------------------------------------
USB serial updates for 7.1-rc1

Here are the USB serial updates for 7.1-rc1, including:

 - use strscpy() instead of strcpy()
 - new modem device id

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Ai Chao (1):
      USB: serial: ti_usb_3410_5052: use strscpy() instead of strcpy()

Fabio Porcedda (1):
      USB: serial: option: add Telit Cinterion FN990A MBIM composition

Thorsten Blum (1):
      USB: serial: iuu_phoenix: fix iuutool author name

 drivers/usb/serial/iuu_phoenix.c      |  2 +-
 drivers/usb/serial/option.c           |  2 ++
 drivers/usb/serial/ti_usb_3410_5052.c | 16 ++++++++--------
 3 files changed, 11 insertions(+), 9 deletions(-)

