Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEEC31EC44
	for <lists+linux-usb@lfdr.de>; Thu, 18 Feb 2021 17:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhBRQcH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Feb 2021 11:32:07 -0500
Received: from verein.lst.de ([213.95.11.211]:48668 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230401AbhBRPJY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Feb 2021 10:09:24 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id D486D68D07; Thu, 18 Feb 2021 16:07:46 +0100 (CET)
Date:   Thu, 18 Feb 2021 16:07:46 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     hch@lst.de, Greg KH <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@redhat.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Regression: 6eb0233ec2d0 ("usb: don't inherity DMA properties
 for USB devices")
Message-ID: <20210218150746.GA18220@lst.de>
References: <ef15869a-fe87-aef2-591d-2ca909a66217@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef15869a-fe87-aef2-591d-2ca909a66217@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 18, 2021 at 03:56:00PM +0100, Thomas Zimmermann wrote:
> I only have udl devices, but I expect that other DRM USB adapters are also 
> affected.

Find where the driver calls dma_map_* itself instead of using the USB
wrappers and fix that..

