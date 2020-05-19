Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22331D96BC
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 14:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgESMyD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 08:54:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:47670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726169AbgESMyD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 May 2020 08:54:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7356E2081A;
        Tue, 19 May 2020 12:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589892842;
        bh=v0xajYSa5l3lB+zy1YykxNt0Lf99pTWzRwzHhEAnwq8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oEmyiLtT4w5ukqDhd79M1G6HbLqfi+CD7H3Vx6b5ObjSdLq03Cw1DN2r2RSQEMoDM
         cdM8avLMcihCCG4kvwCjJP5XPYxbqR+jeGV2r72QkHqcyeOdKJ1glQ6cQIAKfXLTPG
         +guhOAHZ5VkyQNCOqZTjDO7d/uPZvBu1k7KBDimo=
Date:   Tue, 19 May 2020 14:54:00 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM strange chars appearing at connect
Message-ID: <20200519125400.GA410029@kroah.com>
References: <52b8c126634058e3a455dc0ab8b0c542916db543.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52b8c126634058e3a455dc0ab8b0c542916db543.camel@infinera.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 19, 2020 at 12:14:55PM +0000, Joakim Tjernlund wrote:
> Whenever we connect a Linux laptop(4.19.118) to our ttyACM serial gadget we can see som strange
> chars appearing in our gadget:
> 03�`3�03�x�x(in hex: 3033 efbf bd60 33ef bfbd 3033 efbf bd78 efbf bd78)
> They appear witch c.a 1 sec in between.
> I assume it is the laptops ACM driver emitting those, but why? Can these chars be turned off?

It's a program on your laptop probing the device.  Usually modemmanager
or something like that.

greg k-h
