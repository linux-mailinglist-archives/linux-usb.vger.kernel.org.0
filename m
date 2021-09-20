Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1618411111
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 10:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235920AbhITIiD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 04:38:03 -0400
Received: from informare.org ([217.11.52.70]:40668 "EHLO informare.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233842AbhITIiA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 04:38:00 -0400
Received: (qmail 9312 invoked from network); 20 Sep 2021 08:36:30 -0000
Received: from unknown (HELO ?192.168.2.105?) (faber@faberman.de@87.133.230.47)
  by 0 with ESMTPA; 20 Sep 2021 08:36:30 -0000
Subject: Re: [PATCH] usb: gadget: u_serial: Fix possible null pointer
 dereference
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <863b03b7-d00a-0af1-c21e-e2f7930bb0b3@faberman.de>
 <YUgU10Q/HrHJtASV@kroah.com>
From:   Florian Faber <faber@faberman.de>
Message-ID: <49fe5132-7d3f-7644-9d5d-1093289c1c01@faberman.de>
Date:   Mon, 20 Sep 2021 10:36:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUgU10Q/HrHJtASV@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg,

On 9/20/21 6:57 AM, Greg KH wrote:
> On Sun, Sep 19, 2021 at 09:57:28PM +0200, Florian Faber wrote:
>> In gs_rx_push, tty can be null. tty_throttled accesses tty->flags without further testing, which would lead to a null pointer dereference.
> 
> Please wrap your changelog text to 72 columns.
> 
>>
>> Signed-off-by: Florian Faber <faber@faberman.de>
>> ---
>>   drivers/usb/gadget/function/u_serial.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
>> index 6f68cbeeee7c..00512e7c7261 100644
>> --- a/drivers/usb/gadget/function/u_serial.c
>> +++ b/drivers/usb/gadget/function/u_serial.c
>> @@ -436,7 +436,7 @@ static void gs_rx_push(struct work_struct *work)
>>   	 * We may leave non-empty queue only when there is a tty, and
>>   	 * either it is throttled or there is no more room in flip buffer.
>>   	 */
>> -	if (!list_empty(queue) && !tty_throttled(tty))
>> +	if (tty && !list_empty(queue) && !tty_throttled(tty))
> 
> Have you ever been able to trigger this with a NULL tty?

No, not practical. I've just stumbled across it.

70 lines above it is checked in the same way:

--------------------------snip------------------------------
		/* leave data queued if tty was rx throttled */
		if (tty && tty_throttled(tty))
--------------------------snip------------------------------

..and 50 lines above:

--------------------------snip------------------------------
		/* push data to (open) tty */
		if (req->actual && tty) {
--------------------------snip------------------------------

The check makes sense since tty CAN be null (depending on the local connection)
and it doesn't change its value after the first assignment.


Flo
-- 
Machines can do the work, so people have time to think.
