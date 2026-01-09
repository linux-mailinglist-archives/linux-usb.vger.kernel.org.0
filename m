Return-Path: <linux-usb+bounces-32108-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B20FD08B5D
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 11:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE3BE3011AA7
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 10:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD34339B44;
	Fri,  9 Jan 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eq4KvfxK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF8330B00
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955693; cv=pass; b=Gsp93Rjz/Ko+ScfqzB+sigbqzgo74bHo5b1wJWSXVtcbQmV3m2wIJlrk5GhD0ntF+CmBFozPIyCxid5FRWHjx7oOp+9+SYG0wzUyyG70/aME4p5gLRV/NLiGkJYJWzs+OvI0u+r7wJxkScmBX8Hch6U/NZujBOyaveFiWT0Ft1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955693; c=relaxed/simple;
	bh=112AzpHBtZXYmDXQNDrom+q/UAVHlTTEXmaWppzIbhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxCoGVhsRdVEj+BChxnRfEvDH+vBGDWmBA/QAqyY/lnJUfP6Gz52rAQ+wlHjfSj/iNXcVi8qWaN0JSKL0kPDNMAUK+s0UdNlkU/5qare9NASRaP7krwTOewXnjl2PjSiQ59zsSw6po/LyrgSR9+GRssu0iLepZq3ZB8s/3ghITY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eq4KvfxK; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a1c8cc47so59715e9.0
        for <linux-usb@vger.kernel.org>; Fri, 09 Jan 2026 02:48:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767955690; cv=none;
        d=google.com; s=arc-20240605;
        b=cAvZtRf95qd4q1KEle+reXIH/eQN64IwtooUXPW1v1Xz5zQ4QNnQfZPfaJaMQqK9cx
         fKuR3MQAZ2azR1uRiWHnMYrEd3brXHpVQuJoyiEfhJexiFHX+TONkMrWIXhE7oqjGdv9
         BK83tVILALvOB7RQVHPif6J+WIr+IzpYUf7nDK8VMgE4WDMTmt2C3biMMuxnWGuv8J6X
         2t+AK6nxhyH+9Ppq+8xuG/VZ8sj9MfF+KycmnxvRA4applA7X84ZZ3wjYaDCg8SaO/0E
         mU1Fe5SZZ34fEOxfrQ8c1ZH5lNPfR2DkyliwdOKcuAiMOH72I97FWMD83O5UyoHQfql/
         1xKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7WLUbbxS2PVSP2YumDMom+BGsuJi3jYr0x9vO9H1Z+s=;
        fh=+cbs1akorGrMRjnvz1ce+a4aWk4z9sTG8a4rngCcOyo=;
        b=DvpLSyHKHHk9DdgZET3yNksgx0ZZsDicfGRarxHBrTn5efdJy9jf2fccij92rsRdd7
         +9f7vEJ2ZPHPX6gj8b/04EIxbT6STERixc1b/aVb7hpqSD8FiciIhUuK2sexezEMhdrs
         RRMgxH/J1BIWbsTHaAJTXPmKcRLuA1zcVuuDOHFQxXYMefn8q7WlFD6loDjibCkpfIOy
         kj5BOwSnTZVsAkA/16iJVcfMX8eJS8aNW3jyul6MXegbYYWE/JP/+9WNnfpoCTzrbK3R
         rXpwChhaSfDQZtl3V9zYMFn6xh2lwOG8gw9nxQ1FTLrZy6LKfChlBcu241juAzJkRCsU
         IqdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767955690; x=1768560490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WLUbbxS2PVSP2YumDMom+BGsuJi3jYr0x9vO9H1Z+s=;
        b=eq4KvfxKJG3d4xZuX17QvnU13oXz332jJhg/lLQPRq9JuQa6hveb8XI8rME+NBbfLc
         RQqMH1WX33PbPu9HmX8XqD7rLhlJ/ccoA/0xa3yKkqpWQwlFBH3eh3Em+N4Gdui63uWC
         JrUGKDeE1BjiBSRJSStG5oF7Y92bPoJpm7Zhs9PCWYLFhp6A2f7rVPXD4py9jr3MyYqV
         8UK6/qbfBC1l7Hytvd222cTXMLPwKG5ncVGytquckromihbIIUTW+qGkmsBvzwRl9hjL
         dPP3vrD1CcK1z+oPmYN9KIBsODkFRlVrQnX+PuNYUXD3qGUvQI/dQOvYzIhpZb4aZMb+
         LvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767955690; x=1768560490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7WLUbbxS2PVSP2YumDMom+BGsuJi3jYr0x9vO9H1Z+s=;
        b=PyzSgYe4NEpm5/0w5WGHHvkLrN2ikl5Dgd8MRd7Gqsze399a064youmg27UdvF2j4/
         CxVXkYvAuTR9eErd2xziaNbUiqaFw9KVIskEualmeSUAa2Cy9WX6K9wGo8gX53zNK9sE
         V5t4EoXusTkvwJ0IWOc7eKJyJAJD+ME2ISrPSHYozI0uPuUiplnRdDh7QH1r8EFtjQnT
         C+qhoxmOgWm3qsrnP80FvA+iTAa5ZqPajwJ5kjd9dvcLjzvh0xKrCQN4uRKXMMiq8MWT
         WU3cTKX8Ke2P+/Kwlp4DXzdZRydjvm1+lMII8OzGgvnp8aCow6exQLMCCwS+dobRLeHG
         wVqw==
X-Forwarded-Encrypted: i=1; AJvYcCVkK0rpSVujQTY1IvoQxL0KG0DDil6+JHc5+qKRKAr85X9LVNfy/wPMvMNRcakIWG3p1/W+CA6e3GI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4GORXOaHMwa0H/bTKn+LEM0bdxnFwaMTEi6sFJPh135yrdPK5
	OvkQS409cBxw34SlpXWVHB+ugcHh/25bXTUwktPg6FYObd1h3c3q5S+LwQYlHd4VXvnkIWSud4K
	WegGxy5OsYXVHlpQPNInsW20GuXDGJuNOwtjs/mFj
X-Gm-Gg: AY/fxX4/46cPOXj93ocXQDODhXLKBrueOmZXokeKGjAFqgm3LWM8nWTovJGjPriKuKX
	qH8wT+ehuhfnTT3RTWEAQkzvS+XX4fGGJCDE7gYgqHDjBIETu3XLU2mA7oqDSD7PuJnxig3Iry2
	jNeSRFkw+m7tWjDp1cbX3IrAk4+tbbluzSfenBVQZsZX8pUBX5gthAAmpoGZ9iEn69ZO1GDJXzU
	7p14lBj/MMSe/6erKbKAsR1wTJ3VCcCiDnKnpmCpjK8d1Tv92hRaX/e4yNDXGD3MGZWOiXpUQ==
X-Received: by 2002:a05:600c:890e:b0:477:8282:6cca with SMTP id
 5b1f17b1804b1-47d903f8c8cmr456605e9.6.1767955689792; Fri, 09 Jan 2026
 02:48:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230-ncm-refactor-v1-0-793e347bc7a7@google.com>
 <20251230-ncm-refactor-v1-3-793e347bc7a7@google.com> <52usixapyb5hqtek4qlmiuzwvoz6xgzh3sxspn2ueetd5orfz2@qdoqxnuydbwb>
In-Reply-To: <52usixapyb5hqtek4qlmiuzwvoz6xgzh3sxspn2ueetd5orfz2@qdoqxnuydbwb>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Fri, 9 Jan 2026 18:47:43 +0800
X-Gm-Features: AZwV_Qg4UK4mkpn0B-a8SfV0pZtw5z9ETJBoxLC8TQZOH6U3-sPPcq5z_2QuKlQ
Message-ID: <CAKzKK0orWhSqumubp+hWYDzVHvztDn3Wr3Zrhd5Pz0MmRa6egw@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: gadget: f_ncm: align net_device lifecycle with bind/unbind
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Prashanth K <prashanth.k@oss.qualcomm.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 6:25=E2=80=AFPM Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:
>
> On Tue, Dec 30, 2025 at 06:13:16PM +0800, Kuen-Han Tsai wrote:
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
> >  Unable to handle kernel NULL pointer dereference at virtual address
> >  0000000000000000
> >  Call trace:
> >    __pi_strlen+0x14/0x150
> >    rtnl_fill_ifinfo+0x6b4/0x708
> >    rtmsg_ifinfo_build_skb+0xd8/0x13c
> >    rtmsg_ifinfo+0x50/0xa0
> >    __dev_notify_flags+0x4c/0x1f0
> >    dev_change_flags+0x54/0x70
> >    do_setlink+0x390/0xebc
> >    rtnl_newlink+0x7d0/0xac8
> >    rtnetlink_rcv_msg+0x27c/0x410
> >    netlink_rcv_skb+0x134/0x150
> >    rtnetlink_rcv+0x18/0x28
> >    netlink_unicast+0x254/0x3f0
> >    netlink_sendmsg+0x2e0/0x3d4
> >
> > Problem 2: Dangling sysfs symlinks
> >  console:/ # ls -l /sys/class/net/ncm0
> >  lrwxrwxrwx ... /sys/class/net/ncm0 ->
> >  /sys/devices/platform/.../gadget.0/net/ncm0
> >  console:/ # ls -l /sys/devices/platform/.../gadget.0/net/ncm0
> >  ls: .../gadget.0/net/ncm0: No such file or directory
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
> Hi Kuen-Han,
>
> Thank you for all your work on this.
>
> When using the DWC3 IP for USB OTG on an iMX95 with our Aquila iMX95
> SoM, USB NCM does not function properly when booting the board with this
> USB in host mode.
>
> Your patch series completely solves this issue, I was debugging it
> before and saw that there were indeed issues with the relation between
> the net device and the gadget.
>
> Tested-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com> # Aquila iMX9=
5
>
> Kind regards,
> Ernest

Hi Ernest,

Thank you for the testing and the confirmation on iMX95! I'm glad to
hear the fix is working well for you.

Regards,
Kuen-Han

