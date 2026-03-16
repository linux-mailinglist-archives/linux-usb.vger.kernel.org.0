Return-Path: <linux-usb+bounces-34896-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLrSKNaFuGltfAEAu9opvQ
	(envelope-from <linux-usb+bounces-34896-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 23:36:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4622D2A1908
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 23:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E35AA3096F89
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 22:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2902374E6A;
	Mon, 16 Mar 2026 22:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F3dgDwtL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5529C373BEE
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 22:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700524; cv=pass; b=Lsd6Nf9PFqfRME1bi7RwQB3c+2bzXkgP3VjO52azAVcl1crqQjtug+nyJwb0QPbK1JH5z/3E+6MNz/27OazqyeQ5L/4i7MCCJeSL0aOST0LyRdWU7MpIOBEiXfItxCYs7xyRpJo5FNm2AgKRR+TCRUNScrmVVRoP0B2n0fpaYrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700524; c=relaxed/simple;
	bh=X8mio8kNECrnD7g8Wvz7SSendh1SQnLSxQ5Izt0e38I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BG5VG8oXa0fW6bZ4cSP1OFWKdZ28OAa2MHReYYmAY4STLkg7uY/tFosDJ8SYnatP5sT/Lt8Khg+InUyUJnby+nZrIRidaYp74VJEHOTdsqNzgkj/9KfgGPakhSCG16QOSIc8wFYR91t5UtpyB2QoXA7qeiUu2KqFh2EUGT9Wy04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F3dgDwtL; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4042fe53946so1954848fac.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 15:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773700521; cv=none;
        d=google.com; s=arc-20240605;
        b=ELZeEGAARHa1DSUri5/d0SyhrnGP9MHpyK8J/yDiMDE5y9vfxuwIZjT2oHJ1/7pA9e
         iIuV4Ex8BTM4WSCP5brYyWFI4zmagGTlHuioUJegGzIvkNHTLsjbpQawh6DeOoBOfS6U
         8oR+B9lD7GzGxLoaF4ZGokPLLeRNc+XzJ4Eq6g+WnCHKFr7TjfyfyZX7XuzD8UrD7rI5
         DCGnFP2+yultCGUZtkHfXBanuj9ozYmPHXBMODI17/k/sUOjV17SOniDaDgOQucA6oc2
         F5Fr5fGMOjjMFDzuo+QJooaR9Lp/PSvYp37lehxI9xa5zXF9Meh3Lm0CacViM3RXx6y3
         5bxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xXJC7zDdC8S8kCMXP3Y8fcS1OYO4pKzMyEbES776Ceo=;
        fh=OYPTZ8/2O6qhurVvUyUWd2s9l3+LrncQsqvDl0YV1bQ=;
        b=XATRxR5NNYaji5pVURwjD6iwxsblO+6Vd0bjaFl6NS3AAa0vTu6dGxpGw7H/X+NOZm
         0oQpiuJaqt9g9ZMi7RUCIXnhxqMCfG5CwK8EVxK1XzFlGPmpJnx8tLIy9avfBFSw7iIP
         nuIUmOgJ975ThzyOp214eu/WmfWNlYi6OOx1cD1Ed845wkP5g+ptEylglntikTIdZ+iv
         cPOq2gnGwsFHBSIetUp5vKVw5t0vb7LZWa7hDgkuw8We+EjFf8Dz1tJCqFBBw5lVxhGC
         LoPKfnIPMJwVaxgSUr1CNILF5HNbWPh1vI8DwKiXGvwJ8oGNaQ0KDnX/34nKN9ezFDe3
         Pitw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773700521; x=1774305321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXJC7zDdC8S8kCMXP3Y8fcS1OYO4pKzMyEbES776Ceo=;
        b=F3dgDwtLrnBAuyqB8yb9KL3kqzWbSjfs9g29LwQ6O5YktcSMOYgKeUdkiKqAxBeQVL
         TVn39mOjDeRcP5Zrv7fk5eGziRdgKBzjVmMITHG+xMVKYJPy3HVqiD03QFKJRlifKCk5
         4Yif3Kgan7odzZigeapq4ta/VCz0M7ZpT3BhznmXggO8ZNZtRWJlK86VC0tm7tbzPm9z
         VCSVdvO57jz9x8W/43+CF/2feJSouVQAGFz6bv1mGBY4uu6WAPkEYn9hDL47T6zHNX59
         3KFxi9evdTpiOYN38Yaa/r0AdV+nBChUbK8I1cUPkqzDaanN8VLJNPDOA08TkSw22yiL
         Jkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700521; x=1774305321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xXJC7zDdC8S8kCMXP3Y8fcS1OYO4pKzMyEbES776Ceo=;
        b=gWMNXbUE/TqOfwxODSgbIRX12EQvf3jAypmZMSbgdzpC4KzWWCAoWkPplynbM8fQyF
         IXQgyWqkD6fOpk5ndEM0UVWZfajIh1F9xi0Wps/9jS+KXmiBHeQloDEevP1Ij/A6nDcB
         72AH0dLM1mdMWG2pE6icR47p8Xa8e1qb6AbO44kdPmD9zpac5heEjP1Pca4JiyLdh5en
         f/ZqTdEp+gQTSnDJ5+qp4wOfmBNGBSeSHSlr9XjKBcxu06zUOpqJlYNk1/Vwjj3PE5VZ
         MfUqtOVqa0lKg7qqtJzSEdd12TvFCex8cSlK6YlWX+Ui9n1vh8+XAES+uocQpYM2QEIn
         KObg==
X-Forwarded-Encrypted: i=1; AJvYcCWf3XWHUuH6nxnFBQBn1A9TAadwpF5NxdtxwmIjWakckF390I2s9XvpKWtO02chQ5kaN2YIkO3W0LQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvKzja7E/hJGVSJCsqNmisgL6gItVRn2auQCvnPHWIk7il7yXA
	lHiiTGiecM7/Axr5bbLIYpLfmU37xAHY+7wITIXhxno9w/ov34/x7FhF3MFjf6hgmgfkr/7mN4r
	MvkMhvpINEuTTVemKdML2yEOwR3rCfORhojJNfq8M
X-Gm-Gg: ATEYQzwx/jd+kmkrHfnCFF/YlggasBPlK7F9zBUK3O4wlDqDQyAZSOivqUpr6aFP8Qd
	RLma4r/ljdes8TADw5fht7hnCw1bOpyL88lff+6i5JIGhSU1gbC8kPF546UHMnJ05zMwsi9BVEt
	Y/dJEc+9xHEZMwA4wYTUF7VRaoynQ+WMRnRbzdNCzUAQY+2V4PAJaQvWYAroAZpJTJzCCW9xsBI
	iyynCBHnpAa8Rgc6TtYJTgirL8H0+Yze2IrAIbRKf34971dLelLpqYc3D7YlzMXbEGhjALN7DfS
	76c5CWfUHI5A7xWfSTZ8f6E4G74Te0cC8IV1u/Jp
X-Received: by 2002:a05:6870:d8d2:b0:417:6997:3884 with SMTP id
 586e51a60fabf-417b937a5b8mr8480876fac.35.1773700520937; Mon, 16 Mar 2026
 15:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226055311.2591357-1-badhri@google.com> <20260226055311.2591357-3-badhri@google.com>
 <aa7lRufFIdqHTOMg@venus>
In-Reply-To: <aa7lRufFIdqHTOMg@venus>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Mon, 16 Mar 2026 15:34:44 -0700
X-Gm-Features: AaiRm50O1kImotm_0hiwHA_K6T-xNXS2cyWuaCIPk5eUa8UfYxwzoDudvzje3U4
Message-ID: <CAPTae5LyH1c380+Se16XJ6btysjJnBTFWR-Gw_kHX-T-x6NRZw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] power: supply: Add PD SPR AVS support to USB type enum
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Sunil Dhamne <amitsd@google.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34896-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 4622D2A1908
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 9, 2026 at 8:22=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Thu, Feb 26, 2026 at 05:53:10AM +0000, Badhri Jagan Sridharan wrote:
> > Add two new members to the power_supply_usb_type to represent the
> > USB Power Delivery (PD) Standard Power Range (SPR) Adjustable Voltage
> > Supply (AVS) charging types:
> >
> > POWER_SUPPLY_USB_TYPE_PD_SPR_AVS: For devices supporting only the
> > PD SPR AVS type.
> >
> > POWER_SUPPLY_USB_TYPE_PD_PPS_SPR_AVS: For devices that support both
> > PD Programmable Power Supply (PPS) and PD SPR AVS.
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/power/supply/power_supply_sysfs.c | 2 ++
> >  include/linux/power_supply.h              | 3 +++
> >  2 files changed, 5 insertions(+)
>
> This is missing an update to Documentation/ABI/testing/sysfs-class-power =
.

Apologies, my bad, sent out a v2:
https://lore.kernel.org/lkml/20260316150301.3892223-1-badhri@google.com/

Thanks Sebastian for taking a look.

Regards,
Badhri

>
> Greetings,
>
> -- Sebastian
>
> >
> > diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/=
supply/power_supply_sysfs.c
> > index dd3a48d72d2b..f30a7b9ccd5e 100644
> > --- a/drivers/power/supply/power_supply_sysfs.c
> > +++ b/drivers/power/supply/power_supply_sysfs.c
> > @@ -70,6 +70,8 @@ static const char * const POWER_SUPPLY_USB_TYPE_TEXT[=
] =3D {
> >       [POWER_SUPPLY_USB_TYPE_PD]              =3D "PD",
> >       [POWER_SUPPLY_USB_TYPE_PD_DRP]          =3D "PD_DRP",
> >       [POWER_SUPPLY_USB_TYPE_PD_PPS]          =3D "PD_PPS",
> > +     [POWER_SUPPLY_USB_TYPE_PD_SPR_AVS]      =3D "PD_SPR_AVS",
> > +     [POWER_SUPPLY_USB_TYPE_PD_PPS_SPR_AVS]  =3D "PD_PPS_SPR_AVS",
> >       [POWER_SUPPLY_USB_TYPE_APPLE_BRICK_ID]  =3D "BrickID",
> >  };
> >
> > diff --git a/include/linux/power_supply.h b/include/linux/power_supply.=
h
> > index 360ffdf272da..7a5e4c3242a0 100644
> > --- a/include/linux/power_supply.h
> > +++ b/include/linux/power_supply.h
> > @@ -210,6 +210,9 @@ enum power_supply_usb_type {
> >       POWER_SUPPLY_USB_TYPE_PD,               /* Power Delivery Port */
> >       POWER_SUPPLY_USB_TYPE_PD_DRP,           /* PD Dual Role Port */
> >       POWER_SUPPLY_USB_TYPE_PD_PPS,           /* PD Programmable Power =
Supply */
> > +     /* PD Standard Power Range Adjustable Voltage Supply */
> > +     POWER_SUPPLY_USB_TYPE_PD_SPR_AVS,
> > +     POWER_SUPPLY_USB_TYPE_PD_PPS_SPR_AVS,   /* Supports both PD PPS +=
 SPR AVS */
> >       POWER_SUPPLY_USB_TYPE_APPLE_BRICK_ID,   /* Apple Charging Method =
*/
> >  };
> >
> > --
> > 2.53.0.414.gf7e9f6c205-goog
> >

