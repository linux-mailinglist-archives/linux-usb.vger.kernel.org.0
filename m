Return-Path: <linux-usb+bounces-33330-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF5yOz8ojmkMAQEAu9opvQ
	(envelope-from <linux-usb+bounces-33330-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 20:21:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE6130A8E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 20:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F78A3014BEA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 19:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D4429293D;
	Thu, 12 Feb 2026 19:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="H9PBnDsd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B5A81AA8
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 19:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770924086; cv=pass; b=LOOXCpBNr1FXy4cCLh5je0/8BVEloAemUuHIGpcHkQAeyq5zkKmKTiKYBXAKVnK9ZcKzC/wdDZj1LCuPVqJ0zfgDLhw0roNLwkNcs4/U6erIEHJ7C+mcAGQ8V78P50Hfef78dnQ97XrEuHp4/a6/1jMPw8/wNMrVGKYEh/oH1Xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770924086; c=relaxed/simple;
	bh=oYFYku8YBAPUfnfW1WI+/mn7+uSI4bArfWKjKKBzryU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGQhgHDhQCfaLhn01MmPjo6FhW59hXlGN2RiVjZ7tgPCahA9rl3zYQUSXyzQlji93rQoT9RGACdRKS9ic835TQHOTnLSfExbEQax8lCSyB2y3rHs0z9N9WFlyQAPlosFZJXEhqxchAqp1NFDJ4IjqqjWMXZvApqkidBM0V6Psps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=H9PBnDsd; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7cfccba483eso73883a34.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 11:21:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770924084; cv=none;
        d=google.com; s=arc-20240605;
        b=GTXIheLuNn2i3umjdpXw/cimp4Q9jPb7xeWT0Jit+VHZH8ZlFbfzc45LYtpnclZSu/
         WIdhsn8g7yE1JUrTuYrTdwNsFqNd9iTtjgoPKcEfHDkhWgv4f7/6FsdIetCf+qnoYlJv
         gYozeI9bW02YvAopZBEtb25+Xnh4g9XoKjxt5CA+5n4ajDYa4hsOaZE3bw25YekLSVK6
         QVavBiOYboBl3Q5yLav/8RgjHuZMGupLa+TGFfrZOmI+UhZn751JEWaTdDz/AYyaGBnd
         y1//8VvBHp1BnWMcnD+t8irCYUhqwfcu7nMBDVjsrcthLZJ+lFZ8pJ3Jrq6Apljw3uuU
         MnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oYFYku8YBAPUfnfW1WI+/mn7+uSI4bArfWKjKKBzryU=;
        fh=ssyNoUM0twEvMy5/KWlX4NQzvGRA9sKS0Owg3krxmTI=;
        b=lBfdMoHYhmwEyu5o6/ym6zOskDOzyRcphqpzmchq+0Ydz60M8Kf45MUF+G14/xndmZ
         8aQ3b9m9JzJcEeWZLtpY6UFo8X6IJVDQQPAXQHqKFlck3wUcyR4J4rXjFZNA8xs2Tt1S
         Ll5QIydcNW/DnwwSheB0bKXrKZjdVHjO7APY25SV2Ez6apl9UPaVQFiU7lcFAc7PlyzR
         6UwgFqjEJUd8dwRrjLfXUI8u5dWQNTeJ5QLdyUhANz7SdKTridQl3PXqKdZIlo8oU1Qc
         oQMZUwzQBX10DI5X08KlJDWZBaHrw7Mda/zyGc3oVyuWd/Z47SPzHqA616vsrymndqLI
         4cqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770924084; x=1771528884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYFYku8YBAPUfnfW1WI+/mn7+uSI4bArfWKjKKBzryU=;
        b=H9PBnDsdNBiW27cGHX+yqTpJ62vlPCBEeUvS7/wEnPB7UMWk3oEtd5QPRGvRrovRmd
         SH6xELds6QuT3S7VjZlL2Ni1cPuHZ3eHYninb0+87s/DXw6JuR51fncVeqtR42lwuEz4
         o4BGmuELmEHNPnaUxyryqnndDEkiIkxOSM/vhXm40cvn/YO+otITBofsoLwEPQmlRReN
         LJJFPrRG45e5IRHn+WKHNor6CR618c3O/E+/S/dh/zJBX8ArxONz2ttrjFCsFWapvywM
         jnkoQj63Z31lGfs8nPovsDC2+ujnVJOfcLas64aXfkjVPe1xM+ditNXwOx8txAnESQhF
         9hJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770924084; x=1771528884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oYFYku8YBAPUfnfW1WI+/mn7+uSI4bArfWKjKKBzryU=;
        b=nlp2JO66vHY96lBHYr2gxEIPj3erMdGAHFiEU5k9UKeysyZnC+nqNkOFVMUdBOepu2
         hgDvKbBkRaDrY1FnC9S/UjY7UE0TMMVZkCTaiEn8myiqxQQ770kBJgRZ63twsuijf/Ol
         X+jEsxHalffMWjfxhQxLaHP+jE7jL9XNnVHhGxootBbj+DKrhS2VGSzziPshAOLxQJPQ
         w6+kMPEdkkMFGCIZAVt+Y2s92jaQ3sXLIDLUGoCK1I6QTg+9aJATH2tRKu1Cmc5yn0d/
         6Dyoi6FkPBzL9Odtc9BGtW8qd9RNpdH4Gs7Gm/wlS3ZdT1oCHCZbbrIlwVzNbPvaLGby
         AFSg==
X-Forwarded-Encrypted: i=1; AJvYcCUh+KmEu8dwjhDQIyas3SYLuTmx2UjUcZ4LeWvZ4v7uDl894JNhfJ5JzY4z9ZD2XDbtLtwMFQKzo0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeOd5pm4NacxVyDwq7/PGcnlAZaJF3jz5LUxd41cxI/Qv5W1fl
	X8wfmvWO+DZFhETN4kpHPghgCXNeyCchJgkWLfXrmzVJBR8gB5KE6D0XThb5RZbzUcIsahE67KP
	i0jlqdnaSiurK28dET3JkRnJm7+9nk8YEXOOGtxnO/A==
X-Gm-Gg: AZuq6aKSO8hyDQjnp4R/aQVhfKc6cY8mR1ppFJtit8cKHrTFIbiqO2Zz7aR/tWh6M+3
	rUxRwjS9nTObKl2XYbwT9Q4C+WkHxm77KJyxfyXuMtNxFJXFpV52+I5Oyu1+Ak0XYz3O8oU6A+G
	VjdP5Q/jmVU+KoYNGZK60nskwd+TCmDwtAI8WWVDygMZWM5E3INTb0XPX85cZU4u0xPteK+Z4Ow
	AuBCoeHjoFWtvjKqTrbnA+1yKCpRYHv9Af0aea2npxhxc47k99OWLSUoJADDnc4o2uYDO3N5wSM
	UThK9jFHFG7N6ZAeHJbCMTwHTO6RjyCIabkb2KftpsLZAh3Ijw==
X-Received: by 2002:a05:6830:67f8:b0:7b0:826e:4002 with SMTP id
 46e09a7af769-7d4c1f27f50mr241400a34.20.1770924083779; Thu, 12 Feb 2026
 11:21:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210024341.3216007-1-n7l8m4@u.northwestern.edu> <aY4JV-aEInRDHYqW@horms.kernel.org>
In-Reply-To: <aY4JV-aEInRDHYqW@horms.kernel.org>
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
Date: Thu, 12 Feb 2026 13:21:12 -0600
X-Gm-Features: AZwV_QgFy1H5mqoM_Ef0_ayz7-d0tIQCTt18dsPIOyuGeMXQ_tPEbOfy_I1noGQ
Message-ID: <CAMFT1=ZAiriHoy-BBKsTSLsb0ixdi44pdQQ=REZo4m--c_tmXg@mail.gmail.com>
Subject: Re: [PATCH net] net: usb: catc: enable basic endpoint checking
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33330-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,u-northwestern-edu.20230601.gappssmtp.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2ABE6130A8E
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 11:09=E2=80=AFAM Simon Horman <horms@kernel.org> wr=
ote:
>
> I think that it would be good to use an enum instead of the magic
> numbers 1 and 2, even if documented inline.
>
> I'm suggesting something similar to what was done in the cited commit.

Hi Simon,

Thanks for your time and reply, sure, I'll revise and send a v2 version pat=
ch.

