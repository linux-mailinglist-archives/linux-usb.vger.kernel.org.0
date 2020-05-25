Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6929E1E0DF9
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 13:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390270AbgEYL7G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 07:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390196AbgEYL7G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 May 2020 07:59:06 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9099BC061A0E
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2020 04:59:05 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a25so8819544ljp.3
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2020 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=FbqoUw3e8Xqrb9+XjC7cJebfNy8kSGCWAG6V7ZtL07E=;
        b=CYBwl8/bp4lrQMpTaiNH+8nD4PQLXbIFaJhFxZJFGU8rKCfEjNybVkBK1X/jLUA+Hr
         sC/whEwcGsU2jnJ/wZEFexqpSCG7V978gplRv0N+DmLGdJ+BdCMrlztU4p40qbbC7lmP
         S13MfknG4E9Tp4Ljurz88taMLF01RdBjif58ONcgyjL7yzv/Ri15LGF3kTV+UkaeJ6Tc
         AXZKbk3WgyScv08hMSybDBcNC52PA1NfjlvzdAyoDItaRVPoKHK8oMfSHY2uDStIGDA6
         XHp6S6twsrjwAeaRXLF/EGRSCPYkplNZ+/w3T51gy1hf91zKwyMSdojhl22LKlccalnG
         dGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=FbqoUw3e8Xqrb9+XjC7cJebfNy8kSGCWAG6V7ZtL07E=;
        b=nyIMMuhMPJIAKX30HyHIIrOr19jOFLPEnq+AELGS5H42dw7usikqtfsICSCK4sg3FQ
         iM/grQxH/AQK0+mCDETYyfs8HaFK9y9m2p1NTkCN1Jk3IHOma3k+9O9SmXF8CTHBaHo2
         EPaXZ80iUtLv1mwT7EOeTtxqiq127+mBlMr3tqC/Gq+0eJeer0Q1OdhuXvdNv7efHQWs
         CyX7odgMjqv0KNc3LxOF1gwT5c7xxNW1ZHkQ7ddI1FWUQpuK54sgdWExMWXro7akLSYF
         1KBVICeEmiUnxN4qBjrKqdKk0Hax+aQdKiPbObGNWyHD31IU0ceamEYfE0EZ0kuCTxTC
         2o5Q==
X-Gm-Message-State: AOAM530omjKpbbhL3XxLWVFpkrWJeKOCr8e/oddJMtwmfPwERVbDzIro
        jpugHJTk+2WsOg6CZn+cBqSOIfDO
X-Google-Smtp-Source: ABdhPJziauRwaSUtDw1xJq1snqGbJ4MoofzTyC4JW3W8E+tSbYj0Olgy9nAi5fbrZoPERIrh9oIapg==
X-Received: by 2002:a2e:b4b3:: with SMTP id q19mr2747803ljm.247.1590407943847;
        Mon, 25 May 2020 04:59:03 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id b15sm4846325lfa.74.2020.05.25.04.59.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 04:59:02 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB for v5.8 merge window
In-Reply-To: <20200525113344.GA360751@kroah.com>
References: <87h7w4wcug.fsf@kernel.org> <20200525113344.GA360751@kroah.com>
Date:   Mon, 25 May 2020 14:58:58 +0300
Message-ID: <87eer8w7i5.fsf@kernel.org>
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


Hi Greg,

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>> here's my pull request for v5.8 merge window. Note that we have a
>> conflict in CDNS3 driver. The conflict is all about indentation, I don't
>> really have an opinion if you want to choose my version or yours,
>> whichever you choose works for me :-)
>>=20
>> Most patches have been soaking for several weeks now without any
>> reports.
>>=20
>> Let me know if you want anything to be changed.
>>=20
>> Cheers
>>=20
>> The following changes since commit 0e698dfa282211e414076f9dc7e83c1c28831=
4fd:
>>=20
>>   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
>>=20
>> are available in the Git repository at:
>>=20
>>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-f=
or-v5.8
>
> There was a simple conflict in drivers/usb/cdns3/gadget.c that I've
> fixed up and pushed out.  If you could verify I got it right, that would
> be great.

Thanks, it all looks great and I compile tested again just to be sure.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7LswIACgkQzL64meEa
mQbrMQ/+KvLuvepwI2SuvRV+exJ15JgtjeCgeODrgyOvx5FLJh54bZTwY6gGf1mf
JxWYV9Ebt+q3PZVz3pRS34mE8uds6xivzogOi7TGtqvmoxM4rcA1i1K60rmKJN4h
X7YxApBaPJn3FUJSH10D4DO3mJlKLSCbf9/i2td6HRJz4tBS5L/H9jlGVJ4c9ayB
Tqfw4NFnQYKnLeILJF4mpoSG6VYo/97+T/1obSAvcNq+2R9mTw9ItSZL84s++DiO
IFxiZ0sgCrT9PY8C9vnyeN1G7JapW9gqWSS9AMDINU1WvFo9VTMzygcc5Shep7wN
QcbqUpNaGdzRwc82YsjiUZwVY5JpGc2W6eHA9X/3U2Ul01n7yekKQIOH0tGNMeJq
96gtDaHVT9c+fnSFkVkjxVH//HcsJbP4Stjs6oVzmtYLxucCvIIF75Itspmjhq8+
CKLuwY8yg4ZZSXRuSzoizZSfTJ6ZsEmDsfMgmPZSfFCOmokSW8Gj4XPRUVNPCdia
qI0gWfSIltXzx0ftb2kpQ5Yc6eH1jsYG+wC7iDABU3mXa9lasf6nYmGfmRMsNKgo
ocCsRBwuAUOcyOlbWGUSJZJcTJYOMtuY74E9mV8Rk2M8l9rh3lpbbZMFlIfOaTsA
UZEEJ2hG2WdGL5AmHZHdJhH08kmXr0Q8iMCrT5ivB68sVA+a1tw=
=A2U/
-----END PGP SIGNATURE-----
--=-=-=--
