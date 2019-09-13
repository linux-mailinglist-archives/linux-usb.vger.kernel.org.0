Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1927DB2157
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2019 15:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388836AbfIMNqr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Sep 2019 09:46:47 -0400
Received: from mail.centricular.com ([50.116.37.142]:60044 "EHLO
        mail.centricular.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388489AbfIMNqq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Sep 2019 09:46:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.centricular.com (Postfix) with ESMTP id 9CF3C58B9D;
        Fri, 13 Sep 2019 23:46:45 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at centricular.com
Received: from mail.centricular.com ([127.0.0.1])
        by localhost (worm-farm.widgetgrove.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id psV31MWHYOWI; Fri, 13 Sep 2019 23:46:44 +1000 (AEST)
Received: from [192.168.11.26] (180-150-69-32.b49645.syd.nbn.aussiebb.net [180.150.69.32])
        by mail.centricular.com (Postfix) with ESMTPSA id A32CB58B7A;
        Fri, 13 Sep 2019 23:46:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=centricular.com;
        s=201701; t=1568382404;
        bh=F+vT1WpYlsZ1Q7R4DeXdy2dDnuRXL5g0/oC17XOiKpM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nKtMwyLf7cUSbS/lTGToPMSRrT4eKzNuYxPH+jHvFqqElVsCE1YbSoaXsR9z19RAg
         TKjA61gAQmAjvK7/zZY8fEJV9SW+fgOSHBHNb5+Rt/9C90NYOQfOr5aTP7fTe/+N3H
         DzP9cMP6CargmtJt3n3Rczzd+DO1Dd6LXkagcocqKze2Y7jYhzIpEu/WLcOOiheakj
         hlOwJHL9cmUKlBoCqdplmPHyhISxB20IwvE52QyjOCRfg5jjh+vO0zseEQ41G1dq3o
         94aU3WczpOFenRC8os8a2FSAeM5u8ZxwOfaW3igfOQBmV9t0pqwMxM36yqPuPsYmWN
         Fh4sfCg/s6UiA==
Subject: Re: [PATCH] xhci: Check all endpoints for LPM timeout
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>
References: <20190912144921.368-1-jan@centricular.com>
 <896688f6-8486-3826-ee74-a225936f824d@linux.intel.com>
From:   Jan Schmidt <jan@centricular.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jan@centricular.com; prefer-encrypt=mutual; keydata=
 mQINBFJT/ucBEADBe6WC0ykCy4p/qcE8NFGXPW9RCVJJqmeFczp47qhPAD+/dz75o0gyWkjv
 enEYAokBHYeAnXzbxaRufcjJ920EBYBa/N//zeyhG0ljPK571O3Afi+9Vj6PVEF7NIb5Echd
 U+v/Z0Yv74DXI2UcxyDLu8G8khX3gbcLRcnef79mD3fpfJfLe/LHS59BpXwxhSDs/FtTUJWu
 fOdN2+NTgZp6LdbthbZC1kAHXt33tprHcTSE3lcV+GTXZ6j/1iImu32+o6mP4jWC27YkkNpz
 1RWkyXltRr2DD/WeeQEaeZOk8uG5ySHZUXQgD7DRU37kyF1zHGkpt2ZbUlqD0CN0Pa8EYLWb
 59wuozPUQ54GeWObapYGJkVeXDSFLvnvg/BKNYDjUsoEfroN7hXikGMirBUy+CwaVk+iLMQs
 dy+g7xDS3vKcaIbTiiIA7EldtLnLxeLe+dtWnO4KexsBmf24EdIAjmOJAmdhnuGIwKRxEE/b
 9WcU/vzTs/4PU1aRQNiqCjjVaBEEc37UI2vwuBfhunb72P9Hs7s75vw7x2eByZMRl77oUL25
 3QTiyZBrcHj1dt1gDdozdiu7ESwQq7kTyS3X8ifMGUnXwKLT38QQsid6j+ztJo2zmbhkwxmT
 KtX25dl0OZB7ztnFipJfkd4tctKKFsKHFo+eouMCEqphi9Af6QARAQABtCFKYW4gU2NobWlk
 dCA8amFuQGNlbnRyaWN1bGFyLmNvbT6JAjoEEwEKACQCGwMCHgECF4AFCwkIBwMFFQoJCAsF
 FgIDAQAFAlfZPTYCGQEACgkQSp3HV4Yl857krBAAlHG/748sUko06Oh1VNpm1k06KCsdZUxn
 NRdnwmE+99mkwhwRped3ZhAlD97RNf3wGjxTPsiEWoy8KhztKCpTnYsNu9jq/28fAzASjTia
 kfuvH1tm5GhX8ZlIW5OQxnJkWsUY5GtZNfLlixn/opkZUHsBnjbpalGgjtAPNC2DcqWVQ1MB
 QnNkS2apCxe7ezpqmBfigz6EdxUWDITMtiKp1r9Kuueli40LA7ZSj9HYQLraFWmQLqdkPgJl
 d+7KOurVCc/Rq9HIDoPfmCpxBlbA4/1tFw97gEFfnx9Yp+mSWcWBeK1eCO00M3N4YgQW1Q3J
 KeOOgGlL2LWCF7zt7JW7XIHtY4AKbcNhbLf8ioS2oDQHwuyIQ9OekW3qTWUGI7X6AdlFUELY
 XbJ+eWtcrcYbzBJlAgPjKAaKBHt2Um84F3B/IXEBLbj9xlXqb8BkQbv70Xg1b+wh2BjhNU14
 UAjjTrUzwLVoj3sziJkwwLjufuP+AFe9M1wMCOrbZkmgqCEx+C8kh4Drpwe3zdo7FKS/+ckw
 yenDbxZulAx7g54HesSnkRQ30xT2kdNyp7RvRDecyPomn6OWHcRBq94J2Tb/CxDhcSOeO11I
 iT7yv+GsJMu9KVtpX3yNYGM+IVz8EyEA5YMgBsnvp6ScXjG+dZiiBlEQY3PEK9per4fIkd4h
 E465Ag0EUlP+5wEQAOe6v9Z0eODZLUGBPF9TcKQE9uYLXvywXlZvynICAo4Z5gcLPYuTEvyF
 GxxwjXbHZV+mNGiR5oDgq7PfpxIVw2D3W6W9RCxioN4f/nvbxkMuijpdxk7+uTUtEavpCtdh
 xXAWIV61aofvUfRD4kMBQHabPaX1rsiLK92vUMPIcTwqEgF4NMotVMOdMvhujClweCHQMWVU
 LDvNcE8uUMAIvvJZ0SEiE2C7ACFvpqQgv37NC6ikZ1bGK8Ase+KsKvCglDSgEBFIChRD9aPx
 jr3TFupLiQ1/UWN8U+9ctMQnON96PzBAAF2uyMgIi6Ad7OHBd1PMzewLItbq1WWd58ZuwXGn
 y1dQfbRmE7CfQx2/u5U/JjFJfJTkC5tyjab8ywMbpQ3kszEgGEYrkvGNmpTvqH/vbtONNpiJ
 jWZrvUcqlp0b1NhiMtfAb8hA7cQvzwKacC7bcxVlzZ1rw9DyCaxzyjtjdKoimCHZrlvIPKJS
 hVHTMrD26hCaq73ABBWtFCM76ZbaPCC5bQu9uu2GI3JCZE8jBdCxzCWxpHmoWtj+pPl/tiZP
 4V+sj1TzgVI3e+hkWFbT26fxmzwO6TyrNBibO3GWya5DwtfncPUIRWdw4V+pNwjqHZ19WcM0
 8P8VzvAHXsUHVdbWO/aoRmaYDFF3Ufg9CQQZujIoOc0dN/0b59+BABEBAAGJAh8EGAECAAkF
 AlJT/ucCGwwACgkQSp3HV4Yl854lpg//YBTBkM8ovpXGLbO7P9+0IMqUC3QzQc7t//yryIB8
 DSnkMpmbwPoFFgql3Ll3ji2rb5UcDAe+wUtYKNvt9eowDu1oeBHBjaOt2uMdvqVrE+U3EFQf
 R5fzY7AtMoA5leNbCPy2r3rh1RMsxdQiVZuprCaYfuP6waHwFO0FSefJCwOPtcNjDOhEvhui
 ovSxEv7oO1KZD5eXH3i1MCqglsqXwUFpXsNopEgFMpo3rdtKE0APby1TTdMR7H1Ee4vb/8Tk
 cYfUFGt2gY14I9zBpayBUCjybDZ7UUdP+Y/IUbKtjXcF9Aht2tGCkf4Lysu3I42s/uae0Hi+
 9/MK2MlsDUqQNRgEeSNZpQEcyijAInSBRmahN97yxfBURTzT5Zd5eU0kmNFGmY4NXMXefMdu
 I/Ie1d6U/6u2tLd40QCnwQkqXROe8kKQfhFchzL4L5atOcjUSyE+AgoaxD1k6AJBngABrdtP
 ZJNJQNZPpg2dLvsAqYZ+ToEHZFtMLFhMBs/UCofqoFUuAMUVTkV+Q/rARNhEbvj1oxdEABI0
 P5Vp+dp4QHNhBatET9aOIrHd3NaUFHq3ywlTF9Kp9pL3mRtg8E7eliG3nptyLo/RVhYL5WQZ
 g0lQfwum330aLAnMpyT2Bewaz9T+T5i59zZqYjkYcQ+ReSL9kvLVARwJDFy8BB7ihTi5Ag0E
 V3Z9XgEQANpdy25gMiZWZ1WkdkVTqqZWky5jrnsO8Egm3WWmuPvmUx0ri0jZhHrTbRdCdYL7
 N3l5KL8Y3rauPnzwZlvRW5KmhqMGCzb4nG0Eum+hIuj7QO1+JZiRUqWQ3YKKTVpYgfN0gQC1
 z4ifoOyinZDCgxraMc+FjxaFapNqHEABHw2ezsig9XIRYelqT8YkV/d7ghVIF/KsVrQ0hF+G
 ELnLvxtiOnYWegOCrlhIcSrJRU8/bOnTPqikLdg+3wqbEr4u2a6y9ZX8U/19uY1LPwFH6zm/
 4i6gXx56DOOjkxZDWc80x71rE7RS8e+la91zc98gvZUFAvc7z7QJ88CF5Spn9B62ewWIKB3M
 uVgrcFHp+KOp+x4XOFDFW501JeWcbsXy3Vei+AtrA9oqy5SBeNk1ayhjyAPx+Oeea4k8yO6V
 yJug4KobMwsc/A2tDxQiwCwXVnTojQlaGylPB7WyyQGmp8VMOPdpHaIBvr11Wg0UlBGuxQ7p
 i1lKrGBD0b7m9EtqBK3mvsDZd5qV4dDF1CCcm/YGY8UOiL/tyaHWpZDXySm1B5mkrGkNtZWz
 Emb+o2rU917HFBJ6V8TjZEUGjnaitBxZhsu2zBeJfyppzj9n94rcBEtYXCwBgjrT+0zFSzMq
 uvWRcwhJGiEenFgZ8p8hq9+X29gKQsdt9LVJlUxBaVkzABEBAAGJAiQEGAEKAA8FAld2fV4C
 GwwFCQlmAYAACgkQSp3HV4Yl857BsQ/4+PYuwGHpYx5ngCm4lXEsVUPU2B4czwtYYjiRS0f4
 pLC4Gtz4jMVIsjO8Z0MPnyTcBFuiuHvFHGinXoYTDQk3h1L2bBzFhwFOAAtW3QxM6290tMVU
 7XP0jmcZTOlq9EJz/LKJiiE5UUpOuvfeooib9nlsYqaxhq9rETaNF7JGbnRhJGuFK3hkmK/l
 362Ws9zpP+wDcfL1L23A0VYu+JhzMZyiXtU5eCqTOJZmyJo8I75szoqanDyxBxNerBcxxb73
 zn/+yz2mrj8vgV4TwgTsLPF2x464L4gtGUYrlrJKNKd7+BvMhzLFj5K/SUhrsXIULeYUdFcf
 zlsbmpP/ZnvMk1BCJyaXxBhIXB/t6ITGXR0vv4dbHR38uoT1AY4Et/fQqEqIKlMfLiARbNyG
 sEig87TeeMw93XKNUUtTiI4yxqlKCFLeuxtojrGq41C2Bpc/GdF3Plvi0bVQX2RJDLmJ+8j1
 oevXFBjIe3KCAW7495PYBbepHMw76x7tRNaSE2a+Xtcjj0A6dctxjtPN+aUQQxe0cV1jUPQy
 62IPWt8IlFyIHZPOM60lTQ4cij8HKhFNOiDLYMeN4ZvHJVKl2Fx9KFpngeHBodqPNjjuljr4
 3yXGCRdRnp4z2DODgeCfhEneZo5Vpth0eoR7eGqyXbKarXVyp/zP6XCqW4fbGOHHgw==
Message-ID: <7e3aca8f-3918-08be-f1fd-cb3299c2af16@centricular.com>
Date:   Fri, 13 Sep 2019 23:46:39 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <896688f6-8486-3826-ee74-a225936f824d@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/9/19 10:58 pm, Mathias Nyman wrote:
> On 12.9.2019 17.49, Jan Schmidt wrote:
>> If an endpoint is encountered that returns USB3_LPM_DEVICE_INITIATED,
>> keep
>> checking further endpoints, as there might be periodic endpoints later
>> that return USB3_LPM_DISABLED due to shorter service intervals.
>>
>> Without this, the code can set too high a maximum-exit-latency and
>> prevent the use of multiple USB3 cameras that should be able to work.
>>
>> Signed-off-by: Jan Schmidt <jan@centricular.com>
>> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
>> ---
>>   drivers/usb/host/xhci.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index 03d1e552769b..1986b88661fc 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -4673,12 +4673,12 @@ static int
>> xhci_update_timeout_for_endpoint(struct xhci_hcd *xhci,
>>       alt_timeout = xhci_call_host_update_timeout_for_endpoint(xhci,
>> udev,
>>           desc, state, timeout);
>>   -    /* If we found we can't enable hub-initiated LPM, or
>> +    /* If we found we can't enable hub-initiated LPM, and
>>        * the U1 or U2 exit latency was too high to allow
>> -     * device-initiated LPM as well, just stop searching.
>> +     * device-initiated LPM as well, then we will disable LPM
>> +     * for this device, so stop searching any further.
>>        */
>> -    if (alt_timeout == USB3_LPM_DISABLED ||
>> -            alt_timeout == USB3_LPM_DEVICE_INITIATED) {
>> +    if (alt_timeout == USB3_LPM_DISABLED) {
>>           *timeout = alt_timeout;
>>           return -E2BIG;
>>       }
>>
> 
> Thanks, nice catch. Adding to queue.

Great news for the Oculus Rift support we're working on :)

> While looking at this I see we have a similar issue if driver has
> "disable_hub_initiated_lpm" flag set.
> 
> xhci_get_timeout_no_hub_lpm() might return USB3_LPM_DEVICE_INITIATED
> before we check if periodic endpoints would require disabling LPM
> completely.

Indeed - sorry, I didn't even think to look past the immediate issue.

> xhci_calculate_lpm_timeout()
> ...
>     for (i = 0; i < config->desc.bNumInterfaces; i++) {
>         ...
>         if (intf->dev.driver) {
>             ...
>             if (driver && driver->disable_hub_initiated_lpm) {
>                 return xhci_get_timeout_no_hub_lpm(udev, state);
> 
> I'll write a patch for that

I'll be happy to test by hard-coding the flag.

- Jan.

> 
> -Mathias

-- 
Jan Schmidt, Centricular Ltd - https://centricular.com/
