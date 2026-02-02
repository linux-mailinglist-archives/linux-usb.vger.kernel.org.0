Return-Path: <linux-usb+bounces-32983-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLVbN0FGgGkE5gIAu9opvQ
	(envelope-from <linux-usb+bounces-32983-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 07:37:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B1BC8D94
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 07:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F35BB300E3B3
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 06:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9108B2FF66B;
	Mon,  2 Feb 2026 06:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXlsj/AS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B272BEFF5
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 06:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770014247; cv=pass; b=uTIBbNW3g6E2Egv81qbIm44JBcilKRS31bZ3f1jJSW9lBOphA9Y1sXvALfxZ90xBD9OVWWkjeuHKE+HtJ3V9k1iebR49m9yx3vkmqNq1pPqSyDxCaTHJ1VDIp3LfkiJhJCnYYjg2ZSoQv6o6Km+YeTVbz0uBxTwmV3eDpvpKSHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770014247; c=relaxed/simple;
	bh=Nl8uyUJXC0VzLngiHNWi/6UZXa0fOp8/nsYfK0davAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqCMpnLRMwPh/cICpn4CdxuRzOXb2fOD8YxkryKQ5gwu7gCrVKC56OYW7AnZpHWw38k/dbtYYjpZ+9rjn5vfadBxH676iF2ijVS7acM5hzGpiZP0SsAuKU5RSHQB4G+05VtE1mRgzyaPRwlIL1dJyNXcuQ8ah9zYkisiHiMb8XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXlsj/AS; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee2715254so21015455e9.3
        for <linux-usb@vger.kernel.org>; Sun, 01 Feb 2026 22:37:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770014242; cv=none;
        d=google.com; s=arc-20240605;
        b=CYhyY6d3KjKnpFc6HEu/wzza0ZeqJl4L/spJK82/6Exznet4W+KLDWCqToL+rlNke0
         STZMRHhgzh+Y9RoJozUuiGh6713sCZzeDW3gXjVxdV8AcKogwlnC5A0YIFeTsGD7kFMP
         OSMDz4kIGehiHP1u68/7/7ez8xFwitkc8Ckoi/ozaB6srj6aH9IjSKXi9wnYrhCwnpRK
         ICwGcXZEuO5T44aqVxzY1qzIcOtejHN3o7My0Agw63PwoH7ObIE4AkaiWajX4JvZzkle
         JSWNEJiRXn7cD4RqenE04r+4GqyHz15K4c6xGhFZxgCG0WS5xPro0pCViwquyBk4nX7l
         0PMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lor3X4s98Ua5ImhfgoOaSmmKUt0qSCDA5jI10QPNc8w=;
        fh=IxUGzRTHF6ZlMs3d916+mvsl5Qr/DttnF/AhuB/erCc=;
        b=bceVP3JCuz6RiENeSSBLK+M6qnR3UKkHwwSU7gdj5ZVUJDQ6AdgiyvQocdUK5QgfJ+
         W7YF3kT+D5dK7lTvm/RQR+W5ASup1P6yV4Li6JX5cxNTy3iIR5DroA84FWsQDC2dlj2N
         IUAGdREaXLaWJa+AUKVi/9PtTcGefcOABlcfwnuRs0h0Y+XGScXGg0Gu0HyxlCXxIQjf
         COW7HBXduUkaCOAbrFImzrKwUlBhzFKm8a6d7p7glcoqg2b/xrogo/ZF071B3uTuJKZz
         Y7zzdF53iPC2ysYm+aGLCXjBlvqDcpXmckNTR2v+n7SnL+n7i7xEqEsYw8p6DK/of0Pf
         0TxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770014242; x=1770619042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lor3X4s98Ua5ImhfgoOaSmmKUt0qSCDA5jI10QPNc8w=;
        b=UXlsj/ASGy1SBiJ5fSrIjNP2MMAjb+QZC5bThMiW17CNmTYRjRRYoWlAuv7ysJB/Nm
         YWTVqiAdF45kdnMeu3JaEoyWbYTeLDzluas1rRbnDsVm0nIUT0blLxHfarhdZIIBPx39
         SpSPX2jX+QpKiPsX669HSkTGhJkE/6ut17kYsvhOTlpRMgpD4pzpKWCz7DKtoSId8mrh
         IYXlTg4qr5ZYQjc81FooflBnae5TSTRWeBNfSAGKgS7aELUWjNqF+IQlGOvUHW43wEz/
         //ebj0S1EdSerWRTPpDgW98zkMvWZqSlSChC2lYcJOf/6cE9DC7z4oLSkSQkEeAac3DM
         jGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770014242; x=1770619042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lor3X4s98Ua5ImhfgoOaSmmKUt0qSCDA5jI10QPNc8w=;
        b=dfWIl+XrkDXg4jCTCy6RHMKcLj9Ffl9q6qqXpfVi7zPKiXs71kbBzVcEU4zW6qnDct
         BpkoUsoG2ngPbj9Y5JeQrj77U5tEOdRnJ8xFNKjQsLGe7/Rac7RaC2gea0idW4flclOX
         MrkUyzJ8IXrfLmTKO1G4WK6hx9gaN1htHRE5J+r1L90ErubT4wtugVS9KFgfQleIjimb
         oCRV9s9yeuLOF7hikUFOH/PZrTAzg1U9sAwZ1mR5ib4KVqh4Mfgy3JaJiCkUQpCgAx3d
         x4/08cc95W9oNwgCJzFHYlUyIvXtYfsZAFyUKKYtpra2dhWmV+qYDPQ98y1/yNFK1CMX
         Itww==
X-Forwarded-Encrypted: i=1; AJvYcCW/9zNjnUZxS0sN2sJPMsDzdEXuS4mh17GW7d0CUKIyscDCiazqCm6DZmJP6wUbQgRt7EXuRa4OJBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLDKWBFtiO2RMW83V2xzmaI5Oz+zEGN5WbuRVPPJZmBtb5WOsP
	Nc54oaQml1hb+FN3FAevHafA+6B0OCg2HsJ+iwsTv0kiDPTEgFmQQmDp/AprBzou+RuMafgcEAm
	fY0Fce1cHDriFIzUwfBPSWjoOaUeUxsA=
X-Gm-Gg: AZuq6aKA+h1UVuB+5Y7NSBU+tTl7QB1wMX2Xd6oZk5CHjrKDeP9yBpEHhIqgDiiW6aC
	nD5PnsG3mbcuOfriO9Q4LM3cnfDFN2Z6LJNDiUp1WNu84LpOn4M4V5GKVYrmXdjG+AvSQbL52Pn
	PZzi4woz+YP6LIgifgxSyFKE1z5rdLP/IPLLN/QhrDFAxHnotdFNvdGQCxeZnQnsh4KvChCSjGZ
	DxN0aUc0YvlJqA6GxN0DGbcjY+Fz4DYjOQgygAKLl2Z053UiL0Qor6TD4seKziEVpn0G8Hg
X-Received: by 2002:a05:600c:3f16:b0:477:58:7cf4 with SMTP id
 5b1f17b1804b1-482db4592c2mr143060025e9.4.1770014242018; Sun, 01 Feb 2026
 22:37:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122151125.7367-1-clamor95@gmail.com> <20260122151125.7367-3-clamor95@gmail.com>
 <3677292.iIbC2pHGDl@senjougahara>
In-Reply-To: <3677292.iIbC2pHGDl@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Feb 2026 08:37:10 +0200
X-Gm-Features: AZwV_QhP6wXRpUYrhERErf96YXJlxuHljwVi8KGVaO3DHF2zQpdRnwPJINCzez0
Message-ID: <CAPVz0n0Enr0SNoVXjPyROhj6s412OEczQp+bgY9TGiEekpjW7A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: phy: tegra: add HSIC support
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32983-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,nvidia.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 34B1BC8D94
X-Rspamd-Action: no action

=D0=BF=D0=BD, 2 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 06:07 Mikko=
 Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, January 23, 2026 12:11=E2=80=AFAM Svyatoslav Ryhel wrote:
> > Add support for HSIC USB mode, which can be set for second USB controll=
er
> > and PHY on Tegra SoC along with already supported UTMI or ULPI.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/usb/phy/phy-tegra-usb.c   | 249 ++++++++++++++++++++++++++++--
> >  include/linux/usb/tegra_usb_phy.h |   5 +
> >  2 files changed, 243 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegr=
a-usb.c
> > index afa5b5535f92..4f0fde33647e 100644
> > --- a/drivers/usb/phy/phy-tegra-usb.c
> > +++ b/drivers/usb/phy/phy-tegra-usb.c
> > @@ -29,17 +29,26 @@
> >  #include <linux/usb/tegra_usb_phy.h>
> >  #include <linux/usb/ulpi.h>
> >
> > +#define USB_TXFILLTUNING                     0x154
> > +#define USB_FIFO_TXFILL_THRES(x)             (((x) & 0x1f) << 16)
> > +#define USB_FIFO_TXFILL_MASK                 0x1f0000
> > +
> >  #define ULPI_VIEWPORT                                0x170
> >
> >  /* PORTSC PTS/PHCD bits, Tegra20 only */
> >  #define TEGRA_USB_PORTSC1                    0x184
> > -#define TEGRA_USB_PORTSC1_PTS(x)             (((x) & 0x3) << 30)
> > -#define TEGRA_USB_PORTSC1_PHCD                       BIT(23)
> > +#define   TEGRA_USB_PORTSC1_PTS(x)           (((x) & 0x3) << 30)
> > +#define   TEGRA_USB_PORTSC1_PHCD             BIT(23)
> > +#define   TEGRA_USB_PORTSC1_WKOC             BIT(22)
> > +#define   TEGRA_USB_PORTSC1_WKDS             BIT(21)
> > +#define   TEGRA_USB_PORTSC1_WKCN             BIT(20)
> >
> >  /* HOSTPC1 PTS/PHCD bits, Tegra30 and above */
> > +#define TEGRA30_USB_PORTSC1                  0x174
> >  #define TEGRA_USB_HOSTPC1_DEVLC                      0x1b4
> > -#define TEGRA_USB_HOSTPC1_DEVLC_PTS(x)               (((x) & 0x7) << 2=
9)
> > -#define TEGRA_USB_HOSTPC1_DEVLC_PHCD         BIT(22)
> > +#define   TEGRA_USB_HOSTPC1_DEVLC_PTS(x)     (((x) & 0x7) << 29)
> > +#define   TEGRA_USB_HOSTPC1_DEVLC_PHCD               BIT(22)
> > +#define   TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC   BIT(2)
>
> PTS is an enumeration, not a bitfield, so I would say '4' instead of 'BIT=
(2)'
>

Noted

> >
> >  /* Bits of PORTSC1, which will get cleared by writing 1 into them */
> >  #define TEGRA_PORTSC1_RWC_BITS       (PORT_CSC | PORT_PEC | PORT_OCC)
> > @@ -51,11 +60,12 @@
> >  #define   USB_SUSP_CLR                               BIT(5)
> >  #define   USB_PHY_CLK_VALID                  BIT(7)
> >  #define   UTMIP_RESET                                BIT(11)
> > -#define   UHSIC_RESET                                BIT(11)
> >  #define   UTMIP_PHY_ENABLE                   BIT(12)
> >  #define   ULPI_PHY_ENABLE                    BIT(13)
> >  #define   USB_SUSP_SET                               BIT(14)
> > +#define   UHSIC_RESET                                BIT(14)
> >  #define   USB_WAKEUP_DEBOUNCE_COUNT(x)               (((x) & 0x7) << 1=
6)
> > +#define   UHSIC_PHY_ENABLE                   BIT(19)
> >
> >  #define USB_PHY_VBUS_SENSORS                 0x404
> >  #define   B_SESS_VLD_WAKEUP_EN                       BIT(14)
> > @@ -156,6 +166,58 @@
> >  #define UTMIP_BIAS_CFG1                              0x83c
> >  #define   UTMIP_BIAS_PDTRK_COUNT(x)          (((x) & 0x1f) << 3)
> >
> > +/*
> > + * Tegra20 has no UTMIP registers on PHY2 and UHSIC registers start fr=
om 0x800
> > + * just where UTMIP registers should have been. This is the case only =
with Tegra20
> > + * Tegra30+ have UTMIP registers at 0x800 and UHSIC registers shifter =
by 0x400
>
> 'shift', or 'are shifted'
>

Noted

> > + * to 0xc00, but register layout is preserved.
> > + */
> > +#define UHSIC_PLL_CFG1                               0x804
> > +#define   UHSIC_XTAL_FREQ_COUNT(x)           (((x) & 0xfff) << 0)
> > +#define   UHSIC_PLLU_ENABLE_DLY_COUNT(x)     (((x) & 0x1f) << 14)
> > +
> > +#define UHSIC_HSRX_CFG0                              0x808
> > +#define   UHSIC_ELASTIC_UNDERRUN_LIMIT(x)    (((x) & 0x1f) << 2)
> > +#define   UHSIC_ELASTIC_OVERRUN_LIMIT(x)     (((x) & 0x1f) << 8)
> > +#define   UHSIC_IDLE_WAIT(x)                 (((x) & 0x1f) << 13)
> > +
> > +#define UHSIC_HSRX_CFG1                              0x80c
> > +#define   UHSIC_HS_SYNC_START_DLY(x)         (((x) & 0x1f) << 1)
> > +
> > +#define UHSIC_TX_CFG0                                0x810
> > +#define   UHSIC_HS_READY_WAIT_FOR_VALID              BIT(9)
> > +
> > +#define UHSIC_MISC_CFG0                              0x814
> > +#define   UHSIC_SUSPEND_EXIT_ON_EDGE         BIT(7)
> > +#define   UHSIC_DETECT_SHORT_CONNECT         BIT(8)
> > +#define   UHSIC_FORCE_XCVR_MODE                      BIT(15)
> > +#define   UHSIC_DISABLE_BUSRESET             BIT(20)
> > +
> > +#define UHSIC_MISC_CFG1                              0x818
> > +#define   UHSIC_PLLU_STABLE_COUNT(x)         (((x) & 0xfff) << 2)
> > +
> > +#define UHSIC_PADS_CFG0                              0x81c
> > +#define   UHSIC_TX_RTUNEN                    0xf000
> > +#define   UHSIC_TX_RTUNE(x)                  (((x) & 0xf) << 12)
> > +
> > +#define UHSIC_PADS_CFG1                              0x820
> > +#define   UHSIC_PD_BG                                BIT(2)
> > +#define   UHSIC_PD_TX                                BIT(3)
> > +#define   UHSIC_PD_TRK                               BIT(4)
> > +#define   UHSIC_PD_RX                                BIT(5)
> > +#define   UHSIC_PD_ZI                                BIT(6)
> > +#define   UHSIC_RX_SEL                               BIT(7)
> > +#define   UHSIC_RPD_DATA                     BIT(9)
> > +#define   UHSIC_RPD_STROBE                   BIT(10)
> > +#define   UHSIC_RPU_DATA                     BIT(11)
> > +#define   UHSIC_RPU_STROBE                   BIT(12)
> > +
> > +#define UHSIC_CMD_CFG0                               0x824
> > +#define   UHSIC_PRETEND_CONNECT_DETECT               BIT(5)
> > +
> > +#define UHSIC_STAT_CFG0                              0x828
> > +#define   UHSIC_CONNECT_DETECT                       BIT(0)
> > +
> >  /* For Tegra30 and above only, the address is different in Tegra20 */
> >  #define USB_USBMODE                          0x1f8
> >  #define   USB_USBMODE_MASK                   (3 << 0)
> > @@ -174,7 +236,8 @@ struct tegra_xtal_freq {
> >       u8 enable_delay;
> >       u8 stable_count;
> >       u8 active_delay;
> > -     u8 xtal_freq_count;
> > +     u8 utmi_xtal_freq_count;
> > +     u16 hsic_xtal_freq_count;
> >       u16 debounce;
> >  };
> >
> > @@ -184,7 +247,8 @@ static const struct tegra_xtal_freq tegra_freq_tabl=
e[] =3D {
> >               .enable_delay =3D 0x02,
> >               .stable_count =3D 0x2F,
> >               .active_delay =3D 0x04,
> > -             .xtal_freq_count =3D 0x76,
> > +             .utmi_xtal_freq_count =3D 0x76,
> > +             .hsic_xtal_freq_count =3D 0x1CA,
> >               .debounce =3D 0x7530,
> >       },
> >       {
> > @@ -192,7 +256,8 @@ static const struct tegra_xtal_freq tegra_freq_tabl=
e[] =3D {
> >               .enable_delay =3D 0x02,
> >               .stable_count =3D 0x33,
> >               .active_delay =3D 0x05,
> > -             .xtal_freq_count =3D 0x7F,
> > +             .utmi_xtal_freq_count =3D 0x7F,
> > +             .hsic_xtal_freq_count =3D 0x1F0,
> >               .debounce =3D 0x7EF4,
> >       },
> >       {
> > @@ -200,7 +265,8 @@ static const struct tegra_xtal_freq tegra_freq_tabl=
e[] =3D {
> >               .enable_delay =3D 0x03,
> >               .stable_count =3D 0x4B,
> >               .active_delay =3D 0x06,
> > -             .xtal_freq_count =3D 0xBB,
> > +             .utmi_xtal_freq_count =3D 0xBB,
> > +             .hsic_xtal_freq_count =3D 0x2DD,
> >               .debounce =3D 0xBB80,
> >       },
> >       {
> > @@ -208,7 +274,8 @@ static const struct tegra_xtal_freq tegra_freq_tabl=
e[] =3D {
> >               .enable_delay =3D 0x04,
> >               .stable_count =3D 0x66,
> >               .active_delay =3D 0x09,
> > -             .xtal_freq_count =3D 0xFE,
> > +             .utmi_xtal_freq_count =3D 0xFE,
> > +             .hsic_xtal_freq_count =3D 0x3E0,
> >               .debounce =3D 0xFDE8,
> >       },
> >  };
> > @@ -541,7 +608,7 @@ static int utmi_phy_power_on(struct tegra_usb_phy *=
phy)
> >               val =3D readl_relaxed(base + UTMIP_PLL_CFG1);
> >               val &=3D ~(UTMIP_XTAL_FREQ_COUNT(~0) |
> >                       UTMIP_PLLU_ENABLE_DLY_COUNT(~0));
> > -             val |=3D UTMIP_XTAL_FREQ_COUNT(phy->freq->xtal_freq_count=
) |
> > +             val |=3D UTMIP_XTAL_FREQ_COUNT(phy->freq->utmi_xtal_freq_=
count) |
> >                       UTMIP_PLLU_ENABLE_DLY_COUNT(phy->freq->enable_del=
ay);
> >               writel_relaxed(val, base + UTMIP_PLL_CFG1);
> >       }
> > @@ -812,6 +879,153 @@ static int ulpi_phy_power_off(struct tegra_usb_ph=
y *phy)
> >       return 0;
> >  }
> >
> > +static u32 tegra_hsic_readl(struct tegra_usb_phy *phy, u32 reg)
> > +{
> > +     void __iomem *base =3D phy->regs;
> > +     u32 shift =3D phy->soc_config->uhsic_registers_shift;
> > +
> > +     return readl_relaxed(base + shift + reg);
> > +}
> > +
> > +static void tegra_hsic_writel(struct tegra_usb_phy *phy, u32 reg, u32 =
value)
> > +{
> > +     void __iomem *base =3D phy->regs;
> > +     u32 shift =3D phy->soc_config->uhsic_registers_shift;
> > +
> > +     writel_relaxed(value, base + shift + reg);
> > +}
> > +
> > +static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
> > +{
> > +     struct tegra_utmip_config *config =3D phy->config;
> > +     void __iomem *base =3D phy->regs;
> > +     u32 val;
> > +
> > +     val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
> > +     val &=3D ~(UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_PD_RX=
 |
> > +              UHSIC_PD_ZI | UHSIC_RPD_DATA | UHSIC_RPD_STROBE);
> > +     val |=3D UHSIC_RX_SEL;
>
> L4T r16 (Tegra30) keeps UHSIC_PD_TX set until after UHSIC_RESET has been =
cleared. Commit message says this avoids a signal glitch.
>

I did not notice any difference with this change and without. Since it
does not affect detection of modem by my device I can apply it (is it
worth applying at all?). Should it be applied globally or for Tegra30+
only?

> > +     tegra_hsic_writel(phy, UHSIC_PADS_CFG1, val);
> > +
> > +     udelay(2);
> > +
> > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > +     val |=3D UHSIC_RESET;
> > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > +
> > +     udelay(30);
> > +
> > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > +     val |=3D UHSIC_PHY_ENABLE;
> > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > +
> > +     val =3D tegra_hsic_readl(phy, UHSIC_HSRX_CFG0);
> > +     val &=3D ~(UHSIC_IDLE_WAIT(~0) |
> > +              UHSIC_ELASTIC_UNDERRUN_LIMIT(~0) |
> > +              UHSIC_ELASTIC_OVERRUN_LIMIT(~0));
> > +     val |=3D UHSIC_IDLE_WAIT(config->idle_wait_delay) |
> > +             UHSIC_ELASTIC_UNDERRUN_LIMIT(config->elastic_limit) |
> > +             UHSIC_ELASTIC_OVERRUN_LIMIT(config->elastic_limit);
> > +     tegra_hsic_writel(phy, UHSIC_HSRX_CFG0, val);
> > +
> > +     val =3D tegra_hsic_readl(phy, UHSIC_HSRX_CFG1);
> > +     val &=3D ~UHSIC_HS_SYNC_START_DLY(~0);
> > +     val |=3D UHSIC_HS_SYNC_START_DLY(config->hssync_start_delay);
> > +     tegra_hsic_writel(phy, UHSIC_HSRX_CFG1, val);
> > +
>
> L4T r16 (Tegra30) clears UHSIC_TX_CFG0.UHSIC_HS_READY_WAIT_FOR_VALID here=
. According to commit message this fixes an intermittent failure to connect=
 to HSIC modem. It also sets UHSIC_MISC_CFG0.UHSIC_DISABLE_BUSRESET  below =
due to same issue.
>

And this change causes my modem to fail entirely.

[   10.145976] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[   10.295970] usb 1-1: device descriptor read/64, error -71
[   10.545975] usb 1-1: device descriptor read/64, error -71
[   10.795990] usb 1-1: new high-speed USB device number 3 using ci_hdrc
[   10.935970] usb 1-1: device descriptor read/64, error -71
[   11.185977] usb 1-1: device descriptor read/64, error -71

I assume UHSIC_DISABLE_BUSRESET, UHSIC_HS_READY_WAIT_FOR_VALID and
UHSIC_PD_TX workarounds are all consequences of how modem in
downstream kernel is called. Instead of relaying on modem to lead the
controller probe, downstream just brutally removes and reinits
controller until modem probes. I have never observed modem not
appearing without any of discussed patches.


> > +     val =3D tegra_hsic_readl(phy, UHSIC_MISC_CFG0);
> > +     val |=3D UHSIC_SUSPEND_EXIT_ON_EDGE;
> > +     tegra_hsic_writel(phy, UHSIC_MISC_CFG0, val);
> > +
> > +     val =3D tegra_hsic_readl(phy, UHSIC_MISC_CFG1);
> > +     val &=3D ~UHSIC_PLLU_STABLE_COUNT(~0);
> > +     val |=3D UHSIC_PLLU_STABLE_COUNT(phy->freq->stable_count);
> > +     tegra_hsic_writel(phy, UHSIC_MISC_CFG1, val);
> > +
> > +     val =3D tegra_hsic_readl(phy, UHSIC_PLL_CFG1);
> > +     val &=3D ~(UHSIC_XTAL_FREQ_COUNT(~0) |
> > +             UHSIC_PLLU_ENABLE_DLY_COUNT(~0));
> > +     val |=3D UHSIC_XTAL_FREQ_COUNT(phy->freq->hsic_xtal_freq_count) |
> > +             UHSIC_PLLU_ENABLE_DLY_COUNT(phy->freq->enable_delay);
> > +     tegra_hsic_writel(phy, UHSIC_PLL_CFG1, val);
> > +
> > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > +     val &=3D ~UHSIC_RESET;
> > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > +
> > +     udelay(2);
> > +
> > +     if (phy->soc_config->requires_usbmode_setup) {
> > +             val =3D readl_relaxed(base + USB_USBMODE);
> > +             val &=3D ~USB_USBMODE_MASK;
> > +             if (phy->mode =3D=3D USB_DR_MODE_HOST)
> > +                     val |=3D USB_USBMODE_HOST;
> > +             else
> > +                     val |=3D USB_USBMODE_DEVICE;
> > +             writel_relaxed(val, base + USB_USBMODE);
> > +     }
> > +
> > +     if (phy->soc_config->has_hostpc)
> > +             set_pts(phy, TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC);
> > +     else
> > +             set_pts(phy, 0);
>
> This (and below) are abusing has_hostpc to detect Tegra30 vs Tegra20. We =
should instead add soc_config fields hsic_pts_value and portsc1_offset.
>
> > +
> > +     val =3D readl_relaxed(base + USB_TXFILLTUNING);
> > +     if ((val & USB_FIFO_TXFILL_MASK) !=3D USB_FIFO_TXFILL_THRES(0x10)=
) {
> > +             val =3D USB_FIFO_TXFILL_THRES(0x10);
> > +             writel_relaxed(val, base + USB_TXFILLTUNING);
> > +     }
> > +
> > +     if (phy->soc_config->has_hostpc) {
> > +             val =3D readl_relaxed(base + TEGRA30_USB_PORTSC1);
> > +             val &=3D ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_WKD=
S |
> > +                      TEGRA_USB_PORTSC1_WKCN);
> > +             writel_relaxed(val, base + TEGRA30_USB_PORTSC1);
> > +     } else {
> > +             val =3D readl_relaxed(base + TEGRA_USB_PORTSC1);
> > +             val &=3D ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_WKD=
S |
> > +                      TEGRA_USB_PORTSC1_WKCN);
> > +             writel_relaxed(val, base + TEGRA_USB_PORTSC1);
> > +     }
> > +
> > +     val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG0);
> > +     val &=3D ~UHSIC_TX_RTUNEN;
> > +     val |=3D UHSIC_TX_RTUNE(phy->soc_config->uhsic_tx_rtune);
> > +     tegra_hsic_writel(phy, UHSIC_PADS_CFG0, val);
> > +
> > +     if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
> > +                            USB_PHY_CLK_VALID))
> > +             dev_err(phy->u_phy.dev,
> > +                     "Timeout waiting for PHY to stabilize on enable (=
HSIC)\n");
>
> Should return error (return value of utmi_wait_register) here?
>

Noted.

> > +
> > +     return 0;
> > +}
> > +
> > +static int uhsic_phy_power_off(struct tegra_usb_phy *phy)
> > +{
> > +     void __iomem *base =3D phy->regs;
> > +     u32 val;
> > +
> > +     set_phcd(phy, true);
> > +
> > +     val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
> > +     val |=3D (UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_PD_RX =
|
> > +             UHSIC_PD_ZI | UHSIC_RPD_DATA | UHSIC_RPD_STROBE);
> > +     tegra_hsic_writel(phy, UHSIC_PADS_CFG1, val);
> > +
> > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > +     val |=3D UHSIC_RESET;
> > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > +
> > +     udelay(30);
> > +
> > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > +     val &=3D ~UHSIC_PHY_ENABLE;
> > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > +
> > +     return 0;
> > +}
> > +
> >  static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
> >  {
> >       int err =3D 0;
> > @@ -828,6 +1042,10 @@ static int tegra_usb_phy_power_on(struct tegra_us=
b_phy *phy)
> >               err =3D ulpi_phy_power_on(phy);
> >               break;
> >
> > +     case USBPHY_INTERFACE_MODE_HSIC:
> > +             err =3D uhsic_phy_power_on(phy);
> > +             break;
> > +
> >       default:
> >               break;
> >       }
> > @@ -859,6 +1077,10 @@ static int tegra_usb_phy_power_off(struct tegra_u=
sb_phy *phy)
> >               err =3D ulpi_phy_power_off(phy);
> >               break;
> >
> > +     case USBPHY_INTERFACE_MODE_HSIC:
> > +             err =3D uhsic_phy_power_off(phy);
> > +             break;
> > +
> >       default:
> >               break;
> >       }
> > @@ -1256,6 +1478,8 @@ static const struct tegra_phy_soc_config tegra20_=
soc_config =3D {
> >       .requires_usbmode_setup =3D false,
> >       .requires_extra_tuning_parameters =3D false,
> >       .requires_pmc_ao_power_up =3D false,
> > +     .uhsic_registers_shift =3D 0,
> > +     .uhsic_tx_rtune =3D 0, /* 40 ohm */
> >  };
> >
> >  static const struct tegra_phy_soc_config tegra30_soc_config =3D {
> > @@ -1264,6 +1488,8 @@ static const struct tegra_phy_soc_config tegra30_=
soc_config =3D {
> >       .requires_usbmode_setup =3D true,
> >       .requires_extra_tuning_parameters =3D true,
> >       .requires_pmc_ao_power_up =3D true,
> > +     .uhsic_registers_shift =3D 0x400,
> > +     .uhsic_tx_rtune =3D 8,  /* 50 ohm */
> >  };
> >
> >  static const struct of_device_id tegra_usb_phy_id_table[] =3D {
> > @@ -1360,6 +1586,7 @@ static int tegra_usb_phy_probe(struct platform_de=
vice *pdev)
> >       tegra_phy->phy_type =3D of_usb_get_phy_mode(np);
> >       switch (tegra_phy->phy_type) {
> >       case USBPHY_INTERFACE_MODE_UTMI:
> > +     case USBPHY_INTERFACE_MODE_HSIC:
> >               err =3D utmi_phy_probe(tegra_phy, pdev);
> >               if (err)
> >                       return err;
> > diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegr=
a_usb_phy.h
> > index e394f4880b7e..4e79f1c2173a 100644
> > --- a/include/linux/usb/tegra_usb_phy.h
> > +++ b/include/linux/usb/tegra_usb_phy.h
> > @@ -24,6 +24,9 @@ struct gpio_desc;
> >   * requires_extra_tuning_parameters: true if xcvr_hsslew, hssquelch_le=
vel
> >   *      and hsdiscon_level should be set for adequate signal quality
> >   * requires_pmc_ao_power_up: true if USB AO is powered down by default
> > + * uhsic_registers_shift: for Tegra30+ where HSIC registers were shift=
ed
> > + *      comparing to Tegra20 by 0x400, since Tegra20 has no UTMIP on P=
HY2
> > + * uhsic_tx_rtune: fine tuned 50 Ohm termination resistor for NMOS/PMO=
S driver
> >   */
> >
> >  struct tegra_phy_soc_config {
> > @@ -32,6 +35,8 @@ struct tegra_phy_soc_config {
> >       bool requires_usbmode_setup;
> >       bool requires_extra_tuning_parameters;
> >       bool requires_pmc_ao_power_up;
> > +     u32 uhsic_registers_shift;
>
> I would rather call this 'uhsic_registers_offset'. Shift first brings to =
mind bitshifts, and we often have fields in these config structs for bit sh=
ifts called '*_shift'.
>

Yes, offset seems more appropriate.

> > +     u32 uhsic_tx_rtune;
> >  };
> >
> >  struct tegra_utmip_config {
> >

Mikko, thank you for your review, since HSIC patches already were
picked into linux/next I will prepare a few followup patches to
address some of uncertainties.

