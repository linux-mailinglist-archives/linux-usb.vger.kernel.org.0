Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FC51DA153
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 21:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgESTv2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 15:51:28 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55224 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgESTv1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 May 2020 15:51:27 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200519195126euoutp01edfba3b5454553d97e673745bbe29831~QheTKZpqu2482824828euoutp01f
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2020 19:51:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200519195126euoutp01edfba3b5454553d97e673745bbe29831~QheTKZpqu2482824828euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589917886;
        bh=UvVX9MVLT9gpemcGxekwC7YRhC8HeQxQSq4lPXKvt84=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=eAb0+jt5So065AftK3kIGi/yDqlyMrx7s/HeFokJtUWGFkqkqU8x0ISW3rmzewnob
         1y2cmahW9Hm7uoP0Ew8spbyHuDs9fWC61Q/g9klDIv7cZ5GnZWNyhWx1PTs2dZR/0i
         RQkAyt22VZR/8oGgbgnMmgPS6uje9d3jIGXOHHFE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200519195125eucas1p246cae0926edc33ce8ec1ff73ce24580a~QheS_mpLt2952829528eucas1p2J;
        Tue, 19 May 2020 19:51:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 61.C7.61286.DB834CE5; Tue, 19
        May 2020 20:51:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200519195125eucas1p2e054e1b684bd98144c351aaddebed887~QheSGGvaq2961929619eucas1p2P;
        Tue, 19 May 2020 19:51:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200519195124eusmtrp278a8c728ddfb37fbaf48c629aedf9e89~QheSFZ0od1828318283eusmtrp2i;
        Tue, 19 May 2020 19:51:24 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-9d-5ec438bd3454
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 87.56.08375.CB834CE5; Tue, 19
        May 2020 20:51:24 +0100 (BST)
Received: from [192.168.56.1] (unknown [106.210.237.40]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200519195124eusmtip25c231f6dc15f95381ccbb8609d5ae42d~QheRySDsn3244032440eusmtip2O;
        Tue, 19 May 2020 19:51:24 +0000 (GMT)
Subject: Re: Documentation for Raw USB ConfigFS
To:     Sid Spry <sid@aeam.us>, Peter Chen <peter.chen@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   Krzysztof Opasiak <k.opasiak@samsung.com>
Message-ID: <689edc51-b60c-fa4a-e481-10861d67bfb1@samsung.com>
Date:   Tue, 19 May 2020 21:51:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e5f3e26a-8b4b-4c98-ba9b-e912cd75491f@www.fastmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRmVeSWpSXmKPExsWy7djPc7p7LY7EGdxqMbE41vaE3WLRslZm
        iz/37rBanP6+kdmBxePw0m42j02rOtk8Nr7bweTxeZNcAEsUl01Kak5mWWqRvl0CV0b3gxdM
        BTtEKj5se8XcwLhNoIuRg0NCwETi2mSlLkYuDiGBFYwSm1q6mCGcL4wSc1feY4FwPjNKnFn6
        mr2LkROsY//yHcwgtpDAckaJJ0dVIIreMkp0zDoElhAW0Je4/OsaM8gKEQFriY/7CkDCzAJx
        EheWNjKBhNmASubtEgUJ8wrYSbTenMcKYrMIqEqcOfwMrERUIELi9NdEiBJBiZMzn7CA2JwC
        LhKXjh9khJgoLnHryXwmCFteYvvbOWD3SwhMZ5c4OPEoK8TJLhJrH71mhLCFJV4d3wL1iozE
        /50gzSANmxgl/s+9zgbh7GaUuHBwIxNElbXE4X+/2UAuYhbQlFi/Sx8i7Chx6+Jxdkgo8knc
        eCsIcQSfxKRt05khwrwSHW1CENXKEvfbH0CdIynxffVu9gmMSrOQvDYLyTuzkLwzC2HvAkaW
        VYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIFJ5fS/4592MH69lHSIUYCDUYmH12DP4Tgh
        1sSy4srcQ4wSHMxKIrwTXhyKE+JNSaysSi3Kjy8qzUktPsQozcGiJM5rvOhlrJBAemJJanZq
        akFqEUyWiYNTqoFRRjvW64/o1gc+D1JKOPf/tLs6ZybrX0eJgub5uZ88j9f/+qPA87P5TWZr
        49WQNo7WlgRpia0TEl7fSpEsyvfVbG0KZRVNDljXcSG86J9L+ePXa4vnNGdecdX5kuy4R2f7
        aqUvtfWGW+1bnDmulTyYfsRqlY7V31daoTNvnqzZteHU8mjO3l4lluKMREMt5qLiRAATheYG
        JgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xe7p7LI7EGSy9amlxrO0Ju8WiZa3M
        Fn/u3WG1OP19I7MDi8fhpd1sHptWdbJ5bHy3g8nj8ya5AJYoPZui/NKSVIWM/OISW6VoQwsj
        PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzuBy+YCnaIVHzY9oq5gXGbQBcjJ4eE
        gInE/uU7mEFsIYGljBIb/xpBxCUlpr84wQxhC0v8udbF1sXIBVTzmlHi7OZWsISwgL7E5V/X
        gGwODhEBa4mP+wpAwswCcRInT59lhqjfxCbx4P1qJpAaNqD6ebtEQWp4BewkWm/OYwWxWQRU
        Jc4cfsYEYosKREg8336DEaJGUOLkzCcsIDangIvEpeMHGSHmm0nM2/yQGcIWl7j1ZD4ThC0v
        sf3tHOYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgRG0rZj
        PzfvYLy0MfgQowAHoxIPr8Gew3FCrIllxZW5hxglOJiVRHgnvDgUJ8SbklhZlVqUH19UmpNa
        fIjRFOi5icxSosn5wCjPK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TB
        KdXAWLFUdP6FlQc0xDXv6i+u053hvej5jdeG61nzVRwSxGYYsveycR5p2B3qHjevzOf9caHT
        c5fcObCY4bHd69MnWJdP8njZE+b0TmRz6P1l2ybmKLC03/Uv9v0p+Pz29toFm7ZEh/15dYj/
        f+HrozZ3V125wsPtxS62+U9FgOIUUeP+B5e7jxU7CCixFGckGmoxFxUnAgBq7TV4ugIAAA==
X-CMS-MailID: 20200519195125eucas1p2e054e1b684bd98144c351aaddebed887
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200519194201eucas1p14a5bb237d54c31b7bdb594e831dbcd22
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200519194201eucas1p14a5bb237d54c31b7bdb594e831dbcd22
References: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
        <20200506091750.GE30237@b29397-desktop>
        <8ee3914e-7876-46aa-bade-7cf14df7efdc@www.fastmail.com>
        <87h7wkp9qy.fsf@kernel.org> <20200513100614.GA3698@b29397-desktop>
        <6cab4113-b4ad-43d9-85fc-f68682cf0259@www.fastmail.com>
        <AM7PR04MB71571747B1FD3B2FFBB8DC9F8BBD0@AM7PR04MB7157.eurprd04.prod.outlook.com>
        <9fee6fcc-6156-489f-838b-114903f8e751@www.fastmail.com>
        <20200518054914.GC27612@b29397-desktop>
        <83ac8b7b-e0e7-4615-8ebf-4c98e596577b@www.fastmail.com>
        <AM7PR04MB71575A56A92CCFDE8B460FC88BB80@AM7PR04MB7157.eurprd04.prod.outlook.com>
        <0eb0d4d7-9ac1-4018-9422-651481ce3125@www.fastmail.com>
        <CGME20200519194201eucas1p14a5bb237d54c31b7bdb594e831dbcd22@eucas1p1.samsung.com>
        <e5f3e26a-8b4b-4c98-ba9b-e912cd75491f@www.fastmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 19.05.2020 21:40, Sid Spry wrote:
> On Tue, May 19, 2020, at 2:12 PM, Sid Spry wrote:
>> On Mon, May 18, 2020, at 6:58 PM, Peter Chen wrote:
>>>   
>>>>> 2. Try exactly the same script I gave you, do not try change any
>>>>> charaters (except the position for your application)
>>>>>
>>>>>>> cd /sys/kernel/config/usb_gadget
>>>>>>> cd g1
>>>>>>> echo "0x1d6b" > idVendor
>>>>>>> echo "0x0105" > idProduct
>>>>>>> mkdir /dev/usb-ffs
>>>>>>> mkdir functions/ffs.usb
>>>>>>> mount -t functionfs usb /dev/usb-ffs ln -s functions/ffs.usb
>>>>>>> configs/c.1 /home/root/usb_test/ffs_test/ffs-test & /* your own
>>>>>>> test application */ while [ ! -e /dev/usb-ffs/ep1 ] do  echo "."
>>>>>>>   sleep 1;
>>>>>>> done
>>>>>
>>>>>>
>>>>>> [1]: I actually did not have CONFIG_USB_CONFIGFS_F_FS nor F_NCM/ECM
>>>> set however the necessary code seemed to have been pulled in some other way
>>>> and the modules were available. They were loaded, and as explained my shell-
>>>> based configfs code worked. They are set now and the problem persists.
>>>>>
>>>>
>>>> Hi, sorry I was not clear. The kernel config is fine, and
>>>> CONFIG_USB_CONFIGFS_F_FS is set. I run your exact script (minus the ffs-test
>>>> line) and it fails to create the functions/ffs.usb directory as I described before. I can
>>>> create other functions just fine.
>>>
>>> You may enable debug at configfs.c, f_fs.c and your udc driver to see
>>> what happened.
>>>
>>
>> Thanks for your help Peter. Unfortunately I have hit a brick wall. The
>> examples in libusbgx also fail to work, and I tried that library after
>> a friend recommended it as perhaps having secret mojo. I enabled the
>> userspace debug helpers in the kernel but they do not seem to offer me
>> any insight, and there's no relevant dmesg output.
>>
>> My device is an Allwinner H2+, and the UDC seems to be the Inventra
>> Highspeed Dual Role Controller. I've also got the DesignWare USB3/USB2
>> cores enabled from my upstream but I think they are not being loaded.
>>
>> If anyone can look I'd appreciate it, this is just a hobby project.
>> It's a good chance for me to do some kernel debugging but I'm a bit
>> lost.
>>
>> Thanks for the help so far.
>>
> 
> Sorry for double post again. Alternatively, if anyone can recommend a device which they know has working ffs configfs gadget functionality, I'll just buy a board with that instead.

Can you send me the strace log from the libusbgx example that does not 
work for you?

Best regards,
-- 
Krzysztof Opasiak
Samsung R&D Institute Poland
Samsung Electronics
