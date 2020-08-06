Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041CD23DB88
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 18:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgHFQON (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 12:14:13 -0400
Received: from netrider.rowland.org ([192.131.102.5]:58867 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728648AbgHFQOG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Aug 2020 12:14:06 -0400
Received: (qmail 199991 invoked by uid 1000); 6 Aug 2020 11:10:16 -0400
Date:   Thu, 6 Aug 2020 11:10:16 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "Asano, Yasushi \(ADITJ/SWG\)" <yasano@jp.adit-jv.com>
Cc:     Yasushi Asano <yazzep@gmail.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Rosca, Eugeniu \(ADITG/ESM1\)" <erosca@de.adit-jv.com>,
        "andrew_gabbasov@mentor.com" <andrew_gabbasov@mentor.com>,
        "jim_baxter@mentor.com" <jim_baxter@mentor.com>,
        "Natsume, Wataru \(ADITJ/SWG\)" <wnatsume@jp.adit-jv.com>,
        "Nishiguchi, Naohiro \(ADITJ/SWG\)" <nnishiguchi@jp.adit-jv.com>
Subject: Re: [PATCH] [RFC] USB: hub.c: Add the retry count module parameter
 for usbcore
Message-ID: <20200806151016.GB197575@rowland.harvard.edu>
References: <20200730104226.3537-1-yazzep@gmail.com>
 <20200803183732.GA112453@rowland.harvard.edu>
 <589E8CD8BC4E4743ADCA659B6BADC9710BD43DB7@ky0exch01.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <589E8CD8BC4E4743ADCA659B6BADC9710BD43DB7@ky0exch01.adit-jv.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 06, 2020 at 05:43:54AM +0000, Asano, Yasushi (ADITJ/SWG) wrote:
> Dear Alan
> Dear Greg
> 
> Thank you for your feedback.
> I really appreciate your concrete proposal.
> 
> > So let's change the code to do 3 tries with each scheme.
> I understood. I will try to modify it so that the number of 
> attempts will decrease. It is 6 attempts in total both old and 
> new schemes, but msleep is executed at various places in 
> hub_port_connect and hub_port_init. apart from a timeout.
>  
> For example, msleep(100) is executed every time in the loop of 
> GET_DESCRIPTOR_TRIES[8] of new scheme. and In the old scheme, 
> msleep(200) is executed in the loop of SET_ADDRESS_TRIES[10].
> From my measurement, it does not subside within 30 seconds, 
> but it is around 32 seconds.
> 
> From these things, I would like you to reconsider the number of attempts. 
> Is it OK to set the new scheme to 3 times and the old scheme to 
> 2 times(no change as it is)? In other words 
> 
> [plan 1]
> 3 * new scheme, then 2 * old scheme, or else
> 2 * old scheme, then 3 * new_scheme,
> depending on the old_scheme_first parameter.

Yes, that's all right.  Although you might want to make the second case 
be: 3 * old scheme, then 2 * new scheme.

> Also, although it is a "better plan", the original processing is in the following.
> 
> 6 * new scheme, then 6 * new scheme, 
> then 2 * old scheme, then 2 * old scheme
> 
> if it will be modified from above to below, It seems that the structure 
> of the loop has to be greatly revised. I think.
> 
> 2 * new scheme, then 2 * old scheme, 
> then 1 * new scheme, then 1 * old scheme

If you want to use only five attempts, you'll have to get rid of the 
last one.

> The fix is likely to be large, so Can I proceed with a patch in plan 1?

Okay.

Alan Stern

> I will post the patch after confirming the behavior of the patch with 
> the customer board with the PET tool. please give me a little time.
> 
> Best Regards
> Yasushi Asano
