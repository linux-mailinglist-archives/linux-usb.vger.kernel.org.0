Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3DE2242B5F
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 16:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgHLO3Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 10:29:25 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:51273 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgHLO3X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Aug 2020 10:29:23 -0400
Received: from fsav103.sakura.ne.jp (fsav103.sakura.ne.jp [27.133.134.230])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 07CET67c023775;
        Wed, 12 Aug 2020 23:29:06 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav103.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp);
 Wed, 12 Aug 2020 23:29:06 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 07CET6w9023771
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Wed, 12 Aug 2020 23:29:06 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [RFC 0/5] fix races in CDC-WDM
To:     Oliver Neukum <oneukum@suse.com>
References: <20200812132034.14363-1-oneukum@suse.com>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <ee0af733-903f-8e8f-8027-b5490a37032f@i-love.sakura.ne.jp>
Date:   Wed, 12 Aug 2020 23:29:02 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812132034.14363-1-oneukum@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/08/12 22:20, Oliver Neukum wrote:
> CDC-WDM was not written with multithreaded users or
> uncooperative devices in mind.
> This leads to race conditions and hangs in flush(). 
> 

In patch "[RFC 2/5] CDC-WDM: introduce a timeout in flush()", since multiple users can
share "desc", wouldn't someone's usb_submit_urb() from wdm_write() gets unexpectedly
interfered by someone else's usb_kill_urb(desc->command) from wdm_open() ?

In patch "[RFC 2/5] CDC-WDM: introduce a timeout in flush()", don't we need to similarly
apply timeout to wait_event_interruptible() in wdm_write(), for the same problem will
happen if hardware remained silent forever?

In patch "[RFC 3/5] CDC-WDM: making flush() interruptible", it is legal to return -EINTR
 from close(). But I think that returning -EINTR from close() is not recommended because
it can confuse multithreaded application (retrying close() upon -EINTR is not safe).

In patch "[RFC 5/5] CDC-WDM: remove use of intf->dev after potential disconnect",

        /* cannot dereference desc->intf if WDM_DISCONNECTING */
        if (test_bit(WDM_DISCONNECTING, &desc->flags))
                return -ENODEV;

can be also removed, for this check is meant for not to dereference desc->intf
after disconnect ?

Guessing from symmetry, do we need to check WDM_DISCONNECTING or WDM_RESETTING
in wait_event_interruptible_timeout() from wdm_flush() when wait_event_interruptible()
in wdm_write() is not checking WDM_DISCONNECTING nor WDM_RESETTING ?

Does it make sense to wait for response of someone else's usb_submit_urb() when
someone is calling close(), for there is no guarantee that failure notice received
via wdm_flush() via some file descriptor corresponds to usb_submit_urb() request from
wdm_write() call from that file descriptor?
