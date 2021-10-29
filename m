Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 926894405B3
	for <lists+linux-usb@lfdr.de>; Sat, 30 Oct 2021 01:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhJ2XQn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 29 Oct 2021 19:16:43 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]:38858 "EHLO
        mail-qk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhJ2XQn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Oct 2021 19:16:43 -0400
Received: by mail-qk1-f179.google.com with SMTP id bi29so10915296qkb.5
        for <linux-usb@vger.kernel.org>; Fri, 29 Oct 2021 16:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BDRvnZUE4sqi81I5tqAPBqMdjUr4Q5ab25TOPbUu00E=;
        b=MWuPiVYNz6S4q2Axw+/wXzDqFCPkTIKT52AmfS0boc3937cHv1+Wh8oZGtVErlEBe9
         AGiqcm/6Lsk94kNQArWKwvhxOnAuGJ6uWbPhFznarWhg3LCZgVQiw2kCzn+ACPvLGItY
         YQFFoTTN3ThNX5OIfuMn4q3D4kaQIqz7HHiMhg0XcBz61upSIjIgRxiYfs8GsR2Azi1V
         ZLHV2wUFi3pWr/MiMczq+O0mHZcZKuDJFgvRemmx+hPbOrpBhJ21gkB+AHlnBxDu7m4F
         UsaupTyKcsEDj+swsUJ3Gl3WkCryBkKoMqOqxDB0dZJJDI+CFFVJfJzLL9dzgJ/3fq+o
         Qkqw==
X-Gm-Message-State: AOAM532kGzuiBkNP182U7+dxdhBd6J2x/0AGfAIA2PPhUEC4OYUqasbY
        JkcG+k435fcKBveRAaU4Qw/uPiXh1/A=
X-Google-Smtp-Source: ABdhPJxl6eTPkWwAf6bd1UVDtJ6S0MxknmtkHKLCj0AUZxeMLoKZiGxrMYznb8iJsZVedWLnH5kT0Q==
X-Received: by 2002:a37:f90a:: with SMTP id l10mr11185222qkj.402.1635549253283;
        Fri, 29 Oct 2021 16:14:13 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id t5sm968559qtc.15.2021.10.29.16.14.12
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 16:14:12 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id v29so9285257qtc.10
        for <linux-usb@vger.kernel.org>; Fri, 29 Oct 2021 16:14:12 -0700 (PDT)
X-Received: by 2002:ac8:5706:: with SMTP id 6mr15076793qtw.95.1635549252466;
 Fri, 29 Oct 2021 16:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <MWHPR2201MB1520D45396628364E91A1FA691879@MWHPR2201MB1520.namprd22.prod.outlook.com>
In-Reply-To: <MWHPR2201MB1520D45396628364E91A1FA691879@MWHPR2201MB1520.namprd22.prod.outlook.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Fri, 29 Oct 2021 18:14:01 -0500
X-Gmail-Original-Message-ID: <CADRPPNSrhiwr8jmBb2h4cFYqHtuDKK8rL0i6Bkg7+xEyXJPATA@mail.gmail.com>
Message-ID: <CADRPPNSrhiwr8jmBb2h4cFYqHtuDKK8rL0i6Bkg7+xEyXJPATA@mail.gmail.com>
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
To:     Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 29, 2021 at 4:27 PM Eugene Bordenkircher
<Eugene_Bordenkircher@selinc.com> wrote:
>
> Typing Greg's email correct this time.  My apologies.
>
> Eugene
>
> -----Original Message-----
> From: Eugene Bordenkircher
> Sent: Friday, October 29, 2021 10:14 AM
> To: linux-usb@vger.kernel.org; linuxppc-dev@lists.ozlabs.org
> Cc: leoyang.li@nxp.com; balbi@kernel.org; gregkh@linuxfoundataion.org
> Subject: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to unrecoverable loop.
>
> Hello all,
>
> We've discovered a situation where the FSL udc driver (drivers/usb/gadget/udc/fsl_udc_core.c) will enter a loop iterating over the request queue, but the queue has been corrupted at some point so it loops infinitely.  I believe we have narrowed into the offending code, but we are in need of assistance trying to find an appropriate fix for the problem.  The identified code appears to be in all versions of the Linux kernel the driver exists in.
>
> The problem appears to be when handling a USB_REQ_GET_STATUS request.  The driver gets this request and then calls the ch9getstatus() function.  In this function, it starts a request by "borrowing" the per device status_req, filling it in, and then queuing it with a call to list_add_tail() to add the request to the endpoint queue.  Right before it exits the function however, it's calling ep0_prime_status(), which is filling out that same status_req structure and then queuing it with another call to list_add_tail() to add the request to the endpoint queue.  This adds two instances of the exact same LIST_HEAD to the endpoint queue, which breaks the list since the prev and next pointers end up pointing to the wrong things.  This ends up causing a hard loop the next time nuke() gets called, which happens on the next setup IRQ.
>

I agree with you that this looks problematic.  This is probably
introduced by f79a60b8785 "usb: fsl_udc_core: prime status stage once
data stage has primed" that it didn't consider that the status_req has
been re-used for the DATA phase.

I think the proper fix should be having a separate request allocated
for the data phase after the above change.

> I'm not sure what the appropriate fix to this problem is, mostly due to my lack of expertise in USB and this driver stack.  The code has been this way in the kernel for a very long time, which suggests that it has been working, unless USB_REQ_GET_STATUS requests are never made.  This further suggests that there is something else going on that I don't understand.  Deleting the call to ep0_prime_status() and the following ep0stall() call appears, on the surface, to get the device working again, but may have side effects that I'm not seeing.
>
> I'm hopeful someone in the community can help provide some information on what I may be missing or help come up with a solution to the problem.  A big thank you to anyone who would like to help out.
>
> Eugene
