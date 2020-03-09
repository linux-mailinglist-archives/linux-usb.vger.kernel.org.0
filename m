Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D6017E29E
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 15:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgCIOlD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 9 Mar 2020 10:41:03 -0400
Received: from unicorn.mansr.com ([81.2.72.234]:54000 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726520AbgCIOlD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Mar 2020 10:41:03 -0400
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id 727D415F11; Mon,  9 Mar 2020 14:41:01 +0000 (GMT)
From:   =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: musb: fix crash with highmen PIO and usbmon
References: <20200307130720.16652-1-mans@mansr.com>
        <20200309140106.GA31115@iaqt7>
Date:   Mon, 09 Mar 2020 14:41:01 +0000
In-Reply-To: <20200309140106.GA31115@iaqt7> (Bin Liu's message of "Mon, 9 Mar
        2020 09:01:06 -0500")
Message-ID: <yw1xpndlioaq.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Bin Liu <b-liu@ti.com> writes:

> Hi Mans,
>
> On Sat, Mar 07, 2020 at 01:07:20PM +0000, Mans Rullgard wrote:
>> When handling a PIO bulk transfer with highmem buffer, a temporary
>> mapping is assigned to urb->transfer_buffer.  After the transfer is
>> complete, an invalid address is left behind in this pointer.  This is
>> not ordinarily a problem since nothing touches that buffer before the
>> urb is released.  However, when usbmon is active, usbmon_urb_complete()
>> calls (indirectly) mon_bin_get_data() which does access the transfer
>> buffer if it is set.  To prevent an invalid memory access here, reset
>> urb->tranfer_buffer to NULL when finished.
>> 
>> Fixes: 8e8a55165469 ("usb: musb: host: Handle highmem in PIO mode")
>> Signed-off-by: Mans Rullgard <mans@mansr.com>
>
> Thanks for fixing the bug.
>
>> ---
>>  drivers/usb/musb/musb_host.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
>> index 1c813c37462a..b67b40de1947 100644
>> --- a/drivers/usb/musb/musb_host.c
>> +++ b/drivers/usb/musb/musb_host.c
>> @@ -1459,8 +1459,10 @@ void musb_host_tx(struct musb *musb, u8 epnum)
>>  	qh->segsize = length;
>>  
>>  	if (qh->use_sg) {
>> -		if (offset + length >= urb->transfer_buffer_length)
>> +		if (offset + length >= urb->transfer_buffer_length) {
>>  			qh->use_sg = false;
>> +			urb->transfer_buffer = NULL;
>> +		}
>
> In this tx case, can you directly pass qh->sg_miter.addr to
> musb_write_fifo() so that urb->transfer_buffer is not touched at all?

Yes, that seems to work.  I'll prepare a new patch.

-- 
M�ns Rullg�rd
