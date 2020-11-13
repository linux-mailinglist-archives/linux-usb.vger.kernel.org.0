Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF472B1D0A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 15:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgKMOVp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 09:21:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:56906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726278AbgKMOVp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Nov 2020 09:21:45 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D99F722240;
        Fri, 13 Nov 2020 14:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605277305;
        bh=EtX/+0tKWL4S8B5M23V5Plm19TxQP0xQrhF9/EzVH3U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Eu0OLFGP0RbonexAYTYt3NuaZ+ai2aqM3UuUp1OI3C6kqJyIacQzdOEt3jGBfIdn6
         LvbWBlxxb+rz18xWCm+LvlYhgIfFpO+/V89776xCyA99SkPeIOoOhleGZDZUoYR2+4
         gjwEL9gBixUhumn8vV8SgQ2kw5kR2FfwF46PGVyM=
Date:   Fri, 13 Nov 2020 15:22:42 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: imx21-hcd: Remove the driver
Message-ID: <X66Wskdf1pspzN2q@kroah.com>
References: <20201109210813.21382-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109210813.21382-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 09, 2020 at 06:08:13PM -0300, Fabio Estevam wrote:
> Since commit 4b563a066611 ("ARM: imx: Remove imx21 support") the imx21
> SoC is no longer supported.
> 
> Get rid of its USB driver too, which is now unused.

It's always nice to remove code, thanks for submitting this!

greg k-h
