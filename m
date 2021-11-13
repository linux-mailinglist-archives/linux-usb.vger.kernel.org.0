Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABF644F406
	for <lists+linux-usb@lfdr.de>; Sat, 13 Nov 2021 16:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhKMPth (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Nov 2021 10:49:37 -0500
Received: from netrider.rowland.org ([192.131.102.5]:47837 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230001AbhKMPth (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Nov 2021 10:49:37 -0500
Received: (qmail 58784 invoked by uid 1000); 13 Nov 2021 10:46:44 -0500
Date:   Sat, 13 Nov 2021 10:46:44 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     DocMAX <mail@vacharakis.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Message-ID: <20211113154644.GC58521@rowland.harvard.edu>
References: <139f5577-4a0c-a073-6320-a2697eddadc6@vacharakis.de>
 <20211112154052.GB32928@rowland.harvard.edu>
 <c9c65f98-b766-f110-26c0-a4187fe7bb8d@vacharakis.de>
 <20211112162316.GC32928@rowland.harvard.edu>
 <bfc48a4a-9648-dee8-20b0-dadfafa508e7@vacharakis.de>
 <20211112175150.GA37212@rowland.harvard.edu>
 <31548846-8ff4-9297-10b3-4f543ee0a5e0@vacharakis.de>
 <20211112204957.GA39387@rowland.harvard.edu>
 <143be825-7480-db76-46c4-e5e0d332e98a@vacharakis.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <143be825-7480-db76-46c4-e5e0d332e98a@vacharakis.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 12, 2021 at 09:57:47PM +0100, DocMAX wrote:
> So the problem is the device, not a driver issue? Wasn't aware of this. Then
> do what has to be done. Thanks.

Can you verify that the patch does fix the problem?

> I read of lots of UAS issues with other hardware. Can someone recomment a
> chipset which works rocket solid on linux with uas?
> I don't want to do without UAS.

I don't know of one, offhand, but there are plenty of them around.  Lots 
of people have drives using UAS that work just fine.

Alan Stern
