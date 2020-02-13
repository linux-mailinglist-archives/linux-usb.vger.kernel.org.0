Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFCAC15BF77
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 14:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729991AbgBMNfW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 08:35:22 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37143 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729674AbgBMNfW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Feb 2020 08:35:22 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so4289554lfc.4
        for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2020 05:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KWOsuSgQgOL7wag+7Zev3PUsMegHiG8hmXGzf91gx4A=;
        b=arqhuLqs/E6D16lkxGCHsGDvmVRl5t8HacQehp4Kn1EcoS1+CJNLzm7gsMOFzDWvC7
         DpALBVmLi5L7NS2eVOYRucGEcO0Rv8HQ9CtREqiBBnkxbm3dRVgAUuu0jYsQLH9bK29z
         5e6GPawBTyLK9rlvKBYi1tdT/GYjimkxb2B8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KWOsuSgQgOL7wag+7Zev3PUsMegHiG8hmXGzf91gx4A=;
        b=NFdZCSNXc8BGX52rgy8reF8yYLsW6p5RgJZ3Na1FSvCJdUAla1W/QrYcIFVsnmzNKB
         6/Ffnew/+qCcILFLX72RoegWnwsLXSfvxvW90XANMuTTnZepaiuV1QYcdoTLO0uOhwZZ
         6J6uMUsU4GQyuDqI9jIlbyr9+GZfd/6ud4pCYgRfu7w+5mIOg6RPhFk1EJWGwAop8twM
         1xopzoUJClC+K+KK2GtKMbvZC38dcPVTiuLPqwdreL6AKEIF9L0alrCjrmiqtbK7ihEe
         MspsR2Ke0z1AaZ9ah/KFD7cDN5gKV0sfrrGAEh5V2sUnlPSwrDfz9TCJPQ0SG0DiVBij
         /dLA==
X-Gm-Message-State: APjAAAVQGRdRrVk+0GaGDGAXmRpZj2+/OkXQeuRe7z6lvi2+vB3EExqr
        6NccE+KyY29D5qbybtcEOJ69Pw==
X-Google-Smtp-Source: APXvYqx3PElfBtYEI2+40feXtT0FWrIIVGFXM/JYc5sICaZISeJZIwZA/ZWXq+Y6aqF/Qg31Jd0Evw==
X-Received: by 2002:ac2:5e2e:: with SMTP id o14mr9546346lfg.198.1581600920427;
        Thu, 13 Feb 2020 05:35:20 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id e25sm1420775ljp.97.2020.02.13.05.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 05:35:19 -0800 (PST)
Subject: Re: [PATCH] usb: host: fhci-hcd: annotate PIPE_CONTROL switch case
 with fallthrough
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Timur Tabi <timur@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Anton Vorontsov <avorontsov@ru.mvista.com>,
        kbuild test robot <lkp@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
References: <20200213085401.27862-1-linux@rasmusvillemoes.dk>
 <20200213125659.GB3325929@kroah.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <6ab68169-dde6-b5ba-0909-fa685bd24aac@rasmusvillemoes.dk>
Date:   Thu, 13 Feb 2020 14:35:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213125659.GB3325929@kroah.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/02/2020 13.56, Greg Kroah-Hartman wrote:

>> diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
>> index 04733876c9c6..a8e1048278d0 100644
>> --- a/drivers/usb/host/fhci-hcd.c
>> +++ b/drivers/usb/host/fhci-hcd.c
>> @@ -396,6 +396,7 @@ static int fhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
>>  	case PIPE_CONTROL:
>>  		/* 1 td fro setup,1 for ack */
>>  		size = 2;
>> +		fallthrough;
> 
> We have an attribute for that?
> 
> Shouldn't this be /* fall through */ instead?
> 
> Gustavo, what's the best practice here, I count only a few
> "fallthrough;" instances in the kernel, although one is in our coding
> style document, and thousands of the /* */ version.

Yes, I went with the attribute/macro due to that, and the history is
that Linus applied Joe's patches directly
(https://lore.kernel.org/lkml/CAHk-=whOF8heTGz5tfzYUBp_UQQzSWNJ_50M7-ECXkfFRDQWFA@mail.gmail.com/),
so I assumed that meant the Penguin decided that the attribute/macro is
the right thing to do for new code, while existing comment annotations
can be left alone or changed piecemeal as code gets refactored anyway.

Rasmus
