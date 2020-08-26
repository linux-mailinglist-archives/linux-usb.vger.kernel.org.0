Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC5BF2534F3
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 18:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgHZQbT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 12:31:19 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47070 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728039AbgHZQbE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 12:31:04 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200826163102euoutp0164da6968b042fc023698b8c8a5298a4a~u3mmVZ1qJ1022910229euoutp01g
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 16:31:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200826163102euoutp0164da6968b042fc023698b8c8a5298a4a~u3mmVZ1qJ1022910229euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1598459462;
        bh=TfDEWXzQ64Ccl9fFj1wBQgybuj4q1dPLUn4ofduzXOU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=eV3sZ3lVj63XXeMbObVXzqAw0owYxJhsovxLA4b39QhUp0xlJjsQ+2u/nBH+fpTd/
         lfLi3+oAIY1vaJ7N1RdeRaL73Td3AtG0HOUqd0gD5usNGxDWpCXLGSDebb3+j5CG7g
         yDoEKrtx5xAZ3/UGelLH6gdv3ySG7aFs7G3J/f6A=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200826163102eucas1p1c581ac4e612717b79265db0df63530b9~u3ml-upa32595325953eucas1p1K;
        Wed, 26 Aug 2020 16:31:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 31.E2.06456.64E864F5; Wed, 26
        Aug 2020 17:31:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200826163102eucas1p1be521a18a64e44250686bc305f1d4eda~u3mlnOM7V2164321643eucas1p1b;
        Wed, 26 Aug 2020 16:31:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200826163102eusmtrp1fdf4a793638feca88fd4f0949412647e~u3mlmgzZc1207312073eusmtrp1c;
        Wed, 26 Aug 2020 16:31:02 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-3d-5f468e46dc24
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id ED.8B.06017.54E864F5; Wed, 26
        Aug 2020 17:31:01 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200826163101eusmtip1c44f1d06f7705d778482947852061212~u3mk7grSn0963009630eusmtip1N;
        Wed, 26 Aug 2020 16:31:01 +0000 (GMT)
Subject: Re: [PATCH v1] USB: gadget: u_f: Unbreak offset calculation in VLAs
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Brooke Basile <brookebasile@gmail.com>,
        Kees Cook <keescook@chromium.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <8371560f-c766-2fcf-25f1-bc05a8c53e6d@samsung.com>
Date:   Wed, 26 Aug 2020 18:31:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826162837.GA28466@kroah.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsWy7djPc7pufW7xBudXSlj0Nk1nsjjW9oTd
        YmnrBWaL5sXr2SzOdOdaLFrWyuzA5jG74SKLx85Zd9k9Nq3qZPOYdzLQY//cNewenzfJBbBF
        cdmkpOZklqUW6dslcGXM29DAXtAgVLFqU1AD41HeLkZODgkBE4k5l9YxdzFycQgJrGCUuL3n
        IxtIQkjgC6PEzL/JEInPjBJNvx+ww3R8aH/DBpFYzihxf+dkJgjnPaPEjpVLwNqFBXwkvu/Y
        wwJiiwhkSfTM38wIUsQs0M0o8fDzWrAEm4ChRNfbLrAGXgE7iYYrfUwgNouAqsSJptmsILao
        QJzE1uNXmSBqBCVOznwC1sspoC/RdvcwmM0sIC+x/e0cZghbXOLWk/lgF0kIrGKXeLP/IQvE
        3S4SEyd9Y4SwhSVeHd8C9Y+MxOnJPSwQDc1A151byw7h9DBKXG6aAdVhLXHn3C+gUzmAVmhK
        rN+lDxF2lDj77RYjSFhCgE/ixltBiCP4JCZtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFPYFSa
        heS1WUjemYXknVkIexcwsqxiFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQITECn/x3/tIPx
        66WkQ4wCHIxKPLwa8W7xQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EKM3B
        oiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qBcb2/l3fLrNxlp80iJtgxaYryG/PnpTAcnan5
        Ie168rYjul4pnQvXmsn/LHlldi0kg5mrxf3me5uo3965tzyrJFdblytMYdX+sd+q99jGZeWM
        nTvvfb+WvDPx8CWjDarbny4+LcNo4LTsj0/gh4fsV2Z4fDXwF7MPKF5vbOsltfPxLs7uniUz
        lViKMxINtZiLihMBVRq8MTwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xu7qufW7xBrOOWVv0Nk1nsjjW9oTd
        YmnrBWaL5sXr2SzOdOdaLFrWyuzA5jG74SKLx85Zd9k9Nq3qZPOYdzLQY//cNewenzfJBbBF
        6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GXM29DA
        XtAgVLFqU1AD41HeLkZODgkBE4kP7W/Yuhi5OIQEljJKzN75kRUiISNxcloDlC0s8edaF1TR
        W0aJX5v/MIIkhAV8JL7v2MMCYosIZEkcnnyNEaSIWaCbUaL71T2ojv2MEnsfdINVsQkYSnS9
        BRnFycErYCfRcKWPCcRmEVCVONE0G2ydqECcxOPe/8wQNYISJ2c+AevlFNCXaLt7GMxmFjCT
        mLf5ITOELS+x/e0cKFtc4taT+UwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07M
        LS7NS9dLzs/dxAiMuW3Hfm7Zwdj1LvgQowAHoxIPr0a8W7wQa2JZcWXuIUYJDmYlEV6ns6fj
        hHhTEiurUovy44tKc1KLDzGaAj03kVlKNDkfmA7ySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJ
        pCeWpGanphakFsH0MXFwSjUw9jvf2KAoLVxclDFx+1b7K3Y33klPfzX7sEV5yquSXI+GT3xC
        P6beKjzX/P5l5+NDwkJy4YysMzObVBrna0xr/y/g5mqov0Juy51p+a5Kd3MMtHk71nSFLThv
        aXOY2bLzzomjc5SPnovQtl7W6eUjf+ozx0O3zUlapZ5Xti/ryU5/P4dZhPGOEktxRqKhFnNR
        cSIANoxuac8CAAA=
X-CMS-MailID: 20200826163102eucas1p1be521a18a64e44250686bc305f1d4eda
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200826162826eucas1p1417db546c681842d450c17cde42c9420
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826162826eucas1p1417db546c681842d450c17cde42c9420
References: <20200826162413.21637-1-andriy.shevchenko@linux.intel.com>
        <CGME20200826162826eucas1p1417db546c681842d450c17cde42c9420@eucas1p1.samsung.com>
        <20200826162837.GA28466@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 26.08.2020 18:28, Greg Kroah-Hartman wrote:
> On Wed, Aug 26, 2020 at 07:24:13PM +0300, Andy Shevchenko wrote:
>> Inadvertently the commit b1cd1b65afba ("USB: gadget: u_f: add overflow checks
>> to VLA macros") makes VLA macros to always return 0 due to different scope of
>> two variables of the same name. Obviously we need to have only one.
>>
>> Fixes: b1cd1b65afba ("USB: gadget: u_f: add overflow checks to VLA macros")
>> Cc: stable <stable@kernel.org>
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>   drivers/usb/gadget/u_f.h | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/u_f.h b/drivers/usb/gadget/u_f.h
>> index df4e1dcb357d..0b5c5f0dd073 100644
>> --- a/drivers/usb/gadget/u_f.h
>> +++ b/drivers/usb/gadget/u_f.h
>> @@ -25,8 +25,8 @@
>>   		size_t offset = 0;					       \
>>   		if (groupname##__next != SIZE_MAX) {			       \
>>   			size_t align_mask = __alignof__(type) - 1;	       \
>> -			size_t offset = (groupname##__next + align_mask)       \
>> -					 & ~align_mask;			       \
>> +			offset = (groupname##__next + align_mask) &	       \
>> +				  ~align_mask;				       \
>>   			size_t size = array_size(n, sizeof(type));	       \
>>   			if (check_add_overflow(offset, size,		       \
>>   					       &groupname##__next)) {          \
>> @@ -43,8 +43,8 @@
>>   		size_t offset = 0;						\
>>   		if (groupname##__next != SIZE_MAX) {				\
>>   			size_t align_mask = __alignof__(type) - 1;		\
>> -			size_t offset = (groupname##__next + align_mask)	\
>> -					 & ~align_mask;				\
>> +			offset = (groupname##__next + align_mask) &		\
>> +				  ~align_mask;					\
>>   			if (check_add_overflow(offset, groupname##_##name##__sz,\
>>   							&groupname##__next)) {	\
>>   				groupname##__next = SIZE_MAX;			\
> This patch, while maybe fixing the issue, has a bunch of build warnings
> so I can't take it as-is:

That's why I said that I've moved offset assignment in the first part of 
the patch after size_t size = array_size(n, sizeof(type));

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

