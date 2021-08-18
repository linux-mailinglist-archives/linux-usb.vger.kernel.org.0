Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB863EF9DB
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 07:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbhHRFNF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 01:13:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:57860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229953AbhHRFNF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Aug 2021 01:13:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C6AA606A5;
        Wed, 18 Aug 2021 05:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629263550;
        bh=Fbtjf5Y9NR+608E0LbQK3SqNrW2UAwrg8/17m01Bckg=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=cn7QS419cbKzsvlf2IhD/nTGfxJ0obMbdkaqlA0+nbbQ0HDCfyG62ew6xx9U9UU1a
         Qt2DSGAsAxfAvci+KcsOvtweohKWKpd57fs4qPAvn6OpwS20ofCyBpH2SVG66bIm6V
         vI6a7/YG26yFfYjxCVVPu7Jg3wC39OzGYKIywQ4kCfEOzGaBONZ9a2QAwR3dwDHadn
         RNDsBigU3ChA2O50UgcJVplc1Jw9Kc1T9TKtcmWIPRYqLPLoVhVJmM+43O0hNvFcJs
         IEpz9UHBNfxnhMN5pJBrRMkuJgmmKA61ZOfSwTA47u1/Oe2APC5mRlvLFGmlndUc6m
         zcMlknSpMKfLg==
References: <20210812082635.12924-1-jackp@codeaurora.org>
User-agent: mu4e 1.6.3; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
Date:   Wed, 18 Aug 2021 08:08:29 +0300
In-reply-to: <20210812082635.12924-1-jackp@codeaurora.org>
Message-ID: <87y28zfi9w.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Jack Pham <jackp@codeaurora.org> writes:

> On DWC_usb3 revisions 3.00a and newer (including DWC_usb31 and
> DWC_usb32) the GUCTL1 register gained the DEV_DECOUPLE_L1L2_EVT
> field (bit 31) which when enabled allows the controller in device
> mode to treat USB 2.0 L1 LPM & L2 events separately.
>
> After commit d1d90dd27254 ("usb: dwc3: gadget: Enable suspend
> events") the controller will now receive events (and therefore
> interrupts) for every state change when entering/exiting either
> L1 or L2 states.  Since L1 is handled entirely by the hardware
> and requires no software intervention, there is no need to even
> enable these events and unnecessarily notify the gadget driver.
> Enable the aforementioned bit to help reduce the overall interrupt
> count for these L1 events that don't need to be handled while
> retaining the events for full L2 suspend/wakeup.
>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>

Looks okay to me:

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
