Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB733167F9C
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2020 15:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgBUOGV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Feb 2020 09:06:21 -0500
Received: from mail-qk1-f170.google.com ([209.85.222.170]:42608 "EHLO
        mail-qk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728477AbgBUOGV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Feb 2020 09:06:21 -0500
Received: by mail-qk1-f170.google.com with SMTP id o28so1861882qkj.9
        for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2020 06:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=DiyvrX9xQKujU8ps51BYPHqKGJq6CWTBSoEZ36cxK9o=;
        b=h5ekut7f9mAYdIsbofbHgwxljL5Ld8S9zUzMm34R2D16whmTzt29fj0dOn2M/ZxERG
         s8ps6ii0Uh6357U4zyAA8oI1cnp/uvK/rUJWqmwA0qo5lTe5V+pIVcXmM3b3IAdPHtf7
         4HEjAG8VPFoOCURl7PTlteg4hlUJJpnEKIIq4lo1HoqIiVR895Y5DdXUHqgCRX5RtXk0
         7Mm90ZM+F5BuOkdrKCiGYzmeWtLWN2OdKd9g+6hOagi3B9nLT7NvS57egp2uRU1LUru9
         VqzRvnhTN/or/jR4UMLWfiaI4cygxNb5uMBnLhiPl1Bp1wryBPNiy1n5pREVTnpuyYPr
         7GyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=DiyvrX9xQKujU8ps51BYPHqKGJq6CWTBSoEZ36cxK9o=;
        b=Lzz6PWsrrkKNivKQn8TsZrZResw+Q4tUHtkXJry2LdKzFBPdriEBz03fhtCj1Gc3zK
         kMKc1Gx5RCqUZ1A2DOBe3UE0RWjWVf31n3UYI1ITyw6Pj7Obu+9nuuYqBXCf0LAEVQdw
         q/h9S6JJcUOu3eRE2l3Y48P0sl6rSTk/Br5CNQyorIxQdqfzO/I8/l1w3W/LydfBg0MQ
         ef2EJbz4GlZWKl7St34ScNS7yTddp7h9J9nzPoofX6hWZqotKMXzobd07UZUXwd4Yjk6
         egoXlMnEmtOVyi7rUiCWTIldthJMaGJ42wijevBOhJC9tthmk6Bpazhi39aGTOveFlHj
         fh8Q==
X-Gm-Message-State: APjAAAXewoSpdA0N5SV3isBxmCxZPHjm8NzE+hwnsYBg8f1mKQ4PbQXn
        xlItwGayBrump/WSU2MUNPO7CYzeAQQClA==
X-Google-Smtp-Source: APXvYqzklATCC6oNRdDK9OkgKAqwhdCYO1rDdamL1UeYQSbEEVBlvZKlRL6EQU9I8O4//cTN3TO2uw==
X-Received: by 2002:a37:494f:: with SMTP id w76mr34517379qka.309.1582293979824;
        Fri, 21 Feb 2020 06:06:19 -0800 (PST)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id z5sm1599732qta.7.2020.02.21.06.06.18
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2020 06:06:19 -0800 (PST)
From:   Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f169.google.com with SMTP id p34so1314084qtb.6
        for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2020 06:06:18 -0800 (PST)
X-Received: by 2002:ac8:607:: with SMTP id d7mr31861329qth.271.1582293978531;
 Fri, 21 Feb 2020 06:06:18 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
 <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com> <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
 <ee47be28-ba9f-750f-65d2-51a722ce291d@synopsys.com> <CAP9ODKqa_4NSsFMUpyFDt3ohgGBCMgbOyKaVjYfSjmcZLmmC+A@mail.gmail.com>
 <380d765b-8867-a899-b67a-c016c09fa27b@synopsys.com> <CAP9ODKqL_GN+iebL3wPX_9fEUtUVP8Ahv03yJ1R-JLDr=Cn0BA@mail.gmail.com>
 <beddbc55-fd22-96b7-c980-e4ea207a42f5@synopsys.com> <CAP9ODKq2nEHz_rbwwCv-94LSBOq0it2Kc4yhCqrLT-XxoXommg@mail.gmail.com>
 <1d2ee918-57e4-53b2-6953-0107d7720c59@synopsys.com>
In-Reply-To: <1d2ee918-57e4-53b2-6953-0107d7720c59@synopsys.com>
Date:   Fri, 21 Feb 2020 11:06:06 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoS5KQrhTrUvahHEhQG-WA+bfLnP4tTFxzrQaGh1nTcZw@mail.gmail.com>
Message-ID: <CAP9ODKoS5KQrhTrUvahHEhQG-WA+bfLnP4tTFxzrQaGh1nTcZw@mail.gmail.com>
Subject: Re: USB DWC2 stops responding when insert/remove cable multiple times
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Minas,

On Fri, Feb 21, 2020 at 3:52 AM Minas Harutyunyan
<Minas.Harutyunyan@synopsys.com> wrote:
> On 2/20/2020 5:16 PM, Otavio Salvador wrote:
> > Hello Minas,
> >
> > Thanks for all your help on this, ...
> >
> > On Thu, Feb 20, 2020 at 3:59 AM Minas Harutyunyan
> > <Minas.Harutyunyan@synopsys.com> wrote:
> >>
> >> On 2/19/2020 7:10 PM, Otavio Salvador wrote:
> > ...
> >>> What sequence do you want us to do?
> >>
> Please provide dwc2 debug log when stop working with g_serial exception
> dump inside.
> Also provide dwc2 log when it's work without issue.

Attached.

> >> Yes. Can you provide also USB trace >
> > I can, however, it is not clear to me what you want us to do.
> >
> > Should we use, on host side, usbmon? or do you want something different?
> >
> Do you have any USB tracer equipment to record trace between host and
> device?

I don't. Can we instrument the kernel somehow to gather the info we need?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
