Return-Path: <linux-usb+bounces-37118-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BioDFOF/WmefQAAu9opvQ
	(envelope-from <linux-usb+bounces-37118-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 08:40:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC254F28AA
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 08:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5568300533C
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 06:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD7436C9EE;
	Fri,  8 May 2026 06:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7jHei9I"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC887261C;
	Fri,  8 May 2026 06:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778222391; cv=none; b=nbzuKKzqsXoU3ppFCvaR3a4r4n/EkN71KzIedA0GTpAX1QO/j7cLZDpElC6xwCYoccSHCifNENvRzpmflOsuxHsIp+NJZYGiLEOAnZsXgl0sDPCJ0vOSWuztAbUS9wYy2HmCZQr174xAg96W3pSWVWI8CTOCSHR3LOc0pyic/+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778222391; c=relaxed/simple;
	bh=0adgrovNEWFOM7Rx6MUH9CKKCMtkQn//08EqzqMpL48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hukahAWfWRLY9bshOdNZJQLp/ostGHZt4Dte+s+yCE7Pqs9tNORNSDAmBscL4nQYdRA13Nrs417qfrFp40d8mqiQa559U6/Pws3vV3m2+kfi+0wMAjWisbjcgIOIz/UsfY9Exw7iKjdqrLeoHZT0YVyqf+AC8JYqWP/JRLknpB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7jHei9I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A33C2BCB0;
	Fri,  8 May 2026 06:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778222390;
	bh=0adgrovNEWFOM7Rx6MUH9CKKCMtkQn//08EqzqMpL48=;
	h=Date:From:To:Cc:Subject:From;
	b=G7jHei9I+XEEV9InkdKGWxzYDvA2OdiC1TDELDjouSGqNIgk55//cOUvPdQku6KCn
	 RAdbWuZ7P+pcUKjy2bKHcqDrflvGr4VALByf3QMwm0uLxQ1ACVYpzXLCle5xgudE/9
	 cvwTTXGMD5DbvUtZvUPvGi52Kya66fVTqgyHUmW5DOfdF8mpXL58zjHnc0dRob//iv
	 uVqUJTXzNg7ILpf+Sk51llxk3/bVbZj2whLMmtsAOXa+EZimnAkDlieRhhoaNwIZd5
	 yI/fWMJ9ZIdEZx25CHsItPQqlgoNcXA0nmmz1fmxuqnXhV23zryevWeKdxKqu4Kqj8
	 HTnzCw61JOrTw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wLEsF-00000001Gp9-2nMQ;
	Fri, 08 May 2026 08:39:47 +0200
Date: Fri, 8 May 2026 08:39:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial device ids for 7.1-rc3
Message-ID: <af2FMwA6olGEgjWu@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 3CC254F28AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-37118-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.1-rc3

for you to fetch changes up to 100201d349edd226ca3470c894c92dccc67ee7a8:

  USB: serial: option: add Telit Cinterion LE910Cx compositions (2026-04-30 10:53:56 +0200)

----------------------------------------------------------------
USB serial device ids for 7.1-rc3

Here are some new modem device ids.

This one has been in linux-next with no reported issues.

----------------------------------------------------------------
Fabio Porcedda (1):
      USB: serial: option: add Telit Cinterion LE910Cx compositions

 drivers/usb/serial/option.c | 4 ++++
 1 file changed, 4 insertions(+)

