Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48F32152C6
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 08:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgGFGnp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 02:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727896AbgGFGnp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 02:43:45 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FEAC061794
        for <linux-usb@vger.kernel.org>; Sun,  5 Jul 2020 23:43:45 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id e8so9691076ljb.0
        for <linux-usb@vger.kernel.org>; Sun, 05 Jul 2020 23:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Y4UzK89iBOpPBUZKv4/TFXl6CmH6+Ffaw2RFfaduOmU=;
        b=LZHmdCaJIhdRGsJT9CvQvdC2FLec+q+xpEqoDMYfLd5V4HEvruxB/Ojzb5H2SBek+1
         Pl6/jDx3yos8GcE3ChLY94gkgX0suCuSb9AO++uWVpfuRiiYOhqQggQAgyzzKWfz2kvv
         VL4CiV8fCRUyPLm12497wQWAXdMlIOlOTio4xvP5agy4eAUwjExrqDsYgt1ipHdEwQ02
         wJ7nCfMuVu5uxqCWdrhjl0j8VKLUuMlUojsafTi81npQRvYtku74NpZ2y9GTep/2Eivf
         2eyO3VBW7K1sK04EE2WqPo5ypLuObJWtyibHQhyIQ6tkWjhVKI3wI3mtjqfZBBBm6vn/
         1+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Y4UzK89iBOpPBUZKv4/TFXl6CmH6+Ffaw2RFfaduOmU=;
        b=RHVp8P+n4iflIDA4Spt+5yUc4ReqA3N7Ue8gCEC0Pqkx4kd+BeGEI7kCV9Xvtwwst2
         glPnlCAUbmlnLl8PFin+sqnA/cKwQW+C1HPj9Zisk+VTPhiFwZBRMWuel8rfFpDnWOYw
         FloH5Xp2l45FISDDEHhWjonOyqWnGUbj6wMncYW/2WwWE3ArPJ/yjLXB7Po3kAEsQwkO
         quyDfxsi2e7yHtXh0iWGDoV7wG10kMka195//CDP5xDLLcqFuCWicLvmZV6jyxVW+9fw
         S3hR6lfmlHwiKHqArdM0OSOU02NNHVF4cBcUq/dkRsCIFZ7Gnscy7lW5V3sJa+1wy+tl
         TwTw==
X-Gm-Message-State: AOAM530FMDU6YJjFi0o3KTICjEBNLEK9F6Wzi7fTEjyQLcvRpsu9EVUj
        BAdvMEQzzH6B7RzQIxBmnKowC49ySC8=
X-Google-Smtp-Source: ABdhPJxprV2b7YM5QpFPi6+N/df+fa7oWtHFyMnbrj55ifjtqT+asuufJtEQCxb3BkX145uelVW8FA==
X-Received: by 2002:a2e:94d7:: with SMTP id r23mr27942973ljh.428.1594017823612;
        Sun, 05 Jul 2020 23:43:43 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id x6sm7579819ljd.34.2020.07.05.23.43.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 23:43:42 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 3/4] usb: dwc3: Add device property sgl-trb-cache-size-quirk
In-Reply-To: <5534d9d6-5452-dade-e46e-f4b0910becdb@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com> <83eba2e9f0069f20ccc94537e3b99cbaec209441.1590415123.git.joglekar@synopsys.com> <5534d9d6-5452-dade-e46e-f4b0910becdb@synopsys.com>
Date:   Mon, 06 Jul 2020 09:43:37 +0300
Message-ID: <877dvhqh2e.fsf@kernel.org>
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

Tejas Joglekar <Tejas.Joglekar@synopsys.com> writes:
>> @@ -95,6 +95,10 @@ int dwc3_host_init(struct dwc3 *dwc)
>>  	if (dwc->usb2_lpm_disable)
>>  		props[prop_idx++] =3D PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
>>=20=20
>> +	if (dwc->sgl_trb_cache_size_quirk)
>> +		props[prop_idx++] =3D
>> +			PROPERTY_ENTRY_BOOL("sgl-trb-cache-size-quirk");
>> +
>>  	/**
>>  	 * WORKAROUND: dwc3 revisions <=3D3.00a have a limitation
>>  	 * where Port Disable command doesn't work.
>>=20
> Does this implementation looks good to you? Rob has some concerned over t=
he DT entries,
> you suggested using compatible string with this quirk addition.
> Can you please brief about how you would like to have this quirk implemen=
ted?
> I can send the updated patch. My patch series is pending for merge just b=
ecause of the
> DT and quirk issue. Can you please help?

Yeah, you need to get into an agreement with Rob :-) I don't mind having
extra DT flags for things which can't be detected in runtime, Rob
disagrees.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8CyBoACgkQzL64meEa
mQaTPxAAoGU/hyXhpaIkNCifsZGrluKOE5e/m2I3yyveTbvagoBw7Z1vZMkgR0wz
YqavDMVEdV/iDdcU9fMzAxsS0ALD28QF7TLoKaJm9gHisvKyIeBh8Bp6rKASyh2J
plLvzzRtNQNpoK7iA2LErh/Zh0uHDklPtJ6DVhHWeDm8yJLgHbkEoYRqoumFsBIf
WGHy/0jJZFiidxFUHOwJv9bZU2Cq+e6hgDIVIQXm4uYH+2xuxkMPbp8lyrrwv3Tk
oyWKIeLBgVsZPsCnf1+h/P5ewHTZ+xrNZ6bFTUuOWgwsJSL2gJcsfy77KURm7po4
g/bi5zFqPy9cdCs9ezMhpnr8P4/5FlX4IbcDCZKTLvx/2p2+JrZk9mHdDTB//fzz
MpmuvxFmNpSgUJ9DsdO8toRLyhrf/kkhQTgLjDiyMkA9H4srvGdZ43LJCCzmbgEe
/OMDvCHk/6CJVpb3NS35Y6K00tAfdp4eNJ+aJRU91oK+QjjU+hfvjCqO0SiW1dGy
TIkJQUJJ0yBOimM5Bg9PgBqxcwLl2cW9j9fS8BCqKqYtamfjT5lUAdXQTiOZlbij
FOF7MBvbejbCBSjM3ZuaX7AKT+/XuVgrXfanoIGdsqTDP1Bqc7FkPrz+m/IUMlJ4
PD3GjnwtP2YFgbo/QVfzWyaW3MPuMX7jSQr5z1kFs8xT8o9mNhA=
=NHAd
-----END PGP SIGNATURE-----
--=-=-=--
