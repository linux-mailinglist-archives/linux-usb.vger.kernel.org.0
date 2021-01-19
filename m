Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D593E2FADE6
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 01:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390490AbhASAC5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 19:02:57 -0500
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21493 "EHLO
        sender4-of-o54.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731320AbhASACy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jan 2021 19:02:54 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1611014517; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=LGB7LL9J4Di9Z0ufwui9PmLqUDCZPbtGWS+bavwQA1Mj9478e2n/9wD9pCGw0ZrQLA5JVMVPP2S2y89oJrocTNNeukHz4cj76qhHoyWjTLMBzgU4Cdg7RpT9acLE0QmqLCURAinJmPdF003VBXAk61CdcruwEKZTTWGnoYEQ28c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1611014517; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=wQcYIYEMYIRU+gaSIpYVKunLq4k0qWdXF5ltnCIFRfU=; 
        b=eXx+rCqaWX31Qv0jxqGWRqi8of/C9jDtpoZGGQYA5HS8uD1xPAGwVSaC1h1sBspYt/uUfe3Bn+2nY6OAHFkiod8UKGh8jYQ0PpS5G5aq4MKs6/g3oCCDllmLwssCBd7sas5zqpZK3K6ar4C6IgOwBs0Zb270NvaIkXage5aTA+8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=jeremyfiggins.com;
        spf=pass  smtp.mailfrom=jeremy@jeremyfiggins.com;
        dmarc=pass header.from=<jeremy@jeremyfiggins.com> header.from=<jeremy@jeremyfiggins.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1611014517;
        s=zoho; d=jeremyfiggins.com; i=jeremy@jeremyfiggins.com;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=wQcYIYEMYIRU+gaSIpYVKunLq4k0qWdXF5ltnCIFRfU=;
        b=dgb+K48ehhIHJBuTxDJgCZR2EjtbhzJb8JOqsX3iGqyBH7siw0W21XWT+zsypAEt
        /RX0j1RpDHpmBo88587uLgmtWW12Hj8ipsU5IGUFcbn8/TLdDY55RVQhnxQqABrSOde
        Ax9Hj1Epgj/YKGHsJpwKYvxfeLB0qlgL0CCqBMFo=
Received: from [192.168.100.110] (cpe-173-174-84-94.austin.res.rr.com [173.174.84.94]) by mx.zohomail.com
        with SMTPS id 1611014514742652.98134512553; Mon, 18 Jan 2021 16:01:54 -0800 (PST)
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
To:     Michael Sweet <msweet@msweet.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Pete Zaitcev <zaitcev@redhat.com>,
        Jeremy Figgins <kernel@jeremyfiggins.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <YASt5wgOCkXhH2Dv@watson>
 <20210117234416.49d59761@suzdal.zaitcev.lan>
 <20210118163117.GA142198@rowland.harvard.edu>
 <B5544550-3209-4D98-ABA0-7FA389AED95F@msweet.org>
From:   Jeremy Figgins <jeremy@jeremyfiggins.com>
Message-ID: <60f051f2-55ad-ab2c-ee59-df00558506f5@jeremyfiggins.com>
Date:   Mon, 18 Jan 2021 18:01:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <B5544550-3209-4D98-ABA0-7FA389AED95F@msweet.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/18/21 10:43 AM, Michael Sweet wrote:
> FWIW, the CUPS libusb-based backend only sets the alt setting if there is more than 1 alt setting in the descriptor.
> 
> 
>> On Jan 18, 2021, at 11:31 AM, Alan Stern <stern@rowland.harvard.edu> wrote:
>>
>> On Sun, Jan 17, 2021 at 11:44:16PM -0600, Pete Zaitcev wrote:
>>> On Sun, 17 Jan 2021 15:36:39 -0600
>>> Jeremy Figgins <kernel@jeremyfiggins.com> wrote:
>>>
>>>> The naming is designed to mirror the existing
>>>> USB_QUIRK_NO_SET_INTF flag, but that flag is
>>>> not sufficient to make these devices work.
>>>> +	{ 0x0416, 0x5011, USBLP_QUIRK_NO_SET_INTF }, /* Winbond Electronics Corp. Virtual Com Port */
>>>
>>> Jeremy, thanks for the patch. It looks mostly fine code-wise (quirk is
>>> out of numerical order), but I have a question: did you consider keying
>>> off usblp->dev->quirks instead?
>>>
>>> How about this:
>>>
>>> diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
>>> index 37062130a03c..0c4a98f00797 100644
>>> --- a/drivers/usb/class/usblp.c
>>> +++ b/drivers/usb/class/usblp.c
>>> @@ -1315,7 +1315,11 @@ static int usblp_set_protocol(struct usblp *usblp, int protocol)
>>> 	alts = usblp->protocol[protocol].alt_setting;
>>> 	if (alts < 0)
>>> 		return -EINVAL;
>>> -	r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
>>> +	if (usblp->dev->quirks & USB_QUIRK_NO_SET_INTF) {
>>> +		r = 0;
>>> +	} else {
>>> +		r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
>>> +	}
>>> 	if (r < 0) {
>>> 		printk(KERN_ERR "usblp: can't set desired altsetting %d on interface %d\n",
>>> 			alts, usblp->ifnum);
>>
>> Would it be practical simply to skip the usb_set_interface() call
>> whenever alts is 0?  After all, devices use altsetting 0 by default; it
>> shouldn't be necessary to tell them to do so.
>>
>> Alan Stern
> 
> ________________________
> Michael Sweet
> 
> 
> 
 >
Pete, your proposed change does work. I created USBLP_QUIRK_NO_SET_INTF 
because I was concerned about overloading the meaning of 
USB_QUIRK_NO_SET_INTF, but if you think that's the better approach, I'm 
happy to resubmit the patch.

Alan, just to confirm, alts=0 for this device.


Jeremy Figgins



