Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5F45B5B07
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 07:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbfIRFq3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 01:46:29 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:42072 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727779AbfIRFq3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Sep 2019 01:46:29 -0400
Received: by mail-wr1-f50.google.com with SMTP id n14so4554551wrw.9
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2019 22:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=154gRUWSbi32pG//pPf06f0RxngV2Wk2pyN+g/8R1eg=;
        b=HyvYHEZ2a9fQsBwVjPb8+gMVCVEdmH+F6+IeBb5BBT5Y5kCpJkAANdN7nzJqZj1+mK
         wdyKKQTRqtAJMK+Btm9zyhgJG3Vb0wg3sIq4DJ64SMU3zozLbhZxOctEoMBpd+1oTGsI
         wj7o7ClfeI9HI7C+t69oLZsoKzDqjuADOaLn3+3WHuqO/OPZE6aYFFJACArcRUC1TRuR
         z+e9zmSBcvMI8m91V/QRI2sB5LFnDCJc2lQyVgQn0zojikuAPCGtiqx8cGdGeATuN7Ob
         NBfELyAKy8zZOfLXaf5UYkYU4EIGEFIvWZBaoamD9XrEjoBNxAn0MspdlfNqV7GCu5bS
         tZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=154gRUWSbi32pG//pPf06f0RxngV2Wk2pyN+g/8R1eg=;
        b=gd4cZFgkX+9leBLGE07dDMFtzNZeFDQ/m9vT039vTgvdFRxie3FtNT+c8Bv1SNwx3U
         yIz3ITLV+urnfEroJiQQplSaLA85zPcbTL9KkizrIcWIpuQ6nAZZFygqX0TAKZsh4G2N
         R+iIr1VZbz8OvX3eZ0deBEG0up1Lt3YdkAb6h3tnd+3jzc7iQzLAOkUyhOTgdX3+LKof
         gWDDPySXavCyUzz1mZdooC6h2Vt+squtYgVArdC8eMuCzVSTUEa14zJlyBtm3CKb9RdB
         5loeRjNrqDaC57PyPM0YzBqNZqvA0WQPMi2PyFfwY1VwrfD1NNxGCq8TFUHvx0yvf8Lc
         TTuQ==
X-Gm-Message-State: APjAAAUqRLXW8vTes+7EfQBq7cLA6nGWqE1jf/H6OvLFNpA+0MFfcm9G
        b2z+wQ06Fqzo8mdcfFGKeSmBCmn/Dkwk9WZzqoWAIyUi
X-Google-Smtp-Source: APXvYqwASTrIaYh8QfpjUxRLMrddqE/84aHB4qoUtaztg1dPZBfckTkfgGM/jdignUtY7XDpIcqOraZDlu0W6JlCqeU=
X-Received: by 2002:a5d:4b46:: with SMTP id w6mr1371048wrs.223.1568785586459;
 Tue, 17 Sep 2019 22:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190702123006.11320-1-charlesyeh522@gmail.com>
 <20190716084907.GB10939@localhost> <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
In-Reply-To: <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Wed, 18 Sep 2019 13:46:15 +0800
Message-ID: <CAAZvQQ5aK8+bT73yfMt4BpT=F=+evoi-d59ByTHmLsVDUKnMZQ@mail.gmail.com>
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

Hello ,
       Any update on this?

Charles.

Charles Yeh <charlesyeh522@gmail.com> =E6=96=BC 2019=E5=B9=B48=E6=9C=8827=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:40=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B47=E6=9C=8816=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:49=E5=AF=AB=E9=81=93=EF=BC=9A
> > >  #define PL2303_FLOWCTRL_MASK         0xf0
> > > +#define PL2303_HXN_FLOWCTRL_MASK     0x1C
> > > +#define PL2303_HXN_FLOWCTRL          0x0A
> >
> > I asked you to keep related defines together (and to move the mask wher=
e
> > the register define was, not the other way round). Please move these to
> > the other HXN defines below, and keep the register address defines
> > before the corresponding bit defines.
>
> Charles Ans:
> I am not 100% sure what you mean, please see if it is defined below
>
> #define PL2303_FLOWCTRL_MASK        0xf0
>
> #define PL2303_READ_TYPE_HX_STATUS    0x8080
>
> #define PL2303_HXN_CTRL_XON_XOFF    0x0C
> #define PL2303_HXN_CTRL_RTS_CTS        0x18
> #define PL2303_HXN_CTRL_NONE        0x1C
> #define PL2303_HXN_FLOWCTRL_MASK    0x1C
> #define PL2303_HXN_FLOWCTRL        0x0A
>
> #define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE    0x03
> #define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE_MASK    0x03
> #define PL2303_HXN_RESET_CONTROL    0x07
>
> > > +
> > > +#define PL2303_HXN_RESET_CONTROL_MASK        0x03
> > This makes no sense. The whole register is used for reset. If you want =
a
> > define that can be used for resetting both pipes then add two separate
> > defines for up and down respectively, and add a third define for
> > resetting both buffer as a bitwise OR of the two.
>
> Charles Ans:
> Yes,The whole register is used for reset.
> Bit 0 and bit 1 are used for up & downstream data pipe,
> Bit 2 for interface reset
> Bit 4 for chip reset.
>
> But I only reset bit 0 & bit 1.
>
>
> > Also move this one after the corresponding register address define
> > below.
> >
> > > +#define PL2303_HXN_RESET_CONTROL     0x07
> > > +#define PL2303_HXN_CTRL_XON_XOFF     0x0C
> > > +#define PL2303_HXN_CTRL_RTS_CTS              0x18
> > > +#define PL2303_HXN_CTRL_NONE         0x1C
>
> Charles Ans:
> I am not 100% sure what you mean, please see if it is defined below
>
> #define PL2303_FLOWCTRL_MASK        0xf0
>
> #define PL2303_READ_TYPE_HX_STATUS    0x8080
>
> #define PL2303_HXN_CTRL_XON_XOFF    0x0C
> #define PL2303_HXN_CTRL_RTS_CTS        0x18
> #define PL2303_HXN_CTRL_NONE        0x1C
> #define PL2303_HXN_FLOWCTRL_MASK    0x1C
> #define PL2303_HXN_FLOWCTRL        0x0A
>
> #define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE    0x03
> #define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE_MASK    0x03
> #define PL2303_HXN_RESET_CONTROL    0x07
>
> > > +     } else if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
> > >               /* reset upstream data pipes */
> >
> > This comment belongs in the last else block. Your new code shouldn't
> > need one.
>
> Charles Ans:
> OK, I will remove this comment.
>
>
> >
> > > +             pl2303_update_reg(serial, PL2303_HXN_RESET_CONTROL,
> > > +                             PL2303_HXN_RESET_CONTROL_MASK, 0x03);
> >
> > So two things; first, do you really need to read back the current value=
?
> > I would assume that it always reads back as 0 and that writing 0x03 in
> > this case would be sufficient to reset both buffers.
> >
>
> Charles Ans:
>  Yes, I want to read back the current value.
> because the whole register is used for reset.
> Bit 0 and bit 1 are used for up & downstream data pipe,
> Bit 2 for interface reset
> Bit 4 for chip reset.
>
> But I only reset bit 0 & bit 1.
>
> > Second, please use a define for 0x03; no magic constants, as we have
> > discussed before. You don't need a separate mask define if you're alway=
s
> > resetting both buffers together (just use the same value define twice).
>
> Charles Ans:
> OK, I will define for 0x03.
>
> #define PL2303_HXN_RESET_UP_DOWNSTREAM_DATA_PIPE    0x03
>
>
> Charles Yeh.
