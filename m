Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2700A186537
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 07:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729781AbgCPGtq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 02:49:46 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46293 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729319AbgCPGtq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 02:49:46 -0400
Received: by mail-lj1-f194.google.com with SMTP id d23so17255389ljg.13
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 23:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=feRTWbA+RwtLgoys5QOe5cPEQggDSr7BgqoUaNcCnSU=;
        b=Ug2fBMK9XLBWOpaObA+U5mBPjK8kGxoTIQs3S1Ms6snCOs5VjhcMiFEF0NwgR0YPrO
         IuTsBaXUVnfEU5OeFlbUbcUIxqmf3QRoFOzrxUSh8WnZuIJlMbbtmqJH/uIZKz1kB5Qe
         PW06bXYKt9u/fbJs5G6mQt5y/5cIcrYaW4FCrnqVgXe8/p/UE50GCOFsthd8asY2+shk
         B+zaBzqCXAVc5XkOZ2JXCpQJMeO6SQrzXHJ0GObmJVERl5W+E9G/yQ08eMS3ztJcH1JF
         E9Wg2VUDzWGwPbvumRVOwD9/D2gUcGFQQDv4w8YprVp34z77/D/SZCgm95r4Vj2Qi27Y
         XaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=feRTWbA+RwtLgoys5QOe5cPEQggDSr7BgqoUaNcCnSU=;
        b=SwGXuvx7W3k7ydyzzuUS8cGPgmqaaNPII3pNS0M2GUP1FCUKML8WK2bjN+7j6tq/5R
         FSoQkMt399Ga4v2488EWmFCNE680gnxcTRCi0JGhvTnnAXNL/IHdponbT8kAQVOCz+HZ
         B/G5NBz8tO1u9mcE/6wjxhOXXaH8eyVDUWVotVp+IC2UWN7ibUKbe77Qc/7wyyhePxZM
         m7LSA4l4q8xpr6si2SKQChEH+TejOW1VFWib4N4+vGYBx7VoJq3/ZC8WFYFA+4WKDuuw
         ZTru9DZh1D+IDnEaHViLD1MowDLb1IfeuEKVUnB/ubM3soLyEwLLmqg6oZZKJ7ccgvfY
         9r8w==
X-Gm-Message-State: ANhLgQ1XV/V8CvuSd2ZU/waluxgE8fj7r/pqf4snjQoTUiu95+488ivC
        5ICdH2c/UP2AfnAF8HMjAwcD8z3caDI=
X-Google-Smtp-Source: ADFU+vvFeMXOy3tDuOAcSLStu4tTcZ5d/OluWymBUWqbSzWrNNzN8V0OAVZQWEhkVsDvub85HilOoQ==
X-Received: by 2002:a2e:9590:: with SMTP id w16mr15746621ljh.113.1584341384625;
        Sun, 15 Mar 2020 23:49:44 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id e5sm4873345lfc.14.2020.03.15.23.49.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 23:49:43 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 2/6] usb: dwc3: gadget: Properly handle ClearFeature(halt)
In-Reply-To: <2edccc70-5fab-4227-3d27-a06140523d62@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com> <4f9b6acbff2cd0be417fd4a943c1975bf41f8fda.1583443184.git.thinhn@synopsys.com> <87a74iezx9.fsf@kernel.org> <2edccc70-5fab-4227-3d27-a06140523d62@synopsys.com>
Date:   Mon, 16 Mar 2020 08:49:38 +0200
Message-ID: <87h7yo23r1.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> Felipe Balbi wrote:
>> Hi,
>>
>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>> @@ -1627,13 +1633,37 @@ int __dwc3_gadget_ep_set_halt(struct dwc3_ep *d=
ep, int value, int protocol)
>>>   		else
>>>   			dep->flags |=3D DWC3_EP_STALL;
>>>   	} else {
>>> +		/*
>>> +		 * Don't issue CLEAR_STALL command to control endpoints. The
>>> +		 * controller automatically clears the STALL when it receives
>>> +		 * the SETUP token.
>>> +		 */
>> we have a separate dwc3_gadget_ep0_set_halt() to handle that. How was
>> this triggered?
>>
>
> I think it's a bit confusing here that the dwc3_gadget_ep0_set_halt()=20
> has the similar name as __dwc3_gadget_ep_set_halt(). However, that=20
> function only calls dwc3_ep0_stall_and_restart() and not handled through=
=20
> SET/CLEAR_FEATURE(halt) request.
>
> If host issues SET_FEATURE(halt) or CLEAR_FEATURE(halt) to control=20
> endpoints, it still goes through __dwc3_gadget_ep_set_halt().

Perhaps that should be fixed, then?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5vIYMACgkQzL64meEa
mQay9g/+LA+H9WZXB4KFyxZ2Tlhq+1kunOfIgIHgRSWlrFmU57TTumbC3ZOyVxbn
0kyFZVp+3KfwUr/HWuwJskmy1Hdp+sjFgcVeUNYRe4GP6TtRxy9UNfmKyHtuzG7V
JD3gCEFV/IEdsqzOxQ/hMldl8ANQXMJKuQUWb15AtZsq/91SikosmzzFGsbCb6xk
FQDqiNzWWGolInKlp+06vssFf5E7JyW5JFjJp2vJmVWfWQ8KHMXlJfpTvwT7OK+u
SMUaDbNZ6n98Z7nhg2/Juohw8o7HqBy6ww4yjtB9wj4W6mzpz3TdK0Q4y9aj+urT
UvsbaueTcZwOnjd1pkExHdZO4TdFuZ51EkqjdrnWYBpHQLRrm9j2FMVQrMc096vY
go2j9PdJtb0/BhNJ5UZcJrSWHGzpsZ/Ed08tRyfTxgITQhVA8ogxCEsa5jesluw5
hD3Lx00zBwr6YbQL2Ck6yQQvJ39pTS8vuWBgEg5PbxsBHJxPKLXLAYjUILrgG6v3
QnqfE205k8hUu/maD2sM1g7qqowFRbUobV2Ms11ksyqFbsPS7u2iGmdJvQJ+swzX
iRT1yh+PCtpwAurn5UVyfapcTpzVcQ6mmsnXWA82GHI9Q9LdyWCaSu6cmIi4HozS
VQYGm4X97z6ZUxKgIbjxJ2QliqO/Jw6Oa7PHE95te0eDqZwf7ck=
=aCtc
-----END PGP SIGNATURE-----
--=-=-=--
