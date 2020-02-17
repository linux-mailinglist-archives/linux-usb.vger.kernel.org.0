Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D598A160A4A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 07:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgBQGQt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 01:16:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:35028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725835AbgBQGQt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Feb 2020 01:16:49 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E658206F4;
        Mon, 17 Feb 2020 06:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581920209;
        bh=uML2ZdqPC+F1iTn4HqTaQCoApzpInbFez0tqYy5M3tE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ILDrm7W3A3pIc4nFFJb+t+L6yI2FvBh5hQZPh+DKswUfgx6W2CBPkl8UXJmqGOCas
         fHqBZa4nn4l7KIdQtzoDFwKhpMNRjrLjsMt8Qfu9EHlsjYYUzo58dMCDjBkilSA14L
         wG8DHxEfV8NJnKuaNOfzSL+vqvduvYQRlLU1N4cM=
Date:   Mon, 17 Feb 2020 07:16:45 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alberto Mattea <alberto@mattea.info>
Cc:     linux-usb@vger.kernel.org
Subject: Re: AMD XHCI controller 1022:145c needs the XHCI_SUSPEND_DELAY quirk
 to suspend properly
Message-ID: <20200217061645.GA68641@kroah.com>
References: <11474023.O9o76ZdvQC@alby>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11474023.O9o76ZdvQC@alby>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 17, 2020 at 02:29:54AM +0000, Alberto Mattea wrote:
> Tested with linux 5.6-rc2
> Without the quirk, suspending the system fails with:

Great, can you send a patch for this?

thanks,

greg k-h
