Return-Path: <linux-usb+bounces-38227-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOnTKldAHWq8XgkAu9opvQ
	(envelope-from <linux-usb+bounces-38227-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 10:18:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C95361B5AD
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 10:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76B1E3008C12
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 08:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8753389459;
	Mon,  1 Jun 2026 08:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Hx7t85Zf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B1F388E7A
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780301906; cv=pass; b=RqenOgfvFNjWVOtJnVBDXaLYYmy5gn5abrMbYDcGf+KE96gW4C85qu5YRUGWCgRivlTzA2dws+dARNHKIcExK6tHSu+2qPrgGUZTcObkeH5clz3WJAwgbUzJI405GoL25FOVW9hkDm9YExcIsclKqk1cnZpDy9Dq0qtKmOwX/qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780301906; c=relaxed/simple;
	bh=fpKAN5tEkGHrW1+w44SJcrj9WcnXCupRryJHFLX0pkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvw+llmG2TLum7V2crhl0HblXH6LIZ9t0jyE8EhaYAO/YKAmaw03Qv43EiNW0QTrG6TwJMIQjc81s5g9/cCgRU0z6YmONXkGiQLWNPQ7PVcjQYJ3mgKL/Sn+CKDucgx3dosFKV1GGUz/IqtBEE4k54JbKk8Xy6/t7n+DUIRK3MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Hx7t85Zf; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A3BF83F281
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1780301901;
	bh=K1waAyIWMRtVgvUn0Gma9v+f4LUQwW7uBuEnb74a6m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Hx7t85ZfyeYMZnkUoFzPGnzAaUWrz4gdvsLRb2TySnS4oPvBBLdjtGdOt8fm4YLjy
	 o1vYCOYTgawuvlz7ADIhTKIG/Fw3hDIQd05tKAe2dq2K/O9+C21hnj/Ob4nlO8Xjse
	 SZOekMINvhMhlCPIDQPw4vkcnhkGRpmmacLRuf/RLyeRS8I9O3rlU+RTkzof9dmr3n
	 2I+MEDwfZRKaAB95RBC+oC3ZMtX7TV+sTjr1EsgtdcLKjKpZAAsiDfuQRnkXDylh5O
	 cFJHB4asbroNqn1yArndCNtT8QewzbWBcX9naeV+4Xq7ffrHDaXLK4hTYX7R90i8ii
	 6C54JhC3YL7xlaNoCrSSoaVXWgvs6Ju0KZQjRh9hXGzelJdVzcXgnQ7V8piztZwaZD
	 ypBPcANr1C0bg++A1fKuD6J3+Ud/p3a03hfzIFR0CvSE/TbmcM5rj1Bo8h6XgwGAKc
	 dVg1iuUXIn2qQA/BALAnW4vFnTvuGCwgrGGBQN4Is8oz45lLuzy1xg3YvDtK+Z5dQD
	 PL2JcmZR+GUHRW84S5/u+ndsnLvnMR+79lzdQ2xcpS6c1Ob6QR/7vcwyd97l3Nhsz7
	 FPgloA4I2aKD2DAG9hWjsjFcLbCDjYeWkDuv9owYbINup30eRwe43D1Rw6gvWkY3na
	 dz4eJfhYFXQ1dwDkCeJULNXg=
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43d063a51feso146451fac.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 01:18:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780301900; cv=none;
        d=google.com; s=arc-20240605;
        b=dxkOiiS5pgmE4ulIRZiqzjvbbZgDHFLblO0ay4qBoCsqEwATQXUdqnsn4E2JvGvhdE
         UviQIVZZNHWkmD2xAO2X9WLqo2j2ZFQ0I7mcURI4zMa8ATLeIRDYl2Aj5FBy9suMjgcR
         hJkz2sat1tthbY/E5ku3VArKQrYFO3btCEsxZq3QqhRvK2rJ8KondMaxkAgwmmwor2lg
         RJASec0Z3pI+DpREIGtNKPJnuimfu/M9BiMxLY3iGsUfXBGkWo8leXrZGuBez40Nu7eW
         J6tdwpQHKqGwnrs8kxShZEz1G7e9pj8SkFfqhY863hR+c4YvcazWMiqA9k4qBY/ZQoAE
         BQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=K1waAyIWMRtVgvUn0Gma9v+f4LUQwW7uBuEnb74a6m0=;
        fh=xBGvcC4Mmo+y6SEv/9ZBN1NLdOIjRd2Yb7b1HKCBuhA=;
        b=QpQoGOd7BlUsRX2nG46mw0BJzZ9dqJ8D4TKpQwzerugDUwhoSOMDzO6ycnhnjavbVm
         9BJIRw9FYLcbt4KQ+oKvP7ARpa0XQXCZEVPu+nkm8jIYuNllkQOJ+DhVUmDHlXiLB9eE
         0cA8sa10mY99IPF8SvykkBwHoPxkq2KVjdzpgHVNphvSAh91YD1DKI2nB9VjvoIEf+cL
         YschzuFbZUPYL7/KRbHiQm+wExq+LPTphPoSCR4jVPtg81R7dsGQuia04yWLpSISoNTr
         B3bU+YMYyoq8zhlRohcFtIOoO3zASCed8KZSt7b/TuZTFuvPHuXPO8TbukhGJNSaSReE
         9hhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780301900; x=1780906700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K1waAyIWMRtVgvUn0Gma9v+f4LUQwW7uBuEnb74a6m0=;
        b=XCDL42Q25mFUzNaxotcsKyesjm5HAzJ/zz4MdEjnaMUzvK72L8KZJ5gPLRM6vuivAA
         BYpijdGo9wvx6+X4oVHvL1wGKG+kRicO+ZJ8yxk0phZHM6fmEFOmgZgq7Nsuv1MVDlQX
         LOQI3MIwFPhiKyOSz1UjHy6Vz8JYzDZuhxbem4lAVYjJYtz5MFRP6CGm4dumL0338Aab
         KV/zGUGLwtGtHhumaxT78Nh4oSlIhqnHkgUfO4yTjV/emSdG9NzCciXcoYvJ4TlE2i8v
         GazExtGClPp9341Z+2Fixlpsv8x92z67EsR1mDMtRtvoe/TpexNrcTGV/unj3rlZkmCC
         u+lw==
X-Forwarded-Encrypted: i=1; AFNElJ8rUsfYMdOa6OMhWjm8q3K8hfXWVX0zeuW0zkAtbIAM6y87RYhfFOse1BgXylVKL/im6lG2utmYF/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFs8XUoIeZXmapRJNQ9STwgK5akJ+J2Zo9/8RD8fp9KaeY1vmc
	GfmNr4tH2NtBui3QYEeUc8vQ0sOr46JY2xwU6A/v4EVijxPvb0yUmRDQPkA4/aPRKflOKtZ/pYM
	bhPCbp/k6M/7LMCNrG8hE3arvG5U7lqxqzz3xva5v+CSUP+L2NjI/rSBgZmZrJHreRU5N9a+HSW
	5YKfcJTY0bMZloMbnL3mDDL9wq2ZmQYlrUjBzmZAJL7fm2JrvaJ/qh
X-Gm-Gg: Acq92OGkw0oBfAzUu/GzcP4PBrCpdgoNrCOAUSxsBQNrE3K+xP7UkOcJyLlZ5W0Dhm8
	CPnbnHXC1+w4qdJZV0n1yPeuRLlYKL7XnUKZEs0P+zt5vLFfH+MXnT1NGKeYmaQuq5qs68Y35Y+
	PQwAW/tkDrpRQdcDL5UaDvb2etwoHSK4XY4Wv5xrSShDlhwJrvaO1hG+O+AUkkQocMBY4/aAUWS
	p6PS2IXbSZnG5Ig8YbwvaYTVAE+EXQgfpBvs5GyXC6jM75/tp0yFwvfhZ7k1xhB
X-Received: by 2002:a05:6808:3505:b0:485:4c50:8316 with SMTP id 5614622812f47-485fb40b25dmr2951708b6e.5.1780301900547;
        Mon, 01 Jun 2026 01:18:20 -0700 (PDT)
X-Received: by 2002:a05:6808:3505:b0:485:4c50:8316 with SMTP id
 5614622812f47-485fb40b25dmr2951701b6e.5.1780301900133; Mon, 01 Jun 2026
 01:18:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527064121.173952-1-an.wu@canonical.com> <20260527064121.173952-2-an.wu@canonical.com>
 <20260527071445.GB3102@black.igk.intel.com> <CAO4Mv0Y-zAZKCQTvOAb+AS-iMh1Fa97f+BqaLTdDocBWm-_B7w@mail.gmail.com>
 <20260528102934.GH3102@black.igk.intel.com> <CAO4Mv0aUjtc66AkPmsRyEFTiV5etNNXoBqocMyKpOfS7uKTVKQ@mail.gmail.com>
 <CAO4Mv0ZbazqxzM9Sjd9=7YzMzZs6w54SLkhq+NtragOau5-eAA@mail.gmail.com> <20260601070439.GO3102@black.igk.intel.com>
In-Reply-To: <20260601070439.GO3102@black.igk.intel.com>
From: An Wu <an.wu@canonical.com>
Date: Mon, 1 Jun 2026 16:18:09 +0800
X-Gm-Features: AVHnY4LpOXVxd9120A6bdclt7ekWkU5fHwMMjIq6s83UrqZWWens8x1qJxMhBc8
Message-ID: <CAO4Mv0bnSd8Vm1raj5bnUqywkuKNjtM-W6zPr0dzGJDKwi0ZNQ@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Defer DP tunnel teardown until display
 driver is ready
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, YehezkelShB@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38227-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[an.wu@canonical.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[canonical.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,canonical.com:dkim]
X-Rspamd-Queue-Id: 4C95361B5AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mika
    We tried putting graphic modules into initramfs and the size
increased from 56 MB to over 200 MB. We will discuss with the team the
possibility of fixing this in userspace and follow up once we have a
clearer picture.
Really appreciate your time and patience.

BR
    An

On Mon, Jun 1, 2026 at 3:04=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, Jun 01, 2026 at 02:50:21PM +0800, An Wu wrote:
> > Hi Mika
> >
> > Another approach I considered is using register_module_notifier() to
> > detect when a display driver module is loaded, then retrigger the DP
> > tunnel setup. However, since struct module does not carry any device
> > class or subsystem metadata, there is no generic way to identify
> > whether a loaded module is a display driver. We would need to maintain
> > a hardcoded list of known GPU module names (i915, xe, amdgpu, etc.),
> > which is fragile and not scalable.
>
> Indeed. Perhaps not to try to solve this in the kernel and instead do thi=
s
> in userspace?
>
> Have you actually measured how much initramfs size "increases" if you do
> include the relevant graphics drivers and their dependencies?

