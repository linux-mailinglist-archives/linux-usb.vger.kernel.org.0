Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A7F44EB4A
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 17:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234496AbhKLQ0J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 11:26:09 -0500
Received: from netrider.rowland.org ([192.131.102.5]:51739 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230019AbhKLQ0I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 11:26:08 -0500
Received: (qmail 34848 invoked by uid 1000); 12 Nov 2021 11:23:16 -0500
Date:   Fri, 12 Nov 2021 11:23:16 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     DocMAX <mail@vacharakis.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Message-ID: <20211112162316.GC32928@rowland.harvard.edu>
References: <139f5577-4a0c-a073-6320-a2697eddadc6@vacharakis.de>
 <20211112154052.GB32928@rowland.harvard.edu>
 <c9c65f98-b766-f110-26c0-a4187fe7bb8d@vacharakis.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9c65f98-b766-f110-26c0-a4187fe7bb8d@vacharakis.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 12, 2021 at 05:04:54PM +0100, DocMAX wrote:
> It has it's own 60 watts power adapter. I doubt a usb-c port can power 4 x
> 3,5 inch hdd drives?
> 
> It's this enclosure by the way:
> https://www.fantec.de/en/products/storage-devices/ssd-hard-drive-cases/35-inch-hard-drive-cases/produkt/details/artikel/1695_fantec_qb_35us3_6g-1/

Can you please provide the output from "lsusb -v" for this device?

Alan Stern
