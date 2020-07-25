Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3061822D8C4
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 18:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgGYQo2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 12:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYQo1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 12:44:27 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39EA0C08C5C0
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2020 09:44:27 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id x5so9914101wmi.2
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2020 09:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=obMS/EHMt0h6qEd1HP3vtvSbGOz8OBLnjX7LyhDF9xI=;
        b=ezimRoxmsLUTzOZXX8Qx8M6H6nAtjtwOCqpxaEMJs5Dfw6sdZ74E+uh49jmxGwZMZG
         MU26wJjeAAmsnJZ6tEUYq1WsS2qTwOQWKjca5U802PwEPr+7mboRX9IQ5Fh0Ow/oZyw+
         bZYXvkJJTH05GgqzjhzKcKUfURVAoNVK9E65s45XrtsN9eErGnmDw4IucbHxR6yrpkEo
         8Mc4eCaQMFmhMuyNZa9QjuTi80OvVCkVw3nL/yU0sXS8Ze1wdRfbscBV1hJRxUID1Ycd
         TdINWGMgzUpI1gq5uLHN6gHpzUVyRrrGLumh+wjTL/K8IKE15Wwz//2lyhXhJL7e/D0n
         b4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=obMS/EHMt0h6qEd1HP3vtvSbGOz8OBLnjX7LyhDF9xI=;
        b=ElxMH2yr5XbcYmEtJ8791hrf9M+6WqHLjmfVnleA6jEX/gipLP0tfflBABAPs2ek2X
         HzIQn8lXJ5sMmLJkrzQ2l01IW9pcx+jN69Z2o9vDtSg+rQ+yGA0fdMw0/Az7r7Ir+jtq
         7heTdsfRduj3xvSPACDeFV8AfrON4XuaalwKXnWP6pj8yuIX5uFdaGHVyONLeu9Bgnh7
         DE7GGUEx84Nyg2Cg44iF2XIcGOrSKmmNKiBfTMeMmB/TbJMRC/5wIhs/0jJEI0GcPx2T
         DAxaFcWjpPOeRx7E/hVYJeH1uQoBU1B14a1IhL0gHo2Ux3VJIhLaTXzPCPBbQId21U/M
         WZkA==
X-Gm-Message-State: AOAM532mW/R6FJ6u+aVoMyj3w4+lo7BYtElvWV64vFDraoEpDHoQtBuM
        V5pyr2GvblRpNj2P5RtVK00=
X-Google-Smtp-Source: ABdhPJyX3F1DBNgcTo3RCrrL63vML7dAOL3pvE+vfRRgJ6kNnwkIbh9dTfzibwc0uP6vK2M/W+p0+Q==
X-Received: by 2002:a1c:4b0d:: with SMTP id y13mr100791wma.6.1595695465883;
        Sat, 25 Jul 2020 09:44:25 -0700 (PDT)
Received: from [89.138.153.201] (89-138-153-201.bb.netvision.net.il. [89.138.153.201])
        by smtp.gmail.com with ESMTPSA id f124sm4526273wmf.7.2020.07.25.09.44.23
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Jul 2020 09:44:25 -0700 (PDT)
Message-ID: <5F1C6152.8000500@gmail.com>
Date:   Sat, 25 Jul 2020 19:44:02 +0300
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Oliver Neukum <oliver@neukum.org>
Subject: Re: usb: core: URB completer callback possibly called after usb_kill_anchored_urbs()
 returns
References: <5F1AD830.7050406@gmail.com> <20200724155133.GC1388675@rowland.harvard.edu>
In-Reply-To: <20200724155133.GC1388675@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Alan & all,

Thanks for your response.

The thing is that I'm not alone assuming that it's fine to free 
resources after usb_kill_anchored_urbs() returns. Most notable is 
usb-skeleton.c, which does exactly that in skel_disconnect():

     usb_kill_anchored_urbs(&dev->submitted);

     /* decrement our usage count */
     kref_put(&dev->kref, skel_delete);

Needless to say, skel_delete() frees the struct that the URBs' contexts 
point at.

Keeping track of the number of uncompleted URBs, as you suggested, is 
indeed a solution. But as it seems that the only problem is the race 
condition between usb_kill_anchored_urbs() and __usb_hcd_giveback_urb(), 
I suppose it's enough to ensure that the resources are not freed while 
__usb_hcd_giveback_urb() is doing its unanchor-before-complete thing.

After taking a second look, I discovered that there's already a function 
that takes the race condition into consideration: 
usb_wait_anchor_empty_timeout().

Looking again at commit 6ec4147, which I mentioned before, it turns out 
that it added a counter to each anchor struct (atomic_t 
suspend_wakeups). It's incremented in __usb_hcd_giveback_urb() just 
before unanchoring a URB, and decremented after the completion has been 
called. This is made with calls to usb_anchor_suspend_wakeups() and 
usb_anchor_resume_wakeups(), but that's the essence of these calls.

And there's a wait queue in place, which gets a wakeup call by 
usb_anchor_resume_wakeups(), if the anchor's list is empty and the 
counter is zero after decrementing it. In the said commit, 
usb_wait_anchor_empty_timeout() was modified to check the counter as 
well, so when it returns, the anchor is genuinely idle.

So I would say that the safe way to go is

   usb_kill_anchored_urbs(&ep->anchor);
   if (!usb_wait_anchor_empty_timeout(&ep->anchor, 1000)) {
      /* This is really bad */
   }
   /* Release memory */

And if indeed so, I'm thinking about submitting a patch, which adds a 
usb_wait_anchor_empty_timeout() at the bottom of 
usb_kill_anchored_urbs(). So that the function does what people out 
there think it does.

Have I missed something?

Thanks,
    Eli

On 24/07/20 18:51, Alan Stern wrote:
> On Fri, Jul 24, 2020 at 03:46:40PM +0300, Eli Billauer wrote:
>    
>> Hello,
>>
>> My understanding is it should be OK to assume that no calls to completer
>> callbacks will be made after usb_kill_anchored_urbs() returns (for that
>> anchor, of course).
>>      
> As you have discovered, that is not a correct assumption.
>
>    
>>   However __usb_hcd_giveback_urb() in
>> drivers/usb/core/hcd.c doesn't seem to work that way. It unanchors first,
>> then calls the complete method:
>>
>>      usb_unanchor_urb(urb);
>>      if (likely(status == 0))
>>          usb_led_activity(USB_LED_EVENT_HOST);
>>
>>      /* pass ownership to the completion handler */
>>      urb->status = status;
>>      kcov_remote_start_usb((u64)urb->dev->bus->busnum);
>>      urb->complete(urb);
>>
>> So if usb_kill_anchored_urbs() is called while __usb_hcd_giveback_urb() is
>> in the middle of this code passage, it will miss the URB that is being
>> finished, and possibly return before the completer has been called.
>>
>> It might sound like a theoretic race condition, but I actually got a kernel
>> panic after yanking the USB plug in the middle of heavy traffic. The panic's
>> call trace indicated that the driver's completer callback function attempted
>> to access memory that had been freed previously. As this happened within an
>> IRQ, it was a fullblown computer freeze.
>>
>> The same driver's memory freeing mechanism indeed calls
>> usb_kill_anchored_urbs() first, then frees the URBs' related data structure.
>> So it seems like it freed the memory just before the completer callback was
>> invoked.
>>      
> Right.  There is a genuine race.  Althouogh usb_kill_anchored_urbs()
> does wait for the completion handlers of all the URBs it kills to
> finish, there is some ambiguity about what URBs are on the anchor.
>
>    
>> I would love to submit a patch that moves the usb_unanchor_urb() call a few
>> rows down, but something tells me it's not that simple.
>>      
> No, it isn't.
>
>    
>> As a side note, the comment along with commit 6ec4147, which added
>> usb_anchor_{suspend,resume}_wakeups calls, said among others: "But
>> __usb_hcd_giveback_urb() calls usb_unanchor_urb before calling the
>> completion handler. This is necessary as the completion handler may
>> re-submit and re-anchor the urb". Not sure I understood this part, though.
>>      
> Suppose the completion routine puts the URB onto a different anchor and
> then calls usb_submit_urb().  If __usb_hcd_giveback_urb() then called
> usb_unanchor_urb(), the URB would incorrectly be removed from the wrong
> anchor!
>
> Currently the only way to handle this situation properly is to keep
> track of whether each URB has completed.  For example, if the driver has
> successfully submitted 237 URBs but the completion routine has only been
> called 235 times, the driver will know that there are still two URBs
> pending.
>
> Alan Stern
>
>    

