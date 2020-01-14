Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE00813A06D
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 06:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgANFK1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 00:10:27 -0500
Received: from mail-ed1-f53.google.com ([209.85.208.53]:37125 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgANFK1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jan 2020 00:10:27 -0500
Received: by mail-ed1-f53.google.com with SMTP id cy15so10737462edb.4
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2020 21:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=38Xn5kkjNYpVa4hSEP0Dvfr334vAHZFF4EBH/4eeS2g=;
        b=AJBvN93Clt7AXeC4wGzcv7R7aRK0SWOurB2FdZwiOokT4ZPdEACSed/wtcwcvACRij
         hwm5rD3R5ImdGi9F3loTyJMnUbYW/in2SMMKOuQkehpEbqgeHCx9c31YJWZhUVORkiVa
         6l8X8wAlOYnrCqkjZZGjIDb+WfEC++whLRxn4LOIhyUutX0vfLj26PXFMieMCB8DNRUc
         rl9OKNoMw8kOBihA5b5rEpFe0zogij+vnAyOOb4l8y4uxIf3PCPZTe7V1Nl9Bz5AbN53
         zrI9Xq7yKUlSwbr0K4e94HnZroZDT3Acb+wr36viZ5mzZhyRAuRJeyR8maBuq/ps2KDQ
         KFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=38Xn5kkjNYpVa4hSEP0Dvfr334vAHZFF4EBH/4eeS2g=;
        b=QmkNrggXAyi+KMB6uVc8ZQyDbEqhUN1TEXzuEMV3jmleXB5Q396vL/W+V04EPzubkr
         0AP8mmE2HRcGmwEobbCyKfYr8OmNYQSKMAHjlc1AtN44lAt0UR9gKovIWcgd+q3s5TTf
         7DEbNrcfovkDRIPxvDjIzK1Jn+PBYtaPl4+qSSeQcBvEYX3S93QNHk+ziY8CdKi9FrwV
         XPyPKDkB4EpHvLKABHH9n+/4RUJzZK8n1ByoR9bekwL3CHjM5aYr6MavEATF5P5diSq0
         YSHfdBi1ugm6JpYL+NcSNC6xk0zglPFCJS3yw+SbP8DKXgLBuGPkA6jtb+bjC7AX2wbl
         9/+Q==
X-Gm-Message-State: APjAAAVobV+AvGkcaZL6IBBqoyn5wwmlRiDJ0LB7ff2EH2DYjLlo1Hrn
        MR+ZQF8tMj1ZDX7VgAmO/zqjDD/pFkNlWdeitQg=
X-Google-Smtp-Source: APXvYqydYL/cw57ZCAC4BimfO+oATU+OBAwP/s3zh8YoLYsVmXmwMhcyopc8O3Ezswa1nSgeJiDD98iqkOjYS6nNvzU=
X-Received: by 2002:a17:906:80d8:: with SMTP id a24mr20552035ejx.84.1578978625201;
 Mon, 13 Jan 2020 21:10:25 -0800 (PST)
MIME-Version: 1.0
References: <CAPXMrf_d_uKZbohYWfO8rVEg7voBhESesU0w8Ng0M=wsw_75FQ@mail.gmail.com>
 <1578923319.2590.13.camel@suse.com>
In-Reply-To: <1578923319.2590.13.camel@suse.com>
From:   RAJESH DASARI <raajeshdasari@gmail.com>
Date:   Tue, 14 Jan 2020 10:40:14 +0530
Message-ID: <CAPXMrf8PJ=+CG9TqazvbDPL1WkRNQHVTHOowr=Y_a09ULAyscw@mail.gmail.com>
Subject: Re: Reg: USB network interface is down after the reboot
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Oliver,

Thanks for your reply, Please find my response inline.

Thanks,
Rajesh Dasari.

On Mon, Jan 13, 2020 at 7:35 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Donnerstag, den 26.12.2019, 15:01 +0530 schrieb RAJESH DASARI:
> > Could someone please help, why the usb0 is down on Device A side and
> > it there is any known issue or is this  expected behaviour?
>
> Hi,
>
> the kernel cannot just set devices running. Does it work if you up
> the device (with "ip" or "ifconfig")?

Rajesh : if i make ifconfig usb0 up on device A side, device is coming
up and RUNNING bit is set,

Your device on side A has no
> IP. It cannot work.
Rajesh : If i assign the ip address to the usb0 interface then also
interface is coming up and RUNNING bit is set.
 We need to determine whether this is a kernel
> issue or your setup in user space.
Rajesh : If  i don't run ifconfig usb0 up or if i don't set the ip
address it is running bit is not set. Is it the standard behaviour.
Could you please tell me how to find out it is a user space issue or
kernel issue.
>
>         HTH
>                 Oliver
>
