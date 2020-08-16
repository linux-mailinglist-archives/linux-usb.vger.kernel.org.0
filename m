Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2ECF245508
	for <lists+linux-usb@lfdr.de>; Sun, 16 Aug 2020 02:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbgHPA1S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Aug 2020 20:27:18 -0400
Received: from mail4.protonmail.ch ([185.70.40.27]:27342 "EHLO
        mail4.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgHPA1S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Aug 2020 20:27:18 -0400
Date:   Sun, 16 Aug 2020 00:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1597537631;
        bh=4bXrsFcXRxuTDRJ2yuhXi5kSRqCnDzRLoJjTon+lSZ8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=xmV5oBrntsOE+9GPmEw8vcdREAQV0ArTFcNyp2zJA/PLetz/p+OJFalluNnZEN1NO
         JvnTqDqsbfkJoyRBqJhQjyw79C41dzOEqHiO4i0odLkK2HnHWe+/2MMs/YWse8NQbI
         5S4lsJXREae4m2CeXK4/218RFXcQ7DL9xYp6hLms=
To:     Guenter Roeck <linux@roeck-us.net>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     jaap aarts <jaap.aarts1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH V4] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <IqRa8ZnjuWETvNkGXEMzUaLtyG7SwgZ5aZNmrh2rN_97fIHMgcHAKR7pAHteqmzuXIVEuBB5jtBN00OBzb85KA92_RyKEDaC1V8SctNLvZ8=@protonmail.com>
In-Reply-To: <99ee823b-b1fa-74a0-e377-31dc97e4d985@roeck-us.net>
References: <20200815211617.86565-1-jaap.aarts1@gmail.com> <2uSV3Shd92hhPyvj_GgPWEXYDX0o7GczgyAP4ue9S7xTHvwhqa9-4bcdMf3XNKCZ5jkq_KN7xqDRXT_X39VTcqxdvrE5x2Dft1hqNBjhXk4=@protonmail.com> <99ee823b-b1fa-74a0-e377-31dc97e4d985@roeck-us.net>
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

> [...]
> >> +=09=09=09if (val < (2 ^ 16) - 2)
> >
> > Did you intend to write 2 to the power of 16? Because 2^16 is not that.
> > 2 to the power 16 may be written as '(1 << 16)' or 'BIT(16)'
> > (you may need to include linux/bits.h for the latter)
> >
> > But something like this is my suggestion:
> >
> > if (val < 0 || 0xFFFF < val)
> > =09return -EINVAL;
> >
>
> I would suggest to use clamp_val; we don't expect users to know device
> specific limits. Also, FTR, I won't accept any Yoda programming.
>
> Guenter
> [...]


If you don't mind me asking, why is that? I, too, don't like Yoda condition=
s,
but I've always thought that in this specific case - when checking if a val=
ue
lies within/outside a certain range - it makes the code more easily readabl=
e
if it is written like this: (lo < val && val < hi).

Maybe I'm just too accustomed to it?

(Don't get me wrong, I'm not trying to argue with your decision about not
accepting such code, neither am I trying to convince you otherwise.)


Barnab=C3=A1s P=C5=91cze
