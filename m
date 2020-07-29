Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABB2232139
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 17:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgG2PJN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 11:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbgG2PJN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 11:09:13 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12224C061794
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2020 08:09:13 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id i26so14351336edv.4
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2020 08:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=gj6I2p18tYY70gbDHNsHUMANZp75I7KTs3mlTZiws9g=;
        b=bX9TSGefdNAEqiXcACdt8NEdF3m4ytA171KCCIYgr2Mumgljm7QRX8cVN59kPooP/3
         6YTa/sdZWXvlfawtKijZgUrSnRMReFtIvxv90EpcafHULCFEjfIOA6Es0U14GbdM8mIK
         dMy6LtR00ULCDOqHz5zqGG+jYuoU6JUZ989sH6xSdgo14Fno14P615i3Njikid4fVsWw
         WabGQSRgVRfAc8WvFVb6Z93YeSm4WR9FWlxM3xl5qPLE/OxZ4s1L+PM9SOmJuzSmgcqt
         53pDkEdwR4/2H8itSzR/I0NIhxLpru1STtLb91cdNgiXJyBDbm/uDuQLX9W13PJKossH
         s1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=gj6I2p18tYY70gbDHNsHUMANZp75I7KTs3mlTZiws9g=;
        b=eUOBfJDjtwptepLdGP4rbbNclCVxcUHbwJWuUtFw4LnlrQOVV65hT9FWuxlbED4Oms
         WXZq9V2vg2BXr0dtp8NU/1GCxD+RIHNM+GBVd/oKeA+sFLrbctSvtI9t62wl22RhFwhX
         VdLZxR48NXnIMhNEOz5TVP6bPnd5qZmnl1pHVAkwTLnqPbdVNokDUBPqDQ+af3lXzQhQ
         uVGSQCwC/q+J7PujZNecrG3x7eh8+zJvp9Q/Zjy8puLRGCr9s0uymXGPqWIs+repGyyo
         VKVKsqViabVMn2nAM6069LxaOIZ9XoZwHM4bVw6aoXLP9w3RKHwfMAoriAhziGgHWmaF
         Jy5g==
X-Gm-Message-State: AOAM533P2Udh9dRqhcB3dHF0HGTndqSc9bYs0Z3TIx7ttpsPkdm53gTa
        sTF8DtIZ7oVjlKFl0KgBAeY=
X-Google-Smtp-Source: ABdhPJwXMT4/SDMJsvBf5AvnJmyX/kyhNUAoFjBPL2cqKVYmSUesXLtfowCNu5UE0AH/skuv+kyJAg==
X-Received: by 2002:aa7:ca05:: with SMTP id y5mr32082639eds.204.1596035351766;
        Wed, 29 Jul 2020 08:09:11 -0700 (PDT)
Received: from [109.186.98.97] (109-186-98-97.bb.netvision.net.il. [109.186.98.97])
        by smtp.gmail.com with ESMTPSA id s4sm1815287ejx.94.2020.07.29.08.09.10
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Jul 2020 08:09:11 -0700 (PDT)
Message-ID: <5F2190F6.5020901@gmail.com>
Date:   Wed, 29 Jul 2020 18:08:38 +0300
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        hdegoede@redhat.com, oneukum@suse.de
Subject: Re: [PATCH v2] usb: core: Solve race condition in anchor cleanup
 functions
References: <20200729103139.49229-1-eli.billauer@gmail.com> <20200729133846.GA1530967@rowland.harvard.edu>
In-Reply-To: <20200729133846.GA1530967@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29/07/20 16:38, Alan Stern wrote:
> With a small amount of restructuring you can eliminate three unlock-lock
> pairs and avoid the need for usb_anchor_safe_empty():
> [ ... ]
> All you have to do is move this spin_lock_irq() above the start of the
> outer loop...
> [ ... ]
> .. and move this spin_unlock_irq() below the end of the outer loop.
> Likewise for the two other routines.
>
>    
I'm afraid that might not work. The whole purpose of the outer loop is 
to kick in when urb_list is empty, but there's this unanchor-completer 
race going on. So the inner loop will be skipped, because 
list_empty(&anchor->urb_list) will evaluate true. As a result, the 
spinlock will be held as the loop spins, until the completer has finished.

But if the completer tries to take the same lock, we're deadlocked. For 
example, if it resubmits the URB, which is pretty much the point of this 
extra while loop.

This is also the reason why I didn't just modify the original 
while-loop's condition, so it would go on spinning as long the race 
condition is in effect. It mustn't spin with the lock held.
>> >  +	} while (unlikely(!usb_anchor_safe_empty(anchor)));
>>      
> likely() and unlikely() are frowned upon unless you can provide actual
> measurements showing that they make a significant difference.  In this
> case they don't matter, since the bottleneck is the usb_kill_urb() call.
>    
The irony is that I added this "unlikely" for the human reader, and not 
for the compiler: I wanted to communicate that the outer loop is 
unlikely to kick in. I'll keep that in mind for v3 of this patch.

Thanks,
    Eli

