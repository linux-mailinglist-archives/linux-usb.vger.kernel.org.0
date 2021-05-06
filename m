Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E0637513C
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 11:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbhEFJHf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 05:07:35 -0400
Received: from mga07.intel.com ([134.134.136.100]:15559 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233686AbhEFJHd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 05:07:33 -0400
IronPort-SDR: YsP0cgUhULl0bPVhdkux3+34c6LkLVrHGrmfWxH7nsXq+ByOnY5vFhxEwg3A8pMhDAWZUaWpL7
 pu6RCFr9XM3Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="262368414"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; 
   d="scan'208";a="262368414"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2021 02:06:20 -0700
IronPort-SDR: pzjzOGN+fM8oEU7B0ElXgfBdl9S9I+8whhNf1KxScAay8hJAypQRRCq2sqzQGLMUXPvMpFITH2
 GPtEjrbPXy4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; 
   d="scan'208";a="622386656"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 06 May 2021 02:06:17 -0700
Subject: Re: [PATCH] [RFC] xhci: Add Link TRB sync quirk for ASM3142
To:     Ole Salscheider <ole@salscheider.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org
References: <20210416093729.41865-1-ole@salscheider.org>
 <9bf0060c-3427-a261-531c-c075054ae094@linux.intel.com>
 <5c92dd8c-c8b0-40b5-addb-2df360673462@salscheider.org>
 <a8b56a79-e092-a344-7508-8c22b6568898@salscheider.org>
 <e68b481e-a9a1-787e-b263-461bc9597b65@intel.com>
 <c9a18ec2-7fb1-f206-1d27-ce3fa52be762@salscheider.org>
 <9335fdde-4996-1fe5-42ac-fc70bb98d20c@linux.intel.com>
 <5ed67ab2-39de-c2d9-647a-df88dac3e6e5@salscheider.org>
 <41cd7996-f30e-8519-5aa3-264ddfc1473a@salscheider.org>
Cc:     Jiahau Chang <jiahau@gmail.com>,
        Jiahau Chang <Lars_chang@asmedia.com.tw>,
        Forest Crossman <cyrozap@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 mQINBFMB0ccBEADd+nZnZrFDsIjQtclVz6OsqFOQ6k0nQdveiDNeBuwyFYykkBpaGekoHZ6f
 lH4ogPZzQ+pzoJEMlRGXc881BIggKMCMH86fYJGfZKWdfpg9O6mqSxyEuvBHKe9eZCBKPvoC
 L2iwygtO8TcXXSCynvXSeZrOwqAlwnxWNRm4J2ikDck5S5R+Qie0ZLJIfaId1hELofWfuhy+
 tOK0plFR0HgVVp8O7zWYT2ewNcgAzQrRbzidA3LNRfkL7jrzyAxDapuejuK8TMrFQT/wW53e
 uegnXcRJaibJD84RUJt+mJrn5BvZ0MYfyDSc1yHVO+aZcpNr+71yZBQVgVEI/AuEQ0+p9wpt
 O9Wt4zO2KT/R5lq2lSz1MYMJrtfFRKkqC6PsDSB4lGSgl91XbibK5poxrIouVO2g9Jabg04T
 MIPpVUlPme3mkYHLZUsboemRQp5/pxV4HTFR0xNBCmsidBICHOYAepCzNmfLhfo1EW2Uf+t4
 L8IowAaoURKdgcR2ydUXjhACVEA/Ldtp3ftF4hTQ46Qhba/p4MUFtDAQ5yeA5vQVuspiwsqB
 BoL/298+V119JzM998d70Z1clqTc8fiGMXyVnFv92QKShDKyXpiisQn2rrJVWeXEIVoldh6+
 J8M3vTwzetnvIKpoQdSFJ2qxOdQ8iYRtz36WYl7hhT3/hwkHuQARAQABtCdNYXRoaWFzIE55
 bWFuIDxtYXRoaWFzLm55bWFuQGdtYWlsLmNvbT6JAjsEEwECACUCGwMGCwkIBwMCBhUIAgkK
 CwQWAgMBAh4BAheABQJTAeo1AhkBAAoJEFiDn/uYk8VJOdIP/jhA+RpIZ7rdUHFIYkHEKzHw
 tkwrJczGA5TyLgQaI8YTCTPSvdNHU9Rj19mkjhUO/9MKvwfoT2RFYqhkrtk0K92STDaBNXTL
 JIi4IHBqjXOyJ/dPADU0xiRVtCHWkBgjEgR7Wihr7McSdVpgupsaXhbZjXXgtR/N7PE0Wltz
 hAL2GAnMuIeJyXhIdIMLb+uyoydPCzKdH6znfu6Ox76XfGWBCqLBbvqPXvk4oH03jcdt+8UG
 2nfSeti/To9ANRZIlSKGjddCGMa3xzjtTx9ryf1Xr0MnY5PeyNLexpgHp93sc1BKxKKtYaT0
 lR6p0QEKeaZ70623oB7Sa2Ts4IytqUVxkQKRkJVWeQiPJ/dZYTK5uo15GaVwufuF8VTwnMkC
 4l5X+NUYNAH1U1bpRtlT40aoLEUhWKAyVdowxW4yGCP3nL5E69tZQQgsag+OnxBa6f88j63u
 wxmOJGNXcwCerkCb+wUPwJzChSifFYmuV5l89LKHgSbv0WHSN9OLkuhJO+I9fsCNvro1Y7dT
 U/yq4aSVzjaqPT3yrnQkzVDxrYT54FLWO1ssFKAOlcfeWzqrT9QNcHIzHMQYf5c03Kyq3yMI
 Xi91hkw2uc/GuA2CZ8dUD3BZhUT1dm0igE9NViE1M7F5lHQONEr7MOCg1hcrkngY62V6vh0f
 RcDeV0ISwlZWuQINBFMB0ccBEACXKmWvojkaG+kh/yipMmqZTrCozsLeGitxJzo5hq9ev31N
 2XpPGx4AGhpccbco63SygpVN2bOd0W62fJJoxGohtf/g0uVtRSuK43OTstoBPqyY/35+VnAV
 oA5cnfvtdx5kQPIL6LRcxmYKgN4/3+A7ejIxbOrjWFmbWCC+SgX6mzHHBrV0OMki8R+NnrNa
 NkUmMmosi7jBSKdoi9VqDqgQTJF/GftvmaZHqgmVJDWNrCv7UiorhesfIWPt1O/AIk9luxlE
 dHwkx5zkWa9CGYvV6LfP9BznendEoO3qYZ9IcUlW727Le80Q1oh69QnHoI8pODDBBTJvEq1h
 bOWcPm/DsNmDD8Rwr/msRmRyIoxjasFi5WkM/K/pzujICKeUcNGNsDsEDJC5TCmRO/TlvCvm
 0X+vdfEJRZV6Z+QFBflK1asUz9QHFre5csG8MyVZkwTR9yUiKi3KiqQdaEu+LuDD2CGF5t68
 xEl66Y6mwfyiISkkm3ETA4E8rVZP1rZQBBm83c5kJEDvs0A4zrhKIPTcI1smK+TWbyVyrZ/a
 mGYDrZzpF2N8DfuNSqOQkLHIOL3vuOyx3HPzS05lY3p+IIVmnPOEdZhMsNDIGmVorFyRWa4K
 uYjBP/W3E5p9e6TvDSDzqhLoY1RHfAIadM3I8kEx5wqco67VIgbIHHB9DbRcxQARAQABiQIf
 BBgBAgAJBQJTAdHHAhsMAAoJEFiDn/uYk8VJb7AQAK56tgX8V1Wa6RmZDmZ8dmBC7W8nsMRz
 PcKWiDSMIvTJT5bygMy1lf7gbHXm7fqezRtSfXAXr/OJqSA8LB2LWfThLyuuCvrdNsQNrI+3
 D+hjHJjhW/4185y3EdmwwHcelixPg0X9EF+lHCltV/w29Pv3PiGDkoKxJrnOpnU6jrwiBebz
 eAYBfpSEvrCm4CR4hf+T6MdCs64UzZnNt0nxL8mLCCAGmq1iks9M4bZk+LG36QjCKGh8PDXz
 9OsnJmCggptClgjTa7pO6040OW76pcVrP2rZrkjo/Ld/gvSc7yMO/m9sIYxLIsR2NDxMNpmE
 q/H7WO+2bRG0vMmsndxpEYS4WnuhKutoTA/goBEhtHu1fg5KC+WYXp9wZyTfeNPrL0L8F3N1
 BCEYefp2JSZ/a355X6r2ROGSRgIIeYjAiSMgGAZMPEVsdvKsYw6BH17hDRzltNyIj5S0dIhb
 Gjynb3sXforM/GVbr4mnuxTdLXQYlj2EJ4O4f0tkLlADT7podzKSlSuZsLi2D+ohKxtP3U/r
 42i8PBnX2oAV0UIkYk7Oel/3hr0+BP666SnTls9RJuoXc7R5XQVsomqXID6GmjwFQR5Wh/RE
 IJtkiDAsk37cfZ9d1kZ2gCQryTV9lmflSOB6AFZkOLuEVSC5qW8M/s6IGDfYXN12YJaZPptJ fiD/
Message-ID: <2c93e750-70e0-792f-1f10-e416751270b7@linux.intel.com>
Date:   Thu, 6 May 2021 12:08:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <41cd7996-f30e-8519-5aa3-264ddfc1473a@salscheider.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5.5.2021 10.56, Ole Salscheider wrote:
> Hi Mathias,
> 
> ...
> 
>>> How about a different approach?
>>> If the issue is only with transfers starting on the last TRB before the link TRB, we could turn that TRB to a no-op.
>>> Does something like the code below help?
>>>
>>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>>> index 6cdea0d00d19..0ffda8127640 100644
>>> --- a/drivers/usb/host/xhci-ring.c
>>> +++ b/drivers/usb/host/xhci-ring.c
>>> @@ -3181,6 +3181,12 @@ static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
>>>           }
>>>       }
>>> +    if (ep_ring != xhci->cmd_ring &&
>>> +        !trb_is_link(ep_ring->enqueue) &&
>>> +        trb_is_link(ep_ring->enqueue + 1))
>>> +        queue_trb(xhci, ep_ring, 0, 0, 0, 0,
>>> +              TRB_TYPE(TRB_TR_NOOP) | ep_ring->cycle_state);
>>> +
>>>       while (trb_is_link(ep_ring->enqueue)) {
>>>           /* If we're not dealing with 0.95 hardware or isoc rings
>>>            * on AMD 0.96 host, clear the chain bit.
>>
>> Your patch seems to work. I can record video with this and it seems stable so far.
>>
>> But there is still something off (as with my patch): If I stop the video recording and try to record again, the camera does not give me any frames. Maybe this is an unrelated issue but it works fine on the two other host controllers that I tested.
>>
>> If you are interested you can find a trace here:
>> https://stuff.salscheider.org/dmesg_second
>> https://stuff.salscheider.org/trace_second
>>
>> In this trace I recorded a few seconds of video with ffmpeg, killed it (at second 108) and restarted it (at second 116). Can you see anything suspicious in the trace?
> 
> I guess this second issue is unrelated. The cameras have worked stable so far with your patch. It might be good to include this workaround in mainline. Will you take care of it or should I send something to the list?
>

This is still not a very nice solution. We have no clue about the actual rootcause.

I remember now there was a similar issue with an earlier ASMedia host some years ago.
This was fixed by modifying some internal flowcontol parameters of the host in:

9da5a1092b13 xhci: Bad Ethernet performance plugged in ASM1042A host

Not sure if  Jiahau Chang (cc) works on this anymore, but maybe he knows who to contact.
Also adding Forest Crossman who has committed ASMediad fixes lately

Any clue about the rootcause?
thread:
https://lore.kernel.org/linux-usb/20210416093729.41865-1-ole@salscheider.org

Thanks
-Mathias
