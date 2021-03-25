Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28168349492
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 15:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhCYOuD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Mar 2021 10:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhCYOtk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Mar 2021 10:49:40 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F32BC06175F
        for <linux-usb@vger.kernel.org>; Thu, 25 Mar 2021 07:49:39 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id y1so3437343ljm.10
        for <linux-usb@vger.kernel.org>; Thu, 25 Mar 2021 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=zsgZlBqAjBkZnyyh8pKK4WR3kZZCe9QNBuj53l2xkLg=;
        b=GStEZXYuu7BrmXkMaT1UNuHILp/rh7MxQjiLD7o31nU+0Q3G3MClMqiy98s1yySJ2+
         7cSg5y8E6GRhyQHJPRWfONryYKHsl3cpMlPP/LCdVPKU7Z0V0XTa9kMPBp3bw2PrQDcp
         sGW1PvSv1Drbpxd0I0UoOMyflBKet40NpYq+bty8yR9stO0giDH5ZoNNAj4EujB78tBn
         rUKz0FiIx6h/+q1cVzAiC/kF9SkQDGHC7+GNA6pIhLQlbIGnMYh8dMzxOY2XW/Mx9PJc
         HmI5GTsLvaRt8MuRJW4fvovhG2jHbKVuXwZolynmjGJ6sfG4nchSlZZ98Sr35dmJq35i
         lJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=zsgZlBqAjBkZnyyh8pKK4WR3kZZCe9QNBuj53l2xkLg=;
        b=epcA2xiZc64Mjd1E8hGmacxknC4A6bgNoT4YwJwYdO+Ke9K/KUD9BcS9zL+SJyJE9D
         OTeUiVFyIwSEf2S6I1DUGvWGWc5jeUtkCtdrpI3Kw6iJnbRmkaX/OpuRLcbxSUDJu065
         C09o6IHJwKT59y14sTf/+xoNvFbbI9zQujqGE1DyWwEwtdAmLtVzxvlLa7trOXFeigwz
         xmNlOZ5AHTgRbb+9Yij84LM2O2WzljUA2xhNxfpgBobdRcqcqHNSpw0ZpQXzsLq5lcst
         D0syWsfJ92uJDF9Q1c0KkgrhTdkT5UoQzIao2TH0//lDvfJE1dp4Y1rs824y0fir1Qd0
         ix/g==
X-Gm-Message-State: AOAM530/4FjNFuFk58fgGv1Lzt1lYOim77VMmlW5IPQM25wHXMmKHgW5
        KpNLeE0EvvRLr90mP1+4MOFQRrCpZAnH9mPvh54=
X-Google-Smtp-Source: ABdhPJzMfKYgkSCgMWER7PSKFRieEtdx9by+TGdR4ES4x61cLXmNE+vPb5Jm/kYwTp5zrkYPsTj5YCdovtNDi4XTwiI=
X-Received: by 2002:a2e:3913:: with SMTP id g19mr5887708lja.294.1616683777890;
 Thu, 25 Mar 2021 07:49:37 -0700 (PDT)
MIME-Version: 1.0
From:   Bogdan Togorean <bogdan.togorean@gmail.com>
Date:   Thu, 25 Mar 2021 18:49:25 +0200
Message-ID: <CAM5KnfNdqVASvsDccHk0-rFD9w266LTwLTQfhy2GZF-qu+KA-w@mail.gmail.com>
Subject: drivers: typec: tcpm: USB type C PD state machine behavior
To:     groeck@chromium.org, linux@roeck-us.net, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Guenter,

I'm bringing up a custom board based on NXPs I.MX8 processor that is
powered on only by a USB type C. No battery is included.
The PD interface chip is a PTN5110 from NXP.
The problem I'm seeing is that when I power up the board through a
Type C to Type C USB cable the board has the VBUS cut off in the early
steps of the tcpm driver init.

Now my question is, can the state machine modified and can we start
from CONNECTED or TOGGLING state to jump over the first PORT_OFF state
or there are any other implications and this is not possible?

Please find bello the log from debugfs obtained if I supply externally
VBUS to keep it alive while the bus is reset by the source.

[    2.660229] Setting voltage/current limit 0 mV 0 mA
[    2.660233] polarity 0
[    2.661720] Requesting mux state 0, usb-role 0, orientation 0
[    2.662788] state change INVALID_STATE -> SNK_UNATTACHED
[    2.663385] CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED,
polarity 0, disconnected]
[    2.663394] 2-0050: registered
[    2.731746] Setting voltage/current limit 0 mV 0 mA
[    2.731751] polarity 0
[    2.733689] Requesting mux state 0, usb-role 0, orientation 0
[    2.734173] cc:=0
[    2.734648] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms
[    2.735247] CC1: 0 -> 0, CC2: 0 -> 0 [state PORT_RESET, polarity 0,
disconnected]
[    2.737602] CC1: 0 -> 0, CC2: 0 -> 0 [state PORT_RESET, polarity 0,
disconnected]
[    2.837352] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
[    2.837358] pending state change PORT_RESET_WAIT_OFF ->
SNK_UNATTACHED @ 920 ms
[    3.776941] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED
[delayed 920 ms]
[    3.776948] Start toggling
[    3.779848] CC1: 0 -> 0, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
[    3.779854] state change TOGGLING -> SNK_ATTACH_WAIT
[    3.779862] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 200 ms
[    3.781714] CC1: 0 -> 0, CC2: 5 -> 5 [state SNK_ATTACH_WAIT,
polarity 0, connected]
[    3.985026] CC1: 0 -> 0, CC2: 5 -> 5 [state SNK_ATTACH_WAIT,
polarity 0, connected]
[    3.986785] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 200 ms]
[    3.986790] state change SNK_DEBOUNCED -> SNK_ATTACHED
[    3.986793] cc:=2
[    3.987530] polarity 1
[    3.990380] Requesting mux state 1, usb-role 2, orientation 2
[    3.990869] state change SNK_ATTACHED -> SNK_STARTUP
[    3.990914] state change SNK_STARTUP -> SNK_DISCOVERY
[    3.990918] Setting voltage/current limit 5000 mV 3000 mA
[    3.990921] vbus=0 charge:=1
[    3.991877] state change SNK_DISCOVERY -> SNK_WAIT_CAPABILITIES
[    3.992351] pending state change SNK_WAIT_CAPABILITIES ->
SOFT_RESET_SEND @ 240 ms
[    3.992970] CC1: 0 -> 0, CC2: 5 -> 5 [state SNK_WAIT_CAPABILITIES,
polarity 1, connected]
[    3.997181] PD RX, header: 0x1161 [1]
[    3.997188]  PDO 0: type 0, 5000 mV, 3000 mA [SHU]
[    3.997191] state change SNK_WAIT_CAPABILITIES -> SNK_NEGOTIATE_CAPABILITIES
[    3.997200] cc=2 cc1=0 cc2=5 vbus=0 vconn=sink polarity=1
[    3.997203] Requesting PDO 0: 5000 mV, 3000 mA
[    3.997206] PD TX, header: 0x1042
[    4.004004] PD TX complete, status: 0
[    4.004017] pending state change SNK_NEGOTIATE_CAPABILITIES ->
HARD_RESET_SEND @ 60 ms
[    4.009962] PD RX, header: 0x363 [1]
[    4.009968] state change SNK_NEGOTIATE_CAPABILITIES -> SNK_TRANSITION_SINK
[    4.009980] pending state change SNK_TRANSITION_SINK ->
HARD_RESET_SEND @ 500 ms
[    4.038937] PD RX, header: 0x566 [1]
[    4.038943] Setting voltage/current limit 5000 mV 3000 mA
[    4.038946] state change SNK_TRANSITION_SINK -> SNK_READY
[    4.057287] PD RX, header: 0x176f [1]
[    4.057293] Rx VDM cmd 0xff008001 type 0 cmd 1 len 1
[    4.057305] PD TX, header: 0x124f
[    4.062033] PD TX complete, status: 0

Thank you and sorry for contacting you directly,
Bogdan
