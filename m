Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28911896B5
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 07:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfHLFYW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 01:24:22 -0400
Received: from mga14.intel.com ([192.55.52.115]:21511 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbfHLFYW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Aug 2019 01:24:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Aug 2019 22:24:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,376,1559545200"; 
   d="scan'208";a="375115888"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga005.fm.intel.com with ESMTP; 11 Aug 2019 22:24:18 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Pawel Laszczak <pawell@cadence.com>,
        "devicetree\@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "hdegoede\@redhat.com" <hdegoede@redhat.com>,
        "heikki.krogerus\@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt\@kernel.org" <robh+dt@kernel.org>,
        "rogerq\@ti.com" <rogerq@ti.com>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jbergsagel\@ti.com" <jbergsagel@ti.com>,
        "nsekhar\@ti.com" <nsekhar@ti.com>, "nm\@ti.com" <nm@ti.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        "peter.chen\@nxp.com" <peter.chen@nxp.com>,
        Jayshri Dajiram Pawar <jpawar@cadence.com>,
        Rahul Kumar <kurahul@cadence.com>
Subject: RE: [PATCH v9 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
In-Reply-To: <BYAPR07MB4709B0A4FADFB76183D651DCDDD10@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com> <1562324238-16655-6-git-send-email-pawell@cadence.com> <877e8tm25r.fsf@linux.intel.com> <BYAPR07MB4709152CB29B6B027ABEB688DDCF0@BYAPR07MB4709.namprd07.prod.outlook.com> <8736idnu0q.fsf@gmail.com> <BYAPR07MB4709B0A4FADFB76183D651DCDDD10@BYAPR07MB4709.namprd07.prod.outlook.com>
Date:   Mon, 12 Aug 2019 08:24:17 +0300
Message-ID: <87k1bjvtvi.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Pawel Laszczak <pawell@cadence.com> writes:

> Hi,
>
>>
>>Pawel Laszczak <pawell@cadence.com> writes:
>>>>> +static int cdns3_gadget_start(struct cdns3 *cdns)
>>>>> +{
>>>>> +	struct cdns3_device *priv_dev;
>>>>> +	u32 max_speed;
>>>>> +	int ret;
>>>>> +
>>>>> +	priv_dev = kzalloc(sizeof(*priv_dev), GFP_KERNEL);
>>>>> +	if (!priv_dev)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	cdns->gadget_dev = priv_dev;
>>>>> +	priv_dev->sysdev = cdns->dev;
>>>>> +	priv_dev->dev = cdns->dev;
>>>>> +	priv_dev->regs = cdns->dev_regs;
>>>>> +
>>>>> +	device_property_read_u16(priv_dev->dev, "cdns,on-chip-buff-size",
>>>>> +				 &priv_dev->onchip_buffers);
>>>>> +
>>>>> +	if (priv_dev->onchip_buffers <=  0) {
>>>>> +		u32 reg = readl(&priv_dev->regs->usb_cap2);
>>>>> +
>>>>> +		priv_dev->onchip_buffers = USB_CAP2_ACTUAL_MEM_SIZE(reg);
>>>>> +	}
>>>>> +
>>>>> +	if (!priv_dev->onchip_buffers)
>>>>> +		priv_dev->onchip_buffers = 256;
>>>>> +
>>>>> +	max_speed = usb_get_maximum_speed(cdns->dev);
>>>>> +
>>>>> +	/* Check the maximum_speed parameter */
>>>>> +	switch (max_speed) {
>>>>> +	case USB_SPEED_FULL:
>>>>> +	case USB_SPEED_HIGH:
>>>>> +	case USB_SPEED_SUPER:
>>>>> +		break;
>>>>> +	default:
>>>>> +		dev_err(cdns->dev, "invalid maximum_speed parameter %d\n",
>>>>> +			max_speed);
>>>>> +		/* fall through */
>>>>> +	case USB_SPEED_UNKNOWN:
>>>>> +		/* default to superspeed */
>>>>> +		max_speed = USB_SPEED_SUPER;
>>>>> +		break;
>>>>> +	}
>>>>> +
>>>>> +	/* fill gadget fields */
>>>>> +	priv_dev->gadget.max_speed = max_speed;
>>>>> +	priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
>>>>> +	priv_dev->gadget.ops = &cdns3_gadget_ops;
>>>>> +	priv_dev->gadget.name = "usb-ss-gadget";
>>>>> +	priv_dev->gadget.sg_supported = 1;
>>>>> +
>>>>> +	spin_lock_init(&priv_dev->lock);
>>>>> +	INIT_WORK(&priv_dev->pending_status_wq,
>>>>> +		  cdns3_pending_setup_status_handler);
>>>>> +
>>>>> +	/* initialize endpoint container */
>>>>> +	INIT_LIST_HEAD(&priv_dev->gadget.ep_list);
>>>>> +	INIT_LIST_HEAD(&priv_dev->aligned_buf_list);
>>>>> +
>>>>> +	ret = cdns3_init_eps(priv_dev);
>>>>> +	if (ret) {
>>>>> +		dev_err(priv_dev->dev, "Failed to create endpoints\n");
>>>>> +		goto err1;
>>>>> +	}
>>>>> +
>>>>> +	/* allocate memory for setup packet buffer */
>>>>> +	priv_dev->setup_buf = dma_alloc_coherent(priv_dev->sysdev, 8,
>>>>> +						 &priv_dev->setup_dma, GFP_DMA);
>>>>> +	if (!priv_dev->setup_buf) {
>>>>> +		ret = -ENOMEM;
>>>>> +		goto err2;
>>>>> +	}
>>>>> +
>>>>> +	priv_dev->dev_ver = readl(&priv_dev->regs->usb_cap6);
>>>>> +
>>>>> +	dev_dbg(priv_dev->dev, "Device Controller version: %08x\n",
>>>>> +		readl(&priv_dev->regs->usb_cap6));
>>>>> +	dev_dbg(priv_dev->dev, "USB Capabilities:: %08x\n",
>>>>> +		readl(&priv_dev->regs->usb_cap1));
>>>>> +	dev_dbg(priv_dev->dev, "On-Chip memory cnfiguration: %08x\n",
>>>>> +		readl(&priv_dev->regs->usb_cap2));
>>>>> +
>>>>> +	priv_dev->dev_ver = GET_DEV_BASE_VERSION(priv_dev->dev_ver);
>>>>> +
>>>>> +	priv_dev->zlp_buf = kzalloc(CDNS3_EP_ZLP_BUF_SIZE, GFP_KERNEL);
>>>>> +	if (!priv_dev->zlp_buf) {
>>>>> +		ret = -ENOMEM;
>>>>> +		goto err3;
>>>>> +	}
>>>>> +
>>>>> +	/* add USB gadget device */
>>>>> +	ret = usb_add_gadget_udc(priv_dev->dev, &priv_dev->gadget);
>>>>> +	if (ret < 0) {
>>>>> +		dev_err(priv_dev->dev,
>>>>> +			"Failed to register USB device controller\n");
>>>>> +		goto err4;
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +err4:
>>>>> +	kfree(priv_dev->zlp_buf);
>>>>> +err3:
>>>>> +	dma_free_coherent(priv_dev->sysdev, 8, priv_dev->setup_buf,
>>>>> +			  priv_dev->setup_dma);
>>>>> +err2:
>>>>> +	cdns3_free_all_eps(priv_dev);
>>>>> +err1:
>>>>> +	cdns->gadget_dev = NULL;
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>> +static int __cdns3_gadget_init(struct cdns3 *cdns)
>>>>> +{
>>>>> +	struct cdns3_device *priv_dev;
>>>>> +	int ret = 0;
>>>>> +
>>>>> +	cdns3_drd_switch_gadget(cdns, 1);
>>>>> +	pm_runtime_get_sync(cdns->dev);
>>>>> +
>>>>> +	ret = cdns3_gadget_start(cdns);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	priv_dev = cdns->gadget_dev;
>>>>> +	ret = devm_request_threaded_irq(cdns->dev, cdns->dev_irq,
>>>>> +					cdns3_device_irq_handler,
>>>>> +					cdns3_device_thread_irq_handler,
>>>>> +					IRQF_SHARED, dev_name(cdns->dev), cdns);
>>>>
>>>>copied handlers here for commenting. Note that you don't have
>>>>IRQF_ONESHOT:
>>>
>>> I know, I can't use  IRQF_ ONESHOT flag in this case. I have implemented
>>> some code for masking/unmasking interrupts in cdns3_device_irq_handler.
>>>
>>> Some priority interrupts should be handled ASAP so I can't blocked interrupt
>>> Line.
>>
>>You're completely missing my comment. Your top half should be as short
>>as possile. It should only check if current device generated
>>interrupts. If it did, then you should wake the thread handler.
>>
>>This is to improve realtime behavior but not keeping preemption disabled
>>for longer than necessary.
>
> Ok, I understand. I will move it to thread handler.
>
> I can't use IRQF_ONESHOT flag because it doesn't work when interrupt line is shared. 

yeah, you should try to avoid ONESHOT :-)

> I have such situation in which one interrupt line is shared with ehci and cdns3 driver. 
> In such case this function returns error code. 

which function returns error code?

> So probably I will need to mask only the reported interrupts. 

you should mask all interrupts from your device, otherwise you top-halt
may still end up reentrant.

> I can't mask all interrupt using controller register because I can miss some of them. 

why would you miss them? They would be left in the register until you
unmask them and the line is raised again.

> After masking all interrupt  the next new event will not be reported in  usb_ists, ep_ists 
> registers.

why not? Masking means that new events won't cause the IRQ line to be
asserted (or MSI DWORD write won't be initiated), but the event itself
should still be in the register.

>>>>> +static irqreturn_t cdns3_device_irq_handler(int irq, void *data)
>>>>> +{
>>>>> +	struct cdns3_device *priv_dev;
>>>>> +	struct cdns3 *cdns = data;
>>>>> +	irqreturn_t ret = IRQ_NONE;
>>>>> +	unsigned long flags;
>>>>> +	u32 reg;
>>>>> +
>>>>> +	priv_dev = cdns->gadget_dev;
>>>>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>>>>
>>>>the top half handler runs in hardirq context. You don't need any locks
>>>>here. Also IRQs are *already* disabled, you don't need to disable them again.
>>>
>>> I will remove spin_lock_irqsave but I need to disable only some of the interrupts.
>>> I disable interrupts associated with USB endpoints. Handling of them can be
>>> deferred to thread handled.
>>
>>you should defer all of them to thread. Endpoints or otherwise.
>
> I will do this. 
>
> Also I remove spin_lock_irqsave(&priv_dev->lock, flags); 
> As I remember it's not needed here. 

right

>>>>> +	/* check USB device interrupt */
>>>>> +	reg = readl(&priv_dev->regs->usb_ists);
>>>>> +
>>>>> +	if (reg) {
>>>>> +		writel(reg, &priv_dev->regs->usb_ists);
>>>>> +		cdns3_check_usb_interrupt_proceed(priv_dev, reg);
>>>>> +		ret = IRQ_HANDLED;
>>>>
>>>>now, because you _don't_ mask this interrupt, you're gonna have
>>>>issues. Say we actually get both device and endpoint interrupts while
>>>>the thread is already running with previous endpoint interrupts. Now
>>>>we're gonna reenter the top half, because device interrupts are *not*
>>>>masked, which will read usb_ists and handle it here.
>>>
>>> Endpoint interrupts are masked in cdns3_device_irq_handler and stay masked
>>> until they are not handled in threaded handler.
>>
>>Quick question, then: these ISTS registers, are they masked interrupt
>>status or raw interrupt status?
>
> Yes it's masked, but after masking them the new interrupts will not be reported 
> In ISTS registers. Form this reason I can mask only reported interrupt. 

and what happens when you unmask the registers? Do they get reported?

>>> Of course, not all endpoint interrupts are masked, but only reported in ep_ists.
>>> USB interrupt will be handled immediately.
>>>
>>> Also, I can get next endpoint interrupt from not masked endpoint and driver also again wake
>>> the thread. I saw such situation, but threaded interrupt handler has been working correct
>>> in such situations.
>>>
>>> In thread handler driver checks again which endpoint should be handled in ep_ists.
>>>
>>> I think that such situation should also occurs during our LPM enter/exit test.
>>> So, driver has  been tested for such case. During this test driver during
>>> transferring data generate a huge number of LPM interrupts which
>>> are usb interrupts.
>>>
>>> I can't block usb interrupts interrupts because:
>>> /*
>>>  * WORKAROUND: CDNS3 controller has issue with hardware resuming
>>>  * from L1. To fix it, if any DMA transfer is pending driver
>>>  * must starts driving resume signal immediately.
>>>  */
>>
>>I can't see why this would prevent you from defering handling to thread
>>handler.
>>
>
> I also will  try to move it, but this change can has impact on performance. 

how much is the impact? What's the impact? Why does this impact performance?

>>>>> +		struct cdns3_aligned_buf *buf, *tmp;
>>>>> +
>>>>> +		list_for_each_entry_safe(buf, tmp, &priv_dev->aligned_buf_list,
>>>>> +					 list) {
>>>>> +			if (!buf->in_use) {
>>>>> +				list_del(&buf->list);
>>>>> +
>>>>> +				spin_unlock_irqrestore(&priv_dev->lock, flags);
>>>>
>>>>creates the possibility of a race condition
>>> Why? In this place the buf can't be used.
>>
>>but you're reenabling interrupts, right?
>
> Yes, driver frees not used buffers here. 
> I think that it's the safest place for this purpose. 

I guess you missed the point a little. Since you reenable interrupts
just to free the buffer, you end up creating the possibility for a race
condition. Specially since you don't mask all interrupt events. The
moment you reenable interrupts, one of your not-unmasked interrupt
sources could trigger, then top-half gets scheduled which tries to wake
up the IRQ thread again and things go boom.

>>>>> +				dma_free_coherent(priv_dev->sysdev, buf->size,
>>>>> +						  buf->buf,
>>>>> +						  buf->dma);
>>>>> +				spin_lock_irqsave(&priv_dev->lock, flags);
>>>>> +
>>>>> +				kfree(buf);
>>>>
>>>>why do you even need this "garbage collector"?
>>>
>>> I need to free not used memory. The once allocated buffer will be associated with
>>> request, but if request.length will be increased in usb_request then driver will
>>> must allocate the  bigger buffer. As I remember I couldn't call dma_free_coherent
>>> in interrupt context so I had to move it to thread handled. This flag was used to avoid
>>> going through whole  aligned_buf_list  every time.
>>> In most cases this part will never called int this place
>>
>>Did you try, btw, setting the quirk flag which tells gadget drivers to
>>always allocate buffers aligned to MaxPacketSize? Wouldn't that be enough?
>
> If found only  quirk_ep_out_aligned_size flag, but it align only buffer size. 
>
> DMA used by this controller must have buffer address aligned to 8.
> I think that on most architecture kmalloc should guarantee such aligned.

right, it should be aligned on PAGE_SIZE

> The problem was detected on NXP testing board.  

and what was the alignment on that? IIRC, ARM had the same alignment
requirements as x86. Where you sing SLUB allocator on that NXP board,
perhaps?

-- 
balbi
