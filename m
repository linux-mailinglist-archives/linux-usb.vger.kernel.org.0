Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD1620085D
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 14:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732839AbgFSMHp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 08:07:45 -0400
Received: from blockout.pre-sense.de ([213.238.39.74]:49615 "EHLO
        mail.pre-sense.de" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732599AbgFSMHi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jun 2020 08:07:38 -0400
Received: from smtp.pre-sense.de (tetris_b.pre-sense.de [10.9.0.76])
        by mail.pre-sense.de (Postfix) with ESMTP id 254095E4D3;
        Fri, 19 Jun 2020 14:07:34 +0200 (CEST)
Received: from atlan.none (unknown [212.12.60.67])
        by smtp.pre-sense.de (Postfix) with ESMTPS id D72F415FA;
        Fri, 19 Jun 2020 14:07:21 +0200 (CEST)
Subject: Re: Ext. HDDs not working under Linux via USB 3.0 but under Windows
From:   =?UTF-8?Q?Till_D=c3=b6rges?= <doerges@pre-sense.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <512118bc-e639-2387-e608-56b7e30fc3b2@pre-sense.de>
 <20200523154817.GA7091@rowland.harvard.edu>
 <34933b01-e4b0-10da-c935-9e6a9a6ae427@pre-sense.de>
 <20200523203349.GA12853@rowland.harvard.edu>
 <5bd5e8be-f8a9-9456-cced-c2bc75455556@pre-sense.de>
 <20200617163734.GC11314@rowland.harvard.edu>
 <763037ac-d8fa-8697-7f75-c0bf958b4308@pre-sense.de>
 <ce4d0606-b398-d23b-1a5f-25611eb4338f@pre-sense.de>
Autocrypt: addr=doerges@pre-sense.de; prefer-encrypt=mutual; keydata=
 xsFNBFf3cXkBEAC5LdEcPeHSvMw94QTRs9fdasHpCm5qrVlvZhSeJLmz8bjxkhwzyNmQUCyT
 ZPA3CTjDgevt9Bf55QFJsm5PIEw7XKdz0TyLt5RkefM87wzny0zuKRwY+8hi+wZ72cYwJomQ
 O667x+/khboagQos5GInp8UrAL33eoN7N/1z9NnZpLf1Yq0Gcy1MfeGsYNxeosVoeZG0iW8p
 mUe+bAR7brKFuZhl/JNQzkn6xIKJ4jA7xZBIHqRtZ/KrwPskDWO5Pa5X3Kp37JjFnSPqeCW1
 gdHLJUjl78mK2wzuDTXam1vidFgrtHS1oNeZ0AGjTaK88Din1DprAPj3TeVrSVff60diMO3w
 JoxsAJ1wJCjEIi3VfCf/KQAMBEm//+UuuvHg+PNY7VOzMIqwnOa+D9gtUbM/YPthK+hHHKXE
 /yKH7w+1sTgiPZUD0LSXwZ+K+SXXHEtSZsm9BHn1+TX4ik8fWPuQHfd1Tu9L83iEnQyi1twS
 pVCBKgwJ7rnMRGat5u2icpAlPJMWtF9GF/2IZL1KcRAMRk/ckxfR9rpdm6722kTzGDRQcZ8S
 1JjkBysKpCmSw0ukhNgtpSAGeAu3Rdc1wFKUuTcvXekPsCARuBfkwjav+LFXy22LKw9j9IZS
 L2khi3/14XEYkb3Em4mYDX+DHpepJ0kNH+VGiA8kgIWWS+hOVQARAQABzSNUaWxsIERvZXJn
 ZXMgPGRvZXJnZXNAcHJlLXNlbnNlLmRlPsLBpgQTAQoAOQIbAwMLCQMCFQoFFgIDAQACHgEC
 F4AWIQTvEOSugkiJrfgUnlBO9SfZ885jpgUCW3bZ3wUJB30i5gAhCRBO9SfZ885jphYhBO8Q
 5K6CSImt+BSeUE71J9nzzmOmS6EP/0SkQs27d+iUl5LAbc8HBittpriwzjwHjwJ+7s57xaEO
 a8C+b+SCZPvBWxlGEppBYqaZuWp7oExJpwnFBBswdtcCaZh29o52NIx36cM1MQc5JdfVNLkZ
 gPQZ0dizu08GeGzrJvdzIwpx5x1/rrkPFpSmctu1KudZOl2X+LYfpV/ucKmRRKAaqfoKquox
 hreIUkVqSg8oHL3+qF/+GP730cdk8QLrV3wIymwr/9CkSYmIC1eCX/rPyzLd+185BJlTB0yx
 fSPm47raEzIyOd08AYia16mVWecNI6d2qp+la3CpTG78cq4Q4+68wlc7jrHh0Q59bB2WODKV
 kibvwRK0l0M4z1r4UJzTq7ayAD5gTcZ7/kUVroAR0yrKY8cRE/s3cmoJ3RJOeUspBIvxUfNt
 HST24u/iQA0/CvQMWInChSQmI+ydu31+Oy+8MSTBYGQgKs4H9YVblZvVnbI5LquVxU9EWy6g
 EkMvoVOWjfaEK/O6KLLe3blfJts2gOqWUuQ7LQb3n/y4aXUieFOFcBt1Mm5Bs4/mAO8GBy1v
 30uzbfPl3vV2lvW+rSFyHbP3313Vheyo3+C+eFtAfz+6p54nfvyd20D9DLhT22EmSVo0kKC6
 T4oXX/6tnhKIaWbwC3tym41NwsCXV+9wnONX7MTodiB79OJ6kswFiSruR90h3mTuzsFNBFf3
 cXkBEADp2XL6gto5rVrFbsp/qaXzfYOCKgHb+WwBMu2Sbw/W0qQL+3Hcd6DoVTKOQTtShh/m
 tMSoIe2xBtKoei+9EuzbmUnHbdOafvNxXgRTbyVe0QO1UZDyqqx2kS/ZLiezOBxJS9MpjO5s
 b4/bqUvtFrRsxIPPxPT9xwUStZXc+JJniCy9Xl8JAbOf72K8O8tgGgiEjTbVV+Dpjy8Wb3bx
 rgS9v28unef/tO1QAOWNywrNgQmC2ogHVdrfYHgnYlBzzOcgNibexYPcPzhxHkaixCM4tDSL
 +aENCNgri1BvPC7A/VqbP/1NTswIkZ7esN3Pu3mNgdNjP25A9j3bdhIQMRPUJDQ+srZqdxVT
 A9Yx1HnB/9Y/g20KBxfKpXCwBWR8UrN66BDIyxhwzQH9AW4UbK3PgWCG/ldaIWOZft10xJN7
 TXCnUmbfS8EmmBMcjb/IG2aUleEvAVopY6nb3x2JsKBtUqoGRc9iAa0UCJW/bYcy20HrZOgQ
 Rqu34EOja4hh4dZeMNOabaQh08rmx2hpxolUpXPKKhFz8kIjI1S/X4G6/yrcX9L0kCc59ZGY
 IurJQMGzxeNTFv0nSBKk9dxc0b+bpWR1eIcbMhp+VbCMVgmjbF4H+4SxrE8qj8xpEirx4h/L
 tO55oirsAfWfBm2XiOlcGQEHsiSVO4jWX8yX/0CjuQARAQABwsGTBBgBCgAmAhsMFiEE7xDk
 roJIia34FJ5QTvUn2fPOY6YFAlt22kwFCQd9I1MAIQkQTvUn2fPOY6YWIQTvEOSugkiJrfgU
 nlBO9SfZ885jpl+WEACysQF6rouqHurPth7IBuylwR8JJrvbC0KCiGVqGXsl9LUxOgSgOiEA
 Gc+9pzpuX5/T/AmDmvbkZh8zG4ynea33SRQIIpK+RsjgzYk6EO4AmcO5WThQIWiUmMVk8LL9
 T2ycO1f43Zh6M1N3+ujNLTo0DNq/vL+tC2EnlbVE4smFH5uVVK1NNsJmLbIxwIYdwfZlJhZ1
 hipEXE/OWP0gJ0LmHh+2RGddbzzeTrgEzK2Mp4iI3YvkDd1f7iwLgAkfo1fJulCpOo9cDLTw
 KdaId2xKUwvucnkDElV2R60M+I4IEb1lnfRfJ8gyqG5H5SLy5uAhvB+pUEOZqrwo0/4MEcDU
 EExSqA1jpyhmjI1RU3PZBKT5CW3SDED++28t+G5pFxLfIKL3QCPOuRUEvA5C125cDVWzX2uT
 A95fTYIzJfECt1EiTSHN4AJe6GaUcZEBlGDCsY+RPJ0RxPOVUAgRZ2shvJFizj6qr0XVAsuB
 eXBTnCvLdbqjAsAJbKEfpoA7sA84B/tYnFZYzTua1EgZtBqzxNjyph04k10glvGeDm+iL1b4
 QuDrHzQBg3CbhndmRP82DN0ADY0lrhHCclpYSYTwZub+36agWFr1h3QVwP8Suu0ss3ISXM76
 HE3rjB1BJoHR/bllfpTSlA/vy/ZSt9O0wrcoJXQaMArPFU5JXEKOPQ==
Organization: PRESENSE Technologies GmbH
Message-ID: <364ac09a-a877-c04e-5f2f-d5a559406590@pre-sense.de>
Date:   Fri, 19 Jun 2020 14:07:34 +0200
User-Agent: Thunderbird
MIME-Version: 1.0
In-Reply-To: <ce4d0606-b398-d23b-1a5f-25611eb4338f@pre-sense.de>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am 18.06.20 um 09:30 schrieb Till Dörges:
> Am 18.06.20 um 08:07 schrieb Till Dörges:
>> Am 17.06.20 um 18:37 schrieb Alan Stern:
>>> On Wed, Jun 17, 2020 at 06:02:32PM +0200, Till Dörges wrote:
>>>> Hi Alan,
>>>>
>>>> sorry for the delay. It took me a while to get back to this.
>>>>
>>>> Am 23.05.20 um 22:33 schrieb Alan Stern:
>>>>
>>>>>>>> I'm trying to get external HDDs from Sony to work under Linux with USB 3.0.
>>>>>> [...]
>>>>>>>>  - PSZ-HA2T: idVendor=054c, idProduct=087d
>>>>>>>>  - PSZ-HA1T: idVendor=054c, idProduct=087d
>>>>>>>>  - PSZ-HA50: idVendor=054c, idProduct=087d
> [...]
>>>>>> --- snip ---
>>>>>> $ cat /sys/module/usb_storage/parameters/quirks
>>>>>> 054c:087d:f,054c:0c4f:f
>>>>>> --- snip ---
> [...]
>>>> --- snip ---
>>>> $ cat /sys/module/usb_storage/parameters/quirks
>>>> 054c:087d:u
>>>> --- snip ---
>>>>
>>>> W/o this quirk they do not work.
>>>>
>>>>
>>>> I'd be surprised if a non-broken PSZ-HA2T behaved any differently.
>>>>
>>>> So perhaps you might want to consider adding that quirk directly into the Kernel?
>>>>
>>>>
>>>> FTR, the PSZ-HC1T just worked.
>>>
>>> Okay.  If you would like to write a patch for the quirk and submit it, you 
>>> can.  Otherwise I'll write one for you.
>>
>> I'd gladly take your offer of writing one for me. :-)
> 
> Maybe I spoke too soon.

I actually did.

> I reported my results when setting the quirk 054c:087d:*u* (ignore UAS).
> 
> It just occurred to me that 054c:087d:*f* (NO_REPORT_OPCODES) might be sufficient.
> Before going ahead with the patch I suggest I check that, too.

It is. Both PSZ-HA drives work fine with just

--- snip ---
$ cat /sys/module/usb_storage/parameters/quirks
054c:087d:f
--- snap ---

Thanks -- Till
-- 
Dipl.-Inform. Till Dörges                  doerges@pre-sense.de
PRESENSE Technologies GmbH             Nagelsweg 41, D-20097 HH
Geschäftsführer/Managing Directors       AG Hamburg, HRB 107844
Till Dörges, Jürgen Sander               USt-IdNr.: DE263765024
