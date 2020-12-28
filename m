Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9F72E3FD7
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 15:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505782AbgL1OpQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 09:45:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:51106 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392354AbgL1OpP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 09:45:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1609166668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OvE9AdHw5Z0XmqPst2Bakkv1KCY7ZJBs9rQsAu/qdW8=;
        b=sQ7oJb7TBJPOdSKzLem2Yc4x4qnk2867HSmzxVrng6TvHe3eaxGHnhzt8Wy2rO21ZNiK18
        rOZWFNsYKSlydVY/nMxWOTX5BZ3m1GIkmjj+yoqbnY0hvzqmItClv+X3/H4bresGTHS6HC
        Fg+Hv9hwd0/LyVKkltIOyHOHYSOVPys=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B6BF3ABF0;
        Mon, 28 Dec 2020 14:44:28 +0000 (UTC)
Message-ID: <b70ff3a2356bcc2244155f183d0a15efbbadf490.camel@suse.com>
Subject: Re: [PATCH] USB: cdc-wdm: Fix use after free in
 service_outstanding_interrupt().
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     syzbot <syzbot+9e04e2df4a32fb661daf@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        lee.jones@linaro.org
Date:   Mon, 28 Dec 2020 15:44:00 +0100
In-Reply-To: <620e2ee0-b9a3-dbda-a25b-a93e0ed03ec5@i-love.sakura.ne.jp>
References: <000000000000994d2a05b6b49959@google.com>
         <7a740f5a-65f9-b1d6-1224-4938d61b74a5@i-love.sakura.ne.jp>
         <620e2ee0-b9a3-dbda-a25b-a93e0ed03ec5@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Sonntag, den 20.12.2020, 00:25 +0900 schrieb Tetsuo Handa:
> syzbot is reporting UAF at usb_submit_urb() [1], for
> service_outstanding_interrupt() is not checking WDM_DISCONNECTING
> before calling usb_submit_urb(). Close the race by doing same checks
> wdm_read() does upon retry.

But wdm_read() does them with proper locking.

> Also, while wdm_read() checks WDM_DISCONNECTING with desc->rlock held,
> service_interrupt_work() does not hold desc->rlock. Thus, it is possible
> that usb_submit_urb() is called from service_outstanding_interrupt() from
> service_interrupt_work() after WDM_DISCONNECTING was set and kill_urbs()
>  from wdm_disconnect() completed. Thus, move kill_urbs() in
> wdm_disconnect() to after cancel_work_sync() (which makes sure that
> service_interrupt_work() is no longer running) completed.

That seems to be the right approach. You must prevent this helper
from being called in the first place.

	Regards
		Oliver


