Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C30911A0EAE
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2020 15:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbgDGNxo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Apr 2020 09:53:44 -0400
Received: from netrider.rowland.org ([192.131.102.5]:44739 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728596AbgDGNxo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Apr 2020 09:53:44 -0400
Received: (qmail 20535 invoked by uid 500); 7 Apr 2020 09:53:43 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Apr 2020 09:53:43 -0400
Date:   Tue, 7 Apr 2020 09:53:43 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     John Donnelly <john.p.donnelly@oracle.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: ehci-pci : WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34
In-Reply-To: <B2B359CC-66BA-476E-84C3-3D1F1A4B411C@oracle.com>
Message-ID: <Pine.LNX.4.44L0.2004070952350.19272-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 7 Apr 2020, John Donnelly wrote:

> Issue resolved - see below .

> This issue has been resolved in 5.6.0.rc1 ( and 5.6.0.rc6 ) with commit :
> 
> 9235cb13d7d1 iommu/vt-d: Allow devices with RMRRs to use identity domain
> 
> When I applied this to 5.4.17 release I get the iLO USB hub properly enumerated and
> the corresponding keyboard and mouse  ( when iommu=pt ) 

Okay, congratulations!

Alan Stern

