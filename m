Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6858AEDC36
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 11:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfKDKNQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 05:13:16 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43203 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfKDKNQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 05:13:16 -0500
Received: by mail-wr1-f66.google.com with SMTP id n1so16323580wra.10
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 02:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kXwmMYKYXiBBMW7Bw101jg/yiDzTe90gT3dsjkAaeHY=;
        b=X0ta5EceMa3wynf6dWdXAsgLeOFWG6TqBOQUOPylkvPeX9OxLJjlLwJmZK1pv4QQKs
         lvuyRMxRJIfuX1SbfQXxNkR4Pcccu5emEYiSmTSW1cR/XDaUtcghHiqetFt2a7sWj27r
         0B1XRb11xxQHnSW+YmfCBpyAVljhYjPCXckLC1DBOc8/Ur2NjHDqB4TkKmjij0NNE1fK
         /JWgOZAwDegGuqSOgbmh0x0h9l5SO1mHQIrbzrZjIA56O10VUkBa3Zj+LqJpiG4eoyRH
         bKr1d/r6tlfoUtt4bWIEXyNNfrvmc6TQXVTG2bdvM7w7OaNsD6QL2fDGHuMZrpFSpyuP
         7www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kXwmMYKYXiBBMW7Bw101jg/yiDzTe90gT3dsjkAaeHY=;
        b=MM7N4Qlyepw1qRsuIBKZ95A4bYYb/WrP2T/OTwkSwxDqNtdCII2nx/1D2fNDoenkvQ
         jOHHORZhiVDvJ3YLDKu8fhuDUd6uWQDvXh7VAFrrom9N+niXYx0tSJgeMgUuarC5oOZM
         Q3/8Lg69OdHmUF18UXcrwh6D6tMimItY9B2Fab1y3AjIpo6vxp2f35plBjOY2GF1gkgO
         4tyH6pld8TIIQd7amaNWr64t3RPboksGkhphDM2RCigMmt3FqNOlEeQ7ERYhoOMlGqV+
         ZEJKOKJb7Nb+gYWSmTec7IpSOZfw+9eRKPp56YGt/ddOlZFHJxBaqVCI+eQ4bUl/xnDe
         z+1w==
X-Gm-Message-State: APjAAAUD5PowkE83nljGmKEezlc+X8VziptTq/Gc8JzVriPNgsWdY5ul
        /LyNjSTeRMuxN2zJTMGEGir/6r+HxlGjPR/NBso=
X-Google-Smtp-Source: APXvYqyO35hygKs8AZSKtdkjIO1SrJOlvxsxMiwJ8oOLqD6blt7ehxhxHx8w61w9dA9BMqWNYYpakDt1YHLCP26yfrE=
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr22976356wrw.176.1572862394153;
 Mon, 04 Nov 2019 02:13:14 -0800 (PST)
MIME-Version: 1.0
References: <20190924121400.1497-1-charlesyeh522@gmail.com>
 <20191023085657.GP24768@localhost> <CAAZvQQ7EdZ=5TtU0qHBzACQ=g5equR+F-j2nt+-0F3bYOH4F7A@mail.gmail.com>
 <20191104091521.GF3657@localhost>
In-Reply-To: <20191104091521.GF3657@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Mon, 4 Nov 2019 18:13:03 +0800
Message-ID: <CAAZvQQ5jTcEz8C4QDkRGdS+WiDv7YMMiX4kyLfjUTxxpUSPxwg@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v8] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> I'm not sure I understand your question; what did you mean here?
>
> This patch will be included in Linux 5.5, if that's what your asking.
>

At 1/18/2018, "USB: serial: pl2303: add new PID to support PL2303TB" is approved
At 1/27/2018, Greg KH help to update the patch on 4.20, 4.19, 4.14,
4.9, 4.4, 3.18 stable tree.

Email title on 1/27/2018.
Patch "USB: serial: pl2303: add new PID to support PL2303TB" has been
added to the 4.20-stable tree
Patch "USB: serial: pl2303: add new PID to support PL2303TB" has been
added to the 4.19-stable tree
Patch "USB: serial: pl2303: add new PID to support PL2303TB" has been
added to the 4.14-stable tree
Patch "USB: serial: pl2303: add new PID to support PL2303TB" has been
added to the 4.9-stable tree
Patch "USB: serial: pl2303: add new PID to support PL2303TB" has been
added to the 4.4-stable tree
Patch "USB: serial: pl2303: add new PID to support PL2303TB" has been
added to the 3.18-stable tree
patch "USB: serial: pl2303: add new PID to support PL2303TB" added to usb-linus

Therefor, this time can update the patch between 5.5 and 4.4 (or 3.18)?

Charles.
