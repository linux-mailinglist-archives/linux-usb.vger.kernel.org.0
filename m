Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931212B1E5E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 16:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgKMPNe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 10:13:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgKMPNe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 10:13:34 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B51C0613D1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 07:13:33 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id k2so10319280wrx.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 07:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=g2eWYS/TuIBg2trIPFi3kCqzhwEAZYnEwoucxK7S/uM=;
        b=FBvYqur0Qp9aKH4Savqs1DxgrKDoYMnR8YWxDPAVxtuXYCqgWdpzIWhWu/JwsCt0EE
         beqnmgnC2p8nLAoRTgy3jaFQ7Ffu9zPIx+qyJTmgHy/TbMRRunssqjjYWp1L+hF1GbBP
         smn55I2OgBZ8S6VUw6LunUkpQ40IXDnz4dNz5QYSR64PN/OwxCXh3A0ArU1KN8yoU5gM
         ffxa5co8uGs3dcOR0LmIr0syzogK4JhoGAqiPwGO7IZPzVnKg7jYnk2wr3U4aA+W8rbC
         7wBCheQRpyaL7YYAxgsVz9kDS5oTndz9WoEXfW64zphyNmpiUhCw6UEnyKT0LkuWYs5l
         VipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=g2eWYS/TuIBg2trIPFi3kCqzhwEAZYnEwoucxK7S/uM=;
        b=egHQjabIn304lvwk798Z7buKPkqDTjlFTpFrUnnkgKxh9UlZ8XzoYNO18Gfqrgounj
         YV1b0Bum7oSP1+0WQAaC1/3YwrImj/ZBp9itGlUCZeVK2R1j6bpUcmn9Ij8lpr071n6w
         FookEAhh3WJ21mmDGGrdw+EgkhJjGmRXG4PkCScBzA3EWlQdzBVQOB9BzriPbe78Y2uL
         06t+pbM5sOwhZQLijA24PM5BgWJvhTPe44hMAx3jG8g9A3gzywxIJ03lHQ+LK9AT0kEG
         fBlxaV8HJ5fkqrTaCjcIEC6HTG8wSnRqWUPZGF9yE/2Kg26deMEgWciT5AL5uXcViDsp
         FwdA==
X-Gm-Message-State: AOAM531sU7KNszhPavWVS3/n5/W/1/x8wmMazLfQMBT2Hi3F/oX/vJWY
        +yr9KZLPF3f3Py30p2uRpxGGlA==
X-Google-Smtp-Source: ABdhPJwd+fiAbK8NZOBUneQcMTjdFObaHBrUXLOnyyZOiG6lbkh9XW68EclIsNXhMD8e3AYxJpBepw==
X-Received: by 2002:a5d:5048:: with SMTP id h8mr4074266wrt.135.1605280411764;
        Fri, 13 Nov 2020 07:13:31 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id i6sm10790839wma.42.2020.11.13.07.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 07:13:31 -0800 (PST)
References: <20201112230043.28987-1-aouledameur@baylibre.com>
 <0f679c62aa48603ea43a8fa4819d688baa802d73.camel@pengutronix.de>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-usb@vger.kernel.org, "Kevin Hilman" <khilman@baylibre.com>,
        Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH v2] reset: make shared pulsed reset controls re-triggerable
In-reply-to: <0f679c62aa48603ea43a8fa4819d688baa802d73.camel@pengutronix.de>
Message-ID: <1jima91e92.fsf@starbuckisacylon.baylibre.com>
Date:   Fri, 13 Nov 2020 16:13:29 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Fri 13 Nov 2020 at 16:04, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Fri, 2020-11-13 at 00:00 +0100, Amjad Ouled-Ameur wrote:
>> The current reset framework API does not allow to release what is done by
>> reset_control_reset(), IOW decrement triggered_count. Add the new
>> reset_control_rearm() call to do so.
>> 
>> When reset_control_reset() has been called once, the counter
>> triggered_count, in the reset framework, is incremented i.e the resource
>> under the reset is in-use and the reset should not be done again.
>> reset_control_rearm() would be the way to state that the resource is
>> no longer used and, that from the caller's perspective, the reset can be
>> fired again if necessary.
>> 
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>> Change since v1: [0]
>> * Renamed the new call from reset_control_(array_)resettable to 
>> reset_control_(array_)rearm
>> * Open-coded reset_control_array_rearm to check for errors before
>> decrementing triggered_count because we cannot roll back in case an
>> error occurs while decrementing one of the rstc.
>> * Reworded the new call's description.
>
> Thank you, applied to reset/next.

Hi Philipp,

Would it be possible to get an immutable branch/tag with this ?
It would allow to move forward on the USB side, without waiting for the
next rc1.

Thx
Jerome

>
> regards
> Philipp
