Return-Path: <linux-usb+bounces-35909-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDRWApq5zmmTpgYAu9opvQ
	(envelope-from <linux-usb+bounces-35909-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 20:46:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA0438D5CB
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 20:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A2F63060BC1
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 18:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D0F3CF030;
	Thu,  2 Apr 2026 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="jYz2k6Jh"
X-Original-To: linux-usb@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1081E3DA7E6
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 18:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775155232; cv=none; b=O8Y5GGolmKiDLMw0LDj474tDmTMhAWFz2jVK2aZtBhLLIZhZxasdlRdPGImark+yqsEjGq7ZqV9xJg76xIFiEPVLYvvZZIjvvZk+b85cSq03ruHDqWhf6nl7KTfQ+yz5wS5WHW0E5hqGnzf6B7HgWqrTA6RB63hxfGjJHqtQZI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775155232; c=relaxed/simple;
	bh=IGOTpnOWDhUNR6ygSwu6UiYoWIqzwIeSdtLHU/RSj5Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WDHoLs5J4Z+7Ctolr1/3YZjZ333gZ4Y5wkN93Xwu1kqPxWg/OBuojpXlZqqDD9C5ybVnS7hBPVNeouoIsXOTq8sWjSwf9G+KNviZNlqktO1yk95r3XKAN5NVAmXN9i6dGsq1CvadRN/ygV3NiyLWoIPAMt6uTNdlsDk+j/VlACE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=jYz2k6Jh; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
DKIM-Signature: a=rsa-sha256; b=jYz2k6Jhz90VpxqcfzwfdqjH6zXHh6OD+OGVIGWOwhsJE6ycqBoBlP5H9XXij7fbwPClse+jjLECJNA69GHK7NUltHHOLernjKaCvRDIGdfrT7x/DwTfCqeC7haEIUtB8ZlW3cO0bnTZVTW+8oA3bK2Y9GLh6QUK+Rz6NNFF6jvzJHayNoqHrz9aTFcOOI7wARfMN3k7JDfugDQ72KIiCoTMjf7/73iQsMYENvGWc0avzijuEtk//zvQYkhvgdUwPZK4kncHc3sIW1hvKquUiD1suj0tFA3pUGRIKk+dkvro71EE6F3SHlBrpNtsPJviDKQZMxQ35Hg/6LTY9nIVRQ==; s=purelymail2; d=purelymail.com; v=1; bh=IGOTpnOWDhUNR6ygSwu6UiYoWIqzwIeSdtLHU/RSj5Q=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -681438166;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 02 Apr 2026 18:40:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1w8MxX-00000006w84-1qq1;
	Thu, 02 Apr 2026 20:40:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org,  sigmaepsilon92@gmail.com,
  mhklinux@outlook.com,  linuxhid@cosmicgizmosystems.com,
  danisjiang@gmail.com,  kees@kernel.org,  hoff.benjamin.k@gmail.com,
  linux-usb@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_hid: Add missing error code
In-Reply-To: <20260402180008.64233-1-ethantidmore06@gmail.com> (Ethan
	Tidmore's message of "Thu, 2 Apr 2026 13:00:08 -0500")
References: <20260402180008.64233-1-ethantidmore06@gmail.com>
Date: Thu, 02 Apr 2026 20:40:03 +0200
Message-ID: <87ika95hq4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[purelymail.com:s=purelymail2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35909-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[korsgaard.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,outlook.com,cosmicgizmosystems.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter@korsgaard.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[purelymail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,purelymail.com:dkim,korsgaard.com:email]
X-Rspamd-Queue-Id: 3DA0438D5CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>>>>> "Ethan" == Ethan Tidmore <ethantidmore06@gmail.com> writes:

 > Currently in cdev_alloc() error path no error code is assigned.
 > Assign error code '-ENOMEM'.

 > Detected by Smatch:
 > drivers/usb/gadget/function/f_hid.c:1291 hidg_bind()
 > warn: missing error code 'status'

 > Fixes: 81ebd43cc0d6d ("usb: gadget: f_hid: don't call cdev_init while cdev in use")
 > Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard

