Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 525242453F4
	for <lists+linux-usb@lfdr.de>; Sun, 16 Aug 2020 00:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgHOWJa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Aug 2020 18:09:30 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:61253 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbgHOWJa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Aug 2020 18:09:30 -0400
Date:   Sat, 15 Aug 2020 20:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1597524737;
        bh=c178NIdPZpX6rfti//8ogP9BIPmC2WbIfidS1RAMLtg=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Zcmp4H5tcGu5B+T2JtLHMD4r9imIrii0Chu2SD7jNgnVvRaYgcHSc30qg24UeizJ6
         suWuoN0kC7jq5+u8IfzBkX5b6qhUYJzDglTKw8pEViZhsZU/XPzDJJW/URrfYGhhIA
         qB7d6TQx4WrNrh4k7nGZNO4dyYjwh7aV6UWAX0Io=
To:     jaap aarts <jaap.aarts1@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH V3] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <jFeUSolwYuVcf_sROUuSk8EovBBGXiIIQeL7RsDcdjt7kTszfpNIG6ZqD2COx2u5LPojn2BEthfaMqbHmQwUcwPbYc2U7rqDrJDlTkg2Gf8=@protonmail.com>
In-Reply-To: <CACtzdJ1tgbDVxYkcWstkGkz3=E0BTugUT7B5OrxVo15YPU+M4A@mail.gmail.com>
References: <20200814194202.327141-1-jaap.aarts1@gmail.com> <4hk1tR-p2Dc2UbnNVCvFg4AJsucTKOwY0-Kc934bQ8VJSIhiTm-iw1qb03jNb9mGDBqWhXwlnzwB6vxKNLZf6Sv7ozKSigS9IHInXizzmE0=@protonmail.com> <CACtzdJ2cPfz7b6bEUsLB5k+JzXFPLLKxxaYRheFPAwV3UQiu5Q@mail.gmail.com> <92GG6DNvh8x8K43ZGnot6ASLNHBD7l6R6RiI-4jv-Lfki4_tM3IJxPYbp-xajRqMV84Nyw4sp3hZft36ulU2QnxCyhf52kEr6OYe9iujBTk=@protonmail.com> <CACtzdJ0Rdh5L_JEA0GN37AOyYOUGRf4yfbXD+AJCvxZdYdKQcg@mail.gmail.com> <CACtzdJ1tgbDVxYkcWstkGkz3=E0BTugUT7B5OrxVo15YPU+M4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I don't recall ever asking about sizes. I said in my previous email
that I meant "type", not "size". 'bulk_out_buffer' was 'unsigned char*',
but 'bulk_in_buffer' was 'char*' in the patch. That's what I referred to.

2020. augusztus 15., szombat 22:44 keltez=C3=A9ssel, jaap aarts <jaap.aarts=
1@gmail.com> =C3=ADrta:
> sorry forgot to reply to the question about the buffer sizes.
> The reason they are different sizes (in theory) is because
> I get the size for each buffer from usb_endpoint_maxp.
> I do not know whether or not these are the same. If you have
> any experience with these functions and know they are always
> the same I am willing to make them the same size.
>
> [...]


