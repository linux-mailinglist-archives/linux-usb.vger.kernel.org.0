Return-Path: <linux-usb+bounces-34113-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANdWBMifqWnGAwEAu9opvQ
	(envelope-from <linux-usb+bounces-34113-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 16:22:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B95442146A8
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 16:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B55A23092239
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 15:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C173C2766;
	Thu,  5 Mar 2026 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oascuMrW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28003BED51;
	Thu,  5 Mar 2026 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723872; cv=none; b=DeqQ3Ux9N/eNt6bqqR29IOI2Bma38wLvASaSMUgBEjIo8goJyzh2+KNcSpn5IZO5LPMAWIGawas7mopKR4OlnmmuMmR2BhtxiuDtVWYFQAmCzd3+yEs1+uEbya+IQWjyOitRJYW4tS8gpdS5mQe5pFp+LFLtkRxNjo+ysXQefiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723872; c=relaxed/simple;
	bh=y8ILWQG7JkuLDjpNM06tK6RUyEbmfvIapjqg8PmHQ4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PhOlSm2M2PDB9SdsIIbUr2Kkzzuu71RZPEX4rC4sA6IeWPxzh3UPby9RpBxAJ+9zbAoS4bwIZC+gdeHuOVGoMGQNKbjd5muBaOZNRfaeFhMn9ZH1W3cCv+OZMLuXSa9RwVVA7Wn2Yd9ReMzySbfG4uyFQbprcVTa7Wcr7m6PhwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oascuMrW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D15C116C6;
	Thu,  5 Mar 2026 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723871;
	bh=y8ILWQG7JkuLDjpNM06tK6RUyEbmfvIapjqg8PmHQ4I=;
	h=From:To:Cc:Subject:Date:From;
	b=oascuMrWC2MV//43+OqoXbhPLegeyX5aF8LSm4ex/y5ySME8Z0f9yPeSv0GFTZr4B
	 0fiauICeX8fU0MOzqoieIj4zZQ/LtXikFsxJOJY5DdmYVaHffI5YEPDPCQTGcXr9mL
	 9idEGx+nb6+tqNvlX+ti7hGQ59kZUdUvet99xXfEZj+dNQjKhvTlUr+9i/SdwyRg9+
	 4kTbeHTSc633uZZ6559ENuZ+IXIRpP+gMdljFOIP5EpYk4ZoWqd5zmLnaUDOhPw69R
	 2uN0sCjjybgwdc7AO+6MbOdlqAqmNk4xy7fFkY9I8FYlIXJ4NSRmShiJkB0Nd53Aqy
	 iuhRaED5H/MvA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vyAST-000000002jv-1Hkd;
	Thu, 05 Mar 2026 16:17:49 +0100
From: Johan Hovold <johan@kernel.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/2] gpib: lpvo_usb: fix unintended binding of FTDI 8U232AM devices
Date: Thu,  5 Mar 2026 16:17:27 +0100
Message-ID: <20260305151729.10501-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B95442146A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34113-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

I stumbled on this by chance when trying to jump to the USB skeleton
driver probe function. Turns out this driver includes a more or less
verbatim copy of the USB skeleton driver.

This series drops the FTDI 8U232AM device id which is already handled by
the ftdi_sio driver and renames the driver symbol prefix to avoid name
clashes.

Johan


Changes in v2
 - add driver prefix to the commit summaries


Johan Hovold (2):
  gpib: lpvo_usb: fix unintended binding of FTDI 8U232AM devices
  gpib: lpvo_usb: rename driver symbol prefix

 drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 213 ++++++++++-----------
 1 file changed, 105 insertions(+), 108 deletions(-)

-- 
2.52.0


