Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D181E9747
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2020 13:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgEaLdd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 31 May 2020 07:33:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:37852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgEaLdc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 31 May 2020 07:33:32 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0B12C206F1;
        Sun, 31 May 2020 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590924812;
        bh=e+akwo+RBOP2e3tzHgDVtJcFgmqMhh6T8nkvl3PanG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yZx+YGG8Lrndy71qSLoA2M9PGVYQRB8NNGtOBdlRN6gDQau9C6jMazp+9+7V18DEp
         kYIz4hXdlId9Se+RBqi8vEVzAR4DNaIJTuSav0iaNR3ZvdXUjpL6KKdHVaCy9pON1q
         UPf13iA6VZ9kvndJwKAQCW95/gsJ16LeeM1DdX3U=
Date:   Sun, 31 May 2020 13:33:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rob Gill <rrobgill@protonmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb : Report additional USB classes
Message-ID: <20200531113328.GA1237439@kroah.com>
References: <HyQ2m5d9FYYCYRhIoNhWz4TwwDwKyilFmKmV7GQ9reg-NucmXycuQk2Epf4ef17E3ZrQQTBogxd-tb2KcSbD9XhVsdFGNc6I9kmOvvNWLpw=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HyQ2m5d9FYYCYRhIoNhWz4TwwDwKyilFmKmV7GQ9reg-NucmXycuQk2Epf4ef17E3ZrQQTBogxd-tb2KcSbD9XhVsdFGNc6I9kmOvvNWLpw=@protonmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 31, 2020 at 11:10:55AM +0000, Rob Gill wrote:
> >From 77198692578122b24cf620209cd0fc289287fc8a Mon Sep 17 00:00:00 2001
> From: Rob Gill <rrobgill@protonmail.com>
> Date: Sun, 31 May 2020 20:49:57 +1000
> [PATCH] usb : Report additional USB classes
> 10h (USB Type-C combined audio/video devices), 11h (USB billboard), 12h (USB Type-C bridge). [https://www.usb.org/defined-class-codes]

Odd, why is this all in the body of the email message?

Please use git send-email.

> 
> Signed-off-by: Rob Gill <rrobgill@protonmail.com>

No changelog text?  I can't take patches without that :(

Can you fix this up and resend please?

thanks,

greg k-h
