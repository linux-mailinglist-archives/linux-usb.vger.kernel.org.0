Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 744AF3CA4C6
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jul 2021 19:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235967AbhGORzf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jul 2021 13:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbhGORzf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jul 2021 13:55:35 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3AFC06175F
        for <linux-usb@vger.kernel.org>; Thu, 15 Jul 2021 10:52:41 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id b6so5751145iln.12
        for <linux-usb@vger.kernel.org>; Thu, 15 Jul 2021 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a6fYXbbWKeX0QAb3ojd8lFrdeu8DVSJRvxuAR3rEdtU=;
        b=Wk6zQeSOwtQf/p71CKni2nV6ENwiCzPwhvN8ETfzWLSyC1W/c1Zy78HFssjTG10Yww
         UIDfhPaDyTGVr25fLP431wNFQ6E+cKMSbDF7kQGYHvYlH0E3lBXhlCeLymQwcH+O9JnL
         7++AGrBQv3u2kS50ZMkLrqQQ3TD/vWTw4oqn7iEvOjKyHg0nW+gtmmGugLm4uAA3XnfT
         9r+TP+YHYX1U/dTjjfKHpYxYVIQrcMikfZ2beE49tIR4t3Xmg7ZkqIByIVe0iqCR0r23
         +bCj4sbqFREjAH+PqVhqGX9MlpUUH9l31UB/bHZFnDl3HUdeD8UhAPwYmQs7GxOzeNt2
         P/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a6fYXbbWKeX0QAb3ojd8lFrdeu8DVSJRvxuAR3rEdtU=;
        b=pkB1QPP/pXoj7sA4+Gl7oZ7OFYTctR4IpbI6ULCVTAwF1hlA/gPc+p5XeUfivYB5Zo
         PzQGPEBoq66WklW3jwT95t6/P+pKw43Lse2mW7LRHkxACsZJybnU0KgQlZdZLfoaVzJO
         InDUOWgeuwXrUOc3G7Vh9XM24Gma04u8mv3ZVqR/e12hrLGri2/zUhXgJqMDHLMocyAZ
         NW9DAudN+r2Zt6hCq1W5Ul+3Bw68k5vC9U0lwSI3wns3yP5b38BqFY9pwdAhXfRCIDaH
         W0rhq37TgQV4hQBvuFLv2X401LmUKoMmPJF1uN8qkRwfnF/ly1d6Zs0p2cJ3f42xawAG
         vKKg==
X-Gm-Message-State: AOAM532zPQFN2ZGt7y/CwEa+mfxbAvULisOQJwP5qSfEPevtSVj0Nlmh
        4OkTotpVpDt8uP9zy9DUgymsbc+JIjw/tN+YKMg=
X-Google-Smtp-Source: ABdhPJxGXxWbt1tuZQiFCcQXlBrm6rd//eNV3vsBM09ZQczcSnuipKxpCrAZPi52++oi2sXNcO2sxofLptFRn6pnHw0=
X-Received: by 2002:a92:7312:: with SMTP id o18mr3251499ilc.289.1626371560951;
 Thu, 15 Jul 2021 10:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <f861e345-3642-5bfa-0ce7-a5cd34204613@ivitera.com>
 <1j8s2aa071.fsf@starbuckisacylon.baylibre.com> <25120679-fe61-fb6a-d671-393e15428da0@ivitera.com>
 <1jeebzq5k6.fsf@starbuckisacylon.baylibre.com> <94718a5e-ea36-4a86-da4d-a30179c1c2c7@ivitera.com>
 <1jbl73ptt9.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jbl73ptt9.fsf@starbuckisacylon.baylibre.com>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Thu, 15 Jul 2021 12:52:30 -0500
Message-ID: <CABb+yY00Ewky7X7PGSLqSmjr7L-08AGCFCnXpF=FSFc2_98UhQ@mail.gmail.com>
Subject: Re: usb:gadget:u_audio: Regression in [v3,3/3] usb: gadget: u_audio:
 add real feedback implementation - wMaxPacketSize calculation
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 15, 2021 at 12:40 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Thu 15 Jul 2021 at 14:36, Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>
> > Dne 15. 07. 21 v 11:39 Jerome Brunet napsal(a):
> >> On Tue 13 Jul 2021 at 15:16, Pavel Hofman <pavel.hofman@ivitera.com>
> >> wrote:
> >>
>
> >> So 48kHz / 2ch / 16bits. Let's assume USB_SPEED_FULL for example (result
> >> is the same for the other speeds).
> >> In such condition, the nominal packet size is 192B but to accomodate an
> >> extra sample, the maximum should indeed be 196B.
> >>      if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
> >>              srate = srate * (1000 + uac2_opts->fb_max) / 1000;
> >> with fb_max being 5 by default, srate should be 48240 after this.
> >>
> >>      max_size_bw = num_channels(chmask) * ssize *
> >>              DIV_ROUND_UP(srate, factor / (1 << (bInterval - 1)));
> >> With USB_SPEED_FULL, bInterval is 1 and factor is 1000 so:
> >> => DIV_ROUND_UP(48240, 1000 / 1) should give 49;
> >> Then
> >> => max_size_bw = 2 * 2 * 49 = 196
> >> So the end result should be 196 with current code. I tried on an ARM64
> >> platform. Here is what I get:
> >> [   26.241946] set_ep_max_packet_size: speed is USB_SPEED_FULL
> >> [   26.243208] set_ep_max_packet_size: intermediate Playback srate 48000
> >> [   26.249758] set_ep_max_packet_size: max_size_bw 192
> >> [   26.254559] set_ep_max_packet_size: speed is USB_SPEED_FULL
> >> [   26.260130] set_ep_max_packet_size: intermediate Capture srate 48240
> >> [   26.266401] set_ep_max_packet_size: max_size_bw 196
> >> [   26.271209] set_ep_max_packet_size: speed is USB_SPEED_HIGH
> >> [   26.276873] set_ep_max_packet_size: intermediate Playback srate 48000
> >> [   26.283165] set_ep_max_packet_size: max_size_bw 192
> >> [   26.288015] set_ep_max_packet_size: speed is USB_SPEED_HIGH
> >> [   26.293691] set_ep_max_packet_size: intermediate Capture srate 48240
> >> [   26.299965] set_ep_max_packet_size: max_size_bw 196
> >> [   26.304753] set_ep_max_packet_size: speed is USB_SPEED_SUPER
> >> [   26.310426] set_ep_max_packet_size: intermediate Playback srate 48000
> >> [   26.316805] set_ep_max_packet_size: max_size_bw 192
> >> [   26.321625] set_ep_max_packet_size: speed is USB_SPEED_SUPER
> >> [   26.327309] set_ep_max_packet_size: intermediate Capture srate 48240
> >> [   26.333613] set_ep_max_packet_size: max_size_bw 196
> >> All seems OK and as expected with what's in mainline ATM.
> >> So I'm not quite sure why you would get a different result. It would be
> >> great if you could check further.
> >>
> >
> > The problem is max_size_bw=192 for the Playback (i.e. is_playback =
> > true). If only capture direction is activated (p_chmask=0), only EP-OUT
> > with max_size_bw=196 is generated and Win10 enumerates the playback-only
> > audio device.
>
> Ok, that was not clear before.
>
> > Once the other direction with max_size_bw=192 is activated
> > (either duplex or capture-only), Win10 refuses to enumerate.
>
> Looking further at the format specification [0] (and crawling the web to
> decipher it), it seems that
>
> * For isochronous links: packet size must match the nominal rate.
> * For async and adaptative: it must match the nominal rate +/- 1
>   packet. That is whether we intend on varying the packet size or not.
>
> This has several implication
> * In async mode, the device is running of its own clock. It has no
>   reason to vary the playback packet size but it should still reserve
>   bandwidth for an extra packet to satisfy the spec. This seems to be
>   your problem and what Win10 insist on.
>
>   When I tested, I had linux on both sides and apparently it is not too
>   picky about that.
>
> * If we apply the spec strictly, like Win10 seems to insist on,
>   calculating the maximum packet size based on explicit feedback limits
>   is wrong too. Whatever happens, it should be +/- 1 around nominal.
>
IIRC, a couple of years ago, Alan proposed a smart scheme to keep the
UAC2 byterate in exact sync with what's expected over time. You may
have to dig into the alsa archives though.

cheers.
