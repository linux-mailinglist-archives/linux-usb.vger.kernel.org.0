Return-Path: <linux-usb+bounces-37287-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK37KpZkAmo6sQEAu9opvQ
	(envelope-from <linux-usb+bounces-37287-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 01:21:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C25173D2
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 01:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FCFC302DF55
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 23:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F1A36212F;
	Mon, 11 May 2026 23:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gM/EhbEb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD35B383337
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 23:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541615; cv=none; b=hXPVtSzAme4xrKt/V2EWu6Y+Dv1J/7F5krSn+XuYccsGR7Mt+fMtKcFsly20cIFgJEqVKStw1lQThjznWljYt+QIVnyBuzz9OF2wVHZ8aJmjocOhNoWkHCKmYycJjVU4oJsHwBwrAhOsVy/JCjyWmI4ty6dF794IlZXQlxSA6Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541615; c=relaxed/simple;
	bh=iuavlYcSC7GyVZkJn4eD+OeF9wNgjkrI8Te04FStY08=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W33Ug9g2QNoyRQQGPGkGvK36WdK0BTCKC+CJ+PQx9usI6KckyVKpVFch3NrVQAcR1Xv9xi7UD+cyAWanjmyMAbdPkG7JdMlCVRXnTiES4uMkAypzXqhy483nIu9OKtUBZwdlTxotHSWaXK37NZw6qxLI0R3Y4DR7lafl6QJkFSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gM/EhbEb; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-393c93a01abso41532951fa.1
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 16:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778541612; x=1779146412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKeFaDyaApRaenceXFBzhlhr5RKF4sYAm+7+RMza1rM=;
        b=gM/EhbEbANWAXiB+/4r1uLu1vT0cp9b/mHZeBBgTqlylN8TupH7vn1EW3Qo1v/1Y8R
         fhRFZN9tOBZugRFhyYrcHBpzXKsrTC0cwi/+NR85Taa7zDsSoPrqyFMpR2/IsptaMgtW
         Fc7gJhtML0gDqnlAMRk6EazHixiruCCjqVr+dte3Oz80UzB/3SEFLexbtFfPrCrTv1xk
         2E5LlqjPQrpAESMxpuznqikQjR9nzpJX0zkJZvSbGvFZXB7+3I46O0yRQE3H922P9CUD
         2of/txmlrOmYK5Ul7H3wGPBWgULzDwjjzNB/QaHYTo+mKOcgdU2M1z4zx0KmTrcxfgSD
         9Yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778541612; x=1779146412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eKeFaDyaApRaenceXFBzhlhr5RKF4sYAm+7+RMza1rM=;
        b=ZnerNaVnlqaro7BDCWz21+9cVy4254su7GzPzHjoTKAY8Wm+jfeAwDCNvw+zGzjS0i
         DRCbjsPZUjBJAQRB96tPpH69ll0KegmhAYVkTZPkQ+OM0zp3C80m4byUVftsJQwR56YY
         w28nOOOHSGl2fFcZJvoMFlR4k1TpRz0OgKGWztMI2JWqQ3/4snvmGBoJJZq908wy7K2f
         oGNbk+lUYtLSEiEhMWVgnwGSNWDDZ7RXnDczIbAJeFBW9x4edBNMoIjgHoo/f+o7ObTh
         p+RDAWop/lm1TgGe3W5M5BXLMNytW622Truk9lz82sR9OUl+sb6wD/yvV2iMuai/8eJv
         fb2A==
X-Forwarded-Encrypted: i=1; AFNElJ98cxFYFp0jeDBtZbCnZ7nrPlqCyJnYLOhLeZX6thixD7H9k1ueo6jNEU5e/3vqGH8BG9F5q9Jqqhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf6rtBUtTZ2xTbGxXmbscEEwrm3tdCHi0I2ZJANsVATEGsvV5T
	HqAiQZvvUW65Z6+a7OlLzv36pBeqAQ8zCVK5jU9rYYqlHJo44raWsRfJ
X-Gm-Gg: Acq92OFvRuQswn5MGJ1PoaTK477o0XGOR+utiS7Oyy5WVWgR23dQG1nYuKrGDWTsbor
	wUNCuVpYyZUy/NXkiP0D3IDxpUTfjnK/a9N9YBNWQihr8Paib4VgrAML1C1p4BFPYMlCFUibgwe
	b//XFLLlhpJnUWxz0lvc/Dje2Wdhhto4dRtM+OYz5X+TqckD064xK5vuQHrz3JkiiNBb3x4uVsm
	JZ0Xre0ZHavpex56iHZAFZ9/KLTUupozmhJFn59x0nGRP7E7B0K+xEDDN6BWeP7D1xPlCi/l0rq
	r9JiiLBq2jRS5rcCXsNsI3SfcJEa7NnFA4xF0xnts6hQZmmtjWIApagIQHAUhIL4assJuSAPQaL
	qO4gp44r7BsYJpICyQk/yYOUd8AxqFF7/ycbfcHWn7FyfQ80qX3dhGoCm4OpqIeQuTDHf0sKYOC
	Tc5/5vv7UolX7C/hx+UK5wcaX8/mI4zjto
X-Received: by 2002:a05:6512:3d1a:b0:5a8:8222:7fbb with SMTP id 2adb3069b0e04-5a8a94c6b2cmr5792750e87.34.1778541611890;
        Mon, 11 May 2026 16:20:11 -0700 (PDT)
Received: from foxbook (bgw15.neoplus.adsl.tpnet.pl. [83.28.86.15])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db67esm29185641fa.24.2026.05.11.16.20.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 11 May 2026 16:20:11 -0700 (PDT)
Date: Tue, 12 May 2026 01:20:06 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: IBM Power S822LC: pci 0021:0d:00.0: xHCI HW did not halt within
 32000 usec status = 0x0
Message-ID: <20260512012006.66aeb0c5.michal.pecio@gmail.com>
In-Reply-To: <69fa1c3f-3ea9-42cb-a49a-7da39f72806e@molgen.mpg.de>
References: <fb68e15d-b8f2-42ac-aa65-0d9fedcfcdbd@molgen.mpg.de>
	<20260506193037.6de9e355.michal.pecio@gmail.com>
	<69fa1c3f-3ea9-42cb-a49a-7da39f72806e@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 122C25173D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37287-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,b:email]
X-Rspamd-Action: no action

On Mon, 11 May 2026 23:57:33 +0200, Paul Menzel wrote:
> Am 06.05.26 um 19:30 schrieb Michal Pecio:
> > On Wed, 6 May 2026 18:06:20 +0200, Paul Menzel wrote: =20
> >> On the IBM Power S822LC (8335-GCA POWER8), rebooting into Linux 7.1-rc=
2+
> >> with kexec results in the warning below:
> >>
> >>       [    0.000000] Linux version 7.1.0-rc2+ (x@b) (gcc (Ubuntu 11.2.=
0-7ubuntu2) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.37) #3 SMP PREEMPT W=
ed May  6 08:50:5
> >>       [=E2=80=A6]
> >>       [    0.000000] Hardware name: 8335-GCA POWER8 (raw) 0x4d0200 opa=
l:skiboot-5.4.8-5787ad3 PowerNV
> >>       [=E2=80=A6]
> >>       [    1.593760] NET: Registered PF_UNIX/PF_LOCAL protocol family
> >>       [    1.593859] pci 0021:0d:00.0: enabling device (0140 -> 0142)
> >>       [    1.627080] pci 0021:0d:00.0: xHCI HW did not halt within 320=
00 usec status =3D 0x0
> >>       [    1.627094] pci 0021:0d:00.0: quirk_usb_early_handoff+0x0/0x3=
00 took 32465 usecs
> >>       [    1.627123] PCI: CLS 0 bytes, default 128 =20
>=20
> > Does it work any better if kexecing other kernel versions? =20
>=20
> No, the problem goes as far back as 5.17-rc7. (I didn=E2=80=99t try anyth=
ing=20
> before.)
>=20
> > What if you increase XHCI_MAX_HALT_USEC by 10* or 100* ? =20
>=20
> I have to test this.

I missed your dmesg attachment previously.

This may not help if another halt attempt 200ms later fails too.
Per spec (5.4.1.1), the HC is supposed to complete halt in 16ms.

> > Does the controller work normally after this warning? =20
> It does not look like it. In the log attached to my report, later on=20
> there is:
>=20
>      [    1.739374] xhci_hcd 0021:0d:00.0: xHCI Host Controller
>      [    1.739431] xhci_hcd 0021:0d:00.0: new USB bus registered,=20
> assigned bus number 1
>      [    1.794727] Freeing initrd memory: 52928K
>      [    1.801984] xhci_hcd 0021:0d:00.0: Host halt failed, -110
>      [    1.801988] xhci_hcd 0021:0d:00.0: can't setup: -110
>      [    1.802137] xhci_hcd 0021:0d:00.0: USB bus 1 deregistered
>      [    1.802154] xhci_hcd 0021:0d:00.0: init 0021:0d:00.0 fail, -110
>      [    1.802250] xhci_hcd 0021:0d:00.0: probe with driver xhci_hcd=20
> failed with error -110

Right, this chip seems stuck and the driver fails to reinitialize it.

> PS: Claude Sonnet 4.6 cooked up the attached patch, which does *not*=20
> help though, but does get it to the return code 0x10, which Claude=20
> replied to with:
>=20
> > =E2=97=8F The status change 0x0 =E2=86=92 0x10 is meaningful: 0x10 is P=
CD (Port Change Detect, bit 4),
> >   HCHalted=3D0. The old-kernel reset (from our commit) did take effect =
=E2=80=A6 =20

Do you mean that running xhci_reset() before kexec() causes the new
kernel to see 0x10 instead of 0x0 in the status register? Is this
reproducible, not random or a one time fluke?

A little odd, one could expect reset to have the opposite effect.

Is there truly some machine firmware running during kexec() and using
the HC, as your LLM says?

I honestly don't know what to do with this. I think I would start with
looking whether xhci_shutdown() in the old kernel manages to halt it
successfully or if it also fails, and what's the USBSTS there.

It seems that you can get such information by enabling dynamic debug

  echo 'module xhci_hcd +p' >/proc/dynamic_debug/control

and capcturing old kernel's log up to kexec() through a serial cable.

Regards,
Michal






