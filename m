Return-Path: <linux-usb+bounces-32830-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FqKJBjfeGkCtwEAu9opvQ
	(envelope-from <linux-usb+bounces-32830-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 16:51:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F24971C7
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 16:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 766CE305D615
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 15:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C5330AD1A;
	Tue, 27 Jan 2026 15:40:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDDE3064A9
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528444; cv=none; b=NluTgUNCN4Y8tt+/pONFKkfNQzp0X9ix4aoHXH9WYYc8nw3Pmtwhb2bRIx3VtdEC5DsWms0OgfLfk1ZpV3Nh/unqFrn6NHpsrmI55UtkFTHwy/kpfrNewx4sDGJO5WSEIK8wu04e3/exSGVz5xZxkBj7MmR+lEVdUgko/QEU0jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528444; c=relaxed/simple;
	bh=QPF7Zu2r+fCfqNyJkt1Bte+V+ziLRm+jV4lSeXPHZEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGxe5/UoIHGgtutj3lgYJNqk1SLMp1Hays+4IPDbSu7kxiZsNgsJmAu6dF/Seb6P2egDlcH9aEQIjLxT5gVntf9akNQ7VbZV9/WrDiy7yWd4PYovW6cSvRuQ3R0DE11EnDeLdNZSySv8XnmQQyrXfMTuFn017KWQNjX5Z+sATG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8c6d76b9145so713304385a.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 07:40:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528442; x=1770133242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3iP0W+rICWiFtIz9Lnj4u7VRlu+Bycye5GdS1BEDSM=;
        b=mhn6/3jsskgC4ld2CPOlz/wYtZ6/hM2d+1imPPgPmYsm+txSJcrPmncemHjsVOEXzQ
         uTEZr5H8RYH08A2LHN2NSJDcERJ9/M1+MA0dm4tP0AX5h8yISO/TY22j24i4G3zGNSMP
         UE0blb8IYlzivYZblyKyYaZBIfZ/CD28EIN3LpgGnMpTUVAs9aAkvDSdPAwRBrgTJlsZ
         bLMjo5bzOriUlH93p1ZTIv9pj3SSBzEsFrzSSOEQ0EX6blcnKs3WsXmmZiFj0qekuHuJ
         rtYazF3C9TLyWlPlM7s692D7K9YcAOAn7oTmP2eIz26HW8m2vjlKpU+C2Vj4LYJtW6Bv
         Hx7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlI+Or35PWze1aZSWRQtPy/jRT7Hj/6AEcgYVfCMcxGbA3ZskNVT8SWdCtmuwTK63Ppb+CiOvH7ZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIcT0bZzyXGcFtFG8wZgm/U/83wReEN4Cm0MoIQaGbdWxjyYQ5
	72gIoEYh/b+UvAIokNMW2/OCuAIB5AuNcuVLtVaWRfT6vN305WSAwA2/xpniHYZLuIOYHA==
X-Gm-Gg: AZuq6aKJ8Y03Cky/Tdqg22QFGaMBXSYYa7Cfv1JJGt+uRwDZ3orCPhA7NffehiIEXkd
	zLeUasl2XRuPzPLqfsXEsrd0NXUOlw5KROqfdQrzDTf/x91Cf/nQV3OHYZ98MauV7Dhe/BtarxH
	5cA7AB7FeMBB42hfRizd1UINCZTzLMHWH7WnTlwkS8upUmFdlS2zkUjpJIe3H5k6cekScG4x4WB
	GqDTb9YeQ/zapMdUaBgziHKyXeMxa/VPotB/GQ59ENY3KV1ksehZJK8WgEr4sBZchX4AK+y/Mim
	dA7+ml+WdarIfvv8O2jNFR+3vcu5A54PGk0jsFIwGqGw1x4B/8o/jx+lcl9v5Isbg5LhWKMVzpe
	LC3HhdukRlt+YvLZ1iseshr2wDSv7UzMgJFMGjEG4Tb8gNaCEEPWN8NF7/wFKbmpRJaVmQt4i7t
	LqYv41NGm1WhKKV4EYALKUx/qoNkE8M2EIFEQbvhrrhVNSF97vP9kj
X-Received: by 2002:a05:6122:3b87:b0:563:83b2:ef2d with SMTP id 71dfb90a1353d-566795c905dmr786113e0c.16.1769522554222;
        Tue, 27 Jan 2026 06:02:34 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9484fe51d53sm1182159241.12.2026.01.27.06.02.28
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 06:02:31 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-559f4801609so2515705e0c.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 06:02:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLu1zf905HM5f/mG52b6dQFfYYlStcBXiywRxyZ4+Bfgy9EfG524kcd4EeWKCtwEqepPkOagJurOI=@vger.kernel.org
X-Received: by 2002:a05:6122:340e:b0:566:2568:df1b with SMTP id
 71dfb90a1353d-566794c0a54mr742458e0c.2.1769522547250; Tue, 27 Jan 2026
 06:02:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
 <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com> <6e8c3d6b-8cba-42da-bafa-28becfa15d60@linaro.org>
In-Reply-To: <6e8c3d6b-8cba-42da-bafa-28becfa15d60@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jan 2026 15:02:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=u280N2HUgpiHtRXuMv0RhtDeEFDaSLFQ0Wg8frt+6A@mail.gmail.com>
X-Gm-Features: AZwV_QhN9K-WsMdmqL2nfJrvZ40lsYIN6kZoo7JRPE4M6cKNWw4lsg30FvWZJqY
Message-ID: <CAMuHMdV=u280N2HUgpiHtRXuMv0RhtDeEFDaSLFQ0Wg8frt+6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-32830-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,devicetree.org:url,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: B2F24971C7
X-Rspamd-Action: no action

Hi Neil,

On Tue, 27 Jan 2026 at 14:55, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> On 1/27/26 11:20, Geert Uytterhoeven wrote:
> > On Tue, 27 Jan 2026 at 10:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
> >> which connects over PCIe and requires specific power supplies to
> >
> > Here: "requires"...
>
> Sorry I don't understand

Please read below the continuations ("...") below...

>
> >
> >> start up.
> >>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> >> @@ -0,0 +1,55 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
> >> +
> >> +maintainers:
> >> +  - Neil Armstrong <neil.armstrong@linaro.org>
> >> +
> >> +description:
> >> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
> >> +  The UPD720202 up to two downstream ports, while UPD720201 supports up to
> >> +  four downstream USB 3.0 rev1.0 ports.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: pci1912,0014
> >
> > Just wondering: how does having a new driver
> > drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c matching against this
> > compatible play well with normal PCI discovery and probing of
> > drivers/usb/host/xhci-pci-renesas.c?
>
> In Linux, power control is implemented as a platform device driver,
> so it doesn't collide with the pci driver.
>
> The pci driver won't probe until the device shows up on the bus anyway,
> so he power control will attach as platform for this purpose.

OK.

> >> +  avdd33-supply:
> >> +    description: +3.3 V power supply for analog circuit
> >> +
> >> +  vdd10-supply:
> >> +    description: +1.05 V power supply
> >> +
> >> +  vdd33-supply:
> >> +    description: +3.3 V power supply
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >
> > ... but no power supplies are listed here? ...
>
> None are stricly required, they can be supplied directly without
> a passive regulator. Not sure they should be required

So the goal of this binding is to document the required power supplies
which are not required? I am confused (but that could just be me ;-)...

> >> +examples:
> >> +  - |
> >> +    pcie@0 {
> >> +        reg = <0x0 0x1000>;
> >> +        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
> >> +        #address-cells = <3>;
> >> +        #size-cells = <2>;
> >> +        device_type = "pci";
> >> +
> >> +        usb@0 {
> >
> > The actual DTS uses "usb-controller".
> >
> >> +            compatible = "pci1912,0014";
> >> +            reg = <0x0 0x0 0x0 0x0 0x0>;
> >
> > ... also not in the example?
> >
> >> +        };
> >> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

