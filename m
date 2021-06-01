Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE6A3397789
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 18:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbhFAQLg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 12:11:36 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:19663 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFAQLc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Jun 2021 12:11:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622563791; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=YD9Te9xxynozY/igPKoTfdG5+5R2V/aFcwGtU5jYhEE=; b=eF7D3cz1POyyMiONxRIJwYN68O8BFOs+X5Y40EehEYwI0iNygWTr1TY+kgglhEaSmbnAasuS
 4TSrsz1OsgjATrpypCWWz/Qt/KNw9yGzhi3pDB4UjrboZgV61GDv+lEHCzPHrFlcoqB2iqsW
 iQki8QC84s8hkL4eIRK/KECxR88=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60b65bb7ed59bf69cce54ff5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Jun 2021 16:09:27
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4867BC433F1; Tue,  1 Jun 2021 16:09:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7810DC433D3;
        Tue,  1 Jun 2021 16:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7810DC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Tue, 1 Jun 2021 09:09:10 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: debugfs: Add and remove endpoint dirs
 dynamically
Message-ID: <20210601160910.GA4812@jackp-linux.qualcomm.com>
References: <20210529192932.22912-1-jackp@codeaurora.org>
 <20210601070744.GA9087@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601070744.GA9087@nchen>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Tue, Jun 01, 2021 at 03:07:44PM +0800, Peter Chen wrote:

<snip>

> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index 65d9b7227752..dbba31d415d7 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -2754,6 +2754,8 @@ static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum)
> >  	INIT_LIST_HEAD(&dep->started_list);
> >  	INIT_LIST_HEAD(&dep->cancelled_list);
> >  
> > +	dwc3_debugfs_create_endpoint_dir(dep);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -2797,6 +2799,7 @@ static void dwc3_gadget_free_endpoints(struct dwc3 *dwc)
> >  			list_del(&dep->endpoint.ep_list);
> >  		}
> >  
> > +		debugfs_remove_recursive(debugfs_lookup(dep->name, dwc->root));
> 
> There is one more debugfs_remove_recursive at dwc3_debugfs_exit, need to delete?

No I think it should be fine. dwc3_debugfs_exit() is only called by
dwc3_remove(), and at that time it removes the debugfs directory for the
entire instance from dwc->root, which includes the parent and all the
endpoint subdirectories if present.

dwc3_core_exit_mode() -> dwc3_gadget_exit() is done after that, by which
point the debugfs remove here at dwc3_gadget_free_endpoints() will be
redundant and a no-op anyway.

Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
