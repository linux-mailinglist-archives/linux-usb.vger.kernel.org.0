Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7293227FD5
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 14:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgGUMVF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 08:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgGUMVF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 08:21:05 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB871C061794
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 05:21:04 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id q74so21168059iod.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9IcH+7UUjIlLKAljGIqIpAMJ6DSb4sDvG3UFjllEdTs=;
        b=JBQ3iXeBgMk3UdIS80hiAjBZMz9J4fzbSnqTr5IAvD0VCkCpiSyKpM2fNzKre6UXQd
         mFTuIlvY6iDAUkt/WyAizjb9chgdMWJyzHbgulwIniCLRhz8+tGDOKL0CYsMdRfIC9UB
         OzaNk5GUs3s1HfHrrc1X4bi/q98jiXbhVsOLaoMXllTDpklidOjtccf69JPTPiJv1y3z
         eN6g5Da695GzOC0a/ouP9x1W8Dss2xSaoHkE8TXplVaumsJ3Sxn8KUFYHqft8twKL6BK
         BLg7ZEJFJBq5c2aAGBYlBgAKS/5kHHASZV6wptvxkJK6TWFJYiYM/zdoUU6uSyGk/d7u
         r5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9IcH+7UUjIlLKAljGIqIpAMJ6DSb4sDvG3UFjllEdTs=;
        b=qkAGrPMVNQy9jHRwzhSVRgrP5q7diJSADlpWgYZxwgAIvAS+9qA2/J9ywH8sHi7dYk
         cp45FkuP2D9EInXhEkrjAkaSzLD8ENxIzJptpLPdqPEmBri7ubKhJkszqtsullt8qWvc
         FiqFzaVYzPT0LYjSAa2fkHMrrKBKLRjLlN4lOB2G+oOKR9pCiLXtnSeZyVc+Li6tOjKo
         DZd85/A4B1EGvCl9s4zNFB5xYzdrGaB+19TpN5XocNOqBZvV6cqbzJKZovS9qdiWjncW
         QyODsLMR2PFYHo7LA39t1DoocfBSUKOC/yUMNt91KQpPiV0xpad8zKsSI0M3cRevfv80
         f3og==
X-Gm-Message-State: AOAM531aYL1XWsJeJUkOZBPOqx+nEv5QjHJyx11arRBk3O86Y0TUGEGj
        0sQdaBHJgJAQzuV81lck9YiBBAKsBcHf7EtRDq7gBv6Nado=
X-Google-Smtp-Source: ABdhPJw38QL0MMsI1QDvrJ6werfmaOWJp0etuDg6IVwS5qjqULH4zQoHdbzMef7gIMKwygi1Ba0XKPkTExuIvuCA590=
X-Received: by 2002:a5d:8f0b:: with SMTP id f11mr27495694iof.200.1595334064325;
 Tue, 21 Jul 2020 05:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAJK_Yh-KwrrWeGY5s=RKJDhp0gyZBf+LsWCydKSfj0dEAYGHCA@mail.gmail.com>
 <20200720162422.GG1228057@rowland.harvard.edu> <CAJK_Yh_ZAvuSBFdUitkPbzp_L69Fuew7cTKbeTH3X8aJdOJeqw@mail.gmail.com>
 <20200720172951.GI1228057@rowland.harvard.edu>
In-Reply-To: <20200720172951.GI1228057@rowland.harvard.edu>
From:   =?UTF-8?B?U1pJR0VUVsOBUkkgSsOhbm9z?= <jszigetvari@gmail.com>
Date:   Tue, 21 Jul 2020 14:20:27 +0200
Message-ID: <CAJK_Yh8rPPMkxXLAyQDN7Ux=_NKcfvHgb1iyt7bZmej0q4P-Qg@mail.gmail.com>
Subject: Re: linux usb gadget - mass storage
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

Alan Stern <stern@rowland.harvard.edu> ezt =C3=ADrta (id=C5=91pont: 2020. j=
=C3=BAl.
20., H, 19:29):
> 4.19 is a very old kernel.  You'd be a lot better off testing under a
> recent kernel, like 5.7.  It also would be more convenient to do your
> development on a regular PC instead of a Raspberry Pi.  You can use
> dummy-hcd for testing gadget drivers.

Okay, I put together a Slackware-current based VM to conduct the
development work on.
I compiled a patched version of kernel 5.7.9 with all the necessary
config parameters to have USB gadget support with debugging enabled,
and also the dummy HCD.

At first loaded the g_mass_storage module with a smaller ~700 MB iso
file, and it loaded seemingly fine, and functionality-wise it also
seemed to work fine, although there were frequent periodical debug
messages about the gadget returning command-failure status:
https://gist.github.com/jszigetvari/5bc4cdc8c55588907b71832558cb00a7

After that as a test I tried to dd all the data from /dev/sr1 (that's
the device file the gadget was assigned) to /dev/null.
The process completed without any user-visible errors, although the
failure status related messages kept on appearing:
https://gist.github.com/jszigetvari/ffa19850c94f12510c0b78ed5aaba2e1

Finally I tried to load the large, 11 GB CentOS iso file as the second
phase of the test. On the Raspberry Pi (with kernel 4.19) this was
when the crash happened, however this time it did not.
Originally Tiziano Bacocco's patch came around to be the time of the
3.x kernels. The patch needed minimal adjustments to apply to 4.19 and
5.4 and also to 5.7.9 (though there was a one line offset in
f_mass_storage.c).
https://gist.github.com/jszigetvari/5a9796c8af8a01c0edba6a8696540029

Although I have to admit that on the Pi Zero I was using the g_multi
kernel module, and not g_mass_storage I assumed they share the same
code base, so they should work the same way.
On the Pi zero I need the extra serial and Ethernet interface to have
access to the Pi Zero, as it doesn't have a wireless NIC, and that's
why I chose g_multi.ko.

In the end I did a dd with the 11 GB iso, and to my surprise it worked
well. dd returned without any errors and it did show the true 11 GB
size when it finished.
In the kernel logs most log entries were about block reads, but the
failure status messages were still around. If there was no activity on
the device, then they accounted for the majority of the logs
generated:
https://gist.github.com/jszigetvari/a9225fa3173e6c7b7b50673a494d9c37

I have to admit, I stand puzzled why it worked on an x86_64-based
machine and crashed on the Pi Zero.
I guess the next step will be either:
* to try using g_multi instead of g_mass_storage on the test machine
* upgrade the Pi Zero to run kernel 5.4.x (AFAIK that's the latest one
can get from the Raspberry Pi Foundation's git repo), and recompile
that kernel version with the patch applied. (This will likely take a
few days.)

Any further suggestions would also be welcome!

Best Regards,
J=C3=A1nos

--
Janos SZIGETVARI
RHCE, License no. 150-053-692

LinkedIn: linkedin.com/in/janosszigetvari

__@__=CB=9AV=CB=9A
Make the switch to open (source) applications, protocols, formats now:
- windows -> Linux, iexplore -> Firefox, msoffice -> LibreOffice
- msn -> jabber protocol (Pidgin, Google Talk)
- mp3 -> ogg, wmv -> ogg, jpg -> png, doc/xls/ppt -> odt/ods/odp
