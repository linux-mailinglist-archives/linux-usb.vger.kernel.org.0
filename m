Return-Path: <linux-usb+bounces-70-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BD57A08B0
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 17:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD9C11F2403A
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 15:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5371A2137C;
	Thu, 14 Sep 2023 14:54:42 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5AD210E9
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 14:54:41 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 362F11FC8
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 07:54:41 -0700 (PDT)
Received: (qmail 996460 invoked by uid 1000); 14 Sep 2023 10:54:40 -0400
Date: Thu, 14 Sep 2023 10:54:40 -0400
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
Message-ID: <073cbfb2-2f18-4bf7-a313-b16bbcefa8e0@rowland.harvard.edu>
References: <20230914100302.30274-1-quic_linyyuan@quicinc.com>
 <20230914100302.30274-3-quic_linyyuan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914100302.30274-3-quic_linyyuan@quicinc.com>

You didn't include the version number in the Subject: line.  Undoubtedly 
Greg's automatic error checker will warn you about this.  Unless the 
version number is clearly marked for each patch, it's difficult for his 
programs to tell which email message contains the most recent version.

On Thu, Sep 14, 2023 at 06:02:56PM +0800, Linyu Yuan wrote:
> Some UDC trace event will save usb udc information, but it use one int
> size buffer to save one bit information of usb udc, it is wast trace
> buffer.
> 
> Add anonymous union which have one u32 member can be used by trace event
> during fast assign stage to save more entries with same trace ring buffer
> size.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---

And you didn't include the version change information here, below the 
"---" line.

Apart from that, this is a _lot_ better than before!  I don't know if 
Greg will think this change is worth merging, but at least now it's 
possible to read the code and understand what's going on.

Alan Stern

