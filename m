Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41765381C0D
	for <lists+linux-usb@lfdr.de>; Sun, 16 May 2021 04:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbhEPCS1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 22:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbhEPCSZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 May 2021 22:18:25 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDADC06174A
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 19:17:10 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id k19so2533081qta.2
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 19:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=+Ty0PWWKNFcSCSpMAU3miWWjfwY9Yvb0opOWjI/pk78=;
        b=YiKHn0K2q/iSVLItplxDE0gpgvgXOocJUK86LygsSngCcrAE4zaXKV0xHTMQ/SwRQg
         u+O33cmCh6B/UZBfELUKAIDQJ371AhPUnrO87lMAg4MEr+uQFJKuuRwhIE31FXEsMMcp
         KVr9Yzrt++pS32o6K/JBwVn8U+l03yRo4E9578IOwZfpQPGj8+aih1aoB/NqgnnaMXNj
         qcLwh8xXcRC6TtqIak+yx3/WVkOTsbupbp1K2ReWUwk54E89ojg0b+TXnEEhOaCMppL0
         QWgE16CupG4S/ziujSfeq5rwseEhub3sVFcuF9eg2eYpFDjZuLdDSorDkOrMOjz+yd+o
         BjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=+Ty0PWWKNFcSCSpMAU3miWWjfwY9Yvb0opOWjI/pk78=;
        b=X9d+qsQwvIUWuPdVR5EGwl7r1FPaBmNYr/TU4HMH3/tJgfS9DKcHoAz6fFyiuMhzDJ
         BiKSIHIZ/aGr/JzI0yxGs4HROFb9RZ7KrSjZT6D7pDXKLzvxT72+qTyZc7D7VmpVhfsr
         L4kfamZKTTN7vTxVLn4/h5g7249SzXBbFBnhUBfD7z7k2yhbAvI38y+F/fyb00T2A/M0
         /UfIry0jIClra9waNOEtBJD+6y1Z/m0xwWQmcF7pp0SfW9X0EEgxLGx7ZYjWqQYJ7Osz
         w5U94bvEeGQpdluHnS8UK8nP/N2xFJttDnTev7mb1V4b0L56GBefW9y33PSECNB/vFkv
         uG6A==
X-Gm-Message-State: AOAM531iAR/UpxP2wouRbBTzGGN60fpjEmpb0B8qOROuz2IMZ82/L9ya
        oiiGGgkFSwH4wGH2L4ADDtZshmISbbypLQ==
X-Google-Smtp-Source: ABdhPJw+LnoEg1B21hM7zEN7Hx0xrxgc7l6mgYMli04WIEMLm3seAGY5SygS9WHj3FRLLZVfMT96lQ==
X-Received: by 2002:ac8:570f:: with SMTP id 15mr50161394qtw.309.1621131429406;
        Sat, 15 May 2021 19:17:09 -0700 (PDT)
Received: from hyperion (rrcs-162-155-247-51.central.biz.rr.com. [162.155.247.51])
        by smtp.gmail.com with ESMTPSA id 44sm7695614qtb.45.2021.05.15.19.17.08
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 19:17:08 -0700 (PDT)
Date:   Sat, 15 May 2021 22:17:07 -0400
From:   Dominik Winecki <dominikwinecki@gmail.com>
To:     linux-usb@vger.kernel.org
Subject: xHCI over-current causing pm loop
Message-ID: <YKCAoxmr+7bVo63X@hyperion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I've got an issue on my laptop (Dell XPS 9570 with an i7-7700HQ) that
I'm trying to fix. Multiple usb ports are reporting over-current, despite
nothing being plugged in:

Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 002: ID 138a:0091 Validity Sensors, Inc. VFS7552 Touch Fingerprint Sensor
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Two kworkers running runtime pm are trying to suspend the usb 2 & 3 root hubs.
The xHCI driver will not suspend a hub with over-current triggered
(since e9fb08d617bf) so it fails, resumes the hub, and pm tries again.
This is taking two CPU cores, but it stops if a device of the same usb
version is plugged in, or if I set the power control policy to on.
Also, this is blocking system suspend, but that's expected behavior.

Reverting the e9fb08d617bf check fixes both issues for me, but that may cause
system halts in other systems. Making it a non-retriable suspend failure
stops the kworkers but then it will never suspend after an OC event.

Does it make sense to fix this in the USB driver? Or is this a PM issue?
I'd rather fix my over-current issue, but taking two cpus whenever xHCI has
a no-device over-current reading seems like a bug.

Thanks,
Dominik
