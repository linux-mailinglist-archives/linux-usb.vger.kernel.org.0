Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39761141E5D
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 14:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgASN6Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 08:58:16 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39038 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgASN6P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jan 2020 08:58:15 -0500
Received: by mail-lj1-f193.google.com with SMTP id l2so31083049lja.6
        for <linux-usb@vger.kernel.org>; Sun, 19 Jan 2020 05:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wjFkDDbAsZjsCzH50yncFrTBX7WuMD2ZXqcZ76ijr1k=;
        b=XOeqQ9EJNc5+1+5gahGdwfTW3dIhAx/PDnYchvh4zjPHIxDQlmaSDt//TWdyfaWOWD
         8fxFC6/ehszBbKjcHBG/PNew+6kOOVQvLhek17BnpuyT1EIiMjsZiFDH2Gd+04SDFGbY
         v0gE47MfIwW5VHepKOwo3PfrdtkZgx3xT0sa4JilKCZ8lTYJUYlh76P0DisF77A8Y6qY
         k1UX83S96p681zdnJc9Gr7Z2wWfKT+iqx2n+WW/fxaFs0ZKJey++MFR6D+u/S/ho6bAI
         tod+KSn4zOyCDlnO4m01W+Rka1w0uq0q769JWhMX6NkBf5CF3FJtRqOMrAfoA0XjpNPp
         Z7Eg==
X-Gm-Message-State: APjAAAVPTHMwU4V1Y6rjMBn0l38XSsVfWiXplaxK8irmztznLVk7GJKk
        n4IYH2f6S5LormOaiK4FiA4=
X-Google-Smtp-Source: APXvYqy1gyPwbN0cvVoEoN9h94mL5anZlx+6gwuKqr3W9bhTaTzIgT9Owy/1ojtOKrrUmRfHOvyFRA==
X-Received: by 2002:a05:651c:1214:: with SMTP id i20mr11298207lja.107.1579442293921;
        Sun, 19 Jan 2020 05:58:13 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id a12sm15256107ljk.48.2020.01.19.05.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2020 05:58:12 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1itB5f-0007B5-4B; Sun, 19 Jan 2020 14:58:11 +0100
Date:   Sun, 19 Jan 2020 14:58:11 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Steve Markgraf <steve@steve-m.de>
Cc:     linux-usb@vger.kernel.org, johan@kernel.org
Subject: Re: Regression in 5.5.0-rc6 for FL2000 USB 3.0 to VGA adapter
Message-ID: <20200119135811.GY2301@localhost>
References: <9cadc6b9-16f7-e072-abee-53ac5c143198@steve-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cadc6b9-16f7-e072-abee-53ac5c143198@steve-m.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 19, 2020 at 12:52:40AM +0100, Steve Markgraf wrote:
> Hi list,
> 
> Commit 3e4f8e21c4f27bcf30a48486b9dcc269512b79ff "USB: core: fix check
> for duplicate endpoints" is causing a regression with devices based on
> the Fresco Logic FL2000 chip, i.e. it is totally unusable.
>
> The issue was first reported on the osmocom-sdr mailing list [1] and I
> can reproduce it on my machine with 5.5.0-rc6, with rc5 everything is
> working fine. By reverting the commit mentioned above, it is working as
> well.

Thanks for the detailed report.

> When connecting the device with rc6, I see the following dmesg output:
> https://steve-m.de/files/fl2000_dmesg.txt
> 
> The output of lsusb -v:
> https://steve-m.de/files/fl2000_lsusb.txt
> 
> Output of the Windows tool "USB Device Tree Viewer":
> https://steve-m.de/files/fl2000_usbtreeview.txt
> 
> Output of the USB-IF USB 3.0 Chapter 9 tests with a version from around
> the time the FL2000 was released to market (passing):
> https://steve-m.de/files/fl2000_chapter9.html
> 
> By looking at the lsusb output, it almost seems like a descriptor
> parsing issue, that now causes trouble after introducing the duplicate
> endpoint testing.

Looks like you indeed have two interfaces (0 and 1) claiming the same
endpoints (0x01 and 0x81), so the new sanity check is working as
intended.

I just took a quick look at the libosmo-fl2k code and it appears that
you claim both interfaces but never set alternate setting 1 for
interface 0, which would enable those endpoints.

Could you see if that's all that's needed to get your application
working again?

Johan
