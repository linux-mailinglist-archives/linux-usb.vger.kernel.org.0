Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4816648D89
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 21:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfFQTId (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 15:08:33 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.61.142]:42236 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726048AbfFQTId (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 15:08:33 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 00C7FC0169;
        Mon, 17 Jun 2019 19:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560798513; bh=egZHnyMhhAZ5G8SXJ4jOAqzEgooWv/3NXxzZZBQUYd0=;
        h=From:To:CC:Subject:Date:References:From;
        b=KCX6zZpPnhveFMWDFrSU3R23MPQH5/BqbBCVHH6gbgFjA8iCGmt1vUOsK8NmlriJr
         kt+BdnTK4BypLOlk2dA6RFHnK8NXPYw93nxgEQWxygeqdrGy/7v0t+PqO7d8lWg3Iz
         QERCN1GwoyG0xpEjOPavOqa1koMky5q9nhLm1XnWecx9TOw5I06QeBYyRba+6EWRNQ
         nKjATKeCwYss38srsVdCHrRoSlHgJ4Ple65AxYMH+NGNEHI9NtvjZT9dk5TuO0f1hN
         HcZx91NBo1n006RThE4K1Lm1bh82zs1to5Cb0VK6LevRez5zRtdoSYDCPEjJc5PMuK
         eBfdoZ5Vp9CEA==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 94F6CA006A;
        Mon, 17 Jun 2019 19:08:32 +0000 (UTC)
Received: from us01wembx1.internal.synopsys.com ([169.254.1.22]) by
 US01WEHTC2.internal.synopsys.com ([10.12.239.237]) with mapi id
 14.03.0415.000; Mon, 17 Jun 2019 12:08:32 -0700
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     John Youn <John.Youn@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        John Youn <John.Youn@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Topic: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Index: AQHVHRZlsWV0TH3kp0u96EW7I6xXQg==
Date:   Mon, 17 Jun 2019 19:08:32 +0000
Message-ID: <30102591E157244384E984126FC3CB4F63A11B8A@us01wembx1.internal.synopsys.com>
References: <87a7etd8s7.fsf@linux.intel.com>
 <2B3535C5ECE8B5419E3ECBE30077290902E78AF3D7@us01wembx1.internal.synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.13.184.19]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0A=
=0A=
John Youn wrote:=0A=
>> -----Original Message-----=0A=
>> From: Felipe Balbi <felipe.balbi@linux.intel.com>=0A=
>> Sent: Friday, June 7, 2019 2:50 AM=0A=
>> To: John Youn <John.Youn@synopsys.com>=0A=
>> Cc: linux-usb@vger.kernel.org=0A=
>> Subject: [RFC] Sorting out dwc3 ISOC endpoints once and for all=0A=
>>=0A=
> ++ Thinh=0A=
>=0A=
> Hi Felipe,=0A=
>=0A=
> Sorry, missed this e-mail.=0A=
>=0A=
>> Now that we have dwc3_gadget_start_isoc_quirk() which figures out the=0A=
>> correct combination for the top-most 2 bits in the frame number, why=0A=
>> don't we just use that to start isochronous transfers and never, again,=
=0A=
>> have Bus Expiry problems?=0A=
> We should only see expiry problems on the affected versions with incorrec=
t top-2 bits right?=0A=
>=0A=
>> I mean something along the lines of below diff (completely untested):=0A=
>>=0A=
>> modified   drivers/usb/dwc3/gadget.c=0A=
>> @@ -1369,9 +1369,8 @@ static int dwc3_gadget_start_isoc_quirk(struct=0A=
>> dwc3_ep *dep)=0A=
>>  	else if (test0 && test1)=0A=
>>  		dep->combo_num =3D 0;=0A=
>>=0A=
>> -	dep->frame_number &=3D 0x3fff;=0A=
>>  	dep->frame_number |=3D dep->combo_num << 14;=0A=
>> -	dep->frame_number +=3D max_t(u32, 4, dep->interval);=0A=
>> +	dep->frame_number =3D DWC3_ALIGN_FRAME(dep, 1);=0A=
>>=0A=
>>  	/* Reinitialize test variables */=0A=
>>  	dep->start_cmd_status =3D 0;=0A=
>> @@ -1383,33 +1382,16 @@ static int dwc3_gadget_start_isoc_quirk(struct=
=0A=
>> dwc3_ep *dep)=0A=
>>  static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)=0A=
>>  {=0A=
>>  	struct dwc3 *dwc =3D dep->dwc;=0A=
>> -	int ret;=0A=
>> -	int i;=0A=
>>=0A=
>>  	if (list_empty(&dep->pending_list)) {=0A=
>>  		dep->flags |=3D DWC3_EP_PENDING_REQUEST;=0A=
>>  		return -EAGAIN;=0A=
>>  	}=0A=
>>=0A=
>> -	if (!dwc->dis_start_transfer_quirk && dwc3_is_usb31(dwc) &&=0A=
>> -	    (dwc->revision <=3D DWC3_USB31_REVISION_160A ||=0A=
>> -	     (dwc->revision =3D=3D DWC3_USB31_REVISION_170A &&=0A=
>> -	      dwc->version_type >=3D DWC31_VERSIONTYPE_EA01 &&=0A=
>> -	      dwc->version_type <=3D DWC31_VERSIONTYPE_EA06))) {=0A=
>> -=0A=
>> -		if (dwc->gadget.speed <=3D USB_SPEED_HIGH && dep->direction)=0A=
>> -			return dwc3_gadget_start_isoc_quirk(dep);=0A=
>> -	}=0A=
>> -=0A=
>> -	for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {=0A=
>> -		dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i + 1);=0A=
>> +	dep->frame_number =3D __dwc3_gadget_get_frame(dwc);=0A=
>> +	dep->frame_number =3D DWC3_ALIGN_FRAME(dep, 1);=0A=
>>=0A=
>> -		ret =3D __dwc3_gadget_kick_transfer(dep);=0A=
>> -		if (ret !=3D -EAGAIN)=0A=
>> -			break;=0A=
>> -	}=0A=
>> -=0A=
>> -	return ret;=0A=
>> +	return dwc3_gadget_start_isoc_quirk(dep);=0A=
>>  }=0A=
>>=0A=
>>  static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct=0A=
>> dwc3_request *req)=0A=
>>=0A=
>>=0A=
>> Would there be any obvious draw-back to going down this route? The thing=
=0A=
>> is that, as it is, it seems like we will *always* have some corner case=
=0A=
>> where we can't guarantee that we can even start a transfer since there's=
=0A=
>> no upper-bound between XferNotReady and gadget driver finally queueing a=
=0A=
>> request. Also, I can't simply read DSTS for the frame number because of=
=0A=
>> top-most 2 bits.=0A=
>>=0A=
> For non-affected version of the IP, the xfernotready -> starttransfer tim=
e will have to be off by more than a couple seconds for the driver to produ=
ce an incorrect 16-bit frame number. If you're seeing errors here, maybe we=
 just need to code review the relevant sections to make sure the 14/16-bit =
and rollover conditions are all handled correctly.=0A=
=0A=
I think what Felipe may see is some delay in the system that causes the=0A=
SW to not handle XferNotReady event in time. We already have the "retry"=0A=
method handle that to a certain extend.=0A=
=0A=
> But I can't think of any obvious drawbacks of the quirk, other than doing=
 some unnecessary work, which shouldn't produce any bad side-effects. But w=
e haven't really tested that.=0A=
>=0A=
=0A=
The workaround for the isoc_quirk requires 2 tries sending=0A=
START_TRANSFER command. This means that you have to account the delay of=0A=
that command completion plus potentially 1 more END_TRANSFER completion.=0A=
That's why the quirk gives a buffer of at least 4 uframes of the=0A=
scheduled isoc frame. So, it cannot schedule immediately on the next=0A=
uframe, that's one of the drawbacks.=0A=
=0A=
=0A=
Hi Felipe,=0A=
=0A=
Since you're asking this, it means you're still seeing issue with your=0A=
setup despite retrying to send START_TRANSFER command 5 times. What's=0A=
the worse delay responding to XferNotReady you're seeing in your setup?=0A=
=0A=
BR,=0A=
Thinh=0A=
=0A=
=0A=
