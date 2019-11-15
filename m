Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC9E6FDC86
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 12:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbfKOLtB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 06:49:01 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46641 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbfKOLtB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 06:49:01 -0500
Received: by mail-qk1-f193.google.com with SMTP id h15so7805239qka.13
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2019 03:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mXQL/upVAujcRGSc8q06Fts1fNuJmRJT6oaoyZGPg6s=;
        b=L8s04RPxoNpRJK/Z5FiTdBs/8ZOc4ywQLALIuWYul1E8s3LxYcqV+tqkdGqPa89XHn
         kGfkCvYFRST76t3hGtOLVNXanD/Iu83BQVqDnL8CmiJ6LH/cOMPZS1trH5Op0jppIiFk
         jbWwhIZXCys/2M+9sHIGxPtqM4lzlWTa/UNvuP846ipHdSefi6PtqIDc/QpWIj1c12xY
         zo0JpDy1B7fS/eARQtW9SiqWnl8a4tUxPRtJzcWZnZskH3fDC4lVMPMfO3I6OhtKpbHl
         yowmJB5J+/t1XSneRFmgYdxx3DT6y39JUjSQdcZQoBax0Dto491RG6hSmEH6YLrfEqH1
         ndzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mXQL/upVAujcRGSc8q06Fts1fNuJmRJT6oaoyZGPg6s=;
        b=pqSV5JP0nmyZKSX49nX+MI7uoXu2QLgRgOr2aESHlFiHxJCOZjnMgCpT/08WXQwfeZ
         jKH/qwEuRTAXv7kSW/Y+FTGg92c8toQAmJCXRNehP2+47+Wo+pqW/jaeHheEnXhk2rb6
         NW8F4dfpp9cm7hOCJvTQVxJPHAAifhzdKjc0Qxrv/SnMgh5WwgX2iZijdqvML1qd6/ff
         J2dTSTE09GiqKcLltwVT63VnCwQbpo1IPBQWVlrihM6HnVagP2YRJJqJd5PRCb/NkwE3
         NRza8QF7lxY4XxOuobl7t18WyCbyJygrN/RQ1ogpdsdwjskCYUvWKlVtQ7+4q+sc+vVd
         QWEg==
X-Gm-Message-State: APjAAAWxLoCzhso4TvA8y6+56/oQbnRVMEE1t4hZMe6mGHb3YJojIbwY
        UQTKD/FUrWPQgr7YCwkNdvQbpSAVw+68pYl1dzh7QQ==
X-Google-Smtp-Source: APXvYqwCwGD6fCtiyQA4tVD4DrDMNABBr4mlLesXyRRln7Mm4d3ThiSTSkPpes5MfjsfIfVhpRawnRsMQwIxHFhPIrQ=
X-Received: by 2002:a37:c44b:: with SMTP id h11mr12206751qkm.234.1573818539866;
 Fri, 15 Nov 2019 03:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20190920102336.21043-1-dnlplm@gmail.com> <CAGRyCJEUa7uZcHwdcF_BsOz4esZ=VSg6aYDWrZmxJSZY3SwEbA@mail.gmail.com>
 <20191115112936.GI5633@localhost>
In-Reply-To: <20191115112936.GI5633@localhost>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Fri, 15 Nov 2019 12:48:48 +0100
Message-ID: <CAGRyCJGhSQYYK0VF8rQrZVqtSpDwqtgfYn0UCTGhV52ATa9s4w@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: serial: option: add ZLP support for 0x1bc7/0x9010
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno ven 15 nov 2019 alle ore 12:29 Johan Hovold
<johan@kernel.org> ha scritto:
>
> Hi Daniele,
>
> On Fri, Nov 15, 2019 at 12:17:16PM +0100, Daniele Palmas wrote:
> > Hello Johan,
> >
> > Il giorno ven 20 set 2019 alle ore 12:24 Daniele Palmas
> > <dnlplm@gmail.com> ha scritto:
> > >
> > > Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
> > > to be sent if out data size is equal to the endpoint max size.
> > >
> > > Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> >
> > should I resend this one or is there a problem with the patch?
>
> This is the first time I see this one. Must have gotten stuck in a spam
> filter or something. Sorry about that.
>
> Would you mind resending, and I'll take a look?
>

Sure, I'll do.

Thanks,
Daniele

> Johan
