Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B5C72849
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 08:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfGXGco (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 02:32:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:40478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726328AbfGXGcj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jul 2019 02:32:39 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88DDF229ED;
        Wed, 24 Jul 2019 06:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563949959;
        bh=27Td1ZMtxQkiU/cgKpvfDQ3j+wBSpfabK2m3SnS5wrs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DYMnNSatrgDd3RdAnQNjLaLaFVgBBYbiiT1A/7TfmvXhaQ0Jy1RBejWrCoPCqVKzw
         ZF4YYumYwtmcogzsTDAfumXYTj5ES7+W1P8aK8EliA8320aztyW2nDmC9AAIEabXc4
         QwpoMMhJseexOtTZquIzdKkeA2g31geyH5lbFu8U=
Date:   Wed, 24 Jul 2019 08:32:36 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Frank Bergmann <frank.bergmann@project-open.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: High-Impact: xhci_hid - "Not enough bandwidth for new device
 state"
Message-ID: <20190724063236.GA20840@kroah.com>
References: <27f21154-659d-67b5-ac90-b931695614c8@project-open.com>
 <20190723124457.GB5356@kroah.com>
 <41433e67-2496-97a5-a233-8026f13dfaba@project-open.com>
 <20190723132419.GA4848@kroah.com>
 <85fa403c-4e46-c0eb-d594-6d859f9cb5af@project-open.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85fa403c-4e46-c0eb-d594-6d859f9cb5af@project-open.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 23, 2019 at 04:27:51PM +0200, Frank Bergmann wrote:
> > configuration of your devices and root hubs
> 
> 
> I've got a brand new Dell XPX 15 9370 Laptop. No other USB hubs, devices, no
> change to any configuration. I chose the model because it is supposed to be
> the same that Linus Torvalds uses (well, XPS 13...)

I too have the XPS 13, and it is very different from the XPX 15 last I
looked, so I do not think you can compare the two, sorry.

The debugging information that Alan asked for should help here.

thanks,

greg k-h
