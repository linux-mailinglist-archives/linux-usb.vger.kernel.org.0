Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4C543B07E
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 12:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbhJZKwD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 06:52:03 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:19074 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbhJZKwC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 06:52:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635245379; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=UKDok6pjQXh6Y/Ie/m3KDs8AhN9m+YKA2QBwh7IWqUE=; b=atzt98ppIVpsofnLA19e2WFSdHZ7SrFYcvDfCwutcbCLwoUCrD9nXfBTYLtHDqm0wD/IFXUw
 gtHoRdvjJOjiGY3qxxlTo+g0rL/zxrfPqzsJFPu/C5JPyydssxqZI/eAOEsTYpRgH2OnFyy3
 ms10kd9DFlNOmprWicdf6zRszQs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6177dd2cfd91319f0fcf6d59 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 10:49:15
 GMT
Sender: pkondeti=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D4716C4360C; Tue, 26 Oct 2021 10:49:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pkondeti)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E800AC4338F;
        Tue, 26 Oct 2021 10:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E800AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Tue, 26 Oct 2021 16:19:10 +0530
From:   Pavan Kondeti <pkondeti@codeaurora.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     youling 257 <youling257@gmail.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/5] xhci: Fix command ring pointer corruption while
 aborting a command
Message-ID: <20211026104910.GA21371@codeaurora.org>
References: <20211008092547.3996295-5-mathias.nyman@linux.intel.com>
 <20211022105913.7671-1-youling257@gmail.com>
 <CAOzgRdY8+Wm-Ane==RQTvEe4aKa40+h1VF9JSg8WQsm-XH0ZCw@mail.gmail.com>
 <8c3cd8f7-0bd1-0ec4-2f58-6122ae7ef270@linux.intel.com>
 <CAOzgRdb2MK5mVonatO7t9DcXwtK=MbDwdWreR+6dpqvEv7R0Fw@mail.gmail.com>
 <7f21f732-3f88-baba-38de-e94d9d6e993d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f21f732-3f88-baba-38de-e94d9d6e993d@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 25, 2021 at 06:21:00PM +0300, Mathias Nyman wrote:
> On 25.10.2021 18.01, youling 257 wrote:
> > test this patch suspend resume usb can work.
> 
> Great, thanks.
> 
> Pavankumar Kondeti, does your case still work after this modification? 
> 
> 
Hi Mathias,


+	crcr = xhci_trb_virt_to_dma(xhci->cmd_ring->deq_seg,
+				    xhci->cmd_ring->dequeue);
+	xhci_write_64(xhci, crcr | CMD_RING_ABORT, &xhci->op_regs->cmd_ring);

This patch passes my test. Can you please clarify the below question that is
bothering me.

Here crcr points to the DMA address of the command which is getting
executed (soon will be aborted) by the xHC. After the ring is stopped,
we want xHC to execute the *next* command.

Is it guaranteed that the upper 32 bits of previous and next commands will
be same? Because when the issue happens, xHC takes the 32 bits of crcr
variable and update it's internal pointer from which it will fetch the commands
next time the ring is started. I think it is guaranteed because the upper 32
bits only may change when we cross the segments but in which case there will
be a link TRB in the middle. Since xHC command ring is stopped, it won't be
fetching the link TRB until door bell is rung again. Is my understanding correct?

Also, what if there is a race with xHC just finishing this command (which we
are currently aborting) and next link TRB is traversed and processing the next
command in a different segment. For some reason, we could not update our
deq pointer and in middle of aborting the command (which is already completed)
and updating the higher 32 bit with the previous deq segment. This is a
hypothetical question as we are only using 1 segment for the command ring.

Thanks,
Pavan


-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

