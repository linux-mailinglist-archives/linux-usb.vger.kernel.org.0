Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1959D2BEEC
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2019 07:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfE1F64 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 May 2019 01:58:56 -0400
Received: from verein.lst.de ([213.95.11.211]:44892 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbfE1F64 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 May 2019 01:58:56 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 4AAA668AA6; Tue, 28 May 2019 07:58:31 +0200 (CEST)
Date:   Tue, 28 May 2019 07:58:31 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Christoph Hellwig <hch@lst.de>, laurentiu.tudor@nxp.com,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        marex@denx.de, leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, noring@nocrew.org, JuergenUrban@gmx.de
Subject: Re: [PATCH v6 0/5] prerequisites for device reserved local mem
 rework
Message-ID: <20190528055831.GA11279@lst.de>
References: <20190522142748.10078-1-laurentiu.tudor@nxp.com> <20190523065602.GA11928@lst.de> <20190523070755.GA23832@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523070755.GA23832@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 23, 2019 at 09:07:55AM +0200, Greg KH wrote:
> I have no objection for you just taking this whole series as-is, no need
> to worry about merge conflicts with the USB tree, I doubt anything will
> be touching this area of code anytime soon.
> 
> So if you want to take it now, feel free to add:
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Given that I'll pull it in, shouldn't this be a Reviewed-by or Acked-by?
