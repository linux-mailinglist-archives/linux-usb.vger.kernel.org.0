Return-Path: <linux-usb+bounces-2179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 139E07D6F9B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 16:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 443081C20E5A
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 14:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C646C28DC4;
	Wed, 25 Oct 2023 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253331A58E
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 14:44:43 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 87625DC
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 07:44:42 -0700 (PDT)
Received: (qmail 496317 invoked by uid 1000); 25 Oct 2023 10:44:41 -0400
Date: Wed, 25 Oct 2023 10:44:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
  linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
  erosca@de.adit-jv.com
Subject: Re: [PATCH v5] usb: Reduce 'set_address' command timeout with a new
 quirk
Message-ID: <2345e113-71cd-4cf2-b910-45dd1bca3f13@rowland.harvard.edu>
References: <de2ed64a-363a-464c-95be-584ce1a7a4ad@rowland.harvard.edu>
 <20231025141316.117514-1-hgajjar@de.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025141316.117514-1-hgajjar@de.adit-jv.com>

On Wed, Oct 25, 2023 at 04:13:16PM +0200, Hardik Gajjar wrote:
> This patch introduces a new USB quirk, USB_QUIRK_SHORT_DEVICE_ADDR_TIMEOUT,
> which modifies the timeout value for the 'set_address' command. The
> standard timeout for this command is 5000 ms, as recommended in the USB
> 3.2 specification (section 9.2.6.1).
> 
> However, certain scenarios, such as connecting devices through an APTIV hub,
> can lead to timeout errors when the device enumerates as full speed initially
> and later switches to high speed during chirp negotiation.
> 
> In such cases, USB analyzer logs reveal that the bus suspends for 5 seconds
> due to incorrect chirp parsing and resumes only after two consecutive
> timeout errors trigger a hub driver reset.
> 
> Packet(54) Dir(?) Full Speed J(997.100 us) Idle(  2.850 us)
> _______| Time Stamp(28 . 105 910 682)
> _______|_________________________________________________________________Ch0
> Packet(55) Dir(?) Full Speed J(997.118 us) Idle(  2.850 us)
> _______| Time Stamp(28 . 106 910 632)
> _______|_________________________________________________________________Ch0
> Packet(56) Dir(?) Full Speed J(399.650 us) Idle(222.582 us)
> _______| Time Stamp(28 . 107 910 600)
> _______|_________________________________________________________________Ch0
> Packet(57) Dir Chirp J( 23.955 ms) Idle(115.169 ms)
> _______| Time Stamp(28 . 108 532 832)
> _______|_________________________________________________________________Ch0
> Packet(58) Dir(?) Full Speed J (Suspend)( 5.347 sec) Idle(  5.366 us)
> _______| Time Stamp(28 . 247 657 600)
> _______|_________________________________________________________________Ch0
> 
> This 5-second delay in device enumeration is undesirable, particularly in
> automotive applications where quick enumeration is crucial
> (ideally within 3 seconds).
> 
> The newly introduced quirks provide the flexibility to align with a
> 3-second time limit, as required in specific contexts like automotive
> applications.
> 
> By reducing the 'set_address' command timeout to 500 ms, the
> system can respond more swiftly to errors, initiate rapid recovery, and
> ensure efficient device enumeration. This change is vital for scenarios
> where rapid smartphone enumeration and screen projection are essential.
> To use the quirk, please write "vendor_id:product_id:p" to
> /sys/bus/usb/drivers/hub/module/parameter/quirks
> 
> For example,
> echo "0x2c48:0x0132:p" > /sys/bus/usb/drivers/hub/module/parameter/quirks"
> 
> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> ---

> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 0a1731a0f0ef..3c03f23bd5d5 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6817,6 +6817,9 @@
>  					pause after every control message);
>  				o = USB_QUIRK_HUB_SLOW_RESET (Hub needs extra
>  					delay after resetting its port);
> +				p = USB_QUIRK_SHORT_DEVICE_ADDR_TIMEOUT (Timeout
> +					of set_address command reducing from
> +					5000 ms to 500 ms)

As a matter of grammatical style, it would be better to rephrase this as:

	Reduce timeout of set_address command from 5000 ms to 500 ms

Apart from that one little nit, for the usbcore portions of the patch:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

