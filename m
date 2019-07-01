Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A70D59402
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 08:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfF1GGx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 02:06:53 -0400
Received: from verein.lst.de ([213.95.11.210]:45318 "EHLO newverein.lst.de"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726553AbfF1GGx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Jun 2019 02:06:53 -0400
X-Greylist: delayed 545 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Jun 2019 02:06:53 EDT
Received: by newverein.lst.de (Postfix, from userid 2407)
        id C2EC168CF0; Fri, 28 Jun 2019 07:57:45 +0200 (CEST)
Date:   Fri, 28 Jun 2019 07:57:45 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Fredrik Noring <noring@nocrew.org>
Cc:     Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>,
        laurentiu.tudor@nxp.com, stern@rowland.harvard.edu,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marex@denx.de, leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, JuergenUrban@gmx.de
Subject: Re: [PATCH 1/2] lib/genalloc.c: Add algorithm, align and zeroed
 family of DMA allocators
Message-ID: <20190628055745.GA27407@lst.de>
References: <20190611190343.GA18459@roeck-us.net> <20190613134033.GA2489@sx9> <bdfd2178-9e3c-dc15-6aa1-ec1f1fbcb191@roeck-us.net> <20190613153414.GA909@sx9> <3f2164cd-7655-b7cc-ec57-d8751886728c@roeck-us.net> <20190614142816.GA2574@sx9> <20190624063515.GA3296@lst.de> <20190624125916.GA2516@sx9> <20190625060000.GA28986@lst.de> <20190625150558.GA2560@sx9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625150558.GA2560@sx9>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks,

I've added both patches to the dma-mapping for-next tree.
