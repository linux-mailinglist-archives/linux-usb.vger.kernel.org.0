Return-Path: <linux-usb+bounces-33342-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDBkBTp6j2mWRAEAu9opvQ
	(envelope-from <linux-usb+bounces-33342-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 20:23:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0311392A7
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 20:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08861303103E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 19:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC2E288C81;
	Fri, 13 Feb 2026 19:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Cmw3Gith"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E988A279334;
	Fri, 13 Feb 2026 19:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771010613; cv=none; b=QagyD/IaCR73mvR6cW/mlCSlcSyqKPCKIGGOmP7Xk2+U5h6IZ7A6pTplFMCGt7GpsFfwpZdpa+izFCjelheKCG2fNfyhtRJoouG9Lb7fnq9jwehNE8DOiFBTQneBgdAe5M8kTwk4H06MBgXWylo+xZRnbxIyaQMw/rKxKqE+biE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771010613; c=relaxed/simple;
	bh=UUt9Bamssw0YZAyTUGt298k89CMX7q5m5QrH1EuyyiE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DJzy2RdX6eKjiPt5hBHJaizvBTANWldq0hgps0p1MEApxxmIPXNvmO8nGLfJ8UAcPAqfJb85lD/SRJFUyPMB691Sd/SC5n0NgFu3HqcG4ICYi5fhSx6vYDkAvVscAbHOn648+T+nEU/22Y+pwI6VvZahdZqbuUJI87y8HEanMAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Cmw3Gith; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771010610;
	bh=UUt9Bamssw0YZAyTUGt298k89CMX7q5m5QrH1EuyyiE=;
	h=From:Subject:Date:To:Cc:From;
	b=Cmw3Gith9nxzDknrxgs+S29iZXNMKFNw+sXSB92H3Q4QGP6XAxr+JyODHo+vs10uf
	 94AWs3XGTqN0nW7Xr4OErvMEI2d8X4byJ/pKUFOgWCM8ij1I/g+52o80v6Pmy3iTWF
	 tqdaNRZaJ06bfmuj+1pPNjsOkAwkXPX9nqt035JKLzjFyI14HLYRVv4zxUBwA4I3yx
	 zrYSKmVuVzMz/JLN7WA1JT+ebk0QQULaVV6MxqQkCejPBvqZx4dQGcM9fH4bURSg4F
	 OJp2EuTuuIf013V8TOSzT99kjR/clXdX7RSgWRR3mxLLs4wDI2q/XGsB+HYHcaUPA1
	 OkcoMTpWRM3wg==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53C7617E35C9;
	Fri, 13 Feb 2026 20:23:30 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CF0E6480024; Fri, 13 Feb 2026 20:23:29 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/2] usb: typec: mux: avoid duplicated mux switches
Date: Fri, 13 Feb 2026 20:23:27 +0100
Message-Id: <20260213-typec-mux-duplication-fix-v1-0-70076a7c5691@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC96j2kC/x2MWw5AMBAAryL7bRMqLXEV8VG12MSjaREi7m7jc
 yaZeSBSYIpQJw8EOjnytgrkaQJusutIyL0wqEyZTOUF7rcnh8txYX/4mZ3dpcCBL+ysJl0NRpf
 GgvQ+kOj/3bTv+wGRpzMnawAAAA==
X-Change-ID: 20260213-typec-mux-duplication-fix-ba5e58f6576a
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UUt9Bamssw0YZAyTUGt298k89CMX7q5m5QrH1EuyyiE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPejEi486DyXdZg6xGy1AkAKbtKpi/oAF5I
 7mJIuP4OVhTqokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpj3oxAAoJENju1/PI
 O/qayaUP/0v00gN55b+lysGI/H7BxsJw3AJt33EPJhBuvWSpyOr45K74sVFCMGem7LB1jP4cGTi
 pROKmJA7XKIasl0dOCIy0Yu9KUvz4cG/rfeEslKlDOfNWa4Uao40fQe37V+oiYMZcFjm0tc1ezO
 zZUkFF0BVHkP41zQSZ9WhDU4XAzFKJG19kAGzztQE2oP8mbLEX45Lt0IjPxn2rjHJi14IW5wiN3
 B0f8ZI8orR70MqN7BLwbY9kvhTgeCk2hgplTo1QM695xrbpDr8xkpHig0xotsMHA8lp0PmDzFuO
 qmu+tI3cZrUwF7QtGCFDwyEoWYSaVKAIu3ReHqp5XlSVcSbyq1UDZ3lTDnv6QfBjym3/sriwwsl
 xhWi3k01Kge8HNalCXw02FBAVHIKzK+YWJYr5QfirhhRwFPvGBM3VTtA+NKu0KNMdllEDS2+7rE
 GmxwBpDU4g+TuNozxUR6sHBY6Fo3ywZH/JL959BMhhx0tdkCfAoCZ24mExFDIuB1Ud5OagFFOeL
 PzbAF468xVqY8FSTC0H9k7fMybpOknsyy/3bADVP1Zgq/VM7+AIY4FQd6P9d0XeZjnKnBN4ep2h
 cQzitT738WF44AdMTEW5pQFRs6htdi/S4zgE1/OHP45GKQ21PdEFX7FcLgtrx/og7dATDK70K55
 ndvnIJKBxAJ6HwaXVzBQq3w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_FROM(0.00)[bounces-33342-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 7B0311392A7
X-Rspamd-Action: no action

Recent Rockchip SoCs (e.g. RK3588, RK3576) have a PHY, which
handles USB3 and DisplayPort as well as orientation and lane
muxing. By setting up the DT graph from the USB-C connector
for the Superspeed and DP lanes to the PHY all mux/orientation
operations are applied twice.

I did not add any Fixes tag, since applying the settings twice
is not breaking anything. But it's confusing when debugging
USB-C issues and obviously wastes some CPU cycles.

Also I'm not super happy with the implementation I came up with
to do the actual duplicate elimination. In the end I figured
it does not matter to much considering the array size is 3 and
is not expected to become much bigger as the amount of muxes
on a single USB-C connector should be quite low :)

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (2):
      usb: typec: mux: avoid duplicated orientation switches
      usb: typec: mux: avoid duplicated mux switches

 drivers/usb/typec/mux.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260213-typec-mux-duplication-fix-ba5e58f6576a

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


