Return-Path: <linux-usb+bounces-29161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D325BCF463
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 13:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF43D3BC37D
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 11:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921E0265621;
	Sat, 11 Oct 2025 11:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TNl7AjBq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C438258EFF
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760181785; cv=none; b=dD+qllzud0szjrrhAHgIUpcWPn+4+PJ3ytKp144lck4/TMLclvvwvwsOnmKuLPFgzphGLKdPMSFlLLdYjuv/YV8unZK4z6nu8TSjSChIkAmj83AydTjPXYY3ibAv+hu152bsgrCY6rvXusvM8VIMo7zZZogo117UcJnECOXQqgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760181785; c=relaxed/simple;
	bh=0nKriPSHqa8fEwO4TUiVHqnQKIZcwD3SXF7jiO5wJ5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YoEtW1jWeVmlcLHn+JSPD8dkYb+hPHkmaBm7Jyx8xqBqkP/6fvar08CCbLY/nNWTZmhxlthVRof0nxsKeG4o/s24R070/NKCI8FfveVvUDJsW29+AsC83jTJqfHxy7b7ORwziMFjsQn7Jo1wAhEJ4PIp+i8oydQlBq6usqNK0bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TNl7AjBq; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-586883eb9fbso3831917e87.1
        for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 04:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760181777; x=1760786577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snF2x6iVq7pAFbsmpa+AIFlv6OW+huS9eV6QM4iutGQ=;
        b=TNl7AjBqWcyIoc6oA+B6b0erWAozu3D2Jz9h/7S5s7lvDK7swaelw1wKiFIWtqO4RB
         3ED3rKpL2nEjJlJNR0HNZnUmH07S1s7aQtAZzqBdPPUuKf3JPjoyp03WRgSK8XXLyqlp
         HursGmH6ZSwh03ga7nOjAOHaDYCbkLnUGi1Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760181777; x=1760786577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snF2x6iVq7pAFbsmpa+AIFlv6OW+huS9eV6QM4iutGQ=;
        b=iVqh13hrM8p0UpDW8dDnGQRNq8SUNziymPw/iGGqPNaK5T5g8L+wxNQ9oZlvUV6kVm
         U/Bo92QOg28Ifs3RoSj91ZmiKlf6xXKU2wXhMLbtei9A4VOlHmdReWMszCNZG07vNwlE
         TqiK/wkttQWeUavYWDMZmGKyPlqLgo/gwUzeGvWql3dlXPycKYjDRHcnnQIbrJqQNhHQ
         4sleKwZ521b/upBC5xl77zggDdVdxHiYmHVfFT/2CwDKB8BfnGzmQ6hKtQLBewUHvzCn
         Kb9JjrYL+rWFnFd9HNDRS4ORbI3DPstjkIborJKZHuBWtOuOUS7YYk/YWk2HqnDKieO0
         eR5A==
X-Forwarded-Encrypted: i=1; AJvYcCUnNem3VQ6tnkTvfKMUh08cqKJNXeJDgx2jpW9AjQd+MYrsTnyD9P6Im23trsy1YYqNgzcJmnJZhzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqbs0AMdHl5TadfBFxginp6JS3wS471xy+OnaxbmpQsRJTfo9X
	zEzqxXLuqPl77u5MbnRYWBKjPcbkJRQUokTGxsddZ1UpVoJYs6kJd8oQwjIFjIfI2Njq1y+vN7J
	hUrrOHrv6JUVv6+nq2UpBR13Jc/DoluU2ESRZXhEghXnfqNy6yxso
X-Gm-Gg: ASbGncvH4ZlW6TSLwQQ4GRpKhcNBycv5My1ChKQI9oJeLLhqtYRabZtP4ITnxYiXp2m
	YxxCpEbg1k8JTQz7pGZBo3Ar3aJLG+KKWi2CM0/GX0vcc8SjQj0Bb4kO3RG8qCPy8fwkohq++rm
	F7HECgX97ugG4xYF/nfLfjLhO3Y/suoWtVwp8m6a//+6t5eVj8vs9yEHaHZq45SK3Ry65HCIG/S
	SbLxle1RXiwJaHwve65E+sHYCcTN4GnhQ==
X-Google-Smtp-Source: AGHT+IGi/90P2fDmvq3u9KNmUFtkNax1NjaM/e3aEsUqXml6o41u0BaH4N1NlPdc4BSSQ3oXuP1Vm9wtbYCrOT54htg=
X-Received: by 2002:a05:6512:607:20b0:590:7af0:837a with SMTP id
 2adb3069b0e04-5907af0868emr2617091e87.12.1760181777220; Sat, 11 Oct 2025
 04:22:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007213902.2231670-1-ukaszb@google.com> <20251007213902.2231670-2-ukaszb@google.com>
 <fffa3476-c800-4257-a3c6-057c4c8cde28@intel.com>
In-Reply-To: <fffa3476-c800-4257-a3c6-057c4c8cde28@intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sat, 11 Oct 2025 13:22:45 +0200
X-Gm-Features: AS18NWDEZd2oE4e4WPwstd7AHMwp7h3VH6LHYiyhTp5A7H-MZXEEL15mUCw-QGA
Message-ID: <CALwA+NZ=B2BbzUZUqKCzP28wDkPcd-PczcCwa6Mb2YjbNM8j3w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] xhci: dbc: prepare to expose strings through sysfs
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 1:09=E2=80=AFPM Mathias Nyman <mathias.nyman@intel.=
com> wrote:
>
> On 10/8/25 00:38, =C5=81ukasz Bartosik wrote:
> > From: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> >
> > Reorganize the code to prepare ground for setting serial number,
> > product and manufacturer names through sysfs. This commit:
> > 1. Introduces new buffers for storing serial number, product and
> >     manufacturer name in utf8. The buffers will be used by sysfs
> >     *_show and *_store functions.
> > 2. Increases USB string descriptor data maximum length to the
> >     value from USB specification (126 bytes of data).
> > 3. Adds new helper functions get_str_desc_len, prepare_len
> >     and xhci_dbc_populate_str_desc.
> >
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
>
> This change does in general look good to me.
>
> It gets rid of the code duplication in current xhci_dbc_populate_strings(=
),
> and retains new strings over suspend/resume.
>
> I mostly have minor nitpicks regarding naming and other subjective matter=
s
>

Thank you Mathias for the review.

> > ---
> >   drivers/usb/host/xhci-dbgcap.c | 145 ++++++++++++++++++--------------=
-
> >   drivers/usb/host/xhci-dbgcap.h |  24 ++++--
> >   2 files changed, 94 insertions(+), 75 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbg=
cap.c
> > index 63edf2d8f245..c2fecaffd6f3 100644
> > --- a/drivers/usb/host/xhci-dbgcap.c
> > +++ b/drivers/usb/host/xhci-dbgcap.c
> > @@ -124,7 +75,63 @@ static void xhci_dbc_init_ep_contexts(struct xhci_d=
bc *dbc)
> >       ep_ctx->deq             =3D cpu_to_le64(deq | dbc->ring_in->cycle=
_state);
> >   }
> >
> > -static void xhci_dbc_init_contexts(struct xhci_dbc *dbc, u32 string_le=
ngth)
> > +static u8 get_str_desc_len(const char *desc)
> > +{
> > +     return ((struct usb_string_descriptor *)desc)->bLength;
> > +}
> > +
> > +static u32 prepare_len(struct dbc_str_descs *descs)
>
> prepare_len() is very generic, how about something like
>
> dbc_prepare_info_context_str_len()
>

I will change it in patchset v3.

> > +{
> > +     u32 len;
> > +
> > +     len =3D get_str_desc_len(descs->serial);
> > +     len <<=3D 8;
> > +     len +=3D get_str_desc_len(descs->product);
> > +     len <<=3D 8;
> > +     len +=3D get_str_desc_len(descs->manufacturer);
> > +     len <<=3D 8;
> > +     len +=3D get_str_desc_len(descs->string0);
> > +
> > +     return len;
> > +}
> > +
> > +static int xhci_dbc_populate_str_desc(char *desc, const char *src)
> > +{
> > +     struct usb_string_descriptor    *s_desc;
> > +     int                             utf16_len;
> > +
> > +     s_desc =3D (struct usb_string_descriptor *)desc;
> > +     utf16_len =3D utf8s_to_utf16s(src, strlen(src), UTF16_LITTLE_ENDI=
AN,
> > +                                 (wchar_t *)s_desc->wData, USB_MAX_STR=
ING_LEN);
>
> The "utf16_len" got me confused.
> It's not wrong, but I first assumed it is bytes this utf16 formatted text
> takes, when it turns out to be number of u16 entries in the text.
>

Do you have a suggestion how to rename it to be more self commenting ?
Or maybe I will rename it to len and add a comment that it holds a number
of u16 entries ? WDYT ?

> > +     if (utf16_len < 0)
> > +             return utf16_len;
> > +
> > +     s_desc->bLength         =3D utf16_len * 2 + 2;
> > +     s_desc->bDescriptorType =3D USB_DT_STRING;
> > +
> > +     return s_desc->bLength;
> > +}
> > +
> > +static void xhci_dbc_populate_str_descs(struct dbc_str_descs *str_desc=
s,
> > +                                     struct dbc_str *str)
> > +{
> > +     /* Serial string: */
> > +     xhci_dbc_populate_str_desc(str_descs->serial, str->serial);
> > +
> > +     /* Product string: */
> > +     xhci_dbc_populate_str_desc(str_descs->product, str->product);
> > +
> > +     /* Manufacturer string: */
> > +     xhci_dbc_populate_str_desc(str_descs->manufacturer, str->manufact=
urer);
> > +
> > +     /* String0: */
> > +     str_descs->string0[0]   =3D 4;
> > +     str_descs->string0[1]   =3D USB_DT_STRING;
> > +     str_descs->string0[2]   =3D 0x09;
> > +     str_descs->string0[3]   =3D 0x04;
> > +}
>
> > @@ -1314,6 +1320,11 @@ xhci_alloc_dbc(struct device *dev, void __iomem =
*base, const struct dbc_driver *
> >       dbc->bInterfaceProtocol =3D DBC_PROTOCOL;
> >       dbc->poll_interval =3D DBC_POLL_INTERVAL_DEFAULT;
> >
> > +     /* initialize serial, product and manufacturer with default value=
s */
> > +     memcpy(dbc->str.serial, DBC_STRING_SERIAL, strlen(DBC_STRING_SERI=
AL)+1);
> > +     memcpy(dbc->str.product, DBC_STRING_PRODUCT, strlen(DBC_STRING_PR=
ODUCT)+1);
> > +     memcpy(dbc->str.manufacturer, DBC_STRING_MANUFACTURER, strlen(DBC=
_STRING_MANUFACTURER)+1);
> > +
>
> Maybe it would be cleaner to just define a default struct for the strings=
 and assign it here.
> We could get rid of the #define  DBC_STRING_* from the header as well.
>
> i.e.:
>
> static const struct dbc_str dbc_str_default =3D {
>         .manufacturer =3D "Linux Foundation",
>         .product =3D "Linux USB Debug Target",
>         .serial =3D "0001",
> };
>
> xhci_alloc_dbc(..)
> {
>         ...
>         /* initialize serial, product and manufacturer with default value=
s */
>         dbc->str =3D dbc_str_default;

Neat ;). I will change it in patchset v3.

> }>      if (readl(&dbc->regs->control) & DBC_CTRL_DBC_ENABLE)
> >               goto err;
> >
> > diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbg=
cap.h
> > index 47ac72c2286d..0e6addafea6c 100644
> > --- a/drivers/usb/host/xhci-dbgcap.h
> > +++ b/drivers/usb/host/xhci-dbgcap.h
> > @@ -47,7 +47,6 @@ struct dbc_info_context {
> >   #define DBC_DOOR_BELL_TARGET(p)             (((p) & 0xff) << 8)
> >
> >   #define DBC_MAX_PACKET                      1024
> > -#define DBC_MAX_STRING_LENGTH                64
> >   #define DBC_STRING_MANUFACTURER             "Linux Foundation"
> >   #define DBC_STRING_PRODUCT          "Linux USB Debug Target"
> >   #define DBC_STRING_SERIAL           "0001"
> > @@ -63,11 +62,19 @@ struct dbc_info_context {
> >   #define DBC_PORTSC_LINK_CHANGE              BIT(22)
> >   #define DBC_PORTSC_CONFIG_CHANGE    BIT(23)
> >
> > +#define USB_MAX_STRING_DESC_LEN              (USB_MAX_STRING_LEN + 2)
>
> This looks like somthing that would be defined in ch9.h or usb.h.
>

Unfortunately I can see only USB_MAX_STRING_LEN but no definition
for a maximum USB string descriptor size.

> Maybe a more local name like DBC_MAX_STRING_DESC_LEN
>

I will rename it and also remove magic number:
#define USB_MAX_STRING_DESC_LEN              (USB_MAX_STRING_LEN +
sizeof(struct usb_string_descriptor))

>
> > +
> >   struct dbc_str_descs {
> > -     char    string0[DBC_MAX_STRING_LENGTH];
> > -     char    manufacturer[DBC_MAX_STRING_LENGTH];
> > -     char    product[DBC_MAX_STRING_LENGTH];
> > -     char    serial[DBC_MAX_STRING_LENGTH];
> > +     char    string0[USB_MAX_STRING_DESC_LEN];
> > +     char    manufacturer[USB_MAX_STRING_DESC_LEN];
> > +     char    product[USB_MAX_STRING_DESC_LEN];
> > +     char    serial[USB_MAX_STRING_DESC_LEN];
> > +};
> > +
> > +struct dbc_str {> +  char    manufacturer[USB_MAX_STRING_LEN/2+1];
> > +     char    product[USB_MAX_STRING_LEN/2+1];
> > +     char    serial[USB_MAX_STRING_LEN/2+1];
> >   };
>
> Maybe some comment above to clarify the odd size
>
> /* utf8 strings used to create the USB_MAX_STRING_LEN utf16 string descri=
ptors */
>

I will add the comment in the patchset v3.

Thanks,
=C5=81ukasz

> Thanks
> Mathias
>

