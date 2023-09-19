Return-Path: <linux-usb+bounces-361-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC487A5A8B
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 09:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F2EB1C20A15
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 07:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86436358B3;
	Tue, 19 Sep 2023 07:08:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CB18471
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 07:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E349C433C7;
	Tue, 19 Sep 2023 07:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695107281;
	bh=eGr7hZPlHRJ4ZlHBB3Oawda1kxfX3xjtU7fO5wmJk7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlECpTzDTA8dnOJcQ1BgJv1VSRfFNfy4jrp/GWS0mU+Q/nh4SRpv/E+jyJ5wUZsKM
	 FQWE+P3PEYK36lylcGATAEJ+7CNdv2eANKQlTanygGvM090YuKgVTNmtPSQm8zNxQl
	 +OCDApeMfoUbFcp6Ue6WdrICJtIO5CnlHqWbwSRA=
Date: Tue, 19 Sep 2023 09:07:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linyu Yuan <quic_linyyuan@quicinc.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v7 2/4] usb: gadget: add anonymous definition in some
 struct for trace purpose
Message-ID: <2023091932-jigsaw-mooned-e7f0@gregkh>
References: <20230918112534.2108-1-quic_linyyuan@quicinc.com>
 <20230918112534.2108-3-quic_linyyuan@quicinc.com>
 <2023091831-applause-headless-8e91@gregkh>
 <19324523-5431-4796-b770-d38526030e0d@rowland.harvard.edu>
 <afaffda9-d9aa-6f88-7fad-fab7c1eead2e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afaffda9-d9aa-6f88-7fad-fab7c1eead2e@quicinc.com>

On Tue, Sep 19, 2023 at 08:01:43AM +0800, Linyu Yuan wrote:
> 
> On 9/18/2023 10:14 PM, Alan Stern wrote:
> > On Mon, Sep 18, 2023 at 02:06:34PM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Sep 18, 2023 at 07:25:32PM +0800, Linyu Yuan wrote:
> > > > Some UDC trace event will save usb udc information, but it use one int
> > > > size buffer to save one bit information of usb udc, it waste trace buffer.
> > > > 
> > > > Add anonymous union which have u32 members can be used by trace event
> > > > during fast assign stage to save more entries with same trace ring buffer
> > > > size.
> > > > 
> > > > In order to access each bit with BIT() macro, add different definition for
> > > > each bit fields according host little/big endian to make sure it has same
> > > > eacho bit field have same bit position in memory.
> > > typo?
> > > 
> > > > Add some macros or helper for later trace event usage which follow the
> > > > udc structs, As when possible future changes to udc related structs,
> > > > developers will easy notice them.
> > > This isn't going to work at all, there's nothing to keep the two in
> > > sync.
> > > 
> > > As you are using bitmasks now, wonderful, just use those only and ignore
> > > the bitfield definitions, that's not going to work mixing the two at
> > > all.
> > Greg is right.  If you really want to access these fields using bitmask
> > operations, you should do it by changing all of the fields into
> > bitmasks; mixing bitmasks and bitfields is not a good idea.
> > 
> > For example, in order to do this you will have to change the definition
> > of struct usb_gadget.  Replace
> > 
> > 	unsigned			sg_supported:1;
> > 	unsigned			is_otg:1;
> > 	unsigned			is_a_peripheral:1;
> > 	unsigned			b_hnp_enable:1;
> > 	unsigned			a_hnp_support:1;
> > 	unsigned			a_alt_hnp_support:1;
> > 	unsigned			hnp_polling_support:1;
> > 	unsigned			host_request_flag:1;
> > 	unsigned			quirk_ep_out_aligned_size:1;
> > 	unsigned			quirk_altset_not_supp:1;
> > 	unsigned			quirk_stall_not_supp:1;
> > 	unsigned			quirk_zlp_not_supp:1;
> > 	unsigned			quirk_avoids_skb_reserve:1;
> > 	unsigned			is_selfpowered:1;
> > 	unsigned			deactivated:1;
> > 	unsigned			connected:1;
> > 	unsigned			lpm_capable:1;
> > 	unsigned			wakeup_capable:1;
> > 	unsigned			wakeup_armed:1;
> > 
> > with
> > 
> > 	unsigned int			dw1;
> > 
> > #define USB_GADGET_SG_SUPPORTED		BIT(0)
> > #define USB_GADGET_IS_OTG		BIT(1)
> > ...
> > #define USB_GADGET_WAKEUP_ARMED		BIT(18)
> > 
> > Then change all the drivers that use these fields.  For example, change
> > 
> > 	g->connected = 1;
> > 
> > to
> > 
> > 	g->dw1 |= USB_GADGET_CONNECTED;
> > 
> > and change
> > 
> > 	if (g->is_selfpowered)
> > 
> > to
> > 
> > 	if (g->dw1 & USB_GADGET_IS_SELFPOWERED)
> > 
> > Or if you prefer, invent some inline routines or macros that will handle
> > this for you.
> 
> 
> it is a lot of changes. i only expect  common and minimal
> change(macros/helpers) in gadget.h.

Why?

> if you have better idea, please help share a patch.

Alan is right here, please just take the time to do this properly, after
documenting exactly how much time/space is going to be saved here, I
don't seem to see that anywhere in your patch sets so I still do not
understand why this patch set was created in the first place.

thanks,

greg k-h

