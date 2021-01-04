Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25682E9158
	for <lists+linux-usb@lfdr.de>; Mon,  4 Jan 2021 08:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbhADH4x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Jan 2021 02:56:53 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:22833 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbhADH4x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Jan 2021 02:56:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609746987; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=QH5dLlO9ci3tSdejTFTu+NB+35TckESXvOQUVKpLLw8=; b=SLCm+9McikQTMohlomqQiaSts76zdcmSUcRcl1+jgox3Onymfxvmq42uCkJJW8o6PsllVoO6
 7fT6gphrFXlB3NpSNrO4yoOQy4JCtZE4MbEmne6qEB/+sr1SqG65Q6vWe1mteataqddK1zmt
 +gPGrUrYQuTYxgxaM5Ij+WbzJRs=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ff2ca113d849691148c9fc6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Jan 2021 07:56:01
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B77FAC433C6; Mon,  4 Jan 2021 07:56:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 638ACC433CA;
        Mon,  4 Jan 2021 07:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 638ACC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Sun, 3 Jan 2021 23:55:54 -0800
From:   Jack Pham <jackp@codeaurora.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Peter Chen <hzpeterchen@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v2] usb: gadget: configfs: Preserve function ordering
 after bind failure
Message-ID: <20210104075554.GA32023@jackp-linux.qualcomm.com>
References: <20201229224443.31623-1-jackp@codeaurora.org>
 <20201231100122.GA12514@b29397-desktop>
 <20210101211737.GA29962@jackp-linux.qualcomm.com>
 <DBBPR04MB7979B180D10CCDB1E2B4C3B78BD20@DBBPR04MB7979.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBBPR04MB7979B180D10CCDB1E2B4C3B78BD20@DBBPR04MB7979.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Mon, Jan 04, 2021 at 12:58:39AM +0000, Peter Chen wrote:
> > > Hi Jack,
> > >
> > > I am curious what features are broken if the functions are added with
> > > not planned order?
> > 
> > Hi Peter,
> > 
> > This is mainly an issue for devices with functions that use vendor- specific
> > instead of standard class/subclass IDs for their interface descriptors. Android
> > ADB and Qualcomm QMI are a couple examples. So host interface drivers
> > would only be able to install or bind based on matching VID/PID and interface
> > position only. This is true for both Windows as well as Linux (see
> > USB_DEVICE_INTERFACE_NUMBER).
> > 
> > So if the gadget's function bind order gets jumbled up from the intended order,
> > the resulting assigned interface numbers would be different and the host would
> > not match its drivers to the correct interface. Instead we see the host driver
> > gets bound but the endpoints it communicates with are wrong as they are for a
> > completely different interface.
>  
> Thanks for your information, jack. But does Android ADB has specific host driver, I am
> assumed it uses drivers/usb/core/devio.c, am I wrong?

That is true for the Linux ADB client; it does use usbdevfs directly,
and it does match based on the vendor Class/Subclass/Protocol so it's
generally not a problem for ADB connected to Linux hosts.

However for the Windows adb.exe client, it uses the native WinUSB
driver which typically needs an associated INF file to declare what
VID/PID/Interface is to be used for the ADB interface. (Alternatively,
the WinUSB driver can be automatically installed if the device provides
MSFT OS Descriptors during enumeration to indicate if an interface uses
WinUSB, so that might avoid requiring an INF file.) But regardless, in
either case the installed driver information gets stored in the Windows
registry and is always tied to VID/PID/Interface, so subsequent
connections to the same device must always enumerate in the same
function order otherwise the problem I stated above will happen.

Further, if a device has a QMI interface (we have downstream QMI
function drivers that many commercial Android devices use) that
drivers/net/usb/qmi_wwan.c is expecting to bind to, because the majority
of the usb_device_id entries in this driver uses QMI_FIXED_INTF /
USB_DEVICE_INTERFACE_NUMBER, these devices could unfortunately suffer
this problem if the function bind order is not guaranteed and the
interface appears in a different position than expected.

Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
