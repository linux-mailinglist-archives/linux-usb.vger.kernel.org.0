Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE2B216A9E
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 12:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgGGKny (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 06:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgGGKnx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 06:43:53 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C94C061755
        for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2020 03:43:53 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id e4so49352777ljn.4
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2020 03:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=e1/F5wHA50nviPBKhwXq9R4n4na7V0oSPmWhBRpNJoo=;
        b=c8SYAKcdTNatnnBB/GgePE1sfxeJpzGUJ3ayySC9hXfGCPg+nzV4OH8UJovcBdcR3y
         fL0nX/vCECjoquFgvmhUilllSyuEJvLEoTYzfFrK9Hq5L8pO619Cl43KPJvbi3Qk2O4p
         Bp7l9kYTJyEKn5SpA7gHs2AixYnv0qwH8LNaHMPdGQ8snbZlRgsZSf2PVxKTfeOoXs4M
         cJINOLsAC5in+NVISfKtO+GD7WAS8Akwgedq/CezEijNkCBoBZu7P7kEY1l5uKkIw7eN
         6z2s5B7Kzx4aRvhiI951vfP4iOyeuKwO0x0VpG/QQQxGAChVvzzrN9rIWIz940yaffpG
         d5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=e1/F5wHA50nviPBKhwXq9R4n4na7V0oSPmWhBRpNJoo=;
        b=twp0iUjQ0Cl5BliGuKMvzXmjkbqAm8UReZbOzg8zRuuD2WmngK6Ap/C+oGMts5o9Db
         HOc0j//wU6ZZj/MWikRoc8AMz2ov8ZBbt4yHMH7cZS+NtL93Gbbw+rVjMhuP/9hnPuHv
         fOgy8WWpoz21XVJcR4VmObhDofOh53XQ79+3reM4XIZGHoWfi8r9WP5l5VrLoVWTFti8
         KID9YNWXoSfE1TjhU7Xis9tUQqx9ouDrr77+Him/NcL5vko/+QrXGgAWCFNOJAtFXF2V
         XbkLiZDL+i6MIL7upxyKjoeqA6WParnUQQPzHAHxGut3bXt3d3noFnCsfDwAwCDp7vvk
         9c+w==
X-Gm-Message-State: AOAM533HtI1ZiDE8y/bE/MXTQjYWM5+qv1wywlWr0/OQ67zNe9O3oEcS
        zkvHHQ2wB5TfG3uHz2X1gYo3V4k1sk0=
X-Google-Smtp-Source: ABdhPJxvs+QGIDTOjJPzhqC2xOFRIeV1qjJ6stjDhwOtW5HoMzvjJgGWX2C/NA2KkQqIuEy0w5BD4A==
X-Received: by 2002:a2e:7804:: with SMTP id t4mr30136957ljc.8.1594118629932;
        Tue, 07 Jul 2020 03:43:49 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id e20sm74140lja.137.2020.07.07.03.43.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 03:43:49 -0700 (PDT)
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
In-Reply-To: <CALAqxLWMJikHCzxcna08UPFdf=frm5=2z3BB-FDrzy7MbrHF6g@mail.gmail.com>
References: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com> <87o8ow7wka.fsf@kernel.org> <CALAqxLVPOzD6FD9qJRJjTYai_zL_YzpCkPecWyE-KhTmEHNJYA@mail.gmail.com> <87lfjz73cd.fsf@kernel.org> <CALAqxLWMJikHCzxcna08UPFdf=frm5=2z3BB-FDrzy7MbrHF6g@mail.gmail.com>
Date:   Tue, 07 Jul 2020 13:43:44 +0300
Message-ID: <874kqjr4f3.fsf@kernel.org>
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
> On Sat, Jul 4, 2020 at 7:38 AM Felipe Balbi <balbi@kernel.org> wrote:
>> John Stultz <john.stultz@linaro.org> writes:
>> > On Fri, Jul 3, 2020 at 2:54 AM Felipe Balbi <balbi@kernel.org> wrote:
>> >> John Stultz <john.stultz@linaro.org> writes:
>> >> > I was curious if you or anyone else had any thoughts on how to debug
>> >> > this further?
>> >>
>> >> Try enabling dwc3 tracepoints and collecting working and failing
>> >> cases. If I were to guess, I would say there's a small race condition
>> >> between setting pullup and the transceiver sending the VBUS_VALID sig=
nal
>> >> to dwc3.
>> >
>> > Trace logs attached. Let me know if you have any further ideas!
>>
>> You can see from failure case that we never got a Reset event. This
>> happens, for instance, when dwc3 doesn't know that VBUS is above
>> VBUS_VALID threshold (4.4V). When the problem happens, I'm assuming USB
>> is completely dead, meaning that keeping the cable connected for longer
>> won't change anything, right?
>
> Correct. The only way to get it working is to unplug and replug the
> cable (sometimes more than once).
>
>> In that case, could you dump DWC3 registers (there's a debugfs interface
>> for that)? I'm mostly interested in the PHY registers, both USB2 and
>> USB3. Check if the PHYs are suspended in the error case.
>
> Here's a diff of the regdump in bad and good cases:
> --- regdump.bad 2020-07-07 03:44:46.799514793 +0000
> +++ regdump.good        2020-07-07 03:44:44.723534198 +0000
> @@ -162,29 +162,29 @@
>  GEVNTSIZ(0) =3D 0x00001000
>  GEVNTCOUNT(0) =3D 0x00000000
>  GHWPARAMS8 =3D 0x00000fea
> -DCFG =3D 0x00120804
> -DCTL =3D 0x80f00000
> +DCFG =3D 0x0052082c

the only interesting thing here is DCFG. Can you decode it?

> +DCTL =3D 0x8cf00a00

IIRC, this is only telling you that your controller is in U0 or
something like that. Not interesting.

>> If they are, try enabling the quirk flags that disable suspend for the
>> PHYs (check binding documentation). If that helps, then discuss with
>> your Silicon Validation guys what are the requirements when it comes to
>> suspend. Some PHYs are inherently quirky and need some of the quirky
>> flags dwc3 provides.
>>
>> Note that disabling suspend completely is a pretty large hammer that
>> should only be used if nothing else helps. Some PHYs are happy with a
>> simple delay of U1/U2/U3 entry but, again, check with your Silicon
>> Validation folks, likely they have already gone through this during chip
>> characterization.
>
> Unfortunately I don't have any access to silicon validation folks.

no publicly available Errata List either? Do you know which PHY IP this
platform uses?

> There is already a number of the quirk bindings in use, but I'll
> tinker around with them a bit to see if it causes any behavior change.

Would be great to review those with people who were involved with the
actual Silicon development, but if you don't have access to them, the
discussion is moot :-s

> Thanks so much for the ideas and feedback! Much appreciated!

no worries ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8EUeAACgkQzL64meEa
mQYbAA/6AuKbGqJDg8AviQ59NTJ8kMt5fsAdqU0ToyJ37bR5UxFg2BgN/xECly+t
kMk4pHJjVXG0RDcMA4Shh9JObfsORr/1ass0SLV0yfJ/arvOZpKrKmMw6oTlxDgS
sK7hjOGwefG3Fc5kKEoR5n3upnGI4Jp2SrYsMdhGnU9gn1uaJBqLaDvjxk9TQT/t
qYN3c54/BINGSHRMsRfIQhWTXCksDjkirrLQRhvKxYGBQ5Y4DNDniVocMI3v/SWa
ZNg0cdNgB33xy3/JeqgTqOqnWobQ1+hUHaQ0nD4CorbbNbLwebE3dZgywfm95Wb+
bc6Dc2CqR9AnF9+AyaHKVWy53w73fPJCHOhCu1vsfOQDMPMk1yI+90PVn4DdA+IB
FEtKzntaLml+SO/SYHd54o8Z/PBlwuaZsfPvA3Vs9k9V0x4Jnb/y6mBJZNQdTVhv
t85HdyCclnrgIoNMQPmiign+uzwVs+MQDgdjMVrfFFDaNuOtZUX/K/XouXF2gMVN
auilyD5gRlkaNdrlRHGgnYyMvqM1Vm2elL9GqYSJCc6q4IMBY6xO1LizFjgz98ny
GnM1tJ808UbPRVgf98EH/ubUNl59XhQ1QbpsZiHw4LZ9KrM9p+yybshVMXek9u7m
0oNcDpkGA7SWedhSris4oJyKsRjwObHFeQLuRt/tNFt1SRK001E=
=PUUX
-----END PGP SIGNATURE-----
--=-=-=--
