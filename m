Return-Path: <linux-usb+bounces-35085-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHOJJc01u2mTgwIAu9opvQ
	(envelope-from <linux-usb+bounces-35085-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 00:31:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA302C3D92
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 00:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35BE3310AE6D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1054E315D51;
	Wed, 18 Mar 2026 23:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cTXbWiyi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300ED32C317
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 23:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773876607; cv=pass; b=QVCRHIlR4u2VEDRa8yGrVB6yscf0Gzy38fVynvX03VuDpOC7ScxHrL/SBkGtYXqEwkbsW+I+o3M/1n7tTiEft6ACSZbhPP1c8vb/Ey0D5Lm+bfuKQmnTd0+DKSc0jop3KcrwWm9KtvF6zDin+hODQqx65r6zk7jou1oTYRK/vyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773876607; c=relaxed/simple;
	bh=Ikbgl4NYJZhrpipjl4UKxG9763awCdXVVRI9/qm5ENs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sLObqf53XZSQeT/0cXSZ4L06arFkyCtexYVDhWwpXG6p68u8bZeTefNU6Oooj3Jfd6VonaqszItPzaC1cBCC1REFnSTovnuDI/T4VfvsGHRmrP9HSjpgN2/ObXTppgF9/dlevnTvvZ+Q5kZi3/pBSaGvwN9Kyher2sf1E56Ob+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cTXbWiyi; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-509062d829dso124541cf.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 16:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773876605; cv=none;
        d=google.com; s=arc-20240605;
        b=ItSqX2KSAa8h9jaTijDsViBPsHSypF5ekU2yzMCeV58o2OuSzgNva328SOe6pPXPi4
         oHBbReETMr8Kz9SHnNKIQ92xVWbMI+Ko7MMWRSznw30NpBA71mjMnniQSlKPsQPbrty0
         57WApHYkIWmJ4+8cg0KtsWLbn8R+dQ9cmRFxfWrew3okb82++sZZgKp3CRefUrzaQ5cA
         03k86lPemtx46se68Q1KnS1B4Cql3uUBhztOjtiLWe+Eawljdm2TuYWuIGOZN8RosSh+
         IBY5BjnaWtPi1QfemJZhQ3nAS1ESOTN9U/Bj4M9kC3labIJ8UpelEu6czf5uM9u4M3Fa
         8B8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n4VIi7EhCf6D8/1yLa+X0XyxMVZpW5bilaY68sBFKcU=;
        fh=HB3ZNYsa/tUgeIKYSVKwh6KV9N7XvdkbVXjUeiMBDRY=;
        b=Rk56LbtQiqiQpeprsnqder5ymmKuuY058jB7DUNmS4PA5nHg5TuABjTzkXLx9YaxfS
         RR3D6eqi8nAOCFG1s2fZXocgPzdVkCrKc+8XKp4wC0AAJtdcuBSstb1oqjUvjTiyRLYW
         7q6vb7aAFXsF4+9E78a0SBXDmroZ9NlwRZ+ZsPl3BVxk/CwVPNYDM5agc4fyN6T1mj5m
         ZZPiGiIkXuS+v8XdzihEgJC46Lva46JFbKQX4fFvdQ2/nkIfwNhYB/9h7eM5B1bqCVXS
         2Daz/zS0zl1o044npdboDUvPSjbV1GNCWEHNk/PGU5lYq4aV5z4S+cdLKFHaz5/tNbUc
         +I6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773876605; x=1774481405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4VIi7EhCf6D8/1yLa+X0XyxMVZpW5bilaY68sBFKcU=;
        b=cTXbWiyijSJ0t3T95crRcKf1/YVSOclwuZaMoNJ/I4gAg6EGrQ30XihUiavHpYdXYh
         UohCN55CxiIfmX2+VfI5SOv7lcX47RZcHn8uf13vn10GJhpbuTGBVPv+E9s2NAYipmO8
         i2Mnw/81A08kctLkL/IMpata2ApOjlzBzNKkn2ocDHRClky2eYj/fB2wR3vRk0XJgDGO
         fQiEE2RGLlf0CcI+5QI+wlrrPO4t/qoAUBnaZih2aIt68tMIWx//JmB2wKwTiyPnMsQa
         ezAmNZQsaj/0jk9+/0nLL5UonCPuUFLnWK9GPAERnmDoYhWu9eNIpQ2HJFwUXe4A+uM0
         ee1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773876605; x=1774481405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n4VIi7EhCf6D8/1yLa+X0XyxMVZpW5bilaY68sBFKcU=;
        b=KLuRhhEsVkc+Wnrco0X8dWkGD20QU8G6tRiAIDrSr9mEDbSwN4xxMf67PruA2jP1nY
         OtNjAYTUFa7MA/9Fzh5aiuxYYvMvToqFOq7HLBETbUxGnmoHVIwdU7F8rD3dN5WtH7ay
         jcIyktlrdjBD07U5C/w4Y5Zk8AU5wBE0zxSiclsIfIgtnf7qeHnE50O8GNPRevrSQVDx
         ntiEqFuObTfe69So6iqP9Lc9nE1kbSbOi9PEomDMGw9KwsDjeVOrg1Sh0o5qlzBMahkb
         THh6qPdK9ULHC794Gekjg+CVvqr+oxOtgN+0FSxc4DEk9ReBf4XLl5swyGD7OBsoQPwD
         psNg==
X-Forwarded-Encrypted: i=1; AJvYcCUCko6x66rBxd1nJ5Z6w8dBGRvR8l8GgD/bOveH7k+BalwEph8ViiUrnucUJoAiabhiQRUsTDEkbwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHH8zFDrHEE/iYQp/EtRnfbuTVzLOeAsZ764Tgx+fROOCLz5+1
	O5FjU+nK7u5uBM5hMcyKdL6fiWt+hBNuWYKrlVwB5IPioWVkNA9tluOYwdttMTJnKq5fgtUwwbX
	4PkBfqbLDTGRBw4OZp/kPt2y11rcHeNMvCLDUB0qt
X-Gm-Gg: ATEYQzzzLifL8ltS+trNagwp64K/BAKT+LRBLo0gOuWnfMpm2eGBhLG+aR5Rw3eA5Rj
	Epwyx8khtwJEbMYUWdJsfNYLxT5J9VOkrMlDbWRuVDVItp+XoHBhTmqoW1Dgk0u7+CoZPhWDDDy
	t5sKwsC21xNFiRSubCMtOGQlys45/F3Cr/oRdISqD1i4LLQ1q+GS9k0h5b1n8o7UE+hclfbkotp
	JTRWvGdewu4moOWI57Kvl0mnqdANaSjnJcu+6hatzhBJR+ouIE8MWUC5eeDzrNxdq8YNYq3V53s
	LkMJgw==
X-Received: by 2002:ac8:7c55:0:b0:507:35b2:6b9 with SMTP id
 d75a77b69052e-50b27456fe4mr3082721cf.7.1773876604768; Wed, 18 Mar 2026
 16:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309022205.28136-1-guanyulin@google.com> <20260309022205.28136-3-guanyulin@google.com>
 <2026031115-unboxed-spouse-1dcd@gregkh> <CAOuDEK3k6nyiHxhcL1kv=QNQaZMF6ms=sLerSZ5JBc5WBd7nAw@mail.gmail.com>
 <CAOuDEK2pyt4nKWxXXwtzgRuP6u9kvi_Joe8Ec8qDDHVzSue1rg@mail.gmail.com> <2026031815-heroism-devotedly-e730@gregkh>
In-Reply-To: <2026031815-heroism-devotedly-e730@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 18 Mar 2026 19:29:00 -0400
X-Gm-Features: AaiRm52YRSd54syzn1f4cmqFSKVxw7wlvtVlZkoP-XOuSr5tL6CUvSpQpQh1gbY
Message-ID: <CAOuDEK1YjqPeiPde3Sn34RSsMu9i+KYF7BJGca=n8j_f4RM55g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ALSA: usb: qcom: manage offload device usage
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com, 
	quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	christophe.jaillet@wanadoo.fr, xiaopei01@kylinos.cn, 
	wesley.cheng@oss.qualcomm.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35085-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,perex.cz,suse.com,quicinc.com,kernel.org,arndb.de,wanadoo.fr,kylinos.cn,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanyulin@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.971];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Queue-Id: EDA302C3D92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:59=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Tue, Mar 17, 2026 at 04:45:00PM -0400, Guan-Yu Lin wrote:
> >
> > Hi Greg,
> >
> > Thank you for the feedback. I understand the concern regarding locking
> > complexity and the reviewer burden. The usb_offload_get/put functions
> > track sideband activity that runtime PM cannot reflect. This is
> > necessary to prevent the USB stack from suspending the device while a
> > sideband stream is active. Ensuring atomicity requires orchestrating
> > three asynchronous subsystems: System PM, Runtime PM, and USB Core.
> >
> > To address the concerns effectively in the next iteration, I would
> > appreciate clarification on your primary concern:
> > 1. Preference for fine-grained locking:
> > Using USB device lock ensures atomicity across these subsystems, which
> > is inherently a device-wide requirement. A fine-grained approach risks
> > races during concurrent software events, such as a reset occurring
> > during a runtime suspend transition.
> > 2. Preference for improved transparency:
> > If the coarse lock is acceptable but the implementation is too opaque,
> > I will refactor the next version to be more explicit. I plan to
> > include device_lock_assert() calls, __must_hold() macros, and add a
> > "Locking Hierarchy" comment block documenting the vendor-mutex and
> > USB-core lock interactions.
>
> At the very least, this is going to have to be required so that we can
> catch any future changes and ensure that changes do not create locking
> inversions and the like.  I guess we are stuck with this for now, due to
> this being "outside" of the normal runtime PM, which still feels wrong
> to me as runtime PM _should_ be able to handle this (if not, why is this
> case somehow unique from all other hardware types?)
>

The runtime pm doesn't apply here because when a sideband instance
accesses the controller, the main system could suspend. The runtime pm
only reflects whether the "main system" is using the controller,
whereas a sideband instance might still be using the controller when
the main system has suspended. Runtime pm couldn't reflect the
sideband's status. If runtime pm reflects sidebands activity on the
controller, it will mark the controller as active, which prevents the
entire "main system" from suspending. Does that sound right to you, or
is there anything I can clarify?

> > To clarify the "broken hardware" point: this isn't a hardware bug.
>
> It was described as triggering when a shock happened to the system to
> cause the system to reset in places, which is a hardware issue :)
>
> > These races are triggered by standard software events, such as a reset
> > occurring while a sideband stream is active. Please let me know which
> > direction you think is more appropriate for the kernel, and I will
> > refactor the next version accordingly.
>
> And how exactly can a "reset while active" happen as just a normal
> software driven event?
>
> thanks,
>
> greg k-h

I'm not sure what the OPPO team has encountered. In our experiments,
we saw the following call stack:
[  721.889147][  T228]  qc_usb_audio_offload_disconnect
[  721.889284][  T228]  usb_audio_disconnect+0x7c/0x268
[  721.889302][  T228]  usb_unbind_interface+0xc4/0x2f8
[  721.889313][  T228]  device_release_driver_internal+0x1c4/0x2bc
[  721.889333][  T228]  device_release_driver+0x18/0x28
[  721.889347][  T228]  usb_forced_unbind_intf+0x60/0x80
[  721.889358][  T228]  usb_reset_device+0xbc/0x23c
[  721.889375][  T228]  __usb_queue_reset_device+0x3c/0x64
[  721.889386][  T228]  process_scheduled_works+0x1b8/0x8ec
[  721.889405][  T228]  worker_thread+0x1b0/0x470
[  721.889418][  T228]  kthread+0x11c/0x158
[  721.889429][  T228]  ret_from_fork+0x10/0x20

In addition, if a process interacts with the kernel using
`usbdev_do_ioctl` and then `usbdev_do_ioctl ` calls
`usb_driver_release_interface`, we could also encounter a deadlock
issue.

Regards,
Guan-Yu

