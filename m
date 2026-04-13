Return-Path: <linux-usb+bounces-36200-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNd0A7vW3GmcWQkAu9opvQ
	(envelope-from <linux-usb+bounces-36200-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:42:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B73EB6FD
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41C39300BB9B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 11:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4213C3457;
	Mon, 13 Apr 2026 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="kGfM2OQm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F3022156C
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 11:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080559; cv=none; b=cUBfCfRr+gG3RxWni7ODMJ4wmFOtFTdItHAUhNJOmcxSBodl949iPNihmNuTFlHnDHTrdgTO6OjQl7Z4XVZLnJXd1gX+uYuFKxPMhMpPp6VPbMGjcUKdXD5FcPOSPxEqtbeaDIYF2oN4xoEWz/t9Z5jwsdnuLfoFAMGhbAcUrSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080559; c=relaxed/simple;
	bh=NLXHhPcIGMdge6o1caxWBwb7uAty/542sLjb35QkF88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wq/BHglEZNqQaL1FTQG92HanmiqNOndj0HNCIGVpnI7cgRwOzpK8IsNMuep2aVBBL5H/gZXBj3Fvd0jIDtQdMy3gDmgC0J3WzV6bfu885d4MdACFexebD+Y6Q9HMaZ3f7Zi1Kf54k3bv+3Sispu3IYAQ7/gt4ER8r0qrUmmf2n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=kGfM2OQm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so54242835e9.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1776080554; x=1776685354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IeQMeY8LdNwnUo62ZTj/KNq/NGfRGEOBpJ7zKrUgHkw=;
        b=kGfM2OQmC8kce2e8/yUmlj4txrzQbwFGnU4dMo2N8LqsGf14SK1Y/XYe0sVJScSNIj
         0ANBXPS2vyS3YW37wAjTRF81UxSApIuPMtlvIpHbUBebrbLuZuoyzownp44xLLJqWRg/
         2TLKqtOeDscG1FRPxIdpKXhpd72nKNuFzkomCfM5GrzE0bK2S1Qwr+6XmZE3MpyTuBXw
         cnL1WNCzfLGO7QZm5w77+6w8K3Md2s7RWS6VHatkMD+yw5rZA2qwczY6hvgOGiEwj/hR
         NDcEalm9lY/Bnxcw3IKwlAazQhRQARO6IqNY4NlSqt6rthdQgWM0KPjlbZyJT03Nd8Ai
         nbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080554; x=1776685354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeQMeY8LdNwnUo62ZTj/KNq/NGfRGEOBpJ7zKrUgHkw=;
        b=rnZaalyop0fShnbTmhPLeS4UvkFl+PMe41mM80oh1RNl2pfDSbtXKCW1PbMm766TNR
         sYP0dZdU3il6dDDhp75/3RH88NcI6kU1dQuURQ86N6+bdRTULgemma6Hwbw+bcDQxYbl
         URDh0oeGruPqhCbGhiYmajlmp1HR9QJkNSkDzs0eLoQzlAq/29ZiE1oaZQR7gP4kFFRn
         S6+EcfvoA0wwwd86aVeqJY866Geof7vmHPS3EBcN++sZ/3OW+xsBfVxqcPFqptyDTpCL
         qcPwWDO8aJVwAtWsnr3uBmh8HdzouLIgeSUyJkeAIUVB5P9tx9KM5QarcRNmcoo1PiQQ
         rQwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iYU68pHbwPs55BA1kCHHIGd8dU2l1+M/Z5+xvuIz2QROwPaFlelAGRH50M0hdDrlkVVWJsTT6vBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxklXdFMjgoojoLEe3s+X/e5FFpw2mwwp2JuiLOp/VhZy2tBcXm
	dEkSj7xDijkgVDl/0wYVPiEGmBaT9AR/x5IvgeizPjvgKC6ExV0dAHwOjoFPG+9Wlg==
X-Gm-Gg: AeBDiesE6Rzs2JEFUrZS5fDBo9oL5pZrFoV6h5NDzvpTgy6G24cbc9jBHZZhnmX+YEJ
	Zd/4GMmB6y7xtmxCw/bHSnjyT/0xjOhmhPXlewOSfpa7wcVz7CqZaH01eQLT2r2DrjNyIkJAs2s
	uljSkhc2go+JT9DUrK3Om0lDvMIKoUBbLvQfYCQaYSgDNJhiqTSVttLSpAPDLgmmUTjNExZUl2F
	3VIEUuV0kuMn64vvIkXZZRTUcoNxgf/u9hsfiXMlCn2nPrgaRChrEpSUCNUt2r8AiwxL3vad4B8
	U78F30y1EzvWm1AVZJde90o+/zwFECDAQw5r66Mwv7jNFMfbvS5x5Ai1nA3RQQYV790SnmzbWXe
	e1UEUZvMrd/hc1cVcmeKjHDPpSgDldcBgaBkhH8rPcO3avcGscS5/G1CuMXnIQ652Hg6fSmzl8D
	fHioKW5bO5LpLizAhfAV//TdC6goi5MiaX3G3N6jWoAWSRbG1Usr2yrZWAVykd3yQMh5taFzKf0
	KgTaeQ=
X-Received: by 2002:a05:600c:4f95:b0:488:be58:bb5b with SMTP id 5b1f17b1804b1-488d686c443mr182009275e9.24.1776080553975;
        Mon, 13 Apr 2026 04:42:33 -0700 (PDT)
Received: from horizon.localdomain ([212.105.128.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b46ffsm126301165e9.6.2026.04.13.04.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:42:33 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Ricky Wu <ricky_wu@realtek.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-usb@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: [RFC PATCH 0/2] rtsx_usb: runtime PM fixes before tray-reader detect rework
Date: Mon, 13 Apr 2026 12:42:29 +0100
Message-ID: <cover.1776080528.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[starlabs-systems.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[starlabs.systems : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[starlabs-systems.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36200-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@starlabs.systems,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E34B73EB6FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an RFC for the USB/cardreader side of the rtsx tray-reader issue.

Assuming the separate resume-reset fix has landed, this is the next step:
clean up runtime PM handling in the USB/cardreader layer before attempting
any further MMC-side detect changes.

Patch 1 holds a runtime PM reference across transfers and marks the device
busy afterwards.

Patch 2 avoids issuing USB register I/O from the runtime autosuspend path,
which can deadlock runtime PM and leave the device stuck in a suspending
state.

The remaining tray-reader false-detect problem likely needs event
qualification on the USB/cardreader side rather than MMC command probing
from ->get_cd(). Guidance on the right place for that logic would be
useful.

Sean Rhodes (2):
  rtsx_usb: hold runtime PM during transfers
  rtsx_usb: avoid USB I/O in runtime autosuspend

 drivers/misc/cardreader/rtsx_usb.c | 49 +++++++++++++++++++++++-------
 include/linux/rtsx_usb.h           |  3 ++
 2 files changed, 41 insertions(+), 11 deletions(-)


