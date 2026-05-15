Return-Path: <linux-usb+bounces-37476-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEJ5D63fBmqkogIAu9opvQ
	(envelope-from <linux-usb+bounces-37476-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 10:56:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC9854BCF8
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 10:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DA5131676C2
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 08:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D14402442;
	Fri, 15 May 2026 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="is7nxtqS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A856240DFDB
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834403; cv=pass; b=jDTu2IPf9Dakt5Qp3MZB6ShAhOCuGQ+UDsPL38ZE1BTIheSj2s9Lpw4uuv8dR6+W7w/QztZ1XkznAScf3AzXlpjJreRxW5b7Czv8e07UMbCiCfXOaGnxfa5H3X7KAlGOc+PmTkXt+DUy4OrwRkkPXffl5dAFqrPYSvGx23beIIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834403; c=relaxed/simple;
	bh=1lcRrzpWt3IYTyxqjcwZ50t5ZeMwNrUNQTJrko/WnXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqdBn6sqVDFVBrt91OaUlij8cX5tkTswO+sTIigGdHRsbkpVDjs0ZHJLJL3za9IEDyriIBakM61q3jquOYNpJMyNE9xuguFIw7Oq1NpXwgbGnSga7kaHmcJNC3XD+FQpbPrUXgmSeKow4B+xxMDK4Vaz3uO6yGTUpEksIQPnE8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=is7nxtqS; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ee990e8597so15189385eec.1
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 01:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778834401; cv=none;
        d=google.com; s=arc-20240605;
        b=ABgjkIxuDmCljtwODGOKsuWFxVnRur/ZslC3z8XKhFZ565dooOqSdjRkHP+64FNpyD
         ZirV38QjhCNkhrR/JEQ1iye4cklHJ3UT9dKwbGRu2irUUyOXDxB+FUNRYqeyolX5f7Nm
         FM/Qe6K/hJHRRq4YOHfFg0ITfAWn3eiYsOL3rO2i+ZaB7shHKaSKghpY3rpu27R1s6xT
         wAgKPkgRqfTEK0FHFGZ588sQoKgUDL2iK8kUJhEAMaMlYHV2vBlJlWmsk4JCvBMK9zA4
         xG/yUCDfoAJTPHmPulv0IzZHiQdLSLZ03zPE0TCIQ9ppK0jKPWuwPseNhUBLpAk23F0R
         9iPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V9o04x0HaWnrCGllcDop+2XHXFTs0K8A0nGkD2mPC7Y=;
        fh=qxhOb3f0xodUxz0lsVGDgCIRkxEzvNdng8L7TLDYE+Q=;
        b=KGGaR3XtKDNaATWwERZSdqbYMDeYa5cTwGQl4qdmU/ifshFlBw9XpK/dtdT8oKHjlJ
         WTY3414ENIo25xxjlvIf91ny8S/t0nMCIKGkL/iMrnbM3GUXbpdGbWjz9zPqDhWmZrVS
         eWdzuZoDucDSDfTmlXEqEQX1iLlwK1mKfmKj6fc1LErhEb8QldFOfOyYiYBNJQ0sMgUw
         jKY1AvxBrK0QK+UObG9Q7lEoq6QzMOEZ66oL0vKDVyMg1WQrvltAsT6OAVdreUzT2jKf
         E1eN9RE1p07Wq9/wXegnjxSy9vNoOIUGPJwU1hpT3Ec36BfgUXPO10RH0GsRDpUtifLE
         aXKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778834401; x=1779439201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9o04x0HaWnrCGllcDop+2XHXFTs0K8A0nGkD2mPC7Y=;
        b=is7nxtqSJzzSE1pIDEQia6X3GSzhFzuBSbS/XUZb/kHd9ERKtuHxKogbrcbJ5GUkNb
         27AYr1G27EkQ/WlQHWkPcWk2sgv7RHeoHkgM+jgiesZPmndMf74tJLUystiYEsPOZzKD
         qrwZhTSICUW9/gXkg6p1bOgYxNGHV92nIorQQcCQWMBs1/nZhbrAiTrh2aNY+vM1rw6G
         h8t0tOp3nMEY5qcXy1+28v2lA+/X2h4SOFTWUc0ML8oTxj5RFr4AOr6hkQDAXy9a4xgo
         B2GTvjziYm5MskgdWfnkp8O3gC+dXWdS72lkrkG0+s+MeyOr1XEWdqzofVqak63doJda
         qAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834401; x=1779439201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V9o04x0HaWnrCGllcDop+2XHXFTs0K8A0nGkD2mPC7Y=;
        b=E28IsWod7/SPiR2HFn1YycDsOGKV9u3ouHySJJKl0O+o8rK5eTBoWJrJJj+XsoNPbO
         4gSZT+JDy9VVzsBL6G/bcfy9HnNJh+rg4TLvtEoHWoyM8mn8z2EvSC9ddwXu2ujw2ul3
         vCAIGlBCjWrmpBM9lATvuY1bYIwZZUD3EforpBEXk1r5KrUweqwH7vdCFUMP3v6WC9uK
         aZsFzuKB9aBydCeUMxKsgNvPrMShGhG8JrpeilcMZZgqWevG6bK4B7j/VUYG8zQ8fV+a
         W7qh8ziHwfNxFy3mMghIZ2EHeetwV79IP3v/ZS+sUfjjGOq4lKwrzsFb9s857ocEtPHg
         jtmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hksruc2fmz2Lglh6jbujf4I1O5E/Z4JU9AQ79Xu6QKXCyj/bBFdw+BK1blUxwXM//vXGgo1UoZf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwecpsf1tS8iILilfR9NH4C4CWIFE4xa6nGdZ5xaHwUHWgONWG
	5IQIduChsJvv3LIGSFqYFZCkE5Sh/zRXbxH58pvwTZZAjHmSF8NdyLmuu6W9SGD9qjUqQSwKV3m
	k1x8hTfz22Fv67m6HzPE5MjSHYFyWY/A=
X-Gm-Gg: Acq92OGYgbKUYL7ms6RDtEkne3w6MmxDF8yJIQYdUd5NsmJ+zm+AMh7DlWEZ9kw/537
	JF8yudNC/7eQjNgE0lz1kQOjDH3oU2k6rcRLEv7aWqJ1h41a9VbFTd64tXwHjF+geUK5q6Psw2l
	mthfrJOTQKq/wV0cT/jvh25QFFEs+AsJWa8X1RwwvtbeuYcW8uqggA5tFa1uR2xMwTtEgdMNH+F
	vRuEGgQQjqes6FEY9j2v1ztXtiC7DprX9M7GBUchiau0xUQ7RK+us22RetQbKxsYon+6dn/VHG8
	9VV+oCoU8NjIpAvQU4o=
X-Received: by 2002:a05:7300:a504:b0:2e5:8ec2:82c9 with SMTP id
 5a478bee46e88-303986a15f3mr1535796eec.26.1778834400799; Fri, 15 May 2026
 01:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-4-clamor95@gmail.com>
 <20260515-precious-ginger-lori-d1fde7@quoll>
In-Reply-To: <20260515-precious-ginger-lori-d1fde7@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 15 May 2026 11:39:49 +0300
X-Gm-Features: AVHnY4LhmWA2BwD0V1_j_6xstdiR56JxjkYZue9zoJ3Q1jLukX8MObrLmKvfP2I
Message-ID: <CAPVz0n3mvBLracMWGNuJ8kKUvAVZ+JRTJVkZGyq5MkuSobd8NQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: net: Document Infineon/Intel XMM6260 modem
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8CC9854BCF8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37476-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

=D0=BF=D1=82, 15 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:1=
8 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, May 11, 2026 at 04:56:58PM +0300, Svyatoslav Ryhel wrote:
> > +  ap-wake-gpios:
> > +    description: GPIO connected to the EINT3 pin
> > +    maxItems: 1
> > +
> > +  cp-wake-gpios:
> > +    description: GPIO connected to the EINT2 pin
> > +    maxItems: 1
> > +
> > +  phys:
> > +    maxItems: 1
> > +
> > +  vbat-supply:
> > +    description: Supply connected to the VBAT lines.
>
> This should be rather name of the pin on this device, not the provider
> name. VBAT suggests the latter. Please double check.
>

There is no documentation on this device from Infineon, I have used
schematics of the P895 where this modem is used. According to it power
supply is connected to pin with name VBAT (and yes, I am not mixing it
up since supplies have different names)

> Rest looks fine, with respect to Sashiko comment on description:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>

