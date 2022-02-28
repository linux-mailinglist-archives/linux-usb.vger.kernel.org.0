Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4A94C6BDC
	for <lists+linux-usb@lfdr.de>; Mon, 28 Feb 2022 13:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235863AbiB1MK4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Feb 2022 07:10:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235076AbiB1MKz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Feb 2022 07:10:55 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF61E66AF2
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 04:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1646050216; x=1677586216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wpi+fb94FDNhk2nEjCyrtvEKddbeyVQY6WzBy05BJvo=;
  b=p/tc4B/qYI6InDZHIZYenXNShPE6916UjDKCt+0JhMXVEzK7lTR1pfMI
   srAfnLabbqn/rOS1Hde9KQy9aLabZIV3o13/KTHGEjYt1mHYTzcyz1v+B
   /Np96lqdH3BnhJ9xo8V6Cbw067oPN0ePyqZKWQjfJkcBmn1rqYaE5BdP+
   Q=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Feb 2022 04:10:16 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 04:10:16 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 28 Feb 2022 04:10:15 -0800
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 28 Feb 2022 04:10:13 -0800
Date:   Mon, 28 Feb 2022 17:40:09 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>, <s.shtylyov@omp.ru>,
        <linux-usb@vger.kernel.org>
Subject: Re: [RFT PATCH] xhci: make xhci_handshake timeout for xhci_reset()
 adjustable
Message-ID: <20220228121009.GA26475@hu-pkondeti-hyd.qualcomm.com>
References: <20220217135643.1321889-1-mathias.nyman@linux.intel.com>
 <20220218094133.GA28120@hu-pkondeti-hyd.qualcomm.com>
 <0edc0822-d75b-238a-16d4-d828710c1b60@quicinc.com>
 <27f7aec3-cd86-3f55-dfa6-8f2b76437c90@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <27f7aec3-cd86-3f55-dfa6-8f2b76437c90@linux.intel.com>
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

Hi Mathias,

On Mon, Feb 28, 2022 at 01:39:10PM +0200, Mathias Nyman wrote:
> On 24.2.2022 10.44, Udipto Goswami wrote:
> > Hi Pavan, Mathias,
> > 
> > we have tested the patch in the testing environment where initially we were hitting the issue. We don't see any issue after including this.
> > 
> > On 18-02-2022 03:11 pm, Pavan Kondeti wrote:
> >> On Thu, Feb 17, 2022 at 03:56:43PM +0200, Mathias Nyman wrote:
> >>> xhci_reset() timeout was increased from 250ms to 10 seconds in order to
> >>> give Renesas 720201 xHC enough time to get ready in probe.
> >>>
> >>> xhci_reset() is called with interrupts disabled in other places, and
> >>> waiting for 10 seconds there is not acceptable.
> >>>
> >>> Add a timeout parameter to xhci_reset(), and adjust it back to 250ms
> >>> when called from xhci_stop() or xhci_shutdown() where interrupts are
> >>> disabled, and successful reset isn't that critical.
> >>>
> >>> Additionally change the signed integer timeout parameter in
> >>> xhci_handshake() to a u64 to match the timeout value we pass to
> >>> readl_poll_timeout_atomic()
> >>>
> >>> Reported-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> >>> Reported-by: Pavan Kondeti <quic_pkondeti@quicinc.com>
> >>> Fixes: 22ceac191211 ("xhci: Increase reset timeout for Renesas 720201 host.")
> >>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> >> We have tested the patch and found no issues. Since the issue happens
> >> very rarely, we have included in our builds for the wider testing.
> >>
> >> Thanks,
> >> Pavan
> 
> Thanks 
> Can I add a "Tested-by: Pavan Kondeti <quic_pkondeti@quicinc.com>" tag?
> 
Yes, please. Thanks for your help.

Thanks,
Pavan
