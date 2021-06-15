Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA223A777C
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 09:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbhFOHDG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 03:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbhFOHDD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Jun 2021 03:03:03 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173B3C061574;
        Tue, 15 Jun 2021 00:00:58 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f30so25279523lfj.1;
        Tue, 15 Jun 2021 00:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9R6yJGe9iXR+QKQYp3ed6kj3FohafuSvjRzw5BTEgL8=;
        b=umkC6wBaORmGymofAod7RGVV1/CFa3gkF1CQn9wzc5EdLRiFhVCfpGj4KyX7JTVjvx
         uuhHrzT0515t+Yvglmxuz/XKjq2Xfggw8B78fd/15+Me4cfqluoK9kRKk7G+jVYTbctV
         OWOWHqY/XBcg7EcN2XnFoYNHquUWFVVyjhy8mklTV3vIqFFheMmfQ0aVQMir+C/7eUx1
         K9np5llFqzLB3Npo13I8KgtbuLAIbRImfo2gaktQujf5aU5kZryi4p5r35tKRSLMYype
         Y2nCX8mu+3XxjtZzDZFtpNfRDjwldRgdSW18jXGwCN8rx6oPpq//Nlfq5ndG9WJykeVY
         jSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9R6yJGe9iXR+QKQYp3ed6kj3FohafuSvjRzw5BTEgL8=;
        b=i+8BKjAxlNBQrZtK7uFNrE/P+2xOoRNd8WraApuVfDoMiOiyV2gVLKUYgDPoMhhTlT
         az2+XuYWPuqBWOIy+McC4dhJDJMJrAU65j9mxu70r3l4giRb1bnTtqaJ67YQcHxOt7S1
         qz2Wl57zUEM6GygMA0Jfkgk66en8ucA33JaIz7LYW5OFq87mTLxOswiaqbjAvvV+FbQH
         9IeIIsL+W0UEnnOlo/uQQmjEsbjEMZVqk6a/4YhitWBEI4ZPF3+AkCagkgpDMAOK7q3D
         qsLDreSnNNA2XA2tLG5N0ych3vWnPCOCVStSnyPy0pgOlYfGEptshOZu1Cpj3H3FcqZo
         zSDA==
X-Gm-Message-State: AOAM531zNM7gd/0e3OzSslM99F+MlRKXaoG0eRRCkMDskNFVcrTEZQwn
        Dv53ExKpoFJNdTh9LkkbrsF/HWk3BRSKbh8EV10=
X-Google-Smtp-Source: ABdhPJytbmpBc/v6/ujKDjf3vh3FQsf5IDAR1hAnC4zwXLCCxyHZEhLaHGrG2m9yRzgcGvIdYRh4TaR09Z8B2Z0GQfM=
X-Received: by 2002:ac2:5ecc:: with SMTP id d12mr15247436lfq.539.1623740456413;
 Tue, 15 Jun 2021 00:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
 <26698.1623455194@turing-police> <CAHhAz+goVhacpDPc-OaVuG151TS8QKYdsqdnK9UcAx+Hc07zSg@mail.gmail.com>
 <27987.1623737660@turing-police>
In-Reply-To: <27987.1623737660@turing-police>
From:   Muni Sekhar <munisekharrms@gmail.com>
Date:   Tue, 15 Jun 2021 12:30:45 +0530
Message-ID: <CAHhAz+iOFda+T3=ri2o8UhNR1L1KVdKJUYABS8djijqvhsn3JQ@mail.gmail.com>
Subject: Re: USB sound card issues
To:     =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc:     linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
        alsa-devel <alsa-devel@alsa-project.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 15, 2021 at 11:44 AM Valdis Kl=C4=93tnieks
<valdis.kletnieks@vt.edu> wrote:
>
> On Sat, 12 Jun 2021 16:45:00 +0530, Muni Sekhar said:
>
> > > And if it's configurable for multiple formats, was it set for the cor=
rect one?
> > Is there a way to verify was it set for the correct one or not?
>
> arecord -v gives what it thinks the setup is.
>
> > > Does the record die immediately, or hang for a few seconds and timeou=
t?
> > What is the difference between these two ways?
>
> An immediate failure is usually related to a "Can't do it" situation wher=
e the
> USB interaction to configure the device has failed, while a timeout usual=
ly
> indicates that the configuration at least *claimed* to succeed, but is fa=
iling
> to properly transfer valid data.
>
> > For my hardware, I noticed that it hangs for a few seconds and gives EI=
O (arecord:
> > pcm_read:2032: read error: Input/output error).
>
> Given that the usbmon output ran to several megabytes, that's tending to
> point at "the card was returning lots of packets, but they weren't actual=
ly the
> format/data that arecord was expecting.
So, is it a USB card issue?



--=20
Thanks,
Sekhar
