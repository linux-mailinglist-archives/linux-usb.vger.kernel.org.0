Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825BA2E96CD
	for <lists+linux-usb@lfdr.de>; Mon,  4 Jan 2021 15:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbhADOI5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Jan 2021 09:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbhADOI5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Jan 2021 09:08:57 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F90AC061793
        for <linux-usb@vger.kernel.org>; Mon,  4 Jan 2021 06:08:16 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id x16so36951913ejj.7
        for <linux-usb@vger.kernel.org>; Mon, 04 Jan 2021 06:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=ONDjz5ciY9vROqc+40QcPHXcNj7vnSuJSUB6nVWh938=;
        b=rI95mT2WrrOPFGLnvIYmdnh/hiOFPpiKvknNVQO+3kAVlmXH+XKbRr40QgJQnL9/MO
         ZkxOa3TrY3NzVEdiCZfz9T/yAtDg+svkf3cfqMQQDXKCm+5DIr/JXETAWsVxUsIO453U
         N8ka6bNI1n0Vj/B9t4kWWwRkwxSq0pH9ynmu21FPTJmfyocuxv9EqEy2NbH/FO7Sckct
         YpbDPJk4VEGv7TCi0gR5l76CjSHsv6+pqiu3l/aOic1bff2ZJrGpG6kUd6RKliHgzzih
         WhxxHIklIa+TwE4S70fX1FCtnhHquP0YcdWImUbgIAC78iUG2VqYJiFeXmCah0hSlCln
         b80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=ONDjz5ciY9vROqc+40QcPHXcNj7vnSuJSUB6nVWh938=;
        b=U0uLz77jsF7L6dyB2Md7UY5LagwzKATCv2aLGBDV632oLA9PSTx0nIbKbsevMfwyHF
         7hxTo2J1Q8NcauMqYIlCCR0wTKWvIFlOwnQftxCT6NsjFFN68op926srgesQ4LQcOAzQ
         y4S/bCl22xNKUEZ5TYdwddlJ81JqkJN1VrFX7otD5nM7YobgociPus1K0pxzgOgbonhy
         ZLz60oVN2c861UuPjP1BiQEOfEUZ6MP4BuytpiIMGML5IdUn9xAzUSOP4sZeVA2eXbUp
         QJ8ICmbeyovresk0iuIGvLcYrg4no7+rm1dAcJ1v5J9caN2XIwPLDR75pi5ui/LXX6m8
         7WwQ==
X-Gm-Message-State: AOAM533H5/I0cktOVE+3NTOs4f7dUlqI8WyfNwuttOjw0iywTPmvH5n4
        ky+R2vVjxK8W/926/S8i8+RT5g==
X-Google-Smtp-Source: ABdhPJwWleW0MXH3U76HBozLO17/P7prx/2nKrQvU/7WOFT18qrcg+F/uNDoWgAaedeAbgYIS7KMAQ==
X-Received: by 2002:a17:906:ae14:: with SMTP id le20mr68611224ejb.451.1609769295055;
        Mon, 04 Jan 2021 06:08:15 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id u2sm23681997ejb.65.2021.01.04.06.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 06:08:14 -0800 (PST)
References: <20201221173531.215169-1-jbrunet@baylibre.com>
 <20201221173531.215169-4-jbrunet@baylibre.com>
 <X+nzWs3nOrcqu4F2@kroah.com>
 <20201229222949.GC31406@jackp-linux.qualcomm.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] usb: gadget: u_audio: remove struct uac_req
In-reply-to: <20201229222949.GC31406@jackp-linux.qualcomm.com>
Message-ID: <1jr1n0x0aa.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 04 Jan 2021 15:08:13 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Tue 29 Dec 2020 at 23:30, Jack Pham <jackp@codeaurora.org> wrote:

> Hi Greg and Jerome,
>
> On Mon, Dec 28, 2020 at 04:01:46PM +0100, Greg Kroah-Hartman wrote:
>> On Mon, Dec 21, 2020 at 06:35:30PM +0100, Jerome Brunet wrote:
>> > 'struct uac_req' purpose is to link 'struct usb_request' to the
>> > corresponding 'struct uac_rtd_params'. However member req is never
>> > used. Using the context of the usb request, we can keep track of the
>> > corresponding 'struct uac_rtd_params' just as well, without allocating
>> > extra memory.
>> > 
>> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> > ---
>> >  drivers/usb/gadget/function/u_audio.c | 58 ++++++++++++---------------
>> >  1 file changed, 26 insertions(+), 32 deletions(-)
>> 
>> This patch doesn't apply, so I can't apply patches 3 or 4 of this series
>> :(
>> 
>> Can you rebase against my usb-testing branch and resend?
>
> From the cover letter:
>
> On Mon, Dec 21, 2020 at 06:35:27PM +0100, Jerome Brunet wrote:
>> The series depends on this fix [0] by Jack Pham to apply cleanly
>> 
>> [0]: https://lore.kernel.org/linux-usb/20201029175949.6052-1-jackp@codeaurora.org/
>
> My patch hadn't been picked up by Felipe, so it's not in your tree
> either, Greg. Should I just resend it to you first?  Or shall I invite
> Jerome to just include it in v2 of this series?

Indeed. I rebased on usb-testing and the series applies cleanly with
Jack's changes, as decribed in the cover-letter.

If it is easier, I'm happy to include Jack's change in the v2, along
with the fixed PATCH 2 fixed.

Greg, would it be OK with you ?

>
> Thanks,
> Jack

