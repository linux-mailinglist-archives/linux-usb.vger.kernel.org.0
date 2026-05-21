Return-Path: <linux-usb+bounces-37866-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HLHCU7gDmp5CwYAu9opvQ
	(envelope-from <linux-usb+bounces-37866-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:37:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C77955A369A
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9589312D627
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094F73A169F;
	Thu, 21 May 2026 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="KqPnBl6S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m19731109.qiye.163.com (mail-m19731109.qiye.163.com [220.197.31.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F4C364049;
	Thu, 21 May 2026 10:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779359456; cv=none; b=erw95p1acqpL9OH6evyV6zMkvzzhiaAtPCLYIou6/tK96czGKiwcQqZ23q2k45x058HZv4rr8BzbJW13pWtRGTXFZ8JFkPlYFt5RbMFg7O2QXgS4s0X8wnWQOSC37UnEWdTi9KBbVStXJHGbCybr2aHhw5JbMK64ZIxKmJWeaOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779359456; c=relaxed/simple;
	bh=dzm0mLY5dZKhBPhW9uBd8kteFQQcYiW8aGD0uMrdxSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iULNtHe2qv2kZ9vjN9ErZ9mvDgNIvZacv3YrusPwD6OVG+tTSfZOs406jToR7cYB6dllT8tCSL7x1EgfVE7GKnMbXAB72P6xPujqiSO6E55A/Oxmya16u7mBPkakcIABkiiOoN4UPlHMmvowb9a3vRium6GaRxLCh85ROHm7qIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=KqPnBl6S; arc=none smtp.client-ip=220.197.31.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f4cebae0;
	Thu, 21 May 2026 17:55:17 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: linux-usb@vger.kernel.org,
	si.yanteng@linux.dev
Cc: gregkh@linuxfoundation.org,
	seakeel@gmail.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v7 0/8] Add Chinese translation for USB subsystem
Date: Thu, 21 May 2026 17:55:05 +0800
Message-ID: <cover.1779355170.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e49f5fa7609d5kunm49815c9e65c61
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ01KVksfS0NOT01CGEoZT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPSVlXWRYaDxIVHRRZQVlLVUtVS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=KqPnBl6SeHCc9inqIfiNvE2AHw2XZPa8JFYkxe8FfZeSKwYywHo71q4X48OCPum7Vum4+Hro5fVSdAVCYI5zwCfJKtJvks++v3Fh3osaaL/US5lEf+Q9swmombqI25VyXntk0zrBXshclI0mt79XoPJPs9ddkGSWi7UOudh/YVtLIlRGAeXw6IKdmValQwHaL7eJqr9IYcsIP3cPtMda5REykxPd372b1ejk3iNKCdjhtfBJPJ2rAcC9V8biDby/kOmfw0KVEt1iYEIW/qOwyWeAI0Ijp8mBZKCMLAtIjjSKOGMGsSWOqDWnkqup9vjaBNDhrczrClRGSv1wztCE7Q==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=wByCfFzaA7xkgSYZtEWHakctpq3dyEFJEGV5/ZtVpDo=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[leap-io-kernel.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[leap-io-kernel.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37866-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,kernel.org,hust.edu.cn,lwn.net,vger.kernel.org,leap-io-kernel.com];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baikefan@leap-io-kernel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[leap-io-kernel.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[leap-io-kernel.com:mid,leap-io-kernel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C77955A369A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch set adds Chinese translations for the USB documentation.

This patch set adds Chinese translations for the USB documentation.

Many thanks to Alex Shi for the careful review and suggestions, and
apologies for the delay in sending this updated version.

Changes in v7:
  - Applied the formatting cleanup suggested by Alex Shi across the
    whole series.
  - Reflowed the translated text for cleaner line alignment and
    adjusted title/section adornments for consistency.
  - No content changes beyond formatting cleanup.

Changes in v6:
  - Rebased the series onto the latest docs-next branch in Jon's tree
    (git://git.lwn.net/linux.git), as suggested by Alex Shi.
  - Added the USB maintainers to the Cc list.
  - Rechecked and polished the Chinese translations throughout the series.
  - Link to v6: https://lore.kernel.org/linux-usb/cover.1778415392.git.baikefan@leap-io-kernel.com/

Changes in v5:
  - Moved the index.rst entries for acm, authorization, chipidea, dwc3,
    ehci, and usbmon into the corresponding patches so the series builds
    cleanly when applied patch by patch.
  - Removed extra spaces in chipidea.rst.
  - Sent the series to linux-usb@vger.kernel.org for review by
    Chinese-speaking developers, as suggested by Alex Shi and Yanteng Si.
  - Link to v5: https://lore.kernel.org/linux-usb/cover.1765180570.git.baikefan@leap-io-kernel.com/

Changes in v4:
  - Shortened overlong title underline and overline markers.
  - Removed the CREDITS entry from index.rst.
  - Link to v4: https://lore.kernel.org/all/cover.1764674650.git.baikefan@leap-io-kernel.com/

Changes in v3:
  - Updated my sign-off to use my full legal name, as requested by
    Jonathan Corbet.
  - Reviewed and fixed the RST syntax issues noted by Alex Shi.
  - Kept the number of translated files to eight to make submission and
    review more manageable.
  - Link to v3: https://lore.kernel.org/all/cover.1763984424.git.baikefan@leap-io-kernel.com/

Changes in v2:
  - Updated [PATCH 01/25] docs/zh_CN: Add index.rst translation to include
    the corresponding changes to
    Documentation/translations/zh_CN/subsystem-apis.rst.
  - Link to v2: https://lore.kernel.org/all/cover.1763897036.git.baikefan@leap-io-kernel.com/

v1:
  - Link: https://lore.kernel.org/all/20251123074540.34161-1-baikefan@leap-io-kernel.com/

Kefan Bai (8):
  docs/zh_CN: Add index.rst translation
  docs/zh_CN: Add acm.rst translation
  docs/zh_CN: Add authorization.rst translation
  docs/zh_CN: Add chipidea.rst translation
  docs/zh_CN: Add dwc3.rst translation
  docs/zh_CN: Add ehci.rst translation
  docs/zh_CN: Add usbmon.rst translation
  docs/zh_CN: Add CREDITS translation

 .../translations/zh_CN/subsystem-apis.rst     |   2 +-
 Documentation/translations/zh_CN/usb/CREDITS  | 163 +++++++
 Documentation/translations/zh_CN/usb/acm.rst  | 147 ++++++
 .../translations/zh_CN/usb/authorization.rst  | 139 ++++++
 .../translations/zh_CN/usb/chipidea.rst       | 150 ++++++
 Documentation/translations/zh_CN/usb/dwc3.rst |  63 +++
 Documentation/translations/zh_CN/usb/ehci.rst | 261 +++++++++++
 .../translations/zh_CN/usb/index.rst          |  54 +++
 .../translations/zh_CN/usb/usbmon.rst         | 427 ++++++++++++++++++
 9 files changed, 1405 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/CREDITS
 create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
 create mode 100644 Documentation/translations/zh_CN/usb/authorization.rst
 create mode 100644 Documentation/translations/zh_CN/usb/chipidea.rst
 create mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst
 create mode 100644 Documentation/translations/zh_CN/usb/ehci.rst
 create mode 100644 Documentation/translations/zh_CN/usb/index.rst
 create mode 100644 Documentation/translations/zh_CN/usb/usbmon.rst

--
2.54.0


