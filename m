Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 025BADE374
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 07:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfJUFEt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 01:04:49 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:57206 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbfJUFEt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Oct 2019 01:04:49 -0400
Received: from [82.113.121.227] (helo=[192.168.42.130])
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <ben@besd.de>)
        id 1iMPs6-0001ve-SS; Mon, 21 Oct 2019 07:04:47 +0200
Subject: Re: [USB EHCI DRIVER] [Regression] EHCI no longer working in 5.4
 series kernel
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        hch@lst.de
References: <Pine.LNX.4.44L0.1910171830550.4074-100000@netrider.rowland.org>
 <5328c3b3-d527-42a6-d3b8-18a4ef842227@besd.de>
 <20191020205529.GA2451134@rani.riverdale.lan>
From:   Ben <ben@besd.de>
Message-ID: <4c219b83-4e29-6042-4a73-5bba6a721554@besd.de>
Date:   Mon, 21 Oct 2019 07:04:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020205529.GA2451134@rani.riverdale.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Con-Id: 150997
X-Con-U: 0-ben
X-Originating-IP: 82.113.121.227
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks,

I could have sworn I checked lkml. Thanks for the fix!

Any idea why only ehci is affected?

Seems a bit odd, that's why I thought it would be a problem with usb driver.

Cheers,
Benedikt

Am 20.10.19 um 22:55 schrieb Arvind Sankar:
> On Sat, Oct 19, 2019 at 02:52:16PM +0200, Benedikt Schemmer wrote:
>> reverting that specific commit on top of todays linux git (d418d070057c) produces a good kernel
> Hi Ben, the fix is in https://lore.kernel.org/lkml/20191008143357.GA599223@rani.riverdale.lan/
>> Am 18.10.19 um 00:31 schrieb Alan Stern:
>>> On Thu, 17 Oct 2019, Benedikt Schemmer wrote:
>>>
>>>> Hi all,
>>>>
>>>> I recently started compiling the 5.4. kernel starting with rc3 and noticed that both my keyboard and mouse aren't working
>>>> when connected to the motherboards USB ports (they work fine when connected to an xhci extension card) and they work fine
>>>> with the 5.3 series up to 5.3.6
>>> Can you use git bisect to track the problem down to a particular commit?
>>>
>>> Alan Stern
>>>
