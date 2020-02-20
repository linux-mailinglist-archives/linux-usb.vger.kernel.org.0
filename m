Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3C3C165E7C
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 14:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgBTNQP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 08:16:15 -0500
Received: from mail-qt1-f176.google.com ([209.85.160.176]:46081 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727931AbgBTNQP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 08:16:15 -0500
Received: by mail-qt1-f176.google.com with SMTP id i14so2770858qtv.13
        for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2020 05:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=+NfiYwwPA7ooP+cdAEaBr1ztzKat3cXTXeQyrILmnPI=;
        b=vG1QEkrA3Uvi8+PJ36gPJrxIpo8W+zB7FdH4ofKAwjvIm6ioIVs5qIUf70m2FpH3Qu
         bs9vjwKuo3/9gyeTxSBqp1okU84fYRQChyl8pNgJzVFseu/cDPP7QBrf1LqEXv6Ru6Po
         gXBmL/GP7K4mYpsUVOQPYGWkDx83nyBTt4YavfgMf+cLoPeUCdztudq9E7wH2GC4eG/F
         dR73YP+qYb+CI3BFu7LIRonB39T4L4UmeTxk10GrjTnAX+wnBWNj55d3comWvnAkc0Pb
         ESla6kB9n+uZXL1MHIKxlkNIe+o8zGrx1qxgt0bi2PgjVwoIRKZrCSKZ+yHWhmfXs72D
         A0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=+NfiYwwPA7ooP+cdAEaBr1ztzKat3cXTXeQyrILmnPI=;
        b=RiQyAVKmxQWJbBNZmXwoGdkUe9fyYdBltr1fbXnbxl9ZJQcV2j4RBR3QhM99D6eXwv
         JmB8Vugqrcntb6QLo2IkQnTvMfJrDQyP3eZObuNcn9JU1yh2MNvgaDl5QMlnxZTSuWPy
         2By45oG3XJyZQizJpx3MYvJ4t56nrHK7lLBLGR+xUp6dc5BBHnbf91NT6CBwpUZag9wp
         3pzVKqyRiKsxKuGLXbmKw1mFZWh7KUz15OPkrGxRi1vEx5PAjG+MOf5Fs/SVqC0illck
         xrNQS/jKf4kC7bV67C5VaOim39FVXcXTKqiANP3tA1MWtanoJwH6bvYg8GzTjDEW1Y9N
         NsxA==
X-Gm-Message-State: APjAAAVSe/J2lRkMG+sQRd/jZoft6pCKMAMzH/4XGiVN1ehmHekLqAE6
        QzvW61+yTKrbptkOoc7axFKjAK93BjsLGw==
X-Google-Smtp-Source: APXvYqyRI4JW1TgCgwsEtuN8ySjtnGFD61XYNQST/t55pw0MgtbdO+JgbWvHSM865LxuCjG9iUi32A==
X-Received: by 2002:ac8:958:: with SMTP id z24mr26768158qth.40.1582204572879;
        Thu, 20 Feb 2020 05:16:12 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id k29sm1764475qtu.54.2020.02.20.05.16.11
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2020 05:16:12 -0800 (PST)
From:   Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f170.google.com with SMTP id a2so3426768qko.12
        for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2020 05:16:11 -0800 (PST)
X-Received: by 2002:a37:a111:: with SMTP id k17mr1060759qke.26.1582204571511;
 Thu, 20 Feb 2020 05:16:11 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
 <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com> <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
 <ee47be28-ba9f-750f-65d2-51a722ce291d@synopsys.com> <CAP9ODKqa_4NSsFMUpyFDt3ohgGBCMgbOyKaVjYfSjmcZLmmC+A@mail.gmail.com>
 <380d765b-8867-a899-b67a-c016c09fa27b@synopsys.com> <CAP9ODKqL_GN+iebL3wPX_9fEUtUVP8Ahv03yJ1R-JLDr=Cn0BA@mail.gmail.com>
 <beddbc55-fd22-96b7-c980-e4ea207a42f5@synopsys.com>
In-Reply-To: <beddbc55-fd22-96b7-c980-e4ea207a42f5@synopsys.com>
Date:   Thu, 20 Feb 2020 10:16:00 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq2nEHz_rbwwCv-94LSBOq0it2Kc4yhCqrLT-XxoXommg@mail.gmail.com>
Message-ID: <CAP9ODKq2nEHz_rbwwCv-94LSBOq0it2Kc4yhCqrLT-XxoXommg@mail.gmail.com>
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

Thanks for all your help on this, ...

On Thu, Feb 20, 2020 at 3:59 AM Minas Harutyunyan
<Minas.Harutyunyan@synopsys.com> wrote:
>
> On 2/19/2020 7:10 PM, Otavio Salvador wrote:
...
> > What sequence do you want us to do?
>
> Yes. Can you provide also USB trace?

I can, however, it is not clear to me what you want us to do.

Should we use, on host side, usbmon? or do you want something different?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
