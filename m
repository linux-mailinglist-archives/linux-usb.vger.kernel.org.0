Return-Path: <linux-usb+bounces-34785-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJGCCj4NtWlavwAAu9opvQ
	(envelope-from <linux-usb+bounces-34785-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 08:24:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0228BEE6
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 08:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14410304DCA6
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 07:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B9752F88;
	Sat, 14 Mar 2026 07:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6lHSctm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0DA27AC45
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773473072; cv=pass; b=EaMLU7w2zcsL7dibh5dWkLZeRQd82dDUJg7UA+FXjN7P2h/siy27Z15/fRIzXjyqVn9kdp9xkQavQLjUZg7uHwp6bQM+9425cMvsY3+d5kklLhipm0zpfULBTkl7n7I/Rvh+A9rWPjA8LEUuBaI9cfj9MVvyu/4XFsGl/As/unU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773473072; c=relaxed/simple;
	bh=qd1mApvWSGdixoIc5To2ikkz4kciaMH/nUOF9Qefu6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSqnEWsp9Hdu2rSDZT4+5sp6ky4NgdgPnJAimXFZJfQYFgqLeInzWOc7CUq3X/5L13m21wpf6QwZHAxHiXpr78K4BjwOWTBubSN6ss8gaYzRwFXyPj2LdRVTfKQo9q/NsIjAVzyIF8bLIHH8mr0gTwVhomJrZcCCbqU43JIE+Wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6lHSctm; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a9296b3926so23196525ad.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 00:24:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773473071; cv=none;
        d=google.com; s=arc-20240605;
        b=N/qHJHQzyx59iNlw/j+qp/Qp3AftepbWTLFilbVSXGPmWwUuxTyNW5W/UsDVshHgra
         KSSNQlidYaQw03xJrLwPYq8OKZGGYv5+BKKf56KyrUWqn5Y1D9eJoOsAPoBRw/kMWfLm
         Qqlcw0yNJVJomFzGFH8Pa61yWUUsy0nEU+F1mdnBDzize72aii9FCjZPX/OfHPJWNras
         hLC5rj8wVoRpIacy6yuN6Lux8ZNi8i8cpzeheoUyJCJ1Yd1yYucvmml4+vNq24/piy+b
         G/JLjsNTUL3HYTy1tfxnIZXULJuvdPT/zNh0KxIYexFtQj1hLuj5/OBPzglDjQrXiY0R
         LYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qd1mApvWSGdixoIc5To2ikkz4kciaMH/nUOF9Qefu6o=;
        fh=+elBgB31JBeDp4ZW8RzT+IiWsMs2EQHg02daqvmgy3w=;
        b=YaGE/52s0TT0qwOsIu/aYQn1dL57tBvNzVPVQarR2Z3qW6oZ5D74mwFMsYayYG/Crh
         v8HxZUz8gowSaReuf9x2IPU1iR0JjtWN0yqZrZ9i+YoFgRkwSoBwDn3fX01yPyjLl9ju
         MPiF5GGm5/apebSt0MBDiG6ka/FpXVfpnNb01CuAe4n72RUH4zHDuiuFQRZawvRAitPU
         h9xDylJqhC5zRKMKAO17TeESljSWrwCH1qgHGbv6Jtl1mkNJDk+fXtJldse9D0ega7Us
         bR+pzfiEn1FghTKLyV9X1E5WayjyWzvSqc8/MA/9LnhUZIaHgEB9RuT5oRUy7Yq/AIto
         E4eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773473071; x=1774077871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd1mApvWSGdixoIc5To2ikkz4kciaMH/nUOF9Qefu6o=;
        b=D6lHSctm/Ja8kNjZu5VMxO5SJO/CS1SpfBE5Komf9ziuvuId3tq0FlYr5p8dD1DpeL
         YxzZQlTNrZkL/Ry9QhsrrqeGwBLUlYemzs0AUj6ldi3sVINozvMf3IILMi9Y3qHtoqPg
         ZfBJ7ifGfD4U01hN5ylbQhuR1FZ2WRxujyhMGM7FKRIWB3DX9d8EEliNu+/PQ9pFUxnd
         3GOwIeOZdP5ny/vS+V5ns8BSxz2tqOQ9V/335hvss1BNwmbWFHkszX5EI8fNHGZnhRZd
         8/BcpS7bpNadHDlcACvTQiqKOEPBFHNVkmPrlJIinM1RWT05j0Bpu0cWus3RjzHL53iQ
         lkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773473071; x=1774077871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qd1mApvWSGdixoIc5To2ikkz4kciaMH/nUOF9Qefu6o=;
        b=ccguEW5nHj2zSqBUdBQmndmomtLIKvFbhmKO8qz0O/Bm+two306uI5sy1/bJ2P1Fwd
         Jws0cKvJwUNYBleofYW6Lluubj3oujqBgOvkqTLBpCTxywhrcU9up6bDfdC8KQJdFNv0
         R3IS2Enz9LxNG6K8FeTIVkBOo/3HJF9OfU6ACyAK74yBU48CcwQ5JHSX946BEJEgUKW2
         9gbErifWxPrtgjesNjOxN+wSpkO4mPRD+JfD5w9crfpfV3OXmAwFKYaSBuUsVPv6jlkC
         PkO23pRcMF1RdM+h/vxy3E3V/MzfDKsJKWG3X6xoiF6kjWxj+RBQOOfA5WFosDeQhCcK
         OJ4A==
X-Forwarded-Encrypted: i=1; AJvYcCWlH7rTphqQPvIXsApVjO5/RPDG0Mk+aEFBfNPhUW5T3a4bErChtJj+muljjX28HJx09cA92mgd9iI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIN9wXyRuWkZQnWhZzcbmW7ofnPjXRs/sGiDVyogrwjJwgHzWe
	jz6kzXR1qrN20ZWjEgLI3cIFpfNP0bYI9h8P1AXv6IigoDExOESxCUSzoPAB4yehisUgbMQ4IKv
	U79hAo42CFxc5zCRyVk4o+/zyX/2dZgY=
X-Gm-Gg: ATEYQzw9539Fo3uAEVOXrZu31ikYxvKquW69LV6mgNuEOjYcGGGpX3fowyT1eNkedwB
	z4C91yCRs6YtrHI9wlnovjxMHZbav7wT5aGZpNyy9EHZAPqaHbJ4iavNPt11WgfA0siuYY5YIe0
	o4P3e+eQWOE9vzFVVgpKfMh1ljHHVqTUXRS+smQXow0UjwRpaUfiKRYSlfNEbxotAJYh4xJyssH
	eL58FG0hatlJ9yAkW00t6ZyRNRzth2ODfPQ2kqqYphOuN/KxMX0aS9LDDUyePpU1l1fwuygEWFS
	sBDAzoA=
X-Received: by 2002:a17:903:19e5:b0:2b0:445a:8c7b with SMTP id
 d9443c01a7336-2b0445a8fcemr11849235ad.15.1773473070880; Sat, 14 Mar 2026
 00:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313171659.1225180-1-jhj140711@gmail.com> <abT5tabfYV9a9RF_@codewreck.org>
In-Reply-To: <abT5tabfYV9a9RF_@codewreck.org>
From: Hyungjung Joo <jhj140711@gmail.com>
Date: Sat, 14 Mar 2026 16:24:19 +0900
X-Gm-Features: AaiRm524CjQgXxwQSi91n87psT0kd7Ixm0ZGTwgZZypsCLtk7Hh1FbeoE-z-Zz8
Message-ID: <CAP_j_b9i2n+ZUriWceZJgAKz_MeGMFkRiOz7yCYE4as4T6auVQ@mail.gmail.com>
Subject: Re: [PATCH] net: 9p: usbg: clear stale client pointer on close
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: ericvh@kernel.org, lucho@ionkov.net, linux_oss@crudebyte.com, 
	m.grzeschik@pengutronix.de, gregkh@linuxfoundation.org, v9fs@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34785-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhj140711@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codewreck.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BBB0228BEE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks for the careful review.

> Just to make sure the problem is the usb9pfs struct being freed, not the
> p9_client itself which is still alive after the usb device is gone
> (until umount)?

The issue I am addressing is the stale use of the usb9pfs->client
association after the transport has been closed. I am not relying on
early free of struct f_usb9pfs for this bug.

The lifetime mismatch here is that struct f_usb9pfs belongs to the
gadget function and can be reused across mount sessions, while
struct p9_client is per-mount. On the close path, p9_usbg_close() did
not detach usb9pfs->client, so late TX/RX completions could still
follow that pointer after close, including into a later remount that
rebinds it.

> I'm surprised free_func isn't called after unbind, which should stop the
> queues (through disable_usb9pfs)?
> or are the ep being disabled not enough to ensure the callbacks are not
> in use? (e.g. disabling prevents further calls, but doesn't wait for
> currently running/queued requests?)

My understanding is that the unbind/free_func path is different from the
close path at issue here. This patch is not trying to change or rely on
gadget teardown ordering; it addresses the close-side race where
usb9pfs->client remained attached and the completion paths still
dereferenced it.

That is why the patch:
- clears usb9pfs->client under usb9pfs->lock on close,
- detaches any pending TX request from in_req->context, and
- makes TX/RX completions bail out once the transport has been detached.

So the intent is to prevent late completions from using a stale or
rebound client association after close, rather than to claim an early
free of the gadget object itself.

Thanks,

2026=EB=85=84 3=EC=9B=94 14=EC=9D=BC (=ED=86=A0) PM 3:01, Dominique Martine=
t <asmadeus@codewreck.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hyungjung Joo wrote on Sat, Mar 14, 2026 at 02:16:59AM +0900:
> > p9_usbg_close() tears down the client transport, but usb9pfs keeps
> > using usb9pfs->client from asynchronous TX and RX completion handlers.
> > A late completion can therefore dereference a client that has already
> > been freed during mount teardown.
> >
> > Clear usb9pfs->client under usb9pfs->lock when closing the transport,
> > detach any pending TX request from in_req->context, and make the TX/RX
> > completion handlers bail out once the transport has been detached. This
> > keeps late completions from touching a freed or rebound p9_client.
>
> Just to make sure the problem is the usb9pfs struct being freed, not the
> p9_client itself which is still alive after the usb device is gone
> (until umount)?
>
> I'm surprised free_func isn't called after unbind, which should stop the
> queues (through disable_usb9pfs)?
> or are the ep being disabled not enough to ensure the callbacks are not
> in use? (e.g. disabling prevents further calls, but doesn't wait for
> currently running/queued requests?)
>
>
> (Also, thanks Michael for looking -- I'll let you do a first review
> before looking deeper)
> --
> Dominique

