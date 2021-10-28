Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8AA43DC9D
	for <lists+linux-usb@lfdr.de>; Thu, 28 Oct 2021 10:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhJ1IFh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Oct 2021 04:05:37 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:18855 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1IFh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Oct 2021 04:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635408191; x=1666944191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+TjboB2qlfRtGDU3Qo5Q8vlQQ13VjmlCnBkR7CyIWqc=;
  b=T2I+yPY1PaVZr+tcvwLCu3ZNu7xvTzk2CCcjVx2hVD8P3gwbwnOdFsFv
   ccodjBcd6dvwQgl8bGMNg+4T5uPslcjWQBE1OpD34y5vK6rsZelONoqwh
   y7QrXZ1OhMDrSYMr4fUQl7XdKBiJ5FFQGbdzaxXbCf6k+7MwvUtk15G5V
   k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 28 Oct 2021 01:03:09 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 01:03:09 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 01:03:08 -0700
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 01:03:06 -0700
Date:   Thu, 28 Oct 2021 13:33:02 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     Pavan Kondeti <pkondeti@codeaurora.org>,
        youling 257 <youling257@gmail.com>,
        <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 4/5] xhci: Fix command ring pointer corruption while
 aborting a command
Message-ID: <20211028080302.GA14180@hu-pkondeti-hyd.qualcomm.com>
References: <20211008092547.3996295-5-mathias.nyman@linux.intel.com>
 <20211022105913.7671-1-youling257@gmail.com>
 <CAOzgRdY8+Wm-Ane==RQTvEe4aKa40+h1VF9JSg8WQsm-XH0ZCw@mail.gmail.com>
 <8c3cd8f7-0bd1-0ec4-2f58-6122ae7ef270@linux.intel.com>
 <CAOzgRdb2MK5mVonatO7t9DcXwtK=MbDwdWreR+6dpqvEv7R0Fw@mail.gmail.com>
 <7f21f732-3f88-baba-38de-e94d9d6e993d@linux.intel.com>
 <20211026104910.GA21371@codeaurora.org>
 <64b2d3ef-7470-ddc4-0af5-5cbd889d8092@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <64b2d3ef-7470-ddc4-0af5-5cbd889d8092@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 27, 2021 at 04:59:11PM +0300, Mathias Nyman wrote:
> > This patch passes my test. Can you please clarify the below question that is
> > bothering me.
> 
> Sure, currently this works as we only have one command ring segment.
> But lets look at a theoretical case with two segments far apart where
> the last command on a segment is aborted
> 
> > 
> > Here crcr points to the DMA address of the command which is getting
> > executed (soon will be aborted) by the xHC. After the ring is stopped,
> > we want xHC to execute the *next* command.
> > 
> > Is it guaranteed that the upper 32 bits of previous and next commands will
> > be same? Because when the issue happens, xHC takes the 32 bits of crcr
> > variable and update it's internal pointer from which it will fetch the commands
> > next time the ring is started. I think it is guaranteed because the upper 32
> > bits only may change when we cross the segments but in which case there will
> > be a link TRB in the middle. Since xHC command ring is stopped, it won't be
> > fetching the link TRB until door bell is rung again. Is my understanding correct?
> 
> Good point. 
> 
> This could be an issue as xHC will move the internal pointer to the next
> command TRB (past link) right after generating a "command aborted" event,
> before generating the "command ring stopped" event. The command ring stopped
> event should thus point to the next command TRB to handle.
> 
> I'll assume that the "command aborted" and "command ring stopped" events are generated
> before xHC updates the internal pointer based on CRCR write.
> 
> The CRCR write may thus move the internal dequeue pointer back to previous segment.
> 
> This may mess things up, even if the interrupt handler turns the aborted command TRB
> to a no-op, it's possible the partial CRCR update could cause internal pointer to 
> point to first command of old segment. 
> 
> > 
> > Also, what if there is a race with xHC just finishing this command (which we
> > are currently aborting) and next link TRB is traversed and processing the next
> > command in a different segment. For some reason, we could not update our
> > deq pointer and in middle of aborting the command (which is already completed)
> > and updating the higher 32 bit with the previous deq segment. This is a
> > hypothetical question as we are only using 1 segment for the command ring.
> 
> In this case we won't see the "command aborted" event. Only a "command ring
> stopped" event. and yes, the CRCR write could cause the internal dequeue pointer
> to be moved back to the old segment, and we have the same issues as in the 
> previous case.
> 
> These two cases could probably solved by writing the next command pointer to CRCR
> instead.
> 
> Only problem I see with this is if xHC hasn't even fetched the command TRB we are
> aborting. Then ring will stop at this last command TRB on segment.
> Writing the next command TRB pointer to CRCR forces xHC to move to the next
> segment without xHC processing the Link TRB, and cycle bit might get out of sync.
> 
> Hard to imagine how we end up in this situation.  
> 
> Then there is the third case where xHC handled multiple command TRBs, but interrupts
> are blocked so driver is unaware of their completion.
> Here its possible we write the wrong segment to CRCR even if we use the next
> command TRB pointer. xHC could be way past what driver thinks is the next command.
> 
> For this case we proably need to check for pending interrupts and unhandled command
> completions on the event ring before aborting the command.
> But that is probably another patch.
> 
> But for now the best solution seems to be just to write next command TRB
> pointer to CRCR during abort.
> 
Thanks Mathias for the detailed explanation. Agree that your patch is good
enough for the current situation. May be a TODO comment here would help. 

Thanks,
Pavan
