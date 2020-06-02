Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188451EC282
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 21:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgFBTPH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 15:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgFBTPG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jun 2020 15:15:06 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA21C08C5C0
        for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2020 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UjkYDBbSVvtYK5n+pdpjc87MoFU9Du2nwzMhJRuMyxM=; b=hkuMQCcApi59gO9cCdLZ3PYB2R
        XwTjVP4sR+9w4XU05pWfBOAiwch1cKpc+mQ3aLunrVEje2xzsFVNHFJCFPbyE6R4S6nFYSj3Ra51g
        IJJFjL4/9xPocxXjDdSGQewpvE/M19JnQOm0Q0hxbaOxexAk4+Oij7Bpl2DBTi70d5PRsshaTjbzQ
        8HRmaSAgEeWNh4MbfBWN2HZO9HbTxbETHKy1h4Bm08eDymiVLg1xS8WkKyTF5stHKth/mWT+CU09L
        sgrmIPO0blhhJbBSoEKA6Td9emsNnW8agMlmWZsR11tv8q1rrurQe6/hBD9dGMpiMZ7pg4rTrk/ah
        Wg0s6zCg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58948 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jgCNJ-0001jV-RE; Tue, 02 Jun 2020 21:15:01 +0200
Subject: Re: [PATCH v3 6/6] usb: gadget: function: Add Generic USB Display
 support
To:     Felipe Balbi <balbi@kernel.org>, dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-7-noralf@tronnes.org> <87k10p1jr6.fsf@kernel.org>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <0d0ec3f5-4b9a-e128-5d50-9e7096b3f984@tronnes.org>
Date:   Tue, 2 Jun 2020 21:14:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <87k10p1jr6.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Den 02.06.2020 19.05, skrev Felipe Balbi:
> 
> Hi,
> 
> I missed this completely until now.
> Noralf Trønnes <noralf@tronnes.org> writes:
>> This adds the gadget side support for the Generic USB Display. It presents
>> a DRM display device as a USB Display configured through configfs.
>>
>> The display is implemented as a vendor type USB interface with one bulk
>> out endpoint. The protocol is implemented using control requests.
>> lz4 compressed framebuffer data/pixels are sent over the bulk endpoint.
>>
>> The DRM part of the gadget is placed in the DRM subsystem since it reaches
>> into the DRM internals.
> 
> First and foremost, could this be done in userspace using the raw gadget
> or f_fs?
> 

An uncompressed 1920x1080-RGB565 frame is ~4MB. All frames can be
compressed (lz4) even if just a little, so this is decompressed into the
framebuffer of the attached DRM device. AFAIU I would need to be able to
mmap the received bulk buffer if I were to do this from userspace
without killing performance. So it doesn't look like I can use raw
gadget or f_fs.

>> diff --git a/drivers/usb/gadget/function/f_gud_drm.c b/drivers/usb/gadget/function/f_gud_drm.c
>> new file mode 100644
>> index 000000000000..9a2d6bb9739f
>> --- /dev/null
>> +++ b/drivers/usb/gadget/function/f_gud_drm.c
>> @@ -0,0 +1,678 @@
>> +struct f_gud_drm {
>> +	struct usb_function func;
>> +	struct work_struct worker;
> 
> why do you need a worker?
> 

The gadget runs in interrupt context and I need to call into the DRM
subsystem which can sleep.

>> +	size_t max_buffer_size;
>> +	void *ctrl_req_buf;
>> +
>> +	u8 interface_id;
>> +	struct usb_request *ctrl_req;
>> +
>> +	struct usb_ep *bulk_ep;
>> +	struct usb_request *bulk_req;
> 
> single request? Don't you want to amortize the latency of
> queue->complete by using a series of requests?
> 

I use only one request per update or partial update.
I kmalloc the biggest buffer I can get (default 4MB) and tell the host
about this size. If a frame doesn't fit, the host splits it up into
partial updates. I already support partial updates so this is built in.
Userspace can tell the graphics driver which portion of the framebuffer
it has touched to avoid sending the full frame each time.
Having one continous buffer simplifies decompression.

There's a control request preceding the bulk request which tells the
area the update is for and whether it is compressed or not.
I did some testing to see if I should avoid the control request overhead
for split updates, but it turns out that the bottleneck is the
decompression. The control request is just 400-500us, while the total
time from control request to buffer is decompressed is 50-100ms
(depending on how well the frame compresses).

>> +	struct gud_drm_gadget *gdg;
>> +
>> +	spinlock_t lock; /* Protects the following members: */
>> +	bool ctrl_pending;
>> +	bool status_pending;
>> +	bool bulk_pending;
>> +	bool disable_pending;
> 
> could this be a single u32 with #define'd flags? That would be atomic,
> right?
> 

I have never grasped all the concurrency issues, but wouldn't I need
memory barriers as well?

>> +	u8 errno;
> 
> a global per-function error? Why?
> 

This is the result of the previously request operation. The host will
request this value to see how it went. I might switch to using a bulk
endpoint for status following a discussion with Alan Stern in the host
driver thread in this patch series. If so I might not need this.

>> +	u16 request;
>> +	u16 value;
> 
> also why? Looks odd
> 

These values contains the operation (in addition to the payload) that
the worker shall perform following the control-OUT requests.

control-IN requests can run in interrupt context so in that case the
payload is queued up immediately.

<snip>

>> +static void f_gud_drm_bulk_complete(struct usb_ep *ep, struct usb_request *req)
>> +{
>> +	struct f_gud_drm *fgd = req->context;
>> +	unsigned long flags;
>> +
>> +	if (req->status || req->actual != req->length)
>> +		return;
> 
> so, if we complete with an erroneous status or a short packet, you'll
> ignore it?
> 

Hmm yeah. When I wrote this I thought that the bottleneck was the USB
transfers, so I didn't want the host to slow down performance by
requesting this status. Now I know it's the decompression that takes
time, so I could actually do a status check and retry the frame if the
device detects an error.

>> +	spin_lock_irqsave(&fgd->lock, flags);
>> +	fgd->bulk_pending = true;
>> +	spin_unlock_irqrestore(&fgd->lock, flags);
>> +
>> +	queue_work(system_long_wq, &fgd->worker);
> 
> Do you need to offset this to a worker?
> 

Yes, long running (one operation can be >100ms) and can sleep.

>> +static int f_gud_drm_ctrl_req_set_buffer(struct f_gud_drm *fgd, void *buf, size_t len)
>> +{
>> +	int ret;
>> +
>> +	if (len != sizeof(struct gud_drm_req_set_buffer))
>> +		return -EINVAL;
>> +
>> +	ret = gud_drm_gadget_set_buffer(fgd->gdg, buf);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (ret > fgd->max_buffer_size)
>> +		return -EOVERFLOW;
>> +
>> +	fgd->bulk_req->length = ret;
>> +
>> +	return usb_ep_queue(fgd->bulk_ep, fgd->bulk_req, GFP_KERNEL);
>> +}
>> +
>> +static void f_gud_drm_worker(struct work_struct *work)
>> +{
>> +	struct f_gud_drm *fgd = container_of(work, struct f_gud_drm, worker);
>> +	bool ctrl_pending, bulk_pending, disable_pending;
>> +	struct gud_drm_gadget *gdg = fgd->gdg;
>> +	unsigned long flags;
>> +	u16 request, value;
>> +	int ret;
>> +
>> +	spin_lock_irqsave(&fgd->lock, flags);
>> +	request = fgd->request;
>> +	value = fgd->value;
>> +	ctrl_pending = fgd->ctrl_pending;
>> +	bulk_pending = fgd->bulk_pending;
>> +	disable_pending = fgd->disable_pending;
>> +	spin_unlock_irqrestore(&fgd->lock, flags);
>> +
>> +	pr_debug("%s: bulk_pending=%u ctrl_pending=%u disable_pending=%u\n",
>> +		 __func__, bulk_pending, ctrl_pending, disable_pending);
> 
> could we use dev_dbg() at least?
> 

Sure.

Noralf.

