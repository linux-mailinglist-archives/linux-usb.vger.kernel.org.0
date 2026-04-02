Return-Path: <linux-usb+bounces-35853-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPXJGeg7zmmAmAYAu9opvQ
	(envelope-from <linux-usb+bounces-35853-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 11:50:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB79E387330
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 11:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E57A303A5D0
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 09:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94542EB0F;
	Thu,  2 Apr 2026 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFR1HtWn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536173DB656;
	Thu,  2 Apr 2026 09:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123372; cv=none; b=Hy4DcJrfjwJ61sAchfueCiq7cGi/c9xfRjUWLm4e0aT/qpsKgHpUSsm7QnZSE8PGDT2wIG5+vYAPebumlzR4klnu9VJjJMOYpUKmvuEJmYuQcZeZt2DzMGeiIbR0dyAKoli2uNiGFhk2Wwh/hzceODO+FoE8gJekRHzYmVPL+aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123372; c=relaxed/simple;
	bh=lQS6oNufwAw6hZOEJZAjn1hdz7tb1JDIHPaoC93fACQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrqrEZ1C1Wi7Judvw/kvpEsOnKWGwGgmoPsC7Hwb1lddcXes8w/XuLI8uqfV924cwOXaqc8aBc7RhzfiezjKYL9t7YXf9xetZ6iPr1QaDEvGap0RF9JiUe8GWi/HlfB5QxaU+rZCKIV7CQIJjGd6wajhW9eW6IB4nuCuPlxGHEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFR1HtWn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5132DC116C6;
	Thu,  2 Apr 2026 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775123371;
	bh=lQS6oNufwAw6hZOEJZAjn1hdz7tb1JDIHPaoC93fACQ=;
	h=Date:From:To:Cc:Subject:From;
	b=SFR1HtWnQBGRrGsc5c/4CmE4A1dnyT6N3IzRYisAd/uyXJfjbS7So9+bOcqvcivdv
	 K3raTNX3CJNMmJEVS7ibjxJc0ELCMs3AH45lOwhR89Aaujgt9EMr/vVWmxD3XvaCcP
	 82tH0GNsFGCFvPQrcwCXH6rAC8qG47lY7UrRXQxEZu7An5SYTuJpOWC5IpZar151EI
	 uHggT+oj9aE7Me4MCdLfp8G2Um6NSGvpynuyRMsWGp2zMhXklzQjx7Rn1OMqlULzD1
	 jDP+AHR9u9AI1zg1tbL4nI+gH8mj9vWBP3RLrIdBh/FoYZJ1C4e3qieKdQAQglramL
	 WWawgDrXIBV0g==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w8Eg5-0000000A1SW-0GXt;
	Thu, 02 Apr 2026 11:49:29 +0200
Date: Thu, 2 Apr 2026 11:49:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial device ids for 7.0-rc7
Message-ID: <ac47qRXeYt92MbW_@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-35853-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BB79E387330
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c:

  Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.0-rc7

for you to fetch changes up to e8d0ed37bd51da52da6225d278e330c2f18a6198:

  USB: serial: option: add MeiG Smart SRM825WN (2026-04-01 11:32:08 +0200)

----------------------------------------------------------------
USB serial device ids for 7.0-rc7

Here are some new modem and io_edgeport device ids.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Ernestas Kulik (1):
      USB: serial: option: add MeiG Smart SRM825WN

Frej Drejhammar (1):
      USB: serial: io_edgeport: add support for Blackbox IC135A

Wanquan Zhong (1):
      USB: serial: option: add support for Rolling Wireless RW135R-GL

 drivers/usb/serial/io_edgeport.c | 3 +++
 drivers/usb/serial/io_usbvend.h  | 1 +
 drivers/usb/serial/option.c      | 4 ++++
 3 files changed, 8 insertions(+)

