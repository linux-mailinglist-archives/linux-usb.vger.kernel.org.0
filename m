Return-Path: <linux-usb+bounces-9528-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 663698ABEF1
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 12:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4B4FB20B46
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 10:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A34F10A1E;
	Sun, 21 Apr 2024 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZCjfzUJl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C563333D5
	for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2024 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713695167; cv=none; b=V9ryiGyvofVn16RgCqeVbemdI5Gyz9SGENe8P0SKkiI+AUrF+NyGBhMU081K/pY7BkwmkypJal+NdYGDwMlDXquob5Ue/cSgARvy2bzfTMR+6qLAcc9Ge22NsWwuiYJkRQl6x3IucTf8EZfOgiwEeq+u9x7ZP7ppQTmpazOH2AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713695167; c=relaxed/simple;
	bh=bpgpk7+ewrIwWsabuUJJ+5Oa+PapJ92QF0nbdGc4MVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LeJT9+68BjKAPRL7wUX1HoSlEKjG+BGPsn9BIjIFKaG5ZvUCMtPQDuaG8+9c2GpnmIIiK3fP2DsGPRH9dDfEf8FjpSvmGdQF+tzVjI24i9ceaX71aUhr+c0gLpfwZfntaCmL4kwClM1e2lARD7wRR3VA/VyAyDi1WMb/GfmKZPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZCjfzUJl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3319C113CE;
	Sun, 21 Apr 2024 10:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713695167;
	bh=bpgpk7+ewrIwWsabuUJJ+5Oa+PapJ92QF0nbdGc4MVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZCjfzUJlaLgG/vXPfN+Y3Mv/S7Mo0EmNzjV4okryaZyuEgXxnWlmlOUt0TF7+StSk
	 lcjidM9d/IRnaEy0VcWzrE7Ib+01TaoSqPeN7xDzAY+49DXPyhEn8jxzk6BYSkUabX
	 zgnmyfbQvwo9dT+LJ0oDCzcCBv0h4yvppcwQkrLw=
Date: Sun, 21 Apr 2024 12:26:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chris Wulff <Chris.Wulff@biamp.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: gadget: f_fs: add capability for dfu run-time
 descriptor
Message-ID: <2024042153-timing-sassy-eab9@gregkh>
References: <CO1PR17MB54198D086B61F7392FA9075FE10E2@CO1PR17MB5419.namprd17.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR17MB54198D086B61F7392FA9075FE10E2@CO1PR17MB5419.namprd17.prod.outlook.com>

On Thu, Apr 18, 2024 at 08:39:03PM +0000, Chris Wulff wrote:
> From: David Sands <david.sands@biamp.com>
> 
> Add the ability for FunctionFS driver to be able to create DFU Run-Time
> descriptors.
> 
> Signed-off-by: David Sands <david.sands@biamp.com>

Why didn't you also cc: them?

> Co-developed-by: Chris Wulff <chris.wulff@biamp.com>
> Signed-off-by: Chris Wulff <chris.wulff@biamp.com>
> 
> ---
> v2: Fixed attribution and signoff
> 
>  drivers/usb/gadget/function/f_fs.c  | 11 +++++++++--
>  include/uapi/linux/usb/ch9.h        |  4 ++++
>  include/uapi/linux/usb/functionfs.h | 10 ++++++++++
>  3 files changed, 23 insertions(+), 2 deletions(-)

Does this require a Documentation/ABI/ update?

> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index bffbc1dc651f..4d39e5e30b73 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -2467,7 +2467,7 @@ typedef int (*ffs_os_desc_callback)(enum ffs_os_desc_type entity,
>  
>  static int __must_check ffs_do_single_desc(char *data, unsigned len,
>  					   ffs_entity_callback entity,
> -					   void *priv, int *current_class)
> +					   void *priv, int *current_class, int *current_subclass)
>  {
>  	struct usb_descriptor_header *_ds = (void *)data;
>  	u8 length;
> @@ -2524,6 +2524,7 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
>  		if (ds->iInterface)
>  			__entity(STRING, ds->iInterface);
>  		*current_class = ds->bInterfaceClass;
> +		*current_subclass = ds->bInterfaceSubClass;
>  	}
>  		break;
>  
> @@ -2548,6 +2549,11 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
>  			if (length != sizeof(struct ccid_descriptor))
>  				goto inv_length;
>  			break;
> +		} else if (*current_class == USB_CLASS_APP_SPEC && *current_subclass == USB_SUBCLASS_DFU) {
> +			pr_vdebug("dfu functional descriptor\n");
> +			if (length != sizeof(struct usb_dfu_functional_descriptor))
> +				goto inv_length;
> +			break;
>  		} else {
>  			pr_vdebug("unknown descriptor: %d for class %d\n",
>  			      _ds->bDescriptorType, *current_class);
> @@ -2610,6 +2616,7 @@ static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
>  	const unsigned _len = len;
>  	unsigned long num = 0;
>  	int current_class = -1;
> +	int current_subclass = -1;
>  
>  	for (;;) {
>  		int ret;
> @@ -2629,7 +2636,7 @@ static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
>  			return _len - len;
>  
>  		ret = ffs_do_single_desc(data, len, entity, priv,
> -			&current_class);
> +			&current_class, &current_subclass);
>  		if (ret < 0) {
>  			pr_debug("%s returns %d\n", __func__, ret);
>  			return ret;
> diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
> index 44d73ba8788d..dcd962d1a75a 100644
> --- a/include/uapi/linux/usb/ch9.h
> +++ b/include/uapi/linux/usb/ch9.h
> @@ -263,6 +263,9 @@ struct usb_ctrlrequest {
>  /* From the USB 3.1 spec */
>  #define	USB_DT_SSP_ISOC_ENDPOINT_COMP	0x31
>  
> +/* From USB Device Firmware Upgrade Specification, Revision 1.1 */
> +#define USB_DT_DFU_FUNCTIONAL		0x21

Why is this not in sorted order?

And it really conflicts with USB_DT_WIRE_ADAPTER?  That seems odd given
that DFU came first.  Hm, it is that value, odd.

> +
>  /* Conventional codes for class-specific descriptors.  The convention is
>   * defined in the USB "Common Class" Spec (3.11).  Individual class specs
>   * are authoritative for their usage, not the "common class" writeup.
> @@ -332,6 +335,7 @@ struct usb_device_descriptor {
>  #define USB_CLASS_VENDOR_SPEC		0xff
>  
>  #define USB_SUBCLASS_VENDOR_SPEC	0xff
> +#define USB_SUBCLASS_DFU		0x01

This should be up next to the other DFU stuff, right?  WHat about the
DFU interface type?




>  
>  /*-------------------------------------------------------------------------*/
>  
> diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/usb/functionfs.h
> index 9f88de9c3d66..cf3f55234a5e 100644
> --- a/include/uapi/linux/usb/functionfs.h
> +++ b/include/uapi/linux/usb/functionfs.h
> @@ -37,6 +37,16 @@ struct usb_endpoint_descriptor_no_audio {
>  	__u8  bInterval;
>  } __attribute__((packed));
>  
> +/* DFU Functional descriptor */
 > +struct usb_dfu_functional_descriptor {
> +	__u8  bLength;
> +	__u8  bDescriptorType;
> +	__u8  bmAttributes;

Do you need #defines for the different attribute bits that DFU wants
here?

thanks,

greg k-h

