Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A790384DD5
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 15:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388348AbfHGNqx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 09:46:53 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:33689 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388333AbfHGNqw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 09:46:52 -0400
Received: by mail-pl1-f180.google.com with SMTP id c14so40828221plo.0
        for <linux-usb@vger.kernel.org>; Wed, 07 Aug 2019 06:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ySKqQSG2Sdtb6NR7X5LBOcrvnI79dZs/JcxGOAF7z8s=;
        b=CBNtQWhZ4fSsR34rE64Wm2VTpkIt5MmcmcO/RsPUtQY6k/6KjqInWnu0lk3clDPf7E
         bHESMJKisHtEChM7g3O7jPk+cyzVRc/MBuNvQKDysVLAV1Qm6o71U2LXB2PN5zter2BQ
         pvUyB4WFpXx2e+dDFbcv2cMR3Cz7gtY4hdqYP5NGn9viFBzkSTxIe/+eZov9xSj74/rj
         w7blLMQZGVOVq7HNM7ubADXYuT1UDy6uXmRacZ1VF5sJyp7PQnz0mMsPnWhSYH+x5mOJ
         TdNVFYWGpGZ4/Qa+QeeHoVSmnJnLUsnDeuLRlrYUUWfZr0bnih/B/QUzhdAgRs2gq1Y6
         67bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ySKqQSG2Sdtb6NR7X5LBOcrvnI79dZs/JcxGOAF7z8s=;
        b=r76HoZK0/rsb/rpw3f0KwQH/CSH3IdiotfOi/SaB7v8KYQFX4Yyxw9wPoXp0aRVVKw
         mUc2Ukzu0/nhBbLFe++2S6RnbsavD1qSnSp7IO6k6IfQzpRAj8j/pnjX6FrrehjC4FfU
         b/riu/4PoLvZfKm3QP5VnB3lsWmL9fksc+xxseCorMeCxC7DMI5vs9jhUv0hUDwKaZI7
         UeqZ+sL9yNU/KsJZBqrElQSQoOtebJNy+dyq60EWfQsmVvZxzwvPZaOx4TEMSILDZ9vE
         1tBgNpgfEZVej/O9yBDDWp/JDj/NssGz370hTN5Ho4Hq1jdlPWXcEehUEGiUue37fjSN
         2okA==
X-Gm-Message-State: APjAAAUxsRfLXSj5xK33UJfnXscMVHSeQJlzoKOWlbMZpASQy+POBCJT
        gp7kuZmuxoCnBg0v/D5NwRBnhcv7FXzrYkhJ2A6IsobhyKk=
X-Google-Smtp-Source: APXvYqwuJwIi1+8bhY+iSZWSE7B73AMVMzCQHsoMCu3BHZ260yvxNMQ9E/NW99umFwPd3dN4BLTvVPw5fH0LbL1UhJk=
X-Received: by 2002:a63:3006:: with SMTP id w6mr7898479pgw.440.1565185611746;
 Wed, 07 Aug 2019 06:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <Pine.LNX.4.44L0.1908061009450.1571-100000@iolanthe.rowland.org> <1565105624.8136.32.camel@suse.com>
In-Reply-To: <1565105624.8136.32.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 7 Aug 2019 15:46:40 +0200
Message-ID: <CAAeHK+wJ_26rFeeQkfELO5nXn57-1Wo4iodLJNY=9iTeaduHyA@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in device_release_driver_internal
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 6, 2019 at 5:34 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Dienstag, den 06.08.2019, 10:19 -0400 schrieb Alan Stern:
> > In any case, I don't know if this missing "get" would cause the
> > problem, but it might well.
>
> Hi,
>
> upon further thought, this should be automated. Checking for
> refcount leaks is KASAN's job. In particular, refcounts
> should not
>
> * decrease in probe()
> * increase in disconnect()
> * change in case probe() fails

It's probably a job for some other refcount debugging tool, but yes,
it would be nice to have a detector for this kind of stuff. It will
probably require some annotations in each place we want this kind of
checks to be performed.

>
>         Regards
>                 Oliver
>
