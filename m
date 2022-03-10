Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E29394D5377
	for <lists+linux-usb@lfdr.de>; Thu, 10 Mar 2022 22:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245467AbiCJVLk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Mar 2022 16:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238779AbiCJVLj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Mar 2022 16:11:39 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E23E0154734
        for <linux-usb@vger.kernel.org>; Thu, 10 Mar 2022 13:10:37 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id w4so8589734edc.7
        for <linux-usb@vger.kernel.org>; Thu, 10 Mar 2022 13:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sdrXghyjSVHFb+yz++V3HzEqP1U2DdyypDa2QGjMBHs=;
        b=mhpWc9HQv13QJsM4PEp08Nz7KpUVebSYRdLEtYYPdvD1Fbi5vG3Ou8mYrbbAlVK4WX
         jh9ibqGjKePXiWvL7XauD7RsSLfmNzbfYxAXrUMkaNM1euOS/IFvy04UMksuDlXlo27K
         6RUKSguvCCZtruq1JXjlJJ5kUpCsYQFv1otOYrYEPVJBAnr8hQE/d7Zx3idjzhF54mOj
         UUuH8rMbfQecRRXtf6wEo3fHSPGeK5KNzaLNAc0CK+SL9gnKMKxAUIA9uuZphIkmeXg5
         eANQKJNXEdAeORxMxDv+HnVCl56MnLndP6HdIdGQ5BNe4iu9BwkjnwptFVNvd5iZSx0U
         fj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sdrXghyjSVHFb+yz++V3HzEqP1U2DdyypDa2QGjMBHs=;
        b=OXzp17hAYKkTaSnBG08/VCES/V5JXy9/eai8utHUr292PD/dJ/DOK07ZmQUcbo72hA
         UOQIRvCdr2kuwpYQvOZmDbLU3Q9ehcokNS+TNCjeHg/gV+yltyFqWYxQjQPW8V4eDcGx
         7QfpDWTlofDSMXrdl5tg8b441TzkQp9/xDl5cjkvOytnsnf6gPTMSynXW6WO20OVo2qb
         8WXfLDHdTPjiB7JU1Ro6pDOH/2Lk9u95fsz+W5S6OWQRTIrFxL84ryDtXi68icqiXabh
         839UKR4+tuveGb6O79B0x2he6UGFr2Ake4cKGUVqpIeLlpq+/ZJGWSKYdkvy8PWD77lL
         xjtg==
X-Gm-Message-State: AOAM5300WnWxZr0S5ThCvDognu1iUdpzGVIr7UJiuzV72+2E6E3GKaRa
        rrB0WkOfQB+oWppA6rD1vicO+zyeOLU=
X-Google-Smtp-Source: ABdhPJzx4bJ+h68HZu/UDyqKeW0k2okErrlnfOON8PxM7YlUVUQ1T+7ovoO+QZPbGZSLHnxY9RVVTg==
X-Received: by 2002:a05:6402:150f:b0:416:175d:3f5d with SMTP id f15-20020a056402150f00b00416175d3f5dmr6234910edw.184.1646946636278;
        Thu, 10 Mar 2022 13:10:36 -0800 (PST)
Received: from ?IPV6:2a01:c22:72cc:7000:95e2:80d9:a43c:4b6f? (dynamic-2a01-0c22-72cc-7000-95e2-80d9-a43c-4b6f.c22.pool.telefonica.de. [2a01:c22:72cc:7000:95e2:80d9:a43c:4b6f])
        by smtp.googlemail.com with ESMTPSA id j5-20020a056402238500b00416c32d548esm713889eda.59.2022.03.10.13.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 13:10:35 -0800 (PST)
Message-ID: <2e7118f1-99df-1811-5f3e-8cd9893a83c6@gmail.com>
Date:   Thu, 10 Mar 2022 22:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 5/5] xhci: support omitting shared hcd if either of the
 root hubs has no ports
Content-Language: en-US
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
 <e73bc0c1-e530-7419-0197-1b7de02c87c5@gmail.com>
 <e41743c9-73dd-0c2c-3df3-a20b53f066e8@linux.intel.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <e41743c9-73dd-0c2c-3df3-a20b53f066e8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08.03.2022 15:55, Mathias Nyman wrote:
> On 4.3.2022 20.37, Heiner Kallweit wrote:
>> If either of the root hubs has no ports, then we can get rid of
>> overhead like the shared hcd. A major internal change is that now
>> the main hcd can be USB2 or USB3.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/usb/host/xhci-mem.c | 11 +++++------
>>  drivers/usb/host/xhci.c     |  9 ++++++---
>>  2 files changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
>> index a1a17713a..ced139583 100644
>> --- a/drivers/usb/host/xhci-mem.c
>> +++ b/drivers/usb/host/xhci-mem.c
>> @@ -2362,12 +2362,11 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
>>  		xhci->usb2_rhub.num_ports = USB_MAXCHILDREN;
>>  	}
>>  
>> -	xhci->needs_shared_hcd = 1;
>> -
>> -	/*
>> -	 * Note we could have all USB 3.0 ports, or all USB 2.0 ports.
>> -	 * Not sure how the USB core will handle a hub with no ports...
>> -	 */
>> +	if (xhci->usb2_rhub.num_ports && xhci->usb3_rhub.num_ports)
>> +		xhci->needs_shared_hcd = 1;
>> +	else
>> +		xhci_info(xhci, "USB%u root hub has no ports\n",
>> +			  xhci->usb2_rhub.num_ports ? 3 : 2);
> 
> This now works for xhci controllers using xhci-plat.c, but in all other cases
> the the secondary hcd will still be added.
> 
> Would it make sense to instead of setting xhci->needs_shared_hcd, we
> set a xhci->allow_single_roothub flag in the .reset override function?
> In the xhci-plat.c case this would be in xhci_plat_setup()
> 
> We would only add the flag if the respective probe supports one roothub.
> 
> Add a helper function to check if we if really should set up just one 
> hcd in probe, and should call xhci_run_finished() already the he first time
> xhci_run() is called (like you do in patch 3/5).
> 
> Something like:
> 
> bool xhci_has_one_roothub(struct xhci_hcd *xhci)
> {
> 	return xhci->allow_single_roothub && (!xhci->usb2_rhub.num_ports != !xhci->usb3_rhub.num_ports);
> }

Looks (very) good to me. I'll incorporate this and reorder the patches,
then I'll send a v2.

> 
> Thanks
> -Mathias
Heiner

