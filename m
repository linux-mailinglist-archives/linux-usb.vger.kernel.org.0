Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA42BAC68
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 03:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391374AbfIWBip (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 22 Sep 2019 21:38:45 -0400
Received: from a8-21.smtp-out.amazonses.com ([54.240.8.21]:41456 "EHLO
        a8-21.smtp-out.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387843AbfIWBip (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 22 Sep 2019 21:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zp2ap7btoiiow65hultmctjebh3tse7g; d=aaront.org; t=1569202724;
        h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
        bh=Pxg5u6FuwjgB1YzTt5T/maEQQOagOxuJSeL6574+nUc=;
        b=mcKj5WlfQqMpBpqbGOO7hoJgopo4P0EXimwQYYgiYgqMoowgUL+3nw5fM8OnU7ZG
        9wBwJ7BdS8Nsw4K+b2qHnWRtPjCsJRvDuBIG8jXDYh0sdf2V9mCx7LZXmEWGK+jke8J
        9dTtCDtC1QhV5CXH9ouoOLocPtGOIbLh7zPRkI4M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1569202724;
        h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type:Feedback-ID;
        bh=Pxg5u6FuwjgB1YzTt5T/maEQQOagOxuJSeL6574+nUc=;
        b=G9t7Do3h+tusz4PVoaAmuUVJE9FOcqsSCcWPoCUMmbi2u5e871pW27aU1PsPxUc4
        3/1s74h7pcAU+J4XgMJghyLLmnqYMvhuLFN7ZY0r6CxnGPo6nWfF2TcEqIkCPGjBFLC
        XRFnwyvAzUS/hbpLsAx1TBsCYRHKVdZcHRGD2qUE=
X-Gm-Message-State: APjAAAV8tFNY0C/xuLbCmYerMne9Ju8IQ8aULgLged8+vgPsC+N39yfT
        tFuTfr5+R8v07zg98lgTN0CwCnd4nQOrklFpGo0=
X-Google-Smtp-Source: APXvYqxNLAPqW/41jG0jFSuO1+G9n5Ir9ZsxIvThMQWNZQ2r0gjlK3otnV+g50AXNlcP9USmn+khW/dsy3Y/SqLDVGc=
X-Received: by 2002:a0d:c3c3:: with SMTP id f186mr21323762ywd.470.1569202723363;
 Sun, 22 Sep 2019 18:38:43 -0700 (PDT)
MIME-Version: 1.0
From:   Aaron Thompson <dev@aaront.org>
Date:   Mon, 23 Sep 2019 01:38:44 +0000
X-Gmail-Original-Message-ID: <CABeuQhszD1x2G-L9Wk_ri16UsaF7zx0mN=S8_P+BA3i6Y3-Z7w@mail.gmail.com>
Message-ID: <0100016d5bc55d05-d2c923f3-a4bb-4ba7-8adc-031b7d933b52-000000@email.amazonses.com>
Subject: Moschip 7703 USB to serial free to a good home
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-SES-Outgoing: 2019.09.23-54.240.8.21
Feedback-ID: 1.us-east-1.8/56jQl+KfkRukJqWjlnf+MtEL0x/NchId1fC0q616g=:AmazonSES
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I have a Moschip 7703 USB to single serial port adapter that I'm not
using primarily because it doesn't have an in-tree driver, so I'd be
happy to send it to anyone who would like to add support for it. It
looks like it should be easy to add to the existing mos7720 driver.
Anyone interested?

Thanks,
-- Aaron
