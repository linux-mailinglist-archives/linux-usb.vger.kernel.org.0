Return-Path: <linux-usb+bounces-1240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7607BCDE5
	for <lists+linux-usb@lfdr.de>; Sun,  8 Oct 2023 12:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C25AA281A7D
	for <lists+linux-usb@lfdr.de>; Sun,  8 Oct 2023 10:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CA88C17;
	Sun,  8 Oct 2023 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jygU5Qgn"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662CD8C1F
	for <linux-usb@vger.kernel.org>; Sun,  8 Oct 2023 10:54:45 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BFEAC;
	Sun,  8 Oct 2023 03:54:43 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9936b3d0286so646571666b.0;
        Sun, 08 Oct 2023 03:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696762482; x=1697367282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lyrbreD7MI9zq+OmTl7ayfAyL4KCwoOXdWIfPYkXGGk=;
        b=jygU5Qgn6BEY9giIMQl4tFd5keiCOINWjJ0GA391bw/oOcvDd8q+MlP5xCvzyLVe4J
         tMPHTVmql77mc6mm0OQHJ2lixtlDlK8+2dyUJF2lpfVTVF169Y7vmfViVP0GlQyVW/Px
         tIRiyatCsW9QNDFk6lgLK/ge3po6h0u++UBbsQMbEcz7Ye0XYHRPFYfOACOy14vhnKoA
         nm1Ice/wBEfIeIddPCucjNDoU6/2o5myOo1U5U7h6Zcfrei6uJ+h2b1r/ThVgEvelo6C
         rF2t7SnH0Fj3OCqx4fuEzW3eBlIOLUK6rZnrtE4+BAevRaJhE31GJ6RVfu2nBQOTOHnV
         qOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696762482; x=1697367282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyrbreD7MI9zq+OmTl7ayfAyL4KCwoOXdWIfPYkXGGk=;
        b=wezVKTb0W6awl9YKNDm2zUh+9wPAHwOi6AEARTr/iHNVhIasvg4IBfLIU3HRPns1oA
         QbS9TOMzHpojVIrDlLz8SvrURTAf716aeR+QE5QZ/zzOPcNjlbRihDjUQdyMQoj9Z6qR
         F2gtKCJgLED2SSbPpLyYRFzoebb9oVacI1IYZclyyxqYlCyCrsee+qTqDdENA8kcokSN
         cyRQY2/1/lkuXDKiLwoAAINwSzLH0/AYnd7AwyhFIU9BQH63ne5TFJ/OJqdupt6EhK+u
         v2xX9VOir4x15RhR84mBlglVzIJ0aPn1PoGq7spkVgPnjjmw9R7n1jbn8mhXlT1e39gt
         qqUA==
X-Gm-Message-State: AOJu0YzDhjkBDqq9bPxJQADkPc+AMQ9/MO9IXE1syMXXRudVDe3eyTD5
	qMzazb36nZhgD/WCNYLnyd0=
X-Google-Smtp-Source: AGHT+IE8e+d6uW6XCSm3QLrJsXDAsHS4hTTJcsGCyUhHFSXC8ro2u/ZnNwb4ppqdkScCLWbU7vKa6A==
X-Received: by 2002:a17:906:5a6b:b0:9ad:a660:95b2 with SMTP id my43-20020a1709065a6b00b009ada66095b2mr11179661ejc.11.1696762481508;
        Sun, 08 Oct 2023 03:54:41 -0700 (PDT)
Received: from [192.168.8.101] (78-80-112-174.customers.tmcz.cz. [78.80.112.174])
        by smtp.gmail.com with ESMTPSA id o23-20020a17090611d700b009887f4e0291sm5398361eja.27.2023.10.08.03.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Oct 2023 03:54:41 -0700 (PDT)
Message-ID: <d958a609-e3b5-4ff8-a32f-98419d1ea8f2@gmail.com>
Date: Sun, 8 Oct 2023 12:54:40 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/6] usb-storage,uas: Disable security commands (OPAL)
 for RT9210 chip family
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org, oneukum@suse.com,
 jonathan.derrick@linux.dev
References: <20231006125445.122380-1-gmazyland@gmail.com>
 <20231006125445.122380-7-gmazyland@gmail.com>
 <e9aad1d3-1aa1-4f09-955f-6d9f6f604600@rowland.harvard.edu>
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 xsFNBE94p38BEADZRET8y1gVxlfDk44/XwBbFjC7eM6EanyCuivUPMmPwYDo9qRey0JdOGhW
 hAZeutGGxsKliozmeTL25Z6wWICu2oeY+ZfbgJQYHFeQ01NVwoYy57hhytZw/6IMLFRcIaWS
 Hd7oNdneQg6mVJcGdA/BOX68uo3RKSHj6Q8GoQ54F/NpCotzVcP1ORpVJ5ptyG0x6OZm5Esn
 61pKE979wcHsz7EzcDYl+3MS63gZm+O3D1u80bUMmBUlxyEiC5jo5ksTFheA8m/5CAPQtxzY
 vgezYlLLS3nkxaq2ERK5DhvMv0NktXSutfWQsOI5WLjG7UWStwAnO2W+CVZLcnZV0K6OKDaF
 bCj4ovg5HV0FyQZknN2O5QbxesNlNWkMOJAnnX6c/zowO7jq8GCpa3oJl3xxmwFbCZtH4z3f
 EVw0wAFc2JlnufR4dhaax9fhNoUJ4OSVTi9zqstxhEyywkazakEvAYwOlC5+1FKoc9UIvApA
 GvgcTJGTOp7MuHptHGwWvGZEaJqcsqoy7rsYPxtDQ7bJuJJblzGIUxWAl8qsUsF8M4ISxBkf
 fcUYiR0wh1luUhXFo2rRTKT+Ic/nJDE66Ee4Ecn9+BPlNODhlEG1vk62rhiYSnyzy5MAUhUl
 stDxuEjYK+NGd2aYH0VANZalqlUZFTEdOdA6NYROxkYZVsVtXQARAQABzSBNaWxhbiBCcm96
 IDxnbWF6eWxhbmRAZ21haWwuY29tPsLBlQQTAQgAPwIbAwYLCQgHAwIGFQgCCQoLBBYCAwEC
 HgECF4AWIQQqKRgkP95GZI0GhvnZsFd72T6Y/AUCYaUUZgUJJPhv5wAKCRDZsFd72T6Y/D5N
 D/438pkYd5NyycQ2Gu8YAjF57Od2GfeiftCDBOMXzh1XxIx7gLosLHvzCZ0SaRYPVF/Nr/X9
 sreJVrMkwd1ILNdCQB1rLBhhKzwYFztmOYvdCG9LRrBVJPgtaYqO/0493CzXwQ7FfkEc4OVB
 uhBs4YwFu+kmhh0NngcP4jaaaIziHw/rQ9vLiAi28p1WeVTzOjtBt8QisTidS2VkZ+/iAgqB
 9zz2UPkE1UXBAPU4iEsGCVXGWRz99IULsTNjP4K3p8ZpdZ6ovy7X6EN3lYhbpmXYLzZ3RXst
 PEojSvqpkSQsjUksR5VBE0GnaY4B8ZlM3Ng2o7vcxbToQOsOkbVGn+59rpBKgiRadRFuT+2D
 x80VrwWBccaph+VOfll9/4FVv+SBQ1wSPOUHl11TWVpdMFKtQgA5/HHldVqrcEssWJb9/tew
 9pqxTDn6RHV/pfzKCspiiLVkI66BF802cpyboLBBSvcDuLHbOBHrpC+IXCZ7mgkCrgMlZMql
 wFWBjAu8Zlc5tQJPgE9eeQAQrfZRcLgux88PtxhVihA1OsMNoqYapgMzMTubLUMYCCsjrHZe
 nzw5uTcjig0RHz9ilMJlvVbhwVVLmmmf4p/R37QYaqm1RycLpvkUZUzSz2NCyTcZp9nM6ooR
 GhpDQWmUdH1Jz9T6E9//KIhI6xt4//P15ZfiIs7BTQRPeKd/ARAA3oR1fJ/D3GvnoInVqydD
 U9LGnMQaVSwQe+fjBy5/ILwo3pUZSVHdaKeVoa84gLO9g6JLToTo+ooMSBtsCkGHb//oiGTU
 7KdLTLiFh6kmL6my11eiK53o1BI1CVwWMJ8jxbMBPet6exUubBzceBFbmqq3lVz4RZ2D1zKV
 njxB0/KjdbI53anIv7Ko1k+MwaKMTzO/O6vBmI71oGQkKO6WpcyzVjLIip9PEpDUYJRCrhKg
 hBeMPwe+AntP9Om4N/3AWF6icarGImnFvTYswR2Q+C6AoiAbqI4WmXOuzJLKiImwZrSYnSfQ
 7qtdDGXWYr/N1+C+bgI8O6NuAg2cjFHE96xwJVhyaMzyROUZgm4qngaBvBvCQIhKzit61oBe
 I/drZ/d5JolzlKdZZrcmofmiCQRa+57OM3Fbl8ykFazN1ASyCex2UrftX5oHmhaeeRlGVaTV
 iEbAvU4PP4RnNKwaWQivsFhqQrfFFhvFV9CRSvsR6qu5eiFI6c8CjB49gBcKKAJ9a8gkyWs8
 sg4PYY7L15XdRn8kOf/tg98UCM1vSBV2moEJA0f98/Z48LQXNb7dgvVRtH6owARspsV6nJyD
 vktsLTyMW5BW9q4NC1rgQC8GQXjrQ+iyQLNwy5ESe2MzGKkHogxKg4Pvi1wZh9Snr+RyB0Rq
 rIrzbXhyi47+7wcAEQEAAcLBfAQYAQgAJgIbDBYhBCopGCQ/3kZkjQaG+dmwV3vZPpj8BQJh
 pRSXBQkk+HAYAAoJENmwV3vZPpj8BPMP/iZV+XROOhs/MsKd7ngQeFgETkmt8YVhb2Rg3Vgp
 AQe9cn6aw9jk3CnB0ecNBdoyyt33t3vGNau6iCwlRfaTdXg9qtIyctuCQSewY2YMk5AS8Mmb
 XoGvjH1Z/irrVsoSz+N7HFPKIlAy8D/aRwS1CHm9saPQiGoeR/zThciVYncRG/U9J6sV8XH9
 OEPnQQR4w/V1bYI9Sk+suGcSFN7pMRMsSslOma429A3bEbZ7Ikt9WTJnUY9XfL5ZqQnjLeRl
 8243OTfuHSth26upjZIQ2esccZMYpQg0/MOlHvuFuFu6MFL/gZDNzH8jAcBrNd/6ABKsecYT
 nBInKH2TONc0kC65oAhrSSBNLudTuPHce/YBCsUCAEMwgJTybdpMQh9NkS68WxQtXxU6neoQ
 U7kEJGGFsc7/yXiQXuVvJUkK/Xs04X6j0l1f/6KLoNQ9ep/2In596B0BcvvaKv7gdDt1Trgg
 vlB+GpT+iFRLvhCBe5kAERREfRfmWJq1bHod/ulrp/VLGAaZlOBTgsCzufWF5SOLbZkmV2b5
 xy2F/AU3oQUZncCvFMTWpBC+gO/o3kZCyyGCaQdQe4jS/FUJqR1suVwNMzcOJOP/LMQwujE/
 Ch7XLM35VICo9qqhih4OvLHUAWzC5dNSipL+rSGHvWBdfXDhbezJIl6sp7/1rJfS8qPs
In-Reply-To: <e9aad1d3-1aa1-4f09-955f-6d9f6f604600@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


On 10/6/23 20:57, Alan Stern wrote:
> On Fri, Oct 06, 2023 at 02:54:45PM +0200, Milan Broz wrote:
>> Realtek 9210 family (NVME to USB bridge) adapters always set
>> the write-protected bit for the whole drive if an OPAL locking range
>> is defined (even if the OPAL locking range just covers part of the disk).

...   
>> +/*
>> + * Realtek 9210 family set global write-protection flag
>> + * for any OPAL locking range making device unusable
>> + * Reported-by: Milan Broz <gmazyland@gmail.com>
>> + */
>> +UNUSUAL_DEV( 0x0bda, 0x9210, 0x0000, 0xffff,
>> +		"Realtek",
>> +		"",
> 
> Doesn't Realtek have some sort of product name you can put here?

These adapters comes under many names, the only common thing is that
it uses Realtek controller... "USB to NVMe/SATA bridge" could work though, I guess.

...
>> +
>> +/*
>> + * Realtek 9210 family set global write-protection flag
>> + * for any OPAL locking range making device unusable
>> + * Reported-by: Milan Broz <gmazyland@gmail.com>
>> + */
>> +UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0xffff,
>> +		"Realtek",
>> +		"",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_IGNORE_OPAL),
> 
> This entry is not in the right position.  The file is supposed to be
> sorted by vendor ID, then product ID.

Yes, despite I checked it at least three times and I did not spot it :-)))

Thanks,
Milan


