Return-Path: <linux-usb+bounces-1477-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866307C57A0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 17:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EF38282548
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 15:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16C61F5E1;
	Wed, 11 Oct 2023 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2474200C8
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 15:00:35 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id CE62C9D
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 08:00:33 -0700 (PDT)
Received: (qmail 226515 invoked by uid 1000); 11 Oct 2023 11:00:33 -0400
Date: Wed, 11 Oct 2023 11:00:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Douglas Gilbert <dgilbert@interlog.com>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: device present in lsusb, disappears in lsusb -t
Message-ID: <299d927f-7044-4d48-b6cd-c05bdb0e7fcc@rowland.harvard.edu>
References: <70c563f1-847c-32a1-cf4d-6bf9802017ab@interlog.com>
 <2023091638-duration-barcode-73a3@gregkh>
 <11b1687f-3419-4037-845e-ef33d4e3871f@interlog.com>
 <2023101139-puma-fanfare-8a0e@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101139-puma-fanfare-8a0e@gregkh>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 11, 2023 at 11:30:39AM +0200, Greg KH wrote:
> On Thu, Oct 05, 2023 at 10:49:10PM -0400, Douglas Gilbert wrote:
> > The code in lsusb-t.c seems to assign a special meaning to "-1" devices
> > and there is only one of those: "5-1". And the device associated with
> > "5-1" is the one that does _not_ appear in the output of 'lsusb -t' but
> > does appear in the output of 'lsusb'.
> 
> The code patch of the '-t' option in lsusb is totally separate and apart
> from the "normal" portion of lsusb, as you note, it is a separate .c
> file as well.  -t uses the sysfs representation of the USB devices,
> while the other code path uses the 'libusb' representation of the USB
> devices.  And those seem to differ here (as they do for everyone.)
> 
> So if someone wants to take the time to figure out which representation
> is "more correct", that would be great.  I don't have the bandwidth to
> do so for the next few weeks due to travel requirements on my end,
> sorry.

Doug, I've looked through the source code in lsusb-t.c (usbutils 015) 
and I didn't notice any place where it treats device names containing 
"-1" specially.  Can you point it out?

Also, if I suggested some debugging additions to the source file, would 
you be able to build them and test the result?

Alan Stern

