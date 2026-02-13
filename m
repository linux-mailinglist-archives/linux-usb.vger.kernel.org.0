Return-Path: <linux-usb+bounces-33340-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCapOp9tj2mYQwEAu9opvQ
	(envelope-from <linux-usb+bounces-33340-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 19:29:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 994B9138F1C
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 19:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 446843034E39
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 18:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF95427FD5B;
	Fri, 13 Feb 2026 18:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBIDoGkr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3178427BF93
	for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 18:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771007385; cv=none; b=YWgP2VfaxkWVxZfSxyCXmUILvyDbK4PP2o4cuxuZGmdk2gWfGFtpkY2PnQdtCvv3bBO8bMnUKTc7zGS56jL304r85Yu5bCXo4aTGUJCxOeJp1t9qTBScjtn0gJ4VuTthmXUMF1/YCMNMc9rgzDDvcoFysOKJSpSiHCPa0rHEeR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771007385; c=relaxed/simple;
	bh=W52K/wPAaq32CCmZNnr9ljKa7NSzbGiF+ZhsZRw7kBE=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=eTXmk08PFTXWE8cbHxW++/wqiP+6t/Q7VQ714GK8vLNhxWhnAsPZBscvL6U2BUI4IA8b5cg8RNKyqSAlDnNkQmK7RJmaPE/DmxE5nYo+qnNvYTA5dqj8P3YLwqHEB/60qRxjkD4v8DxgLpiJJsyd2Zq2Lgy2UsWDBB7yordXGwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBIDoGkr; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79456d5ebf9so13012417b3.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 10:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771007382; x=1771612182; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W52K/wPAaq32CCmZNnr9ljKa7NSzbGiF+ZhsZRw7kBE=;
        b=EBIDoGkrolRpcD0z7gc4OcTf11Ge9x2561b4wR7VrQ2U4Rb29hCHvkfdYqbAfEtVFQ
         fcdf9Gd2unT9RaRuIykrM4OiqRkLqdKwaFA4GSIuscAblhbKmCSsbu4goqaJN1g0wIsC
         VaJkQQ+9GasBhJnZfuuddbgKIEYQUpBz2PjMxT5wmBUpESDYiofo5uV2V71owOYuVJ0d
         dy5P505cHrXaLTgyTYHSAG6l7RtfHqggXS0tGPvowRqbCB/6mOky1XwJNUrk9F7tx/KF
         seskiwQkUpqKDpOnG72xGHBsMvc5hz3dlLY1cbC5j1NiS1u1eyRIUmu5hDuPQwykvEHO
         2WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771007382; x=1771612182;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W52K/wPAaq32CCmZNnr9ljKa7NSzbGiF+ZhsZRw7kBE=;
        b=T/GnVUGscbtBX1O7dk2kK8hTNgwAGQhtunYc4j583WyQf6+/suTiC6A/s6Mr5OlyYe
         mZXJwrYaG+sBhUoZxkhkhef1cQHFJCa9HoSJelV7h73etAHOnKHE+91oapHqUCiIiF0G
         8p/7ZQvfzXwGpY7iP7jdm/JbJmgpO8acnPrJAHgXOhUH/nWoWcJATxSh3zoz80EskTv6
         CMeA0M3QCDoTlLtBuiP7v7N+eyRfD1QfxrWbsuHCRRf8K6FK//Y26l6bvbafWpws6gIB
         0lw6OmLAfLEc3Tt5xGT+U7aWjHPoY3nwT5hjze3EYfjMYz2oS9LxjfThjT0EpydMAK9S
         ZDXA==
X-Forwarded-Encrypted: i=1; AJvYcCVWvMsw63DcgW4r+nIpvLw98rAhfQaL1nvp4dlqYesSmZWXFd0YqXxhjXSWF9PxEdca8zEHzV66cDM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqekz8ZOm64XwXahXiczWUHqSrGbDrQcYIu02IDVgwsCzvNU4V
	doSWXn4/om65dwWPyj/F1ReUI6bK0+2nfEBy9cXDSbvzfZUJVAW+6J5e
X-Gm-Gg: AZuq6aL+UYJ+xy3mQQdwSTT3OnlbeR/OaUq6qUCiYt+Dira8lYhbQcZ59R0TrKSwIEH
	R6pFMm6pC9okRbpNOwHZ9FvVC1Ly4cP0KvZKr1BiRWyZSdC5mx/yH3MK1Pvgz3QIT2PaIY4aTpb
	4gRpoe0l9S5N7Yz1Nrh2jph+vXy9UCyAxq9NikdX7SY56Md3HigbHzX9PFIj+V7MqwoQ4w1WiBC
	O1gTQIiV9qYfw8487efy9NBb7rH0Q4OdlX1vK52cezGyLynN2fl8SuYn9jpELlaTMB26fifyLdu
	Sh2d8pQ4zDOdXolTXxiJJvyLmgOj20Cr9+44jr+yM4eQii6hQwENXBIRmRyMCuLP+a0N7CDMybB
	4lRzYb7471aNpYhz0FJYkePPW4/5MaJwV4Cye47qLyHDJ9gkSKJH0rl6jT5GghqeTR8gyMy66KG
	NOYpnAzaGm5E0nYQEHwUDlovgR9cYhjxXV5NOaiuixs0IP7WXE+UKolmAKASKzcucQD6tQ
X-Received: by 2002:a05:690c:3583:b0:796:3a4f:68fd with SMTP id 00721157ae682-797ac5d4506mr2004217b3.41.1771007382208;
        Fri, 13 Feb 2026 10:29:42 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:e60:2e00:28e7:e954:c7a3:adce])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c23d1edsm76138987b3.29.2026.02.13.10.29.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Feb 2026 10:29:41 -0800 (PST)
From: Shraddha Phadnis <shraddha.phadnis@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6.1.21\))
Subject: Re: [PATCH] usb: yurex: fix race in probe
Message-Id: <B1347B59-82B5-49F4-BF5D-9575CDCDDBCD@gmail.com>
Date: Fri, 13 Feb 2026 12:29:29 -0600
Cc: gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org,
 stable@vger.kernel.org
To: oneukum@suse.com
X-Mailer: Apple Mail (2.3731.700.6.1.21)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FAKE_REPLY(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33340-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shraddhaphadnis@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 994B9138F1C
X-Rspamd-Action: no action

Reviewed-by: Shraddha Phadnis <shraddha.phadnis@gmail.com>

This makes sense. Initializing dev->bbu before submitting the interrupt =
URB closes the race where the completion handler
could set bbu and then have it overwritten by the probe path.

Moving the initialization earlier ensures any early interrupt sees a =
known state rather than losing valid data.

Agree with CC stable as this fixes a real data corruption case.=

