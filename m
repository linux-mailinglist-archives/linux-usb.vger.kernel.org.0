Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61C7114856B
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2020 13:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387794AbgAXMwF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jan 2020 07:52:05 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41774 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387709AbgAXMwF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jan 2020 07:52:05 -0500
Received: by mail-lf1-f65.google.com with SMTP id m30so1031808lfp.8
        for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2020 04:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=jLOjncvs0tqhzwWUHPM+IJzvjSXlrufV+vR/RJ8ji8Q=;
        b=p0ApriS+5cF4zGgGYogvaxWFS9IqDzMXSH81uQOtPjyODeOThWPNHrmdm5YOoyUqaY
         gJ+fbclb8Bm2F5QvcQ2z1iMVh+JcMOZdewATp54XztChnXR2RYQcSYF2gdKP+EYKYO/c
         8v7LIrOB2rvk/bPJ8TJoBjPhhvlw6iviqfm4EereAbUiVIqTa41aa04/cjIKzs2vO1e+
         /QYoS6FsCJXdkY64aOZWV+Vu/bLLlVhccCl30iRtCHQ+3PCmsH0LJtZH74atE6/1eAjP
         0a90AxaMIkhZA4PtfacqsTwLx+p1xmNTdU5Wv8WnvrRlC2LyGnFV4u4NaSwzBAZcdYO/
         +dgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=jLOjncvs0tqhzwWUHPM+IJzvjSXlrufV+vR/RJ8ji8Q=;
        b=VBrSMZ2uCv93pVTH8APqytWBekNZ3Jh2nvHd0YMVgS3fqHSPj2ibQmms4DjSdehqiH
         yoChmuZMIL7UFjyI7njG9/m4NhJxPxS46XOpx9e/M3iiEVPbi/5NW/KHMZUCgiTq5WGr
         mPa3w/vQJD6GDhCD7JlpElr/Y2eiYFRr1Xeqv1JTtEiVvLyyrU8nEt62n4cHyJa5uXxc
         YAWN8NPhQgW+eJPFraj78HovR7304br5LBL1oy4Rq1cf02w4mOQKE9vMnElMEoG4Z+to
         EhID56LTUKKBO7M7pfKCwzIj/JBDHO8paprrSawE0t4feXQ+HI8Uu6+8Q1bYhSx+yTRO
         nmjQ==
X-Gm-Message-State: APjAAAU4U5M0zIX2g18ZCfflZzPR42rHb+NfxaItP1uAsW+wKRT4fqkG
        5Zu0+R1oQ2lRTqDuoLcUhip6FY+mnj4=
X-Google-Smtp-Source: APXvYqwW9u8jy6Q7bu8GNOpNvsdhhFff7KSZWZKMf06fcLkrka0DKFMnbyupvpOoDmBWtk5YqZOxlQ==
X-Received: by 2002:ac2:5196:: with SMTP id u22mr1245616lfi.123.1579870322490;
        Fri, 24 Jan 2020 04:52:02 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id q11sm2985803ljm.76.2020.01.24.04.52.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2020 04:52:01 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     John Keeping <john@metanate.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_audio: Fix high-speed max packet size
In-Reply-To: <20200117104022.5bb769f2.john@metanate.com>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com> <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com> <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com> <20200114200450.064cd521.john@metanate.com> <24f0935d-16a7-4301-78f4-fa459e356ca9@ivitera.com> <20200117104022.5bb769f2.john@metanate.com>
Date:   Fri, 24 Jan 2020 14:52:49 +0200
Message-ID: <87ftg53tjy.fsf@kernel.org>
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

John Keeping <john@metanate.com> writes:

> On Thu, 16 Jan 2020 16:39:50 +0100
> Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>
>> > I've taken a look at this and the patch below fixes it in my simple
>> > testing.  But note that this doesn't adjust the PCM's min_period_bytes
>> > which will be necessary if you want to minimize latency with an adjust=
ed
>> > high-speed bInterval setting.
>> >=20=20=20
>>=20
>> Please can I ask you to submit your patch? IMO your perhaps slightly=20
>> suboptimal solution is much better than the current broken version.
>
> Yes, the patch is definitely an improvement.  I thought it would be
> picked up from the earlier mail, but I think Patchwork requires the
> subject to match, so I'm including it again here.
>
> Are you able to provide a Tested-by for this change?
>
> -- >8 --
> Prior to commit eb9fecb9e69b ("usb: gadget: f_uac2: split out audio
> core") the maximum packet size was calculated only from the high-speed
> descriptor but now we use the largest of the full-speed and high-speed
> descriptors.
>
> This is correct, but the full-speed value is likely to be higher than
> that for high-speed and this leads to submitting requests for OUT
> transfers (received by the gadget) which are larger than the endpoint's
> maximum packet size.  These are rightly rejected by the gadget core.
>
> config_ep_by_speed() already sets up the correct maximum packet size for
> the enumerated speed in the usb_ep structure, so we can simply use this
> instead of the overall value that has been used to allocate buffers for
> requests.
>
> Note that the minimum period for ALSA is still set from the largest
> value, and this is unavoidable because it's possible to open the audio
> device before the gadget has been enumerated.
>
> Signed-off-by: John Keeping <john@metanate.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4q6KEACgkQzL64meEa
mQZMwxAAyZxPpzextNBu+zsip3XNyuoZMfajZCaZji4iKsl11vbOahER4EKkViFy
auqJAQOWxwsnhV+hhjjsaC99bXSWwSXa3bxKs7vj/TuSB4fTWoic9PdlmUF9MnXU
0Adx9H/C2BJqXOBP6IUmZ0RT4NPfmGqazcV/YQGwXyacj7dlAbLQJOWtwKIePHOj
ibRzZdxLavC48ouJR1NhU4rC02OXkxB863PhPiRh0uDJRkv8N/YDYBTyGOygX3iu
DamtZggtKpWqRN+OA4qlJpT/RFRr1RQNLB0d4mSuSnlB/k3QoTl2/hseC0FKhokZ
IpjThmO7gfWjAYddgnzHIJbKv42hPjwfxJrsS2AEECEBJfL3TZJ+PnIifpEUVIh2
KxXeC8wjhDBP2LTV707NBPz+GgIUEGYqee9qfOpi3P1Z2e+c3FNw0LorVzAtkX0G
8br/e6kxQ/bK3XQWT7EeBXnno+ScQkwa9abazTQ/AO6Qxr2avcOJR6vTNCntOWBq
jAjULbVZqYSsFeut76ydTZ2ZB8gsuo4E+RuTY4/sCOO+8Y2dFuJmO+owYXBDYY1I
J8IaEEgdqnC2XPq9sU2vvt22AYNyY5K8U4TkSy0u86EadLEeLXtWbfDV1lJ4iQKJ
b1/EBc83V9gNAlF0m8/RsW2QQOGhbZanLoFRg7/I1QZpGnYwK3E=
=lzgV
-----END PGP SIGNATURE-----
--=-=-=--
