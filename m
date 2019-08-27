Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F29149E2E2
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2019 10:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729675AbfH0Ikw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Aug 2019 04:40:52 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:52060 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729671AbfH0Ikw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Aug 2019 04:40:52 -0400
Received: by mail-wm1-f52.google.com with SMTP id k1so2159438wmi.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 01:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Sfr1A2Q5nePVt6BnZgP7jzycMTLI6jQm0IPnY1PgPlU=;
        b=AWij5t2a+Wi+qN9OBjuth3hJJj8N5YXbUDabeCGg5kL8i1iGPSP9ORlyl2yeFfsCmZ
         u2uEmn9+HRIqFHyIeY0J+tiwSokVuPC9nFIN3fWEipS8dWzGKrmY50ia9JB87vAXtzIV
         eC3VBWKXo0BQa+exkijfqjb0zrlTvOkwC3Uwb7Sm5qA4Q8shXXRzDnSAS703F8W4Kgmh
         e8Woz3pWIFX9V3XKMI/j+Fsj6R+SekAHiw0B7AE10Q7BMav/caqmQi65RU6izcXuieII
         Vy3nzI1tL2ub5NFBU70fhp/hv2waUGSPQi2JSZsb1kXdcIhsYn8/fY9eOH79Ccvs1XnO
         A6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Sfr1A2Q5nePVt6BnZgP7jzycMTLI6jQm0IPnY1PgPlU=;
        b=QwF2bJ2uPzECip5f97oQJoujl3e/JHjErcRJf2yXaQ4ErMpAJTEkg/8DRxgh+IwSbT
         IDLrObK6wifneByXkEm/+5uTgKbspa31HOGSzpvmkaux4kZh1Fopkdi5fpfyN9GCPVou
         5z6EH0VbWALm47fboExwrWqiQTc2PfTkzwvvmFM64gEwdE0sbjkZ1GONMjJ0WxJ4cmRY
         08UcZqDT1IX/umJ8qACFt9bfCDnAGdSiV8lcX2Oh8HLDsfWB5mbkJTj6Sx8xjeI15oMo
         dTqnKJqmCH/Bj15sWSveCEe7qwaHFJnjhDOJGNBFl0LbLMlfoWMGSDpXif6bopREFbHu
         TmmA==
X-Gm-Message-State: APjAAAUwMARqyT7kagsRIXBy/bhSTFsOnruy0XfDXBhSWfquTmIUr4gS
        piq7obrYuTazCFawy1NKo2vWjgdjX9Wu16o3dM8=
X-Google-Smtp-Source: APXvYqwkfhF6PeBnJud5aL8K6bYCS6UJxLUKhxZqExReULabMioXRTBsxipJjZhI9EFhh+LnHAxISLC6Is4sOgEcR+U=
X-Received: by 2002:a1c:a985:: with SMTP id s127mr26261540wme.163.1566895249915;
 Tue, 27 Aug 2019 01:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190702123006.11320-1-charlesyeh522@gmail.com> <20190716084907.GB10939@localhost>
In-Reply-To: <20190716084907.GB10939@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Tue, 27 Aug 2019 16:40:39 +0800
Message-ID: <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v7] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B47=E6=9C=8816=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:49=E5=AF=AB=E9=81=93=EF=BC=9A
> >  #define PL2303_FLOWCTRL_MASK         0xf0
> > +#define PL2303_HXN_FLOWCTRL_MASK     0x1C
> > +#define PL2303_HXN_FLOWCTRL          0x0A
>
> I asked you to keep related defines together (and to move the mask where
> the register define was, not the other way round). Please move these to
> the other HXN defines below, and keep the register address defines
> before the corresponding bit defines.

Charles Ans:
I am not 100% sure what you mean, please see if it is defined below

#define PL2303_FLOWCTRL_MASK        0xf0

#define PL2303_READ_TYPE_HX_STATUS    0x8080

#define PL2303_HXN_CTRL_XON_XOFF    0x0C
#define PL2303_HXN_CTRL_RTS_CTS        0x18
#define PL2303_HXN_CTRL_NONE        0x1C
#define PL2303_HXN_FLOWCTRL_MASK    0x1C
#define PL2303_HXN_FLOWCTRL        0x0A

#define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE    0x03
#define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE_MASK    0x03
#define PL2303_HXN_RESET_CONTROL    0x07

> > +
> > +#define PL2303_HXN_RESET_CONTROL_MASK        0x03
> This makes no sense. The whole register is used for reset. If you want a
> define that can be used for resetting both pipes then add two separate
> defines for up and down respectively, and add a third define for
> resetting both buffer as a bitwise OR of the two.

Charles Ans:
Yes,The whole register is used for reset.
Bit 0 and bit 1 are used for up & downstream data pipe,
Bit 2 for interface reset
Bit 4 for chip reset.

But I only reset bit 0 & bit 1.


> Also move this one after the corresponding register address define
> below.
>
> > +#define PL2303_HXN_RESET_CONTROL     0x07
> > +#define PL2303_HXN_CTRL_XON_XOFF     0x0C
> > +#define PL2303_HXN_CTRL_RTS_CTS              0x18
> > +#define PL2303_HXN_CTRL_NONE         0x1C

Charles Ans:
I am not 100% sure what you mean, please see if it is defined below

#define PL2303_FLOWCTRL_MASK        0xf0

#define PL2303_READ_TYPE_HX_STATUS    0x8080

#define PL2303_HXN_CTRL_XON_XOFF    0x0C
#define PL2303_HXN_CTRL_RTS_CTS        0x18
#define PL2303_HXN_CTRL_NONE        0x1C
#define PL2303_HXN_FLOWCTRL_MASK    0x1C
#define PL2303_HXN_FLOWCTRL        0x0A

#define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE    0x03
#define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE_MASK    0x03
#define PL2303_HXN_RESET_CONTROL    0x07

> > +     } else if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
> >               /* reset upstream data pipes */
>
> This comment belongs in the last else block. Your new code shouldn't
> need one.

Charles Ans:
OK, I will remove this comment.


>
> > +             pl2303_update_reg(serial, PL2303_HXN_RESET_CONTROL,
> > +                             PL2303_HXN_RESET_CONTROL_MASK, 0x03);
>
> So two things; first, do you really need to read back the current value?
> I would assume that it always reads back as 0 and that writing 0x03 in
> this case would be sufficient to reset both buffers.
>

Charles Ans:
 Yes, I want to read back the current value.
because the whole register is used for reset.
Bit 0 and bit 1 are used for up & downstream data pipe,
Bit 2 for interface reset
Bit 4 for chip reset.

But I only reset bit 0 & bit 1.

> Second, please use a define for 0x03; no magic constants, as we have
> discussed before. You don't need a separate mask define if you're always
> resetting both buffers together (just use the same value define twice).

Charles Ans:
OK, I will define for 0x03.

#define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE    0x03


Charles Yeh.
