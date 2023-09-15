Return-Path: <linux-usb+bounces-104-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A47A134B
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 03:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 628441C20A17
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 01:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A4B81F;
	Fri, 15 Sep 2023 01:51:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE94B808
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 01:51:21 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id B3FBE7D8C
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 18:51:20 -0700 (PDT)
Received: (qmail 1019565 invoked by uid 1000); 14 Sep 2023 21:51:19 -0400
Date: Thu, 14 Sep 2023 21:51:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Linyu Yuan <quic_linyyuan@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
  Chunfeng Yun <chunfeng.yun@mediatek.com>, Bin Liu <b-liu@ti.com>,
  Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
  Roger Quadros <rogerq@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
  Masami Hiramatsu <mhiramat@kernel.org>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
  linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] usb: gadget: add anonymous definition in some struct
 for trace purpose
Message-ID: <eae2be47-f489-4f1b-91c7-f2f81304bfdb@rowland.harvard.edu>
References: <20230914100302.30274-1-quic_linyyuan@quicinc.com>
 <20230914100302.30274-3-quic_linyyuan@quicinc.com>
 <073cbfb2-2f18-4bf7-a313-b16bbcefa8e0@rowland.harvard.edu>
 <0c2ba115-826e-40d6-73ac-7ed67302c8eb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c2ba115-826e-40d6-73ac-7ed67302c8eb@quicinc.com>

On Fri, Sep 15, 2023 at 09:02:48AM +0800, Linyu Yuan wrote:
> 
> On 9/14/2023 10:54 PM, Alan Stern wrote:
> > You didn't include the version number in the Subject: line.  Undoubtedly
> > Greg's automatic error checker will warn you about this.  Unless the
> > version number is clearly marked for each patch, it's difficult for his
> > programs to tell which email message contains the most recent version.
> > 
> > On Thu, Sep 14, 2023 at 06:02:56PM +0800, Linyu Yuan wrote:
> > > Some UDC trace event will save usb udc information, but it use one int
> > > size buffer to save one bit information of usb udc, it is wast trace
> > > buffer.
> > > 
> > > Add anonymous union which have one u32 member can be used by trace event
> > > during fast assign stage to save more entries with same trace ring buffer
> > > size.
> > > 
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > ---
> > And you didn't include the version change information here, below the
> > "---" line.
> > 
> > Apart from that, this is a _lot_ better than before!  I don't know if
> > Greg will think this change is worth merging, but at least now it's
> > possible to read the code and understand what's going on.
> 
> 
> according Steven's comment, maybe will always save data in little endian at
> trace event
> 
> fast assign stage.
> 
> it will add definition of bit field back.

Yes, that would be even better because you wouldn't have to change the 
definition of struct usb_gadget or struct usb_endpoint at all.  The fast 
assign stage can simply do:

	__entry->dw1 = (g->sg_supported << 0) |
			(g->is_otg << 1) |
			...

and then you can easily access the individual bits in __entry.  It 
wouldn't be as fast but it would still save a lot of space.

Alan Stern

