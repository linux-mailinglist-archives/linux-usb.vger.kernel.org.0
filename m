Return-Path: <linux-usb+bounces-2133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E5D7D56D4
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 17:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9028D281A6D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 15:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F394037CBF;
	Tue, 24 Oct 2023 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zc+9Xqnz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E0C1D6A9
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 15:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4621DC433C8;
	Tue, 24 Oct 2023 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698162343;
	bh=OwCxtPQ+z0MdwHi7seYQAGchK7270NewGnlvtxqCa/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zc+9XqnzcMLfCLcSEemS5g8T472F71zf4Qy6HVN+g0LSZ2K6JyhsxEoJLOJxltTfS
	 jh2+EY78icHApVMgoVpSCvDKB+Mf6ijjEtWn5GYBsp/bU5aMvc1NqGAGzoQM5AMC54
	 KS9rxeRJ/f+n/NjXsK6Qj8an2W2A0eXewS9ZV4gQ=
Date: Tue, 24 Oct 2023 17:45:40 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: "Li, Meng" <Meng.Li@windriver.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"usb-storage@lists.one-eyed-alien.net" <usb-storage@lists.one-eyed-alien.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: storage: add shutdown function for usb storage
 driver
Message-ID: <2023102428-zit-quickness-9b73@gregkh>
References: <20231023054111.2744872-1-Meng.Li@windriver.com>
 <33bd0779-bfe7-4c87-8fe6-ea8455df3b6b@rowland.harvard.edu>
 <PH0PR11MB51918DD50651DB6BE937BEA3F1DFA@PH0PR11MB5191.namprd11.prod.outlook.com>
 <3fe5b43c-a5aa-4c6a-8614-03a4d9dd53e2@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fe5b43c-a5aa-4c6a-8614-03a4d9dd53e2@rowland.harvard.edu>

On Tue, Oct 24, 2023 at 11:35:19AM -0400, Alan Stern wrote:
> On Tue, Oct 24, 2023 at 03:43:56AM +0000, Li, Meng wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Alan Stern <stern@rowland.harvard.edu>
> 
> > > On Mon, Oct 23, 2023 at 01:41:11PM +0800, Meng Li wrote:
> > > > On ls1043/ls1046 rdb platform, if a PCIe-USB host controller is
> > > > installed, and an USB disk is also installed on the PCIe card, when
> > > > executing "reboot -f" to reset the board, there will be below error reported:
> > > > usb 2-2: device not accepting address 2, error -108
> 
> > > > This issue is introduced by linux-yocto commit 837547b64a34("driver: net:
> > > > dpaa: release resource when executing kexec") that cause to spend more
> > > > time on shutdown operation. So, the 2 platforms with DPAA are not
> > > > reset immediately after executing force reboot command. Moreover, the
> > > > usb-storage thread is still in active status, there is still control
> > > > data transferred between USB disk and PCIe host controller. But now
> > > > the shutdown callback of usb pci driver had been invoked to stop the
> > > > PCIe host controller completely. In this situation, the data transferring failed
> > > and report error.
> > > 
> > > That's _supposed_ to happen.  By design, the "reboot -f" command is meant
> > > to carry out an immediate reboot, without using the init system, unmounting
> > > filesystems, or doing other cleanup operations.
> > > 
> > 
> > As my above said, I understand what you mean. I also thought over what you said.
> > I am not sure, but I still sent patch to upstream community, and want to get some suggest from more authoritative maintainer.
> > 
> > > If you want a clean reboot with no errors, don't use the "-f" option.
> > > 
> > 
> > There is also error report even if I use command "reboot"
> 
> Okay, that's a different matter.  In fact, I don't know what is supposed 
> to happen during a clean reboot.

Define "clean" :)

reboot is a system thing that happens before the reboot syscall happens.
So which are we talking nabout here?

> Greg, do you know?  Should we take the time to disconnect all the USB 
> devices during a system shutdown?

In the past we have not.  And if we switch to do so, we might get some
complaints as we would now delaying the shutdown process to be longer
than before.

> What happens with non-USB disk drives?  Or other removable devices?

It would have to come from "above" in the device tree, so does the PCI
or platform bus say that they should be shut down and their child
devices?

thanks,

greg k-h

