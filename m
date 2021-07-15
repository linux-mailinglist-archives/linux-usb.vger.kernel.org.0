Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6897C3CA01E
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jul 2021 15:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238173AbhGON4U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jul 2021 09:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbhGON4U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jul 2021 09:56:20 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63AEC06175F
        for <linux-usb@vger.kernel.org>; Thu, 15 Jul 2021 06:53:26 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id u1so7956970wrs.1
        for <linux-usb@vger.kernel.org>; Thu, 15 Jul 2021 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=ikGwIXAbpdB4QemP/ztxzWD6MTw+vRK78wd7hFUYmrI=;
        b=10YpV+whSp95DpQbgcFN2HpMc85Tl4fqvR7o/srx+6g8XzR6xr/wL9JJ6TsErliviw
         C364E+xwQPRyg6+M82sJE1WPM6aA8i1FXc9V2IfgiIcItmaXGyRUtIvYSZ9MWL/m+y10
         JOdbZwImKNLJCJwMsmewbm3d16c/kM9DmUrJ8IelzVnjLI25xtKfqnsuCeH2znYIljzG
         KiimZ2X/pOwh16iYOTCIGLEce7nXwJDiAaqYnmdJgYrE0kt49O8yuQnd7GX3BCW8qfn7
         7PmUdHCfgpW6lS3AUN7uTrHs/haBXKdDsZZUn9XAXjxvCrT9qVdUUDT4QIKO7XzjcG4P
         Gd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=ikGwIXAbpdB4QemP/ztxzWD6MTw+vRK78wd7hFUYmrI=;
        b=aj8N9fmZQhFHYNs1+Fy5VQBA57Q/SdvIZaDAN2MzMtn5TeZ8UZ0w5p7YkxNQ7u7KMG
         LXzPtdTmmJCsGNXMJ0anCjaTGJrJB8yEdjCTqv+Oi3XnSpvqVWdrVOZC/4AE1oOM5tmz
         eiZG2Ruv+kipFZWuPFWU40UagcPsnZqjYX0r71KT/OK9WjpwdGEof4iYX3fMvLpG/mFg
         9J8uQc9+jD7PJxC13P66u/23Pk2JZ6hRxrHhPzZVh1fYJtzaLEhI8lAYqKpLkFNwyii1
         bHRMJK3srohoMm21BgIAIDmFEn5vRGzZmjYwFaQ1NoeMVblvBWLAWeIQan55EEO7hIbT
         sjoQ==
X-Gm-Message-State: AOAM530ZAp2iEvtXwDmufcPvvYsWllKhWLYzx+IAMyL0K4yodPdWvxbJ
        XyYhHaQwQBtugFknXZPSPHKRWA==
X-Google-Smtp-Source: ABdhPJzO5mqYj3wUbpMLouK7Pkr5l3G3w5Zfss7opaycEpNaLA32q0mS+BEyg9umiKsb7pVLRbJocQ==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr5794995wrq.99.1626357205223;
        Thu, 15 Jul 2021 06:53:25 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id p9sm6334304wrx.59.2021.07.15.06.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 06:53:24 -0700 (PDT)
References: <f861e345-3642-5bfa-0ce7-a5cd34204613@ivitera.com>
 <1j8s2aa071.fsf@starbuckisacylon.baylibre.com>
 <25120679-fe61-fb6a-d671-393e15428da0@ivitera.com>
 <1jeebzq5k6.fsf@starbuckisacylon.baylibre.com>
 <94718a5e-ea36-4a86-da4d-a30179c1c2c7@ivitera.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: usb:gadget:u_audio: Regression in [v3,3/3] usb: gadget:
 u_audio: add real feedback implementation - wMaxPacketSize calculation
In-reply-to: <94718a5e-ea36-4a86-da4d-a30179c1c2c7@ivitera.com>
Message-ID: <1jbl73ptt9.fsf@starbuckisacylon.baylibre.com>
Date:   Thu, 15 Jul 2021 15:53:22 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Thu 15 Jul 2021 at 14:36, Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Dne 15. 07. 21 v 11:39 Jerome Brunet napsal(a):
>> On Tue 13 Jul 2021 at 15:16, Pavel Hofman <pavel.hofman@ivitera.com>
>> wrote:
>> 

>> So 48kHz / 2ch / 16bits. Let's assume USB_SPEED_FULL for example (result
>> is the same for the other speeds).
>> In such condition, the nominal packet size is 192B but to accomodate an
>> extra sample, the maximum should indeed be 196B.
>> 	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>> 		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
>> with fb_max being 5 by default, srate should be 48240 after this.
>> 
>> 	max_size_bw = num_channels(chmask) * ssize *
>> 		DIV_ROUND_UP(srate, factor / (1 << (bInterval - 1)));
>> With USB_SPEED_FULL, bInterval is 1 and factor is 1000 so:
>> => DIV_ROUND_UP(48240, 1000 / 1) should give 49;
>> Then
>> => max_size_bw = 2 * 2 * 49 = 196
>> So the end result should be 196 with current code. I tried on an ARM64
>> platform. Here is what I get:
>> [   26.241946] set_ep_max_packet_size: speed is USB_SPEED_FULL
>> [   26.243208] set_ep_max_packet_size: intermediate Playback srate 48000
>> [   26.249758] set_ep_max_packet_size: max_size_bw 192
>> [   26.254559] set_ep_max_packet_size: speed is USB_SPEED_FULL
>> [   26.260130] set_ep_max_packet_size: intermediate Capture srate 48240
>> [   26.266401] set_ep_max_packet_size: max_size_bw 196
>> [   26.271209] set_ep_max_packet_size: speed is USB_SPEED_HIGH
>> [   26.276873] set_ep_max_packet_size: intermediate Playback srate 48000
>> [   26.283165] set_ep_max_packet_size: max_size_bw 192
>> [   26.288015] set_ep_max_packet_size: speed is USB_SPEED_HIGH
>> [   26.293691] set_ep_max_packet_size: intermediate Capture srate 48240
>> [   26.299965] set_ep_max_packet_size: max_size_bw 196
>> [   26.304753] set_ep_max_packet_size: speed is USB_SPEED_SUPER
>> [   26.310426] set_ep_max_packet_size: intermediate Playback srate 48000
>> [   26.316805] set_ep_max_packet_size: max_size_bw 192
>> [   26.321625] set_ep_max_packet_size: speed is USB_SPEED_SUPER
>> [   26.327309] set_ep_max_packet_size: intermediate Capture srate 48240
>> [   26.333613] set_ep_max_packet_size: max_size_bw 196
>> All seems OK and as expected with what's in mainline ATM.
>> So I'm not quite sure why you would get a different result. It would be
>> great if you could check further.
>> 
>
> The problem is max_size_bw=192 for the Playback (i.e. is_playback =
> true). If only capture direction is activated (p_chmask=0), only EP-OUT 
> with max_size_bw=196 is generated and Win10 enumerates the playback-only
> audio device.

Ok, that was not clear before.

> Once the other direction with max_size_bw=192 is activated 
> (either duplex or capture-only), Win10 refuses to enumerate.

Looking further at the format specification [0] (and crawling the web to
decipher it), it seems that

* For isochronous links: packet size must match the nominal rate.
* For async and adaptative: it must match the nominal rate +/- 1
  packet. That is whether we intend on varying the packet size or not.
  
This has several implication
* In async mode, the device is running of its own clock. It has no
  reason to vary the playback packet size but it should still reserve
  bandwidth for an extra packet to satisfy the spec. This seems to be
  your problem and what Win10 insist on.

  When I tested, I had linux on both sides and apparently it is not too
  picky about that.

* If we apply the spec strictly, like Win10 seems to insist on,
  calculating the maximum packet size based on explicit feedback limits
  is wrong too. Whatever happens, it should be +/- 1 around nominal.

Funny thing, is your change puts a +2 capture compared to nominal but
Win10 is not picky on that ...

I'll send a fix to clean this up. Thanks reporting the problem.

[0]: https://www.usb.org/sites/default/files/frmts10.pdf

