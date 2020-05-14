Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5447A1D2D66
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 12:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgENKu7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 06:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgENKu6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 06:50:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE09C061A0C
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 03:50:58 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j3so2957392ljg.8
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 03:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=uT7CFCkPm0It/Am4kHMycYpaytcaQFGyqdXOjqq3fp8=;
        b=qIDCHeORUQZ703hsn50GaWJItQAm4K2H/JGP8OYRNOJfNceXXdMhgI75fl24oDPgHr
         2WPZlQLoMp3Yj4+pIpbhEq4UOBDJv/YjiNJ8fr0YJdvdNHk0elSS2bBVA6wbMBPHPwBl
         TSoKu4t3QlW+X9xuB5VcRt5NsuoUWGPYsqaGO8VpIlj59/Raes3HHPfvRA1nsESSSqSL
         fnWG5PhijFp+oucd2iRkgmjb8p8yKOpGyahngs1iEsFg2wcwzKpLpXm+Y08In53sKgia
         xiZfIsW72vPR1dMw4zhJvDK5e7QEalNfoq7HuNkvG0P9iGUeHZTOYojMiySQYJMDk4sx
         2/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=uT7CFCkPm0It/Am4kHMycYpaytcaQFGyqdXOjqq3fp8=;
        b=owiwHoVdVIkfK6kmGHM+GtJU7ZshRCBIimOysuqRLz4m1rAtozxP9gndOMUaVwseSE
         0QRDBtSWSQ7vQdXxCSmd7+WWgHgzi6sNIa1GTUnOUp+arc2/pZZelUm5I+1fN0LGakiX
         +/4SEhlpHb6Iem2feP6z8JntUU7XHaN3IoiUFBvdHM15FyarFLk6n98vURmS770P/NlZ
         CbicKXyci72gmEaOGRYLHvJYvHpnu4aYDG+1MOmSePHGcOzWlkDJ0Zm+Ytsz4baMPix8
         1cX3Xh0vfz3wetTRQM0//XW/NMLyFCsQ7vsDT4YKD5W/CWtCqoKh0EV8SPnykDfeOgId
         UnzQ==
X-Gm-Message-State: AOAM533HK1fDsjfxQGhOzgkWshXumFXp+Dx6XLohu38r47bbDNpkYFcG
        hhhv8iir6wxvYx3ExPtTzS0KxYC+Tt0xWA==
X-Google-Smtp-Source: ABdhPJz/wUcQLKOe3aQtNiUakPBGsqgipwUMY65o2aYT/aSnH47zWhoxY4sjojMprOqp8yqKin8tUQ==
X-Received: by 2002:a05:651c:154:: with SMTP id c20mr2235891ljd.99.1589453456786;
        Thu, 14 May 2020 03:50:56 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id r19sm1321882ljp.68.2020.05.14.03.50.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 03:50:55 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        peter.chen@nxp.com, linux-imx@nxp.com
Subject: Re: [PATCH] usb: dwc3: allow dual role switch by defautl for new IP w/o OTG
In-Reply-To: <1589272379-30536-1-git-send-email-jun.li@nxp.com>
References: <1589272379-30536-1-git-send-email-jun.li@nxp.com>
Date:   Thu, 14 May 2020 13:50:51 +0300
Message-ID: <87blmq4wok.fsf@kernel.org>
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

Li Jun <jun.li@nxp.com> writes:
> For new IP version DWC3_REVISION_330A or above, current code only allows
> dual role if role-switch is used, those IP w/o OTG only removes OTG
> block but dual role should be capable so don't limit dual role, user
> may use debugfs or any other way to switch role.

then you need to compile your kernel with support for Dual Role. This
patch is the wrong way to go.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl69IosACgkQzL64meEa
mQYxtRAAoT2hO7Kd/X2xTFFFJ18KeCsLaaE09FHxUEVJB0tmKMEaO9Rk/kB444eE
i3+pFlnSQUAXGbtX7rR/yXmdfYfg37FbQT4F+pipL3WBZlhzJjO0hHUcNsaCJSEh
+Calk17uFpbIQUiGsdNrtJ73v4bHIryoU0XIDuX8Lg+Qjpfa7fS98b9JTssw4yqz
ijGUWRTWzKTqK68HuGhIAlGTfZo8+I2EwXMGd7CSajDmM5NruhN1vfQnArTU0Cto
sF58C6s9dwGFrRt7rywaGlhBEKj/yWTQsQdVW5OReHf4LBT1k50P+H+k3EnNHqxI
tRdD8QzR3C/1n8mYGV0nLeLG8CT97irCrTyso3PRp+7mzVpEd5auYMuLu8Fi9Xvf
eij9s3l5K9j8mBGB180xK2nlDsO4p7Zc9A3xARuvIqxe9JkEA6NEfUBtWVRbSVge
1Y74w1Qa5J9WQhSc/rDQmoKa+XSlJTW0RYbIekCOs+3ukhbfKXGXNPJi6UfWWTwj
VAMvjntokFCjhhlUCyIYqH9p+snwsZ8jf1DYlyz6jdQnoK5TsOqG/zc9mrdSyLpC
4obcfH+FSjax9BjrsQWSw/hr0ei80QoT3KhwCqSUK/DBKqBPPexwprBBwyn/uxvB
v6x4Tk2tg5+/ggyQrxMu5+5wda/0Xg04n+7+PdQ11UKqVBOTF2o=
=3iME
-----END PGP SIGNATURE-----
--=-=-=--
