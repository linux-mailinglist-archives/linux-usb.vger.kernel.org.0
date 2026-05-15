Return-Path: <linux-usb+bounces-37526-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBW2NziyB2pBCgMAu9opvQ
	(envelope-from <linux-usb+bounces-37526-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 01:54:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C1755973F
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 01:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CF903018748
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 23:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE67C3F8ED5;
	Fri, 15 May 2026 23:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="RYd12mVI"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950E2405C5B;
	Fri, 15 May 2026 23:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778889263; cv=none; b=BJfAcgtEwPoKSviNsBUOTazAOTlL0Gu61LO8UkVee9+u94IdS/eymsFXMsf0OGMSDW/Ba9qevntYeCVb6DCNAkF288o7mQNvPkMGnJU1Jh0a1OPve572//hnJTYsX021w8usZtb0JlvKJw8P44SZQnQa49KhWgATb6I6q+lzGb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778889263; c=relaxed/simple;
	bh=qu4IX9bQ1ifg1qWuHF+R0gXkamy/tQ7cEwzX5PsXITY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uG8TBIulvLhWzLQVJM6ATxpLsJbbqhi2dta2PBK8t61RrCOg2G0wUc6QV4OCvJx1QcDk6nvmWHFh8OJ1j17JUCkvECUuqKvmf3idJARRIjEPqOiaZSW5NwLECrEV573tkEUgaHsNahjvoz4ZUh2xwe/vo/KgjzPnmAn6fyylKoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=RYd12mVI; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1NjrKazo/tNyCj+ge948tpegYxYh1vnDTn30wqbiaSc=; b=RYd12mVIeSMt4JGUqUD9rVNv1f
	Stz0NcIEsMx0Y9zpkDDKG1kSh30q0PSuLiTu6uOjEY+x0j0TrXxh9YQdtPP+QMx/XghRNltzkcIm1
	KRvam+EQjOjQYZtu5h068epX8ZjvHt3j5em7KTiGy7uoI/g5fUfASiRXezJMOh1s6bZ+AcbrFZMFC
	FLdBHc0exm0vaMg2z4Qm6vTIv8rPINICmE1s9HAdV7nqpBGCNpBYeGmxiJtq2XGxhjt+KqFM8ZYMN
	IHkUg76xhTcdOtWEDj/MPOUIVyWkoU3GqJbcJwolW24n/+/vqRToxYYz+14X8HQSs4zVlyhade5LQ
	709JbEpQ==;
Received: from 186-249-149-153.shared.desktop.com.br ([186.249.149.153] helo=[192.168.1.68])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wO2MF-000keM-5G; Sat, 16 May 2026 01:54:19 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: [PATCH 0/2] usb: atm: ueagle-atm: cosmetic changes to .probe()
Date: Fri, 15 May 2026 20:54:11 -0300
Message-Id: <20260515-ueagle-atm_cosmetic-v1-0-9a15e5e45bd7@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOyB2oC/x3M3QpAMBiH8VvRe2y1yZBbkTTzx1u+2kZK7t1y+
 Dt4noc8HMNTnTzkcLHnfYtQaUJ2NtsEwUM0ZTIrpFZanDDTAmHC2tndrwhsRT+qSmrkBqWiWB4
 OI9//tWnf9wOyv15rZQAAAA==
X-Change-ID: 20260515-ueagle-atm_cosmetic-bf1805e4ae71
To: Matthieu CASTET <castet.matthieu@free.fr>, 
 Stanislaw Gruszka <stf_xl@wp.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-dev@igalia.com, linux-atm-general@lists.sourceforge.net, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-Rspamd-Queue-Id: 52C1755973F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37526-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[free.fr,wp.pl,linuxfoundation.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.800];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,igalia.com:email,igalia.com:mid]
X-Rspamd-Action: no action

This series does a couple of cosmetic changes to ueagle-atm's .probe().

Patch 1 adjusts the 'device found' probe message.
Patch 2 adds a missing 'leaving  uea_probe' debug message.

With:
  # echo 2 >/sys/module/ueagle_atm/parameters/debug
  # echo 'file drivers/usb/atm/ueagle-atm.c +p' >/sys/kernel/debug/dynamic_debug/control

Changes:
  [   84.813964] usb 1-1: [ueagle-atm vdbg]  entering uea_probe
 -[   84.813970] usb 1-1: [ueagle-atm] ADSL device founded vid (0X1039) pid (0X2101) Rev (0X2581): Eagle I
 +[   84.813970] usb 1-1: [ueagle-atm] ADSL device found with vid (0X1039) pid (0X2101) Rev (0X2581): Eagle I
  [   85.571855] usb 1-1: [ueagle-atm vdbg]  entering uea_load_firmware
  ...
  [  148.697655] usb 1-1: [ueagle-atm vdbg]  leaving  uea_load_firmware
 +[  148.697665] usb 1-1: [ueagle-atm vdbg]  leaving  uea_probe

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
Mauricio Faria de Oliveira (2):
      usb: atm: ueagle-atm: adjust 'device found' message
      usb: atm: ueagle-atm: add missing uea_leaves() in uea_probe()

 drivers/usb/atm/ueagle-atm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260515-ueagle-atm_cosmetic-bf1805e4ae71

Best regards,
-- 
Mauricio Faria de Oliveira <mfo@igalia.com>


