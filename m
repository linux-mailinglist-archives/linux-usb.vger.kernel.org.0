Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5ABE387A59
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 15:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234690AbhERNqR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 09:46:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43736 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233786AbhERNqQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 May 2021 09:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621345498;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=keW/z/7Dpy5O9ju83p8wx5U035Fy3tAAVmCh5ZRaXCM=;
        b=gzcQyj3cqwsInH5TEZAMkZEEaiHzGbTwWj0FpvBw2LQw5tRHmLZEFpjqx6O8X6JwqIstjf
        q9jk3pUvQIkukcg6iAyp5cNem95UwMO/yLiKxaD93NPf6fmQko8EbpldpX5kVbz3H6b+iU
        jgX40yR4dXSD05MqaJ3aGZd/u1nPNro=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-C38AE7HlPkqKaQXpFtfxdA-1; Tue, 18 May 2021 09:44:55 -0400
X-MC-Unique: C38AE7HlPkqKaQXpFtfxdA-1
Received: by mail-ej1-f72.google.com with SMTP id m18-20020a1709062352b02903d2d831f9baso2385363eja.20
        for <linux-usb@vger.kernel.org>; Tue, 18 May 2021 06:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=keW/z/7Dpy5O9ju83p8wx5U035Fy3tAAVmCh5ZRaXCM=;
        b=gC5W+V4HEOHWoixYXFvai0A9J+N2593fmR+pxTdZRgfRxJTYCNV9DgTysCe9hgGXlq
         t7lzsGBlB+CdhMl1n0yTES+q4RqpIrio3QJJJCyqoGJ4hxbTqPxsd8dS3C3vP5eEeH9t
         ertGJmgfJOrm+g3lznZqJepD/pU56I3CAlmtbhIYOW7fzDolRsuiMXT6cb0aQpv5v1wQ
         bHA5t5wv1R5o+iSy/reTJAYvVyHoqDgJgrz2UN6HRd9AgaeMql7xGT8YCRRQ3iDH/Y3B
         dig9icaKxBc6OMrSHWOBvI2INcuI7iOHSC4+5BhfI50vFMudgD2h6K+uK1bSKhD3nVIz
         b0+w==
X-Gm-Message-State: AOAM532QUG7hK6NqG++30hfyIPy+14lvP5RtqYywt+vsr3qhOLs/3U+j
        rE0SsAh8p9ZxHPijQaBvFSOiNxFSSBKWKTYZorhj1BDwHM450PRj0BBU91xy7HFZUyvLcz1YPao
        exJb8L6MIE+QNTF21KYnc
X-Received: by 2002:a05:6402:4313:: with SMTP id m19mr7076935edc.263.1621345493881;
        Tue, 18 May 2021 06:44:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUhlQtuAY0GPaQM/J3vCTCkrcE0giYJERx7T9KrmeM7xcF47HJZ6orjqYyxWic4VUeEX1JUw==
X-Received: by 2002:a05:6402:4313:: with SMTP id m19mr7076917edc.263.1621345493693;
        Tue, 18 May 2021 06:44:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k9sm10862688eje.102.2021.05.18.06.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 06:44:53 -0700 (PDT)
Subject: Re: Handling of USB "Programmable button" controls as KEY_MACRO#
 events
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-kernel@vger.kernel.org
References: <6ebbb200-1f2c-450b-8fae-e5e2dd9b6be9@t-8ch.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <61dcf8c7-2dcb-4173-fbbd-9adf3412edb7@redhat.com>
Date:   Tue, 18 May 2021 15:44:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <6ebbb200-1f2c-450b-8fae-e5e2dd9b6be9@t-8ch.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 5/18/21 3:21 PM, Thomas Weißschuh wrote:
> Hi everybody,
> 
> Would it make sense to map the "Programmable Buttons" control from the
> USB HID Consumer page [0] to the linux event codes KEY_MACRO1 ... KEY_MACRO# ?
> 
> Those controls are documented in the USB spec as:
> 
> "The user defines the function of these
> buttons to control software applications or GUI objects."
> 
> The KEY_MACRO event codes are documented with:
> 
> "Some keyboards have keys which do not have a defined meaning, these keys
> are intended to be programmed / bound to macros by the user."
> 
> My usecase is the passing of custom keycodes from a programmable keypad
> (via QMK[1]) to Linux.
> (This would also need new functionality in QMK itself)

I think the idea is good, but AFAICT the HUT does not actually assign
any usage codes in the consumer-page for this. It simply points to the
Button usage-page, which means things conflict with e.g. mouse and joystick
buttons and I do not see any dedicated codes in the table
"Table 15.1: Consumer Page" so I'm not sure how to interpret the spec. here ...

I guess there is something which we can do with the report's application here,
since the code dealing with HID_UP_BUTTON is already doing a switch-case
on field->application to differentiate between mouse and gaming buttons.

I guess interpreting an application of HID_CP_CONSUMER_CONTROL in combination
with using the buttons usage-page as wat the HUT is trying to specify and
thus map that the first 30 codes in that combination to KEY_MACRO1 - 30
might make sense.

Regards,

Hans




> 
> Alternatives:
> 
> * Send Raw HID from QMK
>   * Con: needs a dedicated, nonstandard driver on the host
> * Use F-Keys
>   * Con: only F13-F19 are usable (F1-F12 are used by normal keyboards, F20-F23
>     are repurposed with other keys for X11 compat)
> 
> Possible problems:
> 
> * There are 65k programmable keys defined by USB but only 30 macro keys are
>   supported by Linux.
> 
> Thanks,
> Thomas
> 
> [0] https://www.usb.org/sites/default/files/hut1_22.pdf#section.15.14
> [1] https://qmk.fm/
> 

