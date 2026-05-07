Return-Path: <linux-usb+bounces-37106-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJQYODr//GmxVwAAu9opvQ
	(envelope-from <linux-usb+bounces-37106-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 23:08:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E64EF1E6
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 23:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B5D5301AD3D
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 21:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B204C34028F;
	Thu,  7 May 2026 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKmKnVBo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE67C330D50
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778188073; cv=pass; b=taLDEXVuaSbw2yRHbKHUFQFE0RFKiw6GDirxh/Cq7jtodrDqXSwVcymOmc3ItU25Tkj9I1zFtPsulz0JRW52Z4y7hWiZEu0hUHbolAQHJJTfh/wSnT7qb+TA1712haUeEhjLKkFLMA9w3LDe9TOnDVHcCENBDkLvEafBT0a/Ffs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778188073; c=relaxed/simple;
	bh=aBJIgwvRZ5bDYFwZSVhUKwV7mk8QWSacw/0SLleDz6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/dbUxmnKOPUBlbsyDGmiCp7EJE44lTW6WrK13wMr5XCE2wTUEFd16HXBlcnkDDEdbeRwYohojpdgybi9c++Q3JxIbuGAth9vPKT8gO66SkTEPXT/rHPetucNE7QmfksoubR/YSazXi00DcGSrTSg3Fnax8dpCr+1WASMB8St/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKmKnVBo; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44da2de25f3so989116f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 14:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778188070; cv=none;
        d=google.com; s=arc-20240605;
        b=OxEVf5TGKN1q4AkN6QyHOg4MX57LNAEmpaed/xAhECPTTYstOUS4d6pF+dOAvZV+pM
         KH7Snl80yrAhoR3zvG7pjOvJgDRHXIjz/EOKqFoC9X/rFKx3HKLzinOrc8vSCRrg0oGh
         qKK2usHVybuJKwMTIXQni152RLtJogRP0GP+6DPgxuyvVYcUDurCYGA9dZ8Gkrmu1RuS
         IteYfo8cxWGEgOB2P9813o1rrUppCsydw0oSBfUADPLeRsSVYY/Z7umGhXxyP0AGMRjZ
         RIB91h9hKxtzi7mjR8awlKxWgrHUvWzFIiJfjKz/B2ILxOk6e1dZmEXg/jUen0bwB9kY
         Jh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JnyUIT0CqT/tcTXev5pQriZQPfBtV2tf3vER8rM77W4=;
        fh=Dl8lFy2iHGD9UpgZ/cCDdiPN2pel9xQY2RR65U0vgs8=;
        b=TnXlon1FVw9LF98hgroLEj8jDvCOCTcD5X3RgxyeYZqISInDpizN5J4dKE0YfyGVFn
         1d0U5WgyZMmI+4bgABAHOKQ2bdOazMoN4bpv4zl6o85jiwEeUBBEPQ0F3ddnUd89WEN3
         sAd79UUKUjRmglSfCwQO9wi8SRnJccZJkdEpfGcskZqNmPUqzWukOPHcuLQxOdAn27Kg
         XXjUk84Pzsp5LA6eX4R04XF5e2T5FOvIg35dnSgQGrhvAjIKo7RkcDmUJ+2XYjl/zL6N
         mvE+e39/e3F3kzphCsPVe53YSksu9q7E8Hu2eSUbvoY9BNhraq3tsYDYhB0zYKrhXgsI
         8jJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778188070; x=1778792870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnyUIT0CqT/tcTXev5pQriZQPfBtV2tf3vER8rM77W4=;
        b=QKmKnVBocf/rknc+LntoolTNg4DIdwwhpFoIWiGf7Y0h8vK9TT7X1HNyP69gvy44eC
         prVejvzjbbHsYHkxKf0SY/XTdtFnWgzbqDBeAA/a29ghrkA2Ndf0NRNUdsnJqs9jYedi
         VrdONwdhpQwTMgM5tkkpe/6aUWaX29zCv80W7Tc5VmDnrII+8ikTajlhK3IIBGerjgUM
         y7hRFJb62XyCW4OYnNguYAOfnqUITFzBnbnogm1wkkTUJfQkgZJ+0O13q4YGxScHwLku
         ATxwkVd5L9FqW2ecHC/pyksBpyNateDkkcDdvBLDuStdwQPpvuaxhmwk7QKnQkT3jkSc
         gjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778188070; x=1778792870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JnyUIT0CqT/tcTXev5pQriZQPfBtV2tf3vER8rM77W4=;
        b=eLRx1a4PLtc0MlZQpa3UtvVxY7j4GterrAIzHiUXZFP9ioU2oXaAfR4QfhqZbLTYDM
         W9UJVF0YoyfciwyKXmTZIIOh3awnkA9Z0KpJOp7OYVal1umI/uj2s5/aMuwjCUyT/W4m
         uaJNSEC/sUJfxUdJ5A4WE7wt2hRGl7r6+DBTcF1KQyaoLyF0iqnnzC4H5PnbEn7BSVsT
         3SNKNQB3IkGiBaob44psMpPJOiGVJvaiYcRZcskPa9vrzGSQgdgzqTrfO1Y9OEM4yN11
         j9bL13sGkpigqYjx6FDPcLkiTXBqw4bDVsQDs871q2JBcXKClz9Qp25DcsbWepE92O4s
         pKcA==
X-Forwarded-Encrypted: i=1; AFNElJ8EqLJHrZt+PXUHsVjNnTlRPK6eB8KsuGov5KlbyllHy31znC0/jBRCJO2AnsHhxSuVePFSau8UPF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFBq6nc6Hgl3W5rP3Qd02ZOGnQQM9vx+VIK8xvgweNDF7ynxtQ
	ZyCoARJRnn0+EnulWzyBXVIZn+a5h/b6FpZxvy5j9Rqfg4agORF+roEbhyw1j431K8Phl8XyfJV
	aN/bJgjFBorBkb8zHvchitO8EH/RSGdk=
X-Gm-Gg: Acq92OH31QZvRmW3ddyfd5JdBVQH6HFjM3ChfpQ5FoqJstsjmjk08ktz98w/xilOykj
	N5PRCE9OjqhID3mIf+HCIGW8s5Dp8xWx0nXeO1WXUk+yjAzA6COMDvcZWbhjLKKKGwE3/Kgp3ug
	0qnj/ahjItDO8fdontOFczWikZLj6eJ2hQncz5xZrS9duPqV20tWw2ZtSfVdWqE8+9LA9HQNinY
	Q6WW/NkLVtIz/R4RL9Jd1mLB5wABUkn+kY4jzA81Kq0ptCAuAV2GduEbxW99Wvo5AM4LHSSDY3U
	BKBX7OPGKRjeVtETVWtqxt1K54D5gAh6/s5p0ZNebbGEwLZKVd+sfPOpaGjhYNFZMt9qlg==
X-Received: by 2002:a05:6000:178c:b0:43e:a73e:cc8a with SMTP id
 ffacd0b85a97d-454636d22d1mr10067f8f.36.1778188069907; Thu, 07 May 2026
 14:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507154710.3903732-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <2026050732-discolor-suing-ef2d@gregkh>
In-Reply-To: <2026050732-discolor-suing-ef2d@gregkh>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 May 2026 22:07:23 +0100
X-Gm-Features: AVHnY4I5MzZslxIhDkfkF3rp0iHb2Pj2F4JIETsUtLDHLvbsHpywCDyA4uSRmTk
Message-ID: <CA+V-a8uqVGNU-_4yYs4nJc=J4TRDpppnh+tZeVhu5gOQYNvPqg@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: host: Default CONFIG_USB_XHCI_RCAR to module
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 853E64EF1E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37106-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

Hi Greg,

On Thu, May 7, 2026 at 5:20=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, May 07, 2026 at 04:47:10PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On R-Car Gen3 and RZ/G2HMNE SoCs, when CONFIG_USB_XHCI_RCAR is built-in
> > and the system boots with an NFS root filesystem, the xHCI controller
> > probes before firmware becomes available. As a result, the firmware
> > request fails:
> >
> >   xhci-renesas-hcd ee000000.usb: Direct firmware load for
> >   r8a779x_usb3_v3.dlmem failed with error -2
> >
> > Default CONFIG_USB_XHCI_RCAR to module on ARCH_RENESAS so that probing
> > is deferred until after the root filesystem is mounted, ensuring that
> > the firmware is accessible.
> >
> > Configurations explicitly selecting CONFIG_USB_XHCI_RCAR=3Dy are
> > unaffected.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/usb/host/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> > index 0a277a07cf70..b70e019cc3ac 100644
> > --- a/drivers/usb/host/Kconfig
> > +++ b/drivers/usb/host/Kconfig
> > @@ -90,7 +90,7 @@ config USB_XHCI_RCAR
> >       tristate "xHCI support for Renesas R-Car SoCs"
> >       depends on USB_XHCI_PLATFORM
> >       depends on ARCH_RENESAS || COMPILE_TEST
> > -     default ARCH_RENESAS
> > +     default m if ARCH_RENESAS
>
> The module type here depends on your root filesystem.  If you are using
> nfs for your root, then you always know you need to properly build stuff
> into the kernel for modules that need firmware, this shouldn't be a
> default thing as NFS surely isn't a default system type anymore.
>
I agree. The module handling depends on the root filesystem setup.
I=E2=80=99ll drop this patch.

Cheers,
Prabhakar

