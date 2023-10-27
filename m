Return-Path: <linux-usb+bounces-2287-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 509DE7D9BF3
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 16:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5411B2134F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 14:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E331EB20;
	Fri, 27 Oct 2023 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D78817990
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 14:45:51 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id CFDBB10E
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 07:45:48 -0700 (PDT)
Received: (qmail 570588 invoked by uid 1000); 27 Oct 2023 10:45:47 -0400
Date: Fri, 27 Oct 2023 10:45:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
  linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
  erosca@de.adit-jv.com
Subject: Re: [PATCH v6] usb: Reduce the 'SET_ADDRESS' request timeout with a
 new quirk
Message-ID: <ce31d930-b247-49d1-8bda-9fb533d4da41@rowland.harvard.edu>
References: <20231025164019.GA121292@vmlxhi-118.adit-jv.com>
 <20231026101551.36551-1-hgajjar@de.adit-jv.com>
 <55a00749-7b9d-4fc8-a470-6eabdb93216f@rowland.harvard.edu>
 <20231027095708.GA78934@vmlxhi-118.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027095708.GA78934@vmlxhi-118.adit-jv.com>

On Fri, Oct 27, 2023 at 11:57:35AM +0200, Hardik Gajjar wrote:
> On Thu, Oct 26, 2023 at 02:34:22PM -0400, Alan Stern wrote:
> > As remarked earlier, we don't need to have the "_MS" suffix on either 
> > the macro name or the "timeout_ms" variable name.  Removing the suffix 
> > will be more consistent with the USB_TP_TRANSMISSION_DELAY_MAX and 
> > USB_PING_RESPONSE_TIME names you see above.
> 
> I understand the suffix _MS in macro but the suffix is variable name was
> added after the comment about timeout unit from Greg in patchV2.
> 
> https://marc.info/?l=linux-usb&m=169687322126192&w=2

Greg merely wanted you to document what the timeout units are.  You can 
do this either by adding a "_ms" suffix to the variable name or by 
mentioning it in a comment.  For example:

+	unsigned int timeout = USB_CTRL_SET_TIMEOUT;	/* ms */

Alan Stern

