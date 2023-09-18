Return-Path: <linux-usb+bounces-341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 522D17A5034
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 19:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C53D282403
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 17:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2924123779;
	Mon, 18 Sep 2023 17:01:11 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA80D2376A
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 17:01:07 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 529DE1BF
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 10:00:55 -0700 (PDT)
Received: (qmail 1145834 invoked by uid 1000); 18 Sep 2023 10:14:12 -0400
Date: Mon, 18 Sep 2023 10:14:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linyu Yuan <quic_linyyuan@quicinc.com>,
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v7 2/4] usb: gadget: add anonymous definition in some
 struct for trace purpose
Message-ID: <19324523-5431-4796-b770-d38526030e0d@rowland.harvard.edu>
References: <20230918112534.2108-1-quic_linyyuan@quicinc.com>
 <20230918112534.2108-3-quic_linyyuan@quicinc.com>
 <2023091831-applause-headless-8e91@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023091831-applause-headless-8e91@gregkh>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 18, 2023 at 02:06:34PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Sep 18, 2023 at 07:25:32PM +0800, Linyu Yuan wrote:
> > Some UDC trace event will save usb udc information, but it use one int
> > size buffer to save one bit information of usb udc, it waste trace buffer.
> > 
> > Add anonymous union which have u32 members can be used by trace event
> > during fast assign stage to save more entries with same trace ring buffer
> > size.
> > 
> > In order to access each bit with BIT() macro, add different definition for
> > each bit fields according host little/big endian to make sure it has same
> > eacho bit field have same bit position in memory.
> 
> typo?
> 
> > Add some macros or helper for later trace event usage which follow the
> > udc structs, As when possible future changes to udc related structs,
> > developers will easy notice them.
> 
> This isn't going to work at all, there's nothing to keep the two in
> sync.
> 
> As you are using bitmasks now, wonderful, just use those only and ignore
> the bitfield definitions, that's not going to work mixing the two at
> all.

Greg is right.  If you really want to access these fields using bitmask 
operations, you should do it by changing all of the fields into 
bitmasks; mixing bitmasks and bitfields is not a good idea.

For example, in order to do this you will have to change the definition 
of struct usb_gadget.  Replace

	unsigned			sg_supported:1;
	unsigned			is_otg:1;
	unsigned			is_a_peripheral:1;
	unsigned			b_hnp_enable:1;
	unsigned			a_hnp_support:1;
	unsigned			a_alt_hnp_support:1;
	unsigned			hnp_polling_support:1;
	unsigned			host_request_flag:1;
	unsigned			quirk_ep_out_aligned_size:1;
	unsigned			quirk_altset_not_supp:1;
	unsigned			quirk_stall_not_supp:1;
	unsigned			quirk_zlp_not_supp:1;
	unsigned			quirk_avoids_skb_reserve:1;
	unsigned			is_selfpowered:1;
	unsigned			deactivated:1;
	unsigned			connected:1;
	unsigned			lpm_capable:1;
	unsigned			wakeup_capable:1;
	unsigned			wakeup_armed:1;

with

	unsigned int			dw1;

#define USB_GADGET_SG_SUPPORTED		BIT(0)
#define USB_GADGET_IS_OTG		BIT(1)
...
#define USB_GADGET_WAKEUP_ARMED		BIT(18)

Then change all the drivers that use these fields.  For example, change

	g->connected = 1;

to

	g->dw1 |= USB_GADGET_CONNECTED;

and change

	if (g->is_selfpowered)

to

	if (g->dw1 & USB_GADGET_IS_SELFPOWERED)

Or if you prefer, invent some inline routines or macros that will handle 
this for you.

Make these changes in every gadget and UDC driver.  Then it will be 
safe to say

	__entry->dw1 = g->dw1;

in the fast assign stage.  But it's not safe to use bitfields in the 
gadget and UDC drivers while using bitmasks in the tracing code.

Alan Stern

