Return-Path: <linux-usb+bounces-35706-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF7yHHkXy2lrDwYAu9opvQ
	(envelope-from <linux-usb+bounces-35706-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 02:38:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA4E362B4A
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 02:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AAC4E3016B3B
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 00:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C0D2BD033;
	Tue, 31 Mar 2026 00:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="vyh/wEa8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873312B9B7
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 00:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917491; cv=none; b=oVEuCjpI8ZL0DcPDCaf0dXVnzZt9SwYD/+jJtWlI3U/Gf+ByImFy1qc5aCUGxS5zf+OPdJvJX4KyJTTlgd6FwLta+sLmNbO1PQcLzrRjwExqcNhDOOWMnsjTFIh9xIlMKL9V/OVdyyGvpUYc0AXmilR25YvcILDHqw69i5RhFvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917491; c=relaxed/simple;
	bh=XprzJOerBDgmfkRC0Q7IzsA/GVhWUSM86j9VtM21XW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z0uVh0XQcgdJTnn+5Xgt54yNGaqXHAmhsdn8RosXB+hAw4DPFBQG77ytS7iL8OJI9Xa/RmAmFgjv6VAeTN71P7tAU6XSs+EWKYeJuowJO+0rQpHxsLeTy3tT38IcpqgCqWh3Op0LFi5lcwflzZVZqVM+Rvw1wAEoaUAXsidYMU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=vyh/wEa8; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12a74039dc6so4025934c88.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 17:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774917489; x=1775522289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5zUMqnUFnfP90o+z57wFpkqwUOCkdtAZeV4Z/SbcwM=;
        b=vyh/wEa8hCBDzJJbkckrgJLVwP5BtOFhIzHYQMaolcL8YTyrHRinWkrQG+YCypIRjE
         j9uxtJ2h2896uEWsjXk34CdISJc7VJoK7R1CQtCycZVrEKJoS9MKDijV7RPYRmACGpsb
         3vQKztop4jcv6HGW6/9GUH2/3oA8o9/SaK+nfAhTMZOBl0bAMy5WID0S/dEgTs2G1Vgf
         CUjLIU7+yaByM4MNpd1CLGEP8jhQEkMLM0u7CS72AChM/sZzXOhqrRvf+PLA/yfBf0kn
         pgHO1QNpYmC6yxdX6Ce8W2i2m0MTdkXGGNyrm42Ty0/Ze7pyHcUqhDSSmv3yoNoDCc49
         9vHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917489; x=1775522289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5zUMqnUFnfP90o+z57wFpkqwUOCkdtAZeV4Z/SbcwM=;
        b=QJm4r28IJIu1p9bWbDkj/eSsBzLPTtypKMViWeueyJ4aH20wYHDRRnAi/UcOk0x1Wl
         x+unqa2z1RWsgSpTLwGNCNExrzEzW7IiaqXrtaAT7TehnFbpt1GIqpNoh2mN5jVBany+
         v4n00pawCsC1fiVcDb10hQ/Bc7q3OV5kOJwmhwP+v03ONqT2LdwL8CA0WBLTbNo/bjq4
         BekrRXjJe7sASw1yCPmEHC2a8QOvk/+TXDDQ6kfChWoufForcCpKmOCN5PKr5zYY2V2q
         w3kPoCXgJY2p6uaaH5kYY6JNldLz7ckowC97yuD8ylIFzs5mMBqAaw6buz2r89VkQ8jv
         eXDw==
X-Forwarded-Encrypted: i=1; AJvYcCUfAzbYc7EsUSwwHkcGZD0GSxZ4hZVyHE7EN/oBNwtqygF9GxpIV3EvrAZOLpc10LbaqX8TKnXeGlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLz4844qxhqZbiU0/RPsR1nrTX6pL0t+SDe03C+N6dMxr8q6/k
	yLHl3Ab8jbsHCab6MWKeOePEUCStLA2/HsgrSp4NriKFdgXhpGgMgIC3NPXyly77kQ==
X-Gm-Gg: ATEYQzx+RRAhWS2PhIIGz9vpyVSK/lEKwVU1KznsZQYNg/tm5X3p16cgAYJQNd9XfbS
	4r8S0IebhexMra/Aoz8HLBIfffFhcWoqY2U3QIa6B54Eel8D4eOMY08DYX+b3m/735+3WJHfjYu
	8LB+pBUKoag6+yMsxb30C/aNddmy8a7SwGqTniWRuRjSLpKPh0+2f6TSrFnk1lQg16z2i1mx1wo
	zl3H5GXG5HPoho/DBYkdkrtCTknSuY/e+byrjWzi1quL1iDpzmDGuIzI71Nc0jDfC20W8mVw00n
	k0PkIc4Zx1mVRONKatX+rU2PLbrwBcvcPN3p72qzIia26X7IQ+l4YQhaPnOrk9yCsGEfm1/Teoj
	tWr3bLjSsuBQyFhlZ4ZD0F+sN1mdNGEnJmrx8lOQGCsDxEZ6lIZJRXk4Mv9Fa1aTLtpSQcTlxpd
	637jvjbnct0Q==
X-Received: by 2002:a05:7022:f102:b0:12a:747e:5b5c with SMTP id a92af1059eb24-12ab28d15aamr8199595c88.24.1774917488399;
        Mon, 30 Mar 2026 17:38:08 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab9864810sm9343057c88.12.2026.03.30.17.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:38:07 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	JP Hein <jp@jphein.com>
Subject: [PATCH v5 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI cascade failure
Date: Mon, 30 Mar 2026 17:38:03 -0700
Message-ID: <20260331003806.212565-1-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35706-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:dkim,jphein.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CA4E362B4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has a
well-documented failure mode that cascades into complete xHCI host
controller death, disconnecting every USB device on the bus -- including
keyboards and mice, requiring a hard reboot.

The device has two crash triggers:

  1. LPM/autosuspend resume: Device enters LPM or autosuspend, fails to
     reinitialize on resume, producing EPIPE (-32) on UVC SET_CUR. The
     stalled endpoint triggers an xHCI stop-endpoint timeout, and the
     kernel declares the host controller dead.

  2. Rapid control transfers: sustained rapid UVC SET_CUR operations
     (hundreds over several seconds) overwhelm the firmware. The error-code query
     (GET_CUR on UVC_VC_REQUEST_ERROR_CODE_CONTROL) amplifies the
     failure by sending a second transfer to the already-stalling device,
     pushing it into a full lockup and xHCI controller death.

This has been reported as Ubuntu Launchpad Bug #2061177, with reports
across kernel versions 6.5 through 6.8.

This series adds three patches:

Patch 1: USB core -- USB_QUIRK_NO_LPM to prevent Link Power Management
  transitions that destabilize the device firmware.

Patch 2: UVC driver -- introduce UVC_QUIRK_CTRL_THROTTLE to rate-limit
  SET_CUR control transfers (50ms minimum interval) and skip the
  error-code query after EPIPE errors on affected devices.

Patch 3: UVC driver -- add Razer Kiyo Pro device table entry with
  UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
  UVC_QUIRK_NO_RESET_RESUME to address both crash triggers.

Together, these keep the device in a stable active state, prevent rapid
control transfer crashes, and avoid the power management transitions
that trigger the firmware bug.

Testing on 6.17.0-19-generic (Ubuntu 24.04 HWE) with dynamic debug
enabled and NO patches or workarounds applied:
  - v4l2-ctl stress test (control transfers only): passes 50/50
  - Starting a video call: triggers hc_died() via LPM disable failure
    during isochronous stream setup
  - Stress test during active video call: firmware stalls at round 19,
    repeated endpoint stalls with -32 EPIPE

The 6.8 -> 6.17 xHCI error handling improvements help with control
transfer recovery, but the firmware lockup during video streaming still
cascades to hc_died(). The patches in this series prevent the firmware
from reaching the lockup state in the first place.

Changes since v4:
  - Dropped stable CC (new quirks, not regression fixes)
  - Updated cover letter with 6.17 test results

Changes since v3:
  - Regenerated patches against media-committers next branch to fix
    context mismatch (v3 was based on Ubuntu 6.8 source)

Tested on:
  - Kernel: 6.17.0-19-generic (Ubuntu 24.04 HWE) and 6.8.0-106-generic
  - Hardware: Intel Cannon Lake PCH xHCI (8086:a36d)
  - Device: Razer Kiyo Pro (1532:0e05), firmware 1.5.0.1

Stress test, crash evidence, and debug logs:
  https://github.com/jphein/kiyo-xhci-fix

JP Hein (3):
  USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
  media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
  media: uvcvideo: add quirks for Razer Kiyo Pro webcam

 drivers/media/usb/uvc/uvc_driver.c | 17 ++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 32 ++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  3 +++
 drivers/usb/core/quirks.c          |  2 ++
 4 files changed, 54 insertions(+)

