Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0215FEEAD
	for <lists+linux-usb@lfdr.de>; Fri, 14 Oct 2022 15:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiJNNcn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Oct 2022 09:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiJNNcn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Oct 2022 09:32:43 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0DAB81C811B
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 06:32:40 -0700 (PDT)
Received: (qmail 1075142 invoked by uid 1000); 14 Oct 2022 09:32:40 -0400
Date:   Fri, 14 Oct 2022 09:32:40 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thilo Roerig <thilo.roerig@googlemail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Receiving report multiple times when changing cpu
Message-ID: <Y0lk+IiDmrkmAfRk@rowland.harvard.edu>
References: <Y0bxVHsE0bFOFj+7@rowland.harvard.edu>
 <20221014112049.2456-1-roerig@interactive-scape.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014112049.2456-1-roerig@interactive-scape.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 14, 2022 at 01:20:49PM +0200, Thilo Roerig wrote:
> > As Greg mentioned, usbmon is a better way to snoop the data transfers.
> 
> I have continued to investigate the issue using usbmon, but unfortunately, I
> could not find any other irregularity, but the jumps in the report id pattern.

Did you check the timestamps carefully?  In particular, did you
examine the times when each transfer was submitted and completed?  If
two adjacent transfers complete more than one or two microseconds
apart, that indicates a problem.

Also, do the report IDs show up in the usbmon trace so that you can
directly see which ID appears in which transfer?

> > The most important thing you should do, to ensure that reports do not 
> > get lost, is submit a large queue of interrupt transfers in advance.  
> > Each time a transfer completes, add another submission to the queue.
> >
> > That way, even if your process loses control of the CPU for some period 
> > of time, the transfers will continue (unless the period is so long that 
> > your entire queue gets consumed before the process is able to submit 
> > more requests).
> 
> Thank you for your help! Initially, I was submitting 4 transfers only.
> I'll try to submit more transfers once I start loosing reports. Currently
> I am able to get all reports using only 4 transfers. I'm loosing reports
> only if I'm debugging with `usbfs_snoop`. In this case, I tried submitting
> more transfers, but I was still loosing some reports, so I decided, that 
> I will try to find another debugging possibility iother then usbfs_snoop.

Yeah, probably usbfs_snoop slows everything down so much that it
becomes impossible for your program to keep up with device.

On the other hand, if you're able to get all the reports (without
usbfs_snoop) using only four transfers then it seems like you've
solved the problem!

Alan Stern
