Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C49D465398
	for <lists+linux-usb@lfdr.de>; Wed,  1 Dec 2021 18:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351755AbhLARIq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Dec 2021 12:08:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351745AbhLARIU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Dec 2021 12:08:20 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA5BC06175F
        for <linux-usb@vger.kernel.org>; Wed,  1 Dec 2021 09:04:40 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id t26so64605631lfk.9
        for <linux-usb@vger.kernel.org>; Wed, 01 Dec 2021 09:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=3xbtHLQ36Y+5vGEp/9UkTCRpW18cUdYX1YVrdcqqWuI=;
        b=hDbYsYWUIBW3+z4NOB3FWA0purGXbicE2j1K37VZ2pStnCLxaWrn7edpdCj97mIrhk
         +PLoMb7x0u+Fv/owrCEynvsDOpEVgTw2jD5N/uAhwlcEB3DSqjFi1NRY/nNr9cI05R6L
         OqwGJAGzMxDn8bGl2k8d+CtsykGb2qnTE5iJbUlqrxmJXgsnFY6wkl4sIpRSolJGbD3+
         NDiHGIUCr6w4+1zxgZF4lawfMYSBvKp2i9P1x44Vluoq8VzqTgI4SfVISE5GmHPzSkLW
         Td35zdid55sIQbwkU0x70a7xageDTddTOBapq4wUYP24ZpxPxAe5j3T4t+kmpXjbGz4Y
         tOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=3xbtHLQ36Y+5vGEp/9UkTCRpW18cUdYX1YVrdcqqWuI=;
        b=ouHrtvALs95t6bcyZQdUAef2A20dxCOxKStPHVCAL0xgT1Bm+dbNA6wKN9dqNBy2hX
         JnZulLBn98pK2kulaM0G/TmUQyVxkaNURgQD7admyNXtEMyMyEXmZ1Y94gr8+FY9JXMr
         f9xaeEvNRrMXFIC+bA0UIS3XFLjl3Vik/mLG2cfMA3tqTSk3VcnsE3AExLN5wIBcOKwv
         9pA07bSSJ3uZGppYc6BsgFltRTkCAWLyCXK1STfLcKTfD0V2MbqI0UVpCeG9gWQMwkmN
         Uac+zaX4cACq/+NNOCV+veji2obrG5K2vFioAR85nXn1Ta1YggUFvpXe3b/E71ahIqdV
         fTjA==
X-Gm-Message-State: AOAM532feCaBvUis8pT3hEz7uw/xZ8Qv9mkE3Vuk0qYd/W0dnFwCJp57
        dHEDvL0VUF+bPvCzTW441y9X2QqMZDwWVV0BNVB+YyfbXIJ3XA==
X-Google-Smtp-Source: ABdhPJz0c+SAbpIr4AZ79FAvES+r+q+9ZanmkkIlk+yd2nGiKTxFF7bwkFlkGHRGh1t0Vg0Myl6G/KFhsb8YIP4rDLE=
X-Received: by 2002:ac2:4c47:: with SMTP id o7mr7123835lfk.558.1638378278404;
 Wed, 01 Dec 2021 09:04:38 -0800 (PST)
MIME-Version: 1.0
From:   Shang Shi <shangshi@google.com>
Date:   Wed, 1 Dec 2021 09:04:27 -0800
Message-ID: <CAJkDvNk4G3WJuitZa+oPuNhkrCPNiwwG-zyNET+urWVWAda+cw@mail.gmail.com>
Subject: USB: f_fs: Use Functionfs with kernel AIO
To:     linux-usb@vger.kernel.org
Cc:     Gabriel Beddingfield <beddingfield@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

This is Shang Shi from Google. As we are examining the Andorid adb
daemon implementation in AOSP, we found that there's a concern on
functionfs that an io_submit syscall on IN/OUT endpoint after endpoint
becomes disabled could end up blocking [1]. AOSP kills a thread to
avoid it blocking on io_submit, which is not an elegant way to exist.

Is it true that io_submit syscall could end up blocking after endpoint
is disabled? Would opening  endpoint file with O_NONBLOCK resolve the
issue?

From the ffs-aio-example "aio_simple.c", it seems that as long as we
read and process control events before any read/write (with
io_submit), we are not worried about any race condition between
endpoint becoming disabled and io_submit. Is this true?

Really appreciate it for taking time helping us on these questions!

Thanks!
Shang Shi

Reference [1]:
https://cs.android.com/android/platform/superproject/+/master:packages/modules/adb/daemon/usb.cpp;drc=bbfaaac52f1321d3b9b67e89ab23303510cd2593;l=247
