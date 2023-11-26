Return-Path: <linux-usb+bounces-3324-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C777F91E1
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 09:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADFCA2811FD
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 08:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E20440C;
	Sun, 26 Nov 2023 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k6mTUa+f"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3404465B
	for <linux-usb@vger.kernel.org>; Sun, 26 Nov 2023 08:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A0FC433C7;
	Sun, 26 Nov 2023 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700988812;
	bh=a2Vw5pC+M506Smzf3exbKtRTBF8TtjUVAGX2yg2sxWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6mTUa+fzZLvmsWU4IScHagZ2CySxpE3UsxZZJumH83R3uk5k9w7HwV9x9/XugcL5
	 cxDHjhxtCrZpV05earGS4HcX0HSnhV4dZZBs3yNixrBH91wQHVUT5tSXk+nom6Av5O
	 /mcYIS224aLlYm40+QU/QUbZBqiveBwlHQyE6dUo=
Date: Sun, 26 Nov 2023 08:53:30 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Ian Zurutuza <ian.zurutuza@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: device driver association
Message-ID: <2023112652-scowling-submarine-5071@gregkh>
References: <CAJrDFhpoOLNx-RX_raU4v++ZPYVShg_pmaxv0V2WfkfgcFdUGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJrDFhpoOLNx-RX_raU4v++ZPYVShg_pmaxv0V2WfkfgcFdUGg@mail.gmail.com>

On Sun, Nov 26, 2023 at 12:38:26AM -0600, Ian Zurutuza wrote:
> Hi,
> 
> I need help associating this device with the proper driver for serial
> communication. If I am barking up the wrong tree, please let me know.
> 
> I am able to open a serial port to send commands to the Epson BT-40
> moverio AR glasses after running this command `sudo modprobe -r
> cdc_acm && sudo modprobe usbserial vendor=0x04b8 product=0x0d12`.
> After I saw in the system log a message that asked me to reach out to
> this mailing list to get this device added to a proper driver.

Why did you remove the cdc_acm driver?  It should be binding to your
device and then you can communicate to it through that driver in the
proper /dev/ttyACM device node.

thanks,

greg k-h

