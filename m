Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B60234950A
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 16:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhCYPMI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Mar 2021 11:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbhCYPMB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Mar 2021 11:12:01 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C672CC06174A
        for <linux-usb@vger.kernel.org>; Thu, 25 Mar 2021 08:12:00 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id dm8so2831506edb.2
        for <linux-usb@vger.kernel.org>; Thu, 25 Mar 2021 08:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KgiQlHjqO1eZIs8RJx5tZLbRT7qttv9rUI4xuUbkmf0=;
        b=SBMe/4BueMgUfn1TWeZYXylvCxwjQoGEzyM5ZPNd3ob1cx4tK7tdQ9bCTcSj6X8DdL
         29I8Yui1NTK4kbdAwX4UY9rFFS5Ul2fqMKjYhaacto7PNjDNG34k29uRMRlefvM57Kiy
         rYPZ5QEO6zhY7x3cX+EQNzxYnEMUafVNBoQ+EVnNwT3gyE5yGsFBSatG8bK+wXvBgfj1
         WlAVsOjNF8bhRd7UN7B7HetaSozvQGPNKUnkGETnTMFqxDcr/gNfRcHqX5ypGSaPG5F+
         Mc2t1++RcNRfZR9QWX87MQu+Wqj55jo1TpMtpqRvj1uOMpBE9szr5ftlXFAJzAAxr0Mb
         HUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KgiQlHjqO1eZIs8RJx5tZLbRT7qttv9rUI4xuUbkmf0=;
        b=S9oZ9Gn5kJcF4/zVTJJZeq+VEzmuEA9aUu+2x2JdSRzk0u72FzpW2s7HDaPPntmZjq
         dBtklzPsNyXz0+ChNEGpL/3gVOYaijPyR3k/dwUbbZVOoyasiIeNmIM9ZFAUiyIyKNCV
         b2++jglfPJM3wBVcjngRgY4toErA7g8F9yhORJASz/CQek/Cnp8uN1mthgrzE9c/HM99
         lD4yMacaAjB0A3f+a5uMl4xA8gRZBVcB/UryGYKYbsc/UK9iOgu5gOzTHU/SUlbDPqUz
         TS++4mesMZ9hpfyxstxEHy7ZdDzV/0ZHilAAUUWA4SzkDlOE/fI7U0XTJZYbIb+aDOBM
         2lBQ==
X-Gm-Message-State: AOAM531ZMRfWPXSp9NhZVk2ZNESfQmydwuAsD0+eqK7y15+GfuJZRhug
        tEZZWArU0LYgveHder9QuWO/y4MS5lNK081WQD8HBjtMba4=
X-Google-Smtp-Source: ABdhPJxyISwib+S7uN6Ljhh2kYZoGeUhiW5tCLHnH21XLaNu/m7nJOU27aeI9IYp02WKpBL5oAY8ZOpURl7hS04KJLo=
X-Received: by 2002:aa7:cb90:: with SMTP id r16mr9837234edt.139.1616685119131;
 Thu, 25 Mar 2021 08:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAM5KnfNdqVASvsDccHk0-rFD9w266LTwLTQfhy2GZF-qu+KA-w@mail.gmail.com>
In-Reply-To: <CAM5KnfNdqVASvsDccHk0-rFD9w266LTwLTQfhy2GZF-qu+KA-w@mail.gmail.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Thu, 25 Mar 2021 08:11:47 -0700
Message-ID: <CABXOdTeS-nSqfB_BAex=0OZcdGWjjGJmKy9J3Eh5aL7cuornEA@mail.gmail.com>
Subject: Re: drivers: typec: tcpm: USB type C PD state machine behavior
To:     Bogdan Togorean <bogdan.togorean@gmail.com>
Cc:     Guenter Roeck <groeck@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 25, 2021 at 7:49 AM Bogdan Togorean
<bogdan.togorean@gmail.com> wrote:
>
> Hi Guenter,
>
> I'm bringing up a custom board based on NXPs I.MX8 processor that is
> powered on only by a USB type C. No battery is included.
> The PD interface chip is a PTN5110 from NXP.
> The problem I'm seeing is that when I power up the board through a
> Type C to Type C USB cable the board has the VBUS cut off in the early
> steps of the tcpm driver init.
>
> Now my question is, can the state machine modified and can we start
> from CONNECTED or TOGGLING state to jump over the first PORT_OFF state
> or there are any other implications and this is not possible?
>

Problem is that the state machines on both ends get confused if they
are not both in the same state. Since we don't know the initial remote
state, we have to start from a well known state. The only reliable
state I could find when I wrote the code was unattached, and I had to
initiate a port reset sequence to ensure state machine
synchronization. Maybe that can be changed, but it would have to be
based on some configuration data, and we would have to be very careful
to avoid impact on other systems.

Guenter

> Please find bello the log from debugfs obtained if I supply externally
> VBUS to keep it alive while the bus is reset by the source.
>
> [    2.660229] Setting voltage/current limit 0 mV 0 mA
> [    2.660233] polarity 0
> [    2.661720] Requesting mux state 0, usb-role 0, orientation 0
> [    2.662788] state change INVALID_STATE -> SNK_UNATTACHED
> [    2.663385] CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED,
> polarity 0, disconnected]
> [    2.663394] 2-0050: registered
> [    2.731746] Setting voltage/current limit 0 mV 0 mA
> [    2.731751] polarity 0
> [    2.733689] Requesting mux state 0, usb-role 0, orientation 0
> [    2.734173] cc:=0
> [    2.734648] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms
> [    2.735247] CC1: 0 -> 0, CC2: 0 -> 0 [state PORT_RESET, polarity 0,
> disconnected]
> [    2.737602] CC1: 0 -> 0, CC2: 0 -> 0 [state PORT_RESET, polarity 0,
> disconnected]
> [    2.837352] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
> [    2.837358] pending state change PORT_RESET_WAIT_OFF ->
> SNK_UNATTACHED @ 920 ms
> [    3.776941] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED
> [delayed 920 ms]
> [    3.776948] Start toggling
> [    3.779848] CC1: 0 -> 0, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
> [    3.779854] state change TOGGLING -> SNK_ATTACH_WAIT
> [    3.779862] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 200 ms
> [    3.781714] CC1: 0 -> 0, CC2: 5 -> 5 [state SNK_ATTACH_WAIT,
> polarity 0, connected]
> [    3.985026] CC1: 0 -> 0, CC2: 5 -> 5 [state SNK_ATTACH_WAIT,
> polarity 0, connected]
> [    3.986785] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 200 ms]
> [    3.986790] state change SNK_DEBOUNCED -> SNK_ATTACHED
> [    3.986793] cc:=2
> [    3.987530] polarity 1
> [    3.990380] Requesting mux state 1, usb-role 2, orientation 2
> [    3.990869] state change SNK_ATTACHED -> SNK_STARTUP
> [    3.990914] state change SNK_STARTUP -> SNK_DISCOVERY
> [    3.990918] Setting voltage/current limit 5000 mV 3000 mA
> [    3.990921] vbus=0 charge:=1
> [    3.991877] state change SNK_DISCOVERY -> SNK_WAIT_CAPABILITIES
> [    3.992351] pending state change SNK_WAIT_CAPABILITIES ->
> SOFT_RESET_SEND @ 240 ms
> [    3.992970] CC1: 0 -> 0, CC2: 5 -> 5 [state SNK_WAIT_CAPABILITIES,
> polarity 1, connected]
> [    3.997181] PD RX, header: 0x1161 [1]
> [    3.997188]  PDO 0: type 0, 5000 mV, 3000 mA [SHU]
> [    3.997191] state change SNK_WAIT_CAPABILITIES -> SNK_NEGOTIATE_CAPABILITIES
> [    3.997200] cc=2 cc1=0 cc2=5 vbus=0 vconn=sink polarity=1
> [    3.997203] Requesting PDO 0: 5000 mV, 3000 mA
> [    3.997206] PD TX, header: 0x1042
> [    4.004004] PD TX complete, status: 0
> [    4.004017] pending state change SNK_NEGOTIATE_CAPABILITIES ->
> HARD_RESET_SEND @ 60 ms
> [    4.009962] PD RX, header: 0x363 [1]
> [    4.009968] state change SNK_NEGOTIATE_CAPABILITIES -> SNK_TRANSITION_SINK
> [    4.009980] pending state change SNK_TRANSITION_SINK ->
> HARD_RESET_SEND @ 500 ms
> [    4.038937] PD RX, header: 0x566 [1]
> [    4.038943] Setting voltage/current limit 5000 mV 3000 mA
> [    4.038946] state change SNK_TRANSITION_SINK -> SNK_READY
> [    4.057287] PD RX, header: 0x176f [1]
> [    4.057293] Rx VDM cmd 0xff008001 type 0 cmd 1 len 1
> [    4.057305] PD TX, header: 0x124f
> [    4.062033] PD TX complete, status: 0
>
> Thank you and sorry for contacting you directly,
> Bogdan
