Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0D1BA1C60
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 16:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfH2OIx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 10:08:53 -0400
Received: from verein.lst.de ([213.95.11.211]:46554 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbfH2OIx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Aug 2019 10:08:53 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 04EAF68B20; Thu, 29 Aug 2019 16:08:50 +0200 (CEST)
Date:   Thu, 29 Aug 2019 16:08:49 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>,
        linux-block@vger.kernel.org,
        Kernel development list <linux-kernel@vger.kernel.org>
Subject: Re: reeze while write on external usb 3.0 hard disk [Bug 204095]
Message-ID: <20190829140849.GA18387@lst.de>
References: <20190817095422.GA4200@lazy.lzy> <Pine.LNX.4.44L0.1908191009490.1506-100000@iolanthe.rowland.org> <20190820072326.GD28968@lst.de> <20190820163722.GA2991@lazy.lzy> <20190826173833.GA4166@lazy.lzy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826173833.GA4166@lazy.lzy>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 26, 2019 at 07:38:33PM +0200, Piergiorgio Sartor wrote:
> any news on this?

Sorry, I've been dropping the ball here, and I'm a little puzzled
on what is going on.  Including on why we are bounce buffering for
xhci at all.  What kind of system (CPU / mainboard) is this?
