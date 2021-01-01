Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0941F2E85AB
	for <lists+linux-usb@lfdr.de>; Fri,  1 Jan 2021 22:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbhAAVSu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Jan 2021 16:18:50 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:33943 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727336AbhAAVSu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Jan 2021 16:18:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609535906; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=YvFR1CWcynlGccEMLQx5lA2MAZqTPCovIFKJoGRHG9E=; b=wUcKFb7aDdcrfy2YfGzEVszuJBhLjUTLmCq77/r3fZdPXotBuIh0GQD5znJuM2CJSQD58LWx
 uKt1u5cO11Es0EdZNifwALkK8bpHF47P3pYWQ7ipRnLjrvWpfGZfG54AvnxVD0nTCUpRfxui
 8b8ynliZ1uSoCbyWLw0r7V/TJ2Q=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fef9178b73be0303d8d7bbb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Jan 2021 21:17:44
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E33EFC43461; Fri,  1 Jan 2021 21:17:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A0972C433C6;
        Fri,  1 Jan 2021 21:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A0972C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Fri, 1 Jan 2021 13:17:37 -0800
From:   Jack Pham <jackp@codeaurora.org>
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v2] usb: gadget: configfs: Preserve function ordering
 after bind failure
Message-ID: <20210101211737.GA29962@jackp-linux.qualcomm.com>
References: <20201229224443.31623-1-jackp@codeaurora.org>
 <20201231100122.GA12514@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201231100122.GA12514@b29397-desktop>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 31, 2020 at 06:04:00PM +0800, Peter Chen wrote:
> On 20-12-29 14:44:43, Jack Pham wrote:
> > From: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> > 
> > When binding the ConfigFS gadget to a UDC, the functions in each
> > configuration are added in list order. However, if usb_add_function()
> > fails, the failed function is put back on its configuration's
> > func_list and purge_configs_funcs() is called to further clean up.
> > 
> > purge_configs_funcs() iterates over the configurations and functions
> > in forward order, calling unbind() on each of the previously added
> > functions. But after doing so, each function gets moved to the
> > tail of the configuration's func_list. This results in reshuffling
> > the original order of the functions within a configuration such
> > that the failed function now appears first even though it may have
> > originally appeared in the middle or even end of the list. At this
> > point if the ConfigFS gadget is attempted to re-bind to the UDC,
> > the functions will be added in a different order than intended,
> > with the only recourse being to remove and relink the functions all
> > over again.

<snip>

> Hi Jack,
> 
> I am curious what features are broken if the functions are added with
> not planned order?

Hi Peter,

This is mainly an issue for devices with functions that use vendor-
specific instead of standard class/subclass IDs for their interface
descriptors. Android ADB and Qualcomm QMI are a couple examples. So
host interface drivers would only be able to install or bind based on
matching VID/PID and interface position only. This is true for both
Windows as well as Linux (see USB_DEVICE_INTERFACE_NUMBER).

So if the gadget's function bind order gets jumbled up from the intended
order, the resulting assigned interface numbers would be different and
the host would not match its drivers to the correct interface. Instead
we see the host driver gets bound but the endpoints it communicates with
are wrong as they are for a completely different interface.

Thanks,
Jack

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
