Return-Path: <linux-usb+bounces-20923-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E429DA3F40C
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 13:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9330819C1AA4
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 12:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087D320A5EC;
	Fri, 21 Feb 2025 12:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxPqTESO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A26207A15
	for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740140343; cv=none; b=sJy40BEFd0Rv1duZRiU0ex/87/FLqbYwiDN7gC8otKGBVp6GzGf9jJvBat4FbQbLGKnz3PMGFqQAujLMB0tPg85pYMlq3XbL3YK1ewH29nbf1uXuGvETavGvFgwP+MtFSecjnnbFENsdIZ9Y3WzeaHs0buYILnGJEq4IwBRsEck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740140343; c=relaxed/simple;
	bh=qXGEnRBBAAimeVTiS+X/HtQ8laA7HMoPbC+z37ugD2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZcOkg2yxnY/hr1Gdks4mkLN9w3mx6/Fzw08t0DnE+v9QiOphwiMP/5bGN204rKACQQ1PBkzr5ENZg9ZIy94hsg970Ew/GJYN+cpLofbczRMV/ARXwSEZnynOoszEhWjt23UQFfeugkus7p/HcoBmN8cN+5GGCqsCseh6/8+pY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxPqTESO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740140342; x=1771676342;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qXGEnRBBAAimeVTiS+X/HtQ8laA7HMoPbC+z37ugD2Q=;
  b=WxPqTESOwXypzcykCqAVTFO8oPXoC5e/F4qz26FFU6dd5BsGXbYBnZza
   2d50vvi7H8TplDw3vxgxuFRR7fVz0TZ7Jj2fQbP1OVEkOaWvyS5o4Y/Xv
   fRuJncMUDWXkqk8hdVRxmGQgS4aaAyFsL659Ey3E0w/ZrdGzkhCihMjF3
   wHsNmR1+Dat+LjdWqDzCHyFZ8AvVRnf2CiKugl6xn3mznbzLeh+wtvn2g
   oooldCZgobDKSFI7LRQZIQjBv2Fkt0Jni0NiyueyqzTn1gg/ijDrZKSE2
   CcK+ahZ+oWoHQen9gS7ytBXzW/vbmV9N/xhqb3ef/cqzuFd7kHv7M8fgy
   A==;
X-CSE-ConnectionGUID: 8eXZRxcaS1mzNHSLM1P3fA==
X-CSE-MsgGUID: oJ2iKopKQjWD06RdwuSCug==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40810124"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="40810124"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 04:19:01 -0800
X-CSE-ConnectionGUID: SdFanI6EQ/uTICuBr2blNA==
X-CSE-MsgGUID: x6zdQgy3Qz2Lb4NXaI5h3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119484780"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2025 04:18:59 -0800
Message-ID: <5ec64d8d-7511-4ec3-98b6-10f4cdf313f3@linux.intel.com>
Date: Fri, 21 Feb 2025 14:19:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: core: Add eUSB2 descriptor and parsing in USB core
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Kannappan R <r.kannappan@intel.com>, Amardeep Rai <amardeep.rai@intel.com>
References: <20250220141339.1939448-1-mathias.nyman@linux.intel.com>
 <20250220215632.iv2oym57nujqktwr@synopsys.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250220215632.iv2oym57nujqktwr@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.2.2025 23.56, Thinh Nguyen wrote:
> Hi,
> 
> On Thu, Feb 20, 2025, Mathias Nyman wrote:
>> From: Kannappan R <r.kannappan@intel.com>
>>
>> Add support for the 'eUSB2 Isochronous Endpoint Companion Descriptor'
>> introduced in the recent USB 2.0 specification 'USB 2.0 Double Isochronous
>> IN Bandwidth' ECN.
>>
>> It allows embedded USB2 (eUSB2) devices to report and use higher bandwidths
>> for isochronous IN transfers in order to support higher camera resolutions
>> on the lid of laptops and tablets with minimal change to the USB2 protocol.
>>
>> The motivation for expanding USB 2.0 is further clarified in an additional
>> Embedded USB2 version 2.0 (eUSB2v2) supplement to the USB 2.0
>> specification. It points out this is optimized for performance, power and
>> cost by using the USB 2.0 low-voltage, power efficient PHY and half-duplex
>> link for the asymmetric camera bandwidth needs, avoiding the costly and
>> complex full-duplex USB 3.x symmetric link and gigabit receivers.
>>
>> eUSB2 devices that support the higher isochronous IN bandwidth and the new
>> descriptor can be identified by their device descriptor bcdUSB value of
>> 0x0220
> 
> Isn't eUSB2v2 has bcdUSB value of 0x0230?

My understanding is that this descriptor is introduced for bcdUSB 0x0220
eUSB2 devices that support Double Isochronous IN Bandwidth, 3072 to
6144 bytes per microframe. See "USB 2.0 Double Isochronous IN Bandwidth"
engineering change notice (USB 2.0 Double Isochronous IN ECN.pdf)

eUSB2v2 devices with bcdUSB 0x0230 use the same descriptor, but have additional
features such as assymmectric speed and bitrate up to 4.8Gbps.
These types of devices are defined in the
"Embedded USB2 Version 2.0 Supplement to the USB 2.0 Specification" document

This patch focuses on initial support for 0x0220 devices

> 
>>
>> Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
>> Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
>> Signed-off-by: Kannappan R <r.kannappan@intel.com>
>> Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>   drivers/usb/core/config.c    | 51 ++++++++++++++++++++++++++++++++----
>>   include/linux/usb.h          |  8 +++---
>>   include/uapi/linux/usb/ch9.h | 15 +++++++++++
>>   3 files changed, 66 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
>> index f7bf8d1de3ad..13bd4ec4ea5f 100644
>> --- a/drivers/usb/core/config.c
>> +++ b/drivers/usb/core/config.c
>> @@ -64,6 +64,37 @@ static void usb_parse_ssp_isoc_endpoint_companion(struct device *ddev,
>>   	memcpy(&ep->ssp_isoc_ep_comp, desc, USB_DT_SSP_ISOC_EP_COMP_SIZE);
>>   }
>>   
>> +static void usb_parse_eusb2_isoc_endpoint_companion(struct device *ddev,
>> +		int cfgno, int inum, int asnum, struct usb_host_endpoint *ep,
>> +		unsigned char *buffer, int size)
>> +{
>> +	struct usb_eusb2_isoc_ep_comp_descriptor *desc;
>> +	struct usb_descriptor_header *h;
>> +
>> +	/*
>> +	 * eUSB2 isochronous endpoint companion descriptor for this endpoint
>> +	 * shall be declared before the next endpoint or interface descriptor
>> +	 */
>> +	while (size >= USB_DT_EUSB2_ISOC_EP_COMP_SIZE) {
>> +		h = (struct usb_descriptor_header *)buffer;
>> +
>> +		if (h->bDescriptorType == USB_DT_EUSB2_ISOC_ENDPOINT_COMP) {
>> +			desc = (struct usb_eusb2_isoc_ep_comp_descriptor *)buffer;
>> +			ep->eusb2_isoc_ep_comp = *desc;
>> +			return;
>> +		}
>> +		if (h->bDescriptorType == USB_DT_ENDPOINT ||
>> +		    h->bDescriptorType == USB_DT_INTERFACE)
>> +			break;
>> +
>> +		buffer += h->bLength;
>> +		size -= h->bLength;
>> +	}
>> +
>> +	dev_notice(ddev, "No eUSB2 isoc ep %d companion for config %d interface %d altsetting %d\n",
>> +		   ep->desc.bEndpointAddress, cfgno, inum, asnum);
> 
> Since eUSB2v2 devices should also include at least an alternate
> interface with isoc endpoint descriptors using legacy settings, does the
> spec require those legacy alternate interfaces to also have this isoc
> companion descriptor?

I think those alternate interfaces with 'legacy' settings will have normal nonzero
wMaxPacketSize, and no eusb2 isoc companion descriptor.

we only look for this descriptor if wMaxpacketSize == 0

This is based on the text the ECN adds to USB2 section 9.6.6 "Endpoint"

"For high bandwidth eUSB2 Isochronous IN Endpoint that require bandwidths above
3KB/microframe, the standard Endpoint descriptor shall declare a zero bandwidth setting,
i.e., the wMaxPacketSize field shall be set to 0, and the actual maximum packet size and
bandwidth requirements shall be defined in the eUSB2 Iso Endpoint Companion descriptor
wMaxPacketSize and dwBytesPerInterval fields, respectively. Note that Devices shall also
implement one or more non-zero bandwidth alternate settings with a non-zero wMaxPacketSize
(up to 3KB/microframe) in the standard Endpoint descriptor."

> 
>> +}>> +
>>   static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
>>   		int inum, int asnum, struct usb_host_endpoint *ep,
>>   		unsigned char *buffer, int size)
>> @@ -258,8 +289,10 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>>   	int n, i, j, retval;
>>   	unsigned int maxp;
>>   	const unsigned short *maxpacket_maxes;
>> +	u16 bcdUSB;
>>   
>>   	d = (struct usb_endpoint_descriptor *) buffer;
>> +	bcdUSB = le16_to_cpu(udev->descriptor.bcdUSB);
>>   	buffer += d->bLength;
>>   	size -= d->bLength;
>>   
>> @@ -409,15 +442,17 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>>   
>>   	/*
>>   	 * Validate the wMaxPacketSize field.
>> -	 * Some devices have isochronous endpoints in altsetting 0;
>> -	 * the USB-2 spec requires such endpoints to have wMaxPacketSize = 0
>> -	 * (see the end of section 5.6.3), so don't warn about them.
>> +	 * eUSB2 devices (see USB 2.0 Double Isochronous IN ECN 9.6.6 Endpoint)
>> +	 * and devices with isochronous endpoints in altsetting 0 (see USB 2.0
>> +	 * end of section 5.6.3) have wMaxPacketSize = 0.
>> +	 * So don't warn about those.
>>   	 */
>>   	maxp = le16_to_cpu(endpoint->desc.wMaxPacketSize);
>> -	if (maxp == 0 && !(usb_endpoint_xfer_isoc(d) && asnum == 0)) {
>> +
>> +	if (maxp == 0 && bcdUSB != 0x0220 &&
>> +	    !(usb_endpoint_xfer_isoc(d) && asnum == 0))
>>   		dev_notice(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid wMaxPacketSize 0\n",
>>   		    cfgno, inum, asnum, d->bEndpointAddress);
>> -	}
>>   
>>   	/* Find the highest legal maxpacket size for this endpoint */
>>   	i = 0;		/* additional transactions per microframe */
>> @@ -465,6 +500,12 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>>   				maxp);
>>   	}
>>   
>> +	/* Parse a possible eUSB2 periodic endpoint companion descriptor */
>> +	if (bcdUSB == 0x0220 && d->wMaxPacketSize == 0 &&
>> +	    (usb_endpoint_xfer_isoc(d) || usb_endpoint_xfer_int(d)))
> 
> Why are we checking for interrupt endpoint to parse for isoc?
> 

Good point, can't recall why it ended up here. I'll fix that

>> +		usb_parse_eusb2_isoc_endpoint_companion(ddev, cfgno, inum, asnum,
>> +							endpoint, buffer, size);
>> +
>>   	/* Parse a possible SuperSpeed endpoint companion descriptor */
>>   	if (udev->speed >= USB_SPEED_SUPER)
>>   		usb_parse_ss_endpoint_companion(ddev, cfgno,
>> diff --git a/include/linux/usb.h b/include/linux/usb.h
>> index cfa8005e24f9..b46738701f8d 100644
>> --- a/include/linux/usb.h
>> +++ b/include/linux/usb.h
>> @@ -51,6 +51,7 @@ struct ep_device;
>>    * @desc: descriptor for this endpoint, wMaxPacketSize in native byteorder
>>    * @ss_ep_comp: SuperSpeed companion descriptor for this endpoint
>>    * @ssp_isoc_ep_comp: SuperSpeedPlus isoc companion descriptor for this endpoint
>> + * @eusb2_isoc_ep_comp: eUSB2 isoc companion descriptor for this endpoint
>>    * @urb_list: urbs queued to this endpoint; maintained by usbcore
>>    * @hcpriv: for use by HCD; typically holds hardware dma queue head (QH)
>>    *	with one or more transfer descriptors (TDs) per urb
>> @@ -64,9 +65,10 @@ struct ep_device;
>>    * descriptor within an active interface in a given USB configuration.
>>    */
>>   struct usb_host_endpoint {
>> -	struct usb_endpoint_descriptor		desc;
>> -	struct usb_ss_ep_comp_descriptor	ss_ep_comp;
>> -	struct usb_ssp_isoc_ep_comp_descriptor	ssp_isoc_ep_comp;
>> +	struct usb_endpoint_descriptor			desc;
>> +	struct usb_ss_ep_comp_descriptor		ss_ep_comp;
>> +	struct usb_ssp_isoc_ep_comp_descriptor		ssp_isoc_ep_comp;
>> +	struct usb_eusb2_isoc_ep_comp_descriptor	eusb2_isoc_ep_comp;
>>   	struct list_head		urb_list;
>>   	void				*hcpriv;
>>   	struct ep_device		*ep_dev;	/* For sysfs info */
>> diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
>> index 91f0f7e214a5..475af9358173 100644
>> --- a/include/uapi/linux/usb/ch9.h
>> +++ b/include/uapi/linux/usb/ch9.h
>> @@ -253,6 +253,9 @@ struct usb_ctrlrequest {
>>   #define USB_DT_BOS			0x0f
>>   #define USB_DT_DEVICE_CAPABILITY	0x10
>>   #define USB_DT_WIRELESS_ENDPOINT_COMP	0x11
>> +/* From the eUSB2 spec */
>> +#define USB_DT_EUSB2_ISOC_ENDPOINT_COMP	0x12
>> +/* From Wireless USB spec */
>>   #define USB_DT_WIRE_ADAPTER		0x21
>>   /* From USB Device Firmware Upgrade Specification, Revision 1.1 */
>>   #define USB_DT_DFU_FUNCTIONAL		0x21
>> @@ -675,6 +678,18 @@ static inline int usb_endpoint_interrupt_type(
>>   
>>   /*-------------------------------------------------------------------------*/
>>   
>> +/* USB_DT_EUSB2_ISOC_ENDPOINT_COMP: eUSB2 Isoch Endpoint Companion descriptor */
> 
> Should we name this usb_hsx_isoc_ep_comp_descriptor for consistency?
> 
> Just bringing up the discussion here as I don't have a hard stance on
> this. The naming of speeds and usb versions are getting more
> inconsistent, and naming of these are getting more challenging. Not sure
> if there will be something new in the future.

USB 2.0 Double Isochronous IN Bandwidth ECN documentation uses the names:
"eUSB2 Isochronous Endpoint Companion Descriptor"
"eUSB2 Iso Endpoint Companion Descriptor" and
EUSB2_ISO_ENDPOINT_COMPANION as "desriptor type"

hsx is not mentioned in this ECN, it seems to be introduced in the
eUSB2v2 Supplement.

But I don't have a strong opinion regarding this, but have grown used
to eusb2

Thanks for looking at this

-Mathias

