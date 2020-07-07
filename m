Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F18B2175DC
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 20:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728100AbgGGSGP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 14:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728036AbgGGSGP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 14:06:15 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3135C061755
        for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2020 11:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=YZ5bgYiAuxABwYCRw3zrzezIaa/kUGpNb13SbssMxfw=; b=NYzoOqQUgIReU1p4IRkYkh1Gxx
        jV6XOWmrfENYquQ9C1JL1CSL0Gbr0T/wrtzmbsLAtROZaQaS7FByDVI/+ZD1u72hjQ39xitguO0Vy
        sJKAxeDzJ+4549YqM6i88021HLuJvV9c4f+mAmqrJY1QYeUobntKQ0IS8RoScYTVBNRXJj7+UGhEs
        W5zdYeQx1PAb1sz2OP5w8lv87PbVRo2x6vZUunmBBa6/a/eUq1ejE4Wg2zk9cbqlY39ZCyDrLxhj1
        0yLGWNHjiLT3Ss9IK5RpkrW4FXVr6aryUaYXFH05bpfA0U7x2GuX/UbGK2gXpTeNYbA7v5YMT+IBS
        tyObitwQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jsryt-0004Ur-G3; Tue, 07 Jul 2020 18:06:12 +0000
Subject: Re: [PATCH 2/2] usb: correct kernel-doc inconsistency
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Colton Lewis <colton.w.lewis@protonmail.com>,
        gregkh@linuxfoundation.og, balbi@kernel.org,
        linux-usb@vger.kernel.org
References: <20200707045207.235540-1-colton.w.lewis@protonmail.com>
 <20200707045207.235540-2-colton.w.lewis@protonmail.com>
 <36ce325b-3c64-1e7b-f56a-7c3251e8bdfe@infradead.org>
 <20200707180255.GB252415@kroah.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <289ebadd-6474-bb75-488a-fa87f3181ec5@infradead.org>
Date:   Tue, 7 Jul 2020 11:06:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707180255.GB252415@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/7/20 11:02 AM, Greg KH wrote:
> On Mon, Jul 06, 2020 at 10:17:12PM -0700, Randy Dunlap wrote:
>> On 7/6/20 9:52 PM, Colton Lewis wrote:
>>> Silence documentation build warning by correcting kernel-doc comments
>>> for usb_device and usb_device_driver structs.
>>>
>>> ./include/linux/usb.h:713: warning: Function parameter or member 'use_generic_driver' not described in 'usb_device'
>>> ./include/linux/usb.h:1253: warning: Function parameter or member 'match' not described in 'usb_device_driver'
>>> ./include/linux/usb.h:1253: warning: Function parameter or member 'id_table' not described in 'usb_device_driver'
>>>
>>> Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
>>
>> Hi,
>> I also sent a patch for this on June 28.
> 
> Its' in linux-next, right?

Yes, it is.

> thanks,
> 
> greg k-h


ta.
-- 
~Randy

