Return-Path: <linux-usb+bounces-154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5210B7A2091
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 16:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CB4C2822D0
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 14:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237C41118B;
	Fri, 15 Sep 2023 14:13:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4573A107A3
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 14:13:22 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 990571FC9
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 07:13:20 -0700 (PDT)
Received: (qmail 1038681 invoked by uid 1000); 15 Sep 2023 10:13:19 -0400
Date: Fri, 15 Sep 2023 10:13:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Linyu Yuan <quic_linyyuan@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 0/3] usb: gadget: reduce usb gadget trace event buffer
 usage
Message-ID: <8aaa70cd-0f21-47e2-bb96-a1d452611365@rowland.harvard.edu>
References: <20230915052716.28540-1-quic_linyyuan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915052716.28540-1-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 15, 2023 at 01:27:13PM +0800, Linyu Yuan wrote:
> some trace event use an interger to to save a bit field info of gadget,
> also some trace save endpoint name in string forat, it all can be
> chagned to other way at trace event store phase.
> 
> bit field can be replace with a union interger member which include
> multiple bit fields.
> 
> ep name stringe can be replace to a interger which contaion number
> and dir info.
> 
> in order to avoid big endian issue, save interger data into ring
> buffer in __le32 format.

This won't do what you want.  cpu_to_le32() puts the _bytes_ in order 
from least significant to most significant.  But what you want is to put 
the _bits_ in order.

For example, suppose sg_supported ends up sitting in BIT(31) and it is 
the only flag set.  The value of g->dw1 would be 0x80000000.  Then 
cpu_to_le32(g->dw1) would be 0x00000080, not 0x00000001.

You should do what I wrote earlier:

	__entry->dw1 = (g->sg_supported << 0) |
			(g->is_otg << 1) |
			...

Alan Stern

