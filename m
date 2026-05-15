Return-Path: <linux-usb+bounces-37475-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB3BKoHbBmoxogIAu9opvQ
	(envelope-from <linux-usb+bounces-37475-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 10:38:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3DD54B7B5
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 10:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 976173024031
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 08:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DE131A56C;
	Fri, 15 May 2026 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6af3o+k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776EB3C1987
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834267; cv=pass; b=SicZ5i6QUGYyZuE7Qcd/SD/5vPzZGKbKrJmv+n4jNUDd6SMxLksJy4fgWxfFhk9BWC387dkE2YgMTwM8Oby0MZ63BsUk23GOKhOSHASQySvm1SlYTH799yES5EN492Xdh9Ec17/Sv5pMvchk/4WKu21XWl2adiv1XlzDtotkYeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834267; c=relaxed/simple;
	bh=unrCV9BlS+NT2H9YcNFBIBdPF5SnAoNci8LrnilLGqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X1CgoT83ntJ8g8I0ibbNLXOqV6Nfy6gjUT4dKNW8B6oQw8gai+m7mR0OaRjI0LA8j1OksjB6iZzMx8Lj4E0DWhS/ld62gyltfqnGiBvPQt9ZPzMsayLo9Z5Q70ckzMi6bE5sus3CP/al+bER+8EcPIli/SeB7dYS4NtQqdrpRks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6af3o+k; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f3c623322bso15205738eec.0
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 01:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778834266; cv=none;
        d=google.com; s=arc-20240605;
        b=OatCPBDoS5v9M+zFJ8qyodaR/nxLsADyI/MBXLajYQwzjv62jitCOPmCxxFqO99S9j
         xXhfv8Q+yJdqljTl8fdrNipJrvIDgmwTYsqvyRg4UZJ4jDbvlhGu5c+ZlGCIMVEl1Lv1
         n0LCpNtsyESFcX/VQ+5tPJdp9f7zIuIoeijZH9ggx1+VjWnupO1sphDFOFGSrrYGALES
         SE4XX6cZ1MpXBvkA96FGrH5d9jaC7L/4ex75kaAOADHYzxMdKZNJcZhp1xO/dYozjXyJ
         MMHreikHjIZBKIYdOrugR97qUJN6CJ+aFDcYDMmeiV4WpswERWubg56na+Fj9wDoKCmS
         KBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Me5hEq/uVA2vry/WusH3UXPaCOwfFKJKOpGLMOeOsm4=;
        fh=G8Dfht7zqC+OA2ycxkgG96qBpVN1rxLzHOxotvGSqtI=;
        b=D2KMtX24Ar1rkHnW9YN2Y3fB+JmadJxbBwKNbsfIceIoKyh1DJSorvKQKdLyECy7tk
         l3eg5Ua23/hkDbLMSJwAgT4MGN16K9OOwYq0q4ZUefhmd6AHYTE+vA18bKskYY4S5IIe
         gS57g3AOBW7NkqCD0qATsNJ9ZGL5tACg7VFX5TPzpf6vnci3G1U8P0hQCHmfyj/rC/Mb
         qvHi79EblGMX6oaP3dCNAHXGZoJEmZh39FTGgYQCUsPQRDloFoBO8ZbiwXYJq6d1jrzw
         CDWnytM1oE8HPW56X03PIOgnUcQnC/DSIDE1zi+paLx6Uprfn26a0d6MoVCZ7cqvXBtM
         1+KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778834266; x=1779439066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Me5hEq/uVA2vry/WusH3UXPaCOwfFKJKOpGLMOeOsm4=;
        b=J6af3o+kBsvRvTtp5InCk67+NlrHIgODsJqzwPQ4eeD/BCnyKtt777pgo+ofAPURgL
         HzF6jMMLQnZwqvEoSifIHHtDcnqLkg6tfXFJUMNbt9wOlNkvosQUL6rDxtj5EHMRtLiW
         ZSCWHveKvVYdi/LPIbok9bDg3toxM2bFzpJqtF51ebmOrU+3nQM18F81oojcUr+8CwcR
         NKVd7SskLjzvNNJ5ePGlIbeneLV81gyGLhDuLs0MTDHogUxdE/GLW6nkBHrybnLzlgy9
         HPz0FxaBnNMkD7G/1UMHm15/7xFBqsuWpGyGV03ic1+IxCMQw46To/ZPmsY8SN2Xg4oJ
         RrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834266; x=1779439066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Me5hEq/uVA2vry/WusH3UXPaCOwfFKJKOpGLMOeOsm4=;
        b=BUYIeEeWkNDS1pSDRpFyDDRiyrJm4bQhRltfLZ2JxLg9aESDITd7B2nf8Cm6KfjpPp
         XhItrESBZTmABu9RFk2t0dz9dO0PhP88Y80GoX9v8GfBiHtzyL0o6CGKgHAmE98lkLKq
         VczX99n5MoDQkfiaOGJxet/PapWaHVi3ZGmRg6YJ4MUW3EJMnJC2qBWD3tiND+zSRMDA
         j5Wtu0slzuTucLxWzQTM6GM9lE5wHXwcYHfsvuOfN6JLP7bhrBwHMnHGBK6YU/ZsOaBL
         s6tuGVyvgIlQdOsfexyB8j2IFAe/n4ucMN4CbaLCaUlGmfRG+M0G+Xfqdd0F67KrgKTg
         pA3A==
X-Forwarded-Encrypted: i=1; AFNElJ8PGERr+gaoNXhBKApwQCZdNuR1spx2Tif/jOSg5U2JVAMv4wptResWUrewwY/XXNCkXKyU78voceg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysr3X84AudKOIA+qPxtGh3q9wW5rgldbB0oI819HWHVgNORqC1
	SIPJGysxK00wjwRRG9sXhjtG/kfDJ0IltNuJWy2dkRfaYoIhxbjXDpywYv5/umC2UTqdiFakV3l
	HBjH6cOn3eNYIxxvRDrm4wi6nzO4zwqM=
X-Gm-Gg: Acq92OF7IathTsVrWjS97NPuonMh4qoQVpGcpEvOSSCFJyvhUl9LNqNhvr4chziUm1D
	93liRj+aZPeQ/G4AeYGgiVjnbfvEmSNGLbq3MsFonq/5K9OgQCmQTTzDq4RLBgjRwGp5jv4XzPG
	sJk7tMP20P3JUL8Dk7578FPl926cKvQS2UTgHc0g1mGArxnlNRjuZDUJ5uANl16tgHg9kuaOh8h
	LGHuaMr47zc8vsf3jUTwx2XsHpRd68Dd0i7+vzd9Dgv02FmugGx1XVs8fdDKxGWBmdAEbkEMaG0
	VkAKsbha
X-Received: by 2002:a05:7300:fb83:b0:2ed:ff78:2c12 with SMTP id
 5a478bee46e88-303986b7f00mr1545456eec.34.1778834265492; Fri, 15 May 2026
 01:37:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-6-clamor95@gmail.com>
 <20260515-utopian-malamute-of-patience-367e8e@quoll>
In-Reply-To: <20260515-utopian-malamute-of-patience-367e8e@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 15 May 2026 11:37:34 +0300
X-Gm-Features: AVHnY4LfeFEmg-csCdRMVtN73Y-dqI06XuWSB80BMJnQTmRPDx1qbsh-tCMg8j0
Message-ID: <CAPVz0n2wrAdU0JKx7eb7uosCcoGayqNchK591VPph-5_nBAMXg@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] dt-bindings: phy: tegra: Document Nvidia Tegra
 XMM6260 PHY
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
X-Rspamd-Queue-Id: AA3DD54B7B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37475-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,devicetree.org:url]
X-Rspamd-Action: no action

=D0=BF=D1=82, 15 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
0 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, May 11, 2026 at 04:57:00PM +0300, Svyatoslav Ryhel wrote:
> > Document the XMM6260 PHY used by various devices based on the Nvidia Te=
gra
> > SoC, describing its usage
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/phy/nvidia,tegra-xmm6260.yaml    | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra-=
xmm6260.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260=
.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
> > new file mode 100644
> > index 000000000000..0346433c9772
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/nvidia,tegra-xmm6260.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nvidia Tegra PHY for XMM6260 modem
>
> XMM6260 is Infineon modem, so any combination with nvidia,tegra is very
> confusing.
>

May you please suggest how to adjust the name then? Thank you.

> > +
> > +description:
> > +  A hardware configuration used in Tegra SoCs to provide proper intera=
ction
> > +  between the application processor and the modem, as well as control =
over
> > +  one of the SoC's USB lines for the modem.
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra-xmm6260
>
> Also here.
>
> What sort of phy is this? So far looks more like a software construct.
>

Infineon XMM6260 does not work as an ordinary USB modem, it is a
standalone CPU which just exposes itself to AP via USB. In order to do
so, it has to have control over a USB bus of AP which is dedicated to
it. In case of Tegra - XMM6260 interaction it looks like this: second
Tegra USB controller is set into HSIC mode and is dedicated solely to
the modem, modem controls this USB bus. Then the main XMM6260 driver
performs power and init sequence and once it is ready it calls phy to
register controller. Phy has its own supply, controls USB controller
de/register and using enable GPIO sends signal to modem to proceed.
Additionally, since some XMM626 versions have a few steps to setup
exposing different USB devices, phy handles controller reinit for each
step. If treat XMM6260 as an simple USB modem it will never init.

One more benefit of having PHY is that modem driver itself is generic
and PHY handles SoC specific configurations required by the modem.
Since this modem was used on a variety of different SoC's (Exynos and
OMAP for example) they can reuse modem's driver and provide only PHY
which handles modem interactions with the USB bus.

> Best regards,
> Krzysztof
>

