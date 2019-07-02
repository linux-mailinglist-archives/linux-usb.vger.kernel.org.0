Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E385D039
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 15:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfGBNKd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 09:10:33 -0400
Received: from gate.crashing.org ([63.228.1.57]:33926 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726401AbfGBNKc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 09:10:32 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x62DAMDc013985;
        Tue, 2 Jul 2019 08:10:23 -0500
Message-ID: <3cea94e3f461c44c0799c2d494b174d20895cc08.camel@kernel.crashing.org>
Subject: Re: Aspeed vhub configuration
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Felipe Balbi <balbi@kernel.org>, Greg KH <greg@kroah.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Tue, 02 Jul 2019 23:10:21 +1000
In-Reply-To: <8736jobnnb.fsf@linux.intel.com>
References: <44bb150fb8b283a3036a382fa7e821b045554c15.camel@kernel.crashing.org>
         <20190702122430.GC12019@kroah.com>
         <e90076897577e2b4d2ad864eff85406b19f88dd3.camel@kernel.crashing.org>
         <8736jobnnb.fsf@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2019-07-02 at 15:56 +0300, Felipe Balbi wrote:
> We already have an interface for disconnecting from the host
> programatically by disconnecting data pullup.
> 
> static ssize_t soft_connect_store(struct device *dev,
>                 struct device_attribute *attr, const char *buf,
> size_t n)

 .../...

I could reproduce the same interface for the vhub, at least it would
provide consistency...

The vhub itself is not an UDC device. It provides UDC devices that are
the hub "ports".

Cheers,
Ben.


