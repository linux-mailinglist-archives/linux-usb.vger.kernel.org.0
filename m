Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF86A19763F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 10:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729589AbgC3IPI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 04:15:08 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44896 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729575AbgC3IPI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 04:15:08 -0400
Received: by mail-lj1-f193.google.com with SMTP id p14so17042978lji.11
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2020 01:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=nuSDn+Uw+FBwc76BuIuR+x0SsywYjamdRD4sr756J54=;
        b=h/kH5u/EwQmHi6jChss1nNBmGlAjQ7AOjtBys2R0NwUIB7n4vHCT7utc2GwKlF0uMx
         ZlhIfS/7vZMbZHOOjETqQkXe86+zKJwGNqm5MeKVYXMjNQoR8NoXlUCkTof8HRem0YfN
         XyNl8G91tgcqINVRJSjEyekU1jDpQtvb2HEwoQJ+NoOk0ESkX/GIPQOi24Fxfzl4MZK5
         JiKqT8d+4x0R+EYCiaQMFk+MLsGU3ZG+LVByTUCiRIgpCBMU+iga3+g420Lhno85W6KC
         HDwr8CWUJI+rVZEo7buW8Q8mUggqGvn7GjOj5HhqLqXFqIGDmrc4Dvz3FDgwVjddu2Zt
         +HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=nuSDn+Uw+FBwc76BuIuR+x0SsywYjamdRD4sr756J54=;
        b=SaskknM9fzUGAHJemI0MqWPj9+2Q9wt33fktM4xFvHdIDgMe/eFBDgY4DNcyk3FIxY
         6zBzF9V16t0iKYyZ21GzGzDoiqARXFkPmWRa7NAMjYjKPRtdjgybsPYb/Kcn3lxkVxLN
         r8+HBg59KewU/mSHVg2dmuzNh9In0JAsyTzIU3a4UELl77axz7v3W39zQB31Ki1lmzWF
         wbKmt6bj8Ta8cRocug5Upea3CSzJQmKmHzGhiJgQl07W1pNjpfQohxKdjCmKABYt7UIF
         javrBD6F7L333oIz+OBXGvTftufm8CjS+RxHHuJ9FIlIW2MiiNQDooe6HmTMdG/DFnNr
         SCoA==
X-Gm-Message-State: AGi0PuZsb2Gdk0Q/VVf6aUiNvqC09EmrgMNZ8qQQ9p+cW89EU4AvaUZj
        M/7voFtE/npy4Fthlw3e3TGqRHwLiWQ=
X-Google-Smtp-Source: APiQypKTuVwfDvT4DqQ7n9qfkB7ft1sSOcATuKC4PYDgKT3f5C3JA5T+7YVhncmFvJNpySHjuBH4FA==
X-Received: by 2002:a05:651c:201d:: with SMTP id s29mr6621277ljo.214.1585556105937;
        Mon, 30 Mar 2020 01:15:05 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id h9sm6332180ljk.96.2020.03.30.01.15.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 01:15:04 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 0/4] usb: dwc3: gadget: Improve isoc starting mechanism
In-Reply-To: <cover.1585523081.git.thinhn@synopsys.com>
References: <cover.1585523081.git.thinhn@synopsys.com>
Date:   Mon, 30 Mar 2020 11:15:00 +0300
Message-ID: <87k1322r97.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> Currently we use the "retry" method to issue START_TRANSFER command multi=
ple
> times, each with a next interval. There's been report that 5 number of re=
tries
> may not be enough. See https://lkml.org/lkml/2019/11/11/535
>
> We could increase the number of retries. However, that also may not be en=
ough
> depending on different system latency. It is not often that the latency is
> higher than 5 isoc intervals. If it goes beyond 5 intervals, let's restar=
t the
> whole process again.
>
>
> Changes in v2:
>  - Include patch "usb: dwc3: gadget: WARN on no-resource status" to this =
series
>
> Thinh Nguyen (4):
>   usb: dwc3: gadget: Properly handle failed kick_transfer
>   usb: dwc3: gadget: Store resource index of start cmd
>   usb: dwc3: gadget: Issue END_TRANSFER to retry isoc transfer
>   usb: dwc3: gadget: WARN on no-resource status

all in testing/next now

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6BqoQACgkQzL64meEa
mQZgGBAAoK/suvU4s9jXUUaov6Nwzxu3q6kV0RYeecfzBPwDB1ZWwGS98t397wMY
ls45DUYaBCoq/GVVJuQjV1G2SOXCZwfQNYKe+XchzBzpD9wBZS1KkQEA7Aznr97T
aPg4lzAOkm4xgXksKBiXZbwO91j1I1vPzNDJHJljZeRprrPVKl3eWR6kqAiu4dff
KSFQp73I8tY8hCliffIcnzfk0dOXgnHTvpQ4Ya74xAd7mff3r1wWgpmDVbTWsICy
giJUe+F3HUSDtajtZ2sZn+3gWREF08oQNqWtDWwujA8lwflNgeEh2ZkiZeIjzZI1
1vy8IfiAdHaY5ve5HcCAUZ/2Da2lhq/T2V8zn6CDcXRr024knby47zjEGcm/wwra
9CCXWFX9EfIGnDflzgugUnoCjLwXadzoIyNA8kxNpPmKvXjlhWuaJRt/Dho4+VAo
6AZ/2iL1Aytjny96L1anV8ThM4iSaIs9yZbHiA+OU7N7ZVohUDsGRuynBRnDWesK
w0LviS8L4PGIMHfFhUxwjbaF2CSAJ/awNLg0Xn8I5APz5bEqK/AWtltCOYX8ukZ0
lsn1/tTVY4yjauf8UfPlQ3j0snUqaLHbHB0N/EUM9vtXlYzeQUntCAaEhtB4f6nV
PLXSW7HrECR70EuV/ZfHFEkNI9wYEjPMH6iHKCS7zdNWBkC7RXQ=
=uSNG
-----END PGP SIGNATURE-----
--=-=-=--
