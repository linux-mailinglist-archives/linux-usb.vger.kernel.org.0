Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027FF485E3B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jan 2022 02:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344443AbiAFBtO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jan 2022 20:49:14 -0500
Received: from netrider.rowland.org ([192.131.102.5]:43583 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1344427AbiAFBtO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jan 2022 20:49:14 -0500
Received: (qmail 62117 invoked by uid 1000); 5 Jan 2022 20:49:12 -0500
Date:   Wed, 5 Jan 2022 20:49:12 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Steve Rinsler <steve.rinsler@gmail.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Differentiating hardware from software usb problem
Message-ID: <YdZKmE4sNKw4OhYJ@rowland.harvard.edu>
References: <CA+gXaa5QXkTFs+M9Tm8Q8EqmnNLHuAWoX5RELcjAH+dZZrturw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+gXaa5QXkTFs+M9Tm8Q8EqmnNLHuAWoX5RELcjAH+dZZrturw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 05, 2022 at 04:41:13PM -0500, Steve Rinsler wrote:
> Hi Dr. Stern,
> 
> I have a 4965 wlan/BT min pcie card in an older laptop (c. 2006) that when
> turned on produces a continual stream of usb device connection and
> disconnection messages.  This renders the wifi nonfunctional and eventually
> freezes many functions of the laptop.  This occurs both when using Windows
> XP (the os that the machine came with) and a Linux distro based on Debian
> Sid.

What matters is not the distro but rather the kernel version.

> I am trying to figure out whether this is a hardware or software issue.  I
> have tried many suggested software changes to block the Bluetooth
> component, but that hasn’t stopped the usb device messages.
> 
> I would like to test the hardware but have not found a guide on how to do
> this.
> 
> If you know of such, I would appreciate a reference.

You can try something like the USB20CV test program available from 
https://www.usb.org/compliancetools (assuming your card is USB-2).  
Aside from that, though, I don't know of any hardware tests that don't 
require special test equipment.

Given the circumstances you describe, it seems quite likely that you're 
dealing with a hardware problem.

> Otherwise, I would appreciate your recommendation on a site to post the
> details where I might get assistance.

The linux-usb mailing list (CC'ed) is appropriate.

> This is my oldest computer and I am primarily using it as a toy to expand
> my knowledge of Linux.
> 
> Thanks for any assistance and happy new year.

You're welcome.

Alan Stern
