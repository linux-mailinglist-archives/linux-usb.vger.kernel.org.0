Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34C904BB5D5
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 10:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbiBRJmB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 04:42:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233687AbiBRJl4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 04:41:56 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8685563E2
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 01:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645177300; x=1676713300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XF61TNKJo3cn+wx7nmOFsrwsLLuv2sfI9SfjoJaHEGs=;
  b=moCumHX4O4Yfm+U3ZcdlKrq046HJ0Hr1YXxgCLntsaKg+/FCqKNPSl7v
   vo5f0PX3mNjTzdqXfDo+yHIBjIt4VQLvH8w0bNYM3fPqx+kk29tT/sad4
   k8YVfAw1DgJ9iv8r7kSf2DRCQotEFkVV31gcKYMNiM50CMVmEsoc8i6Pi
   w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Feb 2022 01:41:39 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2022 01:41:39 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 18 Feb 2022 01:41:39 -0800
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 18 Feb 2022 01:41:37 -0800
Date:   Fri, 18 Feb 2022 15:11:33 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     <quic_pkondeti@quicinc.com>, <s.shtylyov@omp.ru>,
        <linux-usb@vger.kernel.org>
Subject: Re: [RFT PATCH] xhci: make xhci_handshake timeout for xhci_reset()
 adjustable
Message-ID: <20220218094133.GA28120@hu-pkondeti-hyd.qualcomm.com>
References: <20220217135643.1321889-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220217135643.1321889-1-mathias.nyman@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

On Thu, Feb 17, 2022 at 03:56:43PM +0200, Mathias Nyman wrote:
> xhci_reset() timeout was increased from 250ms to 10 seconds in order to
> give Renesas 720201 xHC enough time to get ready in probe.
> 
> xhci_reset() is called with interrupts disabled in other places, and
> waiting for 10 seconds there is not acceptable.
> 
> Add a timeout parameter to xhci_reset(), and adjust it back to 250ms
> when called from xhci_stop() or xhci_shutdown() where interrupts are
> disabled, and successful reset isn't that critical.
> 
> Additionally change the signed integer timeout parameter in
> xhci_handshake() to a u64 to match the timeout value we pass to
> readl_poll_timeout_atomic()
> 
> Reported-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Reported-by: Pavan Kondeti <quic_pkondeti@quicinc.com>
> Fixes: 22ceac191211 ("xhci: Increase reset timeout for Renesas 720201 host.")
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

We have tested the patch and found no issues. Since the issue happens
very rarely, we have included in our builds for the wider testing.

Thanks,
Pavan
