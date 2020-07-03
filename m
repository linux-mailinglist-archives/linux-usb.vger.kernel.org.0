Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6B6213497
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 09:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgGCHD4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 03:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgGCHD4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 03:03:56 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E18C08C5C1
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 00:03:55 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id p25so8820615vsg.4
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 00:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ic2rTkoYge6yLtMd1ww4/hcyxp6rYKodmH0nWn8CSKw=;
        b=ho6w9qOpXuPrQ6fDWl60IL+C/HOs61X1I7Zc8bjLzMLR/+z0xmOu6CI4tfdmzJkrU/
         ZDo6D5/n078gZB4UWU+Ccx+J3rFDTTCORRyWk1wZCWyMJarodXhWxv68aGCQyfuVfFTX
         4N2UP4yBBefNROCSVZ9N5Rr6Oq9wu7vxb03Ia77NwkEwXDFSMGOKUWv3cLXQxbrEzcIO
         168bgaTdPfSRkjHSy97bhyw3ea+m6PQV33WjZBfne0LiYIVQQOv7aPD+rJeQ2u5OsG4S
         Ff0fYmax5F1X7nNVtEpcaeMnAg8wZ6bveGFbGJ4vDMJ7TbEK0Z7m/EiT5q0ax075XFpD
         B2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ic2rTkoYge6yLtMd1ww4/hcyxp6rYKodmH0nWn8CSKw=;
        b=bvhzdZ5/rJp06+s8AC3xgTWxI3gLBO99snmnNu8Y/VsOValhABjOcQEPOFU/DAxPTd
         srzE5E/c+Gk94JF5+0/lDu9fwdRwRw0DvGEJ/sq/eFyiaCcPTuUoDKWpRjiED3QZSRxg
         fqA5sKCS+pSvSoaXGY4TFo1n9i2+6a1s4txW8J3rlCj3UNo2kIxtfEfqIz4K2igc+80S
         NguZ2RjbP2Nl1oz3kald74adbHx/n3nsIDVsMcnXvQlv0azoK8fihAYAj/C/ZESa96gP
         nHkhsJ32/MlgzgmmnBO4kOLP9ZLasMujj+Lg7va2u8LkKcMfGO6EMXNEemymX3xjs669
         7Kww==
X-Gm-Message-State: AOAM531hv+sOV5NI4Vr9gxp6V5CQW5Ib6fLGH5l4M40j1K6jJOTVKOg3
        CwHMK+8xus3UTs00oRaxmO+6ZYT7dben2FTN9WoaZujr
X-Google-Smtp-Source: ABdhPJyxs8NY5w+tYoVM9vLFKsuJdoQPfRIHH7RTrNoKtaBheEOt4xuIFvWF+N7UtctJ2p3JpZG3qQzTBU9Id5WIEKM=
X-Received: by 2002:a67:69ce:: with SMTP id e197mr11914234vsc.143.1593759835008;
 Fri, 03 Jul 2020 00:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAL-1MmUi6OajEYNuP+OOEeekesZJjAGP-8VDSjGydXAMEFHhMA@mail.gmail.com>
 <20200703060013.GA6188@kroah.com> <CAL-1MmX7xKjYUUAgSGfJ7roi6W3ucD+oyQT4vmxAaDtJpjU07Q@mail.gmail.com>
 <20200703065715.GA2220026@kroah.com>
In-Reply-To: <20200703065715.GA2220026@kroah.com>
From:   Chris Dickens <christopher.a.dickens@gmail.com>
Date:   Fri, 3 Jul 2020 00:03:43 -0700
Message-ID: <CAL-1MmVnbFk2hw8pBL02WyE1zxdYAUO=_HM0V=gGfh_9e-_QOg@mail.gmail.com>
Subject: Re: gadget: Why do Microsoft OS descriptors need their own USB request?
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>, andrzej.p@samsung.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Apologies, I just hit Reply in Gmail without editing...

On Thu, Jul 2, 2020 at 11:57 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> Look in the older history trees, perhaps it is in there?
>
> And if it pre-dates git, odds are we don't remember anymore, some of us
> deal with thousands of patches a week :)

It doesn't pre-date git--it was introduced in commit 19824d5eee ("usb:
gadget: OS String support") dated May 8, 2014.

Chris
