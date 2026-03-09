Return-Path: <linux-usb+bounces-34284-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBb2Ofqirmk9HAIAu9opvQ
	(envelope-from <linux-usb+bounces-34284-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:37:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5537C237384
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEAD730417B0
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 10:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7035138F944;
	Mon,  9 Mar 2026 10:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oeeDEcLK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D55C38E5E3
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 10:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052651; cv=pass; b=pKs8mkOSM8Qa3vqCcAKEYNJ6mC2LifjTGmL6s3WBkB8KbtQJ9AskxPCmIjB0rXJclaCutNRzHGkW3sRGuv/M7zo2P0FqNYYB3cGNlElesdHUBXJfXDc8ekE0yVLoXe6iEzTgM2AJ1kXNOjVSbzPc8o8vfv2Yv7JcPuIiRpPiQNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052651; c=relaxed/simple;
	bh=TWYX796qf27EFfnT0fwv1H53f8anzfrtf86Zv/nI9IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRdyHCjDZodTF+3C5JnEhu2Ha4x98fOplJ2f0lYe0uAoaDYIw50Alfe1hV4isXRZJoYJfxTxQPIOGfjBJVeJl+ZvkPs+Na95F30Rpisic1vZVXMAA2cV6GHWlMc4/7IHwkwh01gw6youcBDnaFz3gujS82UUEYmV2v/foIb0oFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oeeDEcLK; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a115efd923so8957e87.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 03:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773052648; cv=none;
        d=google.com; s=arc-20240605;
        b=dlIj1w6l/2Z+DZ+86Hq7Bs7g6qzPT16xYD4HUqKzXPYToH9lbk57xSC4xxIlN2/DHG
         TtIGobwPAG6DhClWSJtTZy4QjgCTDA8UkyuOwP9IaIWmYLPVG4ymvGgJXlU0r2+0KyKf
         AKvvPSj9zI2qoaqCdHYdeJMaN5NvNDt1TlBQeC0ZiS5sLB3rwlEfD8+4f3moqkn42JwW
         WyTtTQSJws8wucRb0pCW7UfmKPYHhx/v87SVYFhGi3mr8EXo7zXZTJE9sPzbO3G4fgHZ
         Uk1meAPs+tnObSqJdhR6AkqQy5VY4YyZrCWZvrk/4xZmoT0W/lJkei+WFtD0HKhFNM3u
         BVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e5cK9Urk/4A4PH+rsif+5eOqOyGE3NvOcm5rrxoIzRQ=;
        fh=HB8yUj8Ugn8oHOj86hwhXv9ulSAlZk/xqIkTZwOvvws=;
        b=MdUltf+9ybhrmpPd9/7Zpa4ZZKFwV+lyF8Mnw6zufhqulgbSWaIKw0aCFIvN2rbrv0
         lXlh6Fr8dLssLVu8FYcGM1kVveK3oC6lCAsXjO7GxdRaAFScV37PvAmDyhpU+z0u/Vmg
         suwRk9sWUVAL0z6bUIJytyIRVvD4qnOnrmVh844XkdiDAx/VcnfJ0ddiG1l1k2Rl1eTL
         V/YAWhdHf/InI1n5rTrCmOKSTIThXv/tYuLWEzemh/J8QXXiS1KC1iwq35NdvPDvj5LI
         E1p3T0wM+zxsipquRKWNAIuWYm9hAm4lyCs8sT19c/UKIohv77ektpDecgB1aX1sNusW
         F/uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773052648; x=1773657448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5cK9Urk/4A4PH+rsif+5eOqOyGE3NvOcm5rrxoIzRQ=;
        b=oeeDEcLKD+X4+yt9vkY6oUbqd5qIR2bQ3FeyAyBD32Or9h+lA4McJ8fZ6uyCrcOyuI
         8P/aHSwojcEZwxemowvN8/lCxk3wEoBhnVfpnl0XrwcgO/0q5/RAkcsLji2crUsdTy08
         E/OQx0kSib/uRjkh7eDfu2KbVNSCn6KpqHCJoF9zKB6tf1c2EdTDr4fFL66ZSHJhoirV
         Y5G3tjU7ni58QL1ScYE1uQMc+aZreE8W+e9V3sQSIiNfO8d9KEyGw7H7gsP4H3DTVDO7
         9YTFZI6QgZn4/OmwF2OL1S7Yei4Y5ajlcyKrQZ2+3Md/6XFr9/JocuI94i2c59yApwq4
         mZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052648; x=1773657448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5cK9Urk/4A4PH+rsif+5eOqOyGE3NvOcm5rrxoIzRQ=;
        b=WbEGEqcwKc5Iiga80gVQQVwRhlM9CZFPzp0njHOxCpBKq8ugAiUSIIbpEY7Fa/O2Eq
         DuvIcBoxyKhB8Rgv0NSZtN+3S/MWHnXRHkfqZK4Q3PdhPmh65AzF6qNGAcsKRleq8meX
         k0wCz1qKtGjIYZ4SEyOGK4efB8OcufuGAkLmbSQ8V3L5/WxD9BrUiVCznsy23L6ej5wr
         U167BKmepwFb9dZGqa0TesAit/q5ua3xB09nk69fmaYcpfyZ6gEhF4CvaLKjnAeZjEmu
         /O3TSp6u0gJDqgmldkjY6g80OQnXJtB0YyyIoSRmfxrAjuQj+xYgAMRsjXw6ZwaiOVW7
         hflQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNpTBragFVL0PDA6H9eHtncgC9GZ2VjxhKPDp7V4UUEt5ojqobSM1GF3ix/gF7u1IFceAjHBTtjEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOVuAKrtKRTk3KoO1gMP4nm4+Pac7Fbgcim5wC1AMaeGbjgP0g
	ATSAOjALcJDYHx0W39Xr1uD3wBIyMW/QrIEdWqOEcGYQF29b70mvMuubCI7vDx1gBFNncB2UCHw
	rNTlsKYEWov8ICyP/waQwjOmhahgYiox2Xozzmp7c
X-Gm-Gg: ATEYQzwxOY8nIXlh0AuwDMUO0EfBVVbguB5VlEdgIiSL2us53qbB8paFZ8fMWfMF99B
	O93XzceI8lvdO2af35K3JLiF8NfmYkSVj7Q+3O3pI9vjlWbSMBYiWlLnkaN/7Yv6++DXIkgTlnj
	UGqdZ55sP0thxWHIn0ZBYc3UWSxBXgRtF3x2AmFsPK3UjJnjWyn9mgY7I97piLbBka3Gtyfacnn
	0dPB9GE2oe7PrQ3tlAP5kmqpLnIgMmeSIh51Y8PT/fa0ZG3M7stttdO5RcYhVMdg5q6dcmncc6v
	eaGIiikEKQ5o1wLEWZj59pkvprGtiSEaqcU=
X-Received: by 2002:a05:6512:743:b0:5a1:1853:524a with SMTP id
 2adb3069b0e04-5a140b52f26mr139217e87.16.1773052647105; Mon, 09 Mar 2026
 03:37:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230-ncm-refactor-v1-0-793e347bc7a7@google.com>
 <20251230-ncm-refactor-v1-3-793e347bc7a7@google.com> <89e20554-8a99-40e0-8b4d-2160b364cbc7@nvidia.com>
In-Reply-To: <89e20554-8a99-40e0-8b4d-2160b364cbc7@nvidia.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Mon, 9 Mar 2026 18:37:00 +0800
X-Gm-Features: AaiRm519KwpNgmZqJbRDelkwMmTnvRbtfpqRlcHZj0AYXyLni9zb9nIbhwixKM0
Message-ID: <CAKzKK0qCdgk3vVJMK-zk8roxDtYkqdPTyAahpJOzF2knMYc9yQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: gadget: f_ncm: align net_device lifecycle with bind/unbind
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Prashanth K <prashanth.k@oss.qualcomm.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5537C237384
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34284-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.953];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Jon,

On Mon, Mar 9, 2026 at 6:20=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> wr=
ote:
>
>
>
> On 30/12/2025 10:13, Kuen-Han Tsai wrote:
> > Currently, the net_device is allocated in ncm_alloc_inst() and freed in
> > ncm_free_inst(). This ties the network interface's lifetime to the
> > configuration instance rather than the USB connection (bind/unbind).
> >
> > This decoupling causes issues when the USB gadget is disconnected where
> > the underlying gadget device is removed. The net_device can outlive its
> > parent, leading to dangling sysfs links and NULL pointer dereferences
> > when accessing the freed gadget device.
> >
> > Problem 1: NULL pointer dereference on disconnect
> >   Unable to handle kernel NULL pointer dereference at virtual address
> >   0000000000000000
> >   Call trace:
> >     __pi_strlen+0x14/0x150
> >     rtnl_fill_ifinfo+0x6b4/0x708
> >     rtmsg_ifinfo_build_skb+0xd8/0x13c
> >     rtmsg_ifinfo+0x50/0xa0
> >     __dev_notify_flags+0x4c/0x1f0
> >     dev_change_flags+0x54/0x70
> >     do_setlink+0x390/0xebc
> >     rtnl_newlink+0x7d0/0xac8
> >     rtnetlink_rcv_msg+0x27c/0x410
> >     netlink_rcv_skb+0x134/0x150
> >     rtnetlink_rcv+0x18/0x28
> >     netlink_unicast+0x254/0x3f0
> >     netlink_sendmsg+0x2e0/0x3d4
> >
> > Problem 2: Dangling sysfs symlinks
> >   console:/ # ls -l /sys/class/net/ncm0
> >   lrwxrwxrwx ... /sys/class/net/ncm0 ->
> >   /sys/devices/platform/.../gadget.0/net/ncm0
> >   console:/ # ls -l /sys/devices/platform/.../gadget.0/net/ncm0
> >   ls: .../gadget.0/net/ncm0: No such file or directory
> >
> > Move the net_device allocation to ncm_bind() and deallocation to
> > ncm_unbind(). This ensures the network interface exists only when the
> > gadget function is actually bound to a configuration.
> >
> > To support pre-bind configuration (e.g., setting interface name or MAC
> > address via configfs), cache user-provided options in f_ncm_opts
> > using the gether_opts structure. Apply these cached settings to the
> > net_device upon creation in ncm_bind().
> >
> > Preserve the use-after-free fix from commit 6334b8e4553c ("usb: gadget:
> > f_ncm: Fix UAF ncm object at re-bind after usb ep transport error").
> > Check opts->net in ncm_set_alt() and ncm_disable() to ensure
> > gether_disconnect() runs only if a connection was established.
> >
> > Fixes: 40d133d7f542 ("usb: gadget: f_ncm: convert to new function inter=
face with backward compatibility")
> > Cc: stable@kernel.org
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
>
>
> I see you have sent a revert for this series now, but I wanted to let
> you know that this change was also triggering the following warning ...

Thanks for catching this. I sent a fix [1] for this specific warning,
but since the overall solution caused a regression on pmOS, I reverted
the entire series including that fix.

Fortunately, the regression David reported gave me a much clearer
picture of how the network device interacts with f_ncm. I've
implemented a new solution and will send it out shortly.

Thanks again for testing and helping catch this!

Regards,
Kuen-Han

[1] https://lore.kernel.org/linux-usb/20260221-legacy-ncm-v2-2-dfb891d76507=
@google.com/

>
>   BUG: sleeping function called from invalid context at kernel/locking/mu=
tex.c:287
>   tegra-xudc 3550000.usb: EP 11 (type: bulk, dir: in) enabled
>   in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper=
/0
>   preempt_count: 10003, expected: 0
>   tegra-xudc 3550000.usb: EP 6 (type: bulk, dir: out) enabled
>   RCU nest depth: 0, expected: 0
>   CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G           OE       7.0.=
0-rc2-debug-tegra #1 PREEMPT
>   Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
>   Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS=
 buildbrain-gcid-44366467 03/05/2026
>   Call trace:
>    show_stack+0x20/0x40 (C)
>    dump_stack_lvl+0x7c/0xa0
>    dump_stack+0x18/0x30
>    __might_resched+0x128/0x198
>    __might_sleep+0x64/0xd0
>    mutex_lock+0x2c/0xe8
>    0xffff80007eaedf84
>    composite_setup+0xb30/0x2010 [libcomposite]
>    usb_function_register+0x20e0/0x2c28 [libcomposite]
>    0xffff80007cf7ba20
>    0xffff80007cf7cb84
>    __handle_irq_event_percpu+0x64/0x3d8
>    handle_irq_event+0x54/0x110
>    handle_fasteoi_irq+0x114/0x1c0
>    handle_irq_desc+0x50/0x90
>    generic_handle_domain_irq+0x20/0x40
>    gic_handle_irq+0x54/0x180
>    call_on_irq_stack+0x30/0x48
>    do_interrupt_handler+0x90/0xb0
>    el1_interrupt+0x3c/0x68
>    el1h_64_irq_handler+0x18/0x30
>    el1h_64_irq+0x70/0x78
>    cpuidle_enter_state+0xcc/0x950 (P)
>    cpuidle_enter+0x40/0x68
>    do_idle+0x1fc/0x298
>    cpu_startup_entry+0x3c/0x50
>    rest_init+0x100/0x120
>    start_kernel+0x760/0x908
>    __primary_switched+0x88/0x98
>
> Jon
>
> --
> nvpublic
>

