Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77393A76F3
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 08:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhFOGQ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 02:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhFOGQ1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Jun 2021 02:16:27 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4DDC061767
        for <linux-usb@vger.kernel.org>; Mon, 14 Jun 2021 23:14:23 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id r19so635853qvw.5
        for <linux-usb@vger.kernel.org>; Mon, 14 Jun 2021 23:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:in-reply-to:references:mime-version
         :content-transfer-encoding:date:message-id;
        bh=5p6r7tT6JpnFVOCQc0t32V8ptgw1D+osB0n0nDQ9dZU=;
        b=T2bnSnYNFfcwYBnxPxx2HOKCb0V6e+i0YyfI7rzyxiD5eF8+LeGZqMdv6Br3Mv6YDo
         jiWnTvbaLy8JONXsbpg4jTXZHgJTV9j5bLBjqNANfEHpjMLF4iPM1BYbz0WUj67zJejR
         kMz2QQBmzxq6o2c3yd/Ml2IIlFQCItgG9zEnxqwoA3fpfRznf1LY8KrcObSCH83Lavit
         WkRsAD7krZzpsBlSJFFStB+LWq3LxyDRA085FpTBfzcllEiYg4o7KPAJzXu8gldIkdUz
         pIh97MFFN1kNR95Yq7i5S91vj+2nRuAQ5PeR46FeHTAJXael3ddOt2Q4Q9BBpLg9pY4J
         6fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :mime-version:content-transfer-encoding:date:message-id;
        bh=5p6r7tT6JpnFVOCQc0t32V8ptgw1D+osB0n0nDQ9dZU=;
        b=ZiIr1x2i+FyuL4UqxtromoImSCC/Oo8uWoH7DPFad6r4homLFU29Jnk20U8H4zfjsD
         Eqb/SNlPVFqDXia+jeeWMdKvHdI7YLwxI8VwCHa4FZYWgl3ElpIF769bqYnnVBKBtU1c
         cvshCqe0zVSG/oOknryIVfTArqLJQuFNSdk11b0vcchpEinZMX2OI1DKy/GsmyIqsA5h
         6tqNOn6wsQQ/5WYKhUDhypB1Vw1ELX8Arfey0zSJ8F21jpxjDe3idr6MXGzvOUQXnH+O
         DqReK2F6y+8RdXfsbClm8AI/IH6IxFSBuw3jiHI2G14LdmVApJkUoKzHSEOWU1PZtS3S
         Bf8Q==
X-Gm-Message-State: AOAM532MSgQxnE2e1KOu6RNltLog38BeNXUDBZ+gllOs8GN4i0Fcgerb
        3apY7M59fSgiTn7Lfop9rjaVpQ==
X-Google-Smtp-Source: ABdhPJxMAdHu3UVivt6CyjfIbsc13nvBGRaXL9cOxzuyGEdMnuynC8A7XlRVCPMCQBrHGUpWEqlprg==
X-Received: by 2002:ad4:4513:: with SMTP id k19mr3455852qvu.10.1623737662368;
        Mon, 14 Jun 2021 23:14:22 -0700 (PDT)
Received: from turing-police ([2601:5c0:c380:d61::359])
        by smtp.gmail.com with ESMTPSA id d10sm9126220qko.73.2021.06.14.23.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 23:14:21 -0700 (PDT)
Sender: Valdis Kletnieks <valdis@vt.edu>
From:   "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Muni Sekhar <munisekharrms@gmail.com>
Cc:     linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
        alsa-devel <alsa-devel@alsa-project.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: USB sound card issues
In-Reply-To: <CAHhAz+goVhacpDPc-OaVuG151TS8QKYdsqdnK9UcAx+Hc07zSg@mail.gmail.com>
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com> <26698.1623455194@turing-police>
 <CAHhAz+goVhacpDPc-OaVuG151TS8QKYdsqdnK9UcAx+Hc07zSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1623737660_27061P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Tue, 15 Jun 2021 02:14:20 -0400
Message-ID: <27987.1623737660@turing-police>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--==_Exmh_1623737660_27061P
Content-Type: text/plain; charset=us-ascii

On Sat, 12 Jun 2021 16:45:00 +0530, Muni Sekhar said:

> > And if it's configurable for multiple formats, was it set for the correct one?
> Is there a way to verify was it set for the correct one or not?

arecord -v gives what it thinks the setup is.

> > Does the record die immediately, or hang for a few seconds and timeout?
> What is the difference between these two ways?

An immediate failure is usually related to a "Can't do it" situation where the
USB interaction to configure the device has failed, while a timeout usually
indicates that the configuration at least *claimed* to succeed, but is failing
to properly transfer valid data.

> For my hardware, I noticed that it hangs for a few seconds and gives EIO (arecord:
> pcm_read:2032: read error: Input/output error).

Given that the usbmon output ran to several megabytes, that's tending to
point at "the card was returning lots of packets, but they weren't actually the
format/data that arecord was expecting.

--==_Exmh_1623737660_27061P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBYMhFPAdmEQWDXROgAQLflRAAs+j4NzJsZvDoYyONGr7oogKXJeN9xOeC
MZ4TriWfaNZFsJjF4vZLASaJHchFooza6IVmfXyydw5eaDqiMjY29248qWt3Udcn
pX0riM8ss4f1PZHJJ1wxXUB7xyWllk8B7rSUCQVQzleBa869EnUBL8scgZo4wfFR
bLcIWoB6MOYzCWUCAH46qKVBlDfuF21vH3X/njcPoYVDFkBzrWBdtf7EZRNUD4eF
OZECVvE6Wlf7FrAhMX7Z25MKEtvFk/5/3XO18vMvB+iI/4mcqgYhhTbL9T20kHxn
X5Z4diY31QZNRitK7uQvBCv70moH0gyP5wmP1qaEV6NV3PojwBsC2UlvkKx0Rq8q
Yj/+3BEhaJI3lmKnFzNKaAlxSoWLtkfaiYz3fq0s04kQg36j05eV+UuzvKMe6Nvi
PiB/QPhDAqpnxWCEQ8vAi9CXV/pM46ZdPFJlZtLZZe0RcwCRKKUfGKFVK9i19cRX
ifhZOMUtHdcQi8j7cDuauFQYd4j+M8wLsTEd7E4G0vEcp+hebC66s+cWMP0Ofg0f
OVRT4jHovw4UQuimQ5M7dc0B+MAqLUYv8caoHgBI3/Wvy7de/b7tSGwoEt8uZbha
opHBCfQ+5lxTwMn66g6GGMEarC1CCjD0D9DtaT4DaDHzx/ZUNg9w+rxS/sKJen+i
Q40iY/MKlhU=
=3wIB
-----END PGP SIGNATURE-----

--==_Exmh_1623737660_27061P--
