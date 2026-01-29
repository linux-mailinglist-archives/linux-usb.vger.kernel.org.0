Return-Path: <linux-usb+bounces-32892-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOf2Deewemk79QEAu9opvQ
	(envelope-from <linux-usb+bounces-32892-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 01:59:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C159CAA6D2
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 01:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D79C3006B5D
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 00:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAF32FFF90;
	Thu, 29 Jan 2026 00:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kgiTQEnp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6E22FE593
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 00:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769648351; cv=pass; b=dKoIIYhR5J8B6SiL+fCwp9I9RMvHn1Q14WvmWjiygk6GzR2t/vdzxD3eFoGP9ZWSOfKgR+3I1YFYruzYN8K5AutFu3E8AYm6hp2IXPkvISwjAkl+jhNZrHnjnB5S9J23YDs7drF0hOLwdhZv5d4c0c4hU6tpwBKbZy91FrtPijc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769648351; c=relaxed/simple;
	bh=+L+EqsxFGbq9nKKnaprPm9Ir3tOy0vr3+xqa2zLh1T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PbprrPdIrEXE6ZYmveVQr9+z3mPaRruMPi+UTkKWy+yHcIhwbJuYebkqYKs+k9WlJ2so1MjVlspSeBQ6auzKFCJQmY6v6a36z0mr8R0rdwK0PHkhUWh1dDyDEwet3Kr0dUMxnM0NdAKWmxv0wA6Q7x0TwzkkEBJcIttumXMMYBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kgiTQEnp; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-658cc45847cso422440a12.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 16:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769648348; cv=none;
        d=google.com; s=arc-20240605;
        b=es+1co9k/QszWs7jr3Xpk5Sj48dtiTznUrdGqFX/zK39LvgI3cQJ8wnmWNpFiB+W91
         NZzijlJieu0jDg+7e2I8CAEBZICq2jemVOwL+z8ZF+wS+mnVZQcMjSe8AciKcD3imQkc
         LW/rU9ef7iX+PaoLwcoQUC3nkrR8Lkhru6LV4Lw944iFScXHL/WCKNjai5flQk+d/5yD
         U4Z7e0vZ0hRFOt3+ym6jDCRQBsA3PYCZ3zQqOuiO06XCizON5pjpOYq88dvS9bY3SCnY
         6l7a+k2efflb6Wzoy0ISuaJlC+jj2ePfRu6+pa3wkJvhRPceRzLZ2Hl+Oc515he3RthT
         vDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ho5qTXSu2PZYffnzQVL+2Xc6poCFB6UxCVa5s6rbRlA=;
        fh=cxtYmV2y6ytRuj3V2/OX2ZhzftK223eikTrWTXlAiMI=;
        b=FetfCDRu3+L4VCtHnFhaTFIvUdd90Vm9a2JmxWvlGC5MXBdqXO8tv57j7ZdF+XB2UR
         7mK+0QuquMdWXCsF8bzHMUW/zTf0GAZd/YF+bq3S3mCSDa6lsG61XCWXUT/h+4MZYiHO
         HlcAqL7sI8RbOnzwjBKCKNwaRP+tplEtUv8h2up6LVLaNTcIWsmosqNuy4y6ZZd2noeR
         Cs2ptCJB/VwwCqBYV+4SkAm2vChqfrJ3hyYUlZVplfr6xzO0DhbiuVPbAkLOqvAavc0d
         DbWRmPzYG4PBQvd0U56kqVUMBR02xYHRySbHx1pf3hybaBpfb21AKqlDv8efxTlZ/pgd
         UpYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769648348; x=1770253148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ho5qTXSu2PZYffnzQVL+2Xc6poCFB6UxCVa5s6rbRlA=;
        b=kgiTQEnpKJp/pjWzH8UIBoZE2prYNeOdPAmDcSgp2w5aKDPBJN5uF6sIQ17O5EEcaN
         ACyLVBvVNlwDDlteA0YIqufuqAY74ZjqMbYJ4tJU9NEEZn94CcJXo/9Epjd/HQczmXSw
         oQ68UlJ+ysPe1pwWStyhBRWb1KgBhwrl8ect/5mMeMeC2LbIGU2krUo3qleFHZZcB5UL
         oZIcbiABabn8ZJ0AByRhAkYpLWueJfg6OQRWhq9Hw7bnfLKCMVArAe1ksTnsKICVRJSs
         d5Dacf8qFkgg7Xd+y+e6WdzSOZLhxyO4qtDTDvpFsyFA0L760P9y01OOVPtjLx3ifnCU
         1Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769648348; x=1770253148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ho5qTXSu2PZYffnzQVL+2Xc6poCFB6UxCVa5s6rbRlA=;
        b=VGhyinLFRXbyZYTLhBabLA4CZZcpFOlkbhaX+wJ+OBgyLrJVF8hCaHBaOAKSB3XC82
         5bRZh7zSzGHO1lMyXXqzX6fHeFx5Az5ETgn+jPx59KaoG8T7PfAI66QEDtwjTfcznO8f
         42Ji24o1VEcB38rm/Dwi9MKkNuH8COlK6Rd8B9yrdk86le5vttOcSGyxT1qfFaQz7fkQ
         Pee43c19XpLxOVnWW7CvuGR1A37zbDY5L6tnMVqEbQ+0lche8GqcShLUeS462WeSwA3a
         R8yWR0aUCSjQFfTI2EShiockJD8zFiR0hVpTjkMf7WjvpxWWy9cStfeh2yVfJ/6r5r1U
         maoA==
X-Forwarded-Encrypted: i=1; AJvYcCVxwvdXWdzgNHT5I1YYFyU6bNhKKlKLeP2ugPi+IYnQqiluc4++TW7wmOcYFSHM+qX1q7zvuF++hS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOb07Jd/hsM7rrPZU+a+Lrq4ZBfKTR+Ih0c5bEKgIuC+6xazjW
	6wYudxF9m+LZP/zLnKUK18oOET7WHoxiZXwpWaZ1c3J+1KDTAV2aRCFYUkKzCZ0VaQZAZ3KTbim
	0yM+UojE8r7yeGAQXS8is5HgUPnhZ7I/WjcaZQ47+
X-Gm-Gg: AZuq6aJgNZGWjf90CcmqIToWvghpOFONTS99hgfTi6K46Gc5ozBoXjcE4NFVRRZVZK7
	GqhHWkJFK9vvUDVptnUnAX8rUL3/FlRR6oI+VSzhUW88s9spon5+Qi7efjXkKgZnN4vbYCg+Vk8
	qmfL5kTnaR6s2tfLUYiXeDiRc6+k4rin4FYM5SX6QI8eutlTC6al6LcGSerZoctmFTs48I3YBRu
	wvxXudL2G44cOcLWL9+OmE/NqGRb0s8iGufZVyxVUuM1BGAE8PPjhxDungkkqWqQI2Sfor93NWp
	2nE/vVTy4fp2Yp1muPnJX14Nb7jxIw==
X-Received: by 2002:a17:906:f585:b0:b87:d722:f824 with SMTP id
 a640c23a62f3a-b8dab3cf66amr455166566b.63.1769648348337; Wed, 28 Jan 2026
 16:59:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh> <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV>
In-Reply-To: <20260128045954.GS3183987@ZenIV>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 28 Jan 2026 16:58:57 -0800
X-Gm-Features: AZwV_Qg5mDXEWLmzjtDFHSng8MB2HQLUBKHQ6Wr860X_lRTmL3Z_ZmvOjLnN07o
Message-ID: <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, 
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com, 
	android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32892-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wusamuel@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,linux.org.uk:email]
X-Rspamd-Queue-Id: C159CAA6D2
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 8:58=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:

> Very interesting...  Does 1544775687f0 (parent of e5bf5ee26663)
> demonstrate that behaviour?

Reverting only 1544775687f0 (functionfs: need to cancel ->reset_work
in ->kill_sb()) does not fix the issue. With 6.19-rc7 as baseline, the
simplest working recipe at the moment is with 6ca67378d0e7,
c7747fafaba0, and e5bf5ee26663 reverted.

