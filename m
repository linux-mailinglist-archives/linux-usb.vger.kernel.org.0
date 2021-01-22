Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B09E82FF9C7
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jan 2021 02:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbhAVBHT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 20:07:19 -0500
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21316 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbhAVBHS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jan 2021 20:07:18 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1611277592; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=W9mnvNV+tYhDrwJxESs5Tvlo3pySA0fzcQBT4rdDzVcsMbNr8y/xYci57jMvg0Hrms7z/iKhfv/v7DMrVathFzCq2casvWxJQFp4rvflNqBYMc7D+XEhlsg9nPz6UZPMOd57DwrnJIYn6TEmSWtJEEeicbbsAi/pVREYLOWVybA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1611277592; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=RYgGjWX2TP8SAtvfp8JgjqKdGxb+J8hzvadF3jRkj9s=; 
        b=L1EJRXPCjH3ItFaChUB3w5TA5eOUSzCfsYOaN/Mzs+RIDpn3WxyyWdeMHNpqgy6CIUvchGvbItkMXH1BVMTP8iA0nVQUYsjrK7krDW2uyam7CVQToO7/6bn1j8KD1aA0DFtPwz4INJj34wIwlrsAOADL4gSngcgOQ8heyScjckY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=jeremyfiggins.com;
        spf=pass  smtp.mailfrom=jeremy@jeremyfiggins.com;
        dmarc=pass header.from=<kernel@jeremyfiggins.com> header.from=<kernel@jeremyfiggins.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1611277592;
        s=zoho; d=jeremyfiggins.com; i=kernel@jeremyfiggins.com;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=RYgGjWX2TP8SAtvfp8JgjqKdGxb+J8hzvadF3jRkj9s=;
        b=U+AxSpiuWnVdqPFiOMk4uvp/QIk0+fM46rNf3eS0VJ+0MN0N4lnBNzZlCfP3YNn+
        LA42Ys17YQlikYeSzamsOO+pNSeaKC/KOvDj69p3byfQvtjHTkY5ls9RMLC5pXMaLoH
        XBfD1QOJc5peo3kT/7GoVTPpYA+zGD2nHF+0r760=
Received: from [192.168.100.110] (cpe-173-174-84-94.austin.res.rr.com [173.174.84.94]) by mx.zohomail.com
        with SMTPS id 1611277588828484.66588689679736; Thu, 21 Jan 2021 17:06:28 -0800 (PST)
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
To:     Pete Zaitcev <zaitcev@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <YASt5wgOCkXhH2Dv@watson>
 <20210117234416.49d59761@suzdal.zaitcev.lan>
 <20210118163117.GA142198@rowland.harvard.edu>
 <20210121131954.7103881d@suzdal.zaitcev.lan>
 <20210121192929.GA12502@rowland.harvard.edu>
 <20210121170249.4081af4c@suzdal.zaitcev.lan>
From:   Jeremy Figgins <kernel@jeremyfiggins.com>
Message-ID: <2d9bf7fd-918c-c5cb-d2d3-7cd9a86b451e@jeremyfiggins.com>
Date:   Thu, 21 Jan 2021 19:06:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121170249.4081af4c@suzdal.zaitcev.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/21/21 5:02 PM, Pete Zaitcev wrote:
> On Thu, 21 Jan 2021 14:29:29 -0500
> Alan Stern <stern@rowland.harvard.edu> wrote:
> 
>>> I'm also concerned about regressions. This is a legacy class driver,
>>> only used where CUPS is not applicable, mostly with truly ancient
>>> devices. So yes, setting a zero altsetting after enumeration should
>>> be unnecessary. But you never know with the old firmware.
> 
>> How about skipping the call whenever the interface has only one
>> altsetting?
> 
> Do you mean when it's only one and not equal to zero?
> 
> BTW, one other thing bothers me. Jeremy confirmed that my patch
> worked, which skips the call when USB_QUIRK_NO_SET_INTF is set.
> But if we look into drivers/usb/core/message.c, the control
> exchange to set the altsetting is skipped in that case anyway.
> So, usblp was calling usb_set_protocol, the suspect control was
> skipped, but something else caused a problem. Could it be the
> attempt to clear halt that triggered the problem?
> 
> -- Pete
> 


In my debugging, I found that it was the calls to usb_control_msg_send() 
in both usb_set_interface() and usb_clear_halt() caused the printer to 
lockup. I suppose another way to resolve this would to have a flag to 
prevent usb_clear_halt()'s call to usb_control_msg_send(), but I'm not 
an expert in USB, so I'm not sure of the ramifications of that.

-- Jeremy
