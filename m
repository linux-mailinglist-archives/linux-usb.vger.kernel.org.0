Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB1C34C37A
	for <lists+linux-usb@lfdr.de>; Mon, 29 Mar 2021 08:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhC2GDi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Mar 2021 02:03:38 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14940 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhC2GD3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Mar 2021 02:03:29 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F825k0cqczkgPx;
        Mon, 29 Mar 2021 14:01:46 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Mar 2021
 14:03:19 +0800
Subject: Re: [PATCH] usb: dwc2: add parenthess and space around *
To:     Greg KH <greg@kroah.com>, Tian Tao <tiantao6@hisilicon.com>
CC:     <hminas@synopsys.com>, <linux-usb@vger.kernel.org>
References: <1616988705-27062-1-git-send-email-tiantao6@hisilicon.com>
 <YGFgWBh4J7qwQzRi@kroah.com>
From:   "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <0af7faf5-186e-cca1-049b-4a4a9110d5f6@huawei.com>
Date:   Mon, 29 Mar 2021 14:03:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YGFgWBh4J7qwQzRi@kroah.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


ÔÚ 2021/3/29 13:06, Greg KH Ð´µÀ:
> On Mon, Mar 29, 2021 at 11:31:45AM +0800, Tian Tao wrote:
>> Just fix the following checkpatch error:
>> ERROR: Macros with complex values should be enclosed in parentheses.`
> Why the trailing ` character here?

thanks for review£¬This is mistake£¬I will send v2 to fix it.

>
> thanks,
>
> greg k-h
> .
>

