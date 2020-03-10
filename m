Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C868817FFC5
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 15:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgCJOFt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Mar 2020 10:05:49 -0400
Received: from www381.your-server.de ([78.46.137.84]:51576 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgCJOFt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Mar 2020 10:05:49 -0400
X-Greylist: delayed 1230 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Mar 2020 10:05:47 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
         s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NnM1QCunpjC6c6Up1F4TLwXN2QNnaCmd0eqQ9fsv1U8=; b=ByxP7Rr0IqQDfX69D6GKlInxYy
        fwEBixIKZjzFgnSUdJ5M38R8uA5lOim4aZiKaU+Yz5ghNDHwUXxQNhvavvL7grSjyEzreVXqN9Sai
        GNgzIc622oMkxsCof8B3BG82R+jarN+X9kqo6vGUqmovTb5/+QRp1OXyFVzko5GDcrjBokQ8RMP4l
        wQ/O+F1OZlhe/uRdY/AZvqvt1A5eDFqzQCpvXwEii0DEuuw0g7PUbcH0kgr2c5z6dzzIPkEd/d3m3
        kw1nF3ZcKrYOBqMbpWO7QC84eR4ZOlkxEWC0jNm8Y1v1tQ3SH9SrKlVmwtxl7YNK5fZSdNFFhlBzv
        z3MH2xYg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89_1)
        (envelope-from <lars@metafoo.de>)
        id 1jBfC7-0000qB-CC; Tue, 10 Mar 2020 14:45:15 +0100
Received: from [93.104.100.58] (helo=[192.168.178.20])
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1jBfC7-0005Jq-2u; Tue, 10 Mar 2020 14:45:15 +0100
Subject: Re: [PATCH][RESEND] usb: dwc3: gadget: Handle dequeuing of non queued
 URB gracefully
To:     "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "m.olbrich@pengutronix.de" <m.olbrich@pengutronix.de>
References: <20191106144553.16956-1-alexandru.ardelean@analog.com>
 <20200116132459.22383-1-alexandru.ardelean@analog.com>
 <87d0b1885e.fsf@kernel.org>
 <5313c926109f39699e63342b4ff71102d3cfa495.camel@analog.com>
From:   Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <1df6e9be-2233-a0b2-1ddc-76de9d62a397@metafoo.de>
Date:   Tue, 10 Mar 2020 14:45:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5313c926109f39699e63342b4ff71102d3cfa495.camel@analog.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.2/25747/Tue Mar 10 12:06:29 2020)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/10/20 2:22 PM, Ardelean, Alexandru wrote:
> On Thu, 2020-01-30 at 14:02 +0200, Felipe Balbi wrote:
>> [External]
>>
>>
>> Hi,
>>
>> Alexandru Ardelean <alexandru.ardelean@analog.com> writes:
>>
>>> From: Lars-Peter Clausen <lars@metafoo.de>
>>>
>>> Trying to dequeue and URB that is currently not queued should be a no-op
>>> and be handled gracefully.
>>>
>>> Use the list field of the URB to indicate whether it is queued or not by
>>> setting it to the empty list when it is not queued.
>>>
>>> Handling this gracefully allows for race condition free synchronization
>>> between the complete callback being called to to a completed transfer and
>>> trying to call usb_ep_dequeue() at the same time.
>> We need a little more information here. Can you further explain what
>> happens and how you caught this?
> Apologies for the delay [of this reply].
> It's been a while since this patch was created, and it was on a 4.14 kernel.
> Lars was trying to fix various crashes with USB DWC3 OTG + some Xilinx patches.
> I did not track the status of the OTG stuff upstream. I think it's a lot of
> patches in the Xilinx tree.
>
> The context has changed from 4.14 [obviously], and there were many things that
> could have influenced things.
> I've been trying to RFC some of these patches now.
> [ yeah I know: maybe I should have [probably] also added an RFC tag :) ]
> Some of the patches [including this one] seemed to make sense, even outside of
> the context of the crashes that were happening on 4.14.
> Atm, we're at 4.19 and we don't see issues, but we still have this patch.
> We may drop it and see what happens.
> ¯\_(ツ)_/¯
>
> But in any case, it does require a bit more re-investigation.
> Apologies for the noise that this patch created :)

The race condition is between a gadget calling usb_ep_dequeue() and the 
driver completing the URB.

Lets say in a thread you have a reference to a in-flight URB and you 
want to abort the request, e.g. because the application that sent the 
request has been closed. But concurrently to that the URB is completed 
by the hardware and the interrupt fires and marks the URB as complete. 
Your thread is suspended while the interrupt is running, once the 
interrupt has finished the thread wakes up, still has the reference to 
the URB, but now it has been completed. The thread still calls 
usb_ep_dequeue() though and then undefined behavior occurs.

The context in which we observed the issue is when using function fs to 
create a userspace gadget and using aio_cancel() to abort a pending URB. 
But really any gadget that aborts a transfer before it is completed or 
before the timeout occurred can run into this issue.

- Lars

