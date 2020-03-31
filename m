Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5CB619A287
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 01:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731364AbgCaXes (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 19:34:48 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:52255 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731259AbgCaXer (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 19:34:47 -0400
X-Originating-IP: 81.6.44.130
Received: from [172.22.0.76] (unknown [81.6.44.130])
        (Authenticated sender: hansmi@hansmi.ch)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D3C7CE0004;
        Tue, 31 Mar 2020 23:34:44 +0000 (UTC)
From:   Michael Hanselmann <public@hansmi.ch>
Subject: Re: [PATCH 1/4] ch341: Name more registers
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
References: <cover.1583520568.git.public@hansmi.ch>
 <7a9882c0c5deaa64dcd3199a2d892e9809e6cb8e.1583520568.git.public@hansmi.ch>
 <20200324102003.GE5810@localhost>
X-Hello-World:  This header intentionally left blank
Message-ID: <4c17f6d6-3fae-ff00-1aeb-8745522596ae@msgid.hansmi.ch>
Date:   Wed, 1 Apr 2020 01:34:43 +0200
MIME-Version: 1.0
In-Reply-To: <20200324102003.GE5810@localhost>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.03.20 11:20, Johan Hovold wrote:
> On Fri, Mar 06, 2020 at 07:00:42PM +0000, Michael Hanselmann wrote:
>> Add more #defines with register names.
> 
> Please be more specific (e.g. which registers are you naming). Update
> the patch summary too.

Done. Will be in the next revision.

>> -	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x2518, lcr);
>> +	reg = ((uint16_t)0x2500) | CH341_REG_LCR;
> 
> Ditto, and please add a bit shift for consistency.
> 
> Hmm, but this is unrelated to the defines you are adding, and there are
> other magic constants for registers in this driver. Perhaps drop this
> bit or break it out in its own patch (rule of thumb: one logical change
> per patch).

I figured out what the 0x25 register is, or maybe was, and updated the
patch with a description and moved it later in the series, just before
the simulated break condition.

Michael
