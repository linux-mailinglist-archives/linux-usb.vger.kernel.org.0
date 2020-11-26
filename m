Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1188E2C551D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 14:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389873AbgKZNQ3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 08:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389784AbgKZNQ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Nov 2020 08:16:28 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378D0C0613D4
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2020 05:16:26 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id i2so2107649wrs.4
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2020 05:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=fiaQhJbDNG4WO4ZaRM9Ux0ZN0/RlvVRiX7f0zpYUKT0=;
        b=X6/hq8vpqttqYS9/flRQFkXq49MA7Zv2JkavrRsoIAluGlFMozVtEfR6ZDLxRaZIYE
         Ayy5cspDCjEzOdSCU82JHnjSDew7ChNvZd6znXUcCsWg19xf4az+ZprxkB7xUO0WEXGJ
         D9gVYlw/mJPGLFHjUatiHvOV3Kcv6cAqUCNsVWtvUcGXP0VkZpKrwTYaZWuv2srKfids
         gGurqRdbDdYfoAZZJ944gyGk/YI4CV8gJJSc1oftfDXUeyp12HIuCXDB+GVsQc47P7Ws
         5EA0onPehmSldkLoPvafg+YVDl16Smc8Vf9ni/z016gPjWtN2xmeoQbHtqbx3XlHIBhV
         +BhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=fiaQhJbDNG4WO4ZaRM9Ux0ZN0/RlvVRiX7f0zpYUKT0=;
        b=bL7bQ7IXc5yVq678Y4m6X/8FCuNX3rWSUYEywZBJdcK6ebZUzDn5lG1hxv080i3/fg
         kpAMjSnruqsBcSidSGLKzPouXwrpT6mzVOgWFBMZW7U5Py8rORQAl1/8CqLFEqFp8l5T
         n/DFaDhfN9s2r62k8k3lImda2ZkupUOY8OtYa6sQZyqkbKvogELEw3SFyVXliKdE0gAO
         KwNdFdkhrSge4jGsOs2/hfpGt5hRkGSYip1K9OcZ3ARw6Y8UoMhCHRvLnwPJ4qQer12R
         VEvKyjurEzUiaI716YDb2Hlm5HoxkZV5/A7AjUNp2rC/D/0tWltolhfFr1taVI8FST0A
         7XJw==
X-Gm-Message-State: AOAM530tv/OsBn5XJD+Fgebft+sWsKuy1YeBfWi1OwscgJ/Y0d3kvh4m
        iieLZBE4Smpdo0fi42UBBY47Qw==
X-Google-Smtp-Source: ABdhPJwbCpBDLNUAkaf47M8e4Pgffh+Zwo+Mcu/hkblB7VX9pyLGmk+7WFJAufmPpKUL0zw299ZYzw==
X-Received: by 2002:adf:ee12:: with SMTP id y18mr3760795wrn.231.1606396584806;
        Thu, 26 Nov 2020 05:16:24 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id q12sm8417981wmc.45.2020.11.26.05.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 05:16:23 -0800 (PST)
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <20201111092941.GJ14896@b29397-desktop>
 <CAB=otbSAGhDYxim9_fsyH4pZCLqgq+bxNJfv5hXqgQRVngVaig@mail.gmail.com>
 <CAMS2kBF5Gvhnf7AzdeSFeVeWBLhtHM_hHfTvMLTN-3Jkh=BwHw@mail.gmail.com>
 <CAB=otbTK0j03HjiLS-tqqaBTuavaFEJs49hpKPj2Df8e1_WN+A@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Glenn Schmottlach <gschmottlach@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
In-reply-to: <CAB=otbTK0j03HjiLS-tqqaBTuavaFEJs49hpKPj2Df8e1_WN+A@mail.gmail.com>
Message-ID: <1jblfk8di1.fsf@starbuckisacylon.baylibre.com>
Date:   Thu, 26 Nov 2020 14:16:22 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Sun 22 Nov 2020 at 20:51, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:

> On Fri, Nov 13, 2020 at 5:35 PM Glenn Schmottlach
> <gschmottlach@gmail.com> wrote:
>>
>> On Thu, Nov 12, 2020 at 6:20 PM Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
>> >
>> > On Wed, Nov 11, 2020 at 11:30 AM Peter Chen <peter.chen@nxp.com> wrote:
>> > >
>> > > On 20-11-08 02:18:28, Ruslan Bilovol wrote:
>> > > > Current UAC2 gadget implements capture/sync paths
>> > > > as two USB ISO ASYNC endpoints (IN and OUT).
>> > > >
>> > > > This violates USB spec which says that ISO ASYNC OUT endpoint
>> > > > should have feedback companion endpoint.
>> > > > See USB2.0 spec  "5.12.4.1 Synchronization Type": asynchronous
>> > > > sink provides explicit feedback (isochronous pipe).
>> > > > Interesting that for ISO ASYNC *IN* endpoint respective
>> > > > feedback isn't required since source provides implicit
>> > > > feedforward (data stream).
>> > > >
>> > > > While it's not an issue if UAC2 Gadget is connected to
>> > > > Linux host (Linux ignores missing feedback endpoint),
>> > > > with other hosts like Windows or MacOS the UAC2 Gadget
>> > > > isn't enumerated due to missing feedback endpoint.
>> > > >
>> > > > This patch series adds feedback endpoint support to
>> > > > UAC2 function, new control to UAC2 mixer which can
>> > > > be used by userspace tools (like alsaloop from alsa-utils)
>> > > > for updating feedback frequency reported to the host.
>> > > > This is useful for usecases when UAC2 Gadget's audio
>> > > > samples are played to another codec or audio card
>> > > > with its own internal freerunning clock so host can
>> > > > be notified that more/less samples are required.
>> > > >
>> > > > The alsaloop tool requires some (relatively small)
>> > > > modifications in order to start support driving
>> > > > feedback frequency through UAC2 mixer control.
>> > > > That change will be sent as a separate patch
>> > > > to ALSA community.
>> > > >
>> > > > Also added ability to switch ISO ASYNC OUT endpoint into
>> > > > adaptive endpoint which doesn't require feedback endpoint
>> > > > (as per USB spec).
>> > > >
>> > > > Ruslan Bilovol (3):
>> > > >   usb: gadget: f_uac2/u_audio: add feedback endpoint support
>> > > >   usb: gadget: f_uac2: add adaptive sync support for capture
>> > > >   usb: gadget: u_audio: add real feedback implementation
>> > >
>> > > Hi Ruslan,
>> > >
>> > > I applied your patches, but WIN10 still can't recognize it well.
>> > > The UAC1 is OK for WIN10 with the below same configuration.
>> > > Any debug information you would like to know to check it?
>> > >
>> > >
>> > > if [ "$FUNC" == "uac2" ]; then
>> > > mkdir functions/$FUNC".0"
>> > > echo 2 > functions/$FUNC".0"/p_ssize
>> > > echo 48000 > functions/$FUNC".0"/p_srate
>> > > echo 3 > functions/$FUNC".0"/p_chmask
>> > >
>> > > echo 2 > functions/$FUNC".0"/c_ssize
>> > > echo 48000 > functions/$FUNC".0"/c_srate
>> > > echo 3 > functions/$FUNC".0"/c_chmask
>> > > #echo 4 > functions/$FUNC".0"/req_number
>> > > ln -s functions/$FUNC".0" configs/c.1
>> > > echo high-speed > /sys/kernel/config/usb_gadget/g1/max_speed
>> > > fi
>> > >
>> >
>> > Hmm... I just tested below config and it works fine with my Win10.
>> > The only thing I noticed is Windows doesn't enable UAC2 gadget
>> > by default, but this can be done from Win10 sound settings
>> >
>> > --------------------------------->8--------------------------------------
>> > mkdir cfg
>> > mount none cfg -t configfs
>> > mkdir cfg/usb_gadget/g1
>> > cd cfg/usb_gadget/g1
>> > mkdir configs/c.1
>> > mkdir functions/uac2.0
>> >
>> > # 44.1 kHz sample rate
>> > echo 44100 > functions/uac2.0/c_srate
>> > echo 44100 > functions/uac2.0/p_srate
>> >
>> > mkdir strings/0x409
>> > mkdir configs/c.1/strings/0x409
>> > echo 0x0101 > idProduct
>> > echo 0x1d6b > idVendor
>> > echo my-serial-num > strings/0x409/serialnumber
>> > echo my-manufacturer > strings/0x409/manufacturer
>> > echo "Test gadget" > strings/0x409/product
>> > echo "Conf 1" > configs/c.1/strings/0x409/configuration
>> > echo 120 > configs/c.1/MaxPower
>> > ln -s functions/uac2.0 configs/c.1
>> > echo musb-hdrc.0 > UDC
>> > --------------------------------->8--------------------------------------
>> >
>> > Thanks,
>> > Ruslan
>>
>> Hi Ruslan -
>>
>> With your configuration (above) Win10 was able to recognize and load
>> the driver. What appears to prevent my configuration from loading is
>> the fact that I selected 48K as my sample rate and my capture/playback
>> channel mask includes more than two (2) channels. If I take your
>> configuration and change the sample rate (c_srate/p_srate) to 48000
>> Windows will fail to load the driver. Likewise, setting the
>> c_chmask/p_chmask to 7 (three channels) will also cause the driver to
>> fail to load.
>>
>> You mentioned there is an option in Win10 Sound Settings to "enable"
>> UAC2 by default. I cannot find that option and I wonder if this is
>> what is preventing me from changing the sample rate or channel mask?
>> Could Windows be treating my audio gadget as a UAC1 device rather than
>> a fully multi-channel audio device (even though the usbaudio2.sys
>> driver is loaded)? Have you tried other configurations to verify your
>> Win10 box supports more than two channels and a 44.1K sample rate? I
>> look forward to your feedback and any suggestions you might offer.
>>
>
> I was able to reproduce the issue and prepared a patch below, please
> try it and see if it fixes the issue.
>
> Maximum data rates that I used were (AFAIR) 8 channel 192kHz/32bit,
> but there is another issue with high data rate if someone uses so many
> channels, very high sampling frequency or sample size that data can't
> fit into allowed (by USB spec) max packet size of endpoint. In this case
> need to decrease bInterval of endpoint.
> I test it in a high-performance audio case so always use a minimal possible
> bInterval (set to '1').
> Of course in the future that need to be calculated dynamically depending on
> the UAC2 settings
>
> Please test patches below and see it it helps
>
> ---------------------------------------------8<----------------------------------------
> From 51516435bbf2486574ec7bc9fd4726677cd474a4 Mon Sep 17 00:00:00 2001
> From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> Date: Sun, 22 Nov 2020 21:05:38 +0200
> Subject: [PATCH] usb: gadget: f_uac2: always increase endpoint max_packet_size
>  by one audio slot
>
> As per UAC2 Audio Data Formats spec (2.3.1.1 USB Packets),
> if the sampling rate is a constant, the allowable variation
> of number of audio slots per virtual frame is +/- 1 audio slot.
>
> It means that endpoint should be able to accept/send +1 audio
> slot.
>
> Previous endpoint max_packet_size calculation code
> was adding sometimes +1 audio slot due to DIV_ROUND_UP
> behaviour which was rounding up to closest integer.
> However this doesn't work if the numbers are divisible.
>
> It had no any impact with Linux hosts which ignore
> this issue, but in case of more strict Windows it
> caused rejected enumeration
>
> Thus always add +1 audio slot to endpoint's max packet size
>
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> ---
>  drivers/usb/gadget/function/f_uac2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/function/f_uac2.c
> b/drivers/usb/gadget/function/f_uac2.c
> index ebdb2a1..1698587 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -486,7 +486,7 @@ static void set_ep_max_packet_size(const struct
> f_uac2_opts *uac2_opts,
>   }
>
>   max_packet_size = num_channels(chmask) * ssize *
> - DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
> + ((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
>
>   if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>   max_packet_size = max_packet_size * FBACK_FREQ_MAX / 100;

I think "reserving" 20% additional bandwidth is a bit extreme.
In the end, the purpose is composate the drift which appears between
different XTALs

Allocating bandwidth for 1 more sample than the stream should require
(49 instead of 48 for 48kHz with 4 bIntervals) should allow to
compensate any realistic drift, don't you think ?

> -- 
> 1.9.1
>
>
> ---------------------------------------------8<----------------------------------------
> From c8f2f2b414af672ec40841e75fb1ea761ae29122 Mon Sep 17 00:00:00 2001
> From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> Date: Sun, 16 Feb 2020 22:40:23 +0200
> Subject: [PATCH] usb: gadget: f_uac2: change bInterval to 1 for
>  8ch/24bit/44.1kHz
>
> With bInterval=4 one audio slot in case of 8ch/24bit/44.1kHz
> exeeds MaxPacket size of ISO endpoint (>1024) and can't be
> transferred in time.
> USB spec ("5.6.3 Isochronous Transfer Packet Size Constraints")
> says if we need to transfer more than 1024 it is a high speed, high
> bandwidth endpoint and should have bInterval=1.
>
> In the future, bInterval should be dynamically calculated
> depending on bandwith requirementes

Probably better to do it from the start to avoid breaking stuff for
people who have been using the gadget with the current badnwidth so far

>
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> ---
>  drivers/usb/gadget/function/f_uac2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_uac2.c
> b/drivers/usb/gadget/function/f_uac2.c
> index 3633df6..fb9b875 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -281,7 +281,7 @@ enum {
>
>   .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
>   .wMaxPacketSize = cpu_to_le16(1024),
> - .bInterval = 4,
> + .bInterval = 1,
>  };
>
>  /* CS AS ISO OUT Endpoint */
> @@ -358,7 +358,7 @@ enum {
>
>   .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
>   .wMaxPacketSize = cpu_to_le16(1024),
> - .bInterval = 4,
> + .bInterval = 1,
>  };
>
>  /* CS AS ISO IN Endpoint */

