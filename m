Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2994237B23D
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 01:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhEKXNI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 19:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhEKXNI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 19:13:08 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27073C061574
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 16:12:00 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id k16so5739601ios.10
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 16:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=9Q8VujYBU1Y8wAtzcq4rUI0zDdMx+3MKB2oWYKooM8Q=;
        b=WHnViNwFJRKTmng48Zn7MOm04yXRv9EZmu7tp41qltLfs6ck9U2mD00cySFECt5JFI
         BZJFaNB28+w4yRolD2t1JBC1yZywaNrzO92huCldvmjHnWiudc21pAInCQaLXIFUWrAw
         NQqdBj+OQk4VjnKmNV27pG437KILO11GVkbedRQgdX3yBbhE2M8kjNgvZeRUbWWt4P+n
         p0yVgYpUjMP8ieN0PvqMDLJ9DpliEvPsNE2bxsBYKJobGqsmxYFR3/+yVlXmingnxIir
         KTNGAHisyXI/HzdWLBy2nZxZEej5fYFKhIo3Cs02MsPDjPR+iu98yeXR1tTiVJ+lk8ot
         V7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9Q8VujYBU1Y8wAtzcq4rUI0zDdMx+3MKB2oWYKooM8Q=;
        b=D5X/aSIvS/C9blhthnpxKlvzv86iU4OBJOLoESCiuQZGxQA8WAtqscfSVru96NQh2a
         OL3FFJGZ7qi9X//Qc5h3VbmwO8PdKHdaIL/22wT2Cs5Jed6YVLgtxV2pIWgIhDfeaXP8
         8eDXmYfVXUQDuzV5/x/bQ9I5W4KLoPqtjQHhMaBXMVtPV/BXIVhJ5MdQE0RsOWMYyWEM
         J92YdgUFt/fBzzQgVHxX5ghtFNs+adcYprH4ckn/x/Mv5qBHXfwtD18e3sWA1IiEISn/
         MODSmeTypu9OplriFzosRbRDrcZ+83BSQ+cUb9LH5t5rR63/NrTl1JIoa+zrB0YEWcpv
         tzPQ==
X-Gm-Message-State: AOAM533tp/mdks+HWvNiwixz9IN3RZtpH/1KSLMiv068TRZfhvReGOiW
        Rt50wOVvxMRfy1tCPCyXEOuZDDsqty94Zpds6vbX/9o/Ryg=
X-Google-Smtp-Source: ABdhPJzaUHrJExWnYtlGF0aV/6suElUR2CbxTkuGyavjXFdGWhRtgbBDmLldGSOwP6C5hXyQj+M/cEAX1A4En7GR2RA=
X-Received: by 2002:a6b:5402:: with SMTP id i2mr24244987iob.66.1620774719616;
 Tue, 11 May 2021 16:11:59 -0700 (PDT)
MIME-Version: 1.0
From:   Rafael Waldo Delgado Doblas <lord.rafa@gmail.com>
Date:   Wed, 12 May 2021 01:11:23 +0200
Message-ID: <CAAepdCZcGtCSKTUzkGyAZ2qM5HNRG9cec+9GPPNX-=w03QOfzA@mail.gmail.com>
Subject: "GET_CURRENT_CAM command failed"
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I am getting the error "GET_CURRENT_CAM command failed" each time that
I start my laptop. After track down a little bit this message I could
find that this has something to do with some ucsi version check:

https://elixir.bootlin.com/linux/v5.11.18/source/drivers/usb/typec/ucsi/ucsi.c#L203

I think that that the message should be out of the conditional "if
(con->ucsi->version > 0x0100) {", so the error is logged when actually
happens. I am supposing that case version > 01.00 it should just
return without update the curr altmode.

Also, I was wondering why only versions under 01.00 are supported to
update their active altmode. The command looks the same in the specs,
why it fails?...

About my set up, I am using two external daisy chained DP monitors
connected to a single USB-C hub without too much problem... just from
time to time when waking up the monitors doesn't turn on and I have to
disconnect and connect the hub but not sure if this is related to
this.

Kind regards,
Rafa
