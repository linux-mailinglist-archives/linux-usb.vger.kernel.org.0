Return-Path: <linux-usb+bounces-37569-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPbHJjKkCmqw4gQAu9opvQ
	(envelope-from <linux-usb+bounces-37569-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:31:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 414CE5663F9
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 775C9301584C
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 05:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4CC3A960E;
	Mon, 18 May 2026 05:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pu3gKU5g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D653A1E7B
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 05:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779082244; cv=none; b=i8ipMo0ipIP6OZ+YI8nThBRmtSiCEW2roZIw7K52NlImMk15ngl4orwYniNb8I8cDWkADnlMNfRQVlaxoErxJk+mnchk7+Mq3u4rsW3b0sICkbb2UOl5GrIsnhFWu5Pm9uu6WVpnr0aRTsMPqbo6uE3K0Zi4CDpxtSevUJLque8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779082244; c=relaxed/simple;
	bh=RnL5fZxjhvDmlYKvKo2J/EoVmdjpE++Y+0mlr6Lkm4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CBKEREdm6Ix/z9uT2kQkcQH4DwRGNpTiTXR34RiJtxnTDkSMvXLYaMr0D5ohg4Rf7vcVtlsTTlw/k1QifTL3Oo1Dhgo4Bm+b6gpnN13iPkWYWWKKWbt7F0sjuaIjM+D9GNESyjbJHO+WAcHWaVyn/cBz5hH+qvNDtNA4vzcEux4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pu3gKU5g; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso11066305e9.2
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 22:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779082230; x=1779687030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w5w89EEDuC5yPRRB9W0g6ARohO5ii2A0MezLqx8dkrA=;
        b=Pu3gKU5gB8QQvt43e1hheIavuJ5lsK0A24eL/It/7jzuwmhNg1yDqMZfw/xOaRc0+L
         yXqIlmcL8zjffYErUsIw1JxVILi+JVESyI/ycgdgpl9lfIQu84Vf4OXPIWLm37USrqv2
         LrPAV39U4SpEOGnUKUHc74DTfhS6nHbzeMxvwxmsgvo4eOvS4GL3QqfFKm5fa5CNZ7p/
         0ge5Y8FdyO3IUk0JnD4MmAz9DI6LKyRHbS+l7+5GjX6IPaoiMDClFgKaZusmBMUC7z5+
         fyTdwy0CydRmQ6PGZf0OV8kp8sFZ6QBW6PCqgyZnVFpc5oJoeW6Mm4Twk8tTFKp5NH+2
         TzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779082230; x=1779687030;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5w89EEDuC5yPRRB9W0g6ARohO5ii2A0MezLqx8dkrA=;
        b=IjvUi87zfE4CI54E9/Cj4wY84QY6p/koSjszU6xDqtCVBs8oe3guvqFgM5IpLxEggj
         m+/7RnhJf/okBtrQCAkha3Q+ykF5K4evuSs+/cWTp9TBOKO4Qga4jZDcYfBYhD/wtqHs
         ll+HKl34HlaEf87AZ9oDuGTfrMddBPlfBWqj6K1tUjSEySXu5YLOMJTuhKAknD7dc47F
         5mfsDjc+HD0WtpilS6R0P7wB9N0zrgEeAh/p8Gw8p//aGi4+tsG9Bfab1/M1BL5WJZyX
         RY5BK1kq9fEZlU0Egs22L0rkkobUa39IDpi5BeI3bFjmnig7Ps6Yfbixy+NfAsJkZYTd
         DMHw==
X-Forwarded-Encrypted: i=1; AFNElJ/xg6E4O9jb54ElC4eP4WDmNqd2qgCmc+Y09ppbEe7a4m0TqY+hiJSMbnnrPZxkDmiN7y67Jwop9Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKXZ0EuH9GnuVz6OGaUCrwdq7DFYsCGGcWWTY/KXCih+yEmEOU
	MroooDZTVIUXUzHiZpcn+aMOZj6u42AbxksQ0w8VvyTWhu41pDzG3Ff5
X-Gm-Gg: Acq92OHMVt13BULZ0kJyi23yUd3JIlNs6TIw3ljQ2Y4nmr11zu47mXrIc3+EEEisY4M
	b0B6qtQ8vlxMaAQv9O6dXB4mGdA1v2FfCH0+I7CHIffLQuM2l6VipqCqBBLh1ESwYTsCi79Fd4m
	ALa/NnYt7hHcGAvGyJuLqzNLuB0NYzZl0SJ+2yObCPrxl3mk5JJw3XPQqeFD6DXHRwQNrHBkDfN
	4VeUNWS5jd9iqoyrXI7JBNjEX6JA/LldxjUYQWMx0fVbG1rb/lPYnYPdnj0C0c5kqZz4W9FLkbK
	U2hxLrUTJVB+XxJ9WSko0B3EfjQR/e8RHU5zraUT+/eNwzdGpx4VQBOxdHss20nKi+nqIH9YG7a
	+P37o4yYauukvvF6F3LOvKJz+BESTz2vnhY/KUO6VaVtik7L630GwDZngu3pfW+4p1MVceI7BeJ
	uh8fHZRaSNItSKVTDsK3rwZg8ITXjy9Kg3GtcB0OMjepE=
X-Received: by 2002:a05:600d:8:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-48fe6325213mr171499065e9.22.1779082230314;
        Sun, 17 May 2026 22:30:30 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab6aasm243226785e9.2.2026.05.17.22.30.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 17 May 2026 22:30:30 -0700 (PDT)
Date: Mon, 18 May 2026 07:30:26 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: "Xuetao (kirin)" <xuetao09@huawei.com>, <caiyadong@huawei.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] usb: wBytesPerInterval workaround and cleanups
Message-ID: <20260518073026.5580bb79.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 414CE5663F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37569-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This series provides a workaround for certain devices with bogus
wBytesPerInterval field in interrupt endpoint descriptors and enables
them to work on the latest pedantic xHCI controllers.

It also fixes USB3 root hub descriptors and improves error logging.

new in v3:
all: add cover letter
     rebase on 7.1 to fix context conflicts
1/1: reduce wMaxPacketSize instead of raising wBytesPerInterval,
     as pointed out by Mathias Nyman

new in v2:
2/3: added reporter's tested-by
     use usb_endpoint_is_int_in() as suggested by Alan
3/3: new patch

Michal Pecio (3):
  usb: core: Fix SuperSpeed root hub wMaxPacketSize
  usb: core: Fix up Interrupt IN endpoints with bogus wBytesPerInterval
  usb: core: Clean up SuperSpeed/eUSB2 descriptor validation logging

 drivers/usb/core/config.c | 46 ++++++++++++++++-----------------------
 drivers/usb/core/hcd.c    |  4 +---
 2 files changed, 20 insertions(+), 30 deletions(-)

-- 
2.48.1

