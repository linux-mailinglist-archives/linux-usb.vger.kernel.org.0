Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85B01426CA
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2019 14:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408181AbfFLM5r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jun 2019 08:57:47 -0400
Received: from mail-pf1-f173.google.com ([209.85.210.173]:39508 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728455AbfFLM5r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jun 2019 08:57:47 -0400
Received: by mail-pf1-f173.google.com with SMTP id j2so9629511pfe.6
        for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2019 05:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oGo93XToobCGU6h0Gp7w28VOF+WmamSxTodPjueQYLw=;
        b=P6ZHhGlXW2XNmbTc134OlZNysUPKnlXtBGB0HkZZ8DnCcvHo3+Eb7t4CIvLlWfJWEh
         kEw4l8CcUGBSGiYm2sDz/XYOeCGDC0K130P25bobJCnV7z8rN8f7Iuid1OdXRpjdMA7W
         f1bwx8DLXpAfiatunxKWA8gJ3ub0aE1WXhgbAgyrWNo+FDFgL+Tzl6UiIrLTqv6GGOyc
         5OE5aHY5Z2vxAdudPzyk1HZKhpIg/SKnvDGj5HawwVu9NuCqwIh3wPc9J/5OSonn1M7r
         aJYDp8HxCIeQRT61UMVHXKQ4zC+Wh6V0q58uf6wLC2vBre7IE2jE6OtVOKhTYOQIfQoH
         E2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oGo93XToobCGU6h0Gp7w28VOF+WmamSxTodPjueQYLw=;
        b=r9JGNArMRiZmkk6/4Winq7yfPs2gGlFcVygl1vvcaeUG3zIZVNKKq3BFoNW5WnmZa+
         zQuXumnMtP6ti2etTDs/JmGcF47+YjHf4MekiE8VQfcjPxn/uRFYhf8CCdFpsYDIQ4SR
         w1jD226XH1f6UY2/Rucqy5nQ8pV96OySt1Nk/ztg1k3/839/3oeDeHuv9YZhm+agYySk
         iFaxpWiBFOsnv/tV7zWyiv3XLB3izzSmhYFbNro7B3me1UsHdGRMUg8mmE+jwME7Pdvf
         C5i1dSO6mRGEz37DbOsMlntuQ/TZQnLDPnxHLcYeBMuxtNqQdff7InotlYLswBbsIOg1
         nSVA==
X-Gm-Message-State: APjAAAVfLDHdsXlQLuWB2aDljjj6F+aplZqS3TJnoM6rWyuoR8evhhe1
        NmeqtPq9tRTQBADhufEEmuojMNAQDQ88ZvK53FE=
X-Google-Smtp-Source: APXvYqzmVWCCTo4WIu2w0th1wwn9eUxQG72aB4AMhomn6I/CX+Ca/BOE2VTD7+N2/bl33OBGKQZHyNJGOIKWSYLDBBQ=
X-Received: by 2002:a17:90a:3787:: with SMTP id v7mr23165654pjb.33.1560344266991;
 Wed, 12 Jun 2019 05:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190611075431.GB7918@kuha.fi.intel.com> <CAB31r6V+PYppYJz29u_hfpiL6xqhhe+-2xZTRpqOmpLrtCdh8Q@mail.gmail.com>
 <20190612095532.GB19831@kuha.fi.intel.com> <CAB31r6WFwkJwnkqCy3Lw4f2ybZ63EoJFxAcLyDFvm_gHkLRrOQ@mail.gmail.com>
 <20190612123242.GA25718@kroah.com>
In-Reply-To: <20190612123242.GA25718@kroah.com>
From:   Vladimir Yerilov <openmindead@gmail.com>
Date:   Wed, 12 Jun 2019 22:57:35 +1000
Message-ID: <CAB31r6UkueG0wFz5genq=z0xNZNwymkxrxG4YXSWXH--VvEU2g@mail.gmail.com>
Subject: Re: kernel NULL pointer dereference, ucsi bug
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oh, you are right. I meant... You know what I meant :)
I hope the fix will get there eventually in one way or another. Should
you need any further tests from my side, just ask and I will make my
faulty machine work on it.

Thank you guys again for your kind assistance.


=D1=81=D1=80, 12 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 22:32, Greg KH <gr=
egkh@linuxfoundation.org>:
>
> On Wed, Jun 12, 2019 at 10:23:56PM +1000, Vladimir Yerilov wrote:
> > Yes, it works.
> > I've built 5.2-rc4 with this patch and it works fine now, the problem i=
s gone.
> > It is great that I didn't have to downgrade BIOS as a last resort in
> > my attempts to workaround this issue.
> >
> > Thank you!
> >
> > Cc to Greg in order to let him know that it is resolved now.
>
> It is not "resolved" until the fix is merged into Linus's tree :)
>
> thanks,
>
> greg k-h



--=20
----
Best regards,
Vladimir Yerilov
