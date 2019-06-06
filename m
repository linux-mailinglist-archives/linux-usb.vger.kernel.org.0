Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37BDE375EF
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 16:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbfFFOAz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 10:00:55 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40618 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbfFFOAz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 10:00:55 -0400
Received: by mail-wm1-f68.google.com with SMTP id v19so46315wmj.5
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2019 07:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wI0ZnEW6mKaY5avBBKMaDLj8ZU+OOyWjoJYCXR8MbmI=;
        b=rdaKPWQ7EQYxOraH00Fk6ZIL+ruchtORmw4dQuwlPXyozVBEYeGLjMDX/LRBTzJ2R0
         TVu07Fm9M+RxYUNYl4EsbbH5wQzqEzG2yODGgM26gcWjOfgMw4BoEHr3mzPt+2jRWWAC
         1JVXDp7a/ItQZ3u5M1/P5cPgk81tigk2uDgEfmDQFV8ByUM264tFlTOX2g0rPMPhhaMU
         sziTjsQVHkTY2C+d/35LXwBfFt/t8ppKsg12sfh6Gz/npYvEH929SxB3tWTI/hwAoMKk
         uBhwhsey2qx/MBuKwHY+9cxCG0moLAwy7H8OR6Qz25v18dUf38ZCqmUsPorvuN/hGynQ
         T/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wI0ZnEW6mKaY5avBBKMaDLj8ZU+OOyWjoJYCXR8MbmI=;
        b=WvEKGUABt1AM5w8+rjVTjVzVPZ20RPRS7b831zUyvKA/yQyjllTZTfIfwS1PQm1el3
         LiKcAjuEoGzNuvhoTOnjUA66VCfEHGa/jfmJUNxkdKKSLrGlMTZaEYc8muTmHOkB4G5m
         hy2q56QXTlVr1lGlWnxwZ/746WHWSQmOYyS1LWekAxlJckVFQtuqEC3Q/Oc5fJg5kcN2
         6qlJP2wv5wld+yibbBsqDNnfSkWXWnndy8zyN6jOJejXXA9Ulcxo49eoExWMOMG3IvLm
         +VXTI3XHXG7axE0I1AXc7axQRgpl+kYf5N0TYMJvo8K4BDYKnar+s4ZfhuITMy/NNiHc
         d6iw==
X-Gm-Message-State: APjAAAVW5Rep6AB4yfeo0ErkYNleVUU6yKD6HVEbQ5BiI0KwmL6kjDGS
        nDDO1gB0DnVWicUuRaK5Ob6eqUbYew8=
X-Google-Smtp-Source: APXvYqzAl/r7Qf9ly0D50ZwEJ/8aea13bV/2LaelbmqCAHHq07dadXwfNAufOauQ5AIHfb/SCGoiBA==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr110205wmk.67.1559829653418;
        Thu, 06 Jun 2019 07:00:53 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id v10sm2167354wml.27.2019.06.06.07.00.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 07:00:52 -0700 (PDT)
Message-ID: <b159e1518b670d4b0126c7671c30c8c3cb8fffbc.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Date:   Thu, 06 Jun 2019 16:00:52 +0200
In-Reply-To: <20190605173902.GE27700@kroah.com>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
         <20190530132522.GA21005@kroah.com>
         <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
         <20190604054300.GE1588@kroah.com>
         <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
         <20190605145525.GA28819@kroah.com>
         <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
         <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it>
         <20190605173902.GE27700@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno mer, 05/06/2019 alle 19.39 +0200, Greg KH ha scritto:
> On Wed, Jun 05, 2019 at 06:23:58PM +0200, Andrea Vai wrote:
> [...]
> 
> > Anyway, I know that I can do all of this in a better way, and will
> let
> > you know.
> 
> Yes, please do so, your steps above do not show much.

Here I am with another question.
What I have done so far:

- booted with the last kernel I know to be working (4.20.13-
200.fc29.x86_64, installed from Fedora repos), checked that test runs
fine (2min to copy)
- marked "git bisect good v4.20.13"
- built the latest stable version:
  - git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
  - cp -v /boot/config-$(uname -r) .config
  - make -j4 && make modules_install && make install && grub2-mkconfig -o /boot/grub2/grub.cfg
  - grubby --set-default /boot/vmlinuz-5.2.0-rc3 (the last regular file listed in "ls -lrt /boot/v*")
- rebooted with kernel 5.2.0-rc3, ran the test, took 49min to copy
(!), thus marked "git bisect bad"
- built again, and it turns out to be 4.20.0 (why is it earlier than
4.20.13?), rebooted with 4.20.0, ran the test and it took more than 15
minutes so I killed the cp process, and marked it BAD, and obtained:

The merge base 8fe28cb58bcb235034b64cbbb7550a8a43fd88be is bad.
This means the bug has been fixed between
8fe28cb58bcb235034b64cbbb7550a8a43fd88be and
[0f7c162c1df596e0bba04c26fc9cc497983bf32b].

The output of "git bisect log" is:

git bisect start
# good: [0f7c162c1df596e0bba04c26fc9cc497983bf32b] Linux 4.20.13
git bisect good 0f7c162c1df596e0bba04c26fc9cc497983bf32b
# bad: [f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a] Linux 5.2-rc3
git bisect bad f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a
# bad: [8fe28cb58bcb235034b64cbbb7550a8a43fd88be] Linux 4.20
git bisect bad 8fe28cb58bcb235034b64cbbb7550a8a43fd88be

I can understand that the bug was present before 4.20.13 (is that
reasonable?), but how can I tell bisect to start at 4.20.13, which I
know for sure to be working, and not from 4.20.0, which I actually
don't care about?

I am afraid I am missing something obvious, sorry

Thank you very much,
Andrea

