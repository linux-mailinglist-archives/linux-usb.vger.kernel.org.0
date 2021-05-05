Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2CCB373CA9
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 15:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbhEENsv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 09:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22600 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231774AbhEENsq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 May 2021 09:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620222469;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Y66UDdCQVyt6iTD3be2pNfjrnjlN1nlgdtRgR8WWsZk=;
        b=CnNWrIMCJfz1bKhXoUODGhiSg3ruuENX4mbuzZAFD4ZNTgUoIngyy0emUwWYDXBdbSQyEe
        ssjFiKUm1AYRYV4wuvt4NL3aL3czPFxt/vX5giuQyZZk17C5D8kw/IP0H/4YCIWZRg6O11
        rOvr4uB4xquw7KUfRIB1fUgRloRuCpk=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-RuQO0kHZPVeBx6iUvH31LQ-1; Wed, 05 May 2021 09:47:48 -0400
X-MC-Unique: RuQO0kHZPVeBx6iUvH31LQ-1
Received: by mail-pf1-f198.google.com with SMTP id a4-20020a056a000c84b029025d788a548fso1477690pfv.8
        for <linux-usb@vger.kernel.org>; Wed, 05 May 2021 06:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y66UDdCQVyt6iTD3be2pNfjrnjlN1nlgdtRgR8WWsZk=;
        b=r522Tmsr7AVJTgO+hItBASMqWF1fZrdkflYfbRkumHQL9bct3QOO872rveYo+E+vkb
         3uKdlYZ5eblQeTpFRMQQK47cf9EKynMeuafmmn7de3Wl5F6WXSIA9hQ32xY3nbi/CJKN
         E0r/nBlHGIJWWc3pbgIFNo5tU+b/Q0PIYr/1s8D6fIkMHWLKCVJHGzn5kmkT4Ymy9bjK
         4kDCQMF0lfk4GyAIoyv8zR+sk+sOD4jk0p5xSLz9d/dI1QfuQMBfL0+rvClnhiPCa17P
         y1uFIgF/NGBFfQO/c+TfO0jh2L/cLcjVWI19oOvIzWYnaL0bARfIVGuExaZm1sQKEHXV
         2EQQ==
X-Gm-Message-State: AOAM5301/wl+PLgxIIsu+iblfFII3YMW8jEWWF+X5uzner5xxx/6616O
        bvFsh/bboUb5iDuVQJ5VeGjz0WrNeiMRn70mq2dWnMLg9Gs9znmT3b1YneF2tFsUsm8Sh0kq12I
        LOPr2cFqTu5/anKITWLOAI9zDodZfmxdF3q3T
X-Received: by 2002:a62:bd13:0:b029:25c:5ec4:c2f3 with SMTP id a19-20020a62bd130000b029025c5ec4c2f3mr28336993pff.35.1620222467039;
        Wed, 05 May 2021 06:47:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHQnlOigptQ6V8Tb5EPxmwXRqyApalxmcQXnnohdiel63N8xCKjxPUmXIlS3n8uNtO7Mq3xZvHCoCynHhq2LY=
X-Received: by 2002:a62:bd13:0:b029:25c:5ec4:c2f3 with SMTP id
 a19-20020a62bd130000b029025c5ec4c2f3mr28336975pff.35.1620222466853; Wed, 05
 May 2021 06:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210425173353.10231-1-mail@anirudhrb.com> <nycvar.YFH.7.76.2105051442120.28378@cbobk.fhfr.pm>
 <CAO-hwJJ4u5NZ-81Tq3PGu-F9r3iUSCiKp=JUsTfuVsyd-Sxsew@mail.gmail.com> <nycvar.YFH.7.76.2105051528090.28378@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2105051528090.28378@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 5 May 2021 15:47:36 +0200
Message-ID: <CAO-hwJJKyLT4iG4DEhXGREPLVU8UASB8_gOFULmQ7hx2dYG7uw@mail.gmail.com>
Subject: Re: [PATCH] usbhid: fix info leak in hid_submit_ctrl
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Anirudh Rayabharam <mail@anirudhrb.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 5, 2021 at 3:28 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Wed, 5 May 2021, Benjamin Tissoires wrote:
>
> > I don't have a reproducer like syzbot has for the exact bug here, as I
> > am relying on one real USB device to check if usbhid is not too broken.
> > However, the test suite should catch if there is an error implied by the
> > hid_report_len() change.
>
> Yes, that was exactly what I wanted to check, sorry for not being verbose
> enough :)
>
> > Anyway, I manually started the job and will report when it is done.
>

Heh, no problems.

"Job succeeded" \o/

Given that you are on a spree:
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

