Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282A91E658F
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 17:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404134AbgE1PMc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 11:12:32 -0400
Received: from mail.codeweavers.com ([50.203.203.244]:39432 "EHLO
        mail.codeweavers.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403787AbgE1PMb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 11:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hc9IKmxCDSM3OtAJSMn2ZsIUD6no5/0eUxLuxHroc3g=; b=qr6bnG7DyMVQrSUfBv70o78bQn
        fTFg6Jgd0ZLkhPGgAyGQOQcix/E4Vu6/JOvEFFWyuKgEEvkF7acH44U5ITY2TeZ40rpQLMqxqHnJQ
        LVBXYk2ONufYF7C+U1Vfr8j1ewPu1K9H2XDE69wkFO3JYmIrYsV5mrLzf/JT7SEbFV5o=;
Received: from [64.191.7.9] (helo=[192.168.1.115])
        by mail.codeweavers.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <zfigura@codeweavers.com>)
        id 1jeKCp-0001OH-VP; Thu, 28 May 2020 10:12:29 -0500
Subject: Re: Bug 207877: ASMedia drive (174c:55aa) hangs in ioctl
 CDROM_DRIVE_STATUS when mounting a DVD
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org
References: <7d0b20b9-4735-bbed-bb50-72764aefd6d8@codeweavers.com>
 <20200528075440.GA2881385@kroah.com>
From:   Zebediah Figura <zfigura@codeweavers.com>
Message-ID: <465eaae3-fa60-f37e-1d62-c52236720798@codeweavers.com>
Date:   Thu, 28 May 2020 10:02:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528075440.GA2881385@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Score: -26.0
X-Spam-Report: Spam detection software, running on the system "mail.codeweavers.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/28/20 2:54 AM, Greg KH wrote: > On Wed, May 27, 2020
   at 11:23:13PM -0500, Zebediah Figura wrote: >> Hello all, >> >> I was asked
    to report this bug here. There's more details in the bug report, > [...] 
 Content analysis details:   (-26.0 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  -20 USER_IN_WHITELIST      From: address is in the user's white-list
 -6.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -0.5 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                             [score: 0.0000]
  0.5 AWL                    AWL: Adjusted score from AWL reputation of From: address
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/28/20 2:54 AM, Greg KH wrote:
> On Wed, May 27, 2020 at 11:23:13PM -0500, Zebediah Figura wrote:
>> Hello all,
>>
>> I was asked to report this bug here. There's more details in the bug report,
>> but it's been proposed that there's a deadlock between device_reset() in
>> scsiglue.c and usb_stor_control_thread().
> 
> What bug report where?  Can you provide a link and the details here in
> the email?

Oops, meant to link it and forgot. Sorry about that.

https://bugzilla.kernel.org/show_bug.cgi?id=207877

> 
> thanks,
> 
> greg k-h
> 

