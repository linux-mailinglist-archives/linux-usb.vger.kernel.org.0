Return-Path: <linux-usb+bounces-36180-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK3SDu6j3GkEUgkAu9opvQ
	(envelope-from <linux-usb+bounces-36180-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 10:06:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 897CD3E8C98
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 10:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91BCA3026C29
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 07:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DDC37C105;
	Mon, 13 Apr 2026 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJtlyuCw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69F8399354
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067118; cv=pass; b=BvdFsHR2b1sOnI19RO9rx4J1LFExB5xFBJc/4PBveAfP33/qci557Jlk/eCTnxBc75+p6i6EBRWnolabj27TdpjOFzgpYsuz3b3xGqWjqZsZXLbkrkYBsvSAboubXvc/31dOIJ0+D7mWC/ya7IT4CSHuEB134ZbkD2qrszE964Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067118; c=relaxed/simple;
	bh=rCO1b6jT4qW3ldfK0o55NFQ/frBnnfo6DXzmtZ5lzmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2JwOawoU/LLpOJrTcko9tbKIPIjAeT9Y4+Vj4G6Vy/aPIr4S0Q7A2rNZPX1n6dm2HHL3i3PRjfXLr6LrJ3qd0TzA+6s/73Wyo6YSm+xAtrgbJEcG7uzYwIUV7j/gFgbWEnaT8dw2tYXrvOEQxZ3Ex0/NYffgWcK3+IlglZ9dlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJtlyuCw; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-651ce2484d5so491356d50.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 00:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776067116; cv=none;
        d=google.com; s=arc-20240605;
        b=c8asUBnUYdAu6iGJ2+U3emXUJ1nTEEzul6AS0yqeC6A0q6X+ylL7GYDeQlYAOjmC+w
         OGfDAlgAJCk42iHRVArkljIt+iRx78BP6TsRZF3udnDFlRGNH4CTJT1Ut+CBP/ae7kyl
         SealU3rGzGiCazXyqL4h+hi/S82X/D4N7gbi+iYDIGOQ1L+G6kq1TToG8wA0JM7vdWiR
         be9tbx2fYg+TatyKnLIvlRQ5Q9EMpOrBhdY/VSHJo7YretEa+0KpQk5XpFHFUUqm9WZe
         waMRan4r679re0QUnZVw0tbxB828lf+Y+kPUTXCxxMAimHtzdPHOYkdiy6ojgflXvD+7
         x9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rCO1b6jT4qW3ldfK0o55NFQ/frBnnfo6DXzmtZ5lzmU=;
        fh=0jsfbY2aZ95q2bxLAqB1ZCAUN899K28pXbeRjKP5/60=;
        b=VvlpfS9WTyHori6OOZpuLwcur4t9Ws7Wz7U9Od7aIuizCDHVbnUWGjbxwJ5hkl4qbd
         cLlj+Q3tzKq36n86CZX9qDJr4RGNzRwDylY4jYDD6yBJnxKI4yvN+nbK/hgX3Ix3m/Sp
         DKeX/bbH+QpylZFDmJRN4XjrFZg1XHHtP2TrmkrrQ0BPb5PXJuwTHHaJwmM0HFwlX/zA
         0QCitJx1NOveus8aJp9DOV+3SveiDz6dSBaVZ1wqiO/N5qWW/STZy25M7jX5+40fpK+B
         /GLavwzxiJeeZ2U8Jl4gksQqy0R4+trUl2cx2IYvgcGFeENe/qaNRLkVz7NUkounjhby
         jg6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067116; x=1776671916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCO1b6jT4qW3ldfK0o55NFQ/frBnnfo6DXzmtZ5lzmU=;
        b=fJtlyuCwWx0MSLgj21qE5kLOBaP/bIcVdQtpz299tNutl3KVM3CJu3ZGvx3Bz2kPos
         WTwYE24Pw475nOdXqyRQWW4PtS6q936RjafZAIuFZ95aJe1aXpcTObzJaopQSu4lg8T2
         CV/LmkvHiZOT3sU6RQJ8TCWmjcbyLkEpvDC2UTXBFTdm4Qh6BqMoi1C7zj9vFFM2X/u8
         Cs/23kPrW1qucbHmU7gmkc58rEfCAwH25DGotYQkgNkhAVJBVxtu17HEaQTsQ66OnnJr
         LXit3//8tVjL8zwAZVdQF2SP2p5jlTqzYQDNnRk3GB8cEeJMmECx2310t7USjhnTeXQF
         eC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067116; x=1776671916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rCO1b6jT4qW3ldfK0o55NFQ/frBnnfo6DXzmtZ5lzmU=;
        b=F1/EEsKokjRwMn9uM+LNlHmTQiYxanfR6t1pEu/yiE83sClhUDwSYLUoAQArr1OKY2
         bJEEMfjwJFpHLGfjj/LzQdLK3KWVSeqHinS1J5LORLmw00exQP4JC1cmkWKsKLc6l3/v
         0WzceCfIgqdKhBVS+iWVZg6pd/26LCwU022yF57jxrsS2qqpe//wmVR7FZZCAcxxCKgw
         +zvW+1NJzq80TgVdcPl8RpSpIjRpqZlK1RpLxNa9FaLTk6b5WtBXUGubcjdRqRtPRtBY
         kJ3E7hxBZ39uemOH26Te9AYmlypVXvKetn59Wy8mk+ep7pbr9fW/fSdaq7LSxRQWI34w
         sZ+w==
X-Forwarded-Encrypted: i=1; AFNElJ/GEeT485Wo28GosGbcOBvW032DlNVeH7BhwGrizwO4xXCNSMQV8C0leasIYbiGEz2R9iD7+3i713c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYbRyAfgRDBRbBHfwbOW51jM2vTV3giknNogcweZzYAErIosEi
	xz3Db4wrff/LHvggti3eTyYawqgCLuKbKSw2bYJyf+fVddX7bdTJJUoLNFifuzzjwY9w79gTSrT
	qr0oAO5LkXC83cF4NULejvgIDHdgS44Y=
X-Gm-Gg: AeBDieu4RGo6T2N3cB23T9fpzi57wxX9oJxs8s9I6izLdVDqWJVRNsppjhA+eZlt8uV
	xur63WSdNyiXERsqdrmSLUyWo3HGaQwmoLKDI97tpf2Shv2bON4nwApdTBwUcIFS/U8w/UpB2ec
	ODxesxkFE5K7cADzMP9ae3vrrJdtJBwkcxiVtAuX+cy6bCcz82DeD2pstalDCGdckHhJzTYgY+F
	Op1L2nIngqAwHu9O1Qbwyx85BotowPYa88V4ZYbK2SmhlVGv8z8unBZm7zGY+Duk5DFHg3pJowI
	vVeZKGEIA/jJginfQg==
X-Received: by 2002:a05:690e:e8c:b0:650:2ff9:d660 with SMTP id
 956f58d0204a3-65198a7767amr12034664d50.1.1776067115857; Mon, 13 Apr 2026
 00:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412161555.2568840-1-lgs201920130244@gmail.com> <adyd3Ud2Pl_KRl6_@hovoldconsulting.com>
In-Reply-To: <adyd3Ud2Pl_KRl6_@hovoldconsulting.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 13 Apr 2026 15:58:27 +0800
X-Gm-Features: AQROBzBa2pmk3obezMourkIfU8jvs5w0tQK3bUeHmsgO_W_ALcjIAu_XQYSC2cc
Message-ID: <CANUHTR9PP4rOK2gdH2KYOcwW58qTJ57W--pqHuC4GJQzriXncQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_hid: fix device reference leak in hidg_alloc()
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Marco Crivellari <marco.crivellari@suse.com>, Ben Hoff <hoff.benjamin.k@gmail.com>, 
	Yuhao Jiang <danisjiang@gmail.com>, William Wu <william.wu@rock-chips.com>, 
	Terry Junge <linuxhid@cosmicgizmosystems.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, John Keeping <john@keeping.me.uk>, Lee Jones <lee@kernel.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36180-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linuxfoundation.org,suse.com,gmail.com,rock-chips.com,cosmicgizmosystems.com,collabora.com,keeping.me.uk,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 897CD3E8C98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Johan,

Thanks for the review and for pointing that out.

You're right, the correct Fixes tag should be:

Fixes: 89ff3dfac604 ("usb: gadget: f_hid: fix f_hidg lifetime vs cdev")

I'll send a v2 shortly with that fixed and include your Reviewed-by tag.

Reviewed-by: Johan Hovold johan@kernel.org

Thanks,
Guangshuo

Johan Hovold <johan@kernel.org> =E4=BA=8E2026=E5=B9=B44=E6=9C=8813=E6=97=A5=
=E5=91=A8=E4=B8=80 15:40=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Apr 13, 2026 at 12:15:55AM +0800, Guangshuo Li wrote:
> > hidg_alloc() initializes hidg->dev with device_initialize() before
> > calling dev_set_name(). If dev_set_name() fails, the function currently
> > jumps to err_unlock and returns without calling put_device().
> >
> > This leaves the device reference unbalanced and prevents hidg_release()
> > from being called. Calling put_device() here is also safe, since
> > hidg_release() only frees resources owned by hidg.
>
> Good catch.
>
> > Route the dev_set_name() failure path through err_put_device so the
> > device reference is dropped properly.
> >
> > Fixes: 944fe915d00d ("usb: gadget: f_hid: tidy error handling in hidg_a=
lloc")
>
> This isn't the commit that introduced the issue, though. This should be:
>
> Fixes: 89ff3dfac604 ("usb: gadget: f_hid: fix f_hidg lifetime vs cdev")
>
> With that fixed you can add my:
>
> Reviewed-by: Johan Hovold <johan@kernel.org>
>
> Johan

