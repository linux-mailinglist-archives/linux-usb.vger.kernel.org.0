Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9367196712
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2020 16:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgC1Phb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Mar 2020 11:37:31 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47179 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726403AbgC1Phb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Mar 2020 11:37:31 -0400
Received: (qmail 1783 invoked by uid 500); 28 Mar 2020 11:37:30 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 28 Mar 2020 11:37:30 -0400
Date:   Sat, 28 Mar 2020 11:37:30 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     John Donnelly <john.p.donnelly@oracle.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: ehci-pci :   WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34
In-Reply-To: <F5A0CCCB-4503-40B1-A24D-323F5B89C1F4@oracle.com>
Message-ID: <Pine.LNX.4.44L0.2003281135130.1088-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 27 Mar 2020, John Donnelly wrote:

> Hi,
> 
> I am seeing this WARNING event with iommu=off when booting a DL380
> server with a 5.4.17 kernel.

...

> The end result is this USB port is not configured when
> dma_direct_map_page() is called and it returns return
> DMA_MAPPING_ERROR;
> 
> 
> When I boot the server with iommu=on I don’t see  this sequence :

...

> On an older kernel  5.3. flavor I am not seeing this behavior, and the usbhib devices  appear as expected :

I forgot to mention: Since you have one kernel where the WARNING occurs 
and one where it doesn't, you can use bisection to find the commit that 
was responsible for the change in behavior.  If you care to go to the 
trouble...

Alan Stern

