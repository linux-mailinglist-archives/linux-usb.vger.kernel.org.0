Return-Path: <linux-usb+bounces-19054-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CE0A03734
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 06:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C7001885A3F
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 05:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A519D198823;
	Tue,  7 Jan 2025 05:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ffJEh4El"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519FE86333
	for <linux-usb@vger.kernel.org>; Tue,  7 Jan 2025 05:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736226450; cv=none; b=jpEWiJ5mzlUwMkDIikjAUsqA9YVEvtmyPGVmEEu3jrBVh90mhd357RCa1kxPWsZxflsRqCJx9pop53u71jr6InCcuX4Cn4SDLaRmBGJ2DDBG8dJ1aRM+Zw0VBhw5MHAVa5ILOt3flrEtHjc8pb6LChldbenr6bzsh9plZOcuvDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736226450; c=relaxed/simple;
	bh=5CP7AYBFYldUTPv0nXYC7fTAHe3Txi/4IWin675cIyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyMlCqc0KLZMl2813i09mfjKkowyBwPJ4O4kOry692OzHaCTmEpDRFwoZh+6PE0wqquNB8C7Rf/SbKULbjlpfDymN4rdFL/xCmrbWs3y5yqoirfH5gkY49tZdTNcsy5xFlVUyajtta8UZVfcMYu6UBw9QYarc6O0JkHZ1kY5408=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ffJEh4El; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3022484d4e4so183391361fa.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Jan 2025 21:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736226444; x=1736831244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wg678tNAXdRZkkapitg96TNog1Ghit92yl5gbeQUJs=;
        b=ffJEh4ElIt02mwYUg7ALqCcbKoyQYxCqDZqEzf8jjXAa7LujHEFOgoT5ycl3xp82TD
         H32sLn8NHkbXkKf0l3K5Bn9Ylcizms5g4781oFzyiOACr4EtsNO5owZhtx3v3xzVMQAc
         KfAX9QCYXt2IpGLwvC1PQsWu3XRbqqGTxzxMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736226444; x=1736831244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wg678tNAXdRZkkapitg96TNog1Ghit92yl5gbeQUJs=;
        b=FhgKI9KpJVt7DT9iLaj6idyKmq/ZUx8NhFNzvxzXdBRlxycI62t9jcJH9WOuHaAvmX
         fy/gbeVPL8gWG4+vyPm67LK0QKpx+SklhMTzZAUitn6uIdDo3iPBBLPM8Y9osAnKcgkw
         dYGB8f+F/MUXdkDxfAYXSs4uuTr+XB+WCBiYI9+2h2FXLHCPAXGZfbCjhnf3rhwQ8/Yg
         R40QG8KSGvO0Q7PrPVPvFEJTwiP/SR03BMFuD+UaNxSP0TDndldrMhM/E/XgLWuWjbi4
         aerw5FE7l9It0P/2Y5hWYw56OFGKDOHYuBSHosaVgYcxh7MefbNYVQ2v63LoxYUmV33c
         Bc4A==
X-Forwarded-Encrypted: i=1; AJvYcCU3az/1qcSPC+6fMeInvQj7bTJbnz1JDA0XSY8MuRW1VXugI2ZYHlXsz8yZbW+Rp/UcIw19QO+79nU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7XAuzOWsvByaEPJSdHxFP3PIjDC2cIsNdEHj7DsKXlaB5RleC
	HfluhLaWxTe1ku5csuPGCqiD5PfXdfXTW99VuHJRIax4OLz43Ew1eaqjw3Xwy/84RKmKy9QSb6l
	ahO6IIf6rmRb0uH2ZyIexJn1EF6YA3GgAHR0o
X-Gm-Gg: ASbGnctH2P8B2uz2IQH37KAkVOmDufeDFGiL4Uy65G/rcm6kahmF4pdUrrlbBxX9wfd
	DlU21LHgYWrSfX1nipNECJvCE+ujL+Dz16SnogZ2eJeVvDtdKvo4kJqAF3P556t91
X-Google-Smtp-Source: AGHT+IFLiMjxu40TM+UVieh0Bd7i1lzubM2AaOkks8cek/BeR7xzlhz5A3bDMGs9Q7HwEqfELllu4ST8mmu2IBdFiYQ=
X-Received: by 2002:a05:6512:b0f:b0:540:17ac:b379 with SMTP id
 2adb3069b0e04-5422953c451mr13347762e87.25.1736226444371; Mon, 06 Jan 2025
 21:07:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126025507.29605-1-chunfeng.yun@mediatek.com>
 <20241126025507.29605-2-chunfeng.yun@mediatek.com> <207f9e96-3165-440d-8576-545bf2bc9dee@collabora.com>
 <0820cf224ae9022fc34fb31d97d4c6f8f6e2eec1.camel@mediatek.com>
In-Reply-To: <0820cf224ae9022fc34fb31d97d4c6f8f6e2eec1.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Jan 2025 13:07:13 +0800
X-Gm-Features: AbW1kvYyYtMKXXkgB8owp0uoo9z3s18dWodz3XR3LaPnMpcD1THVU7CSsiHgTFU
Message-ID: <CAGXv+5FUuqDbVRQdkkdM9SRV6N3H8Gx_rMpx6rw-hNu45SKVNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: mtk-xhci: add support remote wakeup of mt8196
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
Cc: "robh@kernel.org" <robh@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 10:58=E2=80=AFPM Chunfeng Yun (=E4=BA=91=E6=98=A5=E5=
=B3=B0)
<Chunfeng.Yun@mediatek.com> wrote:
>
> On Tue, 2024-11-26 at 09:50 +0100, AngeloGioacchino Del Regno wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > Il 26/11/24 03:55, Chunfeng Yun ha scritto:
> > > There are 2 USB controllers on mt8196, each controller's wakeup
> > > control is
> > > different, add some specific versions for them.
> > >
> >
> > Is there any MTU3 controller in MT8196, like all other MediaTek SoCs?
> Yes.
> >
> > If so, then please just add the wakeup control to the MTU3 driver,
> > otherwise
> > we are going to duplicate this for yet another SoC, like we've done
> > for MT8192,
> > MT8195, MT8188 and MT8186 already...
> Even I add it in MTU3 driver, I still need add it in xhci-mtk driver,
> some projects only use host mode;
>
> I can also add it in MTU3 driver and send out new patches.
>
> But it's not a good idea to duplicate it into MTU3 driver directly for
> some SoC which has limitation on dual-role switch when using upstream
> driver.

I think the idea behind Angelo's point is that MTU3 should be used for
all projects, regardless whether they are host mode only or not.
The hardware is there. Don't hide it.

ChenYu

> Thanks
>
> >
> > Cheers,
> > Angelo
> >
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > >   drivers/usb/host/xhci-mtk.c | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-
> > > mtk.c
> > > index 3252e3d2d79c..31223912b0b4 100644
> > > --- a/drivers/usb/host/xhci-mtk.c
> > > +++ b/drivers/usb/host/xhci-mtk.c
> > > @@ -113,6 +113,12 @@
> > >   #define WC1_IS_P_95         BIT(12)
> > >   #define WC1_IS_EN_P0_95             BIT(6)
> > >
> > > +/* mt8196 */
> > > +#define PERI_WK_CTRL0_8196   0x08
> > > +#define UWK_V1_7_CTRL2_MASK  0x5
> > > +
> > > +#define WCP1_IS_EN           BIT(7) /* port1 en bit */
> > > +
> > >   /* mt2712 etc */
> > >   #define PERI_SSUSB_SPM_CTRL 0x0
> > >   #define SSC_IP_SLEEP_EN     BIT(4)
> > > @@ -129,6 +135,8 @@ enum ssusb_uwk_vers {
> > >       SSUSB_UWK_V1_4,         /* mt8195 IP1 */
> > >       SSUSB_UWK_V1_5,         /* mt8195 IP2 */
> > >       SSUSB_UWK_V1_6,         /* mt8195 IP3 */
> > > +     SSUSB_UWK_V1_7,         /* mt8196 IP0 */
> > > +     SSUSB_UWK_V1_8,         /* mt8196 IP1 */
> > >   };
> > >
> > >   /*
> > > @@ -381,6 +389,16 @@ static void usb_wakeup_ip_sleep_set(struct
> > > xhci_hcd_mtk *mtk, bool enable)
> > >               msk =3D WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) |
> > > WC0_IS_P_95;
> > >               val =3D enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) :
> > > 0;
> > >               break;
> > > +     case SSUSB_UWK_V1_7:
> > > +             reg =3D mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
> > > +             msk =3D UWK_V1_7_CTRL2_MASK;
> > > +             val =3D enable ? msk : 0;
> > > +             break;
> > > +     case SSUSB_UWK_V1_8:
> > > +             reg =3D mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
> > > +             msk =3D WCP1_IS_EN;
> > > +             val =3D enable ? msk : 0;
> > > +             break;
> > >       case SSUSB_UWK_V2:
> > >               reg =3D mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
> > >               msk =3D SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
> >
> >
> >

