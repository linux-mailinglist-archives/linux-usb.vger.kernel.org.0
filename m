Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 739D89F71D
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 01:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfH0X76 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Aug 2019 19:59:58 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36687 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfH0X76 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Aug 2019 19:59:58 -0400
Received: by mail-wm1-f68.google.com with SMTP id p13so623279wmh.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 16:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W77jTG8bpy693vui4bkkDm6EWrj+wqx5LPjIltQ2Bvg=;
        b=Q5Z5XfDAESAdLfdGE6V4W96CLOS3dePdM2+vmZfW8cm+pb1ZUVhF1J6Rfypeiyc7sJ
         s5q4L+VwYxCn49Ugw6k6/xI0JZcp1AAzgjL5uVV5znv9hy6LsWZSQvoALgfxDNRogtNq
         xZIhQ0yjN9+8TUG96Xzlq4Z4PJNPRgoS8dd6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W77jTG8bpy693vui4bkkDm6EWrj+wqx5LPjIltQ2Bvg=;
        b=kQoPg6wD0K+o5WemSb849cG0Rinz6vWdb5FqFnIcZm3xcpH8K9ZXLpAqXzbni7ig6k
         q8f8PDlFzlIXJYyEcrgCNyLwoG4yVHDhEyw4skScRuKgoi0/RXgO4Yy3wEpT4n9oRt4n
         C7Lm1IwHQC3iHY2AxoVkwPkJ90wuiUY7hEIupOsqkSP7SK6w1y7zwSKSQJrTHKSYLRfo
         Be5EEGz7Vmsl9vbseoDvEOW64zVz8ms1MG5F1LZx50wxY/0RBLlNF8zFaNSS4YsdZ7UO
         vNrH0liaY1OUBds/lSuIYOuB9ObAeD7IWXDpZAW4b7R9nlcziWLK10QCMNih8Q3YknDo
         5Tuw==
X-Gm-Message-State: APjAAAVXH80WH5M3W1InIUMBukOxAqLDermD5RkmySOEZ4SCYY2p1+ws
        7LEFHeBbfH+q2Kqu4CFZomx6ZQY5inMz7yPJH38IX7923NQ=
X-Google-Smtp-Source: APXvYqxR32O+zrZRq6UlHyugg3oVxb6uNT8nx9VRWJKKwAsOCnBzaY+cuwdNtMkDLqIR1CU5+OLY5uUIyeUmEnPScAY=
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr1001230wml.102.1566950396022;
 Tue, 27 Aug 2019 16:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190827231409.253037-1-jwerner@chromium.org> <CAA6KcBAykS+VkhkcF42PhGyNu8KAEoaYPgA9-ru_HCxKrAEZzg@mail.gmail.com>
In-Reply-To: <CAA6KcBAykS+VkhkcF42PhGyNu8KAEoaYPgA9-ru_HCxKrAEZzg@mail.gmail.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Tue, 27 Aug 2019 16:59:43 -0700
Message-ID: <CAODwPW-+pPtiBh8Swn-cFs--2YaG6fMDyAzLXRucoweV50hDwA@mail.gmail.com>
Subject: Re: [PATCH] usb: storage: Add ums-cros-aoa driver
To:     Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org,
        USB Mass Storage on Linux 
        <usb-storage@lists.one-eyed-alien.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Why not do the mode switch from userspace?  I thought we were trying to move all the mode-switching stuff in that direction.....

I need to tie in to the main USB mass storage driver in a way that I
think would make it too complicated to move the mode switching part to
userspace. See the part I'm adding to initializers.c... that one has
to be in the kernel since it operates on the device after the mode
switch when it is claimed by the normal USB storage driver. But the
mode switch part has to communicate information to it to make sure it
picks up the right device (just relying on the normal USB device
matching isn't enough in this case, because all Android devices in AOA
mode identify themselves with that well-known VID/PID... I don't know
if there's any other kernel driver using this protocol today, but
there may be at some point and then it becomes important to make sure
you really grab the device you meant to grab). Some of that
information (the 'route' field) isn't even directly available from
userspace (I could use the device name string instead and that would
roughly come out to the same thing, but seems less clean to me).

So I could either do the mode switch in userspace and add a big custom
sysfs interface to the usb-storage driver to allow userspace to
configure all this, or I can add a small kernel shim driver like in
this patch. Considering how little code the shim driver actually needs
I expect it would come out to roughly the same amount of kernel code
in both cases, and I feel like this version is much simpler to follow
and fits cleaner in the existing "unusual device" driver
infrastructure.
