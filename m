Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC2F14AA40
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2020 20:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbgA0TIU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jan 2020 14:08:20 -0500
Received: from mail-io1-f51.google.com ([209.85.166.51]:45102 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgA0TIU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jan 2020 14:08:20 -0500
Received: by mail-io1-f51.google.com with SMTP id i11so11257782ioi.12
        for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2020 11:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=/coirZNFLMH3GtP/lzxIUC8GZEKD/xRaPKrnzgmDFp4=;
        b=Rr8cruibHtnfakT2zM0gUBx51VaPWUB1VCXrcxuL19ncUNTnwq1a61yGHJcX4Vcmou
         6smgK5teUhRz4i6LkAVpW8g6Yhg0frOyB7E5xb7jIM/pkQaVUwWe67Imkrtqq32rh1ES
         eJWBKq4JGAOSaqoYX3KXhEqJ9c6tlt7CEX9ls82hswNTXF0L95/XrJK/iM5FiLbJmANU
         i96u9M571FcjyWTaDcyq7LaJiet2Fzl9aN5q7w/aO6Xzd6XHZwqTLcxMbtYEmMtIAgty
         c32wpv/cX9B5lE/HfUhwhMVLuvrcMeY+2LcTENpDhk7TJ/MUS+FvPKi+3+HPSjiqOZV3
         5sCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=/coirZNFLMH3GtP/lzxIUC8GZEKD/xRaPKrnzgmDFp4=;
        b=efSRE70u2cbiAWSqP5tJYSsXZ2IpAGn/4ba+iJbFyOVbXknuMmlvh0yu0WOuJUVJlv
         mf/48MCTfv7AmmQgJlUHagzsGn0Glo8wJXwJpgcwALUKQSiF2wPo/WgRqGMNzRDReLfX
         AGo+1G80Xnt3N/bKOY0iEYJSFDCoVLQi0LaOwjO90OX6WcPHibpIM1bnGJcTfji6BT03
         FqRyXU6ip3k/puNmMsXP4d8m5qszmmdAvOsiL/v41Anzcb+/UaD01PXWZc/nkaa+0a6J
         RXdnyT8Ux8kNJEDzkCbgcJ2OqkGq+n8skWstlogoZ1uFJ8H9Tqo/GH4PoxKtASrq9aC7
         SrOg==
X-Gm-Message-State: APjAAAWllC6GUzDnIn58sVQ7OZC5TF7T4NLHg8rsrqtd82Ukf+l+rDSD
        hOUnaaIzLvTwy6j5e/Iu+pDFXvNbIXwWd8X3BN9WUJJBvz0=
X-Google-Smtp-Source: APXvYqzNnhBmVvXFpmJC7HPExmdDdfWmIZFa7Q2THkuMjPiBvyz7MzJznRNTvIlHiU86EszoLTNh5+OqhAa74EVHaPg=
X-Received: by 2002:a5d:8782:: with SMTP id f2mr13508936ion.53.1580152099313;
 Mon, 27 Jan 2020 11:08:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Mon, 27 Jan 2020 11:08:18
 -0800 (PST)
In-Reply-To: <20200127173034.hw6il2cnpvgl64py@beryllium.lan>
References: <CAA=hcWTiqmULgD1JqEHUo4iXtrCt+zQAHmJL8=wPUNqPA57ENA@mail.gmail.com>
 <20200127173034.hw6il2cnpvgl64py@beryllium.lan>
From:   JH <jupiter.hce@gmail.com>
Date:   Tue, 28 Jan 2020 06:08:18 +1100
Message-ID: <CAA=hcWTzEPeyH1bzyC1jGZVoiE2hho8fW6E6NTnAviXmw27k=w@mail.gmail.com>
Subject: Re: 4G LTE connection stability with USB voltage requirement
To:     Daniel Wagner <wagi@monom.org>
Cc:     connman <connman@lists.01.org>, ofono <ofono@ofono.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Daniel,

Thanks for your response.

On 1/28/20, Daniel Wagner <wagi@monom.org> wrote:
> Hi JH,
>
> On Mon, Jan 27, 2020 at 01:26:41PM +1100, JH wrote:
>> It seems to me there are subtle differences between connman / ofono
>> and OpenWrt netifd, could the connman / ofono require more rigid
>> stable USB voltage than OpenWrt netifd? Or could the OpenWrt netifd be
>> more superior than connman / ofono in terms of 4G LTE connections?
>>
>> Appreciate your insight comments and advice.
>
> What about measuring the power drawn by the device? And while at it
> also careful check the datasheets of the components if the tolerances
> of the hardware components are meet.

I did current measuring, running ConnMan and oFono, the power
consumption was about 150mA - 260mA, running OpenWrt netifd, the power
consumption was about 150mA - 200mA. I have to say, the result might
not be accurate (1) if I change the voltage slightly, the power
consumption would be different; (2) The maximum current consumption
changes from time to time; (3) The DC power has only one output and
one current meter, I cannot connect both devices running in parallel.
I'll find a DC power supply with two power output and 2 current /
voltage meters, and to buy another debug cable to connect both devices
in parallel.

> I cannot comment on netifd since I don't know anything about it. But
> it could be that ConnMan and oFono together do more CPU work hence the
> device drains more power. I can tell you from experience if the CPU
> doesn't get enough power you see really random crashes and weird
> behaviors. Check the reports on Raspberry Pi and power supplies.

Good to know that experience, it does help a lot.

Thank you Daniel,

Kind regards,

- jh
