Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF19413BC87
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 10:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbgAOJht (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 04:37:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:38314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729396AbgAOJht (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jan 2020 04:37:49 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7F4D24655;
        Wed, 15 Jan 2020 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579081069;
        bh=e6KJufILmecJ7CsN2+z5/mBYImAiULy/GEraX2lTpBI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d20J6fdicVMmmFJU6Heshm2zlU6rw7sqsThVlmHJZNTPi9ji/84hQkpp3bm0fT9Y4
         bPKyJOuoMws5jAvzVk+4ARn8XyATpYTaBKYH3HWlAdhfOD8GSo6cLyMXzWk7T+yatI
         SM+CsDd4kP2e+RozWZSZLrI3R1B2Yg0DJKO8U4v4=
Date:   Wed, 15 Jan 2020 10:37:46 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: changes for v5.6 merge window
Message-ID: <20200115093746.GA3177342@kroah.com>
References: <878sm96pzf.fsf@kernel.org>
 <20200115092813.GA3153837@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115092813.GA3153837@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 15, 2020 at 10:28:13AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 15, 2020 at 11:14:28AM +0200, Felipe Balbi wrote:
> > 
> > Hi Greg,
> > 
> > here's my pull request for v5.6 merge window. If you want anything to be
> > changed, let me know.
> 
> Did you send this twice?  Any difference?
> 

I did a pull, and get this problem when checking the patches:

Commit: 6a6ae4e8e926 ("usb: gadget: f_ncm: Use atomic_t to track in-flight request")
	Fixes tag: Fixes: 40d133d7f5426 ("usb: gadget: f_ncm: convert to new function interface
	Has these problem(s):
	        - Subject has leading but no trailing parentheses
	        - Subject has leading but no trailing quotes

I'll go fix it up, but that will break your tree if you try to merge as
I will have to rebase :(

thanks,

greg k-h
