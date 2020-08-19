Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2893C24A0C3
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 15:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgHSN4k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 09:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbgHSN4j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Aug 2020 09:56:39 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27B3C061757
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2020 06:56:38 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id u126so24669914iod.12
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2020 06:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ROiGQT5nf5EsheymP3lPAfkef8I86vBclbumuFqKS3E=;
        b=e9OnNiuvLq03OKxxnuRUPrL8+abr9edkGuoScvGrvrkvgGLJPFew/f6cSQrtUYQSC6
         i19d7QOAyVuvlIRtktMIcVEaaobUWnbZgizeOSXl5L3Neh8Pvd+3Kz5gA6lDjxANGn5t
         qJScxmrbcmUU1X+8BkGO3N4eH1yqNtiEAIMlMTwckVpoh6s1QLKNdaND0EKWtMfBmCMi
         ZFkk4bU+neBaXVHQ09LmNUTSxHGmmsrVMw2l24GsNJxj0no7sYlioTG0C/dW4P06eoF9
         NcvpJ8fyQUjVjOUjCTHRpp1Xaoa76X9WHskPRGefxRenW1mv14xjIoxLmNXB+s9PVWpe
         R1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ROiGQT5nf5EsheymP3lPAfkef8I86vBclbumuFqKS3E=;
        b=is7p4Z5v5lzz1oy7JlWvD1YPuE0kr+/66KAwWw92t6GoX2evspyTe4FFXERlTN8bBe
         AOkLc8QG6B0bzn8BG5taoHzJurXqFS5oqoo8/USo/1dLMWikkjkhnxcmlsM5aAX6baUG
         5IoW7xGuAIj52ile7byVqIoyKw+1Yb9wy0lI57AZbOJ3tzX6npVATodjS/GQ0V737yK8
         lw2sWDIXyuiI84uKkMP27ezcDVwYKgYxtaoFeWjVnk7k6qH9r3FU7PU1LsnPzjbWLmeo
         MH7I0eGpoUYT26fPYF/hbICp6HGSc3uVTbrnfI0hr8OOvzm0NE41Ho/qwyHfnKqMBNdk
         RYUA==
X-Gm-Message-State: AOAM531gIhP2WOjgUIVvWWoO8kEwjbEDM8nYBUxhFsZkGXVkwdkYaKHu
        Y7mTmpc+kTs6cgJF00ZIBbyGC903ja5p4RMRv1NHGw==
X-Google-Smtp-Source: ABdhPJyAC76YAvuOVxGmoaFCtV9OxcNm31g2zy2oAy7NEd8EX/EWif8X1I6T28gzo7U3Lo1TMUqhhN/fL+9g7OPZfXk=
X-Received: by 2002:a5e:9601:: with SMTP id a1mr21080386ioq.179.1597845397641;
 Wed, 19 Aug 2020 06:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200818165848.4117493-1-lorenzo@google.com> <CAHo-Oox6qcD-+FoB0d+s45e1i4q_zw07a1NZGYNrah=goT1nQA@mail.gmail.com>
In-Reply-To: <CAHo-Oox6qcD-+FoB0d+s45e1i4q_zw07a1NZGYNrah=goT1nQA@mail.gmail.com>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Wed, 19 Aug 2020 22:56:24 +0900
Message-ID: <CAKD1Yr1daQPFvZ5abGk4pgA779FsM-L+eRg_yjxgDcOL5N1QZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: gadget: f_ncm: fix ncm_bitrate for SuperSpeed
 and above.
To:     =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 19, 2020 at 6:39 AM Maciej =C5=BBenczykowski
<zenczykowski@gmail.com> wrote:
> > -       if (gadget_is_superspeed(g) && g->speed =3D=3D USB_SPEED_SUPER)
> > -               return 13 * 1024 * 8 * 1000 * 8;
> > +       if (gadget_is_superspeed(g) && g->speed >=3D USB_SPEED_SUPER)
> > +               return 4000000000;

Will respin to change this to 4000000000U to address the warning
reported by the kernel test robot.

> Do you know what this actually affects besides the display?
> My cursory investigation shows it gets printed to kernel log and sent
> over some sort of ncm notification to the other side...

Yes, it's sent in the ConnectionSpeedChange notifications which are
intended to inform the host about how fast the link is. For a direct
connection over a USB cable this does not make much sense, but for,
say, a Gigabit Ethernet dongle that uses NCM, you'd probably want to
inform the host of whether the connection is 10, 100, or 1000M. This
is not what the code does now, obviously.

> Is it better to underestimate or overestimate?
> (ie. would it be better to report 3.5 gbps for super and max out at
> 4.2 gbps for super plus instead?)

I don't think it matters much. I'm happy to put 3860000000 for
SuperSpeed and 4200000000 for SuperSpeed Plus, or whatever else we
think makes sense. The speed is theoretical anyway. I suppose
reporting different speeds might be useful to debug whether the
connection is using 5G or >=3D 10G.

Felipe, any opinions?
