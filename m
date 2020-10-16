Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A956328FF17
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 09:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394553AbgJPH3W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 03:29:22 -0400
Received: from z5.mailgun.us ([104.130.96.5]:33658 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394538AbgJPH3V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 16 Oct 2020 03:29:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602833361; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Date: Message-ID: To: Subject: From: Sender;
 bh=w9RENefpEHVBLnoheMablVJhWEoN97yjU05qvSH4DMM=; b=fgV4AlT3it9RQv4xiiBH6hb4FgeniK9ZtbuQSQm63/PeWc+4EI6ICvxMpHk+h9alXIDikQyW
 9BTC+XyDOf2/hapY5/GbOzVxeHg2ZyODgedvvlx3s0LMOJkDi93Io0jsnJTbvIolFH+eXoFU
 Jw4hZDoGvUoBH5WbDx7K/9b1g0A=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f894bd083370fa1c195e464 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 07:29:20
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D7A85C433F1; Fri, 16 Oct 2020 07:29:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.74.119] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 690A9C433FE
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2020 07:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 690A9C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
Subject: dwc3: Power management for cable disconnect
To:     Linux USB List <linux-usb@vger.kernel.org>
Message-ID: <0fe1cf51-c9d4-9780-e542-a613bba58928@codeaurora.org>
Date:   Fri, 16 Oct 2020 00:29:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi linux-usb members!

I was looking at seeing how the DWC3 drivers are handling the USB cable
disconnect routine (VBUS low situation) when there is no UDC binded.  Is
the below behavior expected?

1.  Enumerate device w/ host.
2.  Gadget is unbinded
	- echo "" > /sys/kernel/config/usb_gadget/g1/UDC
3.  Disconnect the USB cable (VBUS low)
4.  No dwc3_gadget_disconnect_interrupt() seen (since controller is
   halted from step#1)
5.  Runtime PM autosuspend fails due to "dwc->connected" being true
(cleared in dwc3_gadget_disconnect_interrupt())
6.  Gadget binded
	- echo udc_name > /sys/kernel/config/usb_gadget/g1/UDC
7.  No runtime suspend until cable is plugged in and out

This would be problematic for devices which have to reliably enter
suspend.  I just wanted to see if this is a scenario which has been
considered?  Seems odd that we would still keep the controller out of
low power if there was no cable connected.

Thanks

Regards,
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
