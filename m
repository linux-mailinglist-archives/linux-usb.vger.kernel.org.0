Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32D629E43C
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 08:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbgJ2Hgq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 03:36:46 -0400
Received: from aibo.runbox.com ([91.220.196.211]:36748 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729275AbgJ2Hfu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 03:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
         s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
        bh=JIqnWcDCMM2wCHeIge9wQlpKu0B7BGQ9QB0S6y9WG/I=; b=EDCb2IcCn21aQwUBPTQ4Q8rrOb
        RYF5GwXx3W65puiA1TPBC3Wng0kjpjAg66YZpmPbIGUWFCYd8z+FCftiYR67EEky4OHXV6Bf7L5X4
        vHIb66GuRfh6nGwK+/QUcScF9nVt9U5/xbR3hVE4jgoqZEiXMBwlJNIP+PY5FoYAD/tkQvjo/qnmK
        lU7yV10ducDtL/tsC83ANXjs3RwUiIZZJofyMl14q7ExFSskaYoWMD0rjxoDq6nXo848JLDTCydi/
        1T3BVL+mKH12QR6kSFRMZcVKSNargWv3vyjGMKN1tHzVbM95k3c6kXXmLYFzw2GoXc3W6C5QPXmxV
        yXSh5jUg==;
Received: from [10.9.9.73] (helo=submission02.runbox)
        by mailtransmit02.runbox with esmtp (Exim 4.86_2)
        (envelope-from <m.v.b@runbox.com>)
        id 1kXyh3-00042q-6d; Thu, 29 Oct 2020 04:33:41 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated alias (536975)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kXygy-0008JZ-0D; Thu, 29 Oct 2020 04:33:36 +0100
Subject: Re: [PATCH 1/2] usbcore: Check both id_table and match() when both
 available
To:     Pany <pany@fedoraproject.org>, Bastien Nocera <hadess@hadess.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
References: <4cc0e162-c607-3fdf-30c9-1b3a77f6cf20@runbox.com>
 <20201022135521.375211-1-m.v.b@runbox.com>
 <20201022135521.375211-2-m.v.b@runbox.com>
 <4f367aba2f43b5e3807e0b01a5375e4a024ce765.camel@hadess.net>
 <CAE3RAxuUiejhQtByfgeORrjy6v=QAP4gPrv+L-Ez4roNNsQY=g@mail.gmail.com>
From:   "M. Vefa Bicakci" <m.v.b@runbox.com>
Message-ID: <299d5037-f8d7-b71a-f7e7-3a52c06221d2@runbox.com>
Date:   Wed, 28 Oct 2020 23:33:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAE3RAxuUiejhQtByfgeORrjy6v=QAP4gPrv+L-Ez4roNNsQY=g@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28/10/2020 00.00, Pany wrote:
> On Tue, Oct 27, 2020 at 6:25 PM Bastien Nocera <hadess@hadess.net> wrote:
>>
>> On Thu, 2020-10-22 at 09:55 -0400, M. Vefa Bicakci wrote:
>>> From: Bastien Nocera <hadess@hadess.net>
>>>
>>> From: Bastien Nocera <hadess@hadess.net>
>>>
>>> When a USB device driver has both an id_table and a match() function,
>>> make
>>> sure to check both to find a match, first matching the id_table, then
>>> checking the match() function.
>>>
>>> This makes it possible to have module autoloading done through the
>>> id_table when devices are plugged in, before checking for further
>>> device eligibility in the match() function.
>>>
>>> Signed-off-by: Bastien Nocera <hadess@hadess.net>
>>> Cc: <stable@vger.kernel.org> # 5.8
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: Alan Stern <stern@rowland.harvard.edu>
>>> Co-developed-by: M. Vefa Bicakci <m.v.b@runbox.com>
>>> Signed-off-by: M. Vefa Bicakci <m.v.b@runbox.com>
>>
>> You can also add my:
>> Tested-by: Bastien Nocera <hadess@hadess.net>
>>
> 
> This patch works well for me.
> Tested-by: Pan (Pany) YUAN <pany@fedoraproject.org>

I realize that I am a bit late to do this, but I would like to thank
Bastien and Pany for their efforts in testing (Bastien and Pany) and
co-developing (Bastien) the patches.

Thanks as well to Greg Kroah-Hartman for committing the patches to
the usb-linus branch of the usb git tree and for fixing up the patch
descriptions while doing so.

Thanks everyone!

Vefa
