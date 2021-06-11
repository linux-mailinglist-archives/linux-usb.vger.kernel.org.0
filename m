Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055333A4B64
	for <lists+linux-usb@lfdr.de>; Sat, 12 Jun 2021 01:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbhFKXtq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 19:49:46 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:39692 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhFKXtq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Jun 2021 19:49:46 -0400
Received: by mail-qt1-f178.google.com with SMTP id p21so3923404qtw.6
        for <linux-usb@vger.kernel.org>; Fri, 11 Jun 2021 16:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:in-reply-to:references:mime-version
         :content-transfer-encoding:date:message-id;
        bh=9k5XTuzdGjpcIWll5aNtcDOwxzv06WPFRNlOE7yNKzU=;
        b=hWWOILzIj3GVS133jYfWoDePKUXOfR6PPnuTZGbbkuQzy0ANnotLLpzqCt7AspwSR6
         TWFcnYKNczG36U7xSyWIXJclofsB5ZxG/0ElGlUTeG8EOmK5iSeOYJaGVDtf/ptUuYcg
         TY/k9bbaI1XRc0QpMUMduMNO70tspZ9S6ZiM4Tqsf+qjuv/oZcpKGiX7bDqrxlWumkel
         /xm26vs9qCY+d2N6JeNCysnExHSUp79owoYY4CO+T+N4hhKcKcRFCacbRUg8o1FedqAu
         mVpL3uCCSjOl2LsrFjXv3L/3EnZT20j8QONlw6gXrNjdGTuiM3/Ed6ntDQFrZpqSBmDu
         a8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :mime-version:content-transfer-encoding:date:message-id;
        bh=9k5XTuzdGjpcIWll5aNtcDOwxzv06WPFRNlOE7yNKzU=;
        b=bG3xCvi9RbCaxCikx9Cd0pLxcc4n/jjBxx7neK8OKpt+Fw1WFlEaYAFHXZqlO0nMmO
         1ksiaW7ApEzzru5CRTrDDfH7cJbLBz2MF0hRsyysZdPDKrSQPneo46Jx8h0uN9TfFed6
         oTI6eWN9ZOFKMSmAkvWFgUUOnlChL+Vrvq7HCVF8Sdl0arv6PcAqv59Ok/4IQ2xCW/2j
         8ww7l/qA0+vnEAefGzT4grKESIqlkE184c371wV1+m7zO1YNT+Scu0cdtbg/SxKu2JMv
         wsjEv8v3FY73vmrHXeVurrhKyMS7QfFrnE8LaIa89jHF+yux5olQCjtqlbvG26om68dX
         rBpQ==
X-Gm-Message-State: AOAM532G8gptL/XLRR3wQHpmuLAtQtlFiZgoBAUqnNm1hmsuJ8sP/mU/
        slxBJVsFwfUv2HYU6lhk94W+Fg==
X-Google-Smtp-Source: ABdhPJxDo9CKPwfYYQ62I6co+RpPSdFHSZp0VsmTQ8KneCoKgTbWkekdRlvpRjBbJ2rtjB3lgfF5MA==
X-Received: by 2002:ac8:5ed5:: with SMTP id s21mr6420142qtx.87.1623455196302;
        Fri, 11 Jun 2021 16:46:36 -0700 (PDT)
Received: from turing-police ([2601:5c0:c380:d61::359])
        by smtp.gmail.com with ESMTPSA id g5sm5496121qke.101.2021.06.11.16.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 16:46:35 -0700 (PDT)
Sender: Valdis Kletnieks <valdis@vt.edu>
From:   "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Muni Sekhar <munisekharrms@gmail.com>
Cc:     linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
        alsa-devel <alsa-devel@alsa-project.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: USB sound card issues
In-Reply-To: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1623455194_23653P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Jun 2021 19:46:34 -0400
Message-ID: <26698.1623455194@turing-police>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--==_Exmh_1623455194_23653P
Content-Type: text/plain; charset=us-ascii

On Tue, 08 Jun 2021 16:20:07 +0530, Muni Sekhar said:

> $ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz x.wav
> Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz, Mono
> arecord: pcm_read:2032: read error: Input/output error

Always check the obvious stuff first  does the card support S16_LE 32Khz data?
And if it's configurable for multiple formats, was it set for the correct one?

Does wireshark or other USB snoop program show any traffic at all?
Does the record die immediately, or hang for a few seconds and timeout?
Does 'arecord -v' or arecord -vv' tell us anything more about the situation?

--==_Exmh_1623455194_23653P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBYMP12gdmEQWDXROgAQLIDg/+OTEH8NUNHBi0Z0ZAwqC40hjQlz5u+K/x
/1Lm/4vfMZo5O9Xs3S1pgtTkElRWkKls5gErziSPTOFsKF9yAWsz+rTxKT4+NKNt
OK8DQicMfmbzKYNslThtm6V5JTLRJMGDtho6tK9K2V8n9C3WJTJHclvuTyWBXyLE
ZeJQa//b95ce8q+9e4MmYv9KU1Nyf7uKTleQPUWMNBcYC2MvB6okb/D6Q3N0zSZV
wWbMMC00oilqfkJxBw0AvjhdpQ+0Yc2dbx58NaIwirAs/okE1z1uPJoW05XoSdwo
unQuKKa6qoN85wwo4qkKjN2H4Ev9ao5+427M+xPPc2AjhBoctNzA7CQJeg9ZmyTI
T1ewBD8sxNrharNeZ0BLtMTgpfcFhpXCLOcaMbUqIqu9iE6hDypACSWYSLZgN1ee
fJr8tkIe6qUx75VbbY1f0H+UfRqVrogp/EFqJYQaiXL461Ls0Lc4PyzqRMEMEjwR
vRMjOci0Q1tbEO0UXjaw7XSs8lKE0IcBYHGOBGanrPNDfDlMu0RCbAeWiHgC0vxn
ZFZ4m37nJN0Pj9mQiuyk1RAzTMyOCc/t213dNjOElYb8ZpvqjyHngIxTtAHzCSVG
g1l5m6gXxWM54gN6pDn/4sk40TPmwPHNcCaYpzkUa2/8xudTs/zZ+lQoc8Znd4nx
LxU/hQOag6s=
=1MM3
-----END PGP SIGNATURE-----

--==_Exmh_1623455194_23653P--
