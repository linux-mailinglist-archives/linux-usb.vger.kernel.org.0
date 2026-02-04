Return-Path: <linux-usb+bounces-33108-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNHhEkt2g2mFmwMAu9opvQ
	(envelope-from <linux-usb+bounces-33108-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 17:39:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2212EA5F9
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 17:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A1DB30143F8
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 16:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506162F690F;
	Wed,  4 Feb 2026 16:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/WXbuNV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D325A2F549D;
	Wed,  4 Feb 2026 16:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770222896; cv=none; b=keIYqY7z3YObc0QFvkC6yA0lzl+c333auJxsaSDTG/1lhD3vOGVcuBCk6+8YiDB4JztyvPr5QI0JCm7WOvK9L7j8CKviLtdRzZ2lCgHwFjxHvPGlB4pvzuMDHMNTx7jn8A/ETavfTNTKHtdkuEpUbXipI2BgAVQVVFhiFI6ICwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770222896; c=relaxed/simple;
	bh=YDotx3pCoCc7HRwavS4t6mkHDpZlbqSpX8/wPKcU3oI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PzU+z8emjlrDgpnFQjzESAUyPgGAc+Bqs9UBPeb7EShHFaHDYlT/trEopvx+25Ut8cQeq2wDFq0Gm+b6iwnBkhg4Z/Q2ahJOrZ9sB7iiSThUAPvtIm6p11qXBejsElFiLCyhNycOhr2QeL/Q/T/lLgO9LvY0AXsrX+GL4cOPNms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/WXbuNV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF6BC116C6;
	Wed,  4 Feb 2026 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770222896;
	bh=YDotx3pCoCc7HRwavS4t6mkHDpZlbqSpX8/wPKcU3oI=;
	h=Date:From:To:Cc:Subject:From;
	b=E/WXbuNVh+VZBnL4vdGya6S3YqONUYPqIUFcEibT+Ifos/OedR4z6/WBI+Y2FyFiW
	 3Qe0kz777XkfSR8z2FU23h6403MfyEbh8XBlQ1Ztp+47bEqQ29qUbmJ198kLl0mreY
	 fDt6zaXjy0bLlIplxnac/WLHrFL0KDM5IQmy+YvOvlH6ATgIbP8D23TojqkDDOeqZp
	 EAArji4bEz5RhMVoTSvYX/TSYKuSLkyT33TWemMV+W92WxehOKC9bs7BlFuSt08nv5
	 B/kx7yS391aqZQExALYIOgikumyke7WQBEZz07vrqzPQH/n3j3+6gqL5xtdXv/fc8y
	 BGQwQgyZ104yQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vnfq6-000000005hU-1AsZ;
	Wed, 04 Feb 2026 17:34:50 +0100
Date: Wed, 4 Feb 2026 17:34:50 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial device ids for 6.20-rc1
Message-ID: <aYN1KleJnyjJb6HR@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-33108-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: C2212EA5F9
X-Rspamd-Action: no action

The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7:

  Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.20-rc1

for you to fetch changes up to 509f403f3ccec14188036212118651bf23599396:

  USB: serial: option: add Telit FN920C04 RNDIS compositions (2026-01-27 16:29:46 +0100)

----------------------------------------------------------------
USB serial device ids for 6.20-rc1

Here are some new modem device ids for 6.20-rc1.

Everything has been in linux-next with no reported issues.

----------------------------------------------------------------
Fabio Porcedda (1):
      USB: serial: option: add Telit FN920C04 RNDIS compositions

 drivers/usb/serial/option.c | 6 ++++++
 1 file changed, 6 insertions(+)

