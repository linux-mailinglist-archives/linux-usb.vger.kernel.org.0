Return-Path: <linux-usb+bounces-35269-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOG2Fhs2vmkMJgMAu9opvQ
	(envelope-from <linux-usb+bounces-35269-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 07:09:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB672E3870
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 07:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E87C3030D01
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 06:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8DC36E489;
	Sat, 21 Mar 2026 06:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jg5WcoTw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A31C2FF65B
	for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 06:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774073367; cv=none; b=N9XZYvkpXWpg4A1AqLLGkgU7cf9CUb+5kti4YnGcbUFOhEJRxy41HitObG+T9QpSock45j3QqJGo6sUCFFx0vRu/GOc2/j6OV63aF6yOkvLJ9a9TexUrXF4CYrmnlq9cJmlSw7WBhJ1r2Gsb2ljwem/YaG4keBKRMQo2RaPHTEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774073367; c=relaxed/simple;
	bh=pbTYppHZrautnSJvAY6/Xio2GoDuVyueigQEZWiKDKo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLLBQK8F6pGWW+bZO8WoQPu1RYco+AdyaQKVNSc9yGw583YoI9I3PNSBOKkp7lPQvXMEO6YildIKzUY5wTzsV7D8kue7JRR0/FFelR4vcP6Sjw1lauksPYQZBuLfFeDI36S4ultgpT6WgRDLXr1aGP2ay0dqKzhuRL3/baSdma8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jg5WcoTw; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9358dd7f79so215816366b.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 23:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774073364; x=1774678164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npxM1GwTVo8Raut0ki2fSD3AbxxZgvtDYF9h8ekmQO0=;
        b=Jg5WcoTwOoo5NOE32yZppbMlZN/289I9Xxe9BNAuZ7VeX5yad26YZiwnKdt8QRlWCj
         71hn7ftPC8AERk+hZRFQTxWWh8YD4c7KaOeRKtpgNKdyOSWmqZ7O3wxyo3ALdU46pNpR
         fVsZPeSEBeMDtCUtBF7sWM/TDaQIOs29DSU3QuRkmFfLoTQDPzm3Ls7zvay0iLdy+Am5
         +4FPFH+ZI7uygo+qeNBLhlRvvEEXumXkAQmXQxzt/TY9BfA8wiJd7nTcXFJ2trjOYPXr
         s7ElzbufrJnNxRzme2IBS8/oQKDsLhsohH43Sk46fecYndyGk/Tl7ShROv2uNeFqkqGl
         Lnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774073364; x=1774678164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npxM1GwTVo8Raut0ki2fSD3AbxxZgvtDYF9h8ekmQO0=;
        b=Haw7S09EaZWepysnm8+pTPRl0ZY0LspUTQWH99biecu7uvTNJ+NR7g+Xs3iYF9gci3
         hPi2JzW2woVTQ23wmobwWOBMLQRxYYDOFMqn25tXSOgh/gYz5RMSyttqhBGknZQcrK56
         qObdtyhIm9TkM85xNa2tY49ZFwzZRQ+AtqKhCss8dsHGMfPr+v4BFU7fO6/cw9xCBBs0
         FqZwh5qLtMWF8PC1UCcfwJGtT7+jD02CrVpHAscaPCw8pTa9NtxI3LLv5G7QvMKkQE6o
         P3mL5DKJzgR7gzSrl1H28Ur/GbwK1sxBs4a21EJOno3JW6IOzGvjiJvGK6StOupIqIQ0
         w1lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzY4do/kdfgHZek5WP4YZ0vc1owY8HpLcYg0wDKdx0WqcB1FVqCmAWqZTnJtkY/32kvrAEvRIIFdY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0JEwLxBUFoM32VuR5pk9vlqKftNLjpewVKsaRbHsbGJCsd6nO
	FcNu57wzWq2zYdqQySayTtSdQmVkB7x48vB2SNbh8CuhreJsuMCknIa/
X-Gm-Gg: ATEYQzytvI6NJmAvyz+MhIWkV28laUzOk4/MH0/uFazJi5N7dbiFdzf1cyBsGf8WR2t
	R2GcRu4xaF+YrsNapKMgpC1SAgGKnkXnjhGofqWS3tbO8fUe8z/57UMYIKAnvebOq2tmsx8bFeu
	omMrWWKC30nL5CybqgtJtvCv/EQ6xAUemlTOvqkj34Rdm2EOMMAjrmPTkc63zGQ5mmkcINum8zL
	nLZ3mRVGjRc5ZiiBH9QLPR6+ibaPhIJyDzLgqiU2Okrl0kWstB5lePklND6hAD+OXBx1CZ/IPjS
	T5J3PcAOgUZIQmbU2aLVFra3L+FcB+uhVZwlSFyDdxhQLgOvufG5Dd2CbcDdQIvZtVYLS4GKRu8
	4Po75ArnlILvPDxzb4WwpGhTkP0fFGxHrmME6zJOcMitvBcoW5lNxXbnR3NBrF74cHcot/Lc7JZ
	mOAXRX1pt9sGPxN2zVFYn6bYWSjr24XLcxmcA=
X-Received: by 2002:a17:907:394:b0:b97:7157:e1d8 with SMTP id a640c23a62f3a-b982f362ce4mr278337366b.31.1774073363501;
        Fri, 20 Mar 2026 23:09:23 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f88d02sm241345266b.14.2026.03.20.23.09.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 20 Mar 2026 23:09:22 -0700 (PDT)
Date: Sat, 21 Mar 2026 07:09:19 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Message-ID: <20260321070919.1687f991.michal.pecio@gmail.com>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35269-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CAB672E3870
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 09:49:32 +0100, Neil Armstrong wrote:
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

Hi,

AFAIK that's the ID of uPD720201, while uPD720202 is 0015.
At least that's the case with mine and what hwdata says.

Regards,
Michal

