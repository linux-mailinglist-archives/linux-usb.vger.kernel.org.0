Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388343017B7
	for <lists+linux-usb@lfdr.de>; Sat, 23 Jan 2021 19:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbhAWSq7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Jan 2021 13:46:59 -0500
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21369 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbhAWSq5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Jan 2021 13:46:57 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1611427570; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=fe+enLh62sWyuFUP1XdrBDLjdaHBtXjHOcvaim+SZnhrG5NpB1zc0leU3Scc2yLSDA5TtSdQOXBFgIBUF3Rx4eyPhQ0siwIDFGsZ4qpQyCLJS6RjB/Ix56FbZQXU/xUlCx/CkjeJR+B/WX8pA/VE1yAn+4SM0DfYXiO6xVwMG9E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1611427570; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=2mWSg5xGYWiOljvxm/KbEWHdZ8NKLtfgraivi2eqCrQ=; 
        b=hlgpmm35C7LsUpP9wFy6vqyHfWkho7yFY950pDPXzoaLqi0rwCt1DusOqZjE5ViQMaL6/UtZhj1j83ATbNja2SncMpmnuPXn9o0n3y/YJakJrc8VJEHiC198W/1BjteEc6v+26h5NaGsQ/ihFQ+OzTCkJjRbyDE8hksZUTlA5rw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=jeremyfiggins.com;
        spf=pass  smtp.mailfrom=jeremy@jeremyfiggins.com;
        dmarc=pass header.from=<kernel@jeremyfiggins.com> header.from=<kernel@jeremyfiggins.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1611427570;
        s=zoho; d=jeremyfiggins.com; i=kernel@jeremyfiggins.com;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=2mWSg5xGYWiOljvxm/KbEWHdZ8NKLtfgraivi2eqCrQ=;
        b=UAgeqdRYh6YM/mvBXkExOvRGNTXVN/FB8m84QY+fgQOZfSAOzQA0ZAqEUw+Lqv62
        P2uyRtoy3jsKqksRziEpS08T8zfqCz909NJmX2txwjR89uDismNj+2vDRucOgNGVLgh
        xlvsO5zyf2ATxC5yKB9nDSeT2zW4WYHzj+9p0x/M=
Received: from [192.168.100.110] (cpe-173-174-84-94.austin.res.rr.com [173.174.84.94]) by mx.zohomail.com
        with SMTPS id 1611427567711797.3669163000513; Sat, 23 Jan 2021 10:46:07 -0800 (PST)
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Pete Zaitcev <zaitcev@redhat.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
References: <YASt5wgOCkXhH2Dv@watson>
 <20210117234416.49d59761@suzdal.zaitcev.lan>
 <20210118163117.GA142198@rowland.harvard.edu>
 <20210121131954.7103881d@suzdal.zaitcev.lan>
 <20210121192929.GA12502@rowland.harvard.edu>
 <20210121170249.4081af4c@suzdal.zaitcev.lan>
 <2d9bf7fd-918c-c5cb-d2d3-7cd9a86b451e@jeremyfiggins.com>
 <20210122162212.GB43566@rowland.harvard.edu>
From:   Jeremy Figgins <kernel@jeremyfiggins.com>
Message-ID: <15c2f9ba-a3c1-ebc4-25f4-f8c3df269807@jeremyfiggins.com>
Date:   Sat, 23 Jan 2021 12:46:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122162212.GB43566@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/22/21 10:22 AM, Alan Stern wrote:
> On Thu, Jan 21, 2021 at 07:06:27PM -0600, Jeremy Figgins wrote:
>> On 1/21/21 5:02 PM, Pete Zaitcev wrote:
>>> On Thu, 21 Jan 2021 14:29:29 -0500
>>> Alan Stern <stern@rowland.harvard.edu> wrote:
>>>
>>>>> I'm also concerned about regressions. This is a legacy class driver,
>>>>> only used where CUPS is not applicable, mostly with truly ancient
>>>>> devices. So yes, setting a zero altsetting after enumeration should
>>>>> be unnecessary. But you never know with the old firmware.
>>>
>>>> How about skipping the call whenever the interface has only one
>>>> altsetting?
>>>
>>> Do you mean when it's only one and not equal to zero?
>>>
>>> BTW, one other thing bothers me. Jeremy confirmed that my patch
>>> worked, which skips the call when USB_QUIRK_NO_SET_INTF is set.
>>> But if we look into drivers/usb/core/message.c, the control
>>> exchange to set the altsetting is skipped in that case anyway.
>>> So, usblp was calling usb_set_protocol, the suspect control was
>>> skipped, but something else caused a problem. Could it be the
>>> attempt to clear halt that triggered the problem?
>>>
>>> -- Pete
>>>
>>
>>
>> In my debugging, I found that it was the calls to usb_control_msg_send() in
>> both usb_set_interface() and usb_clear_halt() caused the printer to lockup.
>> I suppose another way to resolve this would to have a flag to prevent
>> usb_clear_halt()'s call to usb_control_msg_send(), but I'm not an expert in
>> USB, so I'm not sure of the ramifications of that.
> 
> The simplest solution in all cases is just to avoid calling either
> usb_set_interface or usb_clear_halt.  Especially since in cases where
> the interface has only one altsetting, neither call should be necessary.
> 
> Alan Stern
> 

I can confirm that only calling usb_clear_halt() if 
USB_QUIRK_NO_SET_INTF is not set (and setting it for my device) does 
allow my device to work. What is the next step? Should I submit a v2 patch?

-- Jeremy
