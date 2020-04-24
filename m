Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C961B7F6E
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 21:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgDXT4q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 15:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgDXT4p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 15:56:45 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9838AC09B048
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 12:56:45 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id w3so4126984plz.5
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 12:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I8bnmrDOav0ISmc4AdfKKhK4ImeTGQjkXnzufyc2sFo=;
        b=mvNa78l4kee9H2IlLdd5842jBSL2f8W2BBmhuoitF6gOv3KBtqQqlQjQa/3yTFJtQv
         zK3ASYb2e1dOxra4mdS/X5jQuf2UGBoc0QhxLYvMahW9mOFObmttmTAGvvWxCcBirLZ7
         jf1ou6Oh5l5fh6mA+EgT9kvCkIMdupZltx0VjQHXGY5fRmmK1USx8Ae7yfMsy1ytg4z/
         zCG7u/UQsvNjHRPri1FNxP9heP/qcVs4pCKAl394bjhdPhCQkMoUyEqBzBGDcx6dL8Sj
         AVUo4OZaweaBbPcBnVPmQ4jPDuoeZNKbDlgWVtMTvlrQlKJ7NPmS5UQ67tIYLv9zYx0K
         3wXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I8bnmrDOav0ISmc4AdfKKhK4ImeTGQjkXnzufyc2sFo=;
        b=Lcldubb+lI8GuUzSf/4+PvUCPEJdt20UAWz8qRMYEC51K0PeN7WGQXNBOhiIcxWu8T
         lHg/0nH2Gk4eujzYRlTVZU6zp0CtHEFxwA0AQ18lcXz55iiRcleLFCA9c6/dFa+EG8PW
         To6WN1iOeroAx/iWDIfiUmVp/wNMNfp3EyA7eiY9nE6zyEfNUDweekEHOeVZvaomRwaF
         7BYONtTxsuNBg8hVPwRB/ErzzCTcQ+XBoB/ryA1U/ZzKW7OJHpvLt1DMRZKD0M9R8HUa
         qc2WRqD2bDQr53LIftSXNefMuHrxZXwWGzDWenfX0Y2ZJKmJb3UuGcfX/O7OHTojaXfu
         ALZg==
X-Gm-Message-State: AGi0PuZm3Zn+oTmVpCX/gjIDd0YSbo6EfHbPqZqG6E/4DREJQtPUhE52
        aInOepFli8yQVFIMfoHg7FKPTlYlHK61dLTD2730vA==
X-Google-Smtp-Source: APiQypLOCDgfwYanbQ/JxC9nEpjlMHTiru5rKqc4TN7EOWXlf+ZDQ/pOx8EOwMVWN39QDhgrIoo8+Y3DkhGPeebe0E0=
X-Received: by 2002:a17:902:9889:: with SMTP id s9mr10067842plp.252.1587758204889;
 Fri, 24 Apr 2020 12:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+x7Fihwriocp8Kpr+AQks6h3syZa+g0Wd+Q62fg-y93Lg@mail.gmail.com>
 <Pine.LNX.4.44L0.2004092015180.30065-100000@netrider.rowland.org> <CAAeHK+wYc1De7AN12mkkjDsx-PJODOAvBCOtcDSykSjq6gwCNA@mail.gmail.com>
In-Reply-To: <CAAeHK+wYc1De7AN12mkkjDsx-PJODOAvBCOtcDSykSjq6gwCNA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 24 Apr 2020 21:56:34 +0200
Message-ID: <CAAeHK+z1O4KgCnxrpD9yvYFUGybNmKPHVEcHetuQHz2J9V4n4w@mail.gmail.com>
Subject: Re: Testing endpoint halt support for raw-gadget
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 24, 2020 at 9:36 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Thu, 9 Apr 2020, Andrey Konovalov wrote:
> >
> > > Hi Alan and Greg,
> > >
> > > I've been thinking about what kind of features raw-gadget might be
> > > missing, that would allow more flexibility in emulating USB devices.
> > > One of the things that is currently missing is halting endpoints.
> > > Adding this functionality seems to be fairly easy, but it's unclear to
> > > me how to test it. Any suggestions?
> >
> > You should use the usbtest driver along with the testusb program in
> > tools/usb.  Of course, to do it you will need a userspace driver for
> > raw-gadget.  usbtest works best with gadget-zero, but it can be used
> > (in degraded form) with any USB device.
>
> Hi Alan,
>
> I've started working on a test suite for raw-gadget based on the
> usbtest module as you suggested and have a few questions:
>
> 1. (Re test #10:) Currently there's no way to stall USB (control)
> requests with raw-gadget (which is what happens when you return -EPIPE
> from gadget's setup() callback AFAIU). Is stalling an important part
> of the protocol? Should we somehow support it? AFAIU gadgetfs also has
> no ability to stall requests that are passed to userspace.
>
> 2. Re test #4: the test fails with length that is not divisible by
> endpoint's max packet value when using dummy_hcd (assuming that gadget
> keeps queueing URBs with max packet length), as dummy_hcd's transfer()
> function sets status to -EOVERFLOW when this happens. Is this
> expected?
>
> 3. Re test #7: the test fails when e.g. vary parameter is set to some
> odd value when using dummy_hcd. AFAIU this happens since dummy_hcd
> doesn't have no_sg_constraint flag set and therefore the sanity check
> in usb_submit_urb() fails. Is this expected?

4. Re test #13: it seems that both dummy_hcd and the UDC on Raspberry
Pi Zero handle host driven endpoint halts themselves without any need
to support them on the gadget side. Thus this test can't really be
used to test the halt implementation I have for raw-gadget. Are there
other ways to test it?
