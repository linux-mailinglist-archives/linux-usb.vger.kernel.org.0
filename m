Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F064C3686
	for <lists+linux-usb@lfdr.de>; Thu, 24 Feb 2022 21:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbiBXUHN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Feb 2022 15:07:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbiBXUHM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Feb 2022 15:07:12 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F287D31359
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 12:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645733201; x=1677269201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oquRCPOPHkcQQcJh58aabPmPBddWqn9vbC+KkdzPF9A=;
  b=KDLAo+izNcD7ir8JTd+Csma6ll6yUOQVl6CI1DDk6+dRWWwj5Z1Gccj1
   eJZrwneZI+J2yg0mXvUkykOrbKSQzgZx2lDwW+Ieae246nPRUvrWY8CIN
   XQfFWogb2t6/vVM3iVWtg52oUo20HejGN6tlF6qFUTydoGNwDLH65qxYG
   c=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 24 Feb 2022 12:06:40 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 12:06:40 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 12:06:39 -0800
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 12:06:39 -0800
Date:   Thu, 24 Feb 2022 12:06:38 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Heiner Kallweit <hkallweit1@gmail.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Tung Nguyen <tunguyen@apm.com>,
        "Mathias Nyman" <mathias.nyman@intel.com>
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Message-ID: <20220224200637.GE13801@jackp-linux.qualcomm.com>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
 <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
 <YhZB9C/xGaoslZzT@rowland.harvard.edu>
 <131166ee-9926-2eb5-2abd-6bab294d2937@gmail.com>
 <Yhaxb0OvMwLtd6vr@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Yhaxb0OvMwLtd6vr@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Wed, Feb 23, 2022 at 05:13:03PM -0500, Alan Stern wrote:
> On Wed, Feb 23, 2022 at 09:58:56PM +0100, Heiner Kallweit wrote:
> > On 23.02.2022 15:17, Alan Stern wrote:
> > > Don't change register_root_hub().  Just change xhci_plat_probe(); make 
> > > it skip the second call to usb_add_hcd() if there are no USB-3 ports.

I believe this had been attempted in the past, but it does not appear
that patch was ever accepted:

https://lore.kernel.org/linux-usb/1517221474-19627-1-git-send-email-tqnguyen@apm.com/

Jack

> > This works on my system. However a consequence is that xhci->shared_hcd
> > is NULL.
> 
> Why is that?  xhci->shared_hcd doesn't get set in usb_add_hcd(), so 
> skipping that call shouldn't cause it to be NULL.
> 
> Note: If you skip calling usb_add_hcd(), you will also have to skip the 
> corresponding call to usb_remove_hcd().  There may be a few more 
> subtleties involved as well; like I said before, I'm not an expert on 
> this driver.  You should ask the xhci-hcd maintainer for advice.
> 
> Alan Stern
> 
> >  There are a few places like the following in xhci.c where
> > this may result in a NPE. Not knowing the USB subsystem in detail
> > I can't say whether these places are in any relevant path.
> > 
> > static int xhci_run_finished(struct xhci_hcd *xhci)
> > {
> >         if (xhci_start(xhci)) {
> >                 xhci_halt(xhci);
> >                 return -ENODEV;
> >         }
> >         xhci->shared_hcd->state = HC_STATE_RUNNING;
> > 
> > 
> > 
> > > Alan Stern
> > > 
> > >> What I can do: submit my patches as RFC, then there's a better basis
> > >> for a discussion.
> > >>
> > >>> Alan Stern
> > >>
> > >> Heiner
> > 
> > Heiner
