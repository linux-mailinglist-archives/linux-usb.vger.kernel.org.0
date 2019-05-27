Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F23042B37B
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2019 13:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfE0LuV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 May 2019 07:50:21 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40827 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfE0LuV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 May 2019 07:50:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id h13so11853593lfc.7
        for <linux-usb@vger.kernel.org>; Mon, 27 May 2019 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pp1HOfS6OCew4hOY4gEFNb0Q8jF2KOJSncUe3LIsm+E=;
        b=f47GmnwIjwZrqaU7ErzymLfrdqvyrdyCmixvkkYF3dzWPX66Bb+EjcyzmV5wdPTAPv
         C6S6wWFK6qYi1olY4pjCb4KR6WE/vFlSleCYArbDO7XtAodmS2iV7+Oye5h86ES/AaWH
         7EFgUsE3f/L/s6qc0zPlSszcq6iaU+9hOOOnW08tB3pyOWvAGSZPsIDgrPqoPGUReUdX
         eQNZ3OxdC6i8Uep+ZPWgdpN7f9XNSiMybIoj1SWvYx7Qyfqg7sULEPDRZUQ5Kjsvl0nB
         DqXh6zrrAWjNc0wbsgcOs1yynW/ArR0BEofc23odR0fYDb+5ai3Dkp2ySEBfSt3RNm9R
         4TVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pp1HOfS6OCew4hOY4gEFNb0Q8jF2KOJSncUe3LIsm+E=;
        b=DUI8ABntlU2HnAOlnEwtDyFjUMe1OWSusQ+O7C9mr8IFcaEU7grbRkyZ7mz1T3N5Lk
         O06TQifoDlQvLaDfNrrx9BMXhOva6T2dUPoTZ4LQZUKZcf/cbzVPVzPhqz8HPrmvhCDx
         +wpJZ+ssqCF7G4SaDJZvvYm53lek8tRguGEEHmsepOarIhuA/Nv/HKvPxF1fhLhFS2+M
         Hk5m5wdZsnI3GVUy4atXx9014HxAFV8ONV1fGZp5DFCEQVkGNdzrttg5/9k8R7l56zk/
         iX+r5lL/qGVnuOL87p6FA1pH4SvC5YZVDXR6OAuAhHO079q4PtUyGvPWzHrTmbXjxhGk
         N4pA==
X-Gm-Message-State: APjAAAWgfQCjFkIu4utI0EmImVuOSpsZdVHBaig9V2Cn4D8N7uAjJ/ZK
        aIQyd7DUUq/YE2kmnZB0iTiv4g==
X-Google-Smtp-Source: APXvYqyeghVw7Hlqyc73MevUBLPu49ZgfVRkkFi1ISP4HjS790w/5OwT2liWW8VlG9UnUuwgJce1kw==
X-Received: by 2002:ac2:59c8:: with SMTP id x8mr8006293lfn.189.1558957818849;
        Mon, 27 May 2019 04:50:18 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.80.152])
        by smtp.gmail.com with ESMTPSA id y14sm2239532ljh.60.2019.05.27.04.50.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 04:50:17 -0700 (PDT)
Subject: Re: [PATCH 1/1] usb: chipidea: udc: workaround for endpoint conflict
 issue
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, stable@vger.kernel.org, Jun Li <jun.li@nxp.com>
References: <20190527074222.42970-1-peter.chen@nxp.com>
 <64ff033b-7f7e-ad91-ac06-73ebd8565286@cogentembedded.com>
 <CAL411-ouY92Yk2TGqdx9KuhT71p=qEcSC426JwmerBmFAXd+=A@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1ddc434b-5771-6af1-e63a-581ef11a21b5@cogentembedded.com>
Date:   Mon, 27 May 2019 14:49:56 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAL411-ouY92Yk2TGqdx9KuhT71p=qEcSC426JwmerBmFAXd+=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27.05.2019 12:44, Peter Chen wrote:

>>> An endpoint conflict occurs when the USB is working in device mode
>>> during an isochronous communication. When the endpointA IN direction
>>> is an isochronous IN endpoint, and the host sends an IN token to
>>> endpointA on another device, then the OUT transaction may be missed
>>> regardless the OUT endpoint number. Generally, this occurs when the
>>> device is connected to the host through a hub and other devices are
>>> connected to the same hub.
>>>
>>> The affected OUT endpoint can be either control, bulk, isochronous, or
>>> an interrupt endpoint. After the OUT endpoint is primed, if an IN token
>>> to the same endpoint number on another device is received, then the OUT
>>> endpoint may be unprimed (cannot be detected by software), which causes
>>> this endpoint to no longer respond to the host OUT token, and thus, no
>>> corresponding interrupt occurs.
>>>
>>> There is no good workaround for this issue, the only thing the software
>>> could do is numbering isochronous IN from the highest endpoint since we
>>> have observed most of device number endpoint from the lowest.
>>>
>>> Cc: <stable@vger.kernel.org> #v3.14+
>>> Cc: Jun Li <jun.li@nxp.com>
>>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
>>> ---
>>>    drivers/usb/chipidea/udc.c | 24 ++++++++++++++++++++++++
>>>    1 file changed, 24 insertions(+)
>>>
>>> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
>>> index 829e947cabf5..411d387a45c9 100644
>>> --- a/drivers/usb/chipidea/udc.c
>>> +++ b/drivers/usb/chipidea/udc.c
>>> @@ -1622,6 +1622,29 @@ static int ci_udc_pullup(struct usb_gadget *_gadget, int is_on)
>>>    static int ci_udc_start(struct usb_gadget *gadget,
>>>                         struct usb_gadget_driver *driver);
>>>    static int ci_udc_stop(struct usb_gadget *gadget);
>>> +
>>> +
>>> +/* Match ISOC IN from the highest endpoint */
>>> +static struct
>>
>>      Um, please break the line before the function's type is fully described.

    Mm, I meant to type "after". :-)

>>
>>> +usb_ep *ci_udc_match_ep(struct usb_gadget *gadget,
>>> +                           struct usb_endpoint_descriptor *desc,
>>> +                           struct usb_ss_ep_comp_descriptor *comp_desc)
>>> +{
>>> +     struct ci_hdrc *ci = container_of(gadget, struct ci_hdrc, gadget);
>>> +     struct usb_ep *ep;
>>> +     u8 type = desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK;
>>> +
>>> +     if ((type == USB_ENDPOINT_XFER_ISOC) &&
>>> +             (desc->bEndpointAddress & USB_DIR_IN)) {
>>
>>      Please add 1 more tab here, so that this line doesn't blend with the
>> following statement.
>>
>>> +             list_for_each_entry_reverse(ep, &ci->gadget.ep_list, ep_list) {
>>> +                     if (ep->caps.dir_in && !ep->claimed)
>>> +                             return ep;
>>> +             }
>>> +     }
>>> +
>>> +     return NULL;
>>> +}
>>> +
>>>    /**
>>>     * Device operations part of the API to the USB controller hardware,
>>>     * which don't involve endpoints (or i/o)
> 
> Will change both comments, thanks.

    TIA.

> Peter

MBR, Sergei
