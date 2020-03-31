Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9620B19A28B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 01:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731531AbgCaXfW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 19:35:22 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:52723 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731438AbgCaXfV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 19:35:21 -0400
X-Originating-IP: 81.6.44.130
Received: from [172.22.0.76] (unknown [81.6.44.130])
        (Authenticated sender: hansmi@hansmi.ch)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4E6CF60007;
        Tue, 31 Mar 2020 23:35:18 +0000 (UTC)
From:   Michael Hanselmann <public@hansmi.ch>
Subject: Re: [PATCH 2/4] ch341: Detect HL340 variant
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
References: <cover.1583520568.git.public@hansmi.ch>
 <f89211ed90a3d3c99eea2850d3df29618e09e625.1583520568.git.public@hansmi.ch>
 <20200324103100.GF5810@localhost>
X-Hello-World:  This header intentionally left blank
Message-ID: <ae227be4-b730-a85d-dc28-3b6b31a8e72c@msgid.hansmi.ch>
Date:   Wed, 1 Apr 2020 01:35:16 +0200
MIME-Version: 1.0
In-Reply-To: <20200324103100.GF5810@localhost>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.03.20 11:31, Johan Hovold wrote:
> On Fri, Mar 06, 2020 at 07:00:43PM +0000, Michael Hanselmann wrote:
>> +static int ch341_detect_hl340(struct usb_device *dev)
> 
> Return bool? Rename ch341_is_xxx() ?

Changed the function to return the quirks flags, its name is now
"ch341_detect_quirks".

>> +	r = ch341_control_in(dev, CH341_REQ_READ_REG,
>> +			     CH341_REG_BREAK, 0, buffer, size);
> 
> This helper would already have logged an error message, which perhaps is
> ok, but you could consider using usb_control_msg() directly here.

Changed to use "usb_control_msg" directly.

>> +	if (r == -EPIPE) {
>> +		dev_dbg(&dev->dev, "%s - Chip is a HL340 variant\n",
>> +			__func__);
>> +		r = 1;
>> +		goto out;
>> +	}
>> +
>> +	if (r < 0) {
>> +		dev_err(&dev->dev, "%s - USB control read error (%d)\n",
>> +			__func__, r);
>> +		goto out;
>> +	}
> 
> So this is currently redundant.

Not anymore after the change above: EPIPE is encountered for the limited
chips, 0 for normal chips and other errors should be reported.

>> +
>> +out:	kfree(buffer);
> 
> Line break after the label, please.

Tried to keep the style consistent (see "ch341_port_probe" for example).
Done.

>> +	r = ch341_detect_hl340(port->serial->dev);
>> +	if (r < 0)
>> +		goto error;
> 
> You never store the return value (and the "flags" variable you add is
> unused) which indicates your series needs to be restructured.

That's different now with the renaming to "ch341_detect_quirks". The
actual return value is still 0 as of this patch. Quirks are added in
later patches.

> At least update flags in this patch. Perhaps consider renaming it
> "quirks" depending on how it ends up being used.

Done.


