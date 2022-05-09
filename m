Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8C0351FFCE
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 16:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237212AbiEIOiB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 10:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237255AbiEIOh4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 10:37:56 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 880372AD773
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 07:34:00 -0700 (PDT)
Received: (qmail 125527 invoked by uid 1000); 9 May 2022 10:33:59 -0400
Date:   Mon, 9 May 2022 10:33:59 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [v15 3/6] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YnkmV1wyC8fwBdub@rowland.harvard.edu>
References: <a83dea08-0920-17e6-ec1c-f9d8a490a08d@quicinc.com>
 <20220506051448.GE4640@hu-pkondeti-hyd.qualcomm.com>
 <YnVD+ltiQhKE+jPf@google.com>
 <YnVSIvwXsKySg33M@google.com>
 <YnVmXmG+6emL4nxv@rowland.harvard.edu>
 <YnVs7kSkpjUBWc5w@google.com>
 <YnWFaSXJJ8T7IYtl@rowland.harvard.edu>
 <20220509033238.GA9170@hu-pkondeti-hyd.qualcomm.com>
 <YnkgaagoaYK7LkCq@rowland.harvard.edu>
 <20220509142341.GA28596@hu-pkondeti-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509142341.GA28596@hu-pkondeti-hyd.qualcomm.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 09, 2022 at 07:53:41PM +0530, Pavan Kondeti wrote:
> On Mon, May 09, 2022 at 10:08:41AM -0400, Alan Stern wrote:
> > BTW, if there's any trouble with getting device_wakeup_path() to work 
> > the way you want, you could consider instead calling 
> > usb_wakeup_enabled_descendants() on the root hub.  This function returns 
> > a count of the number of wakeup-enabled USB devices at or below the 
> > device you pass to it.
> > 
> 
> This series [1] started with usb_wakeup_enabled_descendants() actually. one
> of the problem with this API is that we have to call this on both USB2.0 and
> USB3.0 root hubs. Do you think we can have a wrapper function like
> usb_hcd_wakeup_enabled_descendants() that accepts hcd as an argument and
> internally call usb_wakeup_enabled_descendants() on both root hubs and return
> the result.

Sure you can.  Feel free to write such a function and add it to hcd.c.  
Ideally it should work for host controllers with any number of root 
hubs, just adding up the number of wakeup-enabled descendants for all of 
them.

Alan Stern
