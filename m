Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD2B225237
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jul 2020 16:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgGSOb4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jul 2020 10:31:56 -0400
Received: from netrider.rowland.org ([192.131.102.5]:49583 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725988AbgGSObz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jul 2020 10:31:55 -0400
Received: (qmail 1200211 invoked by uid 1000); 19 Jul 2020 10:31:54 -0400
Date:   Sun, 19 Jul 2020 10:31:54 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "Tj \(Elloe Linux\)" <ml.linux@elloe.vision>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: uas: bug: [sda] tag#21 uas_eh_abort_handler 0 uas-tag 6
 inflight: IN
Message-ID: <20200719143154.GA1200012@rowland.harvard.edu>
References: <9268a7b4-217e-e76d-af9a-9c5b4f6fe54a@elloe.vision>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9268a7b4-217e-e76d-af9a-9c5b4f6fe54a@elloe.vision>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 19, 2020 at 11:22:10AM +0100, Tj (Elloe Linux) wrote:
> With all kernels from 4.14 to 5.8.0-rc5 we're seeing failures with uas
> on a Turris Mox aarch64 Marvell Armada 3720 that we don't see on amd64.
> 
> The device that triggers them is:
> 
> Bus 003 Device 002: ID 152d:0562 JMicron Technology Corp. / JMicron USA
> Technology Corp.
> 
> These are USB3<>NVME adapters with 256GB NVME attached.
> 
> On advice from the Turris Mox developers we tried booting with and
> without "pci=nomsi".
> 
> We have other similar JMicron devices but they use usb-storage instead
> and work fine.
> 
> Linked below is the complete output from dmesg, lspci -vvnnk, lsusb -v
> but here's a snapshot of the error messages:

Have you tried collecting a usbmon trace?  And in particular, have you 
tried comparing it with a usbmon trace collected on the AMD64 system?

Alan Stern
