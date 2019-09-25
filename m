Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E71FCBDB1E
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2019 11:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729696AbfIYJgt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 05:36:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35015 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729084AbfIYJgg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 05:36:36 -0400
Received: by mail-wr1-f66.google.com with SMTP id v8so5856969wrt.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2019 02:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MDwrTcg5h4KcHB5xxN6dz4uOQkvWcL/S1XF0CIlHhpM=;
        b=OXJKEHz0in5Sx2njd2GITCEj3znYqW7E3tkNAp0NwNDtoLWLSuuUllm8QTJjOGqV7M
         +8dyx7E6/xhFFVyV0zhwdqCvCjTS6ji/dmxq7Q43BTcqhLhV816ZTb3LLM3l/fVmhkXg
         aVtwu28j90g9nxE2VGgbXgI/Te7HDl5BIvs1Ul5ELe5Yy4s5HBHnrxME0/EnLmT3eaX4
         3HGX4LG6MuNqocmGOEUtRQkJcf0hWeKPzGkmnzPcu+H5Z13xqbopzO2KDL/3MlTKCO5S
         1wZ4tID6DYA+BYIdrlIjBw5Wjd/TKmr+H8ZFHShgiCJ74sDnUd9WueNdni7EQw40HaTG
         PLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MDwrTcg5h4KcHB5xxN6dz4uOQkvWcL/S1XF0CIlHhpM=;
        b=uY39E5qnwSckB1efhxJHlR/K06PilOFqyTIvyyKZkBN64HtNFgMFoW1Z8rYQsX9Saq
         WWUiXOwOJc+3IvT6TjPLkmW/fs3HhG/c0D8sUzJod97FB2tQS5ONRl8Uc4taSoUcA2F4
         ixmMl7m13SN9AL6xuE3pIY+8uz2dLZLRmSRo56+JIkw4NXgzEilBup7/SGMak3l58wIq
         TQNLgCwFzV0Yv3V/nHgTEhQlcbzDmKPa1HIZ95upK/7FLZ+7V5CfsB5K9ZcgiePanBts
         dFNYEvONc1bYgOWmj0p6ZtLysrVGuW/RCHmNCmF/09BSSJ6dYb2JzKGM7v/amt/vGLRx
         2gCw==
X-Gm-Message-State: APjAAAXz9cxBNz6jAQoIBK5i3ph+EW20LjnH/w4GNroU6fsMP78M1kbL
        zC0CDKNxB5koQbBmU9B6QBqO68KkUeKbITuiw+u8z+0uEV0=
X-Google-Smtp-Source: APXvYqzU6vdK8N039kg7FntZluOcy0pxp/cx7y5JPrAGdvqHaZ/O/jy6ij/ertbkPVGf9/EniNpD0sC9Ej0EqTxmH6E=
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr8363247wre.176.1569404194503;
 Wed, 25 Sep 2019 02:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190702123006.11320-1-charlesyeh522@gmail.com>
 <20190716084907.GB10939@localhost> <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
 <20190920075602.GI30545@localhost> <CAAZvQQ6613eO6G0Gm-Sv3yWqTG_rRrynF=xVSLgz2uakXU2=ZQ@mail.gmail.com>
 <20190923102440.GA30545@localhost> <CAAZvQQ6MPrsfTcsnyD4DbKDVJf1WyLoxqW7q07k2RO1Cs5yd5Q@mail.gmail.com>
 <20190923130804.GC30545@localhost> <CAAZvQQ51rCF6PqZWU22fkwfgUimsnyCMtC0mb3YRSikm0z=W7A@mail.gmail.com>
 <20190925080654.GC14159@localhost>
In-Reply-To: <20190925080654.GC14159@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Wed, 25 Sep 2019 17:36:23 +0800
Message-ID: <CAAZvQQ5gJr_pTgA+XGyMfcf8Fakvg4zO3hcOcwufr7HOPn4DPQ@mail.gmail.com>
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

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B49=E6=9C=8825=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:06=E5=AF=AB=E9=81=93=EF=BC=9A
> Meanwhile you can double check that you've considered all
> review-feedback you've gotten so far.
>
> I don't think you ever replied to my last comment about the reset
> register and why I thought using plain write (not read, mask, write) was
> the right thing to do.
>
> Does the register always read back as 0, or does it read back as the
> last value written?

Charles Ans:
I just asked my colleague, who is RD of design PL2303 hardware,
His answer is to read 0 forever.

Does the register always read back as 0, or does it read back as the
last value written?
Ans: Yes, the register"#define PL2303_HXN_RESET_REG 0x07" always
read back as 0.

I hope the above content has an answer to your question:
If there are other questions, please try to raise it.. thanks

Charles.
