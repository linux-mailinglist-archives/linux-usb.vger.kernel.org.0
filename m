Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24E9E182C8C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 10:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgCLJfv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 05:35:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:48602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgCLJfu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 05:35:50 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D382A20674;
        Thu, 12 Mar 2020 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584005750;
        bh=4+sD6TNTTCd4ei1rlVsMdcWxo/n/4VNZlHIvX/5z0Rg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dko4QY6m1HzkTCjxIFx+DC9mKxqY80CxKa1z1+9gK3Aj3xbiqshZerpKK0vBpQeCZ
         1ZvJk5dezQFjLLwW3XkQH0WZbG/HTVLMTooC2cTtf5Vd+9Yi5hIbn3nx8ENFOMXRcp
         XX03WrhagMoytLXRlFIDjsmHsdt0dAWcj65IImxA=
Date:   Thu, 12 Mar 2020 10:35:48 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Anthony Mallet <anthony.mallet@laas.fr>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/2] USB: cdc-acm: fix rounding error in TIOCSSERIAL
Message-ID: <20200312093548.GA216768@kroah.com>
References: <20200310101027.32152-1-anthony.mallet@laas.fr>
 <20200310101027.32152-2-anthony.mallet@laas.fr>
 <20200312083827.GA102663@kroah.com>
 <24169.64955.621393.134996@gargle.gargle.HOWL>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24169.64955.621393.134996@gargle.gargle.HOWL>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 12, 2020 at 10:15:39AM +0100, Anthony Mallet wrote:
> On Thursday 12 Mar 2020, at 09:38, Greg KH wrote:
> > This patch doesn't apply to my usb-linus branch at all.  What
> > tree/branch did you make it against?
> 
> This is against master of https://github.com/torvalds/linux.git

Odd.  Can you rebase and resend?

Also, maybe try it against my usb-linus branch of usb.git on
git.kernel.org?

thanks,

greg k-h
