Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DFA4665B3
	for <lists+linux-usb@lfdr.de>; Thu,  2 Dec 2021 15:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240342AbhLBOtg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Dec 2021 09:49:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358733AbhLBOte (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Dec 2021 09:49:34 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569FFC06175A
        for <linux-usb@vger.kernel.org>; Thu,  2 Dec 2021 06:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=VFsEeQKVfwgAjHBhymG6C/DyukKxpb8mwF03t3z3gcg=; b=LpSv6
        37r1bukdk7ro6W3nI2wt7X1jusaCxH/9w+QsfJS7Fu5UQ9Kt7ejWcf5fzLcTL286IO89b4yqJ+UgN
        q7cPmLCqA6/YJXuDa3snA5nug+2/et5z7HKKPMSIag7E7BiThFm1PGVLKqb6IgnksxGo3fOgqJItN
        G1ccV31abDpSagWRLGFCah54Q5PimzFTN7kcsbXFvgZ9A04zym59jeQuyawbiei2l5YgareB/F9in
        aONk1PzBihmydyf2DhM+7ydgNMHF5kN5K4LiNBhsi4QPgNF8QLUrY/oKmdtoBvhf/M1kV9mOqEu8Q
        vcI/jSmMUQvjdgACLLj+q+71U7Bdw==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1msnLd-0000OL-77; Thu, 02 Dec 2021 14:46:09 +0000
Date:   Thu, 2 Dec 2021 14:46:08 +0000
From:   John Keeping <john@metanate.com>
To:     Shang Shi <shangshi@google.com>
Cc:     linux-usb@vger.kernel.org,
        Gabriel Beddingfield <beddingfield@google.com>
Subject: Re: USB: f_fs: Use Functionfs with kernel AIO
Message-ID: <YajcMBF7K1IaCkVe@donbot>
References: <CAJkDvNk4G3WJuitZa+oPuNhkrCPNiwwG-zyNET+urWVWAda+cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJkDvNk4G3WJuitZa+oPuNhkrCPNiwwG-zyNET+urWVWAda+cw@mail.gmail.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 01, 2021 at 09:04:27AM -0800, Shang Shi wrote:
> This is Shang Shi from Google. As we are examining the Andorid adb
> daemon implementation in AOSP, we found that there's a concern on
> functionfs that an io_submit syscall on IN/OUT endpoint after endpoint
> becomes disabled could end up blocking [1]. AOSP kills a thread to
> avoid it blocking on io_submit, which is not an elegant way to exist.
> 
> Is it true that io_submit syscall could end up blocking after endpoint
> is disabled? Would opening  endpoint file with O_NONBLOCK resolve the
> issue?

Looking at ffs_epfile_io() it seems that it can block if the endpoint is
disabled, and indeed there may be a race there between the disabled
notification and the next submit arriving.

There was a recent proposed patch [1] which looks like it inadvertently
addresses this race, but there are other issues with that patch so it's
not a fix for this.

From the code, indeed O_NONBLOCK does avoid any risk of blocking, but it
means you can't queue up I/O requests before the gadget is activated,
although maybe that's not a problem in practice.

[1] https://lore.kernel.org/linux-usb/20211201100205.25448-1-quic_wcheng@quicinc.com/

> From the ffs-aio-example "aio_simple.c", it seems that as long as we
> read and process control events before any read/write (with
> io_submit), we are not worried about any race condition between
> endpoint becoming disabled and io_submit. Is this true?

I don't think this holds, there will always be a windows where the
UDC can change state between reading the ep0 events and attempting I/O
on the other endpoint files.


Regards,
John
