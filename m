Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C62011C8F0
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 10:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbfLLJPg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 04:15:36 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7673 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728147AbfLLJPg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Dec 2019 04:15:36 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 3A52D29E94332A81BF15;
        Thu, 12 Dec 2019 17:15:34 +0800 (CST)
Received: from [127.0.0.1] (10.133.219.218) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Thu, 12 Dec 2019
 17:15:29 +0800
Message-ID: <5DF20530.2040509@huawei.com>
Date:   Thu, 12 Dec 2019 17:15:28 +0800
From:   zhong jiang <zhongjiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     <linux@roeck-us.net>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: typec: fusb302: Fix an undefined reference to 'extcon_get_state'
References: <1576136063-50916-1-git-send-email-zhongjiang@huawei.com> <20191212090132.GC31345@kuha.fi.intel.com>
In-Reply-To: <20191212090132.GC31345@kuha.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.219.218]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2019/12/12 17:01, Heikki Krogerus wrote:
> On Thu, Dec 12, 2019 at 03:34:23PM +0800, zhong jiang wrote:
>> Fixes the following compile error:
>>
>> drivers/usb/typec/tcpm/fusb302.o: In function `tcpm_get_current_limit':
>> fusb302.c:(.text+0x3ee): undefined reference to `extcon_get_state'
>> fusb302.c:(.text+0x422): undefined reference to `extcon_get_state'
>> fusb302.c:(.text+0x450): undefined reference to `extcon_get_state'
>> fusb302.c:(.text+0x48c): undefined reference to `extcon_get_state'
>> drivers/usb/typec/tcpm/fusb302.o: In function `fusb302_probe':
>> fusb302.c:(.text+0x980): undefined reference to `extcon_get_extcon_dev'
>> make: *** [vmlinux] Error 1
> There are stubs for those functions so that really should not be
> happening. I can not reproduce that.
It can be reproduced in next branch. you can try it in the latest next branch.

Thanks,
zhong jiang
> thanks,
>


