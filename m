Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E10B121467C
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jul 2020 16:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgGDOiS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jul 2020 10:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgGDOiS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jul 2020 10:38:18 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C792DC061794
        for <linux-usb@vger.kernel.org>; Sat,  4 Jul 2020 07:38:17 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id k15so20113560lfc.4
        for <linux-usb@vger.kernel.org>; Sat, 04 Jul 2020 07:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=r7BbZSJHXx9OGSO54imY/1DoSLqAEAmo7trY9hlmySA=;
        b=lD9H/W2dq0sGKNfoPgPXsZUUzLKuvWMhvuFijELNqDzbxhXi6hKPwxHsQYayoeL67f
         xgF3SId6HEAHwIuY0Z58MCtmz8WcCDAUI52IIochxV8wNvzkrR56LrIwJEf5jlfnnfK+
         Iual2GgiGwHQD2kCO/4oDWp5Eps9EKoI9IaBXVUildDf1L8uto3hFC0D9h+g9PA8s115
         /Wt3XKc/+wSjcdeEuZMfjr7IemeOJqQYpQF7OX+CEs2hLdwWbtQ++L5nyXCCopULdlaw
         1261Mf8HtOMpxK0WY4r9zRs10HKRsSZ5zwT5cdphIgQR7mPX3DiAMGbWClxbVdOhKpKG
         GDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=r7BbZSJHXx9OGSO54imY/1DoSLqAEAmo7trY9hlmySA=;
        b=iDWyek/T/FwcUxE98iXMxrxVUSCjUnUUL2V5XX4CmsAyW5UZPL9IgDeddbyswcCFsr
         waWz0voDEgYMuGz1F0BcpYL84MHZbPw+V9qgCMKmbp3qnkKTiftSd6RkGw/gjsNwEilb
         bVa3Lqeyw3oo5y8aVtzV+eO+2EtP55b/3ZmO0mLUupHgKbSfhNgoZnc6ZS0x3F481u8x
         XNNj7R53/Iu2mNg46IFcVpMSP/1xdDVnLjufx/pW1P1jcW15CYOnO7bNz01/XiVfk1nn
         GitgyiZz2rZmOHO2TAcu/24f6IAuUmjZfXMTCm1rIGXXiz3Tv4KT0pDPrw0pSi1N753A
         EIOA==
X-Gm-Message-State: AOAM530mdzGdFhWFW5k/LpVps07+OlhA8ROn4C3B+i1H9ELyU4KkmXj1
        1zMtO8x7y7Pw1VJBQD8PuU773NUw
X-Google-Smtp-Source: ABdhPJwi7oUbYxoSgLDfSZyaVyZdpnoyxtq27Wa3oXEGXwZ9AxU9ttTSzxeQfo/Tf0xymFzULyRczA==
X-Received: by 2002:a19:ca11:: with SMTP id a17mr24717066lfg.120.1593873495918;
        Sat, 04 Jul 2020 07:38:15 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id s8sm3962865ljh.74.2020.07.04.07.38.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:38:14 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Yang Fei <fei.yang@intel.com>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Linux USB List <linux-usb@vger.kernel.org>
Subject: Re: dwc3 inconsistent gadget connection state?
In-Reply-To: <CALAqxLVPOzD6FD9qJRJjTYai_zL_YzpCkPecWyE-KhTmEHNJYA@mail.gmail.com>
References: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com> <87o8ow7wka.fsf@kernel.org> <CALAqxLVPOzD6FD9qJRJjTYai_zL_YzpCkPecWyE-KhTmEHNJYA@mail.gmail.com>
Date:   Sat, 04 Jul 2020 17:38:10 +0300
Message-ID: <87lfjz73cd.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Stultz <john.stultz@linaro.org> writes:
> On Fri, Jul 3, 2020 at 2:54 AM Felipe Balbi <balbi@kernel.org> wrote:
>> John Stultz <john.stultz@linaro.org> writes:
>> > I was curious if you or anyone else had any thoughts on how to debug
>> > this further?
>>
>> Try enabling dwc3 tracepoints and collecting working and failing
>> cases. If I were to guess, I would say there's a small race condition
>> between setting pullup and the transceiver sending the VBUS_VALID signal
>> to dwc3.
>
> Trace logs attached. Let me know if you have any further ideas!

You can see from failure case that we never got a Reset event. This
happens, for instance, when dwc3 doesn't know that VBUS is above
VBUS_VALID threshold (4.4V). When the problem happens, I'm assuming USB
is completely dead, meaning that keeping the cable connected for longer
won't change anything, right?

In that case, could you dump DWC3 registers (there's a debugfs interface
for that)? I'm mostly interested in the PHY registers, both USB2 and
USB3. Check if the PHYs are suspended in the error case.

If they are, try enabling the quirk flags that disable suspend for the
PHYs (check binding documentation). If that helps, then discuss with
your Silicon Validation guys what are the requirements when it comes to
suspend. Some PHYs are inherently quirky and need some of the quirky
flags dwc3 provides.

Note that disabling suspend completely is a pretty large hammer that
should only be used if nothing else helps. Some PHYs are happy with a
simple delay of U1/U2/U3 entry but, again, check with your Silicon
Validation folks, likely they have already gone through this during chip
characterization.

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8AlFIACgkQzL64meEa
mQYU8g//ef1SmQKU0d90L3vLJZm6b284mIWtxAwUBwnVlC70xwuBABuJMXzPlkE8
9BgaAJ+44cqrLria+KfSFbJcmczAx25awUjjZOJ75oknhhrGP+W784xkpnNgQWZy
fgZD6Sa9LvyatSKNYl6VxWY16dkMje24+Lxxx5rjTTTQf39aD6Ml7bdeH2KlaUCW
z0drEW0wBi7bgr0RBeKQGGW3ipEtmKpPZEIXjGCvPgBln4+TUF9DwK0Cv9RrKo+Y
wA9jkM/uc9JFBZNw14wP4jooDE9fev/Shv3LER2yvBtfpRDmXYQ6d8wmlMOkQNS0
URjeAjBorTFxLEX9xvF09KzOCLOF07GLta55xc2+GchcPGxK/Z8DJ8S0KVHKIiDP
32q4SrN222MXexvFq/ZUMwLfIhkq4X2sLFxTLvn0b0jNA6L1FdpD0YEIrcTyxbhV
vsKz/m+UrX6NIH+scr8ctmsRoWiKK7QyANfhUlYa4oo1AjzO88XaHzBp0ZTTEbir
cIjUBB2qObQBDuJ4HT3zrH9o9O/eNaMsKOeezVhN+kcWqXrJnKCw7WvsYW7cp9X8
SpIhvdbWuDHe/ZBMp+9dhm+DBDy5jT1AZw/g7dG4ziNYxP5y2ZATnmLkFUT6maTJ
m1rqz1qnM+sJlQbfyD0pAI2pC1MMmc0XMAgSVdlYH33x64KYBHw=
=iY2C
-----END PGP SIGNATURE-----
--=-=-=--
