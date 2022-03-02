Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85BBE4C9C18
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 04:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234858AbiCBDX5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 22:23:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232602AbiCBDXz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 22:23:55 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7E44B1CF
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 19:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1646191394; x=1677727394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=huEDIUJEkW/cXWB8R04EZxsdyJ7NSCmxsoS/MrjOgOE=;
  b=yjDYllrzb4X7DJjU8rMUaKFLCQte+H4liv6/NDMB84U/Vj7dbFK979Hb
   I/CZ0f3QkaQ+Kqd/8oI4EzwgJ2xYFBq+HMa75wz/cET1kt7dQUZeeS9iw
   KUTGyotqcr56qAfTe2snXozXkEoB47MX0ggste1UIRl4eVl+Zn2E3Zwev
   I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 01 Mar 2022 19:23:14 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 19:23:13 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 1 Mar 2022 19:23:13 -0800
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 1 Mar 2022 19:23:10 -0800
Date:   Wed, 2 Mar 2022 08:53:06 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, <s.shtylyov@omp.ru>,
        <linux-usb@vger.kernel.org>
Subject: Re: [RFT PATCH] xhci: make xhci_handshake timeout for xhci_reset()
 adjustable
Message-ID: <20220302032306.GB11371@hu-pkondeti-hyd.qualcomm.com>
References: <20220217135643.1321889-1-mathias.nyman@linux.intel.com>
 <20220301014949.GG13801@jackp-linux.qualcomm.com>
 <20220301040339.GA11371@hu-pkondeti-hyd.qualcomm.com>
 <ffc9abb1-908b-1c09-cd9d-cbd83ea4e478@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ffc9abb1-908b-1c09-cd9d-cbd83ea4e478@linux.intel.com>
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

On Tue, Mar 01, 2022 at 10:47:36AM +0200, Mathias Nyman wrote:
> On 1.3.2022 6.03, Pavan Kondeti wrote:
> > On Mon, Feb 28, 2022 at 05:49:49PM -0800, Jack Pham wrote:
> >> Hi Mathias,
> >>
> >> On Thu, Feb 17, 2022 at 03:56:43PM +0200, Mathias Nyman wrote:
> >>> xhci_reset() timeout was increased from 250ms to 10 seconds in order to
> >>> give Renesas 720201 xHC enough time to get ready in probe.
> >>
> >> This suggests that the only place we really need the long timeout is
> >> in xhci_gen_setup().
> >>
> >>> @@ -1163,7 +1161,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
> >>>  		xhci_dbg(xhci, "Stop HCD\n");
> >>>  		xhci_halt(xhci);
> >>>  		xhci_zero_64b_regs(xhci);
> >>> -		retval = xhci_reset(xhci);
> >>> +		retval = xhci_reset(xhci, XHCI_RESET_LONG_USEC);
> >>
> >> Since preemption is disabled here (spin_lock_irq() is called near the
> >> start of this function), shouldn't we also limit this to 250ms here in
> >> xhci_resume() as well?
> >>> The rationale of decreasing the timeout to 250 in certain places is based
> > on the criticality of the operation but not on the preemption/irq state.
> > Since xHC reset is critical in startup and resume, the 10 seconds timeout
> > is enforced so that we don't break Renesas 720201 xHC.
> > 
> > Since all of our internl test reports indicate that the timeout is happening
> > from stop hcd, this patch is helping.
> > 
> 
> This was pretty much my reasoning as well.
> I could add a comment about this to the commit message
> 
> In addition we want a targeted fix for a real world issue that we can send to
> stable without changing too much, risking regressions.
> 
Makes complete sense. 

Greg,

Do you plan to include this patch?

Thanks,
Pavan
