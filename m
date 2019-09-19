Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 651CFB7847
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 13:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389563AbfISLRe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 07:17:34 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38137 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389541AbfISLRe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 07:17:34 -0400
Received: by mail-io1-f65.google.com with SMTP id k5so6767257iol.5
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 04:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OBOnA2Jc5PxGnDFJSZ6HxGOMCBhQpi1I+ZzQLsEGGl8=;
        b=Jh681jduHWbH2ZnAPhlXTI3L6JQj0lnqgDiSeHvBXEWGU9v3d2kYuaY/1ikii0STDb
         JF2IhHdYXXc+SGaTzVDwiWwQZjP4G//m8kkbOvuBaR4nE9O9gwkjgdy9i6vP0ucnS0sG
         ssrtDQpnaDuyaeFeGcxf6aU6uzSiKMBv1ziRE9NwYrFYIHNtPJBauSK9pKuVKSY+lDVJ
         AALeWg39a188QtLXxYpw39Fz8XTpgzaiLLf2Jgnny0yn7u7UsNIS3otiWHtKT6HCZQ8x
         Cc7ET/fEPByf8TFeNFB9DS4QVwPamKnGMvGZTHqpeTlcR3b7KFlsg2afPLrw+lKpxGhJ
         cYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OBOnA2Jc5PxGnDFJSZ6HxGOMCBhQpi1I+ZzQLsEGGl8=;
        b=CIpvvTalKsdIt8guwsk4TzQG9kysqroQ/w0yoGokloV70cNcgO/2M5jnFsGDFC79nP
         naaNcuU2sjrD7QAbw4X6yzv86u/EUteK5Db2V3tDNBCZ9Xf1ExuRSb2uECAQg3D39NYA
         bXFy8c9WBNf5c60D+nBNs0S5M3/++x36IJgNYCKo+jIKfDYvxSXRgUINGmeKI+3qfSaZ
         63t3WnZOfRnzvgwOqxlGCDyOHj1pMSiuMGSyy90+CWRVBNyw2yMIiOyL5OFy+gCIKiC1
         HERHzhIepaSFnr6E/yB4EuCeE5j3orsGS3OotJpMCRR7fLP77RvkuTNi12b26kwIrwpD
         TSeg==
X-Gm-Message-State: APjAAAWF8Q8DAHsVBn6DtSC/bf0zoo+8Ows+mwWCx1oAABgVP20GVMrC
        rDXw4NbDKQhps+4y1dDfn2CaKdje4t1Cu/nazc8=
X-Google-Smtp-Source: APXvYqybw9aXR3OyZJY7wr9pfOvHRDndBDCVC9HftOYjBtdoJBBNeuEQMxjvFlSftfS4AeyB0OBJ0ZH8Dz0tAcQ/Mek=
X-Received: by 2002:a6b:6c06:: with SMTP id a6mr10864746ioh.306.1568891853416;
 Thu, 19 Sep 2019 04:17:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Thu, 19 Sep 2019 04:17:32
 -0700 (PDT)
In-Reply-To: <8736gsivmw.fsf@miraculix.mork.no>
References: <CAA=hcWRF00syz8jB1+qdy1pFA7Wk_B=1Z_DT5vYuQrzFKhtZbw@mail.gmail.com>
 <20190917120258.GB489142@kroah.com> <CAA=hcWTD2zYD0gVTu6sDuRqUcTOnn42Gm0s1tOGvBQdQ40Q7LA@mail.gmail.com>
 <20190918054744.GA1830105@kroah.com> <8736gsivmw.fsf@miraculix.mork.no>
From:   JH <jupiter.hce@gmail.com>
Date:   Thu, 19 Sep 2019 21:17:32 +1000
Message-ID: <CAA=hcWQMzgeAkk1E2Lnodq8vqC2akq=w1QUQxGXggS6cP8mT4g@mail.gmail.com>
Subject: Re: Failed to connect to 4G modem
To:     =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/19/19, Bj=C3=B8rn Mork <bjorn@mork.no> wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
>
>>> >> [   44.059958] qmi_wwan 1-1:1.3 wwan0: unregister 'qmi_wwan'
>>> >> usb-ci_hdrc.1-1, We
> ..
>>> That was always my thought until I tried kernel 5.1 under the same
>>> platform (nothing changed except the kernel version), the kernel 5.1
>>> can connect to the 4G modem, I could not tell the hardware engineer if
>>> it was hardware problem where kernel 5.1 can connect, kernel 4.19
>>> could not, how would you explain it? Seems some differences between
>>> kernel 5.1 and kernel 4.19, what I could be missing?
>>>
>>> I cannot use kernel 5, we need kernel LTS on product, too late to wait
>>> for 5.4 LTS.
>>
>> Can you use 'git bisect' to find the commit that fixes the issue?  That
>> way we can backport it to the 4.19.y tree for you.

Is that the fix?

commit 7c8e8909417eb6342ac487dc5ab3076d46718f71
Author: Peter Chen <peter.chen@nxp.com>
Date:   Tue Oct 16 09:17:02 2018 +0800

    usb: chipidea: imx: add HSIC support

Fixes: 7c8e8909417e ("usb: chipidea: imx: add HSIC support")

> Yes, please.
>
> But if I were to guess based on the above info, then I'd start looking
> at the chipidea changes. Commit 2c4593ecc920 ("usb: chipidea: host:
> override ehci->hub_control") looks particularily interesting.

Don't bother to backport it to the 4.19.y, I can use 5.3, and wait for 5.4.

Thank you all.

- jupiter
