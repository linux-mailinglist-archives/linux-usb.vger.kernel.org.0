Return-Path: <linux-usb+bounces-32849-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAuXAXhweWmIxAEAu9opvQ
	(envelope-from <linux-usb+bounces-32849-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 03:12:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B79FA9C2D5
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 03:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5ECC8301B17E
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 02:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7CC2727EE;
	Wed, 28 Jan 2026 02:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUHYdpeR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE28A280A58
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 02:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769566319; cv=pass; b=pBg0eBWjMK/U9cVE0AaYiAfg3UarG3yUUDl5o96Zd287UyapBi49f8EC3Y1lIwJRm4LKz5efRItYMpyIxPltzSFAPmVwdfvV/L03chHIGyD8ThF1HpVXaFh9miroZXTEAV0/Ga5T9S56M95JwqcPXGq7UBuScQnj3jDOb3v30m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769566319; c=relaxed/simple;
	bh=cZ8gI/vk8ySTLE077sMXqPrf0qF7EtSUOgT302c+2uA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfXuDU9Bd5+2ffZf1Gdj2dofCZodrZmkSh653Zu+HyAjrfrO34KoO8D+Vxgw1KUBJPnVrKzHQWXOWIte+RF8FLv2yEq8JjZ33rIHTVx+zU0m5oB9SWd2jiHeo8wLhpyBiVI8NAPDYHJvVmWXTQ4oVe/HptwNy5yxyASxatkcVgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUHYdpeR; arc=pass smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-88a35a00506so115502816d6.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 18:11:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769566317; cv=none;
        d=google.com; s=arc-20240605;
        b=XjqM84Zx2iIMjJlEjZPNK8xC13VjLbU87aibC20SgMcsjWOHCtrvcy3/vSTA32Yx92
         usIMILnJZx+WQRxjhd6hkv7sVUcLSbzwnhkm1ijXePF8PnMMSGMcvnUOaZHy1FxKK+1Y
         1QUodQ9KkTtUz9D78cb2AgpRDB3/GgM9HXYJf/aO0rTwFv5U2PlubfvS6tmejCjuk0LZ
         6lsHzoog1VR81F6B09lsz1Fh6V1EOfoFSFw70Gh7VO0rpjzQoTgs5VQebXSOevPMjC6P
         04dCvezYjT2Cz9Exm1JBAf+xV1wAi9H9Pxa93sKelDN5CvE6Ss7B3tFOGtrKPC48D/PR
         ckmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cZ8gI/vk8ySTLE077sMXqPrf0qF7EtSUOgT302c+2uA=;
        fh=offlDYrvslHjkLGggk7O+k8XJQqZnD7x3mSnFpE9+nU=;
        b=MQ/yCD7HyWn6ewo7gh1XZ3ZZoUS2yrp0qSBgjiIV0Q4jo3ousUaz+Brdqml1UF6Tva
         IuxWigy9sc8rlVs53dWwbvPqWsfIbNEBEQP0FdO1+w7idNI3u0iSZClzms/cb0ytbngr
         a7tOKNAj3mls324qTjclpq4D7Sq2NfRlqV+KHRQF9TrW1lHUeZ/7qsF0ZJJ5SYLB+GNZ
         ix/+t3zDjzfw19SCEBys5iJuqLlgaQB0foPZqYoQwJBrS8WEMja9dtDBxsP640/0PfQO
         4vbkney3jqYTA+ev+pqEsuPSXDIl5B+Nnr0of/Zm/CB72AebfYVNnrALIiSUg2E5il16
         eqTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769566317; x=1770171117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZ8gI/vk8ySTLE077sMXqPrf0qF7EtSUOgT302c+2uA=;
        b=kUHYdpeRkljQycEUfVM0IkobmO53GG/kKIqm9MtBCqFoqkKT+mhhJy+iBRY/V2HfMv
         qsD+w3F+F2yOL4GJgiJ2pO0fkTqOhE9H/CMZK8Bq6YJ8sgSOCtOV7TIC7JiMz6p+RIal
         r6Slxb6sTaTvMcctBIx+caTLsvui5nst6x2DVPE9dEIDfczlwkDXoncFltb2Oh9ZKpNr
         EsJwzGNfV248T1k5XkV1gmWqlfjAi7f2pJtbh4p4O+CnD5xPE+ihSGqEZ0Zl0wHvrhM7
         nnFtw4gjbVYKRMLsvGllzR5md+U4QYaqz5ugp2bqtu+ReTjixuiFpwq6RaTnP0fRo2JD
         r12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769566317; x=1770171117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cZ8gI/vk8ySTLE077sMXqPrf0qF7EtSUOgT302c+2uA=;
        b=KrvGU03LJeUCwRWFNa/9kw6pMOOS36iiDJv9g7Y+5gl+hBbMNTUeHFR9FyQHuN7MJd
         zzVsxug8V+8V47C3lZK068RXfW29MtxB4sqplXxVfMQVwT0rbqVH2mkiytybbVEMcfVR
         Esh0/mveX8H87P48ouJapgFo3clgOR+iLoM9b70aN0fuVYLsYvX5JLhMagMH4RAWnDqy
         lbLfjftJsVExA6AELcrJoUvPB+cbkmlB8FdsHxu55Czmm60fROvQ0hHlpvwi6svn69Hq
         pTZRPJjAq2x/xq01wKpeC/Y3acxCGqCIkOdnuExqgzvLHfJlEKlfQSCk9PvL/FBB5Jh2
         PeSw==
X-Forwarded-Encrypted: i=1; AJvYcCWfCNei1UNRONSvF5yQgh/b1fkLIzq/Mz7/wQax5cpJWCZV0vTYDNQm+Um5vuTijOotJJXWF8xzxHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuEehSQkiDSnyjPOyfLQhy/1JVp3uxeqeUvCFwVzn934crUuXu
	frdoy8qLI7hlvQQiO/BO/Bfh2i5DfcjNv2GEuJ93g7V7IuLJtJPaFXoIQyZnj1sQt/F4k4T1anA
	sIzOuAHo+FzRrYUj0km2xrqhw5nrPIA0=
X-Gm-Gg: AZuq6aLR0cNzS5KlolZs0Clrql/H6TYfx0iY6Dfmb3lerBuf+QuECpB6yQ/i7fdOdle
	M/F1VF7pYovh22NKR5u+QcDBlCgURUcVN57bcWzdGd3riRJvofQPlyDmY+uaSxT1i9cSXxrhRVU
	sFXOU0vobIh4RvRf5KpttoHqgaMh8xO7sTeBeloqSxZTQN7B6GRLwVhcSkrzHm+RbNcu61G1NLG
	jWK8VV/nUTeCuz3rrrhxHX2i1k+/8QYK0foPHtUXEI5VJh16o+RZ+OoAQIDv5qyqElvG3Zb6OMi
	TaCEm/KEixYSsN+diqHNEOz4vEZ4td91N9OFZ5bxIj1QWA2HOYoYE4BQ8F+8cg==
X-Received: by 2002:a05:6214:dc4:b0:894:6f12:af5c with SMTP id
 6a1803df08f44-894cc808849mr58895776d6.24.1769566316752; Tue, 27 Jan 2026
 18:11:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126070618.53758-1-enelsonmoore@gmail.com> <20260127180109.357a45f7@kernel.org>
In-Reply-To: <20260127180109.357a45f7@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 27 Jan 2026 18:11:45 -0800
X-Gm-Features: AZwV_QgjZTW_BbRB2T_UU5KIX0NToBkw5Wtci67vMTErK3csBgCoWjuX5zhMF94
Message-ID: <CADkSEUj9Rs8LaJ6NjqPE3M2+2b_Yt9vif4Lr+hFObaykcdNF=w@mail.gmail.com>
Subject: Re: [PATCH net-next] net: usb: int51x1: remove unused includes
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32849-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B79FA9C2D5
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 6:01=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> $ git grep 'struct usb_driver {'
> include/linux/usb.h:struct usb_driver {
Good point. I'll try to avoid introducing indirect header dependencies
in the future.

> Please do not send v2 of this one.
Understandable. This kind of trivial cleanup isn't really necessary
anyway; I just happened to notice the unused includes.

Ethan

