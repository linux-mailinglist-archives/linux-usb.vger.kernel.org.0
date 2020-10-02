Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A124280FC9
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 11:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgJBJXm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 05:23:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:47008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbgJBJXm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Oct 2020 05:23:42 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A0AA206FA;
        Fri,  2 Oct 2020 09:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601630622;
        bh=s022QeoNKQo8Qg5s/g7vI/6I3AMh6rqPCgmwYN9uwIs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JcamrhURJjELQ+nMTdNcW/VXROV0AL2hh6DSQr8EKIRfIl+7WdXq0cEIlSThjixIH
         Akpn7X5MGPfyCSJLOnvMUZ+cn1biJ6uG2GOCdJY/yj94OJqsWrQAIQcOIk48SrTur+
         ju0/O/G7tImv94aNnF4OfdstdbTh7oeavW5eVNkQ=
Date:   Fri, 2 Oct 2020 11:22:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     keithp@keithp.com, linux-usb@vger.kernel.org
Subject: Re: [RFT] implementation of O_NONBLOCK for chaoskey
Message-ID: <20201002092249.GA1934427@kroah.com>
References: <20200921113732.11524-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921113732.11524-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 21, 2020 at 01:37:28PM +0200, Oliver Neukum wrote:
> This should implement O_NONBLOCK for chaoskey devices, but I need
> a tester.
> 

I have one of these somewhere, what type of testing is needed?

thanks,

greg k-h
