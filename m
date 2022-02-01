Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13FCB4A5FDF
	for <lists+linux-usb@lfdr.de>; Tue,  1 Feb 2022 16:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240139AbiBAPTS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Feb 2022 10:19:18 -0500
Received: from netrider.rowland.org ([192.131.102.5]:40593 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233666AbiBAPTP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Feb 2022 10:19:15 -0500
Received: (qmail 307647 invoked by uid 1000); 1 Feb 2022 10:19:14 -0500
Date:   Tue, 1 Feb 2022 10:19:14 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Brice CHATELAN <brice.chatelan@erems.fr>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Looking for usbip driver
Message-ID: <YflPcnIlqRD2MXc8@rowland.harvard.edu>
References: <20220131181200.E183645E00D0@ere-mx2.erems.fr>
 <YfgzTZFP8MXjZHgI@rowland.harvard.edu>
 <8eecaae3-e9a5-0d45-bdcd-e4b45a7bc433@erems.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eecaae3-e9a5-0d45-bdcd-e4b45a7bc433@erems.fr>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 01, 2022 at 11:52:40AM +0100, Brice CHATELAN wrote:
> Thank you for your answer,
> 
> But i hadn't expressed my request clearly.
> I have the kernel 2. 4.19 working fine since 20 years on my equipment,
> but I have to find only the complete source code of the "usbip" driver
> module for the 2.4 kernel (otherwise 2.6),

There is no usbip driver for either the 2.4 or 2.6 kernel.  usbip was 
first added to the kernel in version 3.17.

> if this driver manages correctly USB1000IP hardware. (but It seems you are
> not agree with that)

I don't know whether the usbip driver will work with USB1000IP hardware, 
but I doubt it.

Alan Stern
