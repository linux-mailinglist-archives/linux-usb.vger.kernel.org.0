Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01873257A0B
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 15:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgHaNH5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 09:07:57 -0400
Received: from mga17.intel.com ([192.55.52.151]:3413 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726249AbgHaNHw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 09:07:52 -0400
IronPort-SDR: WWH8KCmrgdoq+d1DEwxjJAZwgueSvTdaTcIv6+cW9qy4gh9Ke0iPgHkIx2I34yCbTsLQgu88O3
 aA03ptc9rYeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="137015568"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="137015568"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 06:07:51 -0700
IronPort-SDR: TftJ8w9CgwEpepgvlqjh3XEDiELLyGx/Hy2WvhqDPvnJ3ZZ54wTByK7sySJmLbWLi2O1D9WLlB
 PFk/m5rwAnng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="445707943"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2020 06:07:49 -0700
Subject: Re: [PATCH v2] usb: xhci: add debugfs support for ep with stream
To:     Jun Li <jun.li@nxp.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <1594901321-6992-1-git-send-email-jun.li@nxp.com>
 <DB8PR04MB6523AC8B5B7C1DEDA1254F0A89430@DB8PR04MB6523.eurprd04.prod.outlook.com>
 <c6c4f598-ff8a-8b51-d87c-c5d20f4421a4@linux.intel.com>
 <VE1PR04MB65289D522279DD1267A1FFF5895C0@VE1PR04MB6528.eurprd04.prod.outlook.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
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
Message-ID: <5257ec39-9f59-58fe-661f-a1cd69955f1e@linux.intel.com>
Date:   Mon, 31 Aug 2020 16:11:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB65289D522279DD1267A1FFF5895C0@VE1PR04MB6528.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18.8.2020 4.54, Jun Li wrote:
> 
> 
>> -----Original Message-----
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Sent: Monday, August 17, 2020 7:48 PM
>> To: Jun Li <jun.li@nxp.com>; mathias.nyman@intel.com
>> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx
>> <linux-imx@nxp.com>
>> Subject: Re: [PATCH v2] usb: xhci: add debugfs support for ep with stream
>>
>> On 13.8.2020 12.57, Jun Li wrote:
>>> Hi
>>>
>>>> -----Original Message-----
>>>> From: Jun Li <jun.li@nxp.com>
>>>> Sent: Thursday, July 16, 2020 8:40 PM
>>>> To: mathias.nyman@intel.com
>>>> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
>>>> dl-linux-imx <linux-imx@nxp.com>
>>>> Subject: [PATCH v2] usb: xhci: add debugfs support for ep with stream
>>>>
>>>> To show the trb ring of streams, use the exsiting ring files of bulk
>>>> ep to show trb ring of one specific stream ID, which stream ID's trb
>>>> ring will be shown, is controlled by a new debugfs file stream_id,
>>>> this is to avoid to create a large number of dir for every allocate
>>>> stream IDs, another debugfs file stream_context_array is created to show all
>> the allocated stream context array entries.
>>>>
>>>> Signed-off-by: Li Jun <jun.li@nxp.com>
>>>> ---
>>>> chanages for v2:
>>>> -  Drop stream files remove, the stream files will be removed
>>>>    with ep dir removal, keep the ep but only remove streams
>>>>    actually does not make sense in current code.
>>>> -  Use the new_ring for show_ring pointer for non-zero ep.
>>>>
>>>>  drivers/usb/host/xhci-debugfs.c | 112
>>>> +++++++++++++++++++++++++++++++++++++++-
>>>>  drivers/usb/host/xhci-debugfs.h |  10 ++++
>>>>  drivers/usb/host/xhci.c         |   1 +
>>>>  3 files changed, 122 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/usb/host/xhci-debugfs.c
>>>> b/drivers/usb/host/xhci-debugfs.c index 65d8de4..708585c 100644
>>>> --- a/drivers/usb/host/xhci-debugfs.c
>>>> +++ b/drivers/usb/host/xhci-debugfs.c
>>>> @@ -450,9 +450,14 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd *xhci,
>>>>  	if (!epriv)
>>>>  		return;
>>>>
>>>> +	if (dev->eps[ep_index].ring)
>>>> +		epriv->show_ring = dev->eps[ep_index].ring;
>>>> +	else
>>>> +		epriv->show_ring = dev->eps[ep_index].new_ring;
>>>> +

Ran some tests and the I suspect the above code causes issues.

If an endpoint is dropped and added back the above code will store the
old ring in epriv->show_ring as we have both a .ring and .new_ring present at
that moment. Soon after this the old ring pointed to by .ring will be freed,
and .ring = .new_ring will be set.

Old code showed whatever ring buffer eps[i].ring pointer pointed to when the
sysfs file was read, (as we saved the address, &eps[i].ring). I see now that
it in theory it had a small gap before .ring = .new_ring was set where user
could read the ring buffer and .ring would still be a NULL pointer.
That needs to be fixed as well.

I still like the old way of using double pointer more.
xhci driver will also dig out the current ring from eps[i].ring, so I think we
should as well.
(in stream case it would be &ep->stream_info->stream_rings[stream_id])

-Mathias
