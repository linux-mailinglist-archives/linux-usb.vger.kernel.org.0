Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091C7161690
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 16:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729452AbgBQPpm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 10:45:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:48732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727553AbgBQPpm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Feb 2020 10:45:42 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5206422B48;
        Mon, 17 Feb 2020 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581954341;
        bh=XBKqJFlnK+hwA8EBW9oHavc3Dnpyz2uxRM9vAwRyATI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2ZkK98lHx0sA4S+YpoNljQIlkATgvQztGcSwSdsDgZkbv8KlwX96P6p3O0gTdUJEe
         9b2cD2HOR7WiKll0dpwo3+t5EFL7wAQudMHYt+XVc9jXb8M/JBzWsSTuiaD3j7IBB4
         uVb1EKmSy1sknebRZXdMGsf/H9DFInQlCiz6XaaI=
Date:   Mon, 17 Feb 2020 16:45:38 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alberto Mattea <alberto@mattea.info>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: apply XHCI_SUSPEND_DELAY to AMD XHCI
 controller 1022:145c
Message-ID: <20200217154538.GA1457504@kroah.com>
References: <5340061.DvuYhMxLoT@alby>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5340061.DvuYhMxLoT@alby>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 17, 2020 at 04:21:50PM +0100, Alberto Mattea wrote:
> Fixes suspend/resume

We are going to need a lot more information here, sorry.  Please be
explicit as to what you are doing and why.

thanks,

greg k-h
