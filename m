Return-Path: <linux-usb+bounces-22330-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C5A766AE
	for <lists+linux-usb@lfdr.de>; Mon, 31 Mar 2025 15:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD8B816A673
	for <lists+linux-usb@lfdr.de>; Mon, 31 Mar 2025 13:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E511E8353;
	Mon, 31 Mar 2025 13:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RljUSek1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B61F2A1D7
	for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 13:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743427036; cv=none; b=mAAnFNxXGkkkAJ+6yseW3on03vhp1m89+vaRK0U6D0XRP+abCojWp5GKc9cJU6b0+ObXjUuWfsb1O2uhGl0qMJorFAsf09T/itNDx/XLFtqHald8cd+8G9negImG5+myYkMqQDzErDhtGUa9qVQyvkWclzNRDdfWWVl3yAzrdTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743427036; c=relaxed/simple;
	bh=dxCP+RIuwUQKvD7h2spBxRl5CgQDqFeaNJoudF2kAOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gbezkg70emxJGVYsBGlkVr2aGrQ/9dgJ8OQts+RmGoI1oCroWzr79fBW4Qc+DZX5OJYDpTIO3Y4mBiWfO8+Dxlb0OGck9IELBI/tyCUgsO/8cifoUXhmPT0KSJOer1tS+pF4ThyjZgqVtX4F3VoxuGujygjqg3KYq3QX1NqOTz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RljUSek1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so30274225e9.1
        for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743427031; x=1744031831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqNXTgwsI6BoK/uEu27l/nr4n9c1SywEoqEjJqMo+A0=;
        b=RljUSek1MKO3q1wYiwiqFDxTN/utDJo/lGMPBAGizWZIT+ULJNNgrtKG9u/ylnLQTg
         XTBeJEGmdlg/bGZRr4Clo07tFW6gPkuIfwI9he5qCRwFVGPjd6qmFg6eULvcBEm+wLmy
         4kbBIpvu1h+BtG9EayXT1IziFCybjSRQUWmwcU1H4RAiz/6gfpuDW2FME4i4Fdl0YHqn
         NvwrH9Og2PAJ+llPnkyD6OVDevgZkbq4LUFyUdTgPtfH30rvDEtYWOVieT6LtxrOkV4E
         WEXdTHGm2u6+owwI94LKesXVtg9iIehKCCdAgUVIE03T/tjT9y2x8rQlZadgZAR/HC74
         CSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743427031; x=1744031831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqNXTgwsI6BoK/uEu27l/nr4n9c1SywEoqEjJqMo+A0=;
        b=gscNjJWN/pOrpoYCuCfJqEjA9Lzoutw0STfqDPBK3wbGegfO/ZmozQgAZsOmeJopuO
         JAZBQIHSfFCCz1STLv+LVDNcbX/g74GGIe51CQu3iRXDknwZMxIVd/uSxy6iYaowo+gf
         c0EF4TldllVIVaiyew9KI+y4RaUn9ickx9O/vMUAs7Hg8SeTeK95egmK0BTGm/1g+8Jq
         rx3mIQmivf6Evwj2OfmkXanUpltajd7wEdJkE5ayzQ/Fgp8bY9zYCcb/WlT9cPYQ/QyH
         cjlAFJS9U0j7a27cuU7Oo3s3HN/wmXpbSh53wmutL+lGOmmtAW2A6Enu7zttvsKRPSkZ
         JLuA==
X-Gm-Message-State: AOJu0YyKjRo6YVd47LVjDdgDEQserV8NMz1NuOyGdpKUXx84UXsCA6M6
	PRdEsJqdsZ5Gl9ODXUtoR77CHub5LmBg+ADuSHDEs9Bd5QgXYtfm5cZi2VdPubQ=
X-Gm-Gg: ASbGncudDahaG3LTkOCodMtSjCXfPYs6XvAMV3VmXSzF+eZ4GeL9yNqpEMx44yPo9Hj
	LB6upFLnMUnt1bWQqTWPQvnTsZI5YlnJKL7oAvrKYr0NIdPB0f/r51uouRL7ku0nugYlksd1O2F
	o0WxN+YGgJMgHyOHneTr26fsFF2sBc82S1vAhRE/VKlHXm32C09S5Cg5naxcs/VSgswjDcZGqYt
	uB4KPyd4hQsiBQfPz9FhASup1B6HYYwI/CGGH37o+sKzZ2MvIHN8jSp0zMKbnvvNO1QVo/vmmuP
	ZDzQ10Ysx1s+E02GlmiJ+dp0U0pOTjvwCALY6K87k26sXOEfKfXe4JCBPJayBrvmeKiR7IBAzj5
	MZlzndxPDR/w5wo5K
X-Google-Smtp-Source: AGHT+IEWBGKubRrTrDtVDrQxFODtlPnxpg2fmznlfYxrJ8c9I2HBpPqAab7rls8Idg5snthffFxUyw==
X-Received: by 2002:a05:600c:1c1f:b0:43d:7413:cb3f with SMTP id 5b1f17b1804b1-43ea1fdc23cmr18045955e9.5.1743427031161;
        Mon, 31 Mar 2025 06:17:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:355:6b90:e24f:43ff:fee6:750f? ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d9142a5f0sm94940015e9.0.2025.03.31.06.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 06:17:10 -0700 (PDT)
Message-ID: <8f6e57f0-990c-4b28-b6e2-f3987173ebbd@baylibre.com>
Date: Mon, 31 Mar 2025 15:17:08 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: f_fs: Invalidate io_data when USB request is
 dequeued or completed
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
 Frode Isaksen <frode@meta.com>
References: <20250328161823.2240125-1-fisaksen@baylibre.com>
 <2025032835-sixtieth-unable-1548@gregkh>
 <bc6749c7-9169-4e1b-a1f5-3fe645ddb230@baylibre.com>
 <2025033129-sulphuric-doorknob-5568@gregkh>
Content-Language: en-US
From: Frode Isaksen <fisaksen@baylibre.com>
In-Reply-To: <2025033129-sulphuric-doorknob-5568@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/25 10:57 AM, Greg KH wrote:
> On Mon, Mar 31, 2025 at 10:18:29AM +0200, Frode Isaksen wrote:
>> On 3/28/25 10:02 PM, Greg KH wrote:
>>> On Fri, Mar 28, 2025 at 05:17:15PM +0100, Frode Isaksen wrote:
>>>> From: Frode Isaksen <frode@meta.com>
>>>>
>>>> Invalidate io_data by setting context to NULL when USB request is
>>>> dequeued or completed, and check for NULL io_data in epfile_io_complete().
>>>> The invalidation of io_data in req->context is done when exiting
>>>> epfile_io(), since then io_data will become invalid as it is allocated
>>>> on the stack.
>>>> The epfile_io_complete() may be called after ffs_epfile_io() returns
>>>> in case the wait_for_completion_interruptible() is interrupted.
>>>> This fixes a use-after-free error with the following call stack:
>>>>
>>>> Unable to handle kernel paging request at virtual address ffffffc02f7bbcc0
>>>> pc : ffs_epfile_io_complete+0x30/0x48
>>>> lr : usb_gadget_giveback_request+0x30/0xf8
>>>> Call trace:
>>>> ffs_epfile_io_complete+0x30/0x48
>>>> usb_gadget_giveback_request+0x30/0xf8
>>>> dwc3_remove_requests+0x264/0x2e8
>>>> dwc3_gadget_pullup+0x1d0/0x250
>>>> kretprobe_trampoline+0x0/0xc4
>>>> usb_gadget_remove_driver+0x40/0xf4
>>>> usb_gadget_unregister_driver+0xdc/0x178
>>>> unregister_gadget_item+0x40/0x6c
>>>> ffs_closed+0xd4/0x10c
>>>> ffs_data_clear+0x2c/0xf0
>>>> ffs_data_closed+0x178/0x1ec
>>>> ffs_ep0_release+0x24/0x38
>>>> __fput+0xe8/0x27c
>>>>
>>>> Signed-off-by: Frode Isaksen <frode@meta.com>
>>>> ---
>>>> This bug was discovered, tested and fixed (no more crashes seen) on Meta Quest 3 device.
>>>> Also tested on T.I. AM62x board.
>>> What commit id does this fix?  Should it go to stable?
>> This has always been there, so the is no specific commit when this was
>> added.
>>
>> Will add the Cc tag to stable in v2.
>>
>>>>    drivers/usb/gadget/function/f_fs.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>>>> index 2dea9e42a0f8..f1be0a5c0bd0 100644
>>>> --- a/drivers/usb/gadget/function/f_fs.c
>>>> +++ b/drivers/usb/gadget/function/f_fs.c
>>>> @@ -738,6 +738,9 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
>>>>    {
>>>>    	struct ffs_io_data *io_data = req->context;
>>>> +	if (WARN_ON(io_data == NULL))
>>>> +		return;
>>> If this happens you just crashed the box (remember about panic-on-warn,
>>> which is still set in a few billion Linux systems these days...)
>>>
>>> Just handle the issue properly, no need to dump the stack and crash a
>>> device.
>> OK, removing the WARN_ON for v2.
>>> But, what keeps io_data from changing after you have checked it?  Where
>>> is the lock here?
>> There is no lock here, as I didn't want to introduce extra complexity (and
>> bugs...). But this code has been running without a crash on millions of
>> devices for more than a year.
> The fix has?  Great, but again, you need to at least say why this value
> will not change right after testing for it, otherwise you have just
> reduced the race window, not removed it.

I agree that this is only reducing the race window and not eliminating 
it completely, but I have no idea how to fix this easily.

Thanks,

Frode

>
> thanks,
>
> greg k-h



