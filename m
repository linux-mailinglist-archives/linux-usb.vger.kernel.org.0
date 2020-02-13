Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B24E515B923
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 06:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgBMFlu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 00:41:50 -0500
Received: from mail-qv1-f49.google.com ([209.85.219.49]:39289 "EHLO
        mail-qv1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgBMFlu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Feb 2020 00:41:50 -0500
Received: by mail-qv1-f49.google.com with SMTP id y8so2100461qvk.6
        for <linux-usb@vger.kernel.org>; Wed, 12 Feb 2020 21:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mDaH5xXQaA6WBSgg7FwGlZs1NLyXzpJ3E3ms2BazYEI=;
        b=UEuG16PD1ephz5uNd+EpXHcrTJaid7DKdqqjHzLh5T2SoXfQbDZN1BdfbM5xgUDv7e
         476zzay83kObDM1r2Z9FODQDTV2ZbdCTrFaBw0OZNjPLkcZ+2kmo0Bopt7sn4GI2d8AA
         gVug75o27xESKSj1khR4NbABFnASZJYZY/nbMQRteQPynRsI+NqN94xRmHBsyoFDyDUM
         j4sad+lLuooHJll/DgTkv2gxYqIxWqcFmG5Ah6/Q/8mX8iGfhYmCS8up5maY3Zj4YAjK
         snUAABP7/sDVJ4JGQoiraAzwsNu4lrgiznsOdT1llmh5NEWHRtlZf+hi1jOizdKI6Iir
         W8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mDaH5xXQaA6WBSgg7FwGlZs1NLyXzpJ3E3ms2BazYEI=;
        b=ZTyUOpmHCOvtJgo7RyrjgQ9cLGy6vV+leLrvpSf1GPY8eepZqApy4YOmjsx26gnfCh
         sIosMb+1yenliBDJ+Og9fQau2mp5jsMjevnTJojRuCe//fQucy2z8YPs/wpKLbXjhuit
         MgpVeSIm2jx/QEYGaV/UKdMvXFvrIQln/HxcpakuIAeZ8z9NREMt1jeA9BfUgz7cytUs
         eNjsssqfHVnbWTT6EtXYfVkM3/Nkhx93ZKr6k6G6JtUBYq2ZJkeQKCCS6yMGg+ZEfqy4
         nrlcr4z6JxrSjFPnbLeCAyjHIAQHOy1QEjWiFSXB67P29scyrKfgTSkmargSo5NMI2xE
         rhfw==
X-Gm-Message-State: APjAAAXIy5e7roBJtX7L0pU1kIMSz1X7KVVGlqxJ/zIOzmswtdKWN1UK
        xPN0Q9LbSe+PI49pcEsUOv+GqmVh+3YgbpnWegk=
X-Google-Smtp-Source: APXvYqzDAAREL4ZVatcRlFQxR22N9c+UOeKIsVm7xKRU2oZ6QQnq3reUbmWPplxog6EpjLu3exGYUkc0g5SXh1HdVlQ=
X-Received: by 2002:ad4:4e50:: with SMTP id eb16mr22423506qvb.34.1581572508932;
 Wed, 12 Feb 2020 21:41:48 -0800 (PST)
MIME-Version: 1.0
References: <1581330569.26936.5.camel@suse.de> <Pine.LNX.4.44L0.2002100946400.14460-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2002100946400.14460-100000@netrider.rowland.org>
From:   Sam Lewis <sam.vr.lewis@gmail.com>
Date:   Thu, 13 Feb 2020 16:41:37 +1100
Message-ID: <CA+ZLECuKY0zOfGW4=5U1o0fYuYta9Xxdxwvbj5zS5TB6NVoqFQ@mail.gmail.com>
Subject: Re: USB hub driver over-current behavior
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Oliver Neukum <oneukum@suse.de>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 11 Feb 2020 at 01:53, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, 10 Feb 2020, Oliver Neukum wrote:
> > error handling at this level has gotten little love.
>
> Indeed.  This is mostly because the issue does not crop up in normal
> usage very often.  And most hubs don't have very good over-current
> protection anyway.
>
> I believe the original expectation was that over-current events would
> generally be intermittent and very short-lived.  So when an event did
> occur, it would make sense to wait a little while and then try to
> switch the port back on.  Nobody ever bothered to implement a total
> time or retry limit on this behavior, probably because there weren't
> any complaints.

Thanks for the responses. This makes sense, especially if most
consumer hubs aren't very high quality.

> > The basic problem is that we have no good way to switch a portback on
> > after we have given up on it. Feel free to propose a patch to the
> > kernel and a tool to use it and we can discuss them.
>
> Yes, patches are welcome.
>

How receptive would you (and other contributors/maintainers) be to a
patch that adds configuration that allows a port to stay off if it
receives an OC event? This obviously wouldn't be the desired behaviour
in the general case, but could be useful for embedded devices (such as
mine) where the design of the hub electronics are such that you can be
confident that an OC event is not just an glitch and is indicative of
a real problem.

If it isn't acceptable to have a USB port off until the system is
rebooted, what would be the appropriate mechanism of allowing a
userspace application to manually turn the port back on?

Sam
