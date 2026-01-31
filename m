Return-Path: <linux-usb+bounces-32965-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOfGDC5gfmmPXwIAu9opvQ
	(envelope-from <linux-usb+bounces-32965-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 21:03:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BF7C3D18
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 21:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F190303BA4B
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 20:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1441337474A;
	Sat, 31 Jan 2026 20:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PYzJqxem"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAA7372B2B
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 20:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769889787; cv=pass; b=ZQal9rJ5csRr8LY9tpAQ/bRW+Gd1M7+g4Ept5muWPD4vCA/xptYw8fWXdieDb8FLjxe7qgEzOFNBpmyaSi+NOpiFVcNPiYdz4/ouC3Yk+xBKGw5u9HHK6dvk+O1y8UI7MoosSq5PHM11YMlS5iPAksgzz+2IxBiISGlvtRnJP8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769889787; c=relaxed/simple;
	bh=7+gpJ1XTqfyvqD906j489jah9H9uwbfvoMkXE6cDPuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4CSSAlb4GgHzn1hAo9n2EM6cPvcxLgUP+l+gJYd3kAjy2p+HCbBy2IaE8n/r7oAEKtTO/gcrO2eWKlhjhmMqIlD6+sRKuhilVKBQAK6nZcC734GTQZwZDN2CIqryKEKV3OS+wQOtj3Fd/Z3HSItzquTieTFc7lpLa2Rc7/uW7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PYzJqxem; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8837152db5so505493666b.0
        for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 12:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769889783; cv=none;
        d=google.com; s=arc-20240605;
        b=Jge1Dj58+lm/5FLxn81qXDqnnJXACLHI0h/a+ZbvuPAbh7p2YlfeiSA7LF2H78tCjR
         lw0wHXaL5abE4vOQRWjIyTySIK3CDdk1pmUfwsKdewrnC9Xzy4XEudmQcB5GSuEipvLM
         qW64VAMaQ3T9l6qb+r8JsBI2l2ZzOtfip5H2XdDMQyVx8mUd3WNvTgTvP8N9cAUsqM/y
         I3xJkJsFfEG3F6PvK//RhyOAEoLK6gTcJYFuHqc/ECk7ebwwD3s9ezaUcp6q+lMSQ8iX
         PHWMoatfAvSTkkuT8RxyBtoSS6P6MpmyCUzr4OOLM14dVlTJo0na9HRau7Hn7gUHYqC7
         SS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rL+Su5x/WeCqYgfxZztlYQTOnKf9OKjLga2LNBzR/Ds=;
        fh=9df6yGHKckOBgxCKMDYeXuClOdFLnaR5xkNCKz7Sf8c=;
        b=DkM8AzTJABM7TDvAJUq9t7+vGmjnp7PcY8Hiiyui5d2goU4mR2SvG9AjGxghYFqlBC
         iXRlKG0fZ4U5JGHkgfJvJkZneejRs7rbCANW9EIgPI+Vk+rRYB3RwbR02cKj106Pl0M0
         QybqS1+QvJT0qoHf+VlHPANmczqUiA25HXnEn8lEq6fcccBcYApCAH3k3EGz39hRwo2S
         wq2Vel9TQ1hTr+OHpvrqzuwBhDDISY5iRiP/qcJBPYyKb8Ms6ib8u1HEgYhZnRxYz3ag
         qKKfFZ3Fl3L5pCvW2paPvk8ugfho0mAue/5i4EUIvddBYZjvMpo4HJZl8xrqE6YS6Sfr
         GrBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769889783; x=1770494583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL+Su5x/WeCqYgfxZztlYQTOnKf9OKjLga2LNBzR/Ds=;
        b=PYzJqxem9DMMIyXjr6kDBzJA4f1VkGRq2eJQo1MONDujUpBCkPw8iqCtQs39ZHSlPr
         KH5ADf6dE9OyqMI2ZmGTgszJnIvMmkLnsX7xkpylovydPpDaEGHKBt5koaw5yavgDUCC
         SHlWFDwzGeM9rhJnkZNkQziRFQxSLQgqY1T3C/TmVdMwdQC1T2wCqRKpURfVM+4pGhqS
         mKCTDgd5mIaDOjOIuhc/TYz1Nkk8YH4+UUdbtg2md6YjUcw8WS1xBe8eLhIyXJrkQtZN
         CSGxRGms/hzqb0hzapxxk2ytjHBp8vS9Vl6hgP/eRe1a3HwMRfrD0uuF20eKhAvHn+7f
         Xilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889783; x=1770494583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rL+Su5x/WeCqYgfxZztlYQTOnKf9OKjLga2LNBzR/Ds=;
        b=n1bEHfN0S4zjHupyM9gCj4rZ8I5NOPUn0JEuV1ogeGAwnPe/NrmCeITP1c5VncO1E3
         iiTNolIig9AuF3+0ttjkQAAJCCJ1kH4JxdU010w7CL8o/XnOG4I4HNfrVKGT1fElMsY9
         hMQQwAR7OV40MMKqAGhcUImenaLvnt9nuxzVJZPF+9QCKeFjIZmXjWJ5wYL143U2ODXq
         0ZezwQ5M0ZTkqJtwQVsLv3aEAJhkEyV5qmBkGqnksuCL/bZA/cQKV3Rhyzkb2hwQrNeZ
         fnVZvUoTQUZYu5UXUEJwnRQ0qqT4tfNQy0MBpXeOwEJ2YAAIj4k1Eb2/MrxcyBHDCSwK
         KpOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMBAXLZObfvz7zxvRPDtaSxUf1SeYMxCFBqwR6ydvQk1HgKYCG/TUpvjttaZ4X8cbbaMMlQTt3yzM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywsg90Q+2YK6lvjp7ArDZbcNTXJua06hP4E+xCBFyOhUkr8Wbx
	ubzjIZUhowEt94ep4QuTU+bfsP+I2TRWk3vUl+x5PG2OUMXlM39cmv+hgVuIBv1QnFKoohdi7ak
	rrxe0Qq6bS9fg9kxxVUZWXttal6bzmh1xDNf0Y3ht
X-Gm-Gg: AZuq6aILUFUPJWsxbIL9hAXHT/WaE0QgD1UZtYpNRuf3je3NIpvuyCgrSn9d7c11MRr
	9hJBK4mzS1DjI19CdwZlpUEFvSzZtSwxjl1iLGkaZbLuDsemPao5ZCr40asBUAdWFJQA+uJZKp3
	TLjD3WFxq2ic1S8XlCMQK2dYlPPGApZZaTTr9irDNv5VGYlSCo3AE27ZX69Gjt5kyWh/OfuH2re
	btTOZOXDvgfDBGG8a7SPtX5uccQvwKYQc0krn/O+fFPzW4MkxcHriWsHjLHlV1RLZej
X-Received: by 2002:a17:906:d555:b0:b87:2675:9eaa with SMTP id
 a640c23a62f3a-b8dff56a89dmr396045166b.15.1769889782950; Sat, 31 Jan 2026
 12:03:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh> <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV> <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com> <CAEiyvppoiL2EiSmVvNV3DEkr7wwyC1Fbwhm14h7Rfus4Z8uP7g@mail.gmail.com>
In-Reply-To: <CAEiyvppoiL2EiSmVvNV3DEkr7wwyC1Fbwhm14h7Rfus4Z8uP7g@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Sat, 31 Jan 2026 12:02:51 -0800
X-Gm-Features: AZwV_QhcEbOb_GQTelufeNwJJCU6MsAWKA6Gjz0fMmR9BpLj1Kmi7hMzQGebBBY
Message-ID: <CAG2KctoHRG+4J0ujC9162n-Ndgn3nKMu_s5jh0-c-B_P6EOk6Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, linux-usb@vger.kernel.org, paul@paul-moore.com, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32965-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wusamuel@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linux.org.uk:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9BF7C3D18
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 6:58=E2=80=AFAM Krishna Kurapati PSSNV
<krishna.kurapati@oss.qualcomm.com> wrote:
>
> On Fri, Jan 30, 2026 at 6:46=E2=80=AFAM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > On Thu, Jan 29, 2026 at 2:52=E2=80=AFPM Al Viro <viro@zeniv.linux.org.u=
k> wrote:
> >
>
> [...]
>
> > I'm exploring a few other paths, but not having USB access makes
> > traditional tools a bit difficult. One thing I'm rechecking and is
> > worth mentioning is the lockdep below: it's been present for quite
> > some time now, but I'm not sure if it would have some undesired
> > interaction with your patch.
> >
> > [ BUG: Invalid wait context ]
> > 6.18.0-rc5-mainline-maybe-dirty-4k
> > -----------------------------
> > irq/360-dwc3/352 is trying to lock:
> > ffffff800792deb8 (&psy->extensions_sem){.+.+}-{3:3}, at:
> > __power_supply_set_property+0x40/0x180
> > other info that might help us debug this:
> > context-{4:4}
> > 1 lock held by irq/360-dwc3/352:
> >  #0: ffffff8017bb98f0 (&gi->spinlock){....}-{2:2}, at:
> > configfs_composite_suspend+0x28/0x68
> > Call trace:
> >  show_stack+0x18/0x28 (C)
> >  __dump_stack+0x28/0x3c
> >  dump_stack_lvl+0xac/0xf0
> >  dump_stack+0x18/0x3c
> >  __lock_acquire+0x794/0x2bec
> >  lock_acquire+0x148/0x2cc
> >  down_read+0x3c/0x194
> >  __power_supply_set_property+0x40/0x180
> >  power_supply_set_property+0x14/0x20
> >  dwc3_gadget_vbus_draw+0x8c/0xcc
> >  usb_gadget_vbus_draw+0x48/0x130
> >  composite_suspend+0xcc/0xe4
> >  configfs_composite_suspend+0x44/0x68
> >  dwc3_thread_interrupt+0x8f8/0xc88
> >  irq_thread_fn+0x48/0xa8
> >  irq_thread+0x150/0x31c
> >  kthread+0x150/0x280
> >  ret_from_fork+0x10/0x20
> >
>
> Hi Samuel,
>
>  Not sure if it helps, but Prashanth recently pushed a patch to
> address this vbus_draw kernel panic:
>  https://lore.kernel.org/all/20260129111403.3081730-1-prashanth.k@oss.qua=
lcomm.com/
>
>  Can you check if it fixes the above crash in vbus_draw.
>
> Regards,
> Krishna,

Tested above patch, and it didn't fix the device enumerating on
lsusb/ADB issue. Seems like usb dwc3 lockdep was a red herring.

I'll respond on that thread with what I'm observing.

