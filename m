Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8453B81215
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 08:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfHEGHf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 02:07:35 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37237 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfHEGHf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 02:07:35 -0400
Received: by mail-io1-f66.google.com with SMTP id q22so45078762iog.4
        for <linux-usb@vger.kernel.org>; Sun, 04 Aug 2019 23:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=whdl1mEwmiB1uqZt5vOyJDG9JwPXDna4vr8UUq7q2fc=;
        b=sg/NU8X3itWcvdU+/pjHp+HjeB+wAHrGff6wK8rXZoEzsZ4uiRygKOkPq1jr9KciP+
         Hh0jnC491xGYj6qf1fNs7wxQma7SK94k61tCZzyRhfThm10LmctruL959VhW2GP/CvdE
         dspqt3JQjnk0hr4b+B11CsLXgqUjBl1035ZkUTIYOsD1E7i7NJaOx2Jnm5EtKr+qKilh
         xDpbyzmUm+b5sO/1e9HSEhI5FEmpF4orIdfFGSwcGWB1eVBMmeeBpf+HiWfJ2bb+dry5
         L4L3ItnHKLgyf6hP3XOm2TLlqiEvThuuEmDJ6yf4aswFj1unGZEewmFs1wzZmry9c6Ut
         3B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=whdl1mEwmiB1uqZt5vOyJDG9JwPXDna4vr8UUq7q2fc=;
        b=S3V2UDEGztH7pGmFSilAqhIpz29Qjylj1/bVt6jyKkpHqblxtpoEb3UjEwNCmPYxUS
         VoaaHD9bUxKhAJDR+nXoKwGYxbwB3xaj92TjTklKNmUNb4MkMtZwqnbALmjJnpSGrUw3
         Tnkp8r0IrsoZ/8d2c08MAbKQ1vuCAS8wgLHIOUnvfP9SxoPti8YCnk84Y1saTPPkhYS8
         NCxgQj6bTdY9QCH3NkVZ8OId+6khAozkvd0DaKMUsNaYIOYm80q/MvOlUvuP3Amc/DNR
         3EMspq3XX6wt8DOHDgLMAN1n+WXyNgqFX+zuFTBniu7sn2vwvo60dm19vQY/dx0i8STZ
         4+RA==
X-Gm-Message-State: APjAAAWz9Jgy/QbaRhMVGsy5h+qj8582F2kDeprAheOvjtrF72wDTOxt
        mjHxk99/Ln2//CjmcGDxFvCUcMSnOB4S9S9Ufbjyj0bE
X-Google-Smtp-Source: APXvYqw6PCntRqDuiOL3d2vi9QLgZ+Sahu6epBvsAIXrRS6EvX6caNdJRT1UqJwuXX6RmtMyvgBVn8HA6LhidqCP/q8=
X-Received: by 2002:a02:c549:: with SMTP id g9mr18131010jaj.14.1564985254903;
 Sun, 04 Aug 2019 23:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190802200325.22897-1-evan@gnarbox.com>
In-Reply-To: <20190802200325.22897-1-evan@gnarbox.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Mon, 5 Aug 2019 14:07:23 +0800
Message-ID: <CAL411-q1Hxkh+i3WRcAPM7QZ_yC-96jBfAx-t4PRJH7Cs1fvjA@mail.gmail.com>
Subject: Re: EHSET USB testing
To:     Evan Gates <evan@gnarbox.com>
Cc:     USB list <linux-usb@vger.kernel.org>, rob@gnarbox.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 4, 2019 at 10:45 AM Evan Gates <evan@gnarbox.com> wrote:
>
> I'm trying to get my device to pass the EHSET tests.  I found the thread
> "Using EHSET module" from March.  I'm having similar issues.
>
> I don't have access to the PID VID board that the lab uses.  Instead I'm
> using another computer setup as a mass storage gadget but set the VID:PID
> to 1a0a:0102 (TEST_J).  If that sounds like a problem or there is another,
> better way to do this please let me know.
>
> > The usb-storage driver bound to your device first.  Try building a
> > kernel without that driver and then it shoudl bind to the other driver.
> >
> > Or manually bind the ehset driver to your device through sysfs.  Read up
> > on the documentation for the "new_id" and "bind" and "unbind" sysfs
> > files for how to do that.
>
> I did this.  I was able to unbind from usb-storage but binding to
> usb_ehset_test failed with error -32 (AFAICT EPIPE).  I tried both the
> usb_ehset_test/bind and usb_ehset_test/new_id methods.  In both cases
> I got the same error.
>
> I did another build without usb-storage.  Now I don't have to go through
> the unbind step but I still get the same error while probing.
>
>         [  296.089877] usb 1-1: new high-speed USB device number 2 using xhci_hcd
>         [  296.271081] usb_ehset_test: probe of 1-1:1.0 failed with error -32
>
> I notice that it says "using xhci_hcd."  Is that a problem?  Does it
> need to be ehci?  I tried a build without xhci but that caused other
> problems for me.
>
> 1) Can I use a computer in device mode to present a VID:PID to get into
> EHSET mode?  If so how should I do that?
>

Afaik, you can't. No Host computer will act as USB device. You may try
to configure your box as USB device mode, for gadget driver, you could
using legacy g_zero module, or source_sink function using configfs.

> 2) What else do I need to do in order to get my box into EHSET mode?
Only thing is your box need to be at host mode. For testing USB2 for xHCI,
the mainline code should not support TEST_SINGLE_STEP_SET_FEATURE
at my last access.

Peter
