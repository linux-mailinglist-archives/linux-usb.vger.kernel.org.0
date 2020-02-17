Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 710C0161444
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 15:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbgBQOM3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 09:12:29 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44075 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbgBQOM2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 09:12:28 -0500
Received: by mail-lf1-f66.google.com with SMTP id v201so11944046lfa.11
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 06:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tKSE4g/oUh8JP0cEiCIATWChO5NnMQwrTlN4DA9Lt8o=;
        b=B0FvGH8TX29jyPG7bOm5TLFH8q5LsdhONtC1UHcUJ8h7odxJU2GxRt9z21IYmJGNzF
         /0jTWJUiFD5TVE+48t4F6OEDVhf6OgYquJRARiAhjlzbvXHG85JG+khhY1MqMWUZNBR2
         nh9VETpmGseZX71qeGmAo32tc3CM0M50UVpSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tKSE4g/oUh8JP0cEiCIATWChO5NnMQwrTlN4DA9Lt8o=;
        b=IW0ymf4/MPpPE/QSaDi4vALjbDLB5HNpIOvNJW/RDpmUZR+VkQGbDTb0MYw3oSWU4P
         ekhR1VU+4LjZbCpTT6n0JQsJaQ1bzf5I/Q/Q9uVN6WNQz5dCYBq/h4vl9Tgu7FQYeHX7
         MNgvmhJMh1arWV7JUp3eid9+67BHfJckZh56Mdj6ugKvc/4qdkJbjT98fUmvcEFzlr3J
         +415/yAiR/EWy/lmVL4Z3GdeTSIGpxofsA/aYPe8UX1cA3UXSQvyQY0uFkSiCIiDp+Sc
         JObRWviXqxmgYthcD3bMktW6Q6foWOYJkC+XJlllqMiFn3vBiQuUGI8IooOhEH70sYG+
         VY2g==
X-Gm-Message-State: APjAAAVQlnbAh3VeZ7KyT5fpsuNuzstf++TYN2CV+jeWebkRFEKJpvfv
        MoEo1lRPncc2NWQQKlIq+VUDAg==
X-Google-Smtp-Source: APXvYqxsv6WJ34fOs69KpqyEJm/T+9cC2Q9QrUx6WEOh9oqc9KmUryRCC6197x7uuj70NfRbZNvgdg==
X-Received: by 2002:ac2:5922:: with SMTP id v2mr8089831lfi.106.1581948745665;
        Mon, 17 Feb 2020 06:12:25 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id f9sm479954ljp.62.2020.02.17.06.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2020 06:12:23 -0800 (PST)
Subject: Re: [PATCH] usb: host: fhci-hcd: annotate PIPE_CONTROL switch case
 with fallthrough
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Timur Tabi <timur@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Anton Vorontsov <avorontsov@ru.mvista.com>,
        kbuild test robot <lkp@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
References: <20200213085401.27862-1-linux@rasmusvillemoes.dk>
 <20200213125659.GB3325929@kroah.com>
 <6ab68169-dde6-b5ba-0909-fa685bd24aac@rasmusvillemoes.dk>
 <20200217093836.GA37937@kroah.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <a1f0f024-c1e5-8ff5-f717-f5098b4eb78d@rasmusvillemoes.dk>
Date:   Mon, 17 Feb 2020 15:12:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217093836.GA37937@kroah.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/02/2020 10.38, Greg Kroah-Hartman wrote:
> On Thu, Feb 13, 2020 at 02:35:18PM +0100, Rasmus Villemoes wrote:
>> On 13/02/2020 13.56, Greg Kroah-Hartman wrote:
>>
>>> Shouldn't this be /* fall through */ instead?
>>>
>>> Gustavo, what's the best practice here, I count only a few
>>> "fallthrough;" instances in the kernel, although one is in our coding
>>> style document, and thousands of the /* */ version.
>>
>> Yes, I went with the attribute/macro due to that, and the history is
>> that Linus applied Joe's patches directly
>> (https://lore.kernel.org/lkml/CAHk-=whOF8heTGz5tfzYUBp_UQQzSWNJ_50M7-ECXkfFRDQWFA@mail.gmail.com/),
>> so I assumed that meant the Penguin decided that the attribute/macro is
>> the right thing to do for new code, while existing comment annotations
>> can be left alone or changed piecemeal as code gets refactored anyway.
> 
> But, to be fair, Gustavo went and fixed up thousands of these, with the
> /* */ version, not the attribute.
> 
> Gustavo, can coverity notice the "fallthrough;" attribute properly?  I
> don't want to start adding things that end up triggering
> false-positives.

I'm not Gustavo, and I don't know the answer, but 1.5 years ago some guy
named greg k-h suggested that coverity does grok the fallthrough attribute:

https://patchwork.kernel.org/cover/10651357/#22279095

Rasmus
