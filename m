Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 071A723310A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 13:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgG3Lf0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 07:35:26 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:17143 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgG3Lf0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 07:35:26 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1F8EA240002;
        Thu, 30 Jul 2020 11:35:21 +0000 (UTC)
Date:   Thu, 30 Jul 2020 13:35:21 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Trevor Woerner <twoerner@gmail.com>, jamesg@zaltys.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-nxp: add support for stotg04 phy
Message-ID: <20200730113521.GC3679@piout.net>
References: <20200729172829.GA3679@piout.net>
 <20200729174918.321615-1-alexandre.belloni@bootlin.com>
 <b5389371-3d47-f046-4d34-3d329276cb35@gmail.com>
 <20200730064303.GA3909742@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730064303.GA3909742@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30/07/2020 08:43:03+0200, Greg KH wrote:
> > 
> > > +	s32 vendor, product;
> > > +
> > > +	vendor = i2c_smbus_read_word_data(isp1301_i2c_client, 0x00);
> > > +	product = i2c_smbus_read_word_data(isp1301_i2c_client, 0x02);
> 
> Why are these signed 32bit numbers?  Shouldn't they be unsigned?

Because i2c_smbus_read_word_data returns an s32 and should be checked
for errors but because the whole driver is never checking, I'll leave
that as an exercise for outreachy interns.

> > > +
> > > +	if (vendor == 0x0483 && product == 0xa0c4)
> 
> No endian flips anywhere?
> 

The whole driver makes the assumption that it will only run on lpc32xx
with an isp1301. I don't believe we will ever see an other platform
using it.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
