Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E2E455896
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 11:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244392AbhKRKJQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Nov 2021 05:09:16 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:63888 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245566AbhKRKHl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Nov 2021 05:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637229881; x=1668765881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HleeXH8B6oeGg1+n9shmvOVe5UfFWbY4qDls+b0ZvIQ=;
  b=niE4LwLxbdF8cCPz5L97yIGbGpVikUmq6AmLOw1wL1/hsUba2mSznQQg
   anAY1zSY8lqOHIa0fzk3TTiUlJh0G1TIW16K/HnvRuyTg4Jb6geaWP4/8
   ti/be9SWDcz0UzbRq8Sb0oKZ8eVdVaM1fcxTFKr9WnK+2dgLy0U8Z7QaS
   0=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Nov 2021 02:04:41 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 02:04:41 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 02:04:41 -0800
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 02:04:38 -0800
Date:   Thu, 18 Nov 2021 15:34:34 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Rohith Kollalsi <quic_rkollals@quicinc.com>
CC:     <mathias.nyman@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <quic_ajaya@quicinc.com>, <quic_pkondeti@quicinc.com>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 5.10 211/290] xhci: Fix repeated xhci wake after suspend
 due to uncleared internal wake state
Message-ID: <20211118100434.GA7133@hu-pkondeti-hyd.qualcomm.com>
References: <977d2868-e1cf-9b33-79b3-18e96b9a30c8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <977d2868-e1cf-9b33-79b3-18e96b9a30c8@quicinc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+linux-usb

On Thu, Nov 18, 2021 at 03:21:54PM +0530, Rohith Kollalsi wrote:
> Hi Mathias,
> 
> This mail is regarding your upstream change in xhci file. There is a
> potential issue with your change which can cause noc error due to unclocked
> access.
> 
> Consider a case where a headset is connected to device and nothing is
> playing. As nothing is playing, usb bus wouldn't be active which leads to
> run time suspend ( i think this feature is not present upstream) as a part
> of which xhci_suspend will be called. Now all the clocks are also switched
> off. Now again when pm_suspend occurs due to disconnect, then again
> xhci_suspend occurs, but now registers can be accessed with clocks off
> leading to unclocked access. Can you please consider below change to prevent
> unclocked access.
> 
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> 
> index 2728027..aaf212d 100644
> 
> --- a/drivers/usb/host/xhci.c
> 
> +++ b/drivers/usb/host/xhci.c
> 
> @@ -1013,13 +1013,13 @@ int xhci_suspend(struct xhci_hcd *xhci, bool
> do_wakeup)
> 
> xhci->shared_hcd->state != HC_STATE_SUSPENDED)
> 
>                 return -EINVAL;
> 
> +       if (!HCD_HW_ACCESSIBLE(hcd)) ---> this will prevent unclocked access
> when xhci_suspend occurs during second time during pm_suspend
> 
> + return 0;
> 
> +
> 
>         /* Clear root port wake on bits if wakeup not allowed. */
> 
>         xhci_disable_hub_port_wake(xhci, &xhci->usb3_rhub, do_wakeup);
> 
>         xhci_disable_hub_port_wake(xhci, &xhci->usb2_rhub, do_wakeup);
> 
> -       if (!HCD_HW_ACCESSIBLE(hcd))
> 
> -               return 0;
> 
> -
> 
>         xhci_dbc_suspend(xhci);
> 
> 
> Thanks,
> 
> Rohith
