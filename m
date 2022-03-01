Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E48964C81E4
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 05:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbiCAEEb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Feb 2022 23:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiCAEEa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Feb 2022 23:04:30 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1604C416
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 20:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1646107427; x=1677643427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9aS8mnqfDjRPW+2jZ52vXox1TJxLiNhS8osmXf3AbRc=;
  b=QEPg7B2n36iIDWI5HZ+0B8WZsN+qq0D/walR/RDpUxgd5K5WQJ5W4Upp
   mXSLKgtrwalZXoa/RizIZNkGkZsBbmqTRj2Piwx4djtQJeU4he0zrxpZl
   RnZPtBoPQMmC8prCVBKvBixwX0/78Ypc6ct46PoiTzt6aluofk3eHwePk
   U=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Feb 2022 20:03:46 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 20:03:45 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 28 Feb 2022 20:03:45 -0800
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 28 Feb 2022 20:03:43 -0800
Date:   Tue, 1 Mar 2022 09:33:39 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Jack Pham <quic_jackp@quicinc.com>
CC:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        <quic_pkondeti@quicinc.com>, <s.shtylyov@omp.ru>,
        <linux-usb@vger.kernel.org>
Subject: Re: [RFT PATCH] xhci: make xhci_handshake timeout for xhci_reset()
 adjustable
Message-ID: <20220301040339.GA11371@hu-pkondeti-hyd.qualcomm.com>
References: <20220217135643.1321889-1-mathias.nyman@linux.intel.com>
 <20220301014949.GG13801@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220301014949.GG13801@jackp-linux.qualcomm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 28, 2022 at 05:49:49PM -0800, Jack Pham wrote:
> Hi Mathias,
> 
> On Thu, Feb 17, 2022 at 03:56:43PM +0200, Mathias Nyman wrote:
> > xhci_reset() timeout was increased from 250ms to 10 seconds in order to
> > give Renesas 720201 xHC enough time to get ready in probe.
> 
> This suggests that the only place we really need the long timeout is
> in xhci_gen_setup().
> 
> > @@ -1163,7 +1161,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
> >  		xhci_dbg(xhci, "Stop HCD\n");
> >  		xhci_halt(xhci);
> >  		xhci_zero_64b_regs(xhci);
> > -		retval = xhci_reset(xhci);
> > +		retval = xhci_reset(xhci, XHCI_RESET_LONG_USEC);
> 
> Since preemption is disabled here (spin_lock_irq() is called near the
> start of this function), shouldn't we also limit this to 250ms here in
> xhci_resume() as well?
> 
The rationale of decreasing the timeout to 250 in certain places is based
on the criticality of the operation but not on the preemption/irq state.
Since xHC reset is critical in startup and resume, the 10 seconds timeout
is enforced so that we don't break Renesas 720201 xHC.

Since all of our internl test reports indicate that the timeout is happening
from stop hcd, this patch is helping.

Thanks,
Pavan
