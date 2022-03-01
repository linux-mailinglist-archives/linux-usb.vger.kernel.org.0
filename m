Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DEA64C8086
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 02:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbiCABuk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Feb 2022 20:50:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232045AbiCABui (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Feb 2022 20:50:38 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB14565D5
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 17:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1646099397; x=1677635397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CNhNPw63oOkctaDS1zcz4weKP/zE5mnr1LLlYUXqf5g=;
  b=W3ohEh3s0NYm8fm8fbCVb1AF1NHQT/VSxHCnbmGqvleUqejk7GkZzm/j
   837ckXM2ofEjazk585Sv4MhZaA/6ZPl8YJblg1N7aUS9HgMzkEm2sSCb/
   H7588trVHI5m9ZOdnDKZKlQOIE9jH8cTbuIwUoCyJaOZBUMUFr5B5t0JD
   Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Feb 2022 17:49:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 17:49:52 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 28 Feb 2022 17:49:51 -0800
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 28 Feb 2022 17:49:51 -0800
Date:   Mon, 28 Feb 2022 17:49:49 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     <quic_pkondeti@quicinc.com>, <s.shtylyov@omp.ru>,
        <linux-usb@vger.kernel.org>
Subject: Re: [RFT PATCH] xhci: make xhci_handshake timeout for xhci_reset()
 adjustable
Message-ID: <20220301014949.GG13801@jackp-linux.qualcomm.com>
References: <20220217135643.1321889-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220217135643.1321889-1-mathias.nyman@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

Hi Mathias,

On Thu, Feb 17, 2022 at 03:56:43PM +0200, Mathias Nyman wrote:
> xhci_reset() timeout was increased from 250ms to 10 seconds in order to
> give Renesas 720201 xHC enough time to get ready in probe.

This suggests that the only place we really need the long timeout is
in xhci_gen_setup().

> @@ -1163,7 +1161,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>  		xhci_dbg(xhci, "Stop HCD\n");
>  		xhci_halt(xhci);
>  		xhci_zero_64b_regs(xhci);
> -		retval = xhci_reset(xhci);
> +		retval = xhci_reset(xhci, XHCI_RESET_LONG_USEC);

Since preemption is disabled here (spin_lock_irq() is called near the
start of this function), shouldn't we also limit this to 250ms here in
xhci_resume() as well?

>  		spin_unlock_irq(&xhci->lock);
>  		if (retval)
>  			return retval;
> @@ -5297,7 +5295,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>  
>  	xhci_dbg(xhci, "Resetting HCD\n");
>  	/* Reset the internal HC memory state and registers. */
> -	retval = xhci_reset(xhci);
> +	retval = xhci_reset(xhci, XHCI_RESET_LONG_USEC);
>  	if (retval)
>  		return retval;
>  	xhci_dbg(xhci, "Reset complete\n");

Thanks,
Jack
