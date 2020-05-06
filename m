Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373E51C7D51
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 00:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730127AbgEFW1x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 May 2020 18:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729956AbgEFW1x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 May 2020 18:27:53 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A899C061A10
        for <linux-usb@vger.kernel.org>; Wed,  6 May 2020 15:27:53 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id e20so2783897otk.12
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2020 15:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wh9X0viLAqBaCyOgkq5YZkPRFay/niTUsTksW/b9xjc=;
        b=CAKq1HaIvs35k+7NyjoxmcRuziq+i6ov82ilXW4wZMUrNej7UtuwNVQkHNOAAco+1a
         /J3br1yYIYX9Km9PQxhLbZpUvZ/GqUlB3+M+8J9JbMZjxzl0G2OjtqJtB5FaBfgaoaZn
         UryVxJEI2uuCRYFnpd/5B2GsjBEVaXH1rfs3eoq8ysS464Ra+2ZrJhZ/gC5Vnlu6+kQY
         bQcTHmZfYWxG0eIqV8XgfJzNYhI0tR0jvpAAkUfkxnHlVYWptgMRtH6WKJHpe5Z5xAct
         43LCYejXAM+DK03Qq7PKwjxh0eNyHgAnaNWFOPysYGKRgP17kqZQhn/jVllhC+UlScTB
         ZulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wh9X0viLAqBaCyOgkq5YZkPRFay/niTUsTksW/b9xjc=;
        b=c5HRitCP9F171fla+dKcH+0doMF8BOxcQ64hsH8H6zVprcy9RApfsZxzhbNRMy9rQp
         wEjqwYP9Ly+BwMt4xhh33ZZ304uPZXlrDMcqGmhFr96RJRZIriUlg5pTaQmIwTKnezbe
         VIO3fAmq78AOTlhF3NzFHupSoMD7Wc3RfDqkDouEYpg4wMI8HiK9PJ05ADOSWebh0w4f
         tRxNhUIos0zvaJ65meZo92W27ZuCn6FaxhlmSB81uCcS8ntFsFaWKi1MWzXM/2JqtxRS
         z6Dcy8GvwfSq2hXpEkrxzxcuAKqS3AdYpgPblSfyaZ4nYJLljzBrF87k0CD4+3zfj+f/
         OKLw==
X-Gm-Message-State: AGi0PubRFfygLKM9d3cHLxnGJCPZITsHHcmb/RhTgL6YXxZjv1ZbCMJp
        zRiw8fBVTQANJnXkz7CG9goBqPcFJororsTk70rClA==
X-Google-Smtp-Source: APiQypI20QdEI7sgKDFAHfmiXS/vC1g/OfTgcmywmGuTIvYN+hRDogr8IPcoVqlopplBf2ONeVdv9YUQFAZMnjd9558=
X-Received: by 2002:a05:6830:1589:: with SMTP id i9mr8813654otr.102.1588804072594;
 Wed, 06 May 2020 15:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191028215919.83697-1-john.stultz@linaro.org>
 <20191028215919.83697-4-john.stultz@linaro.org> <87mudjj4rc.fsf@gmail.com>
 <CALAqxLU+9uEcdRVaLfh+eQrDtZbDGod9pRXhBX=prAhg9MXagw@mail.gmail.com> <CAKgpwJVaKpsgMjKcnYyJsfNj0ibkPt=mdn-NxfOkeX1jfL=9iQ@mail.gmail.com>
In-Reply-To: <CAKgpwJVaKpsgMjKcnYyJsfNj0ibkPt=mdn-NxfOkeX1jfL=9iQ@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 6 May 2020 15:27:40 -0700
Message-ID: <CALAqxLVXauXP0r4Hv2Axa4PNf_F9wp644peYV06bdsPtMKGmLA@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] usb: dwc3: Increase timeout for CmdAct cleared by
 device controller
To:     Jun Li <lijun.kernel@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 6, 2020 at 2:00 AM Jun Li <lijun.kernel@gmail.com> wrote:
> John Stultz <john.stultz@linaro.org> =E4=BA=8E2019=E5=B9=B410=E6=9C=8830=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=885:18=E5=86=99=E9=81=93=EF=BC=
=9A
> > On Tue, Oct 29, 2019 at 2:11 AM Felipe Balbi <balbi@kernel.org> wrote:
> > > John Stultz <john.stultz@linaro.org> writes:
> > > > From: Yu Chen <chenyu56@huawei.com>
> > > >
> > > > It needs more time for the device controller to clear the CmdAct of
> > > > DEPCMD on Hisilicon Kirin Soc.
> > >
> > > Why does it need more time? Why is it so that no other platform needs
> > > more time, only this one? And which command, specifically, causes
> > > problem?
>
> Sorry for my back to this so late.
>
> This change is required on my dwc3 based HW too, I gave a check
> and the reason is suspend_clk is used in case the PIPE phy is at P3,
> this slow clock makes my EP command below timeout.
>
> dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401]
> params 00001000 00000500 00000000 --> status: Timed Out
>
> Success case takes about 400us to complete, see below trace(44.286278
> - 44.285897 =3D 0.000381):
>
> configfs_acm.sh-822   [000] d..1    44.285896: dwc3_writel: addr
> 000000006d59aae1 value 00000401
> configfs_acm.sh-822   [000] d..1    44.285897: dwc3_readl: addr
> 000000006d59aae1 value 00000401
> ... ...
> configfs_acm.sh-822   [000] d..1    44.286278: dwc3_readl: addr
> 000000006d59aae1 value 00000001
> configfs_acm.sh-822   [000] d..1    44.286279: dwc3_gadget_ep_cmd:
> ep0out: cmd 'Set Endpoint Configuration' [401] params 00001000
> 00000500 00000000 --> status: Successful
>
> Hi John,
>
> Do you still have this problem? if yes, What's the value of
> USBLNKST[21:18] when the timeout happens?

Sorry. As I mentioned, I was working to upstream a patchset that I
hadn't created, so the context I had was limited. As I couldn't
reproduce an issue without the change on the device I had, I figured
it would be best to drop it.

However, as you have some analysis and rational for why such a change
would be needed, I don't have an objection to it. Do you want to
resubmit the patch with your explanation and detailed log above in the
commit message?

thanks
-john
