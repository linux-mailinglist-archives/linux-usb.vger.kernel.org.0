Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64C7473E52
	for <lists+linux-usb@lfdr.de>; Tue, 14 Dec 2021 09:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231875AbhLNIjZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Dec 2021 03:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhLNIjZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Dec 2021 03:39:25 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C619FC061574
        for <linux-usb@vger.kernel.org>; Tue, 14 Dec 2021 00:39:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 311C5CE16EC
        for <linux-usb@vger.kernel.org>; Tue, 14 Dec 2021 08:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631F4C34601;
        Tue, 14 Dec 2021 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639471160;
        bh=Pw3O5Pl8/NLfq3bge17kg/3NanAhxBpntB+MfixPbFA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lKGbf8vp1sJ3ASoqop/TVZN9jfIcZ0a+jv9tMLSf0w7PXhZZLpTJ2YdANnp9akMvI
         sBcaUMV4mwvnDHaPra6fRtBlRNwWNSwO0KCLcrwMuEGvtOSQL5BrYvY8S06NSvBmyH
         0yHiAq8WWn0XCqgdlIUc22jOQWXrk7XZ6FKQQx2tqIxQXRlluOrXVJq6Y00pPrticK
         yRcslsQyYvXEptCMoFVKrO/agb3UYFjgwNdYYUtcBEwYYNJAo5+hKKnItdnoDF9tgz
         K9Bw7d5zfQoziSNyCkZAoaFCOWZkr8+SrnJC0KcSZNMFqn6hpeAzc3lB229u0UptP2
         TlMIKGyBbOuSw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mx3LA-000360-Sd; Tue, 14 Dec 2021 09:39:17 +0100
Date:   Tue, 14 Dec 2021 09:39:16 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit FN990 compositions
Message-ID: <YbhYNNTEtqyeTNle@hovoldconsulting.com>
References: <20211210100714.22587-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210100714.22587-1-dnlplm@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 10, 2021 at 11:07:14AM +0100, Daniele Palmas wrote:
> Add the following Telit FN990 compositions:
> 
> 0x1070: tty, adb, rmnet, tty, tty, tty, tty
> 0x1071: tty, adb, mbim, tty, tty, tty, tty
> 0x1072: rndis, tty, adb, tty, tty, tty, tty
> 0x1073: tty, adb, ecm, tty, tty, tty, tty
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Now applied, thanks.

Johan
