Return-Path: <linux-usb+bounces-31275-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8537BCACB02
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 10:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94A9D301A36A
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 09:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C474A322C66;
	Mon,  8 Dec 2025 09:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="lF5klDFZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m19731101.qiye.163.com (mail-m19731101.qiye.163.com [220.197.31.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7867322B91;
	Mon,  8 Dec 2025 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186256; cv=none; b=AlElGIczH5ylbdCP5p3qWvPD83BA+vHLuYg0/26Hg5MghYajWP2jCgC/2P8ls9SFjCr4pqPWNjTYSL9T3Ifv5Q1OlSxbr6b5JJ4UNmgUWrjFc1L6IKSl+f+yhL8xoY86AatJiY1Vb6oDltBFKzeZ1LapuDIDs99JWaZnZ7Iu220=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186256; c=relaxed/simple;
	bh=8MfX1yCAlJd1UZIxc9W5LRQdI3Go6QQmq5ovt7g8HXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QQsvB5BYO9uOwKvA+AOPkTnW4DVo8c+5B/NTcBGS76R+UT61nmRsVGf9abtjFfTtA/LQgeCQxFwPLyiiIZx8KlQ+GAIUlrk4jietOvl2zmeTdVc5THbYqPe115btFTxRiEWdFWP6H4nFRfpg/JtpsCD/TPImGuMLg/tSQoJKveI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=lF5klDFZ; arc=none smtp.client-ip=220.197.31.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c6535228;
	Mon, 8 Dec 2025 17:25:41 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: linux-usb@vger.kernel.org,
	si.yanteng@linux.dev
Cc: seakeel@gmail.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v5 0/8] Add Chinese translation for USB subsystem
Date: Mon,  8 Dec 2025 17:25:30 +0800
Message-ID: <cover.1765180570.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9afd47ee0b09d5kunm314b94712b4e4fe
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSR9NVkMaT08YSk8aTEIfGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=lF5klDFZSjBEl9579UhuRL5rMvW6nraF4UGFJkdTwElbrYT5w9O0KnryGd9pK8/lqiClDlV0zX88wovuELaPvC7F/J14veCF4fP+fbJXfth6cfEK/F8kCsHoffZ4mkM3rklRoq0qVVNzjBIYMB55K/T5268RM4LyTh11l9aHt7qAfF8ua632PtEbXtzWJVRc1slbEEZTMPq0EjM8YLnA/aN1JFItKnwa4P0u3JPygGuDYU60PdjPY+x7sXOHVF6+vg3+RW/zA6ojydWzNaGaN6ElwggOBkzwCMnH1mOA6xa0Zt20ZPlpMmQCiPOs56l4H4oSBOh51ZeccVHdQWfcbg==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=PtjqRYizpf2IRjBP+kwmB+/FsceMX8CIB1EU9JuFupo=;
	h=date:mime-version:subject:message-id:from;

This patch set adds Chinese translations for the USB documentation.

Changes in v5:
 - Ensuring that the index.rst entries, including acm, authorization,
   chipidea, dwc3, ehci, and usbmon, are placed in the correct patches
   to prevent build errors when patches are applied individually.
 - Remove extra spaces in chipidea.rst.
 - Send these translation patches to linux-usb@vger.kernel.org for review
   by Chinese-speaking developers, per Alex and Yanteng's recommendation.

Changes in v4:
 - shorten those overlong title underline/overline symbols
 - Remove CREDITS section from index.rst
 - Link to v4: https://lore.kernel.org/all/cover.1764674650.git.baikefan@leap-io-kernel.com/

Changes in v3:
 - Updated the signoff to my full legal name,
   as requested by Jonathan Corbet.
 - Reviewed and fixed the RST syntax to resolve the patch issues
   noted by Alex Shi.
 - Kept the number of translated files to eight
   to make submission and review smoother.
 - Link to v3: https://lore.kernel.org/all/cover.1763984424.git.baikefan@leap-io-kernel.com/

Changes in v2:
 - Update [PATCH 01/25] docs/zh_CN: Add index.rst translation
   to include corresponding updates in
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
 Documentation/translations/zh_CN/usb/CREDITS  | 153 +++++++
 Documentation/translations/zh_CN/usb/acm.rst  | 137 +++++++
 .../translations/zh_CN/usb/authorization.rst  | 125 ++++++
 .../translations/zh_CN/usb/chipidea.rst       | 142 +++++++
 Documentation/translations/zh_CN/usb/dwc3.rst |  60 +++
 Documentation/translations/zh_CN/usb/ehci.rst | 216 ++++++++++
 .../translations/zh_CN/usb/index.rst          |  54 +++
 .../translations/zh_CN/usb/usbmon.rst         | 380 ++++++++++++++++++
 9 files changed, 1268 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/CREDITS
 create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
 create mode 100644 Documentation/translations/zh_CN/usb/authorization.rst
 create mode 100644 Documentation/translations/zh_CN/usb/chipidea.rst
 create mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst
 create mode 100644 Documentation/translations/zh_CN/usb/ehci.rst
 create mode 100644 Documentation/translations/zh_CN/usb/index.rst
 create mode 100644 Documentation/translations/zh_CN/usb/usbmon.rst

--
2.52.0


