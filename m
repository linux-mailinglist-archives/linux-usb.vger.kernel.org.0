Return-Path: <linux-usb+bounces-30584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEEFC66185
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 21:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2F4934EB784
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 20:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE890333723;
	Mon, 17 Nov 2025 20:19:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD652550A4;
	Mon, 17 Nov 2025 20:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.142.111.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763410754; cv=none; b=rKA8jRYMu4OjKdTm3vmqqOmH4MrFEOm4uDvYnIlqJODzJTX4QPuQ3yrOYeHjKJDBUd7zYvInquiB+BAYQk+hcGOOIyqfOBtKJtle5JJuteJeRC+a+IkyyBrK5hVaX908zp2v0Ci0WCSa/e4NehSg3P7BHP0xZs7APGTyAV2Zh68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763410754; c=relaxed/simple;
	bh=zP6zU7NDhOqDJG1j2hCYYx5GM8B15sdwcgKWvbY1BAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hp4t75tbENw9/VsxtrwaWg37ItY1bIkbBiGD+XU0Qy3E6Q4sLdELGj+MqAo80ocxM+n2iGwghb6iv36T3G0bc7oZh1gDjVUkS1roxl04TQrHZmeUUmKbKsSDa/abB38Xsh3JXa4yEDM2WTbpqilBpwhjU9zxqqitc/KbQA2Ys7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gaga.casa; spf=pass smtp.mailfrom=gaga.casa; arc=none smtp.client-ip=64.142.111.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gaga.casa
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaga.casa
Received: from 192-184-191-133.static.sonic.net (192-184-191-133.static.sonic.net [192.184.191.133])
	(authenticated bits=0)
	by c.mail.sonic.net (8.16.1/8.16.1) with ESMTPA id 5AHKIs6s023288;
	Mon, 17 Nov 2025 12:18:54 -0800
From: Forest <forestix@gaga.casa>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION][BISECTED] usb: hub: total system freeze after running adb
Date: Mon, 17 Nov 2025 12:18:54 -0800
Message-ID: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Sonic-CAuth: UmFuZG9tSVaJBp4FHw3O4Y61wzN2fx5ZmcCGJZboV1n0hyfMgZ96QI4BNK4/P5Rrlvd0kxwU+AwqvjuaTlpCk+eC/kFeN0mi
X-Sonic-ID: C;Eq2eo/LD8BGIDq76uCp4aA== M;hJi5o/LD8BGIDq76uCp4aA==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd

#regzbot introduced 8f5b7e2bec1c

Running adb (android debug bridge) commands causes the entire system to
freeze some time later.

The freeze usually occurs within two hours of running adb, but not always.
Stopping adb's persistent background process with `adb kill-server` seems to
avoid the freeze. (However, this is not always possible, since the system
sometimes freezes just a few seconds after adb is launched.)

It occurs even when no android devices are connected to the system.

I am unsure whether user activity affects how soon the freeze happens.

Observations when it happens:

- No messages are written to dmesg or syslog.
- Virtual console switching no longer works.
- SysRq key commands no longer work, as far as I can tell.
- Whatever was on the display remains intact.
- Any already-playing audio enters a short loop, as though the motherboard's
  sound device is playing from a ring buffer that no longer gets updated.

I have reproduced it on mainline (6.18.0-rc5) and various older kernel
versions as early as 6.12.48, built with Debian config files and
`make olddefconfig`. Tested using Debian Stable 13.2 (trixie), and its
adb 1:34.0.5-12 package.

Git bisect identifies the culprit:
commit 8f5b7e2bec1c36578fdaa74a6951833541103e27
2025-06-11 14:24:41 +0300
usb: hub: fix detection of high tier USB3 devices behind suspended hubs

Reverting that commit (along with two later commits that build upon it)
seems to fix the problem in the mainline and longterm kernels that I tried.

