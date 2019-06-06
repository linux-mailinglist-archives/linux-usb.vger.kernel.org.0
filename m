Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 390E537166
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 12:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbfFFKNz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 06:13:55 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46022 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbfFFKNy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 06:13:54 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190606101353euoutp01ea625c26f5f51dff62bcd02f384573dd~llGr-VRmc1005710057euoutp01c
        for <linux-usb@vger.kernel.org>; Thu,  6 Jun 2019 10:13:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190606101353euoutp01ea625c26f5f51dff62bcd02f384573dd~llGr-VRmc1005710057euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559816033;
        bh=q7Vt4t2TLCX1FEiKWGgYOXEtOeQK3KwHaZhoW+yIvNk=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=LcbjRui/DS0P7zVdqwDkfZwPiO1SRm86iAo9HjThscCcJdCOEqVGtj2avda/KOqh2
         FksOYW4fvmnng139YvuvOzNc4tzIfwsn3rDGOsea72cwF0wtG0dAaDkPwwx3kcgm3X
         5V2JE40x1pUN8nK2JuurFc0TSxGKd4Iuv0tH+/CE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190606101352eucas1p13083459c65d92f52c257547aa2e277b4~llGrKgUyR0268802688eucas1p1s;
        Thu,  6 Jun 2019 10:13:52 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 9D.43.04298.067E8FC5; Thu,  6
        Jun 2019 11:13:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190606101351eucas1p20bc19d1206182a418d827545d576ca18~llGqbIgtd0333103331eucas1p2o;
        Thu,  6 Jun 2019 10:13:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190606101351eusmtrp1d4dcbdb15e72a8643fe9adde5b6aeea6~llGqLmxZx3127131271eusmtrp19;
        Thu,  6 Jun 2019 10:13:51 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-b1-5cf8e760652a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 3E.19.04146.F57E8FC5; Thu,  6
        Jun 2019 11:13:51 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190606101350eusmtip233f64318a03d8c9c7a21ec121eb50a90~llGpdsi7N0368503685eusmtip2B;
        Thu,  6 Jun 2019 10:13:50 +0000 (GMT)
Subject: Re: [PATCH v2] usb: dwc2: Use generic PHY width in params setup
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Jules Maselbas <jmaselbas@kalray.eu>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <0c370ba7-bb45-7580-1a60-021f15c1c37d@samsung.com>
Date:   Thu, 6 Jun 2019 12:13:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1d774b88-b176-448d-3e8b-8c1f04cb1406@synopsys.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djP87oJz3/EGEz6yWQx/2aSRfPi9WwW
        s2acZrVYtKyV2eLlkR+MFu+m3GZ2YPO4dafe4/T6m4we804Geuyfu4bdY8v+z4wenzfJBbBF
        cdmkpOZklqUW6dslcGWc+6hc8E6sYsOJmYwNjPOEuxg5OSQETCQunJnC3MXIxSEksIJR4tWN
        1UwgCSGBL4wSh6eWQiQ+M0p87dzLBNPx6+VUqI7ljBLLup4yQThvGSXuLelmBakSFvCQ2PX6
        PSOILSKgL3Fg6l9GkCJmkLFfdn9kAUmwCRhKdL3tYgOxeQXsJO4cvwHWzCKgIjHp321mEFtU
        IEbi6/6rzBA1ghInZz4B6+UUcJC4PbcfrJ5ZQF6ieetsZghbXOLWk/lgF0kIbGKXeD79GNTd
        LhLHn/UxQtjCEq+Ob2GHsGUkTk/uYYFoaGaUeHhuLTuE08MocblpBlSHtcTh4xeB1nEArdCU
        WL9LHyLsKPFm+hlmkLCEAJ/EjbeCEEfwSUzaNh0qzCvR0SYEUa0mMev4Ori1By9cYp7AqDQL
        yWuzkLwzC8k7sxD2LmBkWcUonlpanJueWmyYl1quV5yYW1yal66XnJ+7iRGYfk7/O/5pB+PX
        S0mHGAU4GJV4eCU2fo8RYk0sK67MPcQowcGsJMJbduFHjBBvSmJlVWpRfnxRaU5q8SFGaQ4W
        JXHeaoYH0UIC6YklqdmpqQWpRTBZJg5OqQbG/TvmXfrjnfD4RE/Bjz+7HdQ0T94O2GB053vM
        Yzb1/4UbLE7Hzv47YZHAVsGs+fx37dfZfwudxTYtWmzHNjXWb6IC/0Myyz0WS+flTPpwbJ3b
        mm/a3xh3FTss8o/0uKbR84+lmbX+4Evv+6I+j+SSnGfpz3rSez3Y67206ew93+NeXDv48vAb
        BSWW4oxEQy3mouJEAAEWCpE7AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xe7rxz3/EGNy+ymMx/2aSRfPi9WwW
        s2acZrVYtKyV2eLlkR+MFu+m3GZ2YPO4dafe4/T6m4we804Geuyfu4bdY8v+z4wenzfJBbBF
        6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GWc+6hc
        8E6sYsOJmYwNjPOEuxg5OSQETCR+vZzK3MXIxSEksJRR4tXpeewQCRmJk9MaWCFsYYk/17rY
        IIpeM0rM7FnLBpIQFvCQ2PX6PSOILSKgL3Fg6l9GkCJmgS+MEqdnPmCB6PjIKPFy2SsmkCo2
        AUOJrrddYN28AnYSd47fAFvBIqAiMenfbWYQW1QgRqKvcQULRI2gxMmZT8BsTgEHidtz+8Hq
        mQXMJOZtfsgMYctLNG+dDWWLS9x6Mp9pAqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucWG
        esWJucWleel6yfm5mxiBEbft2M/NOxgvbQw+xCjAwajEwyux8XuMEGtiWXFl7iFGCQ5mJRHe
        sgs/YoR4UxIrq1KL8uOLSnNSiw8xmgI9N5FZSjQ5H5gM8kriDU0NzS0sDc2NzY3NLJTEeTsE
        DsYICaQnlqRmp6YWpBbB9DFxcEo1MLqv+OuQpP+9dWvo4YU1LNuZ+9UZboj8fWXH/5e3pX0q
        97plG2dL28s9OygWOfmhYuv8uKuyKScECjKdO6b91LGa4cixzyDnosvz6Dj3G5b9m7wec+22
        fPH66pvSs+xStTyFMnGPtq+Ze1N/4U9mlrfTNjXu+/Zb/CtDnMbR7MUt3VIxj5/V7VZiKc5I
        NNRiLipOBAA09wBEzgIAAA==
X-CMS-MailID: 20190606101351eucas1p20bc19d1206182a418d827545d576ca18
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190531124510epcas2p1f261a838b299f3f99b521760872de32b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190531124510epcas2p1f261a838b299f3f99b521760872de32b
References: <20190507100852.11263-2-jmaselbas@kalray.eu>
        <20190509091528.28397-1-jmaselbas@kalray.eu>
        <CGME20190531124510epcas2p1f261a838b299f3f99b521760872de32b@epcas2p1.samsung.com>
        <1d774b88-b176-448d-3e8b-8c1f04cb1406@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

On 2019-05-31 14:44, Minas Harutyunyan wrote:
> On 5/9/2019 1:16 PM, Jules Maselbas wrote:
>> Setting params.phy_utmi_width in dwc2_lowlevel_hw_init() is pointless 
>> since
>> it's value will be overwritten by dwc2_init_params().
>>
>> This change make sure to take in account the generic PHY width 
>> information
>> during paraminitialisation, done in dwc2_set_param_phy_utmi_width().
>>
>> By doing so, the phy_utmi_width params can still be overrided by
>> devicetree specific params and will also be checked against hardware
>> capabilities.
>>
>> Fixes: 707d80f0a3c5 ("usb: dwc2: gadget: Replace phyif with 
>> phy_utmi_width")
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
>
> Acked-by: Minas Harutyunyan <hminas@synopsys.com>

Gentle reminder, Felipe, could you take this to the fixes for v5.2?

>> ---
>> v2: Fix typo in commit message. Add Fixes and Tested-by tags.
>> ---
>>   drivers/usb/dwc2/params.c   | 9 +++++++++
>>   drivers/usb/dwc2/platform.c | 9 ---------
>>   2 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
>> index 6900eea57526..5949262ff669 100644
>> --- a/drivers/usb/dwc2/params.c
>> +++ b/drivers/usb/dwc2/params.c
>> @@ -253,6 +253,15 @@ static void dwc2_set_param_phy_utmi_width(struct 
>> dwc2_hsotg *hsotg)
>>       val = (hsotg->hw_params.utmi_phy_data_width ==
>>              GHWCFG4_UTMI_PHY_DATA_WIDTH_8) ? 8 : 16;
>>   +    if (hsotg->phy) {
>> +        /*
>> +         * If using the generic PHY framework, check if the PHY bus
>> +         * width is 8-bit and set the phyif appropriately.
>> +         */
>> +        if (phy_get_bus_width(hsotg->phy) == 8)
>> +            val = 8;
>> +    }
>> +
>>       hsotg->params.phy_utmi_width = val;
>>   }
>>   diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
>> index d10a7f8daec3..e98d7812da2d 100644
>> --- a/drivers/usb/dwc2/platform.c
>> +++ b/drivers/usb/dwc2/platform.c
>> @@ -271,15 +271,6 @@ static int dwc2_lowlevel_hw_init(struct 
>> dwc2_hsotg *hsotg)
>>         hsotg->plat = dev_get_platdata(hsotg->dev);
>>   -    if (hsotg->phy) {
>> -        /*
>> -         * If using the generic PHY framework, check if the PHY bus
>> -         * width is 8-bit and set the phyif appropriately.
>> -         */
>> -        if (phy_get_bus_width(hsotg->phy) == 8)
>> -            hsotg->params.phy_utmi_width = 8;
>> -    }
>> -
>>       /* Clock */
>>       hsotg->clk = devm_clk_get_optional(hsotg->dev, "otg");
>>       if (IS_ERR(hsotg->clk)) {
>>
>
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

