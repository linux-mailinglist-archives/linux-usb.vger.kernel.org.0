Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F973FBA33
	for <lists+linux-usb@lfdr.de>; Mon, 30 Aug 2021 18:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237661AbhH3Qcb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Aug 2021 12:32:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42217 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237049AbhH3Qcb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Aug 2021 12:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630341097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QX9GU0hH1TRwqyfkU4USdjocCp7nMp76pC0eH/XEt0A=;
        b=anU4kzhtOQ1Xoc0+3oiK9/dcIMw5sAuHwYk/3qc7mT8/TzrGiaRCR1dFAox8l/OwLTPtcb
        kKQeO9JHgo0hcUN92Hcz0cHKud0rMNt7CVzEOK2VMlPNa/BS9Pa0QVP1Ly0q8hRMtDeVZC
        3G5Grvf+KDJNW9mEGURic/gmTzJw9SE=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-xqbuuMVUODS3XbIC8EHuaw-1; Mon, 30 Aug 2021 12:31:35 -0400
X-MC-Unique: xqbuuMVUODS3XbIC8EHuaw-1
Received: by mail-pf1-f198.google.com with SMTP id f23-20020aa782d7000000b003eb2baced8bso1161700pfn.3
        for <linux-usb@vger.kernel.org>; Mon, 30 Aug 2021 09:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QX9GU0hH1TRwqyfkU4USdjocCp7nMp76pC0eH/XEt0A=;
        b=k7Xw/NWhNACTM+NQSzoRFw/PARbeBIOuB9qaQaAEU34lffWD6K6ftYSsnT1syPdcbN
         E8A56YrBTygYtOvkwYjME1Qm6/FiQ1E/t55oOvNkYehj1WRG3MZX4u/m5dCy8PR+n2mg
         wSVHaPmUhBeYb+IaKZbsV/jk5h+IO+cS3kvQFugfyhxHropBjJYkpvqsx6b8QQXU6p5A
         Dpopn4/Vuxgn49svTowOtXq/j77cr8mbldlUP0W7Ye/qUghl76932J6WGwaOqWrQ9BV6
         LV/1qUaCV99nHFjs6hx5H21IVvHUUdN5jOMN+0gq9Kp58Dhp9POtUTa7TIR6cS8mtM/Z
         IDhA==
X-Gm-Message-State: AOAM530VPDeZm6FOaofa/iLoo7s6XzJnJZZf24+Dvvb/U+ZA0sxey3Xi
        6GrEhxnDOw6ULhuUWPBiXIAAylgecX4qYEUhwfaH3eIaW1h5CPduEfLFCEvk5AZGKu56uYQgks0
        83SSO/29r9Fm4nL9kyZzlLWz9XAbMaH0q+qnF
X-Received: by 2002:a17:902:da8d:b0:135:d4a1:bc25 with SMTP id j13-20020a170902da8d00b00135d4a1bc25mr446073plx.41.1630341094434;
        Mon, 30 Aug 2021 09:31:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsfUc0NrQJSBO5s1PQvVJbSaXwuj8CLgAUF3cdiQwV74fkRhpEV4xYpMdYLQmn5JWjkbapCd2JNKKwqwLYZWI=
X-Received: by 2002:a17:902:da8d:b0:135:d4a1:bc25 with SMTP id
 j13-20020a170902da8d00b00135d4a1bc25mr446052plx.41.1630341094159; Mon, 30 Aug
 2021 09:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210816130059.3yxtdvu2r7wo4uu3@lion.mk-sys.cz>
 <20210816143856.GA121345@rowland.harvard.edu> <20210816191249.7g2mk5thwpio7cfc@lion.mk-sys.cz>
 <1954573.0n35tlyJVE@natalenko.name> <20210830160743.GB332514@rowland.harvard.edu>
In-Reply-To: <20210830160743.GB332514@rowland.harvard.edu>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 30 Aug 2021 18:31:23 +0200
Message-ID: <CAO-hwJ+QL9O_m8NFXeAWhJ5B7ipYeNC=9RjU1HamMisdVhXEwA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] flood of "hid-generic ... control queue
 full" since v5.14-rc1
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Oleksandr Natalenko <oleksandr@natalenko.name>,
        Michal Kubecek <mkubecek@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 30, 2021 at 6:14 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Aug 30, 2021 at 05:48:09PM +0200, Oleksandr Natalenko wrote:
> > Hello.
> ...
> > Any luck with moving this forward please? I've got a similar issue with APC
> > UPS and v5.14 kernel, and this patch also solves the connectivity issue for
> > me.
>
> I've been waiting to hear back from Benjamin to see if testing revealed
> any problems with the latest version of the patch.
>

Sorry, things have been complex last week while I was on vacation.
Nothing scary, the usual "not enough hours in a day to be able to sit
in front of a computer".
I'm back at work today, but got a lot of urgent things to do. I should
be able to do the testing tomorrow.

Cheers,
Benjamin

