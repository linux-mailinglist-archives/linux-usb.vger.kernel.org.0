Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFF92873E7
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 10:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405871AbfHIIUS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 04:20:18 -0400
Received: from gate.crashing.org ([63.228.1.57]:40927 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbfHIIUS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 04:20:18 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x798K8xV014987;
        Fri, 9 Aug 2019 03:20:09 -0500
Message-ID: <146d724c5df6b6e9a98f9d1d69a85be23eed0311.camel@kernel.crashing.org>
Subject: Re: [PATCH] [RFC] usb: gadget: hid: Add "single_ep" option
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Date:   Fri, 09 Aug 2019 18:20:08 +1000
In-Reply-To: <87zhki69sa.fsf@gmail.com>
References: <5db94157b9b3b89b2874a4f91505e4b860903ac6.camel@kernel.crashing.org>
         <8736iagb11.fsf@gmail.com>
         <e326f0a27c04a5f23cee5ef36f38e3ddf11bbf5d.camel@kernel.crashing.org>
         <87zhki69sa.fsf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-08-09 at 11:08 +0300, Felipe Balbi wrote:
> 
> that works too. Another option would to introduce two options,
> has_input_report and has_output_report and have them true by default.
> 
> Then user can even produce an output-only HID device, like these odd
> USB-controlled relays.

Ideally we could just parse the descriptor :-) But that's a bit
trickier.

One thing I've been meaning to look at is a way to properly handle
keyboards (and other "on/off" buttons) by having the kernel latch the
state so it can properly respond to things like get report, or resend
all the "down" keys after a reset (so that things like "keep some key
pressed during boot for magic to happen") actually works...

But one thing at a time :-)

Cheers,
Ben.


