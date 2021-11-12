Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070D744EE57
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 22:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235678AbhKLVJT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 16:09:19 -0500
Received: from dynamic-077-003-058-000.77.3.pool.telefonica.de ([77.3.58.0]:50014
        "EHLO vacharakis.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235619AbhKLVJT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 16:09:19 -0500
X-Greylist: delayed 515 seconds by postgrey-1.27 at vger.kernel.org; Fri, 12 Nov 2021 16:09:18 EST
Received: from [192.168.1.209] (router.lan [192.168.1.1])
        by vacharakis.de (Postfix) with ESMTP id 3ED233C3B7C;
        Fri, 12 Nov 2021 21:57:48 +0100 (CET)
Message-ID: <143be825-7480-db76-46c4-e5e0d332e98a@vacharakis.de>
Date:   Fri, 12 Nov 2021 21:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Content-Language: de-DE
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <139f5577-4a0c-a073-6320-a2697eddadc6@vacharakis.de>
 <20211112154052.GB32928@rowland.harvard.edu>
 <c9c65f98-b766-f110-26c0-a4187fe7bb8d@vacharakis.de>
 <20211112162316.GC32928@rowland.harvard.edu>
 <bfc48a4a-9648-dee8-20b0-dadfafa508e7@vacharakis.de>
 <20211112175150.GA37212@rowland.harvard.edu>
 <31548846-8ff4-9297-10b3-4f543ee0a5e0@vacharakis.de>
 <20211112204957.GA39387@rowland.harvard.edu>
From:   DocMAX <mail@vacharakis.de>
In-Reply-To: <20211112204957.GA39387@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

So the problem is the device, not a driver issue? Wasn't aware of this. 
Then do what has to be done. Thanks.
I read of lots of UAS issues with other hardware. Can someone recomment 
a chipset which works rocket solid on linux with uas?
I don't want to do without UAS.


On 12.11.21 21:49, Alan Stern wrote:
> I don't understand what you mean.  How could I fix a broken device?

