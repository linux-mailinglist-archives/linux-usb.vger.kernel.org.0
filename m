Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3C9D1739EA
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2020 15:35:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgB1Ody (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Feb 2020 09:33:54 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:34415 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726738AbgB1Ody (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Feb 2020 09:33:54 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id C6DFE2208A;
        Fri, 28 Feb 2020 09:33:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 28 Feb 2020 09:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=B
        IVnEtSa6sK7vH65QEc0yJyDJeovhoLx0ggTKWRA6PQ=; b=fdYXHUvyKKAVaczLn
        bNng6sZk76UtK6QR349uEA5TVoD5l2cQwDlWpn4zWsNnE9oHmDwIlY+6uFGADC7N
        lQgoAZdsua+dzU+G45JzTaMe6CZ5VrhWzldSzn4hLE9Q6Cx8CmjYR4dODlqKwQYK
        2m8M1S6jHw3yH9pNTL9BgO6giF4DLrUryih1Nn6R70pUfkCG9iDCbXURfvmjY9UW
        qC2xFAVdEOfWSh71VvamlSXIw7VWEDq3zWJbz//j45JtnLmlSZ6ebVQwOT7VisnQ
        ntooK0xxCNdhUdbpYwYutxYBRxt2fygXVd+Rvdt3fqjzn2DcGhKInYiUx5u4hVd7
        uCWAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=BIVnEtSa6sK7vH65QEc0yJyDJeovhoLx0ggTKWRA6
        PQ=; b=zgbhnS6tH/3Pyf6xKzg6Pb6Y79k1/YYu1gLrMcR/r9e136EqrRk5x7U+7
        Z9AfvPkgD3VrhzAjEWPw3YS5x3B9Dd1TRJuP8HiIzobdX/flvXVcZxoTNFfkxRQD
        S8bUfycRkHVxlUlcBrxLuzm0XzjsZffA5nymU0vupMIkyaPCOdCTdeoustog8oSa
        OSIs5rjDtd8uMtaAf+PEvN32tZdHpJDypdWZ5xIMMxODb9fvMpoLXDgy/Ua5d9Jx
        R1bhZsCiCasmEWdccwIkO01hgWpY2cgpu9aUYIg8yOvcHbFklMPVm6yoapAIfaiv
        8+E/IV+1RmG4gN21dts3Lzt3MhwHQ==
X-ME-Sender: <xms:0CRZXsPr2TXKffAOTUtbYZqpZxKYMJTUL6iLmo7QSUsaqeIxoelpfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleekgdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:0CRZXqa8ya4AoRfVxJCkxFplR1pnS57DtK0akf8myERaxdmYSZWx7w>
    <xmx:0CRZXlPrudvtJ7vBFsNuqDNxMPNG52zKHqYaeCaLps2tHYLZ05g3Qg>
    <xmx:0CRZXrXuO5vcpgBvHc8hwsShCEYwVLtW5_EKpewnG74HPAWZKNr2lw>
    <xmx:0CRZXkkGYnhccBBFxwPFl5MkJ5Ydxe90bbUpZOn7jAnpEmx_PcTAlw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6354D328005A;
        Fri, 28 Feb 2020 09:33:52 -0500 (EST)
Date:   Fri, 28 Feb 2020 15:33:50 +0100
From:   Greg KH <greg@kroah.com>
To:     Igor Filippov <igorf777@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: driver
Message-ID: <20200228143350.GA3054483@kroah.com>
References: <20f1edf4-f589-2b04-8353-d02bb87d251a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20f1edf4-f589-2b04-8353-d02bb87d251a@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 28, 2020 at 05:26:30PM +0300, Igor Filippov wrote:
> Hello!
> 
> I use the USB2CAN converter i-7565H1 (from ICP CON) and the driver
> installation script from the delivery kit (in the attachment).
> 
> And the dmesg comand output is:
> 
> [  489.495739] usbcore: registered new interface driver usbserial_generic
> [  489.495747] usbserial: USB Serial support registered for generic
> [  489.590087] usbserial_generic 3-3:1.0: The "generic" usb-serial driver is
> only for testing and one-off prototypes.
> [  489.590088] usbserial_generic 3-3:1.0: Tell linux-usb@vger.kernel.org to
> add your device to a proper driver.
> [  489.590090] usbserial_generic 3-3:1.0: device has no bulk endpoints
> [  489.590106] usbserial_generic 3-3:1.1: The "generic" usb-serial driver is
> only for testing and one-off prototypes.
> [  489.590107] usbserial_generic 3-3:1.1: Tell linux-usb@vger.kernel.org to
> add your device to a proper driver.
> [  489.590108] usbserial_generic 3-3:1.1: generic converter detected
> [  489.590208] usb 3-3: generic converter now attached to ttyUSB0
> 
> Can you solve this problem? Thank You.
> 


Can you provide the output of 'lsusb -v' from the command line with the
device plugged in?

thanks,

greg k-h
