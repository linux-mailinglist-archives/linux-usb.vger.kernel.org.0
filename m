Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F382CEFC1
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 15:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgLDOgM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 09:36:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbgLDOgL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 09:36:11 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A525C061A52
        for <linux-usb@vger.kernel.org>; Fri,  4 Dec 2020 06:35:31 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id b62so5339637otc.5
        for <linux-usb@vger.kernel.org>; Fri, 04 Dec 2020 06:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/1bEtuKKORPTmuw20aL08bHRkgn8Ak8CY1Hjaz541A0=;
        b=dR9HMt3ZL+MNuNcRwrN3mPBJ6qZN7TsCfirXG+faw6+fru9nixQqIkvYSaTyuKvBzV
         4DRfq5HZkCAJvhZZdCipyHwe39+AwebqS+PpnkzK8CHKVLX5mLrdfZiATiwxCPz3Uy2j
         PIglJBxYZHh01aS1uzDwqIWxQUNL+fFK6qVGLxI6OoHDKuICIXBePliChtEHoQAh+KMr
         j2KhjLmIe/qj0UtUzWGId4Pu4GewAiArkzXc4CJ8pxmHlPCaUtshEwQUv+hygNC0/NBS
         Z5oceRZ/if+yCX5L7/mYBzqKjory5S8myWqM0+VuxjBsVbV/SIsShr5ryDAdixpfBrca
         ZVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/1bEtuKKORPTmuw20aL08bHRkgn8Ak8CY1Hjaz541A0=;
        b=lRgy/1G1dsWp+EqCTsHZAve/O8BUHu7M2lCFpwzlURuB03FZGjaeU7HeM37+V3hCEI
         UJgjjiRyD5oH+ytE2mR+vrDA8BbRFqTRXcXdLbDdUz4SFr60wi/i8eyoFm6GSynhfO7g
         7Y+7gSrPfJVsz0re35MRcBX4hwAJ82RvVenLNU69UCD6tR6wIftVAob7BmI2H8IOfO+2
         P5S+p2RMMtmDlaqdda0GRzbKCMtjS26mZ72Mo4GcU5pAQjH1PhY155QUKMgH1uYU6J9M
         BLkcqKIGJd1DEHbCXecCx8ecKi5a9b9obWj5gBWmBuaf3iwD+qmEY3aKKMkLHm6ZNZHC
         BzqA==
X-Gm-Message-State: AOAM533pLLLJbk8bpzA6EhZY6vSKoc8ZumIdapTW0CQo+eXop5kDwfQt
        eJFwUmdZU4Vk0+sfwwg3ThX0pjrAn5l1Nyw7QyY=
X-Google-Smtp-Source: ABdhPJx/rif+yq1jaOEyhhMpwaYMeO8KoCVW4/9j14HMDTfVBVq9/2l4c/UKqX+8ufvg+rsO0T+VWvpBYQM3qZ3xrvs=
X-Received: by 2002:a9d:6641:: with SMTP id q1mr3806501otm.190.1607092530610;
 Fri, 04 Dec 2020 06:35:30 -0800 (PST)
MIME-Version: 1.0
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <20201111092941.GJ14896@b29397-desktop> <CAB=otbSAGhDYxim9_fsyH4pZCLqgq+bxNJfv5hXqgQRVngVaig@mail.gmail.com>
 <CAMS2kBF5Gvhnf7AzdeSFeVeWBLhtHM_hHfTvMLTN-3Jkh=BwHw@mail.gmail.com>
 <CAB=otbTK0j03HjiLS-tqqaBTuavaFEJs49hpKPj2Df8e1_WN+A@mail.gmail.com> <1jblfk8di1.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jblfk8di1.fsf@starbuckisacylon.baylibre.com>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Fri, 4 Dec 2020 16:35:18 +0200
Message-ID: <CAB=otbQ0Y1tbRgE=hWKJkhe_7f6rxoithLMuV9=6YXhpMrGXtw@mail.gmail.com>
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Glenn Schmottlach <gschmottlach@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 26, 2020 at 3:16 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Sun 22 Nov 2020 at 20:51, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
>
> > On Fri, Nov 13, 2020 at 5:35 PM Glenn Schmottlach
> > <gschmottlach@gmail.com> wrote:
> >>
> >> On Thu, Nov 12, 2020 at 6:20 PM Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
> >> >
> >> > On Wed, Nov 11, 2020 at 11:30 AM Peter Chen <peter.chen@nxp.com> wrote:
> >> > >
> >> > > On 20-11-08 02:18:28, Ruslan Bilovol wrote:
> >> > > > Current UAC2 gadget implements capture/sync paths
> >> > > > as two USB ISO ASYNC endpoints (IN and OUT).
> >> > > >
> >> > > > This violates USB spec which says that ISO ASYNC OUT endpoint
> >> > > > should have feedback companion endpoint.
> >> > > > See USB2.0 spec  "5.12.4.1 Synchronization Type": asynchronous
> >> > > > sink provides explicit feedback (isochronous pipe).
> >> > > > Interesting that for ISO ASYNC *IN* endpoint respective
> >> > > > feedback isn't required since source provides implicit
> >> > > > feedforward (data stream).
> >> > > >
> >> > > > While it's not an issue if UAC2 Gadget is connected to
> >> > > > Linux host (Linux ignores missing feedback endpoint),
> >> > > > with other hosts like Windows or MacOS the UAC2 Gadget
> >> > > > isn't enumerated due to missing feedback endpoint.
> >> > > >
> >> > > > This patch series adds feedback endpoint support to
> >> > > > UAC2 function, new control to UAC2 mixer which can
> >> > > > be used by userspace tools (like alsaloop from alsa-utils)
> >> > > > for updating feedback frequency reported to the host.
> >> > > > This is useful for usecases when UAC2 Gadget's audio
> >> > > > samples are played to another codec or audio card
> >> > > > with its own internal freerunning clock so host can
> >> > > > be notified that more/less samples are required.
> >> > > >
> >> > > > The alsaloop tool requires some (relatively small)
> >> > > > modifications in order to start support driving
> >> > > > feedback frequency through UAC2 mixer control.
> >> > > > That change will be sent as a separate patch
> >> > > > to ALSA community.
> >> > > >
> >> > > > Also added ability to switch ISO ASYNC OUT endpoint into
> >> > > > adaptive endpoint which doesn't require feedback endpoint
> >> > > > (as per USB spec).
> >> > > >
> >> > > > Ruslan Bilovol (3):
> >> > > >   usb: gadget: f_uac2/u_audio: add feedback endpoint support
> >> > > >   usb: gadget: f_uac2: add adaptive sync support for capture
> >> > > >   usb: gadget: u_audio: add real feedback implementation
> >> > >
> >> > > Hi Ruslan,
> >> > >
> >> > > I applied your patches, but WIN10 still can't recognize it well.
> >> > > The UAC1 is OK for WIN10 with the below same configuration.
> >> > > Any debug information you would like to know to check it?
> >> > >
> >> > >
> >> > > if [ "$FUNC" == "uac2" ]; then
> >> > > mkdir functions/$FUNC".0"
> >> > > echo 2 > functions/$FUNC".0"/p_ssize
> >> > > echo 48000 > functions/$FUNC".0"/p_srate
> >> > > echo 3 > functions/$FUNC".0"/p_chmask
> >> > >
> >> > > echo 2 > functions/$FUNC".0"/c_ssize
> >> > > echo 48000 > functions/$FUNC".0"/c_srate
> >> > > echo 3 > functions/$FUNC".0"/c_chmask
> >> > > #echo 4 > functions/$FUNC".0"/req_number
> >> > > ln -s functions/$FUNC".0" configs/c.1
> >> > > echo high-speed > /sys/kernel/config/usb_gadget/g1/max_speed
> >> > > fi
> >> > >
> >> >
> >> > Hmm... I just tested below config and it works fine with my Win10.
> >> > The only thing I noticed is Windows doesn't enable UAC2 gadget
> >> > by default, but this can be done from Win10 sound settings
> >> >
> >> > --------------------------------->8--------------------------------------
> >> > mkdir cfg
> >> > mount none cfg -t configfs
> >> > mkdir cfg/usb_gadget/g1
> >> > cd cfg/usb_gadget/g1
> >> > mkdir configs/c.1
> >> > mkdir functions/uac2.0
> >> >
> >> > # 44.1 kHz sample rate
> >> > echo 44100 > functions/uac2.0/c_srate
> >> > echo 44100 > functions/uac2.0/p_srate
> >> >
> >> > mkdir strings/0x409
> >> > mkdir configs/c.1/strings/0x409
> >> > echo 0x0101 > idProduct
> >> > echo 0x1d6b > idVendor
> >> > echo my-serial-num > strings/0x409/serialnumber
> >> > echo my-manufacturer > strings/0x409/manufacturer
> >> > echo "Test gadget" > strings/0x409/product
> >> > echo "Conf 1" > configs/c.1/strings/0x409/configuration
> >> > echo 120 > configs/c.1/MaxPower
> >> > ln -s functions/uac2.0 configs/c.1
> >> > echo musb-hdrc.0 > UDC
> >> > --------------------------------->8--------------------------------------
> >> >
> >> > Thanks,
> >> > Ruslan
> >>
> >> Hi Ruslan -
> >>
> >> With your configuration (above) Win10 was able to recognize and load
> >> the driver. What appears to prevent my configuration from loading is
> >> the fact that I selected 48K as my sample rate and my capture/playback
> >> channel mask includes more than two (2) channels. If I take your
> >> configuration and change the sample rate (c_srate/p_srate) to 48000
> >> Windows will fail to load the driver. Likewise, setting the
> >> c_chmask/p_chmask to 7 (three channels) will also cause the driver to
> >> fail to load.
> >>
> >> You mentioned there is an option in Win10 Sound Settings to "enable"
> >> UAC2 by default. I cannot find that option and I wonder if this is
> >> what is preventing me from changing the sample rate or channel mask?
> >> Could Windows be treating my audio gadget as a UAC1 device rather than
> >> a fully multi-channel audio device (even though the usbaudio2.sys
> >> driver is loaded)? Have you tried other configurations to verify your
> >> Win10 box supports more than two channels and a 44.1K sample rate? I
> >> look forward to your feedback and any suggestions you might offer.
> >>
> >
> > I was able to reproduce the issue and prepared a patch below, please
> > try it and see if it fixes the issue.
> >
> > Maximum data rates that I used were (AFAIR) 8 channel 192kHz/32bit,
> > but there is another issue with high data rate if someone uses so many
> > channels, very high sampling frequency or sample size that data can't
> > fit into allowed (by USB spec) max packet size of endpoint. In this case
> > need to decrease bInterval of endpoint.
> > I test it in a high-performance audio case so always use a minimal possible
> > bInterval (set to '1').
> > Of course in the future that need to be calculated dynamically depending on
> > the UAC2 settings
> >
> > Please test patches below and see it it helps
> >
> > ---------------------------------------------8<----------------------------------------
> > From 51516435bbf2486574ec7bc9fd4726677cd474a4 Mon Sep 17 00:00:00 2001
> > From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > Date: Sun, 22 Nov 2020 21:05:38 +0200
> > Subject: [PATCH] usb: gadget: f_uac2: always increase endpoint max_packet_size
> >  by one audio slot
> >
> > As per UAC2 Audio Data Formats spec (2.3.1.1 USB Packets),
> > if the sampling rate is a constant, the allowable variation
> > of number of audio slots per virtual frame is +/- 1 audio slot.
> >
> > It means that endpoint should be able to accept/send +1 audio
> > slot.
> >
> > Previous endpoint max_packet_size calculation code
> > was adding sometimes +1 audio slot due to DIV_ROUND_UP
> > behaviour which was rounding up to closest integer.
> > However this doesn't work if the numbers are divisible.
> >
> > It had no any impact with Linux hosts which ignore
> > this issue, but in case of more strict Windows it
> > caused rejected enumeration
> >
> > Thus always add +1 audio slot to endpoint's max packet size
> >
> > Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > ---
> >  drivers/usb/gadget/function/f_uac2.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/gadget/function/f_uac2.c
> > b/drivers/usb/gadget/function/f_uac2.c
> > index ebdb2a1..1698587 100644
> > --- a/drivers/usb/gadget/function/f_uac2.c
> > +++ b/drivers/usb/gadget/function/f_uac2.c
> > @@ -486,7 +486,7 @@ static void set_ep_max_packet_size(const struct
> > f_uac2_opts *uac2_opts,
> >   }
> >
> >   max_packet_size = num_channels(chmask) * ssize *
> > - DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
> > + ((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
> >
> >   if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
> >   max_packet_size = max_packet_size * FBACK_FREQ_MAX / 100;
>
> I think "reserving" 20% additional bandwidth is a bit extreme.
> In the end, the purpose is composate the drift which appears between
> different XTALs

That isn't extreme, I checked snd-usb ALSA driver before selecting number
and it assumes the drift is between -25% ... +50% so +/-20% should work
fine here (see snd_usb_handle_sync_urb() in sound/usb/endpoint.c).

Since our UAC2 gadget is a kind of "reversed" USB audio card, that also
works fine with alsaloop connecting it to other audio cards in the system.

>
> Allocating bandwidth for 1 more sample than the stream should require
> (49 instead of 48 for 48kHz with 4 bIntervals) should allow to
> compensate any realistic drift, don't you think ?

With cheap USB Audio adapters I saw +/-100 Hz drift on 44100 Hz

Anyway I don't think this can cause any problem since it is OK as
per UAC2 spec and hosts (at least Linux) can handle such values

Thanks,
Ruslan

>
> > --
> > 1.9.1
> >
> >
> > ---------------------------------------------8<----------------------------------------
> > From c8f2f2b414af672ec40841e75fb1ea761ae29122 Mon Sep 17 00:00:00 2001
> > From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > Date: Sun, 16 Feb 2020 22:40:23 +0200
> > Subject: [PATCH] usb: gadget: f_uac2: change bInterval to 1 for
> >  8ch/24bit/44.1kHz
> >
> > With bInterval=4 one audio slot in case of 8ch/24bit/44.1kHz
> > exeeds MaxPacket size of ISO endpoint (>1024) and can't be
> > transferred in time.
> > USB spec ("5.6.3 Isochronous Transfer Packet Size Constraints")
> > says if we need to transfer more than 1024 it is a high speed, high
> > bandwidth endpoint and should have bInterval=1.
> >
> > In the future, bInterval should be dynamically calculated
> > depending on bandwith requirementes
>
> Probably better to do it from the start to avoid breaking stuff for
> people who have been using the gadget with the current badnwidth so far

That is an existing issue with UAC2 driver since its initial implementation,
I'm going to fix it in the near future as a separate patch. The issue is not
related to the feedback synchronization support patch.

I actually developed a few patches (not published yet) to check user
parameters and refuse to start UAC1/2 gadget if they are wrong
(currently UAC1/2 gagdet accepts incorrect parameters and then
silently fails to work correctly)

Thanks,
Ruslan

>
> >
> > Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > ---
> >  drivers/usb/gadget/function/f_uac2.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/function/f_uac2.c
> > b/drivers/usb/gadget/function/f_uac2.c
> > index 3633df6..fb9b875 100644
> > --- a/drivers/usb/gadget/function/f_uac2.c
> > +++ b/drivers/usb/gadget/function/f_uac2.c
> > @@ -281,7 +281,7 @@ enum {
> >
> >   .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> >   .wMaxPacketSize = cpu_to_le16(1024),
> > - .bInterval = 4,
> > + .bInterval = 1,
> >  };
> >
> >  /* CS AS ISO OUT Endpoint */
> > @@ -358,7 +358,7 @@ enum {
> >
> >   .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> >   .wMaxPacketSize = cpu_to_le16(1024),
> > - .bInterval = 4,
> > + .bInterval = 1,
> >  };
> >
> >  /* CS AS ISO IN Endpoint */
>
