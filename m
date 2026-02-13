Return-Path: <linux-usb+bounces-33344-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DcVAjSAj2kfRQEAu9opvQ
	(envelope-from <linux-usb+bounces-33344-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 20:49:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 625B2139455
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 20:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B4DF302F38B
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 19:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673D228C869;
	Fri, 13 Feb 2026 19:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UoDpoC6/"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92E023EA88;
	Fri, 13 Feb 2026 19:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771012132; cv=none; b=hZiWj1al59AsZn7BvZyOP0AFclr4C1hC0vc4vT2SBQSXSj3FnDeCXVRyrP9tTqNQdV99/wZUi1fHEbCMmcNWBS5Tdeaa7jBYa26S+GY5mh3jNHWwkKo+SO91sQufKe0R2JRjLSt6epy+4Z2+agdYsvaUy58LnyMOva67BWP8hj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771012132; c=relaxed/simple;
	bh=hXJ71/STFgbTYEJsFBdReJTeGxTPe+HGc/WJX2Wf9e4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OYOOyFt3Q4wpxSR4I0nWa0DSiieffcwAbbafZspz9TpUUPXDtau4NdkWz44txA6FRg1tE2XZ+7RzUJ2I3w+nZ97xwQk41p97nDVq7PriM97667YnXvjWEaXf1sWXuYdWCyJlUTU+onQimQnpJnGSpE0+BWTueR1K11uEauHtCbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UoDpoC6/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771012128;
	bh=hXJ71/STFgbTYEJsFBdReJTeGxTPe+HGc/WJX2Wf9e4=;
	h=From:Subject:Date:To:Cc:From;
	b=UoDpoC6/8u/GgD2VFhW8uTwbMyzAndHU3Ns6g2j/agpj5FVnAFgbCKsv20oJcfRGH
	 ail7vAmnhk/KqWECOpJVT4byQPN8Z6EPp2psLA+14FlNaOVX7/s7gq+5g3O/Z87n2N
	 Cyd/NfpKOK5K6RX8X1nchwD0ZVqAkVPkC40Bx8hcVp2yE4nF5WeN6kuVpjuH0h4beq
	 jax8ewWVjx2Jxx+ka3C+Nsz9+JQ4djwzHyCHqhAUzaYDvoNs3kr27wd7l7knV8lJZF
	 vKfSoOlKIlknhYb1LS8awy2NGl3e1HqBnvZ8fS9Tnb5Znn1a+Wn54IYgtSf8jJNOsI
	 mIASFpePGdcoQ==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D7D7117E1406;
	Fri, 13 Feb 2026 20:48:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 95A90480024; Fri, 13 Feb 2026 20:48:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/2] usb: typec: tcpm: improve handling of DISCOVER_MODES
 failures
Date: Fri, 13 Feb 2026 20:48:43 +0100
Message-Id: <20260213-tcpm-discover-modes-nak-fix-v1-0-9bcb5adb4ef6@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABuAj2kC/x3MwQpAQBCA4VfRnE2NFeJV5MDuYJJd7UhK3t3m+
 P2H/wHlKKzQZQ9EvkQl+IQiz8Cuo18YxSWDIVOTKUo87bGjE7Xh4oh7cKzoxw1nuZFaamiaKtP
 aCtLhiJzyf++H9/0ANpH8xG0AAAA=
X-Change-ID: 20260213-tcpm-discover-modes-nak-fix-09070bb529c5
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=hXJ71/STFgbTYEJsFBdReJTeGxTPe+HGc/WJX2Wf9e4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPgCDxW7L4PQ0+cIACPrPAqCEQ3mK05gRt8
 qT8hXbquXEjUYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpj4AgAAoJENju1/PI
 O/qaNO8QAKiA027Ecb4xRqV7zYuqxoNkRgKpK9i1QXUmSlx/8j4FpDW0VIOTX9ZlcJRiB08/NKw
 W5ucjyXcorMi5E07Mdzqo7IAGT4dhRn+Ml6xEHUuIWu6ICVnsiDqefgegZyUTU50lzdH04rmlOp
 JEa7YW4UkkQrIH8YS/IfM//QYTaRC75X/F97Q2sr/ANU7poFULpxr1R9nfzj5Wh3w4hiDjlRwY0
 DUt0+1JpYex87WdvoRF5Filh60kmn0OaC//MizJQk+0TbPTD9VGF1V1sCEwdKb9LLQROCvtOus4
 QTtjWeivaa6wuwI/BZWMSCnbu1D1zgYx9VPsVyO8FATG67Sui27JUWyKYXj2l+Sw04Kcz9jSXkY
 dkFO7vde0+/N0aWPCzjXXIwK00FILSa2XYfVUSrw4ChwyeuK1caXFHPg3o+sTmEplflYU1zmkoZ
 d46HlICY7eEM3/XOnltnxTS6mwS3zhHIdPi3fFNBZaIVevsK5S4JXqw+nsGhFZKjAVSZAgBs9Xj
 /Z3aa1ETgcLGOW+mOaXs07R1c5bSrpazNfJfK9IhJ3KgBRpAIOn0S02oYqoeC3mDx+NUZhbh4Sj
 LNBwueJrCQMZIFqxj5hkZCNQdbsbK+xZcJH5MJOaCEb0LgeKrI+69GSNDlruFcFCLcJfVHSp9yI
 arx7OYYz63pCH3e0rHTIqpA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33344-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Queue-Id: 625B2139455
X-Rspamd-Action: no action

UGREEN USB-C Multifunction Adapter Model CM512 (AKA "Revodok 107")
exposes two SVIDs: 0xff01 (DP Alt Mode) and 0x1d5c. The DISCOVER_MODES
step succeeds for 0xff01 and gets a NAK for 0x1d5c. Currently this
results in DP Alt Mode not being registered either, since the modes
are only registered once all of them have been discovered. The NAK
results in the processing being stopped and thus no Alt modes being
registered.
    
Improve the situation by handling the NAK gracefully and continue
processing the other modes.

The second patch moves the discover modes handling for ACK and NAK cases
into its own function to avoid code duplication and having less code in
total. If this is considered cleaner, I can send a v2 with it squashed
into the first patch. I've not done so in v1, so that you can see both
versions as I'm not sure which one is better. So far the processing
logic is fully contained within tcpm_pd_svdm(), which would no longer
be the case after the new function is added. Also the function itself
is quite ugly with the huge amount of arguments.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (2):
      usb: typec: tcpm: improve handling of DISCOVER_MODES failures
      usb: typec: tcpm: create helper function for DISCOVER_MODES

 drivers/usb/typec/tcpm/tcpm.c | 99 +++++++++++++++++++++++++++----------------
 1 file changed, 63 insertions(+), 36 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260213-tcpm-discover-modes-nak-fix-09070bb529c5

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


