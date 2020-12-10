Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D442D5AD1
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 13:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgLJMre (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 07:47:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgLJMre (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 07:47:34 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45EDC0613CF
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 04:46:53 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id q25so5551100oij.10
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 04:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=shwvyEjP6Y2ynWLUNNSf6wQkVLatlUvWhbQEfctbu1s=;
        b=LVepg6KuDH906PJWthoHcqaOZba++eVorZAbUi9H2B/L8RKnMB/+lcBHrrzAqNb15K
         pSPRiiUyMX0h1RfXlIgGC/RPUxCQ5JStBh05rji9v3xt3jU09xnj9D0SoqgRwDZ10Wgo
         qdHJcFsZr+vR+yJfb1vF2DnzGm0/KCHuWTi8PcjCN6//qcrHrU9JkDm8tY9WiCBFB9IT
         MyAhQMtEAZJiWjmIM9CRMMwRllqmArlsvZZN8ccwXa1GnJKT8sTE/NVz3MwZmf0cUUpp
         gESrwn6NOO9s0FdJRVE7gyIbvUarxb69I4l4DFDw9gPuNtqF2KH1l50efQPFY7y3b32D
         YsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=shwvyEjP6Y2ynWLUNNSf6wQkVLatlUvWhbQEfctbu1s=;
        b=dqv+T+YlrrPS9/9UKUeZmNwOp3ZSRbyjaDFvXkXOEwPAbXrNhI2R7PNUcrtjQ/T371
         uVajfuuXPhH//mmUgCzYzNiI4aj1shWTeMw3o4tapiYXk6ou7U/9bWIfJ8Q8AdY5gFtB
         hUIw2WQaZbgT1kLTG92Iov6RFLGQ0Xo/jAa+A9x0tAh2MYIi+NVCoGMjHwY9JNPs4z30
         Rcyd8tNPXXTmt2v5ORXjl3oavLrjrMSylQuogAZIuDJCT0tugo+qljCechz92Z6ZIV9U
         t8s7Pk8rIf8f+nnvAsv3ltLUVpKNs1krmmkUkwV14feTypj6qkCoEQ/f5XHCiErCheqW
         Wvtw==
X-Gm-Message-State: AOAM531KfHD/JTpNUrFbgavv/o3bTHXL9Y1soIW5q5u6lFqPOH7tTY+A
        vJawySNgjP/kvSTFqD/AGvda5jZ5w4EfNryJWQ2f5qjaO3yF8d3X
X-Google-Smtp-Source: ABdhPJyqGToj2Xe/zk5cyGXYv9zhlVRVtUE6UpRnQ5CqPiWqOTejbAnMab+Yn/Q0JlWIQ0h+A/6Vax2Aaewb+hOPUNc=
X-Received: by 2002:aca:dec2:: with SMTP id v185mr5319295oig.6.1607604413176;
 Thu, 10 Dec 2020 04:46:53 -0800 (PST)
MIME-Version: 1.0
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <20201111092941.GJ14896@b29397-desktop> <CAB=otbSAGhDYxim9_fsyH4pZCLqgq+bxNJfv5hXqgQRVngVaig@mail.gmail.com>
 <CAMS2kBF5Gvhnf7AzdeSFeVeWBLhtHM_hHfTvMLTN-3Jkh=BwHw@mail.gmail.com>
 <CAB=otbTK0j03HjiLS-tqqaBTuavaFEJs49hpKPj2Df8e1_WN+A@mail.gmail.com>
 <CAMS2kBEnUDi5jKiNu5ZKihyucCikfoGor4n7=e+xX=7WU_rrog@mail.gmail.com>
 <CAB=otbRrLjeTjhBGtMqpeWeYZB9v62SDjSWzRk8uGQE3Ld8T2A@mail.gmail.com> <CAMS2kBGRrozHQj9wfLmcQMSCb8On+5HcSF=8PsUJAtqXz2QG1w@mail.gmail.com>
In-Reply-To: <CAMS2kBGRrozHQj9wfLmcQMSCb8On+5HcSF=8PsUJAtqXz2QG1w@mail.gmail.com>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Thu, 10 Dec 2020 14:46:33 +0200
Message-ID: <CAB=otbRKcZObQ-e_L5eh1z+9Z8o9u40GrEQjkJkL9hGH9bBNpw@mail.gmail.com>
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
To:     Glenn Schmottlach <gschmottlach@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 1, 2020 at 11:44 PM Glenn Schmottlach
<gschmottlach@gmail.com> wrote:
>
> On Sat, Nov 28, 2020 at 6:26 PM Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
> >
> > On Wed, Nov 25, 2020 at 9:29 PM Glenn Schmottlach
> > <gschmottlach@gmail.com> wrote:
> > >
> > > On Sun, Nov 22, 2020 at 2:52 PM Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
> > > >
> > > > On Fri, Nov 13, 2020 at 5:35 PM Glenn Schmottlach
> > > > <gschmottlach@gmail.com> wrote:
> > > > >
> > > > > On Thu, Nov 12, 2020 at 6:20 PM Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Nov 11, 2020 at 11:30 AM Peter Chen <peter.chen@nxp.com> wrote:
> > > > > > >
> > > > > > > On 20-11-08 02:18:28, Ruslan Bilovol wrote:
> > > > > > > > Current UAC2 gadget implements capture/sync paths
> > > > > > > > as two USB ISO ASYNC endpoints (IN and OUT).
> > > > > > > >
> > > > > > > > This violates USB spec which says that ISO ASYNC OUT endpoint
> > > > > > > > should have feedback companion endpoint.
> > > > > > > > See USB2.0 spec  "5.12.4.1 Synchronization Type": asynchronous
> > > > > > > > sink provides explicit feedback (isochronous pipe).
> > > > > > > > Interesting that for ISO ASYNC *IN* endpoint respective
> > > > > > > > feedback isn't required since source provides implicit
> > > > > > > > feedforward (data stream).
> > > > > > > >
> > > > > > > > While it's not an issue if UAC2 Gadget is connected to
> > > > > > > > Linux host (Linux ignores missing feedback endpoint),
> > > > > > > > with other hosts like Windows or MacOS the UAC2 Gadget
> > > > > > > > isn't enumerated due to missing feedback endpoint.
> > > > > > > >
> > > > > > > > This patch series adds feedback endpoint support to
> > > > > > > > UAC2 function, new control to UAC2 mixer which can
> > > > > > > > be used by userspace tools (like alsaloop from alsa-utils)
> > > > > > > > for updating feedback frequency reported to the host.
> > > > > > > > This is useful for usecases when UAC2 Gadget's audio
> > > > > > > > samples are played to another codec or audio card
> > > > > > > > with its own internal freerunning clock so host can
> > > > > > > > be notified that more/less samples are required.
> > > > > > > >
> > > > > > > > The alsaloop tool requires some (relatively small)
> > > > > > > > modifications in order to start support driving
> > > > > > > > feedback frequency through UAC2 mixer control.
> > > > > > > > That change will be sent as a separate patch
> > > > > > > > to ALSA community.
> > > > > > > >
> > > > > > > > Also added ability to switch ISO ASYNC OUT endpoint into
> > > > > > > > adaptive endpoint which doesn't require feedback endpoint
> > > > > > > > (as per USB spec).
> > > > > > > >
> > > > > > > > Ruslan Bilovol (3):
> > > > > > > >   usb: gadget: f_uac2/u_audio: add feedback endpoint support
> > > > > > > >   usb: gadget: f_uac2: add adaptive sync support for capture
> > > > > > > >   usb: gadget: u_audio: add real feedback implementation
> > > > > > >
> > > > > > > Hi Ruslan,
> > > > > > >
> > > > > > > I applied your patches, but WIN10 still can't recognize it well.
> > > > > > > The UAC1 is OK for WIN10 with the below same configuration.
> > > > > > > Any debug information you would like to know to check it?
> > > > > > >
> > > > > > >
> > > > > > > if [ "$FUNC" == "uac2" ]; then
> > > > > > > mkdir functions/$FUNC".0"
> > > > > > > echo 2 > functions/$FUNC".0"/p_ssize
> > > > > > > echo 48000 > functions/$FUNC".0"/p_srate
> > > > > > > echo 3 > functions/$FUNC".0"/p_chmask
> > > > > > >
> > > > > > > echo 2 > functions/$FUNC".0"/c_ssize
> > > > > > > echo 48000 > functions/$FUNC".0"/c_srate
> > > > > > > echo 3 > functions/$FUNC".0"/c_chmask
> > > > > > > #echo 4 > functions/$FUNC".0"/req_number
> > > > > > > ln -s functions/$FUNC".0" configs/c.1
> > > > > > > echo high-speed > /sys/kernel/config/usb_gadget/g1/max_speed
> > > > > > > fi
> > > > > > >
> > > > > >
> > > > > > Hmm... I just tested below config and it works fine with my Win10.
> > > > > > The only thing I noticed is Windows doesn't enable UAC2 gadget
> > > > > > by default, but this can be done from Win10 sound settings
> > > > > >
> > > > > > --------------------------------->8--------------------------------------
> > > > > > mkdir cfg
> > > > > > mount none cfg -t configfs
> > > > > > mkdir cfg/usb_gadget/g1
> > > > > > cd cfg/usb_gadget/g1
> > > > > > mkdir configs/c.1
> > > > > > mkdir functions/uac2.0
> > > > > >
> > > > > > # 44.1 kHz sample rate
> > > > > > echo 44100 > functions/uac2.0/c_srate
> > > > > > echo 44100 > functions/uac2.0/p_srate
> > > > > >
> > > > > > mkdir strings/0x409
> > > > > > mkdir configs/c.1/strings/0x409
> > > > > > echo 0x0101 > idProduct
> > > > > > echo 0x1d6b > idVendor
> > > > > > echo my-serial-num > strings/0x409/serialnumber
> > > > > > echo my-manufacturer > strings/0x409/manufacturer
> > > > > > echo "Test gadget" > strings/0x409/product
> > > > > > echo "Conf 1" > configs/c.1/strings/0x409/configuration
> > > > > > echo 120 > configs/c.1/MaxPower
> > > > > > ln -s functions/uac2.0 configs/c.1
> > > > > > echo musb-hdrc.0 > UDC
> > > > > > --------------------------------->8--------------------------------------
> > > > > >
> > > > > > Thanks,
> > > > > > Ruslan
> > > > >
> > > > > Hi Ruslan -
> > > > >
> > > > > With your configuration (above) Win10 was able to recognize and load
> > > > > the driver. What appears to prevent my configuration from loading is
> > > > > the fact that I selected 48K as my sample rate and my capture/playback
> > > > > channel mask includes more than two (2) channels. If I take your
> > > > > configuration and change the sample rate (c_srate/p_srate) to 48000
> > > > > Windows will fail to load the driver. Likewise, setting the
> > > > > c_chmask/p_chmask to 7 (three channels) will also cause the driver to
> > > > > fail to load.
> > > > >
> > > > > You mentioned there is an option in Win10 Sound Settings to "enable"
> > > > > UAC2 by default. I cannot find that option and I wonder if this is
> > > > > what is preventing me from changing the sample rate or channel mask?
> > > > > Could Windows be treating my audio gadget as a UAC1 device rather than
> > > > > a fully multi-channel audio device (even though the usbaudio2.sys
> > > > > driver is loaded)? Have you tried other configurations to verify your
> > > > > Win10 box supports more than two channels and a 44.1K sample rate? I
> > > > > look forward to your feedback and any suggestions you might offer.
> > > > >
> > > >
> > > > I was able to reproduce the issue and prepared a patch below, please
> > > > try it and see if it fixes the issue.
> > > >
> > > > Maximum data rates that I used were (AFAIR) 8 channel 192kHz/32bit,
> > > > but there is another issue with high data rate if someone uses so many
> > > > channels, very high sampling frequency or sample size that data can't
> > > > fit into allowed (by USB spec) max packet size of endpoint. In this case
> > > > need to decrease bInterval of endpoint.
> > > > I test it in a high-performance audio case so always use a minimal possible
> > > > bInterval (set to '1').
> > > > Of course in the future that need to be calculated dynamically depending on
> > > > the UAC2 settings
> > > >
> > > > Please test patches below and see it it helps
> > > >
> > > > ---------------------------------------------8<----------------------------------------
> > > > From 51516435bbf2486574ec7bc9fd4726677cd474a4 Mon Sep 17 00:00:00 2001
> > > > From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > > > Date: Sun, 22 Nov 2020 21:05:38 +0200
> > > > Subject: [PATCH] usb: gadget: f_uac2: always increase endpoint max_packet_size
> > > >  by one audio slot
> > > >
> > > > As per UAC2 Audio Data Formats spec (2.3.1.1 USB Packets),
> > > > if the sampling rate is a constant, the allowable variation
> > > > of number of audio slots per virtual frame is +/- 1 audio slot.
> > > >
> > > > It means that endpoint should be able to accept/send +1 audio
> > > > slot.
> > > >
> > > > Previous endpoint max_packet_size calculation code
> > > > was adding sometimes +1 audio slot due to DIV_ROUND_UP
> > > > behaviour which was rounding up to closest integer.
> > > > However this doesn't work if the numbers are divisible.
> > > >
> > > > It had no any impact with Linux hosts which ignore
> > > > this issue, but in case of more strict Windows it
> > > > caused rejected enumeration
> > > >
> > > > Thus always add +1 audio slot to endpoint's max packet size
> > > >
> > > > Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > > > ---
> > > >  drivers/usb/gadget/function/f_uac2.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/usb/gadget/function/f_uac2.c
> > > > b/drivers/usb/gadget/function/f_uac2.c
> > > > index ebdb2a1..1698587 100644
> > > > --- a/drivers/usb/gadget/function/f_uac2.c
> > > > +++ b/drivers/usb/gadget/function/f_uac2.c
> > > > @@ -486,7 +486,7 @@ static void set_ep_max_packet_size(const struct
> > > > f_uac2_opts *uac2_opts,
> > > >   }
> > > >
> > > >   max_packet_size = num_channels(chmask) * ssize *
> > > > - DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
> > > > + ((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
> > > >
> > > >   if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
> > > >   max_packet_size = max_packet_size * FBACK_FREQ_MAX / 100;
> > > > --
> > > > 1.9.1
> > > >
> > > >
> > > > ---------------------------------------------8<----------------------------------------
> > > > From c8f2f2b414af672ec40841e75fb1ea761ae29122 Mon Sep 17 00:00:00 2001
> > > > From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > > > Date: Sun, 16 Feb 2020 22:40:23 +0200
> > > > Subject: [PATCH] usb: gadget: f_uac2: change bInterval to 1 for
> > > >  8ch/24bit/44.1kHz
> > > >
> > > > With bInterval=4 one audio slot in case of 8ch/24bit/44.1kHz
> > > > exeeds MaxPacket size of ISO endpoint (>1024) and can't be
> > > > transferred in time.
> > > > USB spec ("5.6.3 Isochronous Transfer Packet Size Constraints")
> > > > says if we need to transfer more than 1024 it is a high speed, high
> > > > bandwidth endpoint and should have bInterval=1.
> > > >
> > > > In the future, bInterval should be dynamically calculated
> > > > depending on bandwith requirementes
> > > >
> > > > Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > > > ---
> > > >  drivers/usb/gadget/function/f_uac2.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/gadget/function/f_uac2.c
> > > > b/drivers/usb/gadget/function/f_uac2.c
> > > > index 3633df6..fb9b875 100644
> > > > --- a/drivers/usb/gadget/function/f_uac2.c
> > > > +++ b/drivers/usb/gadget/function/f_uac2.c
> > > > @@ -281,7 +281,7 @@ enum {
> > > >
> > > >   .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> > > >   .wMaxPacketSize = cpu_to_le16(1024),
> > > > - .bInterval = 4,
> > > > + .bInterval = 1,
> > > >  };
> > > >
> > > >  /* CS AS ISO OUT Endpoint */
> > > > @@ -358,7 +358,7 @@ enum {
> > > >
> > > >   .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> > > >   .wMaxPacketSize = cpu_to_le16(1024),
> > > > - .bInterval = 4,
> > > > + .bInterval = 1,
> > > >  };
> > > >
> > > >  /* CS AS ISO IN Endpoint */
> > > > --
> > > > 1.9.1
> > > >
> > > >
> > > > ---------------------------------------------8<----------------------------------------
> > > >
> > > > Thanks,
> > > > Ruslan
> > >
> > > Hi Ruslan -
> > >
> > > I have had some mixed success with your additional patches. First, the
> >
> > That's good news, thanks for testing!
> >
> > > UAC2 gadget does correctly register with Windows 10 but only for 1-31
> > > channels. For a fully specified channel map (32 channels):
> > >
> > > c_chmask = 0xFFFFFFFF    ( Does not load)
> > > p_chmask = 0xFFFFFFFF   ( Does not load)
> > >
> > > the driver fails to load (code=10). This seems similar to the prior
> > > problem. Could there be another off-by-one problem here?
> > >
> > > With a 31 channel mask the Windows 10 usbaudio2.sys loads successfully, e.g.
> > >
> > > c_chmask = 0x7FFFFFFF (loads)
> > > p_chmask = 0x7FFFFFFF (loads)
> >
> > That's correct behavior. UAC2 spec says that bits D27..D30 are reserved.
> > Also bit D31 is mutually exclusive with other bits and means 'raw data'.
> > It means that with current UAC2 gadget implementation you can enable
> > only 27 channels.
> >
> > It seems like it's possible to add more channels by adding more audio
> > clusters but that requires UAC2 driver modifications. Also it's not clear
> > whether it's implemented in Host OS drivers
> >
> > I personally tested as many as 8x8 playback/capture channels simultaneously.
> >
> > >
> > > Once Windows 10 loads the driver successfully, however, I can't seem
> > > to select the device through Audacity on Windows. The device appears
> > > in the Windows "Device Manager" under "Sound, video and game
> > > controllers -> Source/Sink". How are you testing audio
> > > playback/capture under Windows? Perhaps my test approach is wrong?
> >
> > You need to go to sound settings -> manage sound devices and enable
> > UAC2 gadget there, after that it will appear in the system.
> >
> > I also used Audacity for testing this and it works fine for me
> >
> > Thanks,
> > Ruslan
> >
> > >
> > > I used the same approach on my Linux host where the USB UAC2 device
> > > appears as an ALSA device and I use speaker-test on the target
> > > (BeagleBone Black) to play and then capture the audio using Audacity
> > > on the Linux host. I was hoping to do the same or something similar
> > > under Windows.
> > >
> > > Below is the script I've been using on the target to configure my UAC2 device:
> > >
> > > mkdir -p "/sys/kernel/config/usb_gadget/g_multi"
> > > echo "${idVendor:-0x11F5}" > "/sys/kernel/config/usb_gadget/g_multi/idVendor"
> > > echo "${idProduct:-0x0009}" > "/sys/kernel/config/usb_gadget/g_multi/idProduct"
> > > echo "${bcdDevice:-0x0001}" > "/sys/kernel/config/usb_gadget/g_multi/bcdDevice"
> > > echo "${bDeviceClass:-0x00}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/bDeviceClass"
> > > echo "${bDeviceSubClass:-0x00}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/bDeviceSubClass"
> > > echo "${bDeviceProtocol:-0x00}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/bDeviceProtocol"
> > > echo "${bcdUSB:-0x0200}" > "/sys/kernel/config/usb_gadget/g_multi/bcdUSB"
> > > echo "${bMaxPacketSize0:-0x00}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/bMaxPacketSize0"
> > > mkdir -p "/sys/kernel/config/usb_gadget/g_multi/strings/0x409"
> > > echo "${serialnumber:-000000000000}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/strings/0x409/serialnumber"
> > > echo "${product:-UAC2}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/strings/0x409/product"
> > > echo "${manufacturer:-www.acme.com}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/strings/0x409/manufacturer"
> > > mkdir -p "/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0"
> > > echo "${req_number:-4}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/req_number"
> > > echo "${c_ssize:-4}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/c_ssize"
> > > echo "${c_srate:-48000}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/c_srate"
> > > echo "${c_chmask:-0x00000003}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/c_chmask"
> > > echo "${c_sync:-asynchronous}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/c_sync"
> > > echo "${p_ssize:-4}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/p_ssize"
> > > echo "${p_srate:-48000}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/p_srate"
> > > echo "${p_chmask:-0x00000003}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/p_chmask"
> > > mkdir -p "/sys/kernel/config/usb_gadget/g_multi/configs/c.1"
> > > echo "${bmAttributes:-0x80}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/configs/c.1/bmAttributes"
> > > echo "${MaxPower:-500}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/configs/c.1/MaxPower"
> > > mkdir -p "/sys/kernel/config/usb_gadget/g_multi/configs/c.1/strings/0x409"
> > > echo "${configuration:-BeagleBone Composite}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/configs/c.1/strings/0x409/configuration"
> > > ln -s "/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0"
> > > "/sys/kernel/config/usb_gadget/g_multi/configs/c.1/uac2.usb0"
> > > mkdir -p "/sys/kernel/config/usb_gadget/g_multi/os_desc"
> > > ln -s "//sys/kernel/config/usb_gadget/g_multi/configs/c.1"
> > > "/sys/kernel/config/usb_gadget/g_multi/os_desc/c.1"
> > > echo "${qw_sign:-MSFT100}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/os_desc/qw_sign"
> > > echo "${b_vendor_code:-0x00}" >
> > > "/sys/kernel/config/usb_gadget/g_multi/os_desc/b_vendor_code"
> > > echo "${use:-1}" > "/sys/kernel/config/usb_gadget/g_multi/os_desc/use"
> > >
> > > basename /sys/class/udc/* > /sys/kernel/config/usb_gadget/g_multi/UDC
> > >
> > > This is only a two channel playback/capture configuration. I hoped to
> > > get this working under Windows before increasing my channel count to a
> > > full 32 channel mask with a 48K sample rate.
> > >
> > > I look forward to hearing your suggestions and possibly pointing out
> > > where I've gone astray.
> > >
> > > Thanks,
> > >
> > > Glenn
>
> Hi Ruslan -
>
> Thanks for the feedback but unfortunately I've experienced mixed
> results with the gadget UAC2 driver on both Windows/Linux. Let me
> describe my environment. My host platform is either a Linux Ubuntu
> 18.04 or Windows 10 laptop while the target environment is a
> BeagleBone Black (Linux beaglebone 5.4.74-g9574bba32a #1 PREEMPT). I'm
> testing two different scenarios:
>
> Scenario #1:
> BeagleBone Black (BBB) runs speaker-test generating a single channel
> (S32_LE) audio stream containing a 1KHz tone with a 48K sample rate,
> e.g.
>
> > speaker-test -D hw:1,0 -r 48000 -c 1 -f 1000 -F S32_LE -t sine
>
> The host laptop is running Audacity and recording the tone over the
> UAC2 adapter. On the Linux host the capture is correct and the tone is
> bit-perfect. On the Windows 10 the capture contains numerous missing
> samples which translates into a lot of audible pops and clicks.
>
> Scenario #2:
> The Linux/Windows host plays a single channel, 48K, S32_LE 1K sine
> tone to the target using either Audacity (on Windows) or 'aplay' (on
> Linux), e.g.
>
> > aplay -D hw:4,0 -c 1  -r 48000 -t wav  tone_1k.wav  (Linux)
>
> On the BBB target I use 'arecord' to record the tone to a RAM disk and
> then copy the recorded file back to the host where I can verify the
> quality of the recording. In both instances (e.g. using either Windows
> or Linux for playback) the recording on the target results in a
> captured file with missing samples and audible pops/clicks. In this
> scenario the UAC2 gadget is configured with c_sync == asynchronous. I
> wouldn't expect things to improve with c_sync == adaptive since you
> mentioned in your patch that it always reports back the nominal
> frequency to the host from the feedback endpoint.
>
> Do you have any suggestions that might explain (the above) behavior.
> Can you describe your test environment in more detail so that I can
> perhaps re-create it? What Linux target are you using with your tests?
> You mentioned you tested an 8x8 playback/capture scenario. Can you
> provide any details of how you performed this test and the method you
> used to confirm the audio quality for the capture/playback?

I also use BeagleBone black in my development.
I have two testing scenarios:
 1) BeagleBone PC loopback (e.g. redirect play->capture in BBB), here
     I play sine wave on PC to BBB and record back (simultaneously in
     Audacity), it looks like:
     Audiacity (PC playback) -> BBB capture -> alsaloop -> BBB playback ->
     Audacity (PC capture)
 2) I connect another USB audio card to BBB, and redirect audio samples
     from PC through BBB UAC2 audio gadget to USB audio card, this path
     looks like:
     PC playback) -> BBB capture -> alsaloop -> BBB USB audio card

With #1 I tested simultaneous 8x8ch 24bit 44.1 kHz loopback (also 4x4ch
and 2x2 ch)
With #2 it's limited to USB audio card I have (usually I do 2ch 16bit 44.1 or
48 kHz)

I see you use 32bit samples, I tested it a few times before on the previous
patch set versions.

Can you try to check 2ch 16bit 44.1 or 48 kHz? I'm thinking if this issue is
limited to some combination of sampling rate, channels and sample resolution

Thanks,
Ruslan

>
> Thanks for any insights you might be able to offer . . .
>
> Glenn
