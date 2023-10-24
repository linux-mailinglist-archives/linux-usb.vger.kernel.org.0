Return-Path: <linux-usb+bounces-2131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1783A7D5695
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 17:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488821C20C16
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 15:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C09E374D6;
	Tue, 24 Oct 2023 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3403717B
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 15:35:23 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 0C438171E
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 08:35:19 -0700 (PDT)
Received: (qmail 461087 invoked by uid 1000); 24 Oct 2023 11:35:19 -0400
Date: Tue, 24 Oct 2023 11:35:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Li, Meng" <Meng.Li@windriver.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  "usb-storage@lists.one-eyed-alien.net" <usb-storage@lists.one-eyed-alien.net>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: storage: add shutdown function for usb storage
 driver
Message-ID: <3fe5b43c-a5aa-4c6a-8614-03a4d9dd53e2@rowland.harvard.edu>
References: <20231023054111.2744872-1-Meng.Li@windriver.com>
 <33bd0779-bfe7-4c87-8fe6-ea8455df3b6b@rowland.harvard.edu>
 <PH0PR11MB51918DD50651DB6BE937BEA3F1DFA@PH0PR11MB5191.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB51918DD50651DB6BE937BEA3F1DFA@PH0PR11MB5191.namprd11.prod.outlook.com>

On Tue, Oct 24, 2023 at 03:43:56AM +0000, Li, Meng wrote:
> 
> 
> > -----Original Message-----
> > From: Alan Stern <stern@rowland.harvard.edu>

> > On Mon, Oct 23, 2023 at 01:41:11PM +0800, Meng Li wrote:
> > > On ls1043/ls1046 rdb platform, if a PCIe-USB host controller is
> > > installed, and an USB disk is also installed on the PCIe card, when
> > > executing "reboot -f" to reset the board, there will be below error reported:
> > > usb 2-2: device not accepting address 2, error -108

> > > This issue is introduced by linux-yocto commit 837547b64a34("driver: net:
> > > dpaa: release resource when executing kexec") that cause to spend more
> > > time on shutdown operation. So, the 2 platforms with DPAA are not
> > > reset immediately after executing force reboot command. Moreover, the
> > > usb-storage thread is still in active status, there is still control
> > > data transferred between USB disk and PCIe host controller. But now
> > > the shutdown callback of usb pci driver had been invoked to stop the
> > > PCIe host controller completely. In this situation, the data transferring failed
> > and report error.
> > 
> > That's _supposed_ to happen.  By design, the "reboot -f" command is meant
> > to carry out an immediate reboot, without using the init system, unmounting
> > filesystems, or doing other cleanup operations.
> > 
> 
> As my above said, I understand what you mean. I also thought over what you said.
> I am not sure, but I still sent patch to upstream community, and want to get some suggest from more authoritative maintainer.
> 
> > If you want a clean reboot with no errors, don't use the "-f" option.
> > 
> 
> There is also error report even if I use command "reboot"

Okay, that's a different matter.  In fact, I don't know what is supposed 
to happen during a clean reboot.

Greg, do you know?  Should we take the time to disconnect all the USB 
devices during a system shutdown?  What happens with non-USB disk 
drives?  Or other removable devices?

Alan Stern

