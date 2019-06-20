Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34EE64CE7A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 15:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731926AbfFTNR6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 09:17:58 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45292 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731805AbfFTNR6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 09:17:58 -0400
Received: by mail-lj1-f193.google.com with SMTP id m23so2631348lje.12
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2019 06:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0Frlb6YaDseB7/7gORjxL41gJs49ch82qUx00jMVv2s=;
        b=acWJ+g/rd59Agmj5SWNxWY6XqC9tCTXpUeMiDhhF37FNnGFhWefX/Zsfh6qwAkDJd2
         mK8f+e4sKp6wOveDJk9w89LhgZjhqAfBVh9nnbJbX7jBEuN+hwokiGdGAVtddFkpsEwa
         eoFGZKJPTFChB2n2m8VqS1y7KLkm6TaQP2ewpTHOBP0X1DxgoOcem4AVFMZ6vCcjAOpb
         uTVdcw7z401nNeHOs8BXvUp/imylDmFv7HFBYC5VucS2mNuMs/Sz6K1NXAR2JW96EeNv
         CScEcgxzU5RBeMORJBeUAVL5D1v/OF3hOJZttUuLHCg6e9ohvBkzzzeJtxtwAJ9rflNB
         9O3Q==
X-Gm-Message-State: APjAAAV2Uk8qcTYsWqXclVU3s6BIk+f/TIwWK49U0zk2BCN+jKIzjfEA
        20qqrqYJZeFmWolrdaTHKd3Vhk0C
X-Google-Smtp-Source: APXvYqyUhhjrjLWJouGyKtpIBL9yFaA/LlPhTw5RPQD5iWQwvOQXm0eUESKAR7XKCpcBs0mQWDnodg==
X-Received: by 2002:a2e:8945:: with SMTP id b5mr29143505ljk.93.1561036675813;
        Thu, 20 Jun 2019 06:17:55 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id z12sm3173718lfe.2.2019.06.20.06.17.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 06:17:54 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hdwwr-0007wS-4C; Thu, 20 Jun 2019 15:17:53 +0200
Date:   Thu, 20 Jun 2019 15:17:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jonathan Olds <jontio@i4free.co.nz>
Cc:     'Johan Hovold' <johan@kernel.org>,
        frank@kingswood-consulting.co.uk, werner@cornelius-consult.de,
        boris@hajduk.org, linux-usb@vger.kernel.org,
        'Jonti Olds' <joldsphone@gmail.com>
Subject: Re: linux/drivers/usb/serial/ch341.c calculates some baud rates wrong
Message-ID: <20190620131753.GK6241@localhost>
References: <000901d50e93$7cb31470$76193d50$@co.nz>
 <20190603072337.GB3668@localhost>
 <000001d51f34$bad6afd0$30840f70$@co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000001d51f34$bad6afd0$30840f70$@co.nz>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 10, 2019 at 02:32:16PM +1200, Jonathan Olds wrote:
> Hi Johan,
> 
> Thanks for the info. I followed
> https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first-patc
> h-to-the-linux-kernel-and-responding-to-feedback/ and made a proposal patch
> ("[PATCH] USB: serial: ch341: fix wrong baud rate setting calculation"
> https://lore.kernel.org/linux-usb/20190608051309.4689-1-jontio@i4free.co.nz/
> ).

Good job, looks like you got most things right from the start, but I'll
comment on the patch directly.

> I've measured the actual baud rates for a lot of given baud rates and I
> think I have deduced the formulas for calculating the "a" value. "a" is a
> uint16 and split up in two, a LSB and a MSB. The current driver only uses
> LSB from the set {0,1,2,3}. There is another valid LSB of 7 that the current
> driver doesn't use. The formula for LSB from the set {0,1,2,3} is...
> 
> Actual baud rate == 2^(3*LSB-10)*12000000/(256-MSB), if LSB is in {0,1,2,3}
> and 0<MSB<255
> 
> When LSB == 7 then things are a bit different. LSB==7 seems to switch off
> the clock divider that the LSB usually does but only if MSB<248; when
> MSB>=248 the clock divider is turned back on and LSB is effectively 3 again.
> So we can also use the following formula...
> 
> Actual baud rate == 12000000/(256-MSB), if LSB == 7 and 0<MSB<248
> 
> So the trick is to use these formulas to find a MSB and a LSB that produce
> and actual baud rate that are as close as possible to the desired baud rate.
> With errors greater than say 2 to 3% hardware will start to fail to
> communicate.
> 
> Looking at some common baud rates only the higher rates are affected by not
> using a LSB of 7. Of the typical rates only 256000 and 921600 are affected.
> However other unusual frequencies are affected too such as 1333333 and I
> think you could calculate a lot more unusual affected frequencies. That
> being the case I think calculating the MSB when LSB == 7 for a given wanted
> baud rate might be a better solution than special cases for each affected
> baud rate.

Agreed.

> I've tested the patch with my hardware and it seems to work fine with every
> setting I could throw at it. I am aware that I've only tried it on my
> hardware with a CH340G chip. So trying with different chips and computers
> would be a good idea (I've tested it on the CH340G chip with two computers).
> 
> My measurements/workings as a libre/open office calc file can be downloaded
> from https://jontio.github.io/linux_kernel_work/ch43x_tests.ods .
> 
> I measured the following with the current driver (without my patch) using my
> scope...
> 
> Baud wanted	Baud measured	Error as % of wanted
> 50	50	0.0%
> 75	75.2	0.3%
> 110	109.5	0.5%
> 135	134.6	0.3%
> 150	150.4	0.3%
> 300	300.8	0.3%
> 600	601.3	0.2%
> 1200	1201.9	0.2%
> 1800	1801.8	0.1%
> 2400	2403.8	0.2%
> 4800	4807.7	0.2%
> 7200	7215	0.2%
> 9600	9615.4	0.2%
> 14400	14430	0.2%
> 19200	19231	0.2%
> 38400	38462	0.2%
> 56000	56054	0.1%
> 57600	57837	0.4%
> 115200	115207	0.0%
> 128000	127551	0.4%
> 230400	230415	0.0%
> 256000	250000	2.3%
> 460800	460617	0.0%
> 921600	853242	7.4%
> 1000000	999001	0.1%
> 1333333	1204819	9.6%
> 1843200	1496334	18.8%
> 2000000	1984127	0.8%
> 5000000	2985075	40.3%
> 
> The patch will fix 256000, 1333333 and 921600 but not 1843200 and 5000000.

Nice job indeed, I think some of the above belongs in the commit as well.

I don't have time to dig into the details myself at the moment, but I'll
point out some minor issues with you patch meanwhile.  

Thanks,
Johan
