Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC973F76A0
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 15:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241541AbhHYNyY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 09:54:24 -0400
Received: from mail.huberulrich.de ([81.169.200.209]:41747 "EHLO
        mail.huberulrich.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240708AbhHYNyX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Aug 2021 09:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=huberulrich.de; s=2017; c=relaxed/relaxed;
 q=dns/txt; h=from:date:to:cc:message-id:subject;
 bh=3dX6h3y3vym7YbhKZhUGCbj9mPX5l6cdO2tWOY2D4Wk=;
 b=D1g0okCEhZyJHKc4PlplEvyzyz8/APTXOJPinEtDoFZoQaxL8vP72VOlvCsVyogCLC0emFIUoRN7ADv+ujGdAGbjWas4b6XK2iojv1MzdV5vFu2FiRkHEcXlJ4zdUb72slsPISKmwOTxGlU5OCRlIk5f6kOa1o5DTXkDXFmrJbwON133yDZPss7lQz+Pl2ndcObkrCGjaxuGXMfHOtQcp5Q5Plf6t4Jeb82LmLjzmTl620R2I1JOnIMYYVB7ZrQQzJYv4lhQKXJ3HB7D1FMM9iCFpzXYmavJkDskq34X8JW+ZAGEmBo6k7oioP5irRmx1vZm6DfQSBeZSb/jI03pMw==;
DomainKey-Signature: a=rsa-sha1;
 b=vjuuXdLoHcy4i2Mxe6ge6vAsoDJveRAGorIBE8ayfCLw8m1KSoV4NWUMWchFV/U90QihECmsV991iBmyJMy/P/j8uK+7KeZ2c5zJi1TVvr88mw9ECy70Jnsm6EvLG4ZNM7xMP1GaXqOTPDFSFA5fRt2QQslMlt245tZr9rY78kT3+qKO3+y2KVoQiFNSWok4pxnVujtm/bHI641hgPAbN4HzzMB7TATiUHgWNbJGXURP1kK8ocJGfF8hWLBkTTA4/0mQ9JNHA13sC336KeF0UMY7jbUkakrB88/Pk3sNqzksomUSgBarGF3pRqU0qEJW/atMEqzb74t3OqXwrWcOtw==;
 c=nofws; q=dns; d=huberulrich.de; s=2017;
 h=subject:to:cc:from:message-id:date;
Received: from [IPv6:2001:16b8:383a:7a00:76f6:3f2d:1d03:ccef]
 (2001:16b8:383a:7a00:76f6:3f2d:1d03:ccef) by mail.huberulrich.de (Axigen)
 with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) ESMTPSA id 2537F9;
 Wed, 25 Aug 2021 13:53:30 +0000
Subject: Re: ucsi_acpi GET_CONNECTOR_STATUS failed (-5)
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <b36249c5-776a-9338-bb9f-ae6a5c446860@huberulrich.de>
 <YSX7hZnCoFSXTFJe@kuha.fi.intel.com>
From:   Ulrich Huber <ulrich@huberulrich.de>
Message-ID: <0e77017d-9358-a691-6293-234fcbab6a31@huberulrich.de>
Date:   Wed, 25 Aug 2021 15:53:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSX7hZnCoFSXTFJe@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: 
X-AXIGEN-SPF-Result: Ok
X-AXIGEN-DK-Result: Ok
DomainKey-Status: good
X-AXIGEN-DKIM-Result: Ok
DKIM-Status: good
X-AxigenSpam-Level: 5
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,
Thanks for the quick answer.
> Thanks for the report. Can you test this with kernel v5.10?

I tested kernel v5.10 and could not reproduce this specific error. 
Instead I received the following warning on a single occasion:

ucsi_acpi USBC000:00: UCSI_GET_PDOS returned 0 bytes

Right before I received this warning, I plugged in and immediately 
unplugged the charging cable again. So I might have disrupted the driver 
during the retrieval of the new device state.

> I'm wondering if commit 217504a05532 ("usb: typec: ucsi: Work around
> PPM losing change information") causes that GET_CONNECTOR_STATUS
> failure.

Quite interesting, as I thought this as the most likely culprit as well 
when I took a look at the driver.

As I have to build the kernel v5.14-rc7 manually to include another 
bugfix, I'll throw in a few more debug messages to find out which step 
fails and if possible to get some more details on the cause. Could you 
point me to things I should take a look at, to narrow down the issue?

Thanks,

Ulrich

