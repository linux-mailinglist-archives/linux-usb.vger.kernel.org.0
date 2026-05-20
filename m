Return-Path: <linux-usb+bounces-37809-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AbbKQs4DmpC8gUAu9opvQ
	(envelope-from <linux-usb+bounces-37809-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 00:39:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 452CC59C2D6
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 00:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 200433156DF1
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 22:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CED3AD515;
	Wed, 20 May 2026 22:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="WVwcdHCP"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA5A369999;
	Wed, 20 May 2026 22:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316387; cv=none; b=vD2PCGZr88F1BVjXvX1NDZL+mPtCZdEp+xvAGSD2GhC3XAEhe6ty8JJyjWU8fTCaKCe6XUkcECAPkMaE+gxyMI9LyuoXfy6IR21O1h91Vr/bzovhsmWJG65uOdxy5jUvEuHHC/8m9h1v0U7VXrA84eh/nz4TR6HjuFRGJQR+wtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316387; c=relaxed/simple;
	bh=bqJlXNfgQxeFhpL4oFJ1ZuOUhmbGwqho6su8niqBOtk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZXUUn+tz1NTN3vSPvi2Nvoc0XLcYWwL1mD5cN8SAWd3JRR2Qu6lP82LVehCyPyX74w/qqrPoUZt4EwhieH+hQ9Y1/gjr3wmzNNTO8zzbvhHxxhe4FPZrVIStLab/Cml2fwkHPbHVTzNhEiagL1+5yv5Cqep7ZSdJ9N4xZXl9aIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=WVwcdHCP; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=COpAPkdusTvRwNwZM2Z+gzFyBpXNaJflceCxUUPT36Q=; b=WVwcdHCPTu+KSguzxC4EnwnkLX
	ovGGIC3TRHFPVRKS3CTurXopw3yapgMci1WQUhq4dOIhkiIJzaTLE9Qf/sfpEw14nyPruTE01oLdb
	cL90MpH2Kfzgi7iO3KnOD8AOR1/lnHHG++54HpFf3dm/JQaimi1vsCWVGXBDWTF/VyZXXzucMQz4X
	1+FGyI+0lsLgJKWsubpPp0Et3Xa2jK5fNoI8XHKGueNJIh4CKr+mzm47VLgqnCgQcLfvVt4sH/xOZ
	gXOhoj2AgpdfzZT4FOnvSbpHSJbYpB9uJ2dbZk9h31g94EYFykx0UO9AegnWHP/6PPfftr6hCqvfj
	7Y9LWN/Q==;
Received: from 186-249-145-161.shared.desktop.com.br ([186.249.145.161] helo=[192.168.1.68])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wPpTH-0043AI-5C; Thu, 21 May 2026 00:32:59 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: [PATCH 0/2] usb: atm: ueagle-atm: debug message changes
Date: Wed, 20 May 2026 19:32:49 -0300
Message-Id: <20260520-ueagle-atm-cleanup-v1-0-010c8bc7b214@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJE2DmoC/x3M0QpAMBSH8VfRuXZqJhOvIhdr/jjFaENK3t1y+
 bv4vocigiBSmz0UcEmUzScUeUZutn4Cy5BMWmmjKq34hJ0WsD1WdgusP3dGVQ6m1o0xTUkp3AN
 Guf9p17/vB9bMo8RkAAAA
X-Change-ID: 20260520-ueagle-atm-cleanup-e53d67296693
To: Matthieu CASTET <castet.matthieu@free.fr>, 
 Stanislaw Gruszka <stf_xl@wp.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-dev@igalia.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37809-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[free.fr,wp.pl,linuxfoundation.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 452CC59C2D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series changes/removes some debug messages in the ueagle-atm driver.

Patch 1 adjusts the 'device found' message to debug level.
Patch 2 removes the function entry/exit debug messages.

With:

  # echo 1 >/sys/module/printk/parameters/ignore_loglevel
  # echo 2 >/sys/module/ueagle_atm/parameters/debug
  # echo 'file drivers/usb/atm/ueagle-atm.c +p' >/sys/kernel/debug/dynamic_debug/control

Changes:

  -usb 1-1: [ueagle-atm vdbg]  entering uea_probe

  -usb 1-1: [ueagle-atm] ADSL device founded vid (0X1039) pid (0X2101) Rev (0X2581): Eagle I
  +usb 1-1: [ueagle-atm dbg] uea_probe: ADSL device found with vid (0X1039) pid (0X2101) Rev (0X2581): Eagle I

  -usb 1-1: [ueagle-atm vdbg]  entering uea_load_firmware
   usb 1-1: [ueagle-atm] pre-firmware device, uploading firmware
   usb 1-1: [ueagle-atm] loading firmware ueagle-atm/eagleI.fw
  -usb 1-1: [ueagle-atm vdbg]  leaving  uea_load_firmware
   usb 1-1: Direct firmware load for ueagle-atm/eagleI.fw failed with error -2
   usb 1-1: Falling back to sysfs fallback for: ueagle-atm/eagleI.fw
   usb 1-1: USB disconnect, device number 2
  -usb 1-1: [ueagle-atm vdbg]  entering uea_disconnect
  -usb 1-1: [ueagle-atm vdbg]  leaving  uea_disconnect
  -usb 1-1: [ueagle-atm vdbg]  entering uea_upload_pre_firmware
   usb 1-1: [UEAGLE-ATM] firmware is not available
  -usb 1-1: [ueagle-atm vdbg]  leaving  uea_upload_pre_firmware

Final:

   usb 1-1: [ueagle-atm dbg] uea_probe: ADSL device found with vid (0X1039) pid (0X2101) Rev (0X2581): Eagle I
   usb 1-1: [ueagle-atm] pre-firmware device, uploading firmware
   usb 1-1: [ueagle-atm] loading firmware ueagle-atm/eagleI.fw
   usb 1-1: Direct firmware load for ueagle-atm/eagleI.fw failed with error -2
   usb 1-1: Falling back to sysfs fallback for: ueagle-atm/eagleI.fw
   usb 1-1: USB disconnect, device number 2
   usb 1-1: [UEAGLE-ATM] firmware is not available

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
Mauricio Faria de Oliveira (2):
      usb: atm: ueagle-atm: use dev_dbg() for 'device found' message
      usb: atm: ueagle-atm: remove function entry/exit debug messages

 drivers/usb/atm/ueagle-atm.c | 58 ++++++--------------------------------------
 1 file changed, 7 insertions(+), 51 deletions(-)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260520-ueagle-atm-cleanup-e53d67296693

Best regards,
-- 
Mauricio Faria de Oliveira <mfo@igalia.com>


