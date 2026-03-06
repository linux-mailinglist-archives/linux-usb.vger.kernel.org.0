Return-Path: <linux-usb+bounces-34148-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHoLLcyuqmmLVQEAu9opvQ
	(envelope-from <linux-usb+bounces-34148-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 11:39:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2306721EF32
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 11:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 005F0306A90A
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 10:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0ED3363C66;
	Fri,  6 Mar 2026 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUBitoIt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2ED346E57
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793391; cv=pass; b=Qxb1SufpzPTuKwizjhpNJDW0bgtOA2ZlTLSNm1wXPygiDBXv7YpmtS0Gv5OtcDe8jW/keKgGCpM3ok1epl9wf04pJcuqQ7zU7JxW9i5J+FDZyopldGDjnwdArwG4hUrZimaD08dAX5ttpMRWSOth1DbA/AQHjrM9TvmpA9yhqos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793391; c=relaxed/simple;
	bh=kCNnyPYz0x5ZxiJGu7JoBMFKnK80zKHT9EDH8sToI8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYWIpAcGfc2tXWBT3eWdYhzHKwCFKJnFqVRMcVoihktXpcHQEud2yjuckF1FgB1rqxnJAlFjd8DrmMQWGSUFGCnKwIRJwa1Ys6ZwvL9cPPahubhjNM+GSehFq0sgM6X8lAXuCoZd1ZzeCa2EbCuLCPgp4Cyb/95FKJhLnIRCjHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUBitoIt; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-662f5c5507cso7319114eaf.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Mar 2026 02:36:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772793389; cv=none;
        d=google.com; s=arc-20240605;
        b=brkGEo5dkS1v3pTblf2aG5R2d6a94gBrTsya1TLM1Fyz7qU26khiNYF80ES0+rpd7c
         P/91CiH/hj8sPr7It+a6gF7SxnQTTc1wyZR4GsEsDKWfyHrTqoNH/MbXKOw5Y0VSvLmt
         rVyapmyRP+pjzRjBkNLWjqXTqkyBmRxSB7QAEChowzq5Qsv45z9hI7JD9QYgBkdg7vsv
         4NlltWiOw4cXLc8tFTjAsx6bLBeqOojc+Ng82SJAgXqnu4lVgAyuAG40ZQoPDReTSIQM
         o4i6+adbJC0E26IAuYujISUyRQ3AA3hqgU5gaj9QRpKnXMGwK+XjUNyXTZDpo6vnen6r
         37Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kCNnyPYz0x5ZxiJGu7JoBMFKnK80zKHT9EDH8sToI8A=;
        fh=q7ic2bH3vg0yvQLnLFbiRDNKWcAr9xKcQIvYDMVf7PM=;
        b=AvrtgmEV/z9crF3YA+F/N8XOInAopcA27T4Bu7bdHaKEnSnqaxDb062gka8gdTxBRh
         69czEponh2bGm3bz6yv/WjUgpM/XTSXZub1iEfRMURnFrMvx8LVGz2/NjHPXYTNdpr7G
         3ghfv0GTCi08WTIJNytKjmW33StKlqP+zp1gIhOvNIO/tteh/1t8ycIN3tBMn2WWAHyR
         oe5WB4SBUYVNmvpYk3NI2d02By1/x9aaNMEf0uvwsXO+baUJXzsTWlzOBifPSbdNXo9y
         uB2h0feLRmyz6Yd2QeuwzCi4iV4IIWnF/ZBMpD/nrXvngAiRMJoJkEDODxeJpjLzISI0
         IOAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772793389; x=1773398189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCNnyPYz0x5ZxiJGu7JoBMFKnK80zKHT9EDH8sToI8A=;
        b=MUBitoIthtgvNCCqNFD/IerIGlp0kpGrckfkZTSNtxdslKNOHX9rUzWOcmr5Sf616c
         SUPMcfVxgceii1PyysHeVun1fAHhmp/ugr7AUMUPbCa66Y4s2QAxBWjKQgkYxwSRC0wc
         6SblPN3FRTUB4M0HwThftU8OE/yNXNyWEkTm/+6Ic5JMUq5jakAwWBlp6Bdkz7WGrW3D
         X8cykYKxS7dpfp3y49WJnodvDVcdq5jSL22QS/mFVuv5rDctYlmNFv/M1VCFAdUk8Mut
         rDZWrq3wVtkNJ6lsY+qM7fRhoZ59z1prwpVRK22MNl4EnKS01mlQQD/SPHbhukbzP4qe
         iyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793389; x=1773398189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kCNnyPYz0x5ZxiJGu7JoBMFKnK80zKHT9EDH8sToI8A=;
        b=uopMW2/md6qjkCoxXExvynpQUlIXVKLXDJDby6bLjSRSsQw1eW3H4iL1ho26ZmD4sm
         p7ai7XppNaCfd8LW/JqrugxEAWqv/43GBQU5/TeqF6v0cFJ0x1ts1b9oPIZkEjGYDrwD
         a/SobAnRqnk1ufWPQkKPEsuygOcdYIXmwBn+wsom81WanjYzNLMT1ldq7DiDm86NFmd6
         w275PDGqCcBcJQKn9btLcexV4uPoSltUbSTTSgFfgBwGiavMFRrQ/X1rnCA9XGWe+MIO
         VLlptjbpfxMOL+9VMJnzxS2XdqNEbxr60HnaYkE8gGMHOjx3pVNiKxonj0hQKzDZat0z
         /LNw==
X-Forwarded-Encrypted: i=1; AJvYcCVpXsYBPSG3fta0GtUozMFhIefVrG61tyWFlmhziqutwnG2BlnMSmXLDklH4F8FNCwRAUIIwKwIJ+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAoYBrol0v0F8DMsaZFnbBjIRoJ3r89BNEJJsdUO9HXQvJZDFs
	9rmS51Wp1IHkqxMs+DWXCb0FNSy/hB/9Hd1YSrXFuWs7ve3TXsCqCGXQrL4kQ0dFun1EnyrY8dj
	VSWgrGLycA4FzUB2/aFek/MR/bMz3pSA=
X-Gm-Gg: ATEYQzy0Pi82V1bkG3JjfvB9FZYlVxb8nyMljw2yPrhW6kJyPa55oqm4DqgXl+VuOmY
	9e9dzJ1gMKnR7O9TliiTH0yhayOGLL+6Z9fQDgM64qcSDBUTR9zTkNzM4sfvVzZe2miwpfkZzgw
	q+a9orDVgehM7RoQcDyjeSBWjjIvyezhETfdxY7J6tH1rSobXNZEe5TjGbajGIcSi5CkFfWNi5e
	I1mC3gyhl2Gi4q2HgOX9o7JDCqHmEtf6Y6fd0jRU7GfBFdRR1HTUfdjc0cSfKpTNrYqwpuORoWI
	Tx3wGOpICCLZB+Q6lpIIXCSfQYbevqsAqir39Dej0J5pvbjwvmrH0SheCvA3haYm25SLJfdn+jM
	qjvTmdTH65Q==
X-Received: by 2002:a05:6820:2017:b0:663:b2a:6127 with SMTP id
 006d021491bc7-67b9bc66383mr1171010eaf.11.1772793389080; Fri, 06 Mar 2026
 02:36:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALbr=LbrUZn_cfp7CfR-7Z5wDTHF96qeuM=3fO2m-q4cDrnC4A@mail.gmail.com>
 <f8c304be-c061-4656-b7ba-83150c2b8746@suse.com> <CALbr=Lb6Vir4+O-=8-iL7M8=Gqgm=VUp6s+XGVC75QixFaSmOA@mail.gmail.com>
 <678e1fc6-356d-426a-aec0-f0bf46c7d3af@suse.com> <CALbr=LZVqqYmV_1qZvh2-5pizrkDE=kqUW_Yb6GWPu65gVFnLg@mail.gmail.com>
 <6c70210c-e437-420e-a1ee-fab44622aea3@suse.com>
In-Reply-To: <6c70210c-e437-420e-a1ee-fab44622aea3@suse.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Fri, 6 Mar 2026 18:36:17 +0800
X-Gm-Features: AaiRm50GXyO_GHbbgqKumVSxSIqpjXBJN91PmR1uUvDp_Fwjn28eAcvjrBfU6oo
Message-ID: <CALbr=LZ0pY9gyVNWz9GdQbp2fHJTyGjp5Tz69smnWnzQoQx5FA@mail.gmail.com>
Subject: Re: [BUG] usb: cdc-wdm: Missing barriers in ad-hoc lockless buffer
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, robert.hodaszi@digi.com, kees@kernel.org, 
	linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Jia-Ju Bai <baijiaju1990@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2306721EF32
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,digi.com,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34148-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 5:25=E2=80=AFPM Oliver Neukum <oneukum@suse.com> wro=
te:
>
>
>
> On 05.03.26 14:26, Gui-Dong Han wrote:
>
> Hi,
>
> > Based on my shallow understanding, reordering issues typically happen
> > between different memory addresses, not within the same one.
>
> Nevertheless, you've found the issue, hence I will ask you :-)
>
> Is that something we can depend on or is that just how it works
> on the architectures we are currently running on? If I go to the effort
> of checking for reordering effects, I want to do it right in all cases.

Yes, we can depend on it. Both the LKMM [1] and the documentation for
ARM [2] (the most widespread weak memory architecture) explicitly
require cache coherence. This guarantees the historical consistency of
modifications to any single memory address across all CPUs.

If a hardware architecture were actually that weird, it wouldn't offer
any benefits to sell, and Linux wouldn't support it anyway :)

>
> > The real danger of weak memory architectures lies in accessing
> > associated variables. For instance, if we write 1 to int a and then 2
> > to int b, another CPU might observe b =3D=3D 2 before a =3D=3D 1. This =
is
> > exactly the situation I pointed out in my original report regarding
> > the lack of barriers between desc->ubuf and desc->length.
>
> Yes. Hence I was looking. The results of a completed IO can be
>
> a) data
> b) an error
> c) a buffer overflow
>
> thus there must be ordering between recording any of these results
> and changing WDM_READ, right?

Yes, that seems correct.

>
> > Honestly, lockless algorithm design is incredibly hard, which is why
> > drivers should probably just rely on well-tested libraries instead of
> > rolling their own. I am definitely no expert in this dark art, just
> > know enough to be dangerous :)
>
> I agree. The issue is that lockless IO is also error handling, not
> just the buffer.

Agreed. The lockless buffer logic is entangled with the error
handling, which complicates things further.

Thanks.

[1] https://elixir.bootlin.com/linux/v7.0-rc1/source/tools/memory-model/Doc=
umentation/explanation.txt#L660
[2] https://developer.arm.com/documentation/102336/0100/Memory-ordering

