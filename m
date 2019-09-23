Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E430BB8C9
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 17:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732772AbfIWP7y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 11:59:54 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:58746 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728464AbfIWP7y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Sep 2019 11:59:54 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 871DCA125F;
        Mon, 23 Sep 2019 17:59:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id yw4diq2wE7e7; Mon, 23 Sep 2019 17:59:49 +0200 (CEST)
Received: from jgoerzen by hephaestus.lan.complete.org with local (Exim 4.92)
        (envelope-from <jgoerzen@hephaestus.lan.complete.org>)
        id 1iCQkd-00076T-7T; Mon, 23 Sep 2019 10:59:47 -0500
References: <87woe37prw.fsf@complete.org> <87tv967nog.fsf@complete.org> <20190923102012.GZ30545@localhost>
From:   John Goerzen <jgoerzen@complete.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Linux Keyspan USB serial driver ignoring XOFF
In-reply-to: <20190923102012.GZ30545@localhost>
Date:   Mon, 23 Sep 2019 10:59:47 -0500
Message-ID: <87v9tjc8b0.fsf@complete.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 23 2019, Johan Hovold wrote:

> That's correct, the driver does not support software flow control even
> if the hardware seems to have some support for assisted XON/XOFF.
>
> Would you mind testing the below patch which may be enough to turn
> sw-flow control always on. If that works, I can probably find time to
> cook up a proper patch to make this configurable later this week.

Hi Johan,

I gave it a try, but unfortunately that patch made no difference to the
behavior I was seeing.   I'm happy to do whatever debugging may be
helpful.

Thanks!

- John
