Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64335BB24B
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 12:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729502AbfIWKfc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 06:35:32 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40010 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbfIWKfc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 06:35:32 -0400
Received: by mail-lj1-f196.google.com with SMTP id 7so13149882ljw.7
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2019 03:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JLlhZFbMLuyCODkUeAK0T83tRwRmhr/Leuf93GfIESQ=;
        b=Od/RCLwLPzBHLt701RXY3ICUYO88Y7vMga8Na0O+Q1/ecEY0v2LwmSncCeLhP7yJYA
         hpEXaJ6I+yKgCFL+EUY6lGwYjxYwZKeawAzuBgw0F3BW30I7E8haNN9O4OGq8hKBrFPi
         facDSa0CGRw6OCGULfkznIsNAmbk3NnkQD3Dboc9ImDIsZQ2PUM40DoIZqLhtGtclVIK
         nnecnuQk4w1c4L2a6RNIhQg70ggAciYhjUImEqAbrlIbl7Bm+Pgyg+CG5Jtz/f/R2Yq1
         SpmWTEyQcGXMVCg9KYsW3VfKZe7mW7gMNdjwA5c7zaRJuwUBBaHzDbmU/IJ1NbNriSN/
         I3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JLlhZFbMLuyCODkUeAK0T83tRwRmhr/Leuf93GfIESQ=;
        b=QNLntH1yvmfWjyIIVCiHEgptS1Qfv6UqeamiyqkNpSIlDtNiH9jTpPJVUn5dvDPwcf
         26Nqu4KljKZNIB3bpRcvvu+eDzT/p8DVh4hCmW6rbzaV36GopCUIAeYboQFuQ5cdqN+M
         /QgRtkRmPKRqC0XVGSTPknlifjUmZ4MP6gPAG139xwYwUrsgqc8g7A5b6uezv0/XuNyG
         7S8k9Krxkjh8/O18eLs5o7tWlhE9xIsXir+QrTd8dnTkT5FXlr0VkHfbEhsuzFLTnJLe
         TpIRTIvCf11t4bYXbRcNMw4NfCXZx7gaHpamGjHa8+35LbFQzURVPOYAznf0vCiMgKTF
         OS7w==
X-Gm-Message-State: APjAAAVf7+3+NYqAf4fqKVs/SltwpDeR6lHb45M+yQVwAf9zfQJU4BJl
        aTm5pWcD3HcY6GoYyNcNp0YKs4VBsRSuIkFxwD3V1LQhWYM=
X-Google-Smtp-Source: APXvYqxmNqmvyT7iuTCh7vN7tZtONJIn5tuomJSqn6mlULFBl+VCczb4qVxGENPRQ11hIvET20A+VSDZ62lzTxTwgn4=
X-Received: by 2002:a2e:9898:: with SMTP id b24mr16229921ljj.157.1569234930028;
 Mon, 23 Sep 2019 03:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190702123006.11320-1-charlesyeh522@gmail.com>
 <20190716084907.GB10939@localhost> <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
 <20190920075602.GI30545@localhost> <CAAZvQQ6613eO6G0Gm-Sv3yWqTG_rRrynF=xVSLgz2uakXU2=ZQ@mail.gmail.com>
 <20190923102440.GA30545@localhost>
In-Reply-To: <20190923102440.GA30545@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Mon, 23 Sep 2019 18:35:19 +0800
Message-ID: <CAAZvQQ6MPrsfTcsnyD4DbKDVJf1WyLoxqW7q07k2RO1Cs5yd5Q@mail.gmail.com>
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

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B49=E6=9C=8823=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:24=E5=AF=AB=E9=81=93=EF=BC=9A
> That looks much better. But please move the reset defines above the
> flow control ones to keep the registers sorted by address (0x7 < 0xa).

Thank you for your reply

Charles Ans:
The new define is follows

#define PL2303_READ_TYPE_HX_STATUS    0x8080

#define PL2303_HXN_RESET_REG    0x07
#define PL2303_HXN_RESET_UPSTREAM_PIPE    0x02
#define PL2303_HXN_RESET_DOWNSTREAM_PIPE    0x01

#define PL2303_HXN_FLOWCTRL_REG        0x0A
#define PL2303_HXN_FLOWCTRL_MASK    0x1C
#define PL2303_HXN_FLOWCTRL_NONE        0x1C
#define PL2303_HXN_FLOWCTRL_RTS_CTS        0x18
#define PL2303_HXN_FLOWCTRL_XON_XOFF    0x0C


> Also looks good, thanks. Just move the reset define block as mentioned
> above.

Thank you for your reply


Please confirm the above new define
If there is no problem.. I will write a new Patch file.

Charles.
