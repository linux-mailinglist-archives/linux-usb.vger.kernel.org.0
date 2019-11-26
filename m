Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A60109B74
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2019 10:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbfKZJpA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 26 Nov 2019 04:45:00 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:53072 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727397AbfKZJpA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Nov 2019 04:45:00 -0500
Received: from mail-pj1-f69.google.com ([209.85.216.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iZXOz-0001RH-So
        for linux-usb@vger.kernel.org; Tue, 26 Nov 2019 09:44:58 +0000
Received: by mail-pj1-f69.google.com with SMTP id z24so8948229pjt.19
        for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2019 01:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=txNz5XmG+t49jDzb4UVnwKLKs/FGFiCCYlHYMRSwy2M=;
        b=hHCLmGIuFN335NrlQCgtjPTtzlrG8fP1VKfTg3o+NvorS18wOWAcRStYuSrrB4ZR0n
         xfuIp6UIDoAkjVK8ommts5ebc/ibFVZYrWWy93US2t7c9UipJUZ6K+zRrN/E/qRCcsh6
         4AVvZ4ROtn2Qhl6fyyW/cRpgs4sDXynGSuCVAv+wyrMvhhOq4gXj7z8SFLE5tUOxvTFT
         ZLTK6Y8+196u/1HcRFH0kkzvKQuCGN3/721IvJJd17xd+Lnwkq/lTh3TFDpXcJISclJv
         +qL27KSUKBM+J2IJXj0dJkRQoAFWi9cGNGX2AO3div/OzOU4T9RlIgvVfKlJuzewlt3J
         nkpw==
X-Gm-Message-State: APjAAAVhISIWODzdW+gDCq4ogPQHtVB/op2cxyQxE0TsOZqw+Mx627OE
        JFX2UD8G/GZjIA5v38O4uo2xkwUv+FFQBpVIjY3C6kQEoxevt7L/UYeTp3EWno0eFbGwowssjt6
        1GElMm8/igcZs/C0i3vxAL2n8I7BMitroVv1zyg==
X-Received: by 2002:a17:902:9a47:: with SMTP id x7mr34032641plv.84.1574761496390;
        Tue, 26 Nov 2019 01:44:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/3cUGXJrAcSxPRxGx/voWa6NSmHJ8t0x/7U8eetb9E/VZGtQyU8jdFaGepCjAEwALIuOsUg==
X-Received: by 2002:a17:902:9a47:: with SMTP id x7mr34032612plv.84.1574761495957;
        Tue, 26 Nov 2019 01:44:55 -0800 (PST)
Received: from 2001-b011-380f-3c42-a859-e4e7-bb9e-56a6.dynamic-ip6.hinet.net (2001-b011-380f-3c42-a859-e4e7-bb9e-56a6.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:a859:e4e7:bb9e:56a6])
        by smtp.gmail.com with ESMTPSA id i13sm11594971pfo.39.2019.11.26.01.44.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Nov 2019 01:44:55 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD ep_index
 2 comp_code 13
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <3449c957-ce20-baa3-ca97-63aff9ffa898@linux.intel.com>
Date:   Tue, 26 Nov 2019 17:44:53 +0800
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <72BADF0A-08FF-42FE-B957-F4098F8C34BD@canonical.com>
References: <F9C894A9-D1D8-455E-B5F6-C5EA08A80C79@canonical.com>
 <4552b779-4b5a-7e81-39ec-0a4229b5d84d@linux.intel.com>
 <871B8184-D636-4F02-B9E9-B13A8BE078E8@canonical.com>
 <23a9798e-704f-3444-42e2-e583a6991950@linux.intel.com>
 <F6AF08A8-8532-4A58-AE33-C1B02CBDC993@canonical.com>
 <3449c957-ce20-baa3-ca97-63aff9ffa898@linux.intel.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Nov 23, 2019, at 00:35, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
> 
> On 22.11.2019 17.10, Kai-Heng Feng wrote:
>>> On Nov 22, 2019, at 20:17, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
>> [snipped]
>>> 
>>> The event ring is already overwritten with new events when dumped.
>>> 
>>> Could you apply the code below, it will dump both the endpoint transfer ring
>>> and the event ring at the right moment:
>> The log is quite large so I pasted it here:
>> https://pastebin.ubuntu.com/p/wWpS8ctNrb/
>> Kai-Heng
> 
> Thanks, ring dumps shows xHC hardware never wrote an event to the event ring for the TRB at 0x487a0fe0.
> 
> Event ring:
> [   61.114263] xhci_hcd 0000:3f:00.0: 0x000000049803a5d0: TRB 0000000487a08fd0 status 'Short Packet' len 20416 slot 4 ep 3 type 'Transfer Event' flags e:c
>  we got a short packet event for TRB at 0x487a08fd0, which is one TRB before
> [   61.114269] xhci_hcd 0000:3f:00.0: 0x000000049803a5e0: TRB 0000000487a07a30 status 'Success' len 0 slot 4 ep 4 type 'Transfer Event' flags e:c
> [   61.114275] xhci_hcd 0000:3f:00.0: 0x000000049803a5f0: TRB 0000000487a07a40 status 'Success' len 0 slot 4 ep 4 type 'Transfer Event' flags e:c
> [   61.114281] xhci_hcd 0000:3f:00.0: 0x000000049803a600: TRB 0000000487a09000 status 'Short Packet' len 20416 slot 4 ep 3 type 'Transfer Event' flags e:c
>  we got a short packet event for TRB at 487a09000, which is one TRB after,
>  but no event for 0x487a0fe0
> 
> The TRB at 0x487a0fe0 in the endpoint ring looks fine:
> [   61.118683] xhci_hcd 0000:3f:00.0: 0x0000000487a08fc0: Buffer 000000046eef0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
> [   61.118689] xhci_hcd 0000:3f:00.0: 0x0000000487a08fd0: Buffer 000000048e740000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
> [   61.118696] xhci_hcd 0000:3f:00.0: 0x0000000487a08fe0: Buffer 000000046ebe8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
> [   61.118702] xhci_hcd 0000:3f:00.0: 0x0000000487a08ff0: LINK 0000000487a09000 intr 0 type 'Link' flags i:c:T:C
> 
> The TRB with missing event is similar to all the other Normal TRBs in the ring.
> It has both interrupt on completion, and interrupt on short packet bits set.
> Can't see any reason why an event wasn't generated.

Thanks for you analysis.
The driver for xHCI is a little bit overwhelming, so I didn't read the code through.

> 
> It seems it's always the TRB just before the LINK TRB that is missing an event.
> (address ends with 0xfe0).
> 
> Best guess is that this particular xHC (ASmedia) can't correctly generate events
> for the TRB right before Link  TRB

Is it possible to still use the TRB with missing event, based on this behavior?

Kai-Heng

> 
> -Mathias

