Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A356252A2C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 11:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728439AbgHZJfg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 05:35:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:33802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728344AbgHZJfT (ORCPT <rfc822;Linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 05:35:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1F7D2087D;
        Wed, 26 Aug 2020 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598434519;
        bh=IZWrz3cPYGQ4M4Y/3HM1+4d2/Gy20OYuNIA7c4/HaT4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pe6mtTGS5s68tKMkuTEVEXaoauMBWW02LBUNne8/PBqJm8m1uejctFT/MRgWppQQU
         htKeiZPqIjzQxmrcxGsHJXTFDKRhlNDwJtgy5ivid91KClNVcolf3ObdeyniRrlpOq
         hx8sYApO2J8byQdUEeVMR3ZkVuyPtG+bUaDsW7rk=
Date:   Wed, 26 Aug 2020 11:35:34 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     GARG Shivam <shivam.garg@thalesgroup.com>
Cc:     Peter Chen <hzpeterchen@gmail.com>,
        "Linux-usb@vger.kernel.org" <Linux-usb@vger.kernel.org>
Subject: Re: Linux Crash with Gadget serial driver
Message-ID: <20200826093534.GA2474406@kroah.com>
References: <MRXP264MB0904FFAD5E50E6A6F4AB6419F8570@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <CAL411-oBThK1PqKWhbdUSEsCuApi6CWT5wzxye6P6RXsQuXhfg@mail.gmail.com>
 <MRXP264MB09048712EAB615DD8CF7AF5BF8540@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MRXP264MB09048712EAB615DD8CF7AF5BF8540@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 26, 2020 at 09:09:32AM +0000, GARG Shivam wrote:
> I am with Kernel version 4.1.

4.1 is over 6 years old and over 500 thousand changes and fixes behind
what we are all working with now.

Please work with your vendor who is forcing you to remain on an obsolete
kernel version like this, as you are paying them for that type of
support, there is nothing that we can do here with this, sorry.

good luck!

greg k-h
