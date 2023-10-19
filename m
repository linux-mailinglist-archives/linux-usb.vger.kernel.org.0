Return-Path: <linux-usb+bounces-1945-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F15797D0502
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 00:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA9D01C20E1A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 22:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729B64293A;
	Thu, 19 Oct 2023 22:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dNZe3XQF"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064A319440
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 22:51:14 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04472124
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 15:51:13 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-27cfb8bc7eeso216379a91.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 15:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697755873; x=1698360673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihkcuYmfd50RHhUp4opHjKQo7OmeZNdxYQo4TxnQd6o=;
        b=dNZe3XQFJ5fXYKmjOAMq46nxN4Cm0UVMUQMNnSqBSPyln/qIY7kzUS5LRz56NGHsDB
         YvIaZ/xJvRGIHP7kE8yG/5/2CaRf0PXzZnR+bU8UByhNdW7LgYiqvMhHWGb5O8lDBRIH
         /1k7gBknwXDi0CCVcWhmCSNQku/mvIzoNLC0r/odV63SFIkc5jTVRdfrrnu84+cagJWN
         UkBHgqChODimIUjUuh05v6F35Uef0GseS+Mm3jWL5NF5kAqRkYmcFxj1dmX3qelhHdE6
         yV5C1tbhITYjs9h9zsJ9D78Xc7KK5JdCM4zTQDP+jESnkDNYo+cv5ScjHa1TSiEBoi31
         JuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697755873; x=1698360673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihkcuYmfd50RHhUp4opHjKQo7OmeZNdxYQo4TxnQd6o=;
        b=NFAH/qwK1UeF8fKwXFxtnQQAkhU6cnscwv00iWnVP7B4IVMRUw+n5RY5lpfZOgpEo3
         +q1x01kThbZ0IcSQUCuGs6TjRDHAoHoth1elE9NFXdvt0in3MrtrivPDfQDRXWaVrlBa
         9/lR8yAQ7QIdl6yXn0bbW7vGTkCP6eKMfIXXdcGWjL8wQR27rCEIi5w26D6eiE3ecYey
         LfvzIQgb7G0AY+JgflWtTYvhA3fsZ2M71GVmk3kSjYgJWt9vj5gvKJhKrSp1tpu65q6h
         YDWzVQpr43mTrogUraFl/Z52aLm+yldFHodhI7mP+0NEKGFWOyPjHLkBADn3tTckZ/fT
         nPww==
X-Gm-Message-State: AOJu0YyGWrNt1shYLHsDW6h6vWt9pzj1KOubIn+SxY5pdqrKKcnOJNej
	2rVpNNOjLVN1WO2aYBJvlI6ntw==
X-Google-Smtp-Source: AGHT+IHMzEh5u3P2UH71gJZjbl5EjLCvy4NQbgFNlkNet7qgX/aVm3MwGAvJ9FfTDF5IdlF5tbBdHQ==
X-Received: by 2002:a17:90a:194e:b0:27d:2638:ed06 with SMTP id 14-20020a17090a194e00b0027d2638ed06mr292028pjh.18.1697755873092;
        Thu, 19 Oct 2023 15:51:13 -0700 (PDT)
Received: from ?IPV6:2601:645:8100:1350:e143:75f5:fe6d:948c? ([2601:645:8100:1350:e143:75f5:fe6d:948c])
        by smtp.gmail.com with ESMTPSA id pd11-20020a17090b1dcb00b0027cf7818fb6sm2098397pjb.37.2023.10.19.15.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 15:51:12 -0700 (PDT)
Message-ID: <00c6e1cc-88f3-4dca-a8cd-aee2b9834748@google.com>
Date: Thu, 19 Oct 2023 15:51:11 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: uvc gadget: Adding super-speed plus descriptors
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Greg KH <gregkh@linuxfoundation.org>, corbet@lwn.net,
 dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "etalvala@google.com" <etalvala@google.com>,
 "arakesh@google.com" <arakesh@google.com>
References: <9fec0dd7-f111-4e71-95f2-a06488eec066@google.com>
 <169770425169.3350128.5374821695302559264@ping.linuxembedded.co.uk>
Content-Language: en-US
From: Jayant Chowdhary <jchowdhary@google.com>
In-Reply-To: <169770425169.3350128.5374821695302559264@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kieran,

On 10/19/23 01:30, Kieran Bingham wrote:
> Hi Jayant,
>
> Quoting Jayant Chowdhary (2023-10-19 00:35:47)
>> Hello everyone,
>> Currently the uvc gadget driver doesn't set descriptors for super speed plus
>> configurations in uvc_function_bind(). I see that there was a patch uploaded
>> a while back, at
>> https://lore.kernel.org/all/20221103060041.25866-1-jleng@ambarella.com/ which
>> was addressing this issue.
>>
>> I tested this out on an Android device and it
>> works - in our case we were seeing that the number of configurations advertised
>> by the device was 0 when a super-speed connection was used. Would we able to
>> merge this  patch ? Or would you like me to pick it uploaded and post it again ?
> As you'll see in https://lore.kernel.org/all/Y2PCj3c4z73s2Hxe@kroah.com/
> The specific e-mail containing the patch has been deleted and will not
> be merged due to the following trailers in the email:
>
>> This email and attachments contain Ambarella Proprietary and/or
>> Confidential Information and is intended solely for the use of the
>> individual(s) to whom it is addressed. Any unauthorized review, use,
>> disclosure, distribute, copy, or print is prohibited. If you are not
>> an intended recipient, please contact the sender by reply email and
>> destroy all copies of the original message. Thank you.
> It will need to be resent (without such trailing message) and confirming that it
> is legal and acceptable for the author to submit this, and for the
> Linux Kernel to accept it.

Thanks. I sent out a patch at
https://lore.kernel.org/linux-usb/4ca94f99-fe07-49c2-adc7-84df519792f5@google.com/T/#u.

Jayant


