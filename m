Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6BF105754
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 17:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfKUQob convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 21 Nov 2019 11:44:31 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:56518 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfKUQob (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 11:44:31 -0500
Received: from mail-pj1-f69.google.com ([209.85.216.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iXpZE-0001rV-P5
        for linux-usb@vger.kernel.org; Thu, 21 Nov 2019 16:44:28 +0000
Received: by mail-pj1-f69.google.com with SMTP id m12so1520339pjs.0
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2019 08:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=bmOUa6bxJNjYtsaqGyRQf1Bm9pGNcWwwNNi/5fG7mys=;
        b=boTvDUoANFvMbwtlYQe2kz7w6JwNRq8goVAsHtC2fx6Cbe+Zp/oae4v1VGP44L3cqy
         4xgE4qWPRiSUicYJULRuEuv9nNr4zJ67CFyf16dy+oAyrbkQZXFwrrnOFWz14tuQAQzJ
         /LejrNdkCmiF6aDZI2+G+nPfEj52H7n8QOlSzqsx07fv5yykZbWc6/SYxv8H8Yt8FVeX
         THBtlamh9vXyZ4YtxBt3+wi92Im4LSZlZssjCTajdAs3IZTKznV8vEafYdu45B51uj/n
         +bDqc53efBtRYuluT+nymhm0RAxDGlukRhpYC4QzZcAJEF31XPisDFqCP82btza8oJIz
         pQeg==
X-Gm-Message-State: APjAAAVahSK5rzfib4446z2CBnNlOq7BtPNKPQ0zgd4oiAmCDG0bNwcO
        437uERBv3+42kv3PX7aNsoqTWrMw6G51/4SeZqpQKJrENaWY1XEQYsoMO8l+iXUb2EWXTT9ROJV
        NLVoP+y5YKVoB8gX0gjjgxLs5/F4+OrkqWnP0Sg==
X-Received: by 2002:a17:90a:bc41:: with SMTP id t1mr12931053pjv.89.1574354667402;
        Thu, 21 Nov 2019 08:44:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqx181Maa+Wv7zET5lBm47Qriz2o6kgsU4Ny/hbGjZXNEyUbwrC+hl+LHpyR2HNHLNHgTEoV8A==
X-Received: by 2002:a17:90a:bc41:: with SMTP id t1mr12931023pjv.89.1574354667082;
        Thu, 21 Nov 2019 08:44:27 -0800 (PST)
Received: from 2001-b011-380f-3c42-fdb3-9820-72e8-2639.dynamic-ip6.hinet.net (2001-b011-380f-3c42-fdb3-9820-72e8-2639.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:fdb3:9820:72e8:2639])
        by smtp.gmail.com with ESMTPSA id r13sm4255538pfg.3.2019.11.21.08.44.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Nov 2019 08:44:26 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD ep_index
 2 comp_code 13
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20191121114737.GA427660@kroah.com>
Date:   Fri, 22 Nov 2019 00:44:25 +0800
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <E755D2C5-CABD-4644-A91D-9FDD50B879CA@canonical.com>
References: <F9C894A9-D1D8-455E-B5F6-C5EA08A80C79@canonical.com>
 <20191121114737.GA427660@kroah.com>
To:     Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Nov 21, 2019, at 19:47, Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> On Thu, Nov 21, 2019 at 03:38:04PM +0800, Kai-Heng Feng wrote:
>> Hi,
>> 
>> Currently there are two quirks for Dell TB16 to workaround an issue:
>> "xhci: Bad Ethernet performance plugged in ASM1042A host", and
>> "r8152: disable RX aggregation on Dell TB16 dock".
>> 
>> However, the issue wasn't analyzed and root caused. I'd like to understand what's really going on here.
>> Reverting those two patches, and as soon as doing TX/RX over the ethernet on TB16, xhci_hcd errors out:
>> 
>> [   69.803804] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.803807] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1010 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   69.803900] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.803901] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1020 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   69.803998] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.803999] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1030 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   69.804096] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.804099] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1040 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   69.955830] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.955847] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1050 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   69.956704] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.956718] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1060 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   69.963802] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.963819] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1070 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   70.112302] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   70.112321] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1080 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> 
>> So, under what circumstances the DMA pointer can be out of the TD?
> 
> What kernel version are you running that causes these errors?

All kernel versions without these two quirks.
Currently I use Mathias' xhci tree.

Kai-Heng

> thanks,
> 
> greg k-h

