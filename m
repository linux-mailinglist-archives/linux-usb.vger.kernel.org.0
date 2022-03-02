Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360FA4C9E9B
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 08:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239607AbiCBHuC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Mar 2022 02:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234274AbiCBHt6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Mar 2022 02:49:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D938013D4D
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 23:49:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D2B4B81F1F
        for <linux-usb@vger.kernel.org>; Wed,  2 Mar 2022 07:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E62FC004E1;
        Wed,  2 Mar 2022 07:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1646207353;
        bh=seNk1fOA5qWOuuitvzkKu4lN2w3SPBK4j5nqcLXC4PA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TBJwzWygMWJ5EhTk045/y/gKXv19iSR5tUUTdFC1rP60GgGmz4VtLuVOav60+L/4w
         w5jaDwm8beYXM+xtgbkRTSDkSfLAdqz7hgHaale7kco8cLpqUQgExk6xaDuiOmQOsm
         qv/0oST8GUxw83tzKZxoc1UW5r8607wzA3/HJAEA=
Date:   Wed, 2 Mar 2022 08:49:08 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Jack Pham <quic_jackp@quicinc.com>, s.shtylyov@omp.ru,
        linux-usb@vger.kernel.org
Subject: Re: [RFT PATCH] xhci: make xhci_handshake timeout for xhci_reset()
 adjustable
Message-ID: <Yh8hdPneD8GXsQuW@kroah.com>
References: <20220217135643.1321889-1-mathias.nyman@linux.intel.com>
 <20220301014949.GG13801@jackp-linux.qualcomm.com>
 <20220301040339.GA11371@hu-pkondeti-hyd.qualcomm.com>
 <ffc9abb1-908b-1c09-cd9d-cbd83ea4e478@linux.intel.com>
 <20220302032306.GB11371@hu-pkondeti-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302032306.GB11371@hu-pkondeti-hyd.qualcomm.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 02, 2022 at 08:53:06AM +0530, Pavan Kondeti wrote:
> On Tue, Mar 01, 2022 at 10:47:36AM +0200, Mathias Nyman wrote:
> > On 1.3.2022 6.03, Pavan Kondeti wrote:
> > > On Mon, Feb 28, 2022 at 05:49:49PM -0800, Jack Pham wrote:
> > >> Hi Mathias,
> > >>
> > >> On Thu, Feb 17, 2022 at 03:56:43PM +0200, Mathias Nyman wrote:
> > >>> xhci_reset() timeout was increased from 250ms to 10 seconds in order to
> > >>> give Renesas 720201 xHC enough time to get ready in probe.
> > >>
> > >> This suggests that the only place we really need the long timeout is
> > >> in xhci_gen_setup().
> > >>
> > >>> @@ -1163,7 +1161,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
> > >>>  		xhci_dbg(xhci, "Stop HCD\n");
> > >>>  		xhci_halt(xhci);
> > >>>  		xhci_zero_64b_regs(xhci);
> > >>> -		retval = xhci_reset(xhci);
> > >>> +		retval = xhci_reset(xhci, XHCI_RESET_LONG_USEC);
> > >>
> > >> Since preemption is disabled here (spin_lock_irq() is called near the
> > >> start of this function), shouldn't we also limit this to 250ms here in
> > >> xhci_resume() as well?
> > >>> The rationale of decreasing the timeout to 250 in certain places is based
> > > on the criticality of the operation but not on the preemption/irq state.
> > > Since xHC reset is critical in startup and resume, the 10 seconds timeout
> > > is enforced so that we don't break Renesas 720201 xHC.
> > > 
> > > Since all of our internl test reports indicate that the timeout is happening
> > > from stop hcd, this patch is helping.
> > > 
> > 
> > This was pretty much my reasoning as well.
> > I could add a comment about this to the commit message
> > 
> > In addition we want a targeted fix for a real world issue that we can send to
> > stable without changing too much, risking regressions.
> > 
> Makes complete sense. 
> 
> Greg,
> 
> Do you plan to include this patch?

I need it to be forwarded to me by the maintainer with their
signed-off-by, like any other xhci core patch :)

What is the rush here?  Your hardware is obviously broken somehow if you
are hitting this problem just now.  Why not fix the root cause here,
this patch should only affect rare situations, right?  Are you having
this problem a lot?

thanks,

greg k-h
