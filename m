Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400A0251AB8
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 16:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgHYOVE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 10:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgHYOVE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 10:21:04 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9912CC061574
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2020 07:21:03 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id oz20so11828854ejb.5
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2020 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=j7njjj4fP/dM/qO6pJcdvxIHONmhXgz8n6uQ0RbRVTI=;
        b=arc7hmezb/7Y8q/sQ9PT8vVQ75/LRED5NX2ZLNZX50yBR0+XIIT00j1YDXv33GW1X7
         PqppM8VEOt7FabxzAp5w9kC9vdmPINmwQA3v/TTe5zlK5QjmfJD8AtKPmRxGt33HDALk
         EZS7jke1Vg4MwRSrL4/LYuOQBkr4mQesFzl17BeyHNNCp8ABLQz4s8Oue/6+FslyEqj+
         dh9X4J5quYImhhN82tnjsElb9dNh1M08gtLxG6pzkBbrsgt6v+fUveiWRXpvq00Kp3aL
         jUEP0NVFTrYfzqDNUmxIGUo+55bxIfouLxYJUITcj4iKRfKnk/SKsF9E2O3+ItjExbto
         bQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=j7njjj4fP/dM/qO6pJcdvxIHONmhXgz8n6uQ0RbRVTI=;
        b=TOAc1rVPwqmrfrwzNdjHrrJcOqqZylKtzBznITmRLxHZheWXTx33gWw6h1fe0Iqwpj
         RBKu88+ZQ9r3Ht7uwg1eoU3KYemfrsk9ML4cOk3l0iO5qc8YrLG6eWHXYc7Z85OERkB3
         VrE3j3ZDu1SvF3YBMP/jlcfmsHQND4Im0F/gICuWtmP3zZOZCS2sp1ZNQsHVBAPZb7io
         Prs9gUPApxtfgN5KxY4QpqzZjWTkYDqFwtQB/oG/XRW2kkywv+Dysv+Ae5U9IrvkjBxc
         NA+4NQFR/yez1gNlteufW68Pbzez+Q5FlhciiIKCx32xumyAbkZE2H1/yms3TBcwRNHz
         hrjg==
X-Gm-Message-State: AOAM531Gdawtcqlyavb9AMSCKs0CUYXedbZ6dh7Q8GIa1PlNxx/h7KnX
        IAoG11wF0iQLoDyHFqSAEcBUCQ==
X-Google-Smtp-Source: ABdhPJzGcDjR55H9A/W/+YJ8E7C/8uERKfkCaSwyfhtRVOKljjaHSw9dq3b2HYmAiXAm4C21zol5uQ==
X-Received: by 2002:a17:906:f150:: with SMTP id gw16mr2292056ejb.532.1598365262138;
        Tue, 25 Aug 2020 07:21:02 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id fx15sm13847072ejb.1.2020.08.25.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 07:21:00 -0700 (PDT)
References: <20200713160522.19345-1-dan@dlrobertson.com> <20200713160522.19345-2-dan@dlrobertson.com> <1jy2maekzf.fsf@starbuckisacylon.baylibre.com> <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de> <1j8se43yrw.fsf@starbuckisacylon.baylibre.com> <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Dan Robertson <dan@dlrobertson.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, aouledameur@baylibre.com
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
In-reply-to: <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
Date:   Tue, 25 Aug 2020 16:20:59 +0200
Message-ID: <1j5z964xis.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Tue 25 Aug 2020 at 12:20, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Mon, 2020-08-24 at 16:26 +0200, Jerome Brunet wrote:
> [...]
>> In practice, I think your proposition would work since the drivers
>> sharing this USB reset line are likely to be probed/suspended/resumed at
>> the same time but ...
>> 
>> If we imagine a situation where 2 device share a reset line, 1 go in
>> suspend, the other does not - if the first device as control of the
>> reset, it could trigger it and break the 2nd device. Same goes for
>> probe/remove()
>> 
>> I agree it could be seen as unlikely but leaving such race condition
>> open looks dangerous to me.
>
> You are right, this is not good enough.
>
>> > Is this something that would be feasible for your combination of
>> > drivers? Otherwise it is be unclear to me under which condition a driver
>> > should be allowed to call the proposed reset_control_clear().
>> 
>> I was thinking of reset_control_clear() as the counter part of
>> reset_control_reset().
>
> I'm not particularly fond of reset_control_clear as a name, because it
> is very close to "clearing a reset bit" which usually would deassert a
> reset line (or the inverse).

It was merely a suggestion :) any other name you prefer is fine by me

>
>> When a reset_control_reset() has been called once, "triggered_count" is
>> incremented which signals that the ressource under the reset is
>> "in_use" and the reset should not be done again.
>
> "triggered_count" would then have to be renamed to something like
> "trigger_requested_count", or "use_count". I wonder it might be possible
> to merge this with "deassert_count" as they'd share the same semantics
> (while the count is > 0, the reset line must stay deasserted).

Sure. Could investigate this as a 2nd step ?
I'd like to bring a solution for our meson-usb use case quickly - even
with the revert suggested, we are having an ugly warning around suspend

>
>> reset_control_clear()
>> would be the way to state that the ressource is no longer used and, that
>> from the caller perspective, the reset can fired again if necessary.
>> 
>> If we take the probe / suspend / resume example:
>> * 1st device using the shared will actually trigger it (as it is now)
>> * following device just increase triggered_count
>> 
>> If all devices go to suspend (calling reset_control_clear()) then
>> triggered_count will reach zero, allowing the first device resuming to
>> trigger the reset again ... this is important since it might not be the
>> one which would have got the exclusive control
>> 
>> If any device don't go to suspend, meaning the ressource under reset
>> keep on being used, no reset will performed. With exlusive control,
>> there is a risk that the resuming device resets something already in use.
>>
>> Regarding the condition, on shared resets, call reset_control_reset()
>> should be balanced reset_control_clear() - no clear before reset.
>
> Martin, is this something that would be useful for the current users of
> the shared reset trigger functionality (phy-meson-gxl-usb2 and phy-
> meson8b-usb2 with reset-meson)?

I'm not Martin but these devices are the origin of the request/suggestion.

>
> regards
> Philipp

