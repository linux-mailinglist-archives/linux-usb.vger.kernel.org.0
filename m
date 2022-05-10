Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC44521E97
	for <lists+linux-usb@lfdr.de>; Tue, 10 May 2022 17:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244648AbiEJPcB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 May 2022 11:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346174AbiEJPbi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 May 2022 11:31:38 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 4ADCF506D5
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 08:24:25 -0700 (PDT)
Received: (qmail 164510 invoked by uid 1000); 10 May 2022 11:24:24 -0400
Date:   Tue, 10 May 2022 11:24:24 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [v15 3/6] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YnqDqD0CU8euoe6B@rowland.harvard.edu>
References: <YnVSIvwXsKySg33M@google.com>
 <YnVmXmG+6emL4nxv@rowland.harvard.edu>
 <YnVs7kSkpjUBWc5w@google.com>
 <YnWFaSXJJ8T7IYtl@rowland.harvard.edu>
 <20220509033238.GA9170@hu-pkondeti-hyd.qualcomm.com>
 <YnkgaagoaYK7LkCq@rowland.harvard.edu>
 <20220509142341.GA28596@hu-pkondeti-hyd.qualcomm.com>
 <YnkmV1wyC8fwBdub@rowland.harvard.edu>
 <20220510011602.GA16769@hu-pkondeti-hyd.qualcomm.com>
 <20220510013054.GA24800@hu-pkondeti-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510013054.GA24800@hu-pkondeti-hyd.qualcomm.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 10, 2022 at 07:00:54AM +0530, Pavan Kondeti wrote:
> btw, should we add an else block here to take care of companion controllers
> associcated if any. Can you pls tell us if it is possible that we have all
> the below cases together? should the companion check be done only when
> shared_hcd is not present?
> 
> - primary HCD (USB2.0, EHCI/XHCI)
> - secondary HCD (USB3.0 XHCI)
> - hs_companion (USB2.0 companion) for OHCI/UHCI
> 
> unsigned int usb_hcd_wakeup_enabled_descendants(struct usb_hcd *hcd)
> {
> 	unsigned int nr_wakeup;
> 
> 	nr_wakeup = usb_wakeup_enabled_descendants(hcd->self.root_hub);
> 
> 	if (hcd->shared_hcd)
> 		nr_wakeup += usb_wakeup_enabled_descendants(hcd->shared_hcd->self.root_hub);
> 	else if (hcd->self.hs_companion)
> 		nr_wakeup += usb_wakeup_enabled_descendants(hcd->self.hs_companion->root_hub);

No, this is wrong.  Companion controllers do not contribute to the 
descendant count.  You should ignore them.

Alan Stern
