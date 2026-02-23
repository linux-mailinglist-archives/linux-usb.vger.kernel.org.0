Return-Path: <linux-usb+bounces-33574-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HQGBKxvnGmcGAQAu9opvQ
	(envelope-from <linux-usb+bounces-33574-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 16:18:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCBD178A05
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 16:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E5C830965D5
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 15:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B191D366073;
	Mon, 23 Feb 2026 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCAuJECM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC0B35CB9B
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859643; cv=none; b=f5rn92hM3CEyL8SuSWXBXLPrKzmzPOwdMBgXwCbDfZ/Jg6nBDyDgSisjyswFKwSLTULxXWF1UQA7/X4YCnWShbNYhTz38Dw3L84YlPkfzSVNA3yC8UL7zdONUN/2hd/BEHM06xCgiiHOb4YwcwdsFUu4ag/0d+LXZOlxt9Nqn7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859643; c=relaxed/simple;
	bh=VVXHRQLJVIkhPd2IDyY6/3ocuYzZkGuoft6mcPOs7Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=khX/cepFtHkxHUHT85n3GILscEveheHimg8BtYYmyC6xacltXRM0M3W8BA36azZwv7u7QQ456OGQgVYUxBZ3CeJXZHTv3i970yhc3IZxsiL2E5Re5XRSyL0DmWgFBhJZYfwBsNdWwW+UjplNYzqcQZgkHWCjwQ81+MehjcknLMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCAuJECM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48069a48629so45949505e9.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 07:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771859640; x=1772464440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnMSq+iMDiikJ8uyTdLbOxczxYu6EkENQJgj76vUHKo=;
        b=lCAuJECMyvDgF3hi/2NR54EbkNlb+iiZplrNjpUvH0s2801EEeXeodEbB8tcj1rTa5
         2uWs7aTBsTtvMUF083+WXWxmoXwch/dQms44zuW7hJN6bsUwE7JvmW3aViIdktIRuW6U
         OWgNJP0EOG1q892gGnkKVBCsohg/AykxJQF/vnneDiS5qG2aA+O26q/wzDXSP9KT3V31
         KPyCFPm9NZ3+mEotv0vt3SzL+rY8p3HU93Da9QzOnVHRGjir0VXwiRkwo6BE0YsWUOdv
         XS7WbRNJBoic+yA0u88lMGZ6uERRdz8r7zU8LfnpKwGXUErO5WIeoJ7vr4uSBysoV5Pt
         myuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771859640; x=1772464440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xnMSq+iMDiikJ8uyTdLbOxczxYu6EkENQJgj76vUHKo=;
        b=I/Ww8qsNZLvq0cPU/IJ2YVKVTLInrb1BHp64cJB+UeLDnytVi2+mli9vyynrcIbE95
         5pNVa4ib7chC+NcEb6AGQ1sp7NxewV+teT10ZS1sua6eN3iq5wg3eNZM2CPKpVzi6wId
         ruVV9zshC5YaavkZIiwp0bKaoZ9nPnCo7nDMGl1u0StWxfjeDcVauh8+TdkSHQlQPCrQ
         Xru0EjMqwuhWru8Akwon9/xrPOQZItK1qzSkgXEzmymZZBptf4sMUY6uJeHGbscwZ38H
         LveUTGpKdLZYf7RwjQTjy3SuLvJ097Kqa9ytBuMl3jrg5Oo2xIp1V+M8CiVYHcSDviCE
         eOEg==
X-Forwarded-Encrypted: i=1; AJvYcCUKgMY7SNzVV3UKutoHMfjiPl09acLttH8rpCLJ6OIdzp85tEAuvTFUPTPBA87FUjkWjr7T9CJCV8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYNSTIqgkSajczCoAFhOylmpyeHjWeKfGVcNNAR/QflTUHAwIG
	6sYAG4AFkfND3uam2kK9McT/vLeEo7cYKzbTvDpbYi6XoJY5h7il3vB2
X-Gm-Gg: AZuq6aJ2MPYn8lfqy+9DOMxkRwNCH6ZRvSOA+KEKeFfalUr6kOthLedPMgbaHTbVP2M
	k2FAuEYqKZCYJ3PUqXnJroPkeud6d8FvW7jlEJjAuELEd2ZatAwNv0gh1ZEbxwCBx6fi2hEWZ8m
	n8/quOn5jhkHS8KQvCMxiqrUPNgUWalwZpu7ZNYdR4A7GWxUsF+b/EuEYs+QeqE4h5q3pAE/TWP
	IvMFlo7UmN4vkeM3FgtrSWYEtQqREtqsS6Rs7cmB5VA780drebb5j8wNzN/B6MSxgxjnXEDzjYr
	hXrwXFxpNjJ/xRGVnCB+9ZcU4UtEwdZgXv1DH9mybpRwbV+Fl1GhX7We3Jk/nD3/NPhgIPuJ4t0
	xobEKkgVkjye4QRlxHbmnxP9/bYB6yy5LF3zncVUdNM7JcwcJg0d1VaREmlNXvcKhLvfDuCXbrr
	AsuXtDMVvdgrUBxsxy1plzJAshbap+Nwbh5mWa4zflKepg9Hzpy40BK04AxElBSsgG
X-Received: by 2002:a05:600c:3484:b0:480:4b59:932e with SMTP id 5b1f17b1804b1-483a95b58b7mr147817495e9.11.1771859640137;
        Mon, 23 Feb 2026 07:14:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9caadedsm166131135e9.10.2026.02.23.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:13:59 -0800 (PST)
Date: Mon, 23 Feb 2026 15:13:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Koen Vandeputte <koen.vandeputte@citymesh.com>, oneukum@suse.com,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>, kuba@kernel.org,
 pabeni@redhat.com, netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: commit 662dc80a5e86 breaks rmnet over usb
Message-ID: <20260223151358.0efc263d@pumpkin>
In-Reply-To: <95ccf5a6-975b-4543-80a3-595f1ee20543@redhat.com>
References: <CAPh3n803k8JcBPV5qEzUB-oKzWkAs-D5CU7z=Vd_nLRCr5ZqQg@mail.gmail.com>
	<95ccf5a6-975b-4543-80a3-595f1ee20543@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33574-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BCBD178A05
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 15:08:41 +0100
Laurent Vivier <lvivier@redhat.com> wrote:

...
> It's weird to be able to set an MTU that is not supported by the hardware.
> 
> To restore performance I think the rx_usb_size should be decoupled from MTU max in qmi_wwan.

A lot of 'usbnet' drivers support usb packets that contain multiple ethernet frames.
IIRC (I looked at this code quite a few years ago) some (all?) lie very badly
about the skb 'true_size' of receive packets - putting in the frame size
even though it is sat in 16kb+ of kernel memory.

In reality the driver want to receive the 'stream' of usb packets and
debatch it directly into ethernet frames without going though the 'urb'
buffers at all.
ISTR that would be possible with the xhci/usb3 hardware, but would be a
massive re-write of parts of the stack.
I was only trying (and I mean failing) to get 100M working reliably.
Project got canned for other reasons.

	David

