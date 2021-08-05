Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73733E190E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 18:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbhHEQF3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Aug 2021 12:05:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:60190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232283AbhHEQF3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Aug 2021 12:05:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAD076115B;
        Thu,  5 Aug 2021 16:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628179514;
        bh=nLm1E18+vzGOBwN9Vs69Y1D3rCNsrruBho7xr/5kPGU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R0h98N9Pz66AMWUO2JLrvRArXjZNzcdNb6SvxjDezKw0YYGzNf8huoS0rU/SaeaBt
         w0Q7LObqOphT/dcJhx3ngxEW+1tGybxStNANN7uhWfdINLwMAmpgqw0tT6NUPwMl2B
         bX0poANjhYmhpczZZiXuqq9eQK4INUeMkXDJPlN4twM9LvbsH2BDcTL5mLBa6sf1GD
         2KENN4kq87BTIzbWAABOsHNh6LP7pl7di9GsGe8leJtm+RXhxC1iCxn3G6JNaNz91l
         YAx40BGBnCEzdRrZ/sz0bSQZ+UXigVjao4pwoDMw4vgKToTmYRpsBsiXrrMOjJHWBn
         paVZi9oW1CJhA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mBfrF-0000tD-Oj; Thu, 05 Aug 2021 18:04:34 +0200
Date:   Thu, 5 Aug 2021 18:04:33 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     David Bauer <mail@david-bauer.net>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ftdi_sio: add device ID for Auto-M3 OP-COM
 v2
Message-ID: <YQwMERPkztnJkOS5@hovoldconsulting.com>
References: <20210804232522.43330-1-mail@david-bauer.net>
 <f96cd59f-f391-71d9-07a4-f5ee9d9d9afa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f96cd59f-f391-71d9-07a4-f5ee9d9d9afa@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 05, 2021 at 02:52:02PM +0300, Sergei Shtylyov wrote:
> On 05.08.2021 2:25, David Bauer wrote:
> 
> > The Auto-M§ OP-COM v2 is a OBD diagnostic device using a FTD232 for the
> 
>     M3?

I assumed so too and fixed that up when applying. Thanks.

Johan
