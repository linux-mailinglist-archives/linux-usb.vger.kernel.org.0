Return-Path: <linux-usb+bounces-32801-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EN0EPaseGlasAEAu9opvQ
	(envelope-from <linux-usb+bounces-32801-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 13:17:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A870A9429A
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 13:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A6B130054FF
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 12:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1027B3469F2;
	Tue, 27 Jan 2026 12:17:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23A1F4181
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516274; cv=none; b=KbJEpEMhpjLeKpRaf+PzAYIikNpLU232izB7YaWEAgrYHb2kho3O/2oUa4LM/JV49/tLScF6QqOBdALzap6ar+3C2Ouf27NDz8FekctdhGQ79Zyv2TAONIiQ17Bns9dvKYncVTe/GRbhcxAxm+wJ1ZTxNl38wshsk7wivGs7b14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516274; c=relaxed/simple;
	bh=VR7NKRn1EzgAvvzhExxtxmFQMZZBrouxWpYgT74wAco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jn11a4aZBgENFsPKG/mAAUDVyBotDZ+kJJ8WulRbhu9r2PGKaMsEHiXZILfthjNhpsCl5joNhiiANte5lfLvjKcdW0U3CxISbdfhVq+ZVbfxQJD58DU4wjpFY4r0mEZUtxKFxZfX/8KgWc3VhSkmEw9fUdSUTsySLWNiaVUaUL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-12331482b8fso3323016c88.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 04:17:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516273; x=1770121073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h95kKSGuxlIi6DsiBy3i3OTVnWNnI1FQj5Fv8XU8C14=;
        b=wZ6/l6e+iDlw7tH1DFZVyEWJoItNem6qVbse79wxosjOItNTJ7GFq2Lpw4aymGyIrK
         kMbNeAGHsglDW/2CwZBoT83YuS5Ga3+5aOxBkM7faE93CbZFrZy6A6lFzwrsmpRFPPOL
         cphUZclR2ul2bYRRa/S8M99sedoRmAp9njeNbVoWWNlHPPNLdpc2vrhYinQNOLZsPq+b
         OnVv00nefBrtYGFcylfaNG1NyO8H86eaqKBCb1HgZzWn/gO5eThynRpHV17vyAIoW3Y9
         U/MfNu2o622a/8nFb8v0vkjdE3obOMwR+gsl5doOJBb0vaaXdPGIuLv+ZqkrFyU7DpXN
         sipw==
X-Forwarded-Encrypted: i=1; AJvYcCUaj7fmEGlbEYywITXZJPAc1GMb0DEEKgxuTCYhcqC5W+zJDmvMy7r8IOBmhJk51QMA7awhQJNOzRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDzglDyWUDV9pSNqxJSlFzeTw6T63h6PesC4Z5kMfWr87RV0Bh
	zF9FjvPHgifddWvnf2sjqmYCkcx3FUqlDCrZmmkSoZwqCSMsIhWvWHeuNUIwbzwy
X-Gm-Gg: AZuq6aJEMHPnv+1aZSdnfc3N730SwToyinZCDItgX31/wl3t5mDyEGXhf1uXvhyfARG
	IGVw142VMgmelu2iCzCUjNnoZKhe76Fk9jqchEivTIpO66U0EAVzvnOEGHy1lxvTnEb7g45eoHi
	qjArsSE6h+WN853datMeP0dgHjPh4RvFvdJspJuR88IWtDaL6qV41V8J+smTKvfu/RcWe54bVlr
	lFY8j6gubpgzEiqKjLpJl+pVbNyBqwAgXgJy65YhOI27SD57fjp9E34/HNH5vMueEd5IUMTX942
	6FBCEBA2IsmdhWWgXB5QxaAoZ+t3YkejjmHpIj2yPuWXEO7W8y0tRH7CO51iALlHx30ubN5MmDN
	E0nIhnGR0ylBm+dRCH1nXANY4hg3E4KsMKFz4hzMCaxEQ6r1P/MS4rrinBUCdCtJ+OwdHSDPxxE
	vU143l9CSpgjW9sGZs9UiPelO5pFK7oMDwfnWVQhLYQhe81m42sBpBm4cY9po=
X-Received: by 2002:a05:6122:319b:b0:566:354d:9f4a with SMTP id 71dfb90a1353d-5667949f0c8mr440970e0c.1.1769509271438;
        Tue, 27 Jan 2026 02:21:11 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e2ab629sm2286816241.1.2026.01.27.02.21.10
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 02:21:11 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-941063da73eso3072953241.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 02:21:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkMRvVik56RY7TsWBomceFB1x2oZw+DRolAnyKSAOvYT47mdob1TqvHdy4DV/r/UP8mi/vc67YWXQ=@vger.kernel.org
X-Received: by 2002:a05:6102:32c4:b0:5db:ca9e:b57d with SMTP id
 ada2fe7eead31-5f72368a7cbmr661077137.19.1769509270640; Tue, 27 Jan 2026
 02:21:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jan 2026 11:20:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com>
X-Gm-Features: AZwV_QgWv7FB_90Ca_fAZmW1VQjnUFaVdHL_S5QmJWKKvUrnnNh7whB0F4bfOtQ
Message-ID: <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-32801-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,devicetree.org:url,mail.gmail.com:mid,0.0.0.0:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: A870A9429A
X-Rspamd-Action: no action

Hi Neil,

On Tue, 27 Jan 2026 at 10:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
> which connects over PCIe and requires specific power supplies to

Here: "requires"...

> start up.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/usb/renesas,upd720201-pci.yaml        | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> new file mode 100644
> index 000000000000..df3cdcf44747
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description:
> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
> +  The UPD720202 up to two downstream ports, while UPD720201 supports up to
> +  four downstream USB 3.0 rev1.0 ports.
> +
> +properties:
> +  compatible:
> +    const: pci1912,0014

Just wondering: how does having a new driver
drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c matching against this
compatible play well with normal PCI discovery and probing of
drivers/usb/host/xhci-pci-renesas.c?

> +
> +  reg:
> +    maxItems: 1
> +
> +  avdd33-supply:
> +    description: +3.3 V power supply for analog circuit
> +
> +  vdd10-supply:
> +    description: +1.05 V power supply
> +
> +  vdd33-supply:
> +    description: +3.3 V power supply
> +
> +required:
> +  - compatible
> +  - reg

... but no power supplies are listed here? ...

> +
> +allOf:
> +  - $ref: usb-xhci.yaml
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pcie@0 {
> +        reg = <0x0 0x1000>;
> +        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        device_type = "pci";
> +
> +        usb@0 {

The actual DTS uses "usb-controller".

> +            compatible = "pci1912,0014";
> +            reg = <0x0 0x0 0x0 0x0 0x0>;

... also not in the example?

> +        };
> +    };
>
> --
> 2.34.1

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

