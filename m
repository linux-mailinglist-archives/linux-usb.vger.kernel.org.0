Return-Path: <linux-usb+bounces-35120-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP5IAXbAu2n1ngIAu9opvQ
	(envelope-from <linux-usb+bounces-35120-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 10:23:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E52C8890
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 10:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 354DF300B442
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AE53B0AF9;
	Thu, 19 Mar 2026 09:22:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B877736B07B
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912177; cv=none; b=oUeC6zPzcCgmm0D1U7bcgSTHZFAbEfrE+CAZ5u0HelPHjr25wuIkvG6obOWzhYGgFRgfUepQ4soI0TSo6x4zT9FJiYMLrrZ1YlkC4w4qp86CtGvU9jqRpfe/ngxMvOkFUZfgaIxA8RTxsqCAkAfTlbfkBqwpuGHjdaZItslNe4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912177; c=relaxed/simple;
	bh=xsYlSEBKEhAJUI/2k2Ae0493EyKzWTyh8Ac20dOwYA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhM7B2VD3wX9Z/lSPKVxFIYHAO0rBhUpY7G67EpC7PlZxYxrlJYLAsjN9bmxjvmylwynx2W7for/n8HHt2MBlZ8zbcpN4R+b+rnrzYJ80wKXGmN5zy9/efvlN6eDDayNnnOrrxlefT/fgDxRKJ2Akb01/vhGnM2MQ0xr1QOqz38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-602947681ccso202147137.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 02:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912174; x=1774516974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3R7oKWv2gVUp+Av/4dtqoK+ZAhQyBi15VK3avPppXR4=;
        b=QyzMRQk8u+mLCYbLHlqQv2fJ+QU4pCIZPsKebIbjXOaIzLL1PkjyJLkFakXE7kUmEz
         3881KN+rNgIM55xbzsdUB8/tYSA9URAUGdAPstc/3V2LXUKWOMIlsNG6fgfSe3upkcN3
         EMTP2qxHeserqg9WMvGbulJhf46fOZgIqraQccGWyInLHKVncPH5eiD3REZbkWdAhDZ3
         a3l2nLQrvZhD2eTe/2R/4fNREc5rEXe8iwF/mu621y1ac3ssopcFno2Mxhvtffwqjqu2
         ra3hCfRnvwxETVytqllbadHVXZu8C4odFE23S4HF9cTaR9xLMdusHM47T3G+AbaSEi69
         kZzA==
X-Forwarded-Encrypted: i=1; AJvYcCU5aVoVpkNTUjZhPxFmPv+z2/QyNNrHuEdXp2yF+NP23ob8Z4NIoOYg0dPulAoBMT9Z+6Wesxl12Pg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKkDvSOxY3zmhiIPMNT3DQFZDYhYTIKDhLmIogJT5oqgHREcX
	GrJ2tUFxlrIZ+EvCAD1hcnsO4hjjeuVPOEOpEpd47uf0gaLhRAR8s6RSo8hnIObK
X-Gm-Gg: ATEYQzwuEclm56RwGtkePDq/Z7/XgKbP4slhmvQ5rU8Rehc0yWQ4G/d+1XTAe9MskVk
	GSaCiXhsEDVYrO9YoEVyuf9UajzvU+vxwWo45c2CEoLg1ew1dXz/whG5g939y/zTIa0YI4pHdqZ
	4i5nSHGHgGDdekO2L+N+JTdejq3bCJ9ZGNSbGIQ424U2ddGkYr5NVBIGt1x+wlj9cBVke15mrLQ
	RCrayDSwMR9U0jOwmQX0kVGo6X8z5PWg+eqh7vqa5spTscrVUMnJcWE35F9+OU0N6nLpI+NGFcP
	DNEfKh3c1EVDdm31QOmW2U21599fLceD5gWuOpljbPwGoMDMQwkoR22R2Mti49N9EHk6TONwCRE
	2tyD+AltDGkxTC0ejhAEjdiZl1BSOk2g42ipDC69+srV2tmAnMz9mNcYwjX1nP998FsmcD7/FIg
	CQr9Wi/i0/v3pvsWTsPNvroCJSOcDR9WFfBuM2aUndvWEj97FhY2BWVjxmNYHHUiQO
X-Received: by 2002:a05:6102:50a6:b0:5ff:d192:ff2c with SMTP id ada2fe7eead31-6027d3b24f6mr2767940137.34.1773912174502;
        Thu, 19 Mar 2026 02:22:54 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6027ee242b4sm2704976137.10.2026.03.19.02.22.53
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:22:54 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56b069fed64so264494e0c.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 02:22:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJ5YhMIpSb2UIi8cN7wYHe06zscz6gqWI/gQf11zsFWZ+ZEZJ+TMH42IMRKsHg5745saZlXUHS9ks=@vger.kernel.org
X-Received: by 2002:a05:6102:38cb:b0:5fc:2b19:f7d9 with SMTP id
 ada2fe7eead31-6027d38b928mr2511117137.29.1773912173468; Thu, 19 Mar 2026
 02:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 10:22:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUACGC4rdXfvO-N-cgNAEzhczB0VYbMoxZMyazSAp6jWg@mail.gmail.com>
X-Gm-Features: AaiRm53HlmfFuAaNSpgq0fW3s48A2x_PU6s94_11fvKsqDZNlyduvi7IWb1MQfU
Message-ID: <CAMuHMdUACGC4rdXfvO-N-cgNAEzhczB0VYbMoxZMyazSAp6jWg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org,mailbox.org];
	TAGGED_FROM(0.00)[bounces-35120-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	NEURAL_SPAM(0.00)[0.456];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,linaro.org:email,devicetree.org:url]
X-Rspamd-Queue-Id: 995E52C8890
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CC Marek (for Sparrow Hawk)

On Thu, 19 Mar 2026 at 09:49, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
> which connects over PCIe and requires specific power supplies to
> start up.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> - [1] https://lore.kernel.org/all/20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-1-1ad79caa1efa@linaro.org/
> ---
>  .../bindings/usb/renesas,upd720201-pci.yaml        | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> new file mode 100644
> index 000000000000..8b8be572c930
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> @@ -0,0 +1,61 @@
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
> +  The UPD720202 supports up to two downstream ports, while UPD720201
> +  supports up to four downstream USB 3.0 rev1.0 ports.
> +
> +properties:
> +  compatible:
> +    const: pci1912,0014
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
> +  - avdd33-supply
> +  - vdd10-supply
> +  - vdd33-supply
> +
> +allOf:
> +  - $ref: usb-xhci.yaml
> +
> +additionalProperties: true
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
> +        usb-controller@0 {
> +            compatible = "pci1912,0014";
> +            reg = <0x0 0x0 0x0 0x0 0x0>;
> +            avdd33-supply = <&avdd33_reg>;
> +            vdd10-supply = <&vdd10_reg>;
> +            vdd33-supply = <&vdd33_reg>;
> +        };
> +    };
>
> ---
> base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
> change-id: 20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-331b26d4fbf6
>
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>

