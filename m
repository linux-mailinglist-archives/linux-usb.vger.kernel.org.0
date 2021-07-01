Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53B43B8E05
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 09:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234556AbhGAHEj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 03:04:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:44022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234529AbhGAHEi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 1 Jul 2021 03:04:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B131B6148E;
        Thu,  1 Jul 2021 07:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625122928;
        bh=QnmOSSP0yBbSTQ8JVvSdWtCs1f718sQIZoHqZqnZ83c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hWxQJbHgkoHl9CPJInueoI23tslegpNvTxu90uRDZFFDAU3H14e/tyJWudVyHEGEQ
         SC2LJdmSixOoJqDB8qvApWTlOP3f0SzbYJQ3AAKQYpxtkRMc0hjajZAwaGjNBtorav
         MSaTbt7kkfZQm8mSBYS2CZ82mNzVNluzMiq+PWFA75q0M7YkvMZ3QtosnoZW8U9Hmo
         KEyzPA53AAFo49nXQoBmzl0sueuY/uGhkuczWNkisZweOpXWfYuPrTDNNvplq9UUN6
         r7POtZxCDUqLhSpKbfpxJ0oQub2XkEsm46L8S85/RbzcIfocBuRZGmPGc4cJISuJ+R
         J0gLMww3sUdZw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lyqi4-0005Z3-FR; Thu, 01 Jul 2021 09:02:05 +0200
Date:   Thu, 1 Jul 2021 09:02:04 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tung Pham <Tung.Pham@silabs.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Pho Tran <Pho.Tran@silabs.com>,
        Hung Nguyen <Hung.Nguyen@silabs.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: patch "USB: serial: cp210x: add support for GPIOs on CP2108"
 added to usb-next
Message-ID: <YN1obE99oebXaD24@hovoldconsulting.com>
References: <1624532158188214@kroah.com>
 <PH0PR11MB4888B9D24A5F90E8AA02B28B81019@PH0PR11MB4888.namprd11.prod.outlook.com>
 <YNxCBreFm7uisstJ@hovoldconsulting.com>
 <CO1PR11MB4882C876E69D61C52C42DAB981009@CO1PR11MB4882.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB4882C876E69D61C52C42DAB981009@CO1PR11MB4882.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 01, 2021 at 04:58:09AM +0000, Tung Pham wrote:

> >Are you sure you're using the latest mainline kernel here, that is,
> >5.13 here?  With recent kernel's you would not see -ENODEV ("No such
> >device") but rather -EINVAL ("Invalid argument").  What does "uname
> >-a" say?
> 
> I use the kernel 5.8.0-59-generic, I think either result ("No such
> device") or  ("Invalid argument") may be accepted in this case.

Yes, you should be able to apply this patch to older kernels without
many additional changes, but you should still mention which kernel
you're using since backporting may not always work as expected.

> >And which version of the patch are you applying? Are you sure it's
> >the latest?
> 
> I apply patch V13 from last mail that you send.

Good.

> >> But when I test the branch of Mr Gregkh.
> >> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/dr
> >> ivers/usb/serial/cp210x.c?h=usb-testing
> >> root@ubuntu:/sys/class/gpio# echo 496 > /sys/class/gpio/export 
> >> root@ubuntu:/sys/class/gpio# echo 497 > /sys/class/gpio/export That 
> >> mean it still use GPIO 0 and GPIO 1 as GPIO functions.
> 
> >It does seem that way, but to be sure, do the
> 
> >       /sys/class/gpio/gpio496
> >      /sys/class/gpio/gpio497
> 
> >directories show up as well?
> 
> Today I retest it and it seem everything is ok. May be previous test I
> have some loading driver problem. The result is as below:
> 
> echo 496 > /sys/class/gpio/export
> -bash: echo: write error: Invalid argument
> echo 497 > /sys/class/gpio/export
> -bash: echo: write error: Invalid argument
> tung@ubuntu:~$ /sys/class/gpio/gpio496
> bash: /sys/class/gpio/gpio496: No such file or directory

Very odd.

Were you using the very same device in both tests? And did you try with
the older kernel before the new one? Perhaps the new settings had not
yet taken effect otherwise?

> >I just did a quick test using the code in the usb-next (testing)
> >branch and it seems to work as expected when hard-coding alternate
> >functions for some of >the pins in the driver.
> >
> >I did not actually reprogram the device so perhaps something is
> >broken with regards to reading the port configuration. But then you
> >should see the >problem if you apply the patch to an earlier kernel
> >as well.
> >
> >Can you apply the below patch on top of Greg's usb-next (or
> >usb-testing) branch and send me the logs from when connecting the
> >device?
> 
> The log written is:
> [ 3599.781531] cp210x 2-2.1:1.0: cp2108_gpio_init - 03 00 00 00

Thanks for confirming. So everything appears to work as expected, and
you should have seen the expected -EINVAL unless the device actually did
return all-zero here for some reason.

Johan
