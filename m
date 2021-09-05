Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0308040116F
	for <lists+linux-usb@lfdr.de>; Sun,  5 Sep 2021 21:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbhIEUAD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Sep 2021 16:00:03 -0400
Received: from informare.org ([217.11.52.70]:40650 "EHLO informare.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229865AbhIEUAC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Sep 2021 16:00:02 -0400
Received: (qmail 6999 invoked from network); 5 Sep 2021 19:58:56 -0000
Received: from unknown (HELO ?192.168.2.105?) (faber@faberman.de@87.133.154.214)
  by 0 with ESMTPA; 5 Sep 2021 19:58:56 -0000
Subject: Re: [PATCH] usb: core: Fix possible memleak in usb_add_gadget
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <311d64c6-f0e2-da42-5619-1efe46df0007@faberman.de>
 <YTTahtscWqQyY0CU@kroah.com>
 <dda401c9-2a0c-19a8-871e-28f1a903bcd4@faberman.de>
 <YTTv6u2FXTJFrSFx@kroah.com>
From:   Florian Faber <faber@faberman.de>
Message-ID: <ba414322-f2fa-ed2c-c5c3-1dfeb2b71688@faberman.de>
Date:   Sun, 5 Sep 2021 21:58:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTTv6u2FXTJFrSFx@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 9/5/21 6:27 PM, Greg KH wrote:
> On Sun, Sep 05, 2021 at 05:16:36PM +0200, Florian Faber wrote:
>> This 'leak' was found by Klocwork and seemed plausible at first oversight.
>> Sorry for wasting your time and not checking it further.
> 
> What is "Klockwork"? 

Some static code analysis tool. I did not know it either.

> How can it miss the reference counted logic that
> all drivers use in the kernel?

Obviously it is not running like clockwork :)

Anyway, got the problem fixed, sorry for the noise.


Flo
-- 
Machines can do the work, so people have time to think.
