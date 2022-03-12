Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6164D6F5E
	for <lists+linux-usb@lfdr.de>; Sat, 12 Mar 2022 14:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbiCLN7z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Mar 2022 08:59:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiCLN7z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Mar 2022 08:59:55 -0500
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD2EF5430
        for <linux-usb@vger.kernel.org>; Sat, 12 Mar 2022 05:58:48 -0800 (PST)
Date:   Sun, 13 Mar 2022 00:58:28 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
        t=1647093525;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=zSdN7nwNYrzBSqWKTF9/We5rMMO7YBfBWLjU2MpLZc4=;
        b=xWRmpX9gqWKBSdDQ9o5OCpYMLCMfZfpm7egj0IPcFa8YzrAS+2jWX0T1VBlqlbGqepsg8x
        XaFiNgZ5ZOb5zYsODicpE7LozbhPPpIvIpC+6F/tNgtKOuurhh6BQShmd81W9LYKRjrx1i
        ehVZuJ/AzmTuuu+cAQahAth61yasp9Sf8QNvkbO+nga8xZyMB5uxaZvdqrwoBCz1vasZN1
        6ANpdEQtdAU1puxHWqm27mO/ZoLBwzcxlzOmwa0Yvo4FTAL5g0bltGpP9N38/492Sd0msx
        qUbtXTtfh7u8nZb8pVYEEVY64MhNvpR60uN24FqUATL3epyfQ2HqrIlYdVEc4g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Jookia <contact@jookia.org>
To:     linux-usb@vger.kernel.org
Subject: acm_port_shutdown hangs for 30 seconds
Message-ID: <YiynBKeGJCMEkgyO@novena-choice-citizen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: jookia.org
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello there,

I've been banging my head against this issue over the years but sat down
and started to debug it today.

When I try to quit GNU screen, minicom or another serial program it
sometimes hangs for around 30 seconds.

To reproduce I do this:

1. Connect an Arduino Micro with stock LED blink firmware
2. Run 'screen /dev/ttyACM1 9600'
3. Type some letters (no response from the board is given)
4. Quit in some way

If I skip step 3 (typing letters), the hang does not happen.

In userspace the hang happens at a call to close() on the TTY, and using
perf and ftrace it looks to be spending a lot of time poisoning urbs in
acm_port_shutdown.
This kind of makes sense to me as there is some in flight data to be
sent and there's no acknowledgement coming from the chip.

I've had this issue with embedded Linux boards too that for some reason
or another have stopped functioning.
The current solution I have is to forcefully unplug the board, but
that's not ideal.

My questions are:

- Is this a bug?
- Can I reduce the timeout somehow?

Thanks for your time,
Jookia.
